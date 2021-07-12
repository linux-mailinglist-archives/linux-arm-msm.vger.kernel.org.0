Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B3A13C5DD6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jul 2021 15:57:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233480AbhGLOAK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Jul 2021 10:00:10 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.82]:17253 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234880AbhGLOAK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Jul 2021 10:00:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1626098239;
    s=strato-dkim-0002; d=gerhold.net;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=ZE8/OqPTYjDlyr1pAiX09V9WLDh2Hyw7NU8Et0AL0Cc=;
    b=PxSl34kVocJqXszDlpAvTxLeQVvVP4zUSLa5PIm6hEYL0kxc4VncNWzIEDg5MLBPEs
    IXeI7Fd0WjExnKbp5cn+RK3BXPvYaTRbAu0YblGv0QWS/GKseGTxlyl2Zkzq+h+8psZ3
    w2wJ9Y27xLajFF8tMKrZ+yngVJAHOOHNjJ8gvlQ6EtVnRSpEwdexe4l30KZKP5rBxrQS
    GW9HURzAvMeAzhJ3PIKK8U4jd46KmydOjn6SFYZm9Kf0atbzkdS7mmSifpKLgvkupLU6
    JaLzQwaMvFfVKPgMFXsxACie5UJF5pE9/FIBxBvnqof4m/R24//9qN5BDt5Azy/Ef2Cb
    76og==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB426L3OY="
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.28.1 DYNA|AUTH)
    with ESMTPSA id Y070ccx6CDvJ9yG
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Mon, 12 Jul 2021 15:57:19 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 1/2] soc: qcom: smsm: Implement support for get_irqchip_state
Date:   Mon, 12 Jul 2021 15:57:02 +0200
Message-Id: <20210712135703.324748-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

At the moment there is no way for drivers to get the current state
of the interrupt signal reported by a remote processor. The irqchip
API has generic functionality for this, using irq_get_irqchip_state().

Implement support for getting the IRQCHIP_STATE_LINE_LEVEL by reading
the remote state and checking the bit for the specified IRQ.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 drivers/soc/qcom/smsm.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/soc/qcom/smsm.c b/drivers/soc/qcom/smsm.c
index 1d3d5e3ec2b0..a48f9db98836 100644
--- a/drivers/soc/qcom/smsm.c
+++ b/drivers/soc/qcom/smsm.c
@@ -299,11 +299,28 @@ static int smsm_set_irq_type(struct irq_data *irqd, unsigned int type)
 	return 0;
 }
 
+static int smsm_get_irqchip_state(struct irq_data *irqd,
+				  enum irqchip_irq_state which, bool *state)
+{
+	struct smsm_entry *entry = irq_data_get_irq_chip_data(irqd);
+	irq_hw_number_t irq = irqd_to_hwirq(irqd);
+	u32 val;
+
+	if (which != IRQCHIP_STATE_LINE_LEVEL)
+		return -EINVAL;
+
+	val = readl(entry->remote_state);
+	*state = !!(val & BIT(irq));
+
+	return 0;
+}
+
 static struct irq_chip smsm_irq_chip = {
 	.name           = "smsm",
 	.irq_mask       = smsm_mask_irq,
 	.irq_unmask     = smsm_unmask_irq,
 	.irq_set_type	= smsm_set_irq_type,
+	.irq_get_irqchip_state = smsm_get_irqchip_state,
 };
 
 /**
-- 
2.32.0

