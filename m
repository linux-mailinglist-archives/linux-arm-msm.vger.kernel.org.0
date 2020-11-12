Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0B8F2B0324
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Nov 2020 11:51:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727905AbgKLKvp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Nov 2020 05:51:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727884AbgKLKvp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Nov 2020 05:51:45 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C45F1C0613D4
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2020 02:51:44 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id 23so5478059wrc.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2020 02:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FaiSQA15MIbTKd3si8WMQOsXJC1onbTCZ7T3J5Q6PJs=;
        b=Ic6zmTPhniTaWPReO7ebSJWMMO0L4x8eQOL6qyt5hP9WU/FWqa1zmaqHNS6qX9aucP
         QxHnwgbok6KJGXlsNqmEc3vWrdowfwty5PePcXpJPwhRYP4cr19QtEON5HEY4wk2qrTq
         IG3+1l7FysyatmxP2XgL/Z8TkjgWOXne2MtHPKJiOT7q3GuWwa0TovUBKDd6Jrg/Jyng
         ouUh4dS4m4YZMXdDyZrE1Dg5J99GkgHCDfgpjoimVXxOS5DXIDxm1chLALR9F/V4R29U
         VFroffSIpqYKirGP4YOL4NzWqcN7cZJfcYgNs2ZeSCtn5P6fvl26B06VvqOEHoxEJKMb
         elow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FaiSQA15MIbTKd3si8WMQOsXJC1onbTCZ7T3J5Q6PJs=;
        b=lzqG9ub8mHAz85HvTEnYUCIzZrETiw7gJn0CVCiWdNN9VIrwxkTGZpoWPc5pXFdNST
         NprAgXRBLKmyrrdCo+tvg43IQdjRWM/MgQRDm1ZbP1ZVHISgogaiMTA85mpbCkn85FxV
         nkPwPJNgRdFGWsmUSjDvAAeu9Y9JMiSIBQ0rBE3JexGuYDtQJaCiyppQ0Brhl0xcouHF
         RSRYeufKBd5EBS6iSMkrHvO64+RAvYuqkzEL42KX3H/FKrA3izSrZNqjmzuIlu1xEt9N
         007AnuWVNbHDv48AQDfB29tGiRQOjPiyxjKZnRt05tx1NkK7Net83Rvqj3Q7KYV5xfpu
         flBw==
X-Gm-Message-State: AOAM533itKGROoFljXhYpMICye5bRlf2EZCo1Vw+toMmW6Rx0Zy9SgQK
        ru11epccdHdeZNWwun40xn075Q==
X-Google-Smtp-Source: ABdhPJzg2aecgEIDff1fkmEawvO8E4/QfU+FF4fWsC+k5rXFYlVwtXnCs4sTiXcuJwkOZev2clZ0xA==
X-Received: by 2002:adf:b7c8:: with SMTP id t8mr36300917wre.143.1605178303423;
        Thu, 12 Nov 2020 02:51:43 -0800 (PST)
Received: from localhost.localdomain ([212.45.67.2])
        by smtp.googlemail.com with ESMTPSA id m20sm7264401wrg.81.2020.11.12.02.51.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 12 Nov 2020 02:51:42 -0800 (PST)
From:   Georgi Djakov <georgi.djakov@linaro.org>
To:     linux-pm@vger.kernel.org, mdtipton@codeaurora.org
Cc:     bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, georgi.djakov@linaro.org
Subject: [PATCH] interconnect: qcom: msm8916: Remove rpm-ids from non-RPM nodes
Date:   Thu, 12 Nov 2020 12:51:40 +0200
Message-Id: <20201112105140.10092-1-georgi.djakov@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some nodes are incorrectly marked as RPM-controlled (they have RPM
master and slave ids assigned), but are actually controlled by the
application CPU instead. The RPM complains when we send requests for
resources that it can't control. Let's fix this by replacing the IDs,
with the default "-1" in which case no requests are sent.

Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
---
 drivers/interconnect/qcom/msm8916.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/interconnect/qcom/msm8916.c b/drivers/interconnect/qcom/msm8916.c
