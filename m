Return-Path: <linux-arm-msm+bounces-20310-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CADA8CD6D1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 May 2024 17:14:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E0EE4282FC7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 May 2024 15:14:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B272CDDBB;
	Thu, 23 May 2024 15:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="vBxynZPU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2403D304
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 May 2024 15:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716477261; cv=none; b=cmyFVSYQXI69kz7UGUf/29IZqqsDNv2rT6l+srF8Az3Z2miJ/wOPJUs0DgS9uU5PEK+H7xcd6AKEwA9tNbFllBrY3v1kUKm95j1rFvd5KQWc2svMp5nH/a8mTJ183lLGGuRyAd2xaVaXbPiLQ+Dg3Z27dV1Yqce/yDzgfaoUz5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716477261; c=relaxed/simple;
	bh=kVgMJZRFezxVLSMHE5fLF06HpZt7tZcstPoMDIqI6Eg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=EO99Hbjc1+cfqxACGCdnzOwPSk8qXegOTZfutmJNEyxz5rp8WesBRbCfXXiS6dhq3tRb2PvROgLJmQW7s5oZiAldG+QXZxme2hsnPaVf4QGrBN+yQf5zoW2SDFNPLd/QEbdw9Pw7GvJl9Tl0JxYtHFEZun2/IaLKNge4z2ZMBh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=vBxynZPU; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3550134ef25so429021f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 May 2024 08:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1716477255; x=1717082055; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wUhkafX+0naOsO8Dd2SZx11+/ZMZcb6gW9CFc+rlBOM=;
        b=vBxynZPUVMFo0TYR9M9WeVY7iKbYOcUX0FccaSYtKokXpKmSZXZwaJp39x+jBC+ivq
         fFsM7n0iJGByaMdP1xWojdkFxYAa+hfDkDR9hKbBoLL6nnhKPnkWvrSAu12XWtau9+Gi
         PHzUMepBCn++hqo12WQTlP2UgH6GCSYQVvBvcQrrUp/YQ0TliuvLP4RF2c75C/UqrPe6
         s90hr3eLSMzfDCHKphOsXl0MpsmYtOU/3ECCX3zjw33euCeLYVFNhP1sYwbtdzeLemJY
         /Yj0L5hd8BSRK9XyGaoGcHLVM9e/ahT+kCgjjvERUsGL3ceWN1lpu2bb/ZD0Jg42Wz5p
         2K9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716477255; x=1717082055;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wUhkafX+0naOsO8Dd2SZx11+/ZMZcb6gW9CFc+rlBOM=;
        b=YOWPFrZ4sMZumDOZZl7CVjJTtaChze4hgZGM7xT809ktXUQ3E/5tBx1Br6ZhU9mGSL
         rm5TBMRjJX7O7uousASzAjIRu+d9vwgFlaEb17CW3k2cjuietM1oS2WokhFqTW/QWEDZ
         kXUzRp2OTgris0QzRHoFDml93HxT6NpPoGaAMVchdX6cyvniR4BuiAoDe2yI8JWKU4Ty
         5fkYI0xQlRrORikN2/g6seefumdExNHD3PPiKyXr9rT7xDHzQRllwmCrqPenPuzY/33f
         LvkHjLYPbTkP6+s6Z6/bFSjSQld4bkLMSFDkvMNpjPqk2oR75vchhitc2OzYek/aW8Eq
         mZeA==
X-Gm-Message-State: AOJu0YxMuybA7eocdKQ1W+L0gwd3sY6mFA3onyPAfkXKvSVXkSEu5fGV
	5WvXaRRspFjwB6LS/OUrEupMchNijUrSpSnXar9lgKrXpxWd57FwKH0+jKxFlAw=
X-Google-Smtp-Source: AGHT+IG3GhcvRvldbjKVPGOUTdexni6NQk/16qMDKIIailuvkqNInL6SuHybPLdavg5CjdpVPhiB3Q==
X-Received: by 2002:adf:a30a:0:b0:354:e243:ccc with SMTP id ffacd0b85a97d-354e2430e44mr3139301f8f.48.1716477254898;
        Thu, 23 May 2024 08:14:14 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502baad058sm36713709f8f.66.2024.05.23.08.14.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 May 2024 08:14:14 -0700 (PDT)
Message-ID: <63337d63-67ef-4499-8a24-5f6e9285c36b@freebox.fr>
Date: Thu, 23 May 2024 17:14:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Marc Gonzalez <mgonzalez@freebox.fr>
Subject: [RFC PATCH v1] drm/msm: add msm8998 hdmi phy/pll support
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: MSM <linux-arm-msm@vger.kernel.org>, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 Bryan O Donoghue <bryan.odonoghue@linaro.org>,
 Luca Weiss <luca.weiss@fairphone.com>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

From: Arnaud Vrac <avrac@freebox.fr>

Ported from the downstream driver.

Signed-off-by: Arnaud Vrac <avrac@freebox.fr>
Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
---
 drivers/gpu/drm/msm/Makefile             |   1 +
 drivers/gpu/drm/msm/hdmi/hdmi.c          |   1 +
 drivers/gpu/drm/msm/hdmi/hdmi.h          |   8 +
 drivers/gpu/drm/msm/hdmi/hdmi.xml.h      | 162 ++++
 drivers/gpu/drm/msm/hdmi/hdmi_phy.c      |   5 +
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c | 941 +++++++++++++++++++++++
 6 files changed, 1118 insertions(+)
 create mode 100644 drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index b21ae2880c715..5b5d6aded5233 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -26,6 +26,7 @@ msm-$(CONFIG_DRM_MSM_HDMI) += \
 	hdmi/hdmi_phy.o \
 	hdmi/hdmi_phy_8960.o \
 	hdmi/hdmi_phy_8996.o \
