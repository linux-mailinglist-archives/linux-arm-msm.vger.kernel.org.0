Return-Path: <linux-arm-msm+bounces-111948-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id R3zcIIYIJ2onqgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111948-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 20:23:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 158FE659ACF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 20:23:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=kVujId1O;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111948-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111948-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E4E831FD04A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 18:01:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D444E3D47D9;
	Mon,  8 Jun 2026 18:01:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81AE3381AEA;
	Mon,  8 Jun 2026 18:01:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780941690; cv=none; b=U9CbjeXwhLfncy2cQWH+nc+rsdxO3fMA3wIOwVARq83GGUYDM3fRaP6/UAIfzB3uLwCQzWwLl11yISn1pF5NdETgzKVGb5vMhdhrBrcF/b8UZOArxXYjIyAKTnzFtFtZG3Deeuh+cLV16EC6Tj7S417aRDgk9vb6yvfsZ7UfsJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780941690; c=relaxed/simple;
	bh=i6LVEATDVcFj/fgp0J6dHvawDKwQBX5hiEAkWSx+yIc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pt2RabdyK+Q9cqzZGku0iGfmgnnygIaBKl7ZBI2r075pMSyD9ota8jssZkDgOA5tgWQOjptXkEznyg/H9ZGCIpcyZKZDns8Bp/cz95WovfNJhdMGIfHYjFsQyhRIsgJRRNLSIWZj4fpL6+Mg0TnJF/YkpTOW8gpWa5jfRiliR28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kVujId1O; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9E5B1F00898;
	Mon,  8 Jun 2026 18:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780941689;
	bh=6t9kkdnggwp6fUfxOmyPAAOrt4ejtitYpOM1vPhKfso=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kVujId1O5U/5f3Fq1jOeVjUxIplNlzsUjceV/aGhOAHD/OiK2+Ly3DmG4QUR4H48Q
	 YZFj2zcSBgvGu9O7ZlqdLFJIJ97hpgPOzz8SA9sSI6FpTH50oE53wsKg9btoCYgBLw
	 Af3IcikRS/OCrLICX/+e7CDJs2GicWVhGRm2GCStiYkFb07ogrg0gi7EoBQqNIdVIB
	 K+0TVy10mn8h7aPxFa2ZQtOOi/cFt819Cj03f67nu7ZFthrYm7Z6xsATkULYaS4H57
	 kqM+rzrsT5BPx6nUWg6DrPhgyKRg+LrmitAjvi1JrdJziTXtpn7RzN3UMAsZ059G2t
	 /ZaaStehGATGw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Om Prakash Singh <quic_omprsing@quicinc.com>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	Olivia Mackall <olivia@selenic.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 4/4] hwrng: qcom - Move qcom-rng.c into drivers/char/hw_random/
