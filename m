Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49F543106A9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Feb 2021 09:29:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229500AbhBEI3f (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Feb 2021 03:29:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbhBEI3e (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Feb 2021 03:29:34 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EC71C061786
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Feb 2021 00:28:54 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id m1so5211452wml.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Feb 2021 00:28:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=AUS6ylYDJAhalQaZaTmsrQgEgh6MU0lyhG55eitLPv8=;
        b=ZoHjoxPbC7q3PWM06UK9d/5P6YF9hQyWTk6X6e8jARz6qR3ADAGdyuki4Q/rdMtAJa
         mtePJEO7Z94Mh1NcgyOp0wJU5M7urJ6aEY+Y/uDv1jeOoBAZNQtr8UfICHlf2Faxhw1H
         9T/MXPXFEXuG2ig7Pu+K6B2VPD4kVfztiwMigUqsL6J9burDUKdXWozDbSLDEKZ4Wvqv
         DsgpQafATQ8DvCk4EAdjBTfKbbSPXXh09N5qspyw3US0T8wpeBv75xIHZpZaFVL3/vrC
         VbI0dBnZ/QPnQo9BD9vb95zLKGtRDDTRYA8NW127+CJGLykz2dZfpJ3AjbQOLyXZn4ln
         mEPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=AUS6ylYDJAhalQaZaTmsrQgEgh6MU0lyhG55eitLPv8=;
        b=s2DxhO7s6dVp3bpW3eIS6pMw/gHfhVtV7Mltb/NlltHJDBiE1FnIqZo+2UfYl+PGAB
         8srw9pH6gYvtWUWZBJMMSbC1mbaX8wnGUXxFIRtQprTLiQ8jlJVCljWmAonu1TMCL0AU
         tgh3KHP2UXAkCjTtCAhdz2kI+N5pcaz7wHKmhxEoASO5WELU47t1tuX77nFDxFlP9W/H
         ujU1E8l5lQxn63+zpAuW43EHWwbGJ7v0Co6VVldJggAxiYiMGmCO3Axu2eZjVOGTZAZb
         W+v33km+KEWDVJHB56klQ7xBenJG303tMe6nPnkIacHzUVPtEEEZMLdlXD+NwKHn5ac7
         BlCQ==
X-Gm-Message-State: AOAM532awfpf/qJCxkB5IEslezIwPsmHW60TR9oFhGsnL3ge57CWGGJP
        /LokX5pitcys1IzsGr2eEd8Pug==
X-Google-Smtp-Source: ABdhPJwHq1/EyK3oMUkOv+ugrptsDaj5wXMwOX6EJrt9CKcuzHWkje/iafaQS0RI9BMVZ6zJDvl+Sw==
X-Received: by 2002:a1c:5412:: with SMTP id i18mr2496199wmb.152.1612513732729;
        Fri, 05 Feb 2021 00:28:52 -0800 (PST)
Received: from localhost.localdomain ([88.122.66.28])
        by smtp.gmail.com with ESMTPSA id r11sm8517054wmh.9.2021.02.05.00.28.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Feb 2021 00:28:52 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH] bus: mhi: pci_generic: Increase num of elements in hw event ring
Date:   Fri,  5 Feb 2021 09:36:35 +0100
Message-Id: <1612514195-8257-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We met some sporadic modem crashes during high throughput testing, this
has been root caused to a lack of elements in the event ring. Indeed,
the modem is simply crashing when event ring becomes empty.

It appears that the total number event ring elements is too low given
the performances of the modem (IPA hardware accelerator). This change
increases the number of elements in the hardware event ring to 2048,
which is aligned with what is defined in downstream version:
https://source.codeaurora.org/quic/la/kernel/msm-4.14/tree/arch/arm64/boot/dts/qcom/sm8150-mhi.dtsi?h=msm-4.14#n482

With this change, modem coes not crash anymore.

Note: An event ring element is 16-Byte, so the total memory usage of
a hardware event ring is now 32KB.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 drivers/bus/mhi/pci_generic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index 5b3a23a4..c20f59e 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -129,7 +129,7 @@ struct mhi_pci_dev_info {
 
 #define MHI_EVENT_CONFIG_HW_DATA(ev_ring, ch_num) \
 	{					\
-		.num_elements = 256,		\
+		.num_elements = 2048,		\
 		.irq_moderation_ms = 1,		\
 		.irq = (ev_ring) + 1,		\
 		.priority = 1,			\
-- 
2.7.4

