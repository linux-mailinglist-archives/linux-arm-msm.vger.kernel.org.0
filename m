Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F5713C5DD7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jul 2021 15:57:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234884AbhGLOAK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Jul 2021 10:00:10 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.84]:8120 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232301AbhGLOAK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Jul 2021 10:00:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1626098239;
    s=strato-dkim-0002; d=gerhold.net;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=Hvm57jD3SMunRJ2CL5iehguoVSxmK8zNzTpCs6EDdd4=;
    b=Wm2zrQbLuZi0FegrgxF5koCs/RG06yNkGwX5VJPq23pLscWL8nUWMfLLuRwYJVyGk4
    WLNm92UYrWl8Q2xEJI+Y413MrDXBQgtoHpGcwSHbEkXVWp0r9xgG4zHKrcvTWb4pK8Tp
    nq06Zd3Xbp79deRRF+d3Xtd9pkX8cbViiHQbN8hRj8vevHqjl0r28s/U7YIfBfNxajd7
    1CkaeAeXMe/qJKP2CDXTS6/F5wV+LturpQhn2KGUarjiThrYvplqTv3EmEeIflO6hgyR
    Kbyb2CUUqpCkV+nftILP94vcVbcFPhN+aISWZaXkVVVxDGvKGV/AofKQWfAJN1XjNc61
    B/7A==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB426L3OY="
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.28.1 DYNA|AUTH)
    with ESMTPSA id Y070ccx6CDvJ9yH
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Mon, 12 Jul 2021 15:57:19 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 2/2] soc: qcom: smsm: Fix missed interrupts if state changes while masked
Date:   Mon, 12 Jul 2021 15:57:03 +0200
Message-Id: <20210712135703.324748-2-stephan@gerhold.net>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210712135703.324748-1-stephan@gerhold.net>
References: <20210712135703.324748-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The SMSM driver detects interrupt edges by tracking the last state
it has seen (and has triggered the interrupt handler for). This works
fine, but only if the interrupt does not change state while masked.

For example, if an interrupt is unmasked while the state is HIGH,
the stored last_value for that interrupt might still be LOW. Then,
when the remote processor triggers smsm_intr() we assume that nothing
has changed, even though the state might have changed from HIGH to LOW.

Attempt to fix this by checking the current remote state before
unmasking an IRQ. Use atomic operations to avoid the interrupt handler
from interfering with the unmask function.

This fixes modem crashes in some edge cases with the BAM-DMUX driver.
Specifically, the BAM-DMUX interrupt handler is not called for the
HIGH -> LOW smsm state transition if the BAM-DMUX driver is loaded
(and therefore unmasks the interrupt) after the modem was already started:

qcom-q6v5-mss 4080000.remoteproc: fatal error received: a2_task.c:3188:
  Assert FALSE failed: A2 DL PER deadlock timer expired waiting for Apps ACK

Fixes: c97c4090ff72 ("soc: qcom: smsm: Add driver for Qualcomm SMSM")
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 drivers/soc/qcom/smsm.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/qcom/smsm.c b/drivers/soc/qcom/smsm.c
index a48f9db98836..ef15d014c03a 100644
--- a/drivers/soc/qcom/smsm.c
+++ b/drivers/soc/qcom/smsm.c
@@ -109,7 +109,7 @@ struct smsm_entry {
 	DECLARE_BITMAP(irq_enabled, 32);
 	DECLARE_BITMAP(irq_rising, 32);
 	DECLARE_BITMAP(irq_falling, 32);
-	u32 last_value;
+	unsigned long last_value;
 
 	u32 *remote_state;
 	u32 *subscription;
@@ -204,8 +204,7 @@ static irqreturn_t smsm_intr(int irq, void *data)
 	u32 val;
 
 	val = readl(entry->remote_state);
-	changed = val ^ entry->last_value;
-	entry->last_value = val;
+	changed = val ^ xchg(&entry->last_value, val);
 
 	for_each_set_bit(i, entry->irq_enabled, 32) {
 		if (!(changed & BIT(i)))
@@ -264,6 +263,12 @@ static void smsm_unmask_irq(struct irq_data *irqd)
 	struct qcom_smsm *smsm = entry->smsm;
 	u32 val;
 
+	/* Make sure our last cached state is up-to-date */
+	if (readl(entry->remote_state) & BIT(irq))
+		set_bit(irq, &entry->last_value);
+	else
+		clear_bit(irq, &entry->last_value);
+
 	set_bit(irq, entry->irq_enabled);
 
 	if (entry->subscription) {
-- 
2.32.0