Date: Mon,  8 Jun 2026 17:58:48 +0000
Message-ID: <20260608175848.2045229-5-ebiggers@kernel.org>
X-Mailer: git-send-email 2.54.0.1064.gd145956f57-goog
In-Reply-To: <20260608175848.2045229-1-ebiggers@kernel.org>
References: <20260608175848.2045229-1-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-111948-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER(0.00)[ebiggers@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:linux-crypto@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:quic_omprsing@quicinc.com,m:quic_bjorande@quicinc.com,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:olivia@selenic.com,m:ebiggers@kernel.org,m:neeraj.soni@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ebiggers@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 158FE659ACF

Since this file just implements a hwrng driver, move it into
drivers/char/hw_random/.  Rename the kconfig option accordingly as well.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/arm/configs/multi_v7_defconfig           |  2 +-
 arch/arm/configs/qcom_defconfig               |  2 +-
 arch/arm64/configs/defconfig                  |  2 +-
 drivers/char/hw_random/Kconfig                | 11 +++++++++++
 drivers/char/hw_random/Makefile               |  1 +
 drivers/{crypto => char/hw_random}/qcom-rng.c |  0
 drivers/crypto/Kconfig                        | 11 -----------
 drivers/crypto/Makefile                       |  1 -
 drivers/gpu/drm/ci/arm64.config               |  2 +-
 9 files changed, 16 insertions(+), 16 deletions(-)
 rename drivers/{crypto => char/hw_random}/qcom-rng.c (100%)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index bcc9aabc1202..a3c612a9d423 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -404,10 +404,11 @@ CONFIG_SERIAL_DEV_BUS=y
 CONFIG_VIRTIO_CONSOLE=y
 CONFIG_ASPEED_KCS_IPMI_BMC=m
 CONFIG_ASPEED_BT_IPMI_BMC=m
 CONFIG_HW_RANDOM=y
 CONFIG_HW_RANDOM_ST=y
+CONFIG_HW_RANDOM_QCOM=m
 CONFIG_TCG_TPM=m
 CONFIG_TCG_TIS_I2C_INFINEON=m
 CONFIG_I2C_CHARDEV=y
 CONFIG_I2C_ARB_GPIO_CHALLENGE=m
 CONFIG_I2C_MUX_GPIO=y
@@ -1334,11 +1335,10 @@ CONFIG_CRYPTO_DEV_S5P=m
 CONFIG_CRYPTO_DEV_ATMEL_AES=m
 CONFIG_CRYPTO_DEV_ATMEL_TDES=m
 CONFIG_CRYPTO_DEV_ATMEL_SHA=m
 CONFIG_CRYPTO_DEV_MARVELL_CESA=m
 CONFIG_CRYPTO_DEV_QCE=m
-CONFIG_CRYPTO_DEV_QCOM_RNG=m
 CONFIG_CRYPTO_DEV_ROCKCHIP=m
 CONFIG_CRYPTO_DEV_STM32_HASH=m
 CONFIG_CRYPTO_DEV_STM32_CRYP=m
 CONFIG_CMA_SIZE_MBYTES=64
 CONFIG_PRINTK_TIME=y
diff --git a/arch/arm/configs/qcom_defconfig b/arch/arm/configs/qcom_defconfig
index 29a1dea500f0..d57554971c03 100644
--- a/arch/arm/configs/qcom_defconfig
+++ b/arch/arm/configs/qcom_defconfig
@@ -115,10 +115,11 @@ CONFIG_SERIO_LIBPS2=y
 # CONFIG_LEGACY_PTYS is not set
 CONFIG_SERIAL_MSM=y
 CONFIG_SERIAL_MSM_CONSOLE=y
 CONFIG_SERIAL_DEV_BUS=y
 CONFIG_HW_RANDOM=y
+CONFIG_HW_RANDOM_QCOM=m
 CONFIG_I2C=y
 CONFIG_I2C_CHARDEV=y
 CONFIG_I2C_QUP=y
 CONFIG_SPI=y
 CONFIG_SPI_QUP=y
@@ -309,11 +310,10 @@ CONFIG_CRYPTO_USER=m
 CONFIG_CRYPTO_USER_API=m
 CONFIG_CRYPTO_USER_API_HASH=m
 CONFIG_CRYPTO_USER_API_SKCIPHER=m
 CONFIG_CRYPTO_USER_API_RNG=m
 CONFIG_CRYPTO_USER_API_AEAD=m
-CONFIG_CRYPTO_DEV_QCOM_RNG=m
 CONFIG_DMA_CMA=y
 CONFIG_CMA_SIZE_MBYTES=64
 CONFIG_PRINTK_TIME=y
 CONFIG_DYNAMIC_DEBUG=y
 CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index d905a0777f93..bb930cce7233 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -548,10 +548,11 @@ CONFIG_VIRTIO_CONSOLE=y
 CONFIG_IPMI_HANDLER=m
 CONFIG_IPMI_DEVICE_INTERFACE=m
 CONFIG_IPMI_SI=m
 CONFIG_HW_RANDOM=y
 CONFIG_HW_RANDOM_VIRTIO=y
+CONFIG_HW_RANDOM_QCOM=m
 CONFIG_TCG_TPM=y
 CONFIG_TCG_TIS=m
 CONFIG_TCG_TIS_SPI=m
 CONFIG_TCG_TIS_SPI_CR50=y
 CONFIG_TCG_TIS_I2C_CR50=m
@@ -1951,11 +1952,10 @@ CONFIG_CRYPTO_AES_ARM64_BS=m
 CONFIG_CRYPTO_AES_ARM64_CE_CCM=y
 CONFIG_CRYPTO_DEV_SUN8I_CE=m
 CONFIG_CRYPTO_DEV_FSL_CAAM=m
 CONFIG_CRYPTO_DEV_FSL_DPAA2_CAAM=m
 CONFIG_CRYPTO_DEV_QCE=m
-CONFIG_CRYPTO_DEV_QCOM_RNG=m
 CONFIG_CRYPTO_DEV_TEGRA=m
 CONFIG_CRYPTO_DEV_XILINX_TRNG=m
 CONFIG_CRYPTO_DEV_ZYNQMP_AES=m
 CONFIG_CRYPTO_DEV_ZYNQMP_SHA3=m
 CONFIG_CRYPTO_DEV_CCREE=m
diff --git a/drivers/char/hw_random/Kconfig b/drivers/char/hw_random/Kconfig
index 492a2a61a65b..7102e03dcf0a 100644
--- a/drivers/char/hw_random/Kconfig
+++ b/drivers/char/hw_random/Kconfig
@@ -613,10 +613,21 @@ config HW_RANDOM_ROCKCHIP
 	  To compile this driver as a module, choose M here: the
 	  module will be called rockchip-rng.
 
 	  If unsure, say Y.
 
+config HW_RANDOM_QCOM
+	tristate "Qualcomm True Random Number Generator Driver"
+	depends on ARCH_QCOM || COMPILE_TEST
+	depends on HW_RANDOM
+	help
+	  This driver provides support for the True Random Number
+	  Generator hardware found on some Qualcomm SoCs.
+
+	  To compile this driver as a module, choose M here. The
+	  module will be called qcom-rng. If unsure, say N.
+
 endif # HW_RANDOM
 
 config UML_RANDOM
 	depends on UML
 	select HW_RANDOM
diff --git a/drivers/char/hw_random/Makefile b/drivers/char/hw_random/Makefile
index b9132b3f5d21..605ba8df5a8f 100644
--- a/drivers/char/hw_random/Makefile
+++ b/drivers/char/hw_random/Makefile
@@ -50,5 +50,6 @@ obj-$(CONFIG_HW_RANDOM_XIPHERA) += xiphera-trng.o
 obj-$(CONFIG_HW_RANDOM_ARM_SMCCC_TRNG) += arm_smccc_trng.o
 obj-$(CONFIG_HW_RANDOM_CN10K) += cn10k-rng.o
 obj-$(CONFIG_HW_RANDOM_POLARFIRE_SOC) += mpfs-rng.o
 obj-$(CONFIG_HW_RANDOM_ROCKCHIP) += rockchip-rng.o
 obj-$(CONFIG_HW_RANDOM_JH7110) += jh7110-trng.o
+obj-$(CONFIG_HW_RANDOM_QCOM) += qcom-rng.o
diff --git a/drivers/crypto/qcom-rng.c b/drivers/char/hw_random/qcom-rng.c
similarity index 100%
rename from drivers/crypto/qcom-rng.c
rename to drivers/char/hw_random/qcom-rng.c
diff --git a/drivers/crypto/Kconfig b/drivers/crypto/Kconfig
index a12cd677467b..07f0fa3341fc 100644
--- a/drivers/crypto/Kconfig
+++ b/drivers/crypto/Kconfig
@@ -654,21 +654,10 @@ config CRYPTO_DEV_QCE_SW_MAX_LEN
 
 	  Note that 192-bit keys are not supported by the hardware and are
 	  always processed by the software fallback, and all DES requests
 	  are done by the hardware.
 
-config CRYPTO_DEV_QCOM_RNG
-	tristate "Qualcomm Random Number Generator Driver"
-	depends on ARCH_QCOM || COMPILE_TEST
-	depends on HW_RANDOM
-	help
-	  This driver provides support for the Random Number
-	  Generator hardware found on Qualcomm SoCs.
-
-	  To compile this driver as a module, choose M here. The
-	  module will be called qcom-rng. If unsure, say N.
-
 config CRYPTO_DEV_IMGTEC_HASH
 	tristate "Imagination Technologies hardware hash accelerator"
 	depends on MIPS || COMPILE_TEST
 	select CRYPTO_MD5
 	select CRYPTO_SHA1
diff --git a/drivers/crypto/Makefile b/drivers/crypto/Makefile
index 283bbc650b5b..a5f3d388f4d0 100644
--- a/drivers/crypto/Makefile
+++ b/drivers/crypto/Makefile
@@ -26,11 +26,10 @@ obj-$(CONFIG_CRYPTO_DEV_OMAP_DES) += omap-des.o
 obj-$(CONFIG_CRYPTO_DEV_OMAP_SHAM) += omap-sham.o
 obj-$(CONFIG_CRYPTO_DEV_PADLOCK_AES) += padlock-aes.o
 obj-$(CONFIG_CRYPTO_DEV_PADLOCK_SHA) += padlock-sha.o
 obj-$(CONFIG_CRYPTO_DEV_PPC4XX) += amcc/
 obj-$(CONFIG_CRYPTO_DEV_QCE) += qce/
-obj-$(CONFIG_CRYPTO_DEV_QCOM_RNG) += qcom-rng.o
 obj-$(CONFIG_CRYPTO_DEV_ROCKCHIP) += rockchip/
 obj-$(CONFIG_CRYPTO_DEV_S5P) += s5p-sss.o
 obj-$(CONFIG_CRYPTO_DEV_SA2UL) += sa2ul.o
 obj-$(CONFIG_CRYPTO_DEV_SAHARA) += sahara.o
 obj-$(CONFIG_CRYPTO_DEV_SL3516) += gemini/
diff --git a/drivers/gpu/drm/ci/arm64.config b/drivers/gpu/drm/ci/arm64.config
index 563a69669a7b..c46125c1f80f 100644
--- a/drivers/gpu/drm/ci/arm64.config
+++ b/drivers/gpu/drm/ci/arm64.config
@@ -76,11 +76,10 @@ CONFIG_INTERCONNECT_QCOM_SDM845=y
 CONFIG_INTERCONNECT_QCOM_MSM8916=y
 CONFIG_INTERCONNECT_QCOM_MSM8996=y
 CONFIG_INTERCONNECT_QCOM_OSM_L3=y
 CONFIG_INTERCONNECT_QCOM_SC7180=y
 CONFIG_INTERCONNECT_QCOM_SM8350=y
-CONFIG_CRYPTO_DEV_QCOM_RNG=y
 CONFIG_SC_DISPCC_7180=y
 CONFIG_SC_GPUCC_7180=y
 CONFIG_SM_GPUCC_8350=y
 CONFIG_QCOM_SPMI_ADC5=y
 CONFIG_QCOM_SPMI_VADC=y
@@ -187,10 +186,11 @@ CONFIG_PWM_MEDIATEK=y
 CONFIG_DRM_MEDIATEK_HDMI=y
 CONFIG_GNSS=y
 CONFIG_GNSS_MTK_SERIAL=y
 CONFIG_HW_RANDOM=y
 CONFIG_HW_RANDOM_MTK=y
+CONFIG_HW_RANDOM_QCOM=y
 CONFIG_MTK_DEVAPC=y
 CONFIG_PWM_MTK_DISP=y
 CONFIG_MTK_CMDQ=y
 CONFIG_REGULATOR_DA9211=y
 CONFIG_DRM_ANALOGIX_ANX7625=y
-- 
2.54.0.1064.gd145956f57-goog


