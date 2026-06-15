Return-Path: <linux-arm-msm+bounces-113266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fRKmFw6AMGqBTwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 00:43:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EE05C68A743
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 00:43:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=iLOUeQta;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113266-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113266-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5821F30F79F2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 22:42:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AE3E3B9949;
	Mon, 15 Jun 2026 22:42:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34FC3BB10F;
	Mon, 15 Jun 2026 22:42:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781563322; cv=none; b=Oca8kfeKAgsSU7v9VvqQtCAiKhya/O6RHQ3cQTfT50KqW4Dnc8T6wrHdZ1watzSsFY9bu+Tcmc8PiWHeZNkvVC45GbQkyTMt327mwU/yzCSgW4QU3G6GP+qiNzU1M3y9TRzgdypjgdZhBLMbEqdtgL29LEPFW0BiBFqe3X64nbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781563322; c=relaxed/simple;
	bh=/J4dCHFfz4+fvOBRAJto2W5g/+xK4TFSDku8lWPz5jg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Esu+BI6x+m/Lh9QoRA7A+2MZFQ4oZaJd3U1knrXEE280m3WktfHIkKJ7HGSeogHb4TkVH8GbCFu8YLbyM2lVapsbsOupDPT/Gf6q/MpObMIIwGTW+zrb4PyAJst7QK3jg8PC80z8I+ltTnHkCApdL9sDGtu2hOZabLUFMuaahEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iLOUeQta; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 711581F000E9;
	Mon, 15 Jun 2026 22:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781563320;
	bh=XyQkNlLVkSI7kZkcUeUb4Aa1vgkxOePW6VfDy+Sza2E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iLOUeQta+LbYl8vOvnl1e+OKi31Gg75mVZLE6djJn+vst7x+tQ1kyzK5iFq/YY8oH
	 vp1YgxpJtA4hjf8AgATdfL1bNrKfCL/bia1Q7HY1VAI9Boe9plP48CdGkVJAPfUKVY
	 2nSi5cKpp9erU2vhK7kgD7VaxCbRFO/d3N4PCwGT38vDXQiWF5LF5DvyF4LSKSEpIG
	 7MziSSMmTk3KAm68z52V4nMoajtGHPNdtMG4bNhVW76CudBw1Xn6lwT3nyC973MTpc
	 qr8CmJ3tMxJ/+UcrsKouY4m3fqblrJ/13VS8TGKTH8XC6c1l59HJ0wQsQyRkNAvDwq
	 MEyoPyHlOvw9A==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-kernel@vger.kernel.org,
	Gaurav Jain <gaurav.jain@nxp.com>,
	=?UTF-8?q?Horia=20Geant=C4=83?= <horia.geanta@nxp.com>,
	Pankaj Gupta <pankaj.gupta@nxp.com>,
	Corentin Labbe <clabbe.montjoie@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 4/7] hwrng: qcom - Move qcom-rng.c into drivers/char/hw_random/
