Return-Path: <linux-arm-msm+bounces-77191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DFEE5BD945A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 14:12:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0559718A3742
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 12:12:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8128031280D;
	Tue, 14 Oct 2025 12:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="oXzcrXgm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D4A31282E
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 12:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760443896; cv=none; b=tzCFD1sSlel2ki2h0IiMFk4W+8zf5EECfQVl5j5ircbsDWt/gDHgzmHYjA6NKfVkpp/aFY1YlC5Sqa26EJyyxwJ1kq68DW0S+lhBxx82gzL3aQfW8r9se/BjX48LXRw0mxs10Ehe6JRyZQFacpCTfr9wJcrA5RNt9Y/jeTuLN/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760443896; c=relaxed/simple;
	bh=h5OUnC0qS1XyOkwz0rbMd9zjA2g5kjfcThDxR8eek/Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=UM0TSwmEIY8owwlpLqkKHMCZq+MxM2EEKf7kxs6SALKx9cJLkMQd/j+IDaYzwb42pJOv5PTt5aEpitoI6+KxZ2mVgqqC0SAXbt7rmv9Tsao+Jk2FAfhUKgV2o1ogkAT2ERM9ogNHB4hGblRSLAApHGSZaktcDYUIQHUiM9cKRHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=oXzcrXgm; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b3d196b7eeeso839540966b.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 05:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1760443889; x=1761048689; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TMsvvNxUXmnvKGYayr5xM294MMb/IoJ0IjM92sbPoFI=;
        b=oXzcrXgmrCDRGvmrRSJnHHbOZjifFYFc2o7Kk22vmURU5q12kV78QS5VrZzpjMNV9y
         ooz9XAxpDwOrOGA58LlAgk8JXm+pQRyleGm/a4f5pBXP3/0zDHfw53+SS0VvsTCWstxx
         xar22NpEZL3O7gmq0ymKttCDxga/wz9nP6xSmNPoovWlrnC1HRQjXq4ytUkhmOpkssA8
         /PrEnnY90J7tJGNYv5kdbmFKJdpXOcwXXyhpfaTt/ew1phTUMk++SvptRldAQS3ycDW3
         SGWEVX4uVA4xAkAS+37VYguKuJNndx6P3qjFKiujQUkTLmgKNMVSqgg9AN0uPlR5hiLF
         ewBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760443889; x=1761048689;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TMsvvNxUXmnvKGYayr5xM294MMb/IoJ0IjM92sbPoFI=;
        b=d0upA7uAXuhsWcS1RJRtTt3asbSqgoHQcof5gRStyW+cQx0RTl/FQsLZ/zExZGPcVI
         fooNUiRXNtTW8QjPy3CNTYZkaem7CYXojGSw1tDIXNJMV3OeqF129Q2eGQoY3H+eFiOG
         w0F3r3B+UsUX2pI+2w87ctf3Am91cdRJlAWkif2wbn+AI8Zds7Q/NbBRh1D9TOO0ZwaB
         E5v+9rQmMet1PAiFemkW/nayLPRd/Sx28B5EgRiXN8NUxakeRrdtgBVZ4lA8KIaOk+My
         snD8LtwtV/09nRJarxbXAUWkIqTTJ5cLZ+MxcDSinnW3TFN6gXK6AUR2agMKdlG8VdYA
         hhTA==
X-Forwarded-Encrypted: i=1; AJvYcCUBzIZP18GXAzHWV2oHpPNK5iuZHq26irXbH+JJMUJbwatkACYvnSz8ABuqGDwp7k3FCieaKqGob7w754lL@vger.kernel.org
X-Gm-Message-State: AOJu0YxkALCqi0fXO2L7F7rzZgASxPNeJtX2zVqkyX4B4zlWk5PdAts+
	wah+HWAZgdbb0djSuvKfdkr88IE4SiNTyK+82ByolSiHr6n//6yw+l3uJNSVSpmCRC0=
X-Gm-Gg: ASbGncukZn27LThUl8Q27Z4tL/UuH89Tv8RkuDT3uyaHxiYRZLwO7jsrG1WB4kTkiR8
	6Mg/jhYDYFgIvx2M4yQxO0XvSnJEAZji83zDudV6tA5n2WzIiHHmwK6eGd6XeN4sPiDimayM9PL
	LocIfRLiR0K9OrEmt8sVqRmeLEsO4jfjbLo2i6DM5V7Na8XgSm3WLYX6tDKl/a7hwgXr+imrgmj
	Y7nps3vBTj6uxvJEYglRWD+O0ZybljUaPrW5/B/O9auVnQW+/fR4OBpPJs3a7BWjoCqaYIvFEpb
	C0y6vA9XCRUL2Q3lrSw/gBah39s4oWtIZywijk37cLUHze+rUKXCxYHHACoUAysBeyJQIehr5Zv
	j8mL1fR2aAHnbTKijLWk5qW9r2loOoSNQEPii5DeSl1praeK20p4Da45xC4m2XMnw3UCj6pK0Rd
	bJ1FVRbqwUSp6WrMRi8naJ2HA=
