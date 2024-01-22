Return-Path: <linux-arm-msm+bounces-7772-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB9C8362B4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jan 2024 12:57:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D9B6298CF5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jan 2024 11:57:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDDD43B79C;
	Mon, 22 Jan 2024 11:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i+wHioYE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A30383A8FC
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jan 2024 11:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705924645; cv=none; b=agpVbaVsEqusUAbkxIcT9FFXfiWwSHPxSYAwDxEmm60oKBrQTy2smbVrlogq0rc29XLLJEu4y3KkumLnihEyFSka3dW+W/9sdrUOOY1Hjuqhw5nFykvtlyea/v6o17d97VTkiuqQ2nCfMu4yuINO/RPQkCbZaJPmB/eNO2aHxHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705924645; c=relaxed/simple;
	bh=YDsBO6NlVIzkOIpCUSsISVUb3FWsETMa1EY/y8dwxcY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HnL/SwDRUL50H+FoSOMdterocNmFTOw+oazhwTsv/sb3HbE/cmZcgCqmpfXScpMeh3n8s5j6+9peA1CODCGJ7Tr03ScvUtkeALa1mPdvQu/XC07q6vqJgfDJUawSt09ecxcdWDqBh868o7aVagSH7mJbQIHbZE3IoA9gUUsZWzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i+wHioYE; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-55783b7b47aso3464518a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jan 2024 03:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705924641; x=1706529441; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8EwyIwMiZvdvGKWndwecey8qGdYSeadqylvmRPNZ5ns=;
        b=i+wHioYERNUSUFNex6tj2opqL3fTpflOAtNLVz8tkHRhDsfDQVDQsLdHAh4A1+uBNn
         vsEStLSvGKkaFm454lcikRLBeVdzF8KsFtNhv/guZjqf5Cgxfm4G92Bq4DWgEe9IJkGp
         CCPGSDXgapM8wHC889mUwkne8Xgr3NycliJkbNb4mgKEsOQvtBRFIxtAe3/9H6BbGgfr
         qVBFe90HUL0ZEge7Xc3wfF3ZaZ+y6AGHtSA1YRWqnyaLxeSnakJwaqTWJ9wqzVhBFcAd
         TR0hSm3t/pzMlpTquzlxphLUOFgZGjEjk8ySdXTmeuJb4jGuOeo00ID42i8bRY9sUugi
         iM2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705924641; x=1706529441;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8EwyIwMiZvdvGKWndwecey8qGdYSeadqylvmRPNZ5ns=;
        b=pY3lHJsahJCTxqCdDwgz3Scf+T9taCzqA80NXNF5EFHCmBnenu4Rgu1TTEqQ7v2rT3
         hijd4J7blYcbACK3om8sTEMjEaWD3qmErrR/EmaIG/IpUDkCFaUtHfRHmQpwrFVp4EMd
         CA73UgofYh9pdoybH57y3Z33XNOJlpddz7Voc343z1t9utOsL3UZRJIMinivlnYYuFxj
         +4NOf1VoXqNLH2g+E2cGJBAqOPKM2MXG/qT6xAMzQKF9RU7zC/2l3CL618w7zjZ0Snkm
         pW57E6haIzPtt3ecbXPMtWbSNrLpQf2vnk1h1UTsrVokXN2MWV7lTkWIUsbjMjGRUn7Z
         kuYw==
X-Gm-Message-State: AOJu0YwmGOrn7gCk/oeaMSb5AiKP9XmKR9v385BJ3apm7eUsmyCdhVJx
	PaEuac3S/hPO6xOIheVY/i/wXT1zSRWvGs8A87nOWmEyLOY2Iu7EEZArc0Svf7c=
X-Google-Smtp-Source: AGHT+IGqpFI8SLd8k+RYhSDidAP7DcXE3C9VqjxpWxDBORfUu5mzONTw3uKxnmUwM3x5l6aJwLk8Tg==
X-Received: by 2002:a17:906:6dd3:b0:a2e:d377:6d11 with SMTP id j19-20020a1709066dd300b00a2ed3776d11mr2281143ejt.73.1705924640816;
        Mon, 22 Jan 2024 03:57:20 -0800 (PST)
Received: from [10.167.154.1] (178235179218.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.218])
        by smtp.gmail.com with ESMTPSA id k3-20020a170906a38300b00a298d735a1bsm13481349ejz.149.2024.01.22.03.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 03:57:20 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 22 Jan 2024 12:57:12 +0100
Subject: [PATCH 1/2] pinctrl: qcom: Remove QDF2xxx support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240122-topic-qdf_cleanup_pinctrl-v1-1-0c619ea25091@linaro.org>
References: <20240122-topic-qdf_cleanup_pinctrl-v1-0-0c619ea25091@linaro.org>
In-Reply-To: <20240122-topic-qdf_cleanup_pinctrl-v1-0-0c619ea25091@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1705924637; l=7491;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=YDsBO6NlVIzkOIpCUSsISVUb3FWsETMa1EY/y8dwxcY=;
 b=KLH5j9QK4ZCjO1SAIeKv8kJFuCyOVT4Vi5HorfdkwpiVG6cRQqbPrDJc6nunf+WBK50BKL0bY
 /9P/3TTgn01AMNdEdBCcNlTEO7yhTdzx8TM333fowy9cXEanZmHSDo3
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

