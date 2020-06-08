Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 060A81F21A9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2020 23:57:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726734AbgFHV55 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Jun 2020 17:57:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726723AbgFHV55 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Jun 2020 17:57:57 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECDCDC08C5C3
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2020 14:57:56 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id t7so9376423pgt.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2020 14:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SWZL+kux4yDhzDGbd5a35TWK1xHZ00dTohAmVgLX3eM=;
        b=KtRvm0FMKtiPbVuxwAkIVonwCkmmc+hCJFa+v5OdiA9+Kd85RX7E7Dz4su1hEFMAfC
         N0A+cMW+t6t/S1vbd1lbon+NR+2axYhEMd2KilR+OoBHlQQH6TGZAh4S69qP7stRdrmy
         z+5F/p1OZ19QuZpRriO3Zf8y1YXiv8zZ27CUU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SWZL+kux4yDhzDGbd5a35TWK1xHZ00dTohAmVgLX3eM=;
        b=cvx+gonEvw2ERPTAKwfTMSZPRZBTNVTRXfVnuqKFQF3s/Wb3PM2iZLfGysrqoFU7No
         USJ7llMDlUMDUAh/wFi9Lc+p/ZuARmVWQPuwjO04jcK9DDAbRLJVKkZlXDw3/lkEOZeX
         syjxNMyzriuXM0CNRj5LOKeZjWc3fKGSuLzIg3rLQYPMqTkJTBOnYExprSje5TKb3Qt+
         B0QBywFHS0YVZQROQoYBRWQ1K5KEchCqda3M8fbQ+n/8yIw93uP1Ekkl756GQzlLgcOA
         QeR3vbM5jk1DlR+5Cp1yoRze0rhTFYDFKj9h2gnE/dUUbUsC3xEsQCB/ArCDNRwiyAhy
         qA8Q==
X-Gm-Message-State: AOAM531iC9T8TbcoODwUBCMcAzdENY6XZBe/IXaBnc+KRT3kj1e9QFE7
        gPHxkJYvcHWsg10mY9rsYKL15w==
X-Google-Smtp-Source: ABdhPJw6qZECPnALxq8UhkvnYK5Ca+cc/l8hvamnwz7rk8VPhvUR8wajVlUTDW7w+FRS6bxZf8gmiQ==
X-Received: by 2002:a62:154f:: with SMTP id 76mr23212427pfv.322.1591653476006;
        Mon, 08 Jun 2020 14:57:56 -0700 (PDT)
Received: from evgreen-glaptop.cheshire.ch ([2601:646:c780:1404:1c5a:73fa:6d5a:5a3c])
        by smtp.gmail.com with ESMTPSA id p190sm8170178pfp.207.2020.06.08.14.57.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 08 Jun 2020 14:57:55 -0700 (PDT)
From:   Evan Green <evgreen@chromium.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Markus Elfring <elfring@users.sourceforge.net>,
        Evan Green <evgreen@chromium.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] soc: qcom: smp2p: Safely acquire spinlock without IRQs
Date:   Mon,  8 Jun 2020 14:57:36 -0700
Message-Id: <20200608145653.1.Ideabf6dcdfc577cf39ce3d95b0e4aa1ac8b38f0c@changeid>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

smp2p_update_bits() should disable interrupts when it acquires its
spinlock. This is important because without the _irqsave, a priority
inversion can occur.

This function is called both with interrupts enabled in
qcom_q6v5_request_stop(), and with interrupts disabled in
ipa_smp2p_panic_notifier(). IRQ handling of spinlocks should be
consistent to avoid the panic notifier deadlocking because it's
sitting on the thread that's already got the lock via _request_stop().

Found via lockdep.

Fixes: 50e99641413e7 ("soc: qcom: smp2p: Qualcomm Shared Memory Point to Point")
Signed-off-by: Evan Green <evgreen@chromium.org>
---

 drivers/soc/qcom/smp2p.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
index 07183d731d747..a9709aae54abb 100644
--- a/drivers/soc/qcom/smp2p.c
+++ b/drivers/soc/qcom/smp2p.c
@@ -318,15 +318,16 @@ static int qcom_smp2p_inbound_entry(struct qcom_smp2p *smp2p,
 static int smp2p_update_bits(void *data, u32 mask, u32 value)
 {
 	struct smp2p_entry *entry = data;
+	unsigned long flags;
 	u32 orig;
 	u32 val;
 
-	spin_lock(&entry->lock);
+	spin_lock_irqsave(&entry->lock, flags);
 	val = orig = readl(entry->value);
 	val &= ~mask;
 	val |= value;
 	writel(val, entry->value);
-	spin_unlock(&entry->lock);
+	spin_unlock_irqrestore(&entry->lock, flags);
 
 	if (val != orig)
 		qcom_smp2p_kick(entry->smp2p);
-- 
2.24.1