X-Google-Smtp-Source: AGHT+IELJS/VgypvwZW3x15YFnjuVZsztTcNQMZAL82gjJINOSASLLTt97YgOiFDqSjEkK/zD14XKQ==
X-Received: by 2002:a17:906:4788:b0:b0c:fdb7:4df5 with SMTP id a640c23a62f3a-b50aa08f7f4mr2795931866b.18.1760443888992;
        Tue, 14 Oct 2025 05:11:28 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d8c124a8sm1137870666b.51.2025.10.14.05.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 05:11:28 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 14 Oct 2025 14:11:18 +0200
Subject: [PATCH] arm64: defconfig: Enable configs for Fairphone 3, 4, 5
 smartphones
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-arm64-defconfig-fp345-v1-1-53fe1eeb598d@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAOU97mgC/x3MQQqAIBBA0avIrBtQs5CuEi1iHGsWWShEIN09a
 fkW/1conIULTKpC5luKnKnBdApoX9PGKKEZrLaD0cbhmo/RYeBIZ4qyYbx6N2DomVjTaMh7aO2
 VOcrzf+flfT+w4o5PZwAAAA==
X-Change-ID: 20251014-arm64-defconfig-fp345-d3ece0c61c88
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760443887; l=6339;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=h5OUnC0qS1XyOkwz0rbMd9zjA2g5kjfcThDxR8eek/Y=;
 b=deFmsDMb3hA9OV2nip8NJEM7jqpCU5NQmHJss5z5D0EMbjhCjVDZl1lJyk+DKb/IyHzUXSsJ1
 wDYP1Z7dINBCr0OdBz/nIfkdIwjViGrHtogISKWU3DfEOipM+LpvVf4
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Enable base options for MSM8953 and SM6350 SoCs and device-specific
options which are used on the Fairphone 3, Fairphone 4 and Fairphone 5.

* MSM8953 SoC
    MSM_GCC_8953, INTERCONNECT_QCOM_MSM8953
* Fairphone 3
    NFC_NXP_NCI*, TOUCHSCREEN_HIMAX_HX83112B, DRM_PANEL_HIMAX_HX83112B

* SM6350 SoC
    SM_CAMCC_6350, SM_DISPCC_6350, SM_GCC_6350, SM_GPUCC_6350,
    SM_VIDEOCC_6350, INTERCONNECT_QCOM_SM6350
* Fairphone 4
    DRM_PANEL_HIMAX_HX83112A

* Fairphone 5
    DRM_PANEL_RAYDIUM_RM692E5, TYPEC_MUX_PTN36502, INPUT_AW86927

* QCOM PMICs (used on multiple of the devices)
    BACKLIGHT_QCOM_WLED, MFD_QCOM_PM8008, REGULATOR_QCOM_PM8008,
    LEDS_CLASS_FLASH, LEDS_QCOM_FLASH

* USB audio offloading (enabled on Fairphone 4 & 5)
    SND_USB_AUDIO*, SND_SOC_USB, SND_SOC_QDSP6_USB, USB_XHCI_SIDEBAND

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/configs/defconfig | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e3a2d37bd104..90a26dce8639 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -211,6 +211,8 @@ CONFIG_NET_9P=y
 CONFIG_NET_9P_VIRTIO=y
 CONFIG_NFC=m
 CONFIG_NFC_NCI=m
+CONFIG_NFC_NXP_NCI=m
+CONFIG_NFC_NXP_NCI_I2C=m
 CONFIG_NFC_S3FWRN5_I2C=m
 CONFIG_PCI=y
 CONFIG_PCIEPORTBUS=y
@@ -465,7 +467,9 @@ CONFIG_TOUCHSCREEN_GOODIX=m
 CONFIG_TOUCHSCREEN_GOODIX_BERLIN_SPI=m
 CONFIG_TOUCHSCREEN_ELAN=m
 CONFIG_TOUCHSCREEN_EDT_FT5X06=m
+CONFIG_TOUCHSCREEN_HIMAX_HX83112B=m
 CONFIG_INPUT_MISC=y
+CONFIG_INPUT_AW86927=m
 CONFIG_INPUT_BBNSM_PWRKEY=m
 CONFIG_INPUT_PM8941_PWRKEY=y
 CONFIG_INPUT_PM8XXX_VIBRATOR=m