This SoC family was destined for server use, featuring Qualcomm's very
interesting Kryo cores (before "Kryo" became a marketing term for Arm
cores with small modifications). It did however not leave the labs of
Qualcomm and presumably some partners, nor was it ever productized.

Remove this driver, as it seems to be long obsolete.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/pinctrl/qcom/Kconfig.msm       |   7 --
 drivers/pinctrl/qcom/Makefile          |   1 -
 drivers/pinctrl/qcom/pinctrl-qdf2xxx.c | 164 ---------------------------------
 3 files changed, 172 deletions(-)

diff --git a/drivers/pinctrl/qcom/Kconfig.msm b/drivers/pinctrl/qcom/Kconfig.msm
index 8fe459d082ed..57778590006f 100644
--- a/drivers/pinctrl/qcom/Kconfig.msm
+++ b/drivers/pinctrl/qcom/Kconfig.msm
@@ -182,13 +182,6 @@ config PINCTRL_QCS404
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  TLMM block found in the Qualcomm QCS404 platform.
 
-config PINCTRL_QDF2XXX
-	tristate "Qualcomm Technologies QDF2xxx pin controller driver"
-	depends on ACPI
-	help
-	  This is the GPIO driver for the TLMM block found on the
-	  Qualcomm Technologies QDF2xxx SOCs.
-
 config PINCTRL_QDU1000
 	tristate "Qualcomm Technologies Inc QDU1000/QRU1000 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/pinctrl/qcom/Makefile b/drivers/pinctrl/qcom/Makefile
index e2e76071d268..fa58af95a09d 100644
--- a/drivers/pinctrl/qcom/Makefile
+++ b/drivers/pinctrl/qcom/Makefile
@@ -23,7 +23,6 @@ obj-$(CONFIG_PINCTRL_MSM8996)   += pinctrl-msm8996.o
 obj-$(CONFIG_PINCTRL_MSM8998)   += pinctrl-msm8998.o
 obj-$(CONFIG_PINCTRL_QCM2290)	+= pinctrl-qcm2290.o
 obj-$(CONFIG_PINCTRL_QCS404)	+= pinctrl-qcs404.o
-obj-$(CONFIG_PINCTRL_QDF2XXX)	+= pinctrl-qdf2xxx.o
 obj-$(CONFIG_PINCTRL_MDM9607)	+= pinctrl-mdm9607.o
 obj-$(CONFIG_PINCTRL_MDM9615)	+= pinctrl-mdm9615.o
 obj-$(CONFIG_PINCTRL_QCOM_SPMI_PMIC) += pinctrl-spmi-gpio.o
