Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8EB70127C00
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2019 14:53:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727360AbfLTNxC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Dec 2019 08:53:02 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:50797 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727359AbfLTNxC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Dec 2019 08:53:02 -0500
Received: by mail-wm1-f68.google.com with SMTP id a5so9020336wmb.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2019 05:53:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=5KYMiEA30Ig6hFhpzczklpo9jBsbb52y0neKNwihPMc=;
        b=eQOjGAErlMvMi+RDY5FkIAUNaOn164WRavvFlKShvNDRdC+bKWThpo7VqGeuU+X7Ou
         zb8J+2PAUgy2s/jn3oU16gUzjGWcxNAjb4nITou9BcDCkSBnECAISGfWc+ckgo8nAzqt
         /tMgKTTb7JEVyLH+iV+DF+he5w3Q10z0UPVXjgHmjnht+xa5E32Ass4DQSQlaHn/F3OM
         BvM+RHSPOrZxnS5DYRnukevcEOB2nBMIwvYmWwbFrKL6rZ1hxC5HLSPoj7Z3rPAjcvS3
         8wRDsve5BHBt76e9LA5ze6T0alr8oytj+pNc/pQ+plu+psE2LrFkGUgoUjoLD19i9law
         cCTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=5KYMiEA30Ig6hFhpzczklpo9jBsbb52y0neKNwihPMc=;
        b=VvJ/bL2h5qpoLauZePjvODb1lJQxQfMnuaFZ0fC7i3NV7TSOSnSqISy71wLsoYwvxi
         YahJSx9GuH0ZhcbYGLIrO1zxbNB2iFhZpPbf92dDl1WtMyZW0PXeI9tGBcFRqzVrfD2w
         0oqGPcpoEn3UEDhT949IBuGoNjEVYm65q2Aea3mhZX9Ha0S1f9hNDJp6LsNvSgUJyDMz
         HFyRY9qsDgnMVzPHLw0jMWeGfRE6gmu/1tWM2Y8tIQbNk7mu0waZ40i/oCyZ+Pe9FNxg
         94/Rv4frn3FywI9R58+kEHe7vv/78N2aq+T4BWfpvvlGc+9o7GDJjENVluS7M5ZzG9HD
         8aTw==
X-Gm-Message-State: APjAAAXENJqmSU9omB+ElGdpklRqcvVM7AOSgm0ybsZPRpG1g8JR2B8b
        +x3LRHemzPOHXQC1BM8bOMzVcQ==
X-Google-Smtp-Source: APXvYqx/Ss5KGWuSnu4OK/cZYsF0FM5TkWy6km/YsYMAtdJxRvfwOBGoszAgUR0cBoGCjoc39PNk3w==
X-Received: by 2002:a1c:f009:: with SMTP id a9mr16082437wmb.73.1576849980289;
        Fri, 20 Dec 2019 05:53:00 -0800 (PST)
Received: from localhost.localdomain (amontpellier-657-1-145-216.w83-201.abo.wanadoo.fr. [83.201.136.216])
        by smtp.gmail.com with ESMTPSA id p18sm1892787wmg.4.2019.12.20.05.52.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 20 Dec 2019 05:52:59 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     catalin.marinas@arm.com, will@kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH] arm64: Add qcom Kconfig fragment
Date:   Fri, 20 Dec 2019 14:56:00 +0100
Message-Id: <1576850160-1564-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add qcom Kconfig fragment which enables the appropriate symbols for
support of Qualcomm based boards, like the 'popular' dragonboards.
This permits to fully support the boards upstream without having to
rely on downstream deconfig changes.

This patch has been tested with Dragonboard-410c and Dragonboard-820c.

qcom.config fragment has been generated with ./script/diffconfig

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 arch/arm64/configs/qcom.config | 57 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 arch/arm64/configs/qcom.config

diff --git a/arch/arm64/configs/qcom.config b/arch/arm64/configs/qcom.config
new file mode 100644
index 0000000..9358df8
--- /dev/null
+++ b/arch/arm64/configs/qcom.config
@@ -0,0 +1,57 @@
+CONFIG_ARM_QCOM_CPUFREQ_HW=y
+CONFIG_BT_HCIUART_3WIRE=y
+CONFIG_BT_HCIUART_QCA=y
+CONFIG_BT_HCIUART_RTL=y
+CONFIG_CRYPTO_DEV_QCOM_RNG=y
+CONFIG_EXTCON_QCOM_SPMI_MISC=y
+CONFIG_INTERCONNECT=y
+CONFIG_MFD_QCOM_RPM=y
+CONFIG_PHY_QCOM_PCIE2=y
+CONFIG_PHY_QCOM_QMP=y
+CONFIG_PHY_QCOM_QUSB2=y
+CONFIG_PHY_QCOM_UFS=y
+CONFIG_PM8916_WATCHDOG=y
+CONFIG_POWER_RESET_QCOM_PON=y
+CONFIG_QCOM_APR=m
+CONFIG_QCOM_FASTRPC=y
+CONFIG_QCOM_RMTFS_MEM=m
+CONFIG_QCOM_RPMHPD=y
+CONFIG_QCOM_RPMPD=y
+CONFIG_QCOM_SOCINFO=m
+CONFIG_QCOM_WCNSS_CTRL=m
+CONFIG_QCOM_WCNSS_PIL=m
+CONFIG_SCSI_UFS_QCOM=y
+CONFIG_SND_SOC_CROS_EC_CODEC=m
+CONFIG_SND_SOC_MAX98927=m
+CONFIG_SND_SOC_MSM8916_WCD_ANALOG=m
+CONFIG_SND_SOC_MSM8916_WCD_DIGITAL=m
+CONFIG_VIDEO_QCOM_CAMSS=m
+CONFIG_VIDEO_QCOM_VENUS=m
+CONFIG_WCN36XX=m
+CONFIG_BT_QCA=m
+CONFIG_BT_QCOMSMD=m
+CONFIG_INTERCONNECT_QCOM=y
+CONFIG_INTERCONNECT_QCOM_MSM8974=y
+CONFIG_INTERCONNECT_QCOM_QCS404=y
+CONFIG_INTERCONNECT_QCOM_SDM845=y
+CONFIG_INTERCONNECT_QCOM_SMD_RPM=y
+CONFIG_PHY_QCOM_UFS_14NM=y
+CONFIG_QCOM_CLK_RPM=y
+CONFIG_REGULATOR_QCOM_RPM=y
+CONFIG_SND_COMPRESS_OFFLOAD=y
+CONFIG_SND_SOC_COMPRESS=y
+CONFIG_SND_SOC_MSM8996=m
+CONFIG_SND_SOC_QCOM_COMMON=m
+CONFIG_SND_SOC_QDSP6=m
+CONFIG_SND_SOC_QDSP6_ADM=m
+CONFIG_SND_SOC_QDSP6_AFE=m
+CONFIG_SND_SOC_QDSP6_AFE_DAI=m
+CONFIG_SND_SOC_QDSP6_ASM=m
+CONFIG_SND_SOC_QDSP6_ASM_DAI=m
+CONFIG_SND_SOC_QDSP6_COMMON=m
+CONFIG_SND_SOC_QDSP6_CORE=m
+CONFIG_SND_SOC_QDSP6_ROUTING=m
+CONFIG_SND_SOC_RT5663=m
+CONFIG_SND_SOC_SDM845=m
+CONFIG_VIDEOBUF2_DMA_SG=m
+CONFIG_WCN36XX_DEBUGFS=y
-- 
2.7.4