@@ -803,6 +807,7 @@ CONFIG_MFD_STM32_LPTIMER=m
 CONFIG_MFD_STM32_TIMERS=m
 CONFIG_MFD_WCD934X=m
 CONFIG_MFD_KHADAS_MCU=m
+CONFIG_MFD_QCOM_PM8008=m
 CONFIG_REGULATOR_FIXED_VOLTAGE=y
 CONFIG_REGULATOR_AXP20X=y
 CONFIG_REGULATOR_BD718XX=y
@@ -828,6 +833,7 @@ CONFIG_REGULATOR_PCA9450=y
 CONFIG_REGULATOR_PF8X00=y
 CONFIG_REGULATOR_PFUZE100=y
 CONFIG_REGULATOR_PWM=y
+CONFIG_REGULATOR_QCOM_PM8008=m
 CONFIG_REGULATOR_QCOM_REFGEN=m
 CONFIG_REGULATOR_QCOM_RPMH=y
 CONFIG_REGULATOR_QCOM_SMD_RPM=y
@@ -934,11 +940,14 @@ CONFIG_DRM_PANEL_LVDS=m
 CONFIG_DRM_PANEL_SIMPLE=m
 CONFIG_DRM_PANEL_EDP=m
 CONFIG_DRM_PANEL_HIMAX_HX8279=m
+CONFIG_DRM_PANEL_HIMAX_HX83112A=m
+CONFIG_DRM_PANEL_HIMAX_HX83112B=m
 CONFIG_DRM_PANEL_ILITEK_ILI9882T=m
 CONFIG_DRM_PANEL_KHADAS_TS050=m
 CONFIG_DRM_PANEL_MANTIX_MLAF057WE51=m
 CONFIG_DRM_PANEL_NOVATEK_NT36672E=m
 CONFIG_DRM_PANEL_RAYDIUM_RM67191=m
+CONFIG_DRM_PANEL_RAYDIUM_RM692E5=m
 CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20=m
 CONFIG_DRM_PANEL_SITRONIX_ST7703=m
 CONFIG_DRM_PANEL_STARTEK_KD070FHFID015=m
@@ -992,6 +1001,7 @@ CONFIG_FB=y
 CONFIG_FB_EFI=y
 CONFIG_FB_MODE_HELPERS=y
 CONFIG_BACKLIGHT_PWM=m
+CONFIG_BACKLIGHT_QCOM_WLED=m
 CONFIG_BACKLIGHT_LP855X=m
 CONFIG_LOGO=y
 # CONFIG_LOGO_LINUX_MONO is not set
@@ -1001,7 +1011,10 @@ CONFIG_SND=m
 CONFIG_SND_ALOOP=m
 CONFIG_SND_HDA_TEGRA=m
 CONFIG_SND_HDA_CODEC_HDMI=m
+CONFIG_SND_USB_AUDIO=m
+CONFIG_SND_USB_AUDIO_QMI=m
 CONFIG_SND_SOC=m
+CONFIG_SND_SOC_USB=m
 CONFIG_SND_BCM2835_SOC_I2S=m
 CONFIG_SND_SOC_FSL_ASRC=m
 CONFIG_SND_SOC_FSL_MICFIL=m
@@ -1025,6 +1038,7 @@ CONFIG_SND_MESON_AXG_SOUND_CARD=m
 CONFIG_SND_MESON_GX_SOUND_CARD=m
 CONFIG_SND_SOC_QCOM=m
 CONFIG_SND_SOC_APQ8016_SBC=m
+CONFIG_SND_SOC_QDSP6_USB=m
 CONFIG_SND_SOC_MSM8996=m
 CONFIG_SND_SOC_SDM845=m
 CONFIG_SND_SOC_SM8250=m
@@ -1117,6 +1131,7 @@ CONFIG_USB_OTG=y
 CONFIG_USB_XHCI_HCD=y
 CONFIG_USB_XHCI_PCI_RENESAS=m
 CONFIG_USB_XHCI_RZV2M=y
+CONFIG_USB_XHCI_SIDEBAND=y
 CONFIG_USB_XHCI_TEGRA=y
 CONFIG_USB_BRCMSTB=m
 CONFIG_USB_EHCI_HCD=y
@@ -1188,6 +1203,7 @@ CONFIG_TYPEC_MUX_GPIO_SBU=m
 CONFIG_TYPEC_MUX_IT5205=m
 CONFIG_TYPEC_MUX_NB7VPQ904M=m
 CONFIG_TYPEC_MUX_PS883X=m
