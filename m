Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 342F73BD7E2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jul 2021 15:38:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231446AbhGFNlQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Jul 2021 09:41:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231838AbhGFNlL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Jul 2021 09:41:11 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F718C061760
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jul 2021 06:38:32 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id f20so11592496pfa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jul 2021 06:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TvN5xeV+UnRnXDWJji9LwXoSiVyfNPci3OJpaT2bQnc=;
        b=axZiDOHWkqwd1MmQx4sF2ihsr8+N7CD0Z6Xi60BOzu4KyR6IRtFKwSObsw/NeD9Dn3
         kaFudhEDDSZU2JCMQQB0DVI5X6M44Py7VrGqKlHQPWE9IUmyu8EHuIhnvjLdBJuR0xZ2
         GRbwbQz1bhUxOVYbthjhvajrk/Ttuv4NkE68LqfOxXwAygyHC/1hItem6mgyNJPk5VFT
         Krgv4yzEaYfVabw5S4T6aoV1e3jf2j9I064kOuF2TXZ7Ee54JR7AIyCri+QEEgqVvkdn
         WDnGiAG1uM7rR+K/M3NEYPYSYbLl7uqiv0VFWfPW4KJmCuPqL60j79NbwdTpTxKGhV+k
         sGEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TvN5xeV+UnRnXDWJji9LwXoSiVyfNPci3OJpaT2bQnc=;
        b=DK1N2zliQR6f19eicCzkqZsxv2abAeouSCVLRANIJ+QnPpp405/+scB1fuiLZ7mDOo
         iKlAkF20liwk9cI6CySx72Wwch0Oo4f79g9FCiGBk2JPggLyAz8apAIy2OF3g1QcrJLW
         e3Ubyk46LhJ/kxP5PwI3zpJLuJV5KuBeyYT1K6rQPEkdztvCTa8/BRj/I8e7ubpIKl8c
         WKLQxcGia/57RVsOD11iWSpAOj4lUGuon0NbNNAYcrrqiTdTidWPGPkZ6Z0bxDqS3mir
         WQ8Wd8pD5l1A8tulXqEiQ7sKyMEdh3vCexG+bd6QFYBdd7lk//r5Wc0PigGbmDXDWDNH
         22PQ==
X-Gm-Message-State: AOAM5336DUVrAuZDPWiEamI6vbnF8GaZE0nj6iYeT+blS/j9ZT03+jhG
        Dnw4VmCVYqdsfzW1KqlTeKxcuzoJLlh1Ww==
X-Google-Smtp-Source: ABdhPJwxTZE8UdM5HndViMdj91B2Epd1Tq9sl1Ff2m+k49aaUVryhnV7HnXrRQjMFwEU8FoBd3vtGg==
X-Received: by 2002:a05:6a00:2283:b029:307:5484:dd10 with SMTP id f3-20020a056a002283b02903075484dd10mr20942943pfe.43.1625578711550;
        Tue, 06 Jul 2021 06:38:31 -0700 (PDT)
Received: from localhost.name ([122.161.51.128])
        by smtp.gmail.com with ESMTPSA id q14sm17202260pfh.135.2021.07.06.06.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jul 2021 06:38:31 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        herbert@gondor.apana.org.au, linux-kernel@vger.kernel.org,
        thara.gopinath@linaro.org, linux-crypto@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Eric Biggers <ebiggers@google.com>
Subject: [PATCH] arm64: dts: qcom/sm8150: Add UFS ICE capability
Date:   Tue,  6 Jul 2021 19:08:14 +0530
Message-Id: <20210706133814.621536-1-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for UFS ICE (Qualcomm Inline Crypto Engine) in
sm8150 SoC dts.

I tested this on SA8155p-adp board, which is a publicly
available development board that uses the sa8155p Qualcomm
Snapdragon SoC. SA8155p platform is similar to the SM8150,
so use this as base for now.

I tested the UFS ICE feature using 'fscrypt' test utility.

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Eric Biggers <ebiggers@google.com>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
Here are some details on how, I tested the UFS ICE feature
on SA8155p-adp:
1. Build a kernel with:
	CONFIG_BLK_INLINE_ENCRYPTION=y
	CONFIG_FS_ENCRYPTION=y
	CONFIG_FS_ENCRYPTION_INLINE_CRYPT=y
	CONFIG_SCSI_UFS_CRYPTO=y
2. Create a filesystem with 'mkfs.ext4 -O encrypt'
3. Mount the filesystem with '-o inlinecrypt'
4. Create an encrypted directory and copy some files into it.
5. Unmount the filesystem, and mount it *without* '-o inlinecrypt'.
6. Verify that the files match the originals.
7. Also test the fscrypt lock / unlock combinations.

 arch/arm64/boot/dts/qcom/sm8150.dtsi | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 163eb430eb1e..c4e3939a1cb9 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -1016,7 +1016,9 @@ system-cache-controller@9200000 {
 		ufs_mem_hc: ufshc@1d84000 {
 			compatible = "qcom,sm8150-ufshc", "qcom,ufshc",
 				     "jedec,ufs-2.0";
-			reg = <0 0x01d84000 0 0x2500>;
+			reg = <0 0x01d84000 0 0x2500>,
+			      <0 0x01d90000 0 0x8000>;
+			reg-names = "std", "ice";
 			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
 			phys = <&ufs_mem_phy_lanes>;
 			phy-names = "ufsphy";
@@ -1035,7 +1037,8 @@ ufs_mem_hc: ufshc@1d84000 {
 				"ref_clk",
 				"tx_lane0_sync_clk",
 				"rx_lane0_sync_clk",
-				"rx_lane1_sync_clk";
+				"rx_lane1_sync_clk",
+				"ice_core_clk";
 			clocks =
 				<&gcc GCC_UFS_PHY_AXI_CLK>,
 				<&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
@@ -1044,7 +1047,8 @@ ufs_mem_hc: ufshc@1d84000 {
 				<&rpmhcc RPMH_CXO_CLK>,
 				<&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
 				<&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
-				<&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
+				<&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>,
+				<&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
 			freq-table-hz =
 				<37500000 300000000>,
 				<0 0>,
@@ -1053,7 +1057,8 @@ ufs_mem_hc: ufshc@1d84000 {
 				<0 0>,
 				<0 0>,
 				<0 0>,
-				<0 0>;
+				<0 0>,
+				<0 300000000>;
 
 			status = "disabled";
 		};
-- 
2.31.1