Date: Mon, 15 Jun 2026 15:41:28 -0700
Message-ID: <20260615224131.69370-5-ebiggers@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260615224131.69370-1-ebiggers@kernel.org>
References: <20260615224131.69370-1-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[vger.kernel.org,nxp.com,gmail.com,oss.qualcomm.com,kernel.org];
	TAGGED_FROM(0.00)[bounces-113266-lists,linux-arm-msm=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ebiggers@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:linux-crypto@vger.kernel.org,m:herbert@gondor.apana.org.au,m:linux-kernel@vger.kernel.org,m:gaurav.jain@nxp.com,m:horia.geanta@nxp.com,m:pankaj.gupta@nxp.com,m:clabbe.montjoie@gmail.com,m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:ebiggers@kernel.org,m:clabbemontjoie@gmail.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ebiggers@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EE05C68A743

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
index 3672dd12df60..8e1f70339a47 100644
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
@@ -1333,11 +1334,10 @@ CONFIG_CRYPTO_DEV_S5P=m
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
index 6745189b1fbc..7958932a5b2a 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -550,10 +550,11 @@ CONFIG_IPMI_DEVICE_INTERFACE=m
 CONFIG_IPMI_SI=m
 CONFIG_HW_RANDOM=y
 CONFIG_HW_RANDOM_VIRTIO=y
 CONFIG_HW_RANDOM_HISI_TRNG=m
 CONFIG_HW_RANDOM_XILINX=m
+CONFIG_HW_RANDOM_QCOM=m
 CONFIG_TCG_TPM=y
 CONFIG_TCG_TIS=m
 CONFIG_TCG_TIS_SPI=m
 CONFIG_TCG_TIS_SPI_CR50=y
 CONFIG_TCG_TIS_I2C_CR50=m
@@ -1953,11 +1954,10 @@ CONFIG_CRYPTO_AES_ARM64_BS=m
 CONFIG_CRYPTO_AES_ARM64_CE_CCM=y
 CONFIG_CRYPTO_DEV_SUN8I_CE=m
 CONFIG_CRYPTO_DEV_FSL_CAAM=m
 CONFIG_CRYPTO_DEV_FSL_DPAA2_CAAM=m
 CONFIG_CRYPTO_DEV_QCE=m
-CONFIG_CRYPTO_DEV_QCOM_RNG=m
 CONFIG_CRYPTO_DEV_TEGRA=m
 CONFIG_CRYPTO_DEV_ZYNQMP_AES=m
 CONFIG_CRYPTO_DEV_ZYNQMP_SHA3=m
 CONFIG_CRYPTO_DEV_CCREE=m
 CONFIG_CRYPTO_DEV_HISI_SEC2=m
diff --git a/drivers/char/hw_random/Kconfig b/drivers/char/hw_random/Kconfig
index a5bcef4a54ee..b4c359abc4f9 100644
--- a/drivers/char/hw_random/Kconfig
+++ b/drivers/char/hw_random/Kconfig
@@ -634,10 +634,21 @@ config HW_RANDOM_XILINX
 	  Generator and Pseudo random Number in CTR_DRBG mode as defined in NIST SP800-90A.
 
 	  To compile this driver as a module, choose M here: the module
 	  will be called xilinx-trng.
 
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
index 95b5adb49560..8fce2aa6cf7d 100644
--- a/drivers/char/hw_random/Makefile
+++ b/drivers/char/hw_random/Makefile
@@ -52,5 +52,6 @@ obj-$(CONFIG_HW_RANDOM_ARM_SMCCC_TRNG) += arm_smccc_trng.o
 obj-$(CONFIG_HW_RANDOM_CN10K) += cn10k-rng.o
 obj-$(CONFIG_HW_RANDOM_POLARFIRE_SOC) += mpfs-rng.o
 obj-$(CONFIG_HW_RANDOM_ROCKCHIP) += rockchip-rng.o
 obj-$(CONFIG_HW_RANDOM_JH7110) += jh7110-trng.o
 obj-$(CONFIG_HW_RANDOM_XILINX) += xilinx-trng.o
+obj-$(CONFIG_HW_RANDOM_QCOM) += qcom-rng.o
diff --git a/drivers/crypto/qcom-rng.c b/drivers/char/hw_random/qcom-rng.c
similarity index 100%
rename from drivers/crypto/qcom-rng.c
rename to drivers/char/hw_random/qcom-rng.c
diff --git a/drivers/crypto/Kconfig b/drivers/crypto/Kconfig
index eb834d15d614..03a8f7a1f75e 100644
--- a/drivers/crypto/Kconfig
+++ b/drivers/crypto/Kconfig
@@ -635,21 +635,10 @@ config CRYPTO_DEV_QCE_SW_MAX_LEN
 
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
index 5a950c7abc39..2c33b83f3cfa 100644
--- a/drivers/crypto/Makefile
+++ b/drivers/crypto/Makefile
@@ -25,11 +25,10 @@ obj-$(CONFIG_CRYPTO_DEV_OMAP_DES) += omap-des.o
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
2.54.0