index 93cb675e5806..5d4ac364be8c 100644
--- a/drivers/interconnect/qcom/msm8916.c
+++ b/drivers/interconnect/qcom/msm8916.c
@@ -182,7 +182,7 @@ DEFINE_QNODE(mas_pcnoc_sdcc_1, MSM8916_MASTER_SDCC_1, 8, -1, -1, MSM8916_PNOC_IN
 DEFINE_QNODE(mas_pcnoc_sdcc_2, MSM8916_MASTER_SDCC_2, 8, -1, -1, MSM8916_PNOC_INT_1);
 DEFINE_QNODE(mas_qdss_bam, MSM8916_MASTER_QDSS_BAM, 8, -1, -1, MSM8916_SNOC_QDSS_INT);
 DEFINE_QNODE(mas_qdss_etr, MSM8916_MASTER_QDSS_ETR, 8, -1, -1, MSM8916_SNOC_QDSS_INT);
-DEFINE_QNODE(mas_snoc_cfg, MSM8916_MASTER_SNOC_CFG, 4, 20, -1, MSM8916_SNOC_QDSS_INT);
+DEFINE_QNODE(mas_snoc_cfg, MSM8916_MASTER_SNOC_CFG, 4, -1, -1, MSM8916_SNOC_QDSS_INT);
 DEFINE_QNODE(mas_spdm, MSM8916_MASTER_SPDM, 4, -1, -1, MSM8916_PNOC_MAS_0);
 DEFINE_QNODE(mas_tcu0, MSM8916_MASTER_TCU0, 8, -1, -1, MSM8916_SLAVE_EBI_CH0, MSM8916_BIMC_SNOC_MAS, MSM8916_SLAVE_AMPSS_L2);
 DEFINE_QNODE(mas_tcu1, MSM8916_MASTER_TCU1, 8, -1, -1, MSM8916_SLAVE_EBI_CH0, MSM8916_BIMC_SNOC_MAS, MSM8916_SLAVE_AMPSS_L2);
@@ -208,14 +208,14 @@ DEFINE_QNODE(pcnoc_snoc_mas, MSM8916_PNOC_SNOC_MAS, 8, 29, -1, MSM8916_PNOC_SNOC
 DEFINE_QNODE(pcnoc_snoc_slv, MSM8916_PNOC_SNOC_SLV, 8, -1, 45, MSM8916_SNOC_INT_0, MSM8916_SNOC_INT_BIMC, MSM8916_SNOC_INT_1);
 DEFINE_QNODE(qdss_int, MSM8916_SNOC_QDSS_INT, 8, -1, -1, MSM8916_SNOC_INT_0, MSM8916_SNOC_INT_BIMC);
 DEFINE_QNODE(slv_apps_l2, MSM8916_SLAVE_AMPSS_L2, 8, -1, -1, 0);
-DEFINE_QNODE(slv_apss, MSM8916_SLAVE_APSS, 4, -1, 20, 0);
+DEFINE_QNODE(slv_apss, MSM8916_SLAVE_APSS, 4, -1, -1, 0);
 DEFINE_QNODE(slv_audio, MSM8916_SLAVE_LPASS, 4, -1, -1, 0);
 DEFINE_QNODE(slv_bimc_cfg, MSM8916_SLAVE_BIMC_CFG, 4, -1, -1, 0);
 DEFINE_QNODE(slv_blsp_1, MSM8916_SLAVE_BLSP_1, 4, -1, -1, 0);
 DEFINE_QNODE(slv_boot_rom, MSM8916_SLAVE_BOOT_ROM, 4, -1, -1, 0);
 DEFINE_QNODE(slv_camera_cfg, MSM8916_SLAVE_CAMERA_CFG, 4, -1, -1, 0);
-DEFINE_QNODE(slv_cats_0, MSM8916_SLAVE_CATS_128, 16, -1, 106, 0);
-DEFINE_QNODE(slv_cats_1, MSM8916_SLAVE_OCMEM_64, 8, -1, 107, 0);
+DEFINE_QNODE(slv_cats_0, MSM8916_SLAVE_CATS_128, 16, -1, -1, 0);
+DEFINE_QNODE(slv_cats_1, MSM8916_SLAVE_OCMEM_64, 8, -1, -1, 0);
 DEFINE_QNODE(slv_clk_ctl, MSM8916_SLAVE_CLK_CTL, 4, -1, -1, 0);
 DEFINE_QNODE(slv_crypto_0_cfg, MSM8916_SLAVE_CRYPTO_0_CFG, 4, -1, -1, 0);
 DEFINE_QNODE(slv_dehr_cfg, MSM8916_SLAVE_DEHR_CFG, 4, -1, -1, 0);
@@ -239,7 +239,7 @@ DEFINE_QNODE(slv_sdcc_2, MSM8916_SLAVE_SDCC_2, 4, -1, -1, 0);
 DEFINE_QNODE(slv_security, MSM8916_SLAVE_SECURITY, 4, -1, -1, 0);
 DEFINE_QNODE(slv_snoc_cfg, MSM8916_SLAVE_SNOC_CFG, 4, -1, -1, 0);
 DEFINE_QNODE(slv_spdm, MSM8916_SLAVE_SPDM, 4, -1, -1, 0);
-DEFINE_QNODE(slv_srvc_snoc, MSM8916_SLAVE_SRVC_SNOC, 8, -1, 29, 0);
+DEFINE_QNODE(slv_srvc_snoc, MSM8916_SLAVE_SRVC_SNOC, 8, -1, -1, 0);
 DEFINE_QNODE(slv_tcsr, MSM8916_SLAVE_TCSR, 4, -1, -1, 0);
 DEFINE_QNODE(slv_tlmm, MSM8916_SLAVE_TLMM, 4, -1, -1, 0);
 DEFINE_QNODE(slv_usb_hs, MSM8916_SLAVE_USB_HS, 4, -1, -1, 0);
@@ -249,7 +249,7 @@ DEFINE_QNODE(snoc_bimc_0_slv, MSM8916_SNOC_BIMC_0_SLV, 8, -1, 24, MSM8916_SLAVE_
 DEFINE_QNODE(snoc_bimc_1_mas, MSM8916_SNOC_BIMC_1_MAS, 16, -1, -1, MSM8916_SNOC_BIMC_1_SLV);
 DEFINE_QNODE(snoc_bimc_1_slv, MSM8916_SNOC_BIMC_1_SLV, 8, -1, -1, MSM8916_SLAVE_EBI_CH0);
 DEFINE_QNODE(snoc_int_0, MSM8916_SNOC_INT_0, 8, 99, 130, MSM8916_SLAVE_QDSS_STM, MSM8916_SLAVE_IMEM, MSM8916_SNOC_PNOC_MAS);
-DEFINE_QNODE(snoc_int_1, MSM8916_SNOC_INT_1, 8, 100, 131, MSM8916_SLAVE_APSS, MSM8916_SLAVE_CATS_128, MSM8916_SLAVE_OCMEM_64);
+DEFINE_QNODE(snoc_int_1, MSM8916_SNOC_INT_1, 8, -1, -1, MSM8916_SLAVE_APSS, MSM8916_SLAVE_CATS_128, MSM8916_SLAVE_OCMEM_64);
 DEFINE_QNODE(snoc_int_bimc, MSM8916_SNOC_INT_BIMC, 8, 101, 132, MSM8916_SNOC_BIMC_0_MAS);
 DEFINE_QNODE(snoc_pcnoc_mas, MSM8916_SNOC_PNOC_MAS, 8, -1, -1, MSM8916_SNOC_PNOC_SLV);
 DEFINE_QNODE(snoc_pcnoc_slv, MSM8916_SNOC_PNOC_SLV, 8, -1, -1, MSM8916_PNOC_INT_0);