diff --git a/drivers/pinctrl/qcom/pinctrl-qdf2xxx.c b/drivers/pinctrl/qcom/pinctrl-qdf2xxx.c
deleted file mode 100644
index 4d2f6f495163..000000000000
--- a/drivers/pinctrl/qcom/pinctrl-qdf2xxx.c
+++ /dev/null
@@ -1,164 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (c) 2015, The Linux Foundation. All rights reserved.
- *
- * GPIO and pin control functions on this SOC are handled by the "TLMM"
- * device.  The driver which controls this device is pinctrl-msm.c.  Each
- * SOC with a TLMM is expected to create a client driver that registers
- * with pinctrl-msm.c.  This means that all TLMM drivers are pin control
- * drivers.
- *
- * This pin control driver is intended to be used only an ACPI-enabled
- * system.  As such, UEFI will handle all pin control configuration, so
- * this driver does not provide pin control functions.  It is effectively
- * a GPIO-only driver.  The alternative is to duplicate the GPIO code of
- * pinctrl-msm.c into another driver.
- */
-
-#include <linux/module.h>
-#include <linux/platform_device.h>
-#include <linux/pinctrl/pinctrl.h>
-#include <linux/acpi.h>
-
-#include "pinctrl-msm.h"
-
-/* A maximum of 256 allows us to use a u8 array to hold the GPIO numbers */
-#define MAX_GPIOS	256
-
-/* maximum size of each gpio name (enough room for "gpioXXX" + null) */
-#define NAME_SIZE	8
-
-static int qdf2xxx_pinctrl_probe(struct platform_device *pdev)
-{
-	struct msm_pinctrl_soc_data *pinctrl;
-	struct pinctrl_pin_desc *pins;
-	struct msm_pingroup *groups;
-	char (*names)[NAME_SIZE];
-	unsigned int i;
-	u32 num_gpios;
-	unsigned int avail_gpios; /* The number of GPIOs we support */
-	u8 gpios[MAX_GPIOS];      /* An array of supported GPIOs */
-	int ret;
-
-	/* Query the number of GPIOs from ACPI */
-	ret = device_property_read_u32(&pdev->dev, "num-gpios", &num_gpios);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "missing 'num-gpios' property\n");
-		return ret;
-	}
-	if (!num_gpios || num_gpios > MAX_GPIOS) {
-		dev_err(&pdev->dev, "invalid 'num-gpios' property\n");
-		return -ENODEV;
-	}
-
-	/* The number of GPIOs in the approved list */
-	ret = device_property_count_u8(&pdev->dev, "gpios");
-	if (ret < 0) {
-		dev_err(&pdev->dev, "missing 'gpios' property\n");
-		return ret;
-	}
-	/*
-	 * The number of available GPIOs should be non-zero, and no
-	 * more than the total number of GPIOS.
-	 */
-	if (!ret || ret > num_gpios) {
-		dev_err(&pdev->dev, "invalid 'gpios' property\n");
-		return -ENODEV;
-	}
-	avail_gpios = ret;
-
-	ret = device_property_read_u8_array(&pdev->dev, "gpios", gpios,
-					    avail_gpios);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "could not read list of GPIOs\n");
-		return ret;
-	}
-
-	pinctrl = devm_kzalloc(&pdev->dev, sizeof(*pinctrl), GFP_KERNEL);
-	pins = devm_kcalloc(&pdev->dev, num_gpios,
-		sizeof(struct pinctrl_pin_desc), GFP_KERNEL);
-	groups = devm_kcalloc(&pdev->dev, num_gpios,
-		sizeof(struct msm_pingroup), GFP_KERNEL);
-	names = devm_kcalloc(&pdev->dev, avail_gpios, NAME_SIZE, GFP_KERNEL);
-
-	if (!pinctrl || !pins || !groups || !names)
-		return -ENOMEM;
-
-	/*
-	 * Initialize the array.  GPIOs not listed in the 'gpios' array
-	 * still need a number, but nothing else.
-	 */
-	for (i = 0; i < num_gpios; i++) {
-		pins[i].number = i;
-		groups[i].grp.pins = &pins[i].number;
-	}
-
-	/* Populate the entries that are meant to be exposed as GPIOs. */
-	for (i = 0; i < avail_gpios; i++) {
-		unsigned int gpio = gpios[i];
-
-		groups[gpio].grp.npins = 1;
-		snprintf(names[i], NAME_SIZE, "gpio%u", gpio);
-		pins[gpio].name = names[i];
-		groups[gpio].grp.name = names[i];
-
-		groups[gpio].ctl_reg = 0x10000 * gpio;
-		groups[gpio].io_reg = 0x04 + 0x10000 * gpio;
-		groups[gpio].intr_cfg_reg = 0x08 + 0x10000 * gpio;
-		groups[gpio].intr_status_reg = 0x0c + 0x10000 * gpio;
-		groups[gpio].intr_target_reg = 0x08 + 0x10000 * gpio;
-
-		groups[gpio].mux_bit = 2;
-		groups[gpio].pull_bit = 0;
-		groups[gpio].drv_bit = 6;
-		groups[gpio].oe_bit = 9;
-		groups[gpio].in_bit = 0;
-		groups[gpio].out_bit = 1;
-		groups[gpio].intr_enable_bit = 0;
-		groups[gpio].intr_status_bit = 0;
-		groups[gpio].intr_target_bit = 5;
-		groups[gpio].intr_target_kpss_val = 1;
-		groups[gpio].intr_raw_status_bit = 4;
-		groups[gpio].intr_polarity_bit = 1;
-		groups[gpio].intr_detection_bit = 2;
-		groups[gpio].intr_detection_width = 2;
-	}
-
-	pinctrl->pins = pins;
-	pinctrl->groups = groups;
-	pinctrl->npins = num_gpios;
-	pinctrl->ngroups = num_gpios;
-	pinctrl->ngpios = num_gpios;
-
-	return msm_pinctrl_probe(pdev, pinctrl);
-}
-
-static const struct acpi_device_id qdf2xxx_acpi_ids[] = {
-	{"QCOM8002"},
-	{},
-};
-MODULE_DEVICE_TABLE(acpi, qdf2xxx_acpi_ids);
-
-static struct platform_driver qdf2xxx_pinctrl_driver = {
-	.driver = {
-		.name = "qdf2xxx-pinctrl",
-		.acpi_match_table = qdf2xxx_acpi_ids,
-	},
-	.probe = qdf2xxx_pinctrl_probe,
-	.remove_new = msm_pinctrl_remove,
-};
-
-static int __init qdf2xxx_pinctrl_init(void)
-{
-	return platform_driver_register(&qdf2xxx_pinctrl_driver);
-}
-arch_initcall(qdf2xxx_pinctrl_init);
-
-static void __exit qdf2xxx_pinctrl_exit(void)
-{
-	platform_driver_unregister(&qdf2xxx_pinctrl_driver);
-}
-module_exit(qdf2xxx_pinctrl_exit);
-
-MODULE_DESCRIPTION("Qualcomm Technologies QDF2xxx pin control driver");
-MODULE_LICENSE("GPL v2");

-- 
2.43.0


