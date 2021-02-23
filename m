Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE104322E1C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Feb 2021 16:57:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233340AbhBWP45 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Feb 2021 10:56:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233337AbhBWP44 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Feb 2021 10:56:56 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B4ADC061786
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Feb 2021 07:56:15 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id d11so3721648wrj.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Feb 2021 07:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=//rt/M70j3jQ0XXbJLkHEDOOKq9aa9JjvYDmRKX2cJM=;
        b=IyGSJbVxcpZ/+Y2Vqpv1wZwQBAyijJA+XbVgrY0PZdEb7CuU3J5NZP8K6rS+9l873b
         NCS/5Wcq2UP/tj3M1zKEFuWysaoNnEVriH8IxMJl0rzuBhqk4JPYcUKRP3DqrwlgOEB0
         hOn9F4dBvFdByCef9Hb+K4qJ6qu66AWrEGPfwen8U12/GUEap31cnGiJgmPrr5WSaFze
         XBHqZivY0hDWxsAYRYgmPwP18LWcCc3IUm/AtQxKuOqCX1c+03x3dbklKifkElZTlMjh
         IjOLqx5V824TxcdSz2p0ByOWncv6ZutsqV/ItAjdtVyPVbYOMOWHK4o9lfNg8OzE9HyO
         Vmzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=//rt/M70j3jQ0XXbJLkHEDOOKq9aa9JjvYDmRKX2cJM=;
        b=AkmbvgKNOSse9DPpoUOd+ESUT5KRXESdnVo3KoeQCU22v5fcJSYxStl+edvhtrs6tF
         FRIYReVkUQVp6KD7W0a35Q7oMnaic6ZXYDB4r20AMantlDztoLRTxN5TSak9BVYLdv3n
         me4ktEAMrAD2z/rW+6S8e7v80pw2h9OoXWpG2k7Tm8gfI62lvqApJfQplRPjc23oPTzs
         FJcFsjp9a8/L8+Ql/7y1IEIZYFvKWLFQ7AIxG0ozttqG2MIntNCdNS3LUmE3niD3Rbcz
         +mWQ6z7qXgAS3BFYN0ZZc00Gj2XCeMfutlFrcuOqoVoeiHu+z5Tyt7i6ENTl+cwgf7c8
         DtAQ==
X-Gm-Message-State: AOAM530661WTl3nUS+Tx9uu6U3RBIu5P1niq2uLWvrewIdDyzsyS+8E8
        6pL4n4bh2Vk7AxmVm+0PVVv10w==
X-Google-Smtp-Source: ABdhPJyCMwIWlDnlEG917hEDHwIID/726CbmJbIpRE4m9sXgNSezoQU8P5dT3uRfC96sqNZeIUopqg==
X-Received: by 2002:adf:f70a:: with SMTP id r10mr14757591wrp.61.1614095774061;
        Tue, 23 Feb 2021 07:56:14 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:82c:5f0:80e4:8084:68e5:90f])
        by smtp.gmail.com with ESMTPSA id q25sm2962351wmq.15.2021.02.23.07.56.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Feb 2021 07:56:13 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, carl.yin@quectel.com,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH] mhi: pci_generic: No-Op for device_wake operations
Date:   Tue, 23 Feb 2021 17:04:16 +0100
Message-Id: <1614096256-29744-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The wake_db register presence is highly speculative and can fuze MHI
devices. Indeed, currently the wake_db register address is defined at
entry 127 of the 'Channel doorbell array', thus writing to this address
is equivalent to ringing the doorbell for channel 127, causing trouble
with some device that get an unexpected channel 127 doorbell interrupt.

This change fixes that issue by setting wake get/put as no-op for
pci_generic devices. The wake device sideband mechanism seems really
specific to each device, and is AFAIK no defined by the MHI spec.

It also removes zeroing initialization of wake_db register during MMIO
initialization, the register being set via wake_get/put accessors few
cycles later during M0 transition.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 drivers/bus/mhi/pci_generic.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index 4fc543c..d4e8c9c 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -347,6 +347,21 @@ static void mhi_pci_status_cb(struct mhi_controller *mhi_cntrl,
 	}
 }
 
+static void mhi_pci_wake_get_nop(struct mhi_controller *mhi_cntrl, bool force)
+{
+	/* no-op */
+}
+
+static void mhi_pci_wake_put_nop(struct mhi_controller *mhi_cntrl, bool override)
+{
+	/* no-op */
+}
+
+static void mhi_pci_wake_toggle_nop(struct mhi_controller *mhi_cntrl)
+{
+	/* no-op */
+}
+
 static bool mhi_pci_is_alive(struct mhi_controller *mhi_cntrl)
 {
 	struct pci_dev *pdev = to_pci_dev(mhi_cntrl->cntrl_dev);
@@ -550,6 +565,9 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	mhi_cntrl->status_cb = mhi_pci_status_cb;
 	mhi_cntrl->runtime_get = mhi_pci_runtime_get;
 	mhi_cntrl->runtime_put = mhi_pci_runtime_put;
+	mhi_cntrl->wake_get = mhi_pci_wake_get_nop;
+	mhi_cntrl->wake_put = mhi_pci_wake_put_nop;
+	mhi_cntrl->wake_toggle = mhi_pci_wake_toggle_nop;
 
 	err = mhi_pci_claim(mhi_cntrl, info->bar_num, DMA_BIT_MASK(info->dma_data_width));
 	if (err)
-- 
2.7.4