+CONFIG_TYPEC_MUX_PTN36502=m
 CONFIG_TYPEC_MUX_WCD939X_USBSS=m
 CONFIG_TYPEC_DP_ALTMODE=m
 CONFIG_MMC=y
@@ -1232,12 +1248,14 @@ CONFIG_SCSI_UFS_EXYNOS=y
 CONFIG_SCSI_UFS_ROCKCHIP=y
 CONFIG_NEW_LEDS=y
 CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_CLASS_FLASH=m
 CONFIG_LEDS_CLASS_MULTICOLOR=m
 CONFIG_LEDS_LM3692X=m
 CONFIG_LEDS_PCA9532=m
 CONFIG_LEDS_GPIO=y
 CONFIG_LEDS_PWM=y
 CONFIG_LEDS_SYSCON=y
+CONFIG_LEDS_QCOM_FLASH=m
 CONFIG_LEDS_QCOM_LPG=m
 CONFIG_LEDS_TRIGGER_TIMER=y
 CONFIG_LEDS_TRIGGER_DISK=y
@@ -1386,6 +1404,7 @@ CONFIG_IPQ_GCC_8074=y
 CONFIG_IPQ_GCC_9574=y
 CONFIG_IPQ_NSSCC_9574=m
 CONFIG_MSM_GCC_8916=y
+CONFIG_MSM_GCC_8953=y
 CONFIG_MSM_MMCC_8994=m
 CONFIG_MSM_GCC_8994=y
 CONFIG_MSM_GCC_8996=y
@@ -1425,22 +1444,26 @@ CONFIG_SDM_VIDEOCC_845=y
 CONFIG_SDM_DISPCC_845=y
 CONFIG_SDM_LPASSCC_845=m
 CONFIG_SDX_GCC_75=y
+CONFIG_SM_CAMCC_6350=m
 CONFIG_SM_CAMCC_8250=m
 CONFIG_SM_CAMCC_8550=m
 CONFIG_SM_CAMCC_8650=m
 CONFIG_SM_DISPCC_6115=m
 CONFIG_SM_DISPCC_8250=y
+CONFIG_SM_DISPCC_6350=m
 CONFIG_SM_DISPCC_8450=m
 CONFIG_SM_DISPCC_8550=m
 CONFIG_SM_DISPCC_8750=m
 CONFIG_SM_GCC_4450=y
 CONFIG_SM_GCC_6115=y
+CONFIG_SM_GCC_6350=y
 CONFIG_SM_GCC_8350=y
 CONFIG_SM_GCC_8450=y
 CONFIG_SM_GCC_8550=y
 CONFIG_SM_GCC_8650=y
 CONFIG_SM_GCC_8750=y
 CONFIG_SM_GPUCC_6115=m
+CONFIG_SM_GPUCC_6350=m
 CONFIG_SM_GPUCC_8150=y
 CONFIG_SM_GPUCC_8250=y
 CONFIG_SM_GPUCC_8350=m
@@ -1451,6 +1474,7 @@ CONFIG_SM_TCSRCC_8550=y
 CONFIG_SM_TCSRCC_8650=y
 CONFIG_SM_TCSRCC_8750=m
 CONFIG_SA_VIDEOCC_8775P=m
+CONFIG_SM_VIDEOCC_6350=m
 CONFIG_SM_VIDEOCC_8250=y
 CONFIG_SM_VIDEOCC_8550=m
 CONFIG_QCOM_HFPLL=y
@@ -1719,6 +1743,7 @@ CONFIG_INTERCONNECT_IMX8MQ=m
 CONFIG_INTERCONNECT_IMX8MP=y
 CONFIG_INTERCONNECT_QCOM=y
 CONFIG_INTERCONNECT_QCOM_MSM8916=m
+CONFIG_INTERCONNECT_QCOM_MSM8953=y
 CONFIG_INTERCONNECT_QCOM_MSM8996=y
 CONFIG_INTERCONNECT_QCOM_OSM_L3=m
 CONFIG_INTERCONNECT_QCOM_QCM2290=y
@@ -1734,6 +1759,7 @@ CONFIG_INTERCONNECT_QCOM_SC8280XP=y
 CONFIG_INTERCONNECT_QCOM_SDM845=y
 CONFIG_INTERCONNECT_QCOM_SDX75=y
 CONFIG_INTERCONNECT_QCOM_SM6115=y
+CONFIG_INTERCONNECT_QCOM_SM6350=y
 CONFIG_INTERCONNECT_QCOM_SM8150=y
 CONFIG_INTERCONNECT_QCOM_SM8250=y
 CONFIG_INTERCONNECT_QCOM_SM8350=y

---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251014-arm64-defconfig-fp345-d3ece0c61c88

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