+	hdmi/hdmi_phy_8998.o \
 	hdmi/hdmi_phy_8x60.o \
 	hdmi/hdmi_phy_8x74.o \
 	hdmi/hdmi_pll_8960.o \
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index c8ebd75176bba..2a2ce49ef5aa3 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -549,6 +549,7 @@ static void msm_hdmi_dev_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id msm_hdmi_dt_match[] = {
+	{ .compatible = "qcom,hdmi-tx-8998", .data = &hdmi_tx_8974_config },
 	{ .compatible = "qcom,hdmi-tx-8996", .data = &hdmi_tx_8974_config },
 	{ .compatible = "qcom,hdmi-tx-8994", .data = &hdmi_tx_8974_config },
 	{ .compatible = "qcom,hdmi-tx-8084", .data = &hdmi_tx_8974_config },
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index ec57864403915..cad0d50c82fbc 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -137,6 +137,7 @@ enum hdmi_phy_type {
 	MSM_HDMI_PHY_8960,
 	MSM_HDMI_PHY_8x74,
 	MSM_HDMI_PHY_8996,
+	MSM_HDMI_PHY_8998,
 	MSM_HDMI_PHY_MAX,
 };
 
@@ -154,6 +155,7 @@ extern const struct hdmi_phy_cfg msm_hdmi_phy_8x60_cfg;
 extern const struct hdmi_phy_cfg msm_hdmi_phy_8960_cfg;
 extern const struct hdmi_phy_cfg msm_hdmi_phy_8x74_cfg;
 extern const struct hdmi_phy_cfg msm_hdmi_phy_8996_cfg;
+extern const struct hdmi_phy_cfg msm_hdmi_phy_8998_cfg;
 
 struct hdmi_phy {
 	struct platform_device *pdev;
@@ -184,6 +186,7 @@ void __exit msm_hdmi_phy_driver_unregister(void);
 #ifdef CONFIG_COMMON_CLK
 int msm_hdmi_pll_8960_init(struct platform_device *pdev);
 int msm_hdmi_pll_8996_init(struct platform_device *pdev);
+int msm_hdmi_pll_8998_init(struct platform_device *pdev);
 #else
 static inline int msm_hdmi_pll_8960_init(struct platform_device *pdev)
 {
@@ -194,6 +197,11 @@ static inline int msm_hdmi_pll_8996_init(struct platform_device *pdev)
 {
 	return -ENODEV;
 }
+
+static inline int msm_hdmi_pll_8998_init(struct platform_device *pdev)
+{
+	return -ENODEV;
+}
 #endif
 
 /*
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.xml.h b/drivers/gpu/drm/msm/hdmi/hdmi.xml.h
index 973b460486a5a..c9ca1101b5ad4 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.xml.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.xml.h
@@ -1396,4 +1396,166 @@ static inline uint32_t HDMI_8x60_PHY_REG1_OUTVOL_SWING_CTRL(uint32_t val)
 #define REG_HDMI_PHY_QSERDES_TX_LX_TX_ALOG_INTF_OBSV		0x00000110
 
 
+#define REG_HDMI_8998_PHY_CFG					0x00000000
+
+#define REG_HDMI_8998_PHY_PD_CTL				0x00000004
+
+#define REG_HDMI_8998_PHY_MODE					0x00000010
+
+#define REG_HDMI_8998_PHY_CLOCK					0x0000005c
+
+#define REG_HDMI_8998_PHY_CMN_CTRL				0x00000068
+
+#define REG_HDMI_8998_PHY_STATUS				0x000000b4
+
+
+#define REG_HDMI_8998_PHY_QSERDES_COM_ATB_SEL1			0x00000000
+
+#define REG_HDMI_8998_PHY_QSERDES_COM_ATB_SEL2			0x00000004
+
+#define REG_HDMI_8998_PHY_QSERDES_COM_FREQ_UPDATE		0x00000008
+
+#define REG_HDMI_8998_PHY_QSERDES_COM_BG_TIMER			0x0000000c
+
+#define REG_HDMI_8998_PHY_QSERDES_COM_SSC_EN_CENTER		0x00000010
+
+#define REG_HDMI_8998_PHY_QSERDES_COM_SSC_ADJ_PER1		0x00000014
+
+#define REG_HDMI_8998_PHY_QSERDES_COM_SSC_ADJ_PER2		0x00000018
+
+#define REG_HDMI_8998_PHY_QSERDES_COM_SSC_PER1			0x0000001c
+
+#define REG_HDMI_8998_PHY_QSERDES_COM_SSC_PER2			0x00000020
+
+#define REG_HDMI_8998_PHY_QSERDES_COM_SSC_STEP_SIZE1		0x00000024
+
+#define REG_HDMI_8998_PHY_QSERDES_COM_SSC_STEP_SIZE2		0x00000028
+
+#define REG_HDMI_8998_PHY_QSERDES_COM_POST_DIV			0x0000002c
+
+#define REG_HDMI_8998_PHY_QSERDES_COM_POST_DIV_MUX		0x00000030
+
+#define REG_HDMI_8998_PHY_QSERDES_COM_BIAS_EN_CLKBUFLR_EN	0x00000034
+
+#define REG_HDMI_8998_PHY_QSERDES_COM_CLK_ENABLE1		0x00000038
+
+#define REG_HDMI_8998_PHY_QSERDES_COM_SYS_CLK_CTRL		0x0000003c
+
+#define REG_HDMI_8998_PHY_QSERDES_COM_SYSCLK_BUF_ENABLE		0x00000040
+
+#define REG_HDMI_8998_PHY_QSERDES_COM_PLL_EN			0x00000044
+
+#define REG_HDMI_8998_PHY_QSERDES_COM_PLL_IVCO			0x00000048
+
+#define REG_HDMI_8998_PHY_QSERDES_COM_CMN_IETRIM		0x0000004c
+
+#define REG_HDMI_8998_PHY_QSERDES_COM_CMN_IPTRIM		0x00000050
+
+#define REG_HDMI_8998_PHY_QSERDES_COM_CP_CTRL_MODE0		0x00000060
+
+#define REG_HDMI_8998_PHY_QSERDES_COM_CP_CTRL_MODE1		0x00000064
+
+#define REG_HDMI_8998_PHY_QSERDES_COM_PLL_RCTRL_MODE0		0x00000068
+
+#define REG_HDMI_8998_PHY_QSERDES_COM_PLL_RCTRL_MODE1		0x0000006c
+
+#define REG_HDMI_8998_PHY_QSERDES_COM_PLL_CCTRL_MODE0		0x00000070
+
+#define REG_HDMI_8998_PHY_QSERDES_COM_PLL_CCTRL_MODE1		0x00000074
+
+#define REG_HDMI_8998_PHY_QSERDES_COM_PLL_CNTRL			0x00000078
+
+#define REG_HDMI_8998_PHY_QSERDES_COM_BIAS_EN_CTRL_BY_PSM	0x0000007c
+
+#define REG_HDMI_8998_PHY_QSERDES_COM_SYSCLK_EN_SEL		0x00000080
+
+#define REG_HDMI_8998_PHY_QSERDES_COM_CML_SYSCLK_SEL		0x00000084
+
+#define REG_HDMI_8998_PHY_QSERDES_COM_RESETSM_CNTRL		0x00000088
+
+#define REG_HDMI_8998_PHY_QSERDES_COM_RESETSM_CNTRL2		0x0000008c
+
+#define REG_HDMI_8998_PHY_QSERDES_COM_LOCK_CMP_EN		0x00000090
+
+#define REG_HDMI_8998_PHY_QSERDES_COM_LOCK_CMP_CFG		0x00000094
+
+#define REG_HDMI_8998_PHY_QSERDES_COM_LOCK_CMP1_MODE0		0x00000098
+
+#define REG_HDMI_8998_PHY_QSERDES_COM_LOCK_CMP2_MODE0		0x0000009c
+
+#define REG_HDMI_8998_PHY_QSERDES_COM_LOCK_CMP3_MODE0		0x000000a0
+
+#define REG_HDMI_8998_PHY_QSERDES_COM_DEC_START_MODE0		0x000000b0
+
+#define REG_HDMI_8998_PHY_QSERDES_COM_DEC_START_MODE1		0x000000b4
+
+#define REG_HDMI_8998_PHY_QSERDES_COM_DIV_FRAC_START1_MODE0	0x000000b8
+
+#define REG_HDMI_8998_PHY_QSERDES_COM_DIV_FRAC_START2_MODE0	0x000000bc
+
+#define REG_HDMI_8998_PHY_QSERDES_COM_DIV_FRAC_START3_MODE0	0x000000c0
+
+#define REG_HDMI_8998_PHY_QSERDES_COM_DIV_FRAC_START1_MODE1	0x000000c4
+
+#define REG_HDMI_8998_PHY_QSERDES_COM_DIV_FRAC_START2_MODE1	0x000000c8
+
+#define REG_HDMI_8998_PHY_QSERDES_COM_DIV_FRAC_START3_MODE1	0x000000cc
+
+#define REG_HDMI_8998_PHY_QSERDES_COM_INTEGLOOP_INITVAL		0x000000d0
+
+#define REG_HDMI_8998_PHY_QSERDES_COM_INTEGLOOP_EN		0x000000d4
+
+#define REG_HDMI_8998_PHY_QSERDES_COM_INTEGLOOP_GAIN0_MODE0	0x000000d8
+
+#define REG_HDMI_8998_PHY_QSERDES_COM_INTEGLOOP_GAIN1_MODE0	0x000000dc
+
+#define REG_HDMI_8998_PHY_QSERDES_COM_INTEGLOOP_GAIN0_MODE1	0x000000e0
+
+#define REG_HDMI_8998_PHY_QSERDES_COM_INTEGLOOP_GAIN1_MODE1	0x000000e4
+
+#define REG_HDMI_8998_PHY_QSERDES_COM_VCOCAL_DEADMAN_CTRL	0x000000e8
+
+#define REG_HDMI_8998_PHY_QSERDES_COM_VCO_TUNE_CTRL		0x000000ec
+
+#define REG_HDMI_8998_PHY_QSERDES_COM_VCO_TUNE_MAP		0x000000f0
+
+#define REG_HDMI_8998_PHY_QSERDES_COM_CMN_STATUS		0x00000124
+
+#define REG_HDMI_8998_PHY_QSERDES_COM_RESET_SM_STATUS		0x00000128
+
+#define REG_HDMI_8998_PHY_QSERDES_COM_CLK_SEL			0x00000138
+
+#define REG_HDMI_8998_PHY_QSERDES_COM_HSCLK_SEL			0x0000013c
+
+#define REG_HDMI_8998_PHY_QSERDES_COM_CORECLK_DIV_MODE0		0x00000148
+
+#define REG_HDMI_8998_PHY_QSERDES_COM_SW_RESET			0x00000150
+
+#define REG_HDMI_8998_PHY_QSERDES_COM_CORE_CLK_EN		0x00000154
+
+#define REG_HDMI_8998_PHY_QSERDES_COM_C_READY_STATUS		0x00000158
+
+#define REG_HDMI_8998_PHY_QSERDES_COM_CMN_CONFIG		0x0000015c
+
+#define REG_HDMI_8998_PHY_QSERDES_COM_SVS_MODE_CLK_SEL		0x00000164
+
+
+#define REG_HDMI_8998_PHY_TXn_EMP_POST1_LVL			0x00000000
+
+#define REG_HDMI_8998_PHY_TXn_INTERFACE_SELECT_TX_BAND		0x00000008
+
+#define REG_HDMI_8998_PHY_TXn_CLKBUF_TERM_ENABLE		0x0000000c
+
+#define REG_HDMI_8998_PHY_TXn_DRV_LVL_RES_CODE_OFFSET		0x00000014
+
+#define REG_HDMI_8998_PHY_TXn_DRV_LVL				0x00000018
+
+#define REG_HDMI_8998_PHY_TXn_LANE_CONFIG			0x0000001c
+
+#define REG_HDMI_8998_PHY_TXn_PRE_DRIVER_1			0x00000024
+
+#define REG_HDMI_8998_PHY_TXn_PRE_DRIVER_2			0x00000028
+
+#define REG_HDMI_8998_PHY_TXn_LANE_MODE				0x0000002c
+
 #endif /* HDMI_XML */
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
index 88a3423b7f24d..95b3f7535d840 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
@@ -118,6 +118,9 @@ static int msm_hdmi_phy_pll_init(struct platform_device *pdev,
 	case MSM_HDMI_PHY_8996:
 		ret = msm_hdmi_pll_8996_init(pdev);
 		break;
+	case MSM_HDMI_PHY_8998:
+		ret = msm_hdmi_pll_8998_init(pdev);
+		break;
 	/*
 	 * we don't have PLL support for these, don't report an error for now
 	 */
@@ -193,6 +196,8 @@ static const struct of_device_id msm_hdmi_phy_dt_match[] = {
 	  .data = &msm_hdmi_phy_8x74_cfg },
 	{ .compatible = "qcom,hdmi-phy-8996",
 	  .data = &msm_hdmi_phy_8996_cfg },
+	{ .compatible = "qcom,hdmi-phy-8998",
+	  .data = &msm_hdmi_phy_8998_cfg },
 	{}
 };
 
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
new file mode 100644
index 0000000000000..28c4824a30e89
--- /dev/null
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
@@ -0,0 +1,941 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2016, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/delay.h>
+
+#include "hdmi.h"
+
+#define HDMI_VCO_MAX_FREQ			12000000000UL
+#define HDMI_VCO_MIN_FREQ			8000000000UL
+
+#define HDMI_PCLK_MAX_FREQ			600000000
+#define HDMI_PCLK_MIN_FREQ			25000000
+
+#define HDMI_HIGH_FREQ_BIT_CLK_THRESHOLD	3400000000UL
+#define HDMI_DIG_FREQ_BIT_CLK_THRESHOLD		1500000000UL
+#define HDMI_MID_FREQ_BIT_CLK_THRESHOLD		750000000UL
+#define HDMI_CORECLK_DIV			5
+#define HDMI_DEFAULT_REF_CLOCK			19200000
+#define HDMI_PLL_CMP_CNT			1024
+
+#define HDMI_PLL_POLL_MAX_READS			100
+#define HDMI_PLL_POLL_TIMEOUT_US		150
+
+#define HDMI_NUM_TX_CHANNEL			4
+
+struct hdmi_pll_8998 {
+	struct platform_device *pdev;
+	struct clk_hw clk_hw;
+	unsigned long rate;
+
+	/* pll mmio base */
+	void __iomem *mmio_qserdes_com;
+	/* tx channel base */
+	void __iomem *mmio_qserdes_tx[HDMI_NUM_TX_CHANNEL];
+};
+
+#define hw_clk_to_pll(x) container_of(x, struct hdmi_pll_8998, clk_hw)
+
+struct hdmi_8998_phy_pll_reg_cfg {
+	u32 com_svs_mode_clk_sel;
+	u32 com_hsclk_sel;
+	u32 com_pll_cctrl_mode0;
+	u32 com_pll_rctrl_mode0;
+	u32 com_cp_ctrl_mode0;
+	u32 com_dec_start_mode0;
+	u32 com_div_frac_start1_mode0;
+	u32 com_div_frac_start2_mode0;
+	u32 com_div_frac_start3_mode0;
+	u32 com_integloop_gain0_mode0;
+	u32 com_integloop_gain1_mode0;
+	u32 com_lock_cmp_en;
+	u32 com_lock_cmp1_mode0;
+	u32 com_lock_cmp2_mode0;
+	u32 com_lock_cmp3_mode0;
+	u32 com_core_clk_en;
+	u32 com_coreclk_div_mode0;
+
+	u32 tx_lx_tx_band[HDMI_NUM_TX_CHANNEL];
+	u32 tx_lx_tx_drv_lvl[HDMI_NUM_TX_CHANNEL];
+	u32 tx_lx_tx_emp_post1_lvl[HDMI_NUM_TX_CHANNEL];
+	u32 tx_lx_pre_driver_1[HDMI_NUM_TX_CHANNEL];
+	u32 tx_lx_pre_driver_2[HDMI_NUM_TX_CHANNEL];
+	u32 tx_lx_res_code_offset[HDMI_NUM_TX_CHANNEL];
+
+	u32 phy_mode;
+};
+
+struct hdmi_8998_post_divider {
+	u64 vco_freq;
+	int hsclk_divsel;
+	int vco_ratio;
+	int tx_band_sel;
+	int half_rate_mode;
+};
+
+static inline struct hdmi_phy *pll_get_phy(struct hdmi_pll_8998 *pll)
+{
+	return platform_get_drvdata(pll->pdev);
+}
+
+static inline void hdmi_pll_write(struct hdmi_pll_8998 *pll, int offset,
+				  u32 data)
+{
+	msm_writel(data, pll->mmio_qserdes_com + offset);
+}
+
+static inline u32 hdmi_pll_read(struct hdmi_pll_8998 *pll, int offset)
+{
+	return msm_readl(pll->mmio_qserdes_com + offset);
+}
+
+static inline void hdmi_tx_chan_write(struct hdmi_pll_8998 *pll, int channel,
+				      int offset, int data)
+{
+	 msm_writel(data, pll->mmio_qserdes_tx[channel] + offset);
+}
+
+static inline u32 pll_get_cpctrl(u64 frac_start, unsigned long ref_clk,
+				 bool gen_ssc)
+{
+	if ((frac_start != 0) || gen_ssc)
+		return 0x8; //(11000000 / (ref_clk / 20));
+
+	return 0x30;
+}
+
+static inline u32 pll_get_rctrl(u64 frac_start, bool gen_ssc)
+{
+	if ((frac_start != 0) || gen_ssc)
+		return 0x16;
+
+	return 0x18;
+}
+
+static inline u32 pll_get_cctrl(u64 frac_start, bool gen_ssc)
+{
+	if ((frac_start != 0) || gen_ssc)
+		return 0x34;
+
+	return 0x2;
+}
+
+static inline u32 pll_get_integloop_gain(u64 frac_start, u64 bclk, u32 ref_clk,
+					 bool gen_ssc)
+{
+	int digclk_divsel = bclk > HDMI_DIG_FREQ_BIT_CLK_THRESHOLD ? 1 : 2;
+	u64 base;
+
+	if ((frac_start != 0) || gen_ssc)
+		base = 0x3F; //(64 * ref_clk) / HDMI_DEFAULT_REF_CLOCK;
+	else
+		base = 0xC4; //(1022 * ref_clk) / 100;
+
+	base <<= (digclk_divsel == 2 ? 1 : 0);
+
+	return (base <= 2046 ? base : 2046);
+}
+
+static inline u32 pll_get_pll_cmp(u64 fdata, unsigned long ref_clk)
+{
+	u64 dividend = HDMI_PLL_CMP_CNT * fdata;
+	u32 divisor = ref_clk * 10;
+	u32 rem;
+
+	rem = do_div(dividend, divisor);
+	if (rem > (divisor >> 1))
+		dividend++;
+
+	return dividend - 1;
+}
+
+static inline u64 pll_cmp_to_fdata(u32 pll_cmp, unsigned long ref_clk)
+{
+	u64 fdata = ((u64)pll_cmp) * ref_clk * 10;
+
+	do_div(fdata, HDMI_PLL_CMP_CNT);
+
+	return fdata;
+}
+
+#if 0
+static int pll_get_post_div(struct hdmi_8998_post_divider *pd, u64 bclk)
+{
+	/* FIXME: use downstream ratio list ? */
+	int ratio[] = { 2, 3, 4, 5, 6, 9, 10, 12, 14, 15, 20, 21, 25, 28, 35 };
+	int hs_divsel[] = { 0, 4, 8, 12, 1, 5, 2, 9, 3, 13, 10, 7, 14, 11, 15 };
+	int tx_band_sel[] = { 0, 1, 2, 3 };
+	u64 vco_freq[60];
+	u64 vco, vco_optimal;
+	int half_rate_mode = 0;
+	int vco_optimal_index, vco_freq_index;
+	int i, j;
+
+retry:
+	vco_optimal = HDMI_VCO_MAX_FREQ;
+	vco_optimal_index = -1;
+	vco_freq_index = 0;
+	for (i = 0; i < 15; i++) {
+		for (j = 0; j < 4; j++) {
+			u32 ratio_mult = ratio[i] << tx_band_sel[j];
+
+			vco = bclk >> half_rate_mode;
+			vco *= ratio_mult;
+			vco_freq[vco_freq_index++] = vco;
+		}
+	}
+
+	for (i = 0; i < 60; i++) {
+		u64 vco_tmp = vco_freq[i];
+
+		/* FIXME: use downstream convoluted code ? */
+		if ((vco_tmp >= HDMI_VCO_MIN_FREQ) &&
+		    (vco_tmp <= vco_optimal)) {
+			vco_optimal = vco_tmp;
+			vco_optimal_index = i;
+		}
+	}
+
+	if (vco_optimal_index == -1) {
+		if (!half_rate_mode) {
+			half_rate_mode = 1;
+			goto retry;
+		}
+	} else {
+		pd->vco_freq = vco_optimal;
+		pd->tx_band_sel = tx_band_sel[vco_optimal_index % 4];
+		pd->vco_ratio = ratio[vco_optimal_index / 4];
+		pd->hsclk_divsel = hs_divsel[vco_optimal_index / 4];
+
+		return 0;
+	}
+
+	return -EINVAL;
+}
+#else
+#define HDMI_REF_CLOCK_HZ ((u64)19200000)
+#define HDMI_MHZ_TO_HZ ((u64)1000000)
+static int pll_get_post_div(struct hdmi_8998_post_divider *pd, u64 bclk)
+{
+	u32 const ratio_list[] = {1, 2, 3, 4, 5, 6,
+				     9, 10, 12, 15, 25};
+	u32 const band_list[] = {0, 1, 2, 3};
+	u32 const sz_ratio = ARRAY_SIZE(ratio_list);
+	u32 const sz_band = ARRAY_SIZE(band_list);
+	u32 const cmp_cnt = 1024;
+	u32 const th_min = 500, th_max = 1000;
+	u32 half_rate_mode = 0;
+	u32 list_elements;
+	int optimal_index;
+	u32 i, j, k;
+	u32 found_hsclk_divsel = 0, found_vco_ratio;
+	u32 found_tx_band_sel;
+	u64 const min_freq = HDMI_VCO_MIN_FREQ, max_freq = HDMI_VCO_MAX_FREQ;
+	u64 freq_list[ARRAY_SIZE(ratio_list) * ARRAY_SIZE(band_list)];
+	u64 found_vco_freq;
+	u64 freq_optimal;
+
+find_optimal_index:
+	freq_optimal = max_freq;
+	optimal_index = -1;
+	list_elements = 0;
+
+	for (i = 0; i < sz_ratio; i++) {
+		for (j = 0; j < sz_band; j++) {
+			u64 freq = div_u64(bclk, (1 << half_rate_mode));
+
+			freq *= (ratio_list[i] * (1 << band_list[j]));
+			freq_list[list_elements++] = freq;
+		}
+	}
+
+	for (k = 0; k < ARRAY_SIZE(freq_list); k++) {
+		u32 const clks_pll_div = 2, core_clk_div = 5;
+		u32 const rng1 = 16, rng2 = 8;
+		u32 th1, th2;
+		u64 core_clk, rvar1, rem;
+
+		core_clk = (((freq_list[k] /
+			      ratio_list[k / sz_band]) /
+			      clks_pll_div) / core_clk_div);
+
+		rvar1 = HDMI_REF_CLOCK_HZ * rng1 * HDMI_MHZ_TO_HZ;
+		rvar1 = div64_u64_rem(rvar1, (cmp_cnt * core_clk), &rem);
+		if (rem > ((cmp_cnt * core_clk) >> 1))
+			rvar1++;
+		th1 = rvar1;
+
+		rvar1 = HDMI_REF_CLOCK_HZ * rng2 * HDMI_MHZ_TO_HZ;
+		rvar1 = div64_u64_rem(rvar1, (cmp_cnt * core_clk), &rem);
+		if (rem > ((cmp_cnt * core_clk) >> 1))
+			rvar1++;
+		th2 = rvar1;
+
+		if (freq_list[k] >= min_freq &&
+				freq_list[k] <= max_freq) {
+			if ((th1 >= th_min && th1 <= th_max) ||
+					(th2 >= th_min && th2 <= th_max)) {
+				if (freq_list[k] <= freq_optimal) {
+					freq_optimal = freq_list[k];
+					optimal_index = k;
+				}
+			}
+		}
+	}
+
+	if (optimal_index == -1) {
+		if (!half_rate_mode) {
+			half_rate_mode = 1;
+			goto find_optimal_index;
+		} else {
+			return -EINVAL;
+		}
+	} else {
+		found_vco_ratio = ratio_list[optimal_index / sz_band];
+		found_tx_band_sel = band_list[optimal_index % sz_band];
+		found_vco_freq = freq_optimal;
+	}
+
+	switch (found_vco_ratio) {
+	case 1:
+		found_hsclk_divsel = 15;
+		break;
+	case 2:
+		found_hsclk_divsel = 0;
+		break;
+	case 3:
+		found_hsclk_divsel = 4;
+		break;
+	case 4:
+		found_hsclk_divsel = 8;
+		break;
+	case 5:
+		found_hsclk_divsel = 12;
+		break;
+	case 6:
+		found_hsclk_divsel = 1;
+		break;
+	case 9:
+		found_hsclk_divsel = 5;
+		break;
+	case 10:
+		found_hsclk_divsel = 2;
+		break;
+	case 12:
+		found_hsclk_divsel = 9;
+		break;
+	case 15:
+		found_hsclk_divsel = 13;
+		break;
+	case 25:
+		found_hsclk_divsel = 14;
+		break;
+	};
+
+	pr_debug("found_vco_freq=%llu\n", found_vco_freq);
+	pr_debug("found_hsclk_divsel=%d\n", found_hsclk_divsel);
+	pr_debug("found_vco_ratio=%d\n", found_vco_ratio);
+	pr_debug("found_tx_band_sel=%d\n", found_tx_band_sel);
+	pr_debug("half_rate_mode=%d\n", half_rate_mode);
+	pr_debug("optimal_index=%d\n", optimal_index);
+
+	pd->vco_freq = found_vco_freq;
+	pd->tx_band_sel = found_tx_band_sel;
+	pd->vco_ratio = found_vco_ratio;
+	pd->hsclk_divsel = found_hsclk_divsel;
+
+	return 0;
+}
+#endif
+
+static int pll_calculate(unsigned long pix_clk, unsigned long ref_clk,
+			 struct hdmi_8998_phy_pll_reg_cfg *cfg)
+{
+	struct hdmi_8998_post_divider pd;
+	u64 bclk;
+	u64 tmds_clk;
+	u64 dec_start;
+	u64 frac_start;
+	u64 fdata;
+	u32 pll_divisor;
+	u32 rem;
+	u32 cpctrl;
+	u32 rctrl;
+	u32 cctrl;
+	u32 integloop_gain;
+	u32 pll_cmp;
+	int i, ret;
+
+	/* bit clk = 10 * pix_clk */
+	bclk = ((u64)pix_clk) * 10;
+
+	if (bclk > HDMI_HIGH_FREQ_BIT_CLK_THRESHOLD)
+		tmds_clk = pix_clk >> 2;
+	else
+		tmds_clk = pix_clk;
+
+	ret = pll_get_post_div(&pd, bclk);
+	if (ret)
+		return ret;
+
+	dec_start = pd.vco_freq;
+	pll_divisor = 4 * ref_clk;
+	do_div(dec_start, pll_divisor);
+
+	frac_start = pd.vco_freq * (1 << 20);
+
+	rem = do_div(frac_start, pll_divisor);
+	frac_start -= dec_start * (1 << 20);
+	if (rem > (pll_divisor >> 1))
+		frac_start++;
+
+	cpctrl = pll_get_cpctrl(frac_start, ref_clk, false);
+	rctrl = pll_get_rctrl(frac_start, false);
+	cctrl = pll_get_cctrl(frac_start, false);
+	integloop_gain = pll_get_integloop_gain(frac_start, bclk,
+						ref_clk, false);
+
+	fdata = pd.vco_freq;
+	do_div(fdata, pd.vco_ratio);
+
+	pll_cmp = pll_get_pll_cmp(fdata, ref_clk);
+
+	DBG("VCO freq: %llu", pd.vco_freq);
+	DBG("fdata: %llu", fdata);
+	DBG("pix_clk: %lu", pix_clk);
+	DBG("tmds clk: %llu", tmds_clk);
+	DBG("HSCLK_SEL: %d", pd.hsclk_divsel);
+	DBG("DEC_START: %llu", dec_start);
+	DBG("DIV_FRAC_START: %llu", frac_start);
+	DBG("PLL_CPCTRL: %u", cpctrl);
+	DBG("PLL_RCTRL: %u", rctrl);
+	DBG("PLL_CCTRL: %u", cctrl);
+	DBG("INTEGLOOP_GAIN: %u", integloop_gain);
+	DBG("TX_BAND: %d", pd.tx_band_sel);
+	DBG("PLL_CMP: %u", pll_cmp);
+
+	/* Convert these values to register specific values */
+	if (bclk > HDMI_DIG_FREQ_BIT_CLK_THRESHOLD)
+		cfg->com_svs_mode_clk_sel = 1;
+	else
+		cfg->com_svs_mode_clk_sel = 2;
+
+	cfg->com_hsclk_sel = (0x20 | pd.hsclk_divsel);
+	cfg->com_pll_cctrl_mode0 = cctrl;
+	cfg->com_pll_rctrl_mode0 = rctrl;
+	cfg->com_cp_ctrl_mode0 = cpctrl;
+	cfg->com_dec_start_mode0 = dec_start;
+	cfg->com_div_frac_start1_mode0 = (frac_start & 0xff);
+	cfg->com_div_frac_start2_mode0 = ((frac_start & 0xff00) >> 8);
+	cfg->com_div_frac_start3_mode0 = ((frac_start & 0xf0000) >> 16);
+	cfg->com_integloop_gain0_mode0 = (integloop_gain & 0xff);
+	cfg->com_integloop_gain1_mode0 = ((integloop_gain & 0xf00) >> 8);
+	cfg->com_lock_cmp1_mode0 = (pll_cmp & 0xff);
+	cfg->com_lock_cmp2_mode0 = ((pll_cmp & 0xff00) >> 8);
+	cfg->com_lock_cmp3_mode0 = ((pll_cmp & 0x30000) >> 16);
+	cfg->com_lock_cmp_en = 0x0;
+	cfg->com_core_clk_en = 0x2c;
+	cfg->com_coreclk_div_mode0 = HDMI_CORECLK_DIV;
+	cfg->phy_mode = (bclk > HDMI_HIGH_FREQ_BIT_CLK_THRESHOLD) ? 0x5 : 0x4;
+
+	for (i = 0; i < HDMI_NUM_TX_CHANNEL; i++)
+		cfg->tx_lx_tx_band[i] = pd.tx_band_sel;
+
+	if (bclk > HDMI_HIGH_FREQ_BIT_CLK_THRESHOLD) {
+		cfg->tx_lx_tx_drv_lvl[0] = 0x0f;
+		cfg->tx_lx_tx_drv_lvl[1] = 0x0f;
+		cfg->tx_lx_tx_drv_lvl[2] = 0x0f;
+		cfg->tx_lx_tx_drv_lvl[3] = 0x0f;
+		cfg->tx_lx_tx_emp_post1_lvl[0] = 0x03;
+		cfg->tx_lx_tx_emp_post1_lvl[1] = 0x02;
+		cfg->tx_lx_tx_emp_post1_lvl[2] = 0x03;
+		cfg->tx_lx_tx_emp_post1_lvl[3] = 0x00;
+		cfg->tx_lx_pre_driver_1[0] = 0x00;
+		cfg->tx_lx_pre_driver_1[1] = 0x00;
+		cfg->tx_lx_pre_driver_1[2] = 0x00;
+		cfg->tx_lx_pre_driver_1[3] = 0x00;
+		cfg->tx_lx_pre_driver_2[0] = 0x1C;
+		cfg->tx_lx_pre_driver_2[1] = 0x1C;
+		cfg->tx_lx_pre_driver_2[2] = 0x1C;
+		cfg->tx_lx_pre_driver_2[3] = 0x00;
+		cfg->tx_lx_res_code_offset[0] = 0x03;
+		cfg->tx_lx_res_code_offset[1] = 0x00;
+		cfg->tx_lx_res_code_offset[2] = 0x00;
+		cfg->tx_lx_res_code_offset[3] = 0x03;
+	} else if (bclk > HDMI_DIG_FREQ_BIT_CLK_THRESHOLD) {
+		cfg->tx_lx_tx_drv_lvl[0] = 0x0f;
+		cfg->tx_lx_tx_drv_lvl[1] = 0x0f;
+		cfg->tx_lx_tx_drv_lvl[2] = 0x0f;
+		cfg->tx_lx_tx_drv_lvl[3] = 0x0f;
+		cfg->tx_lx_tx_emp_post1_lvl[0] = 0x03;
+		cfg->tx_lx_tx_emp_post1_lvl[1] = 0x03;
+		cfg->tx_lx_tx_emp_post1_lvl[2] = 0x03;
+		cfg->tx_lx_tx_emp_post1_lvl[3] = 0x00;
+		cfg->tx_lx_pre_driver_1[0] = 0x00;
+		cfg->tx_lx_pre_driver_1[1] = 0x00;
+		cfg->tx_lx_pre_driver_1[2] = 0x00;
+		cfg->tx_lx_pre_driver_1[3] = 0x00;
+		cfg->tx_lx_pre_driver_2[0] = 0x16;
+		cfg->tx_lx_pre_driver_2[1] = 0x16;
+		cfg->tx_lx_pre_driver_2[2] = 0x16;
+		cfg->tx_lx_pre_driver_2[3] = 0x18;
+		cfg->tx_lx_res_code_offset[0] = 0x03;
+		cfg->tx_lx_res_code_offset[1] = 0x00;
+		cfg->tx_lx_res_code_offset[2] = 0x00;
+		cfg->tx_lx_res_code_offset[3] = 0x00;
+	} else if (bclk > HDMI_MID_FREQ_BIT_CLK_THRESHOLD) {
+		cfg->tx_lx_tx_drv_lvl[0] = 0x0f;
+		cfg->tx_lx_tx_drv_lvl[1] = 0x0f;
+		cfg->tx_lx_tx_drv_lvl[2] = 0x0f;
+		cfg->tx_lx_tx_drv_lvl[3] = 0x0f;
+		cfg->tx_lx_tx_emp_post1_lvl[0] = 0x05;
+		cfg->tx_lx_tx_emp_post1_lvl[1] = 0x05;
+		cfg->tx_lx_tx_emp_post1_lvl[2] = 0x05;
+		cfg->tx_lx_tx_emp_post1_lvl[3] = 0x00;
+		cfg->tx_lx_pre_driver_1[0] = 0x00;
+		cfg->tx_lx_pre_driver_1[1] = 0x00;
+		cfg->tx_lx_pre_driver_1[2] = 0x00;
+		cfg->tx_lx_pre_driver_1[3] = 0x00;
+		cfg->tx_lx_pre_driver_2[0] = 0x0E;
+		cfg->tx_lx_pre_driver_2[1] = 0x0E;
+		cfg->tx_lx_pre_driver_2[2] = 0x0E;
+		cfg->tx_lx_pre_driver_2[3] = 0x0E;
+		cfg->tx_lx_res_code_offset[0] = 0x00;
+		cfg->tx_lx_res_code_offset[1] = 0x00;
+		cfg->tx_lx_res_code_offset[2] = 0x00;
+		cfg->tx_lx_res_code_offset[3] = 0x00;
+	} else {
+		cfg->tx_lx_tx_drv_lvl[0] = 0x01;
+		cfg->tx_lx_tx_drv_lvl[1] = 0x01;
+		cfg->tx_lx_tx_drv_lvl[2] = 0x01;
+		cfg->tx_lx_tx_drv_lvl[3] = 0x00;
+		cfg->tx_lx_tx_emp_post1_lvl[0] = 0x00;
+		cfg->tx_lx_tx_emp_post1_lvl[1] = 0x00;
+		cfg->tx_lx_tx_emp_post1_lvl[2] = 0x00;
+		cfg->tx_lx_tx_emp_post1_lvl[3] = 0x00;
+		cfg->tx_lx_pre_driver_1[0] = 0x00;
+		cfg->tx_lx_pre_driver_1[1] = 0x00;
+		cfg->tx_lx_pre_driver_1[2] = 0x00;
+		cfg->tx_lx_pre_driver_1[3] = 0x00;
+		cfg->tx_lx_pre_driver_2[0] = 0x16;
+		cfg->tx_lx_pre_driver_2[1] = 0x16;
+		cfg->tx_lx_pre_driver_2[2] = 0x16;
+		cfg->tx_lx_pre_driver_2[3] = 0x18;
+		cfg->tx_lx_res_code_offset[0] = 0x00;
+		cfg->tx_lx_res_code_offset[1] = 0x00;
+		cfg->tx_lx_res_code_offset[2] = 0x00;
+		cfg->tx_lx_res_code_offset[3] = 0x00;
+	}
+
+	DBG("com_svs_mode_clk_sel = 0x%x", cfg->com_svs_mode_clk_sel);
+	DBG("com_hsclk_sel = 0x%x", cfg->com_hsclk_sel);
+	DBG("com_lock_cmp_en = 0x%x", cfg->com_lock_cmp_en);
+	DBG("com_pll_cctrl_mode0 = 0x%x", cfg->com_pll_cctrl_mode0);
+	DBG("com_pll_rctrl_mode0 = 0x%x", cfg->com_pll_rctrl_mode0);
+	DBG("com_cp_ctrl_mode0 = 0x%x", cfg->com_cp_ctrl_mode0);
+	DBG("com_dec_start_mode0 = 0x%x", cfg->com_dec_start_mode0);
+	DBG("com_div_frac_start1_mode0 = 0x%x", cfg->com_div_frac_start1_mode0);
+	DBG("com_div_frac_start2_mode0 = 0x%x", cfg->com_div_frac_start2_mode0);
+	DBG("com_div_frac_start3_mode0 = 0x%x", cfg->com_div_frac_start3_mode0);
+	DBG("com_integloop_gain0_mode0 = 0x%x", cfg->com_integloop_gain0_mode0);
+	DBG("com_integloop_gain1_mode0 = 0x%x", cfg->com_integloop_gain1_mode0);
+	DBG("com_lock_cmp1_mode0 = 0x%x", cfg->com_lock_cmp1_mode0);
+	DBG("com_lock_cmp2_mode0 = 0x%x", cfg->com_lock_cmp2_mode0);
+	DBG("com_lock_cmp3_mode0 = 0x%x", cfg->com_lock_cmp3_mode0);
+	DBG("com_core_clk_en = 0x%x", cfg->com_core_clk_en);
+	DBG("com_coreclk_div_mode0 = 0x%x", cfg->com_coreclk_div_mode0);
+	DBG("phy_mode = 0x%x", cfg->phy_mode);
+
+	for (i = 0; i < HDMI_NUM_TX_CHANNEL; i++) {
+		DBG("tx_l%d_tx_band = 0x%x", i, cfg->tx_lx_tx_band[i]);
+		DBG("tx_l%d_tx_drv_lvl = 0x%x", i, cfg->tx_lx_tx_drv_lvl[i]);
+		DBG("tx_l%d_tx_emp_post1_lvl = 0x%x", i,
+		    cfg->tx_lx_tx_emp_post1_lvl[i]);
+		DBG("tx_l%d_pre_driver_1 = 0x%x", i, cfg->tx_lx_pre_driver_1[i]);
+		DBG("tx_l%d_pre_driver_2 = 0x%x", i, cfg->tx_lx_pre_driver_2[i]);
+	}
+
+	return 0;
+}
+
+static int hdmi_8998_pll_set_clk_rate(struct clk_hw *hw, unsigned long rate,
+				      unsigned long parent_rate)
+{
+	struct hdmi_pll_8998 *pll = hw_clk_to_pll(hw);
+	struct hdmi_phy *phy = pll_get_phy(pll);
+	struct hdmi_8998_phy_pll_reg_cfg cfg;
+	int i, ret;
+
+	printk(KERN_INFO "hdmi_8998_pll_set_clk_rate %lu %lu\n", rate, parent_rate);
+
+	/* FIXME: support atomic update ? */
+
+	memset(&cfg, 0x00, sizeof(cfg));
+
+	ret = pll_calculate(rate, parent_rate, &cfg);
+	if (ret) {
+		DRM_ERROR("PLL calculation failed\n");
+		return ret;
+	}
+
+	/* Initially shut down PHY */
+	DBG("Disabling PHY");
+	hdmi_phy_write(phy, REG_HDMI_8998_PHY_PD_CTL, 0x0);
+	udelay(500);
+
+	/* Power up sequence */
+	DBG("Power up PHY");
+	hdmi_phy_write(phy, REG_HDMI_8998_PHY_PD_CTL, 0x1);
+	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_RESETSM_CNTRL, 0x20);
+	hdmi_phy_write(phy, REG_HDMI_8998_PHY_CMN_CTRL, 0x6);
+
+	for (i = 0; i < HDMI_NUM_TX_CHANNEL; i++) {
+		hdmi_tx_chan_write(pll, i,
+				   REG_HDMI_8998_PHY_TXn_INTERFACE_SELECT_TX_BAND,
+				   cfg.tx_lx_tx_band[i]);
+		hdmi_tx_chan_write(pll, i,
+				   REG_HDMI_8998_PHY_TXn_CLKBUF_TERM_ENABLE,
+				   0x1);
+		hdmi_tx_chan_write(pll, i,
+				   REG_HDMI_8998_PHY_TXn_LANE_MODE,
+				   0x20);
+	}
+
+	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_SYSCLK_BUF_ENABLE, 0x02);
+	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_BIAS_EN_CLKBUFLR_EN, 0x0B);
+	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_SYSCLK_EN_SEL, 0x37);
+	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_SYS_CLK_CTRL, 0x02);
+	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_CLK_ENABLE1, 0x0E);
+
+	/* Bypass VCO calibration */
+	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_SVS_MODE_CLK_SEL,
+		       cfg.com_svs_mode_clk_sel);
+
+	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_PLL_IVCO, 0x07);
+	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_VCO_TUNE_CTRL, 0x00);
+
+	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_CLK_SEL, 0x30);
+	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_HSCLK_SEL,
+		       cfg.com_hsclk_sel);
+	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_LOCK_CMP_EN,
+		       cfg.com_lock_cmp_en);
+
+	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_PLL_CCTRL_MODE0,
+		       cfg.com_pll_cctrl_mode0);
+	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_PLL_RCTRL_MODE0,
+		       cfg.com_pll_rctrl_mode0);
+	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_CP_CTRL_MODE0,
+		       cfg.com_cp_ctrl_mode0);
+	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_DEC_START_MODE0,
+		       cfg.com_dec_start_mode0);
+	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_DIV_FRAC_START1_MODE0,
+		       cfg.com_div_frac_start1_mode0);
+	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_DIV_FRAC_START2_MODE0,
+		       cfg.com_div_frac_start2_mode0);
+	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_DIV_FRAC_START3_MODE0,
+		       cfg.com_div_frac_start3_mode0);
+
+	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_INTEGLOOP_GAIN0_MODE0,
+		       cfg.com_integloop_gain0_mode0);
+	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_INTEGLOOP_GAIN1_MODE0,
+		       cfg.com_integloop_gain1_mode0);
+
+	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_LOCK_CMP1_MODE0,
+		       cfg.com_lock_cmp1_mode0);
+	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_LOCK_CMP2_MODE0,
+		       cfg.com_lock_cmp2_mode0);
+	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_LOCK_CMP3_MODE0,
+		       cfg.com_lock_cmp3_mode0);
+
+	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_VCO_TUNE_MAP, 0x00);
+	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_CORE_CLK_EN,
+		       cfg.com_core_clk_en);
+	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_CORECLK_DIV_MODE0,
+		       cfg.com_coreclk_div_mode0);
+
+	/* TX lanes setup (TX 0/1/2/3) */
+	for (i = 0; i < HDMI_NUM_TX_CHANNEL; i++) {
+		hdmi_tx_chan_write(pll, i,
+				   REG_HDMI_8998_PHY_TXn_DRV_LVL,
+				   cfg.tx_lx_tx_drv_lvl[i]);
+		hdmi_tx_chan_write(pll, i,
+				   REG_HDMI_8998_PHY_TXn_EMP_POST1_LVL,
+				   cfg.tx_lx_tx_emp_post1_lvl[i]);
+		hdmi_tx_chan_write(pll, i,
+				   REG_HDMI_8998_PHY_TXn_PRE_DRIVER_1,
+				   cfg.tx_lx_pre_driver_1[i]);
+		hdmi_tx_chan_write(pll, i,
+				   REG_HDMI_8998_PHY_TXn_PRE_DRIVER_2,
+				   cfg.tx_lx_pre_driver_2[i]);
+		hdmi_tx_chan_write(pll, i,
+				   REG_HDMI_8998_PHY_TXn_DRV_LVL_RES_CODE_OFFSET,
+				   cfg.tx_lx_res_code_offset[i]);
+	}
+
+	hdmi_phy_write(phy, REG_HDMI_8998_PHY_MODE, cfg.phy_mode);
+
+	for (i = 0; i < HDMI_NUM_TX_CHANNEL; i++) {
+		hdmi_tx_chan_write(pll, i,
+				   REG_HDMI_8998_PHY_TXn_LANE_CONFIG,
+				   0x10);
+	}
+
+	/*
+	 * Ensure that vco configuration gets flushed to hardware before
+	 * enabling the PLL
+	 */
+	wmb();
+
+	DBG("Powered up PHY");
+
+	pll->rate = rate;
+
+	return 0;
+}
+
+static int hdmi_8998_phy_ready_status(struct hdmi_phy *phy)
+{
+	u32 nb_tries = HDMI_PLL_POLL_MAX_READS;
+	unsigned long timeout = HDMI_PLL_POLL_TIMEOUT_US;
+	u32 status;
+	int phy_ready = 0;
+
+	DBG("Waiting for PHY ready");
+
+	while (nb_tries--) {
+		status = hdmi_phy_read(phy, REG_HDMI_8998_PHY_STATUS);
+		phy_ready = status & BIT(0);
+
+		if (phy_ready)
+			break;
+
+		udelay(timeout);
+	}
+
+	DBG("PHY is %sready", phy_ready ? "" : "*not* ");
+
+	return phy_ready;
+}
+
+static int hdmi_8998_pll_lock_status(struct hdmi_pll_8998 *pll)
+{
+	u32 status;
+	int nb_tries = HDMI_PLL_POLL_MAX_READS;
+	unsigned long timeout = HDMI_PLL_POLL_TIMEOUT_US;
+	int pll_locked = 0;
+
+	DBG("Waiting for PLL lock");
+
+	while (nb_tries--) {
+		status = hdmi_pll_read(pll,
+				       REG_HDMI_8998_PHY_QSERDES_COM_C_READY_STATUS);
+		pll_locked = status & BIT(0);
+
+		if (pll_locked)
+			break;
+
+		udelay(timeout);
+	}
+
+	DBG("HDMI PLL is %slocked", pll_locked ? "" : "*not* ");
+
+	return pll_locked;
+}
+
+static int hdmi_8998_pll_prepare(struct clk_hw *hw)
+{
+	struct hdmi_pll_8998 *pll = hw_clk_to_pll(hw);
+	struct hdmi_phy *phy = pll_get_phy(pll);
+	int i, ret = 0;
+
+	printk(KERN_INFO "hdmi_8998_pll_prepare\n");
+
+	hdmi_phy_write(phy, REG_HDMI_8998_PHY_CFG, 0x1);
+	udelay(100);
+
+	hdmi_phy_write(phy, REG_HDMI_8998_PHY_CFG, 0x59);
+	udelay(100);
+
+	ret = hdmi_8998_pll_lock_status(pll);
+	if (!ret)
+		return ret;
+
+	for (i = 0; i < HDMI_NUM_TX_CHANNEL; i++) {
+		hdmi_tx_chan_write(pll, i,
+				   REG_HDMI_8998_PHY_TXn_LANE_CONFIG, 0x1F);
+	}
+
+	/* Ensure all registers are flushed to hardware */
+	wmb();
+
+#if 0
+	// Not done downstream in 8998, needed ?
+	/* Disable SSC */
+	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_SSC_PER1, 0x0);
+	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_SSC_PER2, 0x0);
+	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_SSC_STEP_SIZE1, 0x0);
+	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_SSC_STEP_SIZE2, 0x0);
+	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_SSC_EN_CENTER, 0x0);
+#endif
+
+	ret = hdmi_8998_phy_ready_status(phy);
+	if (!ret)
+		return ret;
+
+	/* Restart the retiming buffer */
+	hdmi_phy_write(phy, REG_HDMI_8998_PHY_CFG, 0x58);
+	udelay(1);
+	hdmi_phy_write(phy, REG_HDMI_8998_PHY_CFG, 0x59);
+
+	/* Ensure all registers are flushed to hardware */
+	wmb();
+
+	return 0;
+}
+
+static long hdmi_8998_pll_round_rate(struct clk_hw *hw,
+				     unsigned long rate,
+				     unsigned long *parent_rate)
+{
+	if (rate < HDMI_PCLK_MIN_FREQ)
+		return HDMI_PCLK_MIN_FREQ;
+	else if (rate > HDMI_PCLK_MAX_FREQ)
+		return HDMI_PCLK_MAX_FREQ;
+	else
+		return rate;
+}
+
+static unsigned long hdmi_8998_pll_recalc_rate(struct clk_hw *hw,
+					       unsigned long parent_rate)
+{
+	struct hdmi_pll_8998 *pll = hw_clk_to_pll(hw);
+#if 0
+	// FIXME: this is bogus
+	u64 fdata;
+	u32 cmp1, cmp2, cmp3, pll_cmp;
+
+	printk(KERN_INFO "hdmi_8998_pll_recalc_rate %lu\n", parent_rate);
+
+	cmp1 = hdmi_pll_read(pll, REG_HDMI_8998_PHY_QSERDES_COM_LOCK_CMP1_MODE0);
+	cmp2 = hdmi_pll_read(pll, REG_HDMI_8998_PHY_QSERDES_COM_LOCK_CMP2_MODE0);
+	cmp3 = hdmi_pll_read(pll, REG_HDMI_8998_PHY_QSERDES_COM_LOCK_CMP3_MODE0);
+
+	pll_cmp = cmp1 | (cmp2 << 8) | (cmp3 << 16);
+
+	fdata = pll_cmp_to_fdata(pll_cmp + 1, parent_rate);
+
+	do_div(fdata, 10);
+
+	return fdata;
+#else
+	return pll->rate;
+#endif
+}
+
+static void hdmi_8998_pll_unprepare(struct clk_hw *hw)
+{
+	struct hdmi_pll_8998 *pll = hw_clk_to_pll(hw);
+	struct hdmi_phy *phy = pll_get_phy(pll);
+
+	printk(KERN_INFO "hdmi_8998_pll_unprepare\n");
+
+	hdmi_phy_write(phy, REG_HDMI_8998_PHY_PD_CTL, 0);
+	usleep_range(100, 150);
+}
+
+static int hdmi_8998_pll_is_enabled(struct clk_hw *hw)
+{
+	struct hdmi_pll_8998 *pll = hw_clk_to_pll(hw);
+	u32 status;
+	int pll_locked;
+
+	status = hdmi_pll_read(pll, REG_HDMI_8998_PHY_QSERDES_COM_C_READY_STATUS);
+	pll_locked = status & BIT(0);
+
+	return pll_locked;
+}
+
+static const struct clk_ops hdmi_8998_pll_ops = {
+	.set_rate = hdmi_8998_pll_set_clk_rate,
+	.round_rate = hdmi_8998_pll_round_rate,
+	.recalc_rate = hdmi_8998_pll_recalc_rate,
+	.prepare = hdmi_8998_pll_prepare,
+	.unprepare = hdmi_8998_pll_unprepare,
+	.is_enabled = hdmi_8998_pll_is_enabled,
+};
+
+static const struct clk_init_data pll_init = {
+	.name = "hdmipll",
+	.ops = &hdmi_8998_pll_ops,
+	.parent_data = (const struct clk_parent_data[]){
+		{ .fw_name = "xo", .name = "xo_board" },
+	},
+	.num_parents = 1,
+	.flags = CLK_IGNORE_UNUSED,
+};
+
+int msm_hdmi_pll_8998_init(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct hdmi_pll_8998 *pll;
+	int ret, i;
+
+	pll = devm_kzalloc(dev, sizeof(*pll), GFP_KERNEL);
+	if (!pll)
+		return -ENOMEM;
+
+	pll->pdev = pdev;
+
+	pll->mmio_qserdes_com = msm_ioremap(pdev, "hdmi_pll");
+	if (IS_ERR(pll->mmio_qserdes_com)) {
+		DRM_DEV_ERROR(dev, "failed to map pll base\n");
+		return -ENOMEM;
+	}
+
+	for (i = 0; i < HDMI_NUM_TX_CHANNEL; i++) {
+		char name[32];
+
+		snprintf(name, sizeof(name), "hdmi_tx_l%d", i);
+
+		pll->mmio_qserdes_tx[i] = msm_ioremap(pdev, name);
+		if (IS_ERR(pll->mmio_qserdes_tx[i])) {
+			DRM_DEV_ERROR(dev, "failed to map pll base\n");
+			return -ENOMEM;
+		}
+	}
+	pll->clk_hw.init = &pll_init;
+
+	ret = devm_clk_hw_register(dev, &pll->clk_hw);
+	if (ret) {
+		DRM_DEV_ERROR(dev, "failed to register pll clock\n");
+		return ret;
+	}
+
+	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, &pll->clk_hw);
+	if (ret) {
+		DRM_DEV_ERROR(dev, "failed to register clk provider: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static const char * const hdmi_phy_8998_reg_names[] = {
+	"vdda-pll",
+	"vdda-phy",
+};
+
+static const char * const hdmi_phy_8998_clk_names[] = {
+	"iface", "ref", "ref_src",
+};
+
+const struct hdmi_phy_cfg msm_hdmi_phy_8998_cfg = {
+	.type = MSM_HDMI_PHY_8998,
+	.reg_names = hdmi_phy_8998_reg_names,
+	.num_regs = ARRAY_SIZE(hdmi_phy_8998_reg_names),
+	.clk_names = hdmi_phy_8998_clk_names,
+	.num_clks = ARRAY_SIZE(hdmi_phy_8998_clk_names),
+};
-- 
2.34.1

