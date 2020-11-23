Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 083E92C0CBA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Nov 2020 15:14:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730224AbgKWOE0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Nov 2020 09:04:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729293AbgKWOE0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Nov 2020 09:04:26 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0D6AC0613CF
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2020 06:04:25 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id a3so17350106wmb.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2020 06:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=NI5nyGOY3ERNyQJVul1TRTO9hhACB1gWUuV76MrEk5M=;
        b=dgYlI6LDqRVM7KThWpJ5+FLYQtBo6nuDZ7T8auGd3GHIhUqr4aNt6fZD3EA8sDfYf7
         AV40fMfieMVo4HuusMAvw1inz+JrVX1eImql0wxwEMcp14i3hp/zZseb8kemlbTFZY3o
         7Wc7caAus4zxyyaTtBmwq0DEnzQevquZ3mubraogrjQAnanKHG4sLlwvm2eZSiCxfrMU
         EIJmL0/7O7ZkOcCmBCALW2/VRMSV1Rfjf8JYGW1EGA+uocIVDpDDXPX4qQGV2B78P+rZ
         p7+AXV6rhqx6hKq9r00uu2IsfIDgOg95i2hJa9e85JP5MlkDP0L3pUEYwpC5Th1y2Bqf
         FfXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=NI5nyGOY3ERNyQJVul1TRTO9hhACB1gWUuV76MrEk5M=;
        b=Zrkg5E4MuAD+TDaIWhAvzmGY87NZJGiOaopEo24liHURPuu1wyIrWwBeLQkYcZ1c8t
         qBgm8r09RGJmRb39AA0Ek/gU26KyZsOtL/Jj88SfgiXF9j3LsC/2Jb7BIEx0FJJ6p/av
         ly3JbAxe7usg5CwtolPHoXk2xWK4Vqms3Y0erEoL2akONf5l+9nPirzkhf+TTnXkgn7R
         dRtjD5oTVozjoBDZSk99KU7S3vbR8sAALPlEL/nrjB6qDyQc6I4SEEsqSoJA1EywmB4C
         uIN4DY0zQHXqpXDirSkZqZIlGCOgloQxGhC1TZcpMFcQwcvDyFGaejPQjXexlN3RVBR1
         FNXQ==
X-Gm-Message-State: AOAM531NQRNx6hEuYFom/KdajGS26peT598+z3ahR7MgGyKqyar7xiBO
        9faQT1geliuABpBlKjl0I5pxN6an9SDV/ceg86I=
X-Google-Smtp-Source: ABdhPJxBVfXQ2g/OcfpC7PaWnINBheh7UFrDS8nx++8hHDijl9WIvux0NXyRxE5ad0DuSvHNStETAw==
X-Received: by 2002:a7b:ce0e:: with SMTP id m14mr25154011wmc.17.1606140264658;
        Mon, 23 Nov 2020 06:04:24 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:490:8730:f5cd:e791:e88b:e3b7])
        by smtp.gmail.com with ESMTPSA id m9sm7102727wrx.59.2020.11.23.06.04.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Nov 2020 06:04:23 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v2 2/8] mhi: pci-generic: Perform hard reset on remove
Date:   Mon, 23 Nov 2020 15:11:00 +0100
Message-Id: <1606140666-4986-3-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606140666-4986-1-git-send-email-loic.poulain@linaro.org>
References: <1606140666-4986-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Ensure that the device is hard-reset on remove to restore its initial
state and avoid further issues on subsequent probe.

This has been tested with Telit FN980m module.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 drivers/bus/mhi/pci_generic.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index 13a7e4f..09c6b26 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -15,6 +15,8 @@
 
 #define MHI_PCI_DEFAULT_BAR_NUM 0
 
+#define DEV_RESET_REG (0xB0)
+
 /**
  * struct mhi_pci_dev_info - MHI PCI device specific information
  * @config: MHI controller configuration
@@ -166,6 +168,11 @@ static void mhi_pci_status_cb(struct mhi_controller *mhi_cntrl,
 	/* Nothing to do for now */
 }
 
+static inline void mhi_pci_reset(struct mhi_controller *mhi_cntrl)
+{
+	writel(1, mhi_cntrl->regs + DEV_RESET_REG);
+}
+
 static int mhi_pci_claim(struct mhi_controller *mhi_cntrl,
 			 unsigned int bar_num, u64 dma_mask)
 {
@@ -329,6 +336,10 @@ static void mhi_pci_remove(struct pci_dev *pdev)
 	mhi_power_down(mhi_cntrl, true);
 	mhi_unprepare_after_power_down(mhi_cntrl);
 	mhi_unregister_controller(mhi_cntrl);
+
+	/* MHI-layer reset could not be enough, always hard-reset the device */
+	mhi_pci_reset(mhi_cntrl);
+
 	mhi_free_controller(mhi_cntrl);
 }
 
-- 
2.7.4

