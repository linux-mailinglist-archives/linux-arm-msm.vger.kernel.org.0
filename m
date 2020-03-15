Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6B3E185A22
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Mar 2020 06:10:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726329AbgCOFKF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 15 Mar 2020 01:10:05 -0400
Received: from mail-pj1-f68.google.com ([209.85.216.68]:50418 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726214AbgCOFKE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 15 Mar 2020 01:10:04 -0400
Received: by mail-pj1-f68.google.com with SMTP id o23so474646pjp.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2020 22:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s23IqWHm+4YdBVxKLV9+dw8Ig+I7LwtH5N9j7UZLiqw=;
        b=gywJFKfavAY6uDxQ1Kn0OAm3rMpvfeGnfRwPr6mM4K357+Tqw7gKU9/7B+vt238ul2
         Amfm9bNE72ozNWizh+w2aP/kWBeJqVSs1FJTS2Md8gY8+bay6u4VN4/icM1KOjsJLhd4
         eGbFUDxbkuc429CbwOOYi9Qg6bMvFuCHnsN0dEbHm9+bBoN42v5m/5GPEpIn7t+iI5Ih
         fF+ITWKQDKHSQbjIFK0UFAO7fjiXyVcROk5WquJpSX8ndKSDQlS8raW0Dn26fqHaVVWV
         axW7fBSstLcX2WZaUEx5D8FT4RRCAeY/SDk7gQ1knLr18ltOh6vr/84wf6N4M0kCEWBx
         LwZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s23IqWHm+4YdBVxKLV9+dw8Ig+I7LwtH5N9j7UZLiqw=;
        b=AsGJM2xav8BhODNAYdTymUlm4ipvM1pHiPPWKvY8JAlYKFXMVGD1MIg/4efKEd3fQP
         3mRPCYQOTBUGWi18El4/O3iTridJ0iR/081rQyWQ0xVndPHqEDvdhG2XAQmfmSi0VhWy
         doWHsfWF+9UuBmSHadmrnJ0k9SUBZuvGYEAqzvl9kmWsvMxdTnd18UGt2GiEFKsFGujj
         TQpayj5fSZcIEGfZYTf48besTJHDhDdb7HRxYqVyJMGHPlXVQpSLWFaodivXTrWOWPXp
         CdHU49/ju1AJ8N25yhjEwoIOb1oiyjAYXrVHtoPB7ALotJzilhYfQIweqyFkX4rJpGBu
         CTsQ==
X-Gm-Message-State: ANhLgQ0n7dUZVtLIaoT/usLld9RxFmDqn4tQoZsA+lJrsrm4xX5sCn6/
        FnGvK2j1IseLfkFvhQ8ry65gh7GwfOg=
X-Google-Smtp-Source: ADFU+vsMXczaHvc9ZvzzvJSkN74Xjwxdnlfpp2mPgcBJRSn9WVH2LDUgXcaEIowRj5ftZRBu8+IkNQ==
X-Received: by 2002:a17:902:8f8e:: with SMTP id z14mr21109002plo.195.1584249003475;
        Sat, 14 Mar 2020 22:10:03 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id v67sm19168821pfc.120.2020.03.14.22.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2020 22:10:02 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH] arm64: defconfig: Enable Qualcomm SDM845 audio configs
Date:   Sat, 14 Mar 2020 22:08:27 -0700
Message-Id: <20200315050827.1575421-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable soundwire, slimbus frameworks, the machine driver and the codec
drivers for WCD934x and WSA881x used on varios SDM845 based designs.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/configs/defconfig | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 0a8a2ad94bef..f186d0424619 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -436,6 +436,7 @@ CONFIG_GPIO_MB86S7X=y
 CONFIG_GPIO_PL061=y
 CONFIG_GPIO_RCAR=y
 CONFIG_GPIO_UNIPHIER=y
+CONFIG_GPIO_WCD934X=m
 CONFIG_GPIO_XGENE=y
 CONFIG_GPIO_XGENE_SB=y
 CONFIG_GPIO_MAX732X=y
@@ -501,6 +502,7 @@ CONFIG_MFD_SPMI_PMIC=y
 CONFIG_MFD_RK808=y
 CONFIG_MFD_SEC_CORE=y
 CONFIG_MFD_ROHM_BD718XX=y
+CONFIG_MFD_WCD934X=m
 CONFIG_REGULATOR_FIXED_VOLTAGE=y
 CONFIG_REGULATOR_AXP20X=y
 CONFIG_REGULATOR_BD718XX=y
@@ -604,6 +606,7 @@ CONFIG_SND_HDA_CODEC_HDMI=m
 CONFIG_SND_SOC=y
 CONFIG_SND_BCM2835_SOC_I2S=m
 CONFIG_SND_MESON_AXG_SOUND_CARD=m
+CONFIG_SND_SOC_SDM845=m
 CONFIG_SND_SOC_ROCKCHIP=m
 CONFIG_SND_SOC_ROCKCHIP_SPDIF=m
 CONFIG_SND_SOC_ROCKCHIP_RT5645=m
@@ -616,6 +619,8 @@ CONFIG_SND_SOC_ES7134=m
 CONFIG_SND_SOC_ES7241=m
 CONFIG_SND_SOC_PCM3168A_I2C=m
 CONFIG_SND_SOC_TAS571X=m
+CONFIG_SND_SOC_WCD934X=m
+CONFIG_SND_SOC_WSA881X=m
 CONFIG_SND_SIMPLE_CARD=m
 CONFIG_SND_AUDIO_GRAPH_CARD=m
 CONFIG_I2C_HID=m
@@ -782,6 +787,8 @@ CONFIG_QCOM_SYSMON=m
 CONFIG_RPMSG_QCOM_GLINK_RPM=y
 CONFIG_RPMSG_QCOM_GLINK_SMEM=m
 CONFIG_RPMSG_QCOM_SMD=y
+CONFIG_SOUNDWIRE=m
+CONFIG_SOUNDWIRE_QCOM=m
 CONFIG_OWL_PM_DOMAINS=y
 CONFIG_RASPBERRYPI_POWER=y
 CONFIG_IMX_SCU_SOC=y
@@ -797,6 +804,7 @@ CONFIG_QCOM_SMD_RPM=y
 CONFIG_QCOM_SMP2P=y
 CONFIG_QCOM_SMSM=y
 CONFIG_QCOM_SOCINFO=m
+CONFIG_QCOM_APR=m
 CONFIG_ARCH_R8A774A1=y
 CONFIG_ARCH_R8A774B1=y
 CONFIG_ARCH_R8A774C0=y
@@ -883,6 +891,9 @@ CONFIG_FPGA_REGION=m
 CONFIG_OF_FPGA_REGION=m
 CONFIG_TEE=y
 CONFIG_OPTEE=y
+CONFIG_SLIMBUS=m
+CONFIG_SLIM_QCOM_CTRL=m
+CONFIG_SLIM_QCOM_NGD_CTRL=m
 CONFIG_EXT2_FS=y
 CONFIG_EXT3_FS=y
 CONFIG_EXT4_FS_POSIX_ACL=y
-- 
2.24.0

