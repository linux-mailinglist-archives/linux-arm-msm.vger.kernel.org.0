Return-Path: <linux-arm-msm+bounces-96426-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLIlB81yr2lYZgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96426-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 02:24:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A5A243844
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 02:24:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 160B7305854D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 01:24:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9A29266B67;
	Tue, 10 Mar 2026 01:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zo6VxlCr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33030261B91
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 01:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773105855; cv=none; b=OjT24hSG5gOKZ3TO8O4SXlbJAOcEaueR7wzT6duKGo8mVLibxSIpkFAqxCWT9394ZgvPq5V6LM8Kpabs2+BBtTUWZF+Fth+A/TMqvnfesvCq4hc6lmkwmiBMFHlTPT//5CRwNW0EfANNx2PQut1j+pdoOO4TnbWBKCEaW1tEcX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773105855; c=relaxed/simple;
	bh=IfFYVSyZN/V3/K2NocPRhVazkVL9mcxtq6rsa5fhjKo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HQ2iiRsTquJta8wAcTgTF8HGKBvms/wKBoTWy6zLsVooiazRUc6M5uE2927sHKaL7q+AbaOVEI5oVNUcJ37rdBbPuOXkquu2zK+u5HKi5ngrSdoBzTZo31xfpIRhKhvKEDdxzmHIyjs3p9ajg600KbK1v17GTVymNhBo3CV/NjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zo6VxlCr; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8cb4136d865so1643670485a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 18:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773105852; x=1773710652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZgkKriOQfZLDZkR8vWO/Z60NHORs4ZJBQtM4KM6KvCE=;
        b=Zo6VxlCrRCUCS4DyoxWZBZb+dorvBKB4sRkKwYo9IG20vmae0bRRa9I3+huxx0borR
         aKuDBbLgT790jPPpHE9mK6LokUAWF3GMb5NvaD4duozCajtUzwn2cfdQxeLjtKULjqVS
         jZ182CStXxcAVN/orLRQ1/HGIrAeQyZBQW1373vK89y9nZKGe1mXSHlEZvL8hi8+eVJ1
         BTOtN0TZvAzoYjHQjjgQfk5l6osYOoUOo4RTPujXEJUHd6RzTiWSDT+31tBZSCdqZZ97
         jXdfk+WmCBH643EONtiQm4KbC5kpeAr+xh3l2Q1tb0UkW9EmT3O6+19RdOcDIFL86NfF
         prrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773105852; x=1773710652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZgkKriOQfZLDZkR8vWO/Z60NHORs4ZJBQtM4KM6KvCE=;
        b=f14l0j48FYpCEIYuva2SLuKvNRc5QCONMULajHzdIuzOGXERtFcz7X6ZbEqcYyCMsE
         Gu3mGQgratgdh45RWXeR6mYHa6qGaYtkgTpCvuVttWNGFNTcXk/B0zAoNoyDIgUgTl0y
         sBzx3J3DNJiuAss0viFaidjaBF7xlct5uLYAgP2b9tjCMKt/ekPedutsUAkr6li+s+BD
         ZVc2ptk9WHj/I+zC7B4XAXGjX8CgKQxEwQxkCuQm67LSs4+IfZSb5v5QQQKPskjl/WYN
         pQtog9LCiuWcthYGTUD0oU8QnopasI/LhvhrSOLPtdHfN/+LW6pjB6qXaGYA1AqroJgO
         guvw==
X-Forwarded-Encrypted: i=1; AJvYcCX2BozHbiiDeEIM1vvuAgMNcr/1KwXKobakGihqprDsZKUOcQp1CChoQ9hRiTdCBZewYc87YDAzdcgufHxU@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4jtIcH2xRPJa2AnZpnNjlc/rJ6SSZvDPDxFLCDZPJARduQBsM
	jL866ouP3uJfeg4f+jFmJn3tGRFE112Rn3i2awHaMv1irfgKuo3N+YZB
X-Gm-Gg: ATEYQzwhcEIhvwTXPghWwEPfZ3fP8PAUO3OJogikBbwWeakJG123ss5N9ioJkvnJzWQ
	g89Q/8BPECpy35opMwQiQekaLkjtpQE1O32Iwzg3xgtmfIL7jxA6Dn8ZkAQOlZIq7RG49iB86hg
	Nnve3oX5Q4CPZ6SrZiz+EL62Gklj9jqMD7a2KeDw2u0sZ71/EItykxjQC2dTpJlA0M066WubeoW
	8UANgg/JHuedxXhVP5vmUDS8nraKaMxxMOoAZmEeLtpGQ3hilH7YCOPPb7Nukz0mjAHflig8YzM
	FaND5RPXRyuAG1lFgiCdx27bUk5trQn7vx9x5vdDPVmETc96eZjY+zdd5aW15Hb/1DkUXoyQtqh
	ZfX9CHd2ccnD+iH/DbscQ9n2NMvef0AcQjY4Rwt3AW0cwpzRy8LOOy77VFFH5tlIu/6btO9Gb0o
	f1WV232+9co7gzxXcT0yL6GXm2SBsn9WpCttmqoqkCZvMfGZ5OUo6QOpcSWQS8gVHtfkaMcBSxg
	c/EsXPCNi47OgY=
X-Received: by 2002:a05:620a:1a14:b0:8c6:a5bc:8a90 with SMTP id af79cd13be357-8cd6d3fb3c1mr1716945885a.14.1773105851956;
        Mon, 09 Mar 2026 18:24:11 -0700 (PDT)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cd9323a27esm107743685a.17.2026.03.09.18.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 18:24:11 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v2 3/5] pinctrl: qcom: add sdm670 lpi tlmm
Date: Mon,  9 Mar 2026 21:24:44 -0400
Message-ID: <20260310012446.32226-4-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310012446.32226-1-mailingradian@gmail.com>
References: <20260310012446.32226-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B8A5A243844
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96426-lists,linux-arm-msm=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

The Snapdragon 670 has an Low-Power Island (LPI) TLMM for configuring
pins related to audio. Add the driver for this.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 drivers/pinctrl/qcom/Kconfig                  |  10 ++
 drivers/pinctrl/qcom/Makefile                 |   1 +
 .../pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c   | 166 ++++++++++++++++++
 3 files changed, 177 insertions(+)
 create mode 100644 drivers/pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c

diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
index f56592411cf6..eb8ed3effd58 100644
--- a/drivers/pinctrl/qcom/Kconfig
+++ b/drivers/pinctrl/qcom/Kconfig
@@ -89,6 +89,16 @@ config PINCTRL_SM4250_LPASS_LPI
 	  Qualcomm Technologies Inc LPASS (Low Power Audio SubSystem) LPI
 	  (Low Power Island) found on the Qualcomm Technologies Inc SM4250 platform.
 
+config PINCTRL_SDM670_LPASS_LPI
+	tristate "Qualcomm Technologies Inc SDM670 LPASS LPI pin controller driver"
+	depends on GPIOLIB
+	depends on ARM64 || COMPILE_TEST
+	depends on PINCTRL_LPASS_LPI
+	help
+	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
+	  Qualcomm Technologies Inc LPASS (Low Power Audio SubSystem) LPI
+	  (Low Power Island) found on the Qualcomm Technologies Inc SDM670 platform.
+
 config PINCTRL_SM6115_LPASS_LPI
 	tristate "Qualcomm Technologies Inc SM6115 LPASS LPI pin controller driver"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/pinctrl/qcom/Makefile b/drivers/pinctrl/qcom/Makefile
index 4269d1781015..ed2127d26912 100644
--- a/drivers/pinctrl/qcom/Makefile
+++ b/drivers/pinctrl/qcom/Makefile
@@ -48,6 +48,7 @@ obj-$(CONFIG_PINCTRL_SC8280XP)	+= pinctrl-sc8280xp.o
 obj-$(CONFIG_PINCTRL_SDM660)   += pinctrl-sdm660.o
 obj-$(CONFIG_PINCTRL_SDM660_LPASS_LPI) += pinctrl-sdm660-lpass-lpi.o
 obj-$(CONFIG_PINCTRL_SDM670) += pinctrl-sdm670.o
+obj-$(CONFIG_PINCTRL_SDM670_LPASS_LPI) += pinctrl-sdm670-lpass-lpi.o
 obj-$(CONFIG_PINCTRL_SDM845) += pinctrl-sdm845.o
 obj-$(CONFIG_PINCTRL_SDX55) += pinctrl-sdx55.o
 obj-$(CONFIG_PINCTRL_SDX65) += pinctrl-sdx65.o
diff --git a/drivers/pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c
new file mode 100644
index 000000000000..6270c6d09c22
--- /dev/null
+++ b/drivers/pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c
@@ -0,0 +1,166 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2023-2026, Richard Acayan. All rights reserved.
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pinctrl/pinctrl.h>
+
+#include "pinctrl-lpass-lpi.h"
+
+enum lpass_lpi_functions {
+	LPI_MUX_comp_rx,
+	LPI_MUX_dmic1_clk,
+	LPI_MUX_dmic1_data,
+	LPI_MUX_dmic2_clk,
+	LPI_MUX_dmic2_data,
+	LPI_MUX_i2s1_clk,
+	LPI_MUX_i2s1_data,
+	LPI_MUX_i2s1_ws,
+	LPI_MUX_lpi_cdc_rst,
+	LPI_MUX_mclk0,
+	LPI_MUX_pdm_rx,
+	LPI_MUX_pdm_sync,
+	LPI_MUX_pdm_tx,
+	LPI_MUX_slimbus_clk,
+	LPI_MUX_gpio,
+	LPI_MUX__,
+};
+
+static const struct pinctrl_pin_desc sdm670_lpi_pinctrl_pins[] = {
+	PINCTRL_PIN(0, "gpio0"),
+	PINCTRL_PIN(1, "gpio1"),
+	PINCTRL_PIN(2, "gpio2"),
+	PINCTRL_PIN(3, "gpio3"),
+	PINCTRL_PIN(4, "gpio4"),
+	PINCTRL_PIN(5, "gpio5"),
+	PINCTRL_PIN(6, "gpio6"),
+	PINCTRL_PIN(7, "gpio7"),
+	PINCTRL_PIN(8, "gpio8"),
+	PINCTRL_PIN(9, "gpio9"),
+	PINCTRL_PIN(10, "gpio10"),
+	PINCTRL_PIN(11, "gpio11"),
+	PINCTRL_PIN(12, "gpio12"),
+	PINCTRL_PIN(13, "gpio13"),
+	PINCTRL_PIN(14, "gpio14"),
+	PINCTRL_PIN(15, "gpio15"),
+	PINCTRL_PIN(16, "gpio16"),
+	PINCTRL_PIN(17, "gpio17"),
+	PINCTRL_PIN(18, "gpio18"),
+	PINCTRL_PIN(19, "gpio19"),
+	PINCTRL_PIN(20, "gpio20"),
+	PINCTRL_PIN(21, "gpio21"),
+	PINCTRL_PIN(22, "gpio22"),
+	PINCTRL_PIN(23, "gpio23"),
+	PINCTRL_PIN(24, "gpio24"),
+	PINCTRL_PIN(25, "gpio25"),
+	PINCTRL_PIN(26, "gpio26"),
+	PINCTRL_PIN(27, "gpio27"),
+	PINCTRL_PIN(28, "gpio28"),
+	PINCTRL_PIN(29, "gpio29"),
+	PINCTRL_PIN(30, "gpio30"),
+	PINCTRL_PIN(31, "gpio31"),
+};
+
+static const char * const comp_rx_groups[] = { "gpio22", "gpio24" };
+static const char * const dmic1_clk_groups[] = { "gpio26" };
+static const char * const dmic1_data_groups[] = { "gpio27" };
+static const char * const dmic2_clk_groups[] = { "gpio28" };
+static const char * const dmic2_data_groups[] = { "gpio29" };
+static const char * const i2s1_clk_groups[] = { "gpio8" };
+static const char * const i2s1_ws_groups[] = { "gpio9" };
+static const char * const i2s1_data_groups[] = { "gpio10", "gpio11" };
+static const char * const lpi_cdc_rst_groups[] = { "gpio29" };
+static const char * const mclk0_groups[] = { "gpio19" };
+static const char * const pdm_rx_groups[] = { "gpio21", "gpio23", "gpio25" };
+static const char * const pdm_sync_groups[] = { "gpio19" };
+static const char * const pdm_tx_groups[] = { "gpio20" };
+static const char * const slimbus_clk_groups[] = { "gpio18" };
+
+const struct lpi_pingroup sdm670_lpi_pinctrl_groups[] = {
+	LPI_PINGROUP(0, LPI_NO_SLEW, _, _, _, _),
+	LPI_PINGROUP(1, LPI_NO_SLEW, _, _, _, _),
+	LPI_PINGROUP(2, LPI_NO_SLEW, _, _, _, _),
+	LPI_PINGROUP(3, LPI_NO_SLEW, _, _, _, _),
+	LPI_PINGROUP(4, LPI_NO_SLEW, _, _, _, _),
+	LPI_PINGROUP(5, LPI_NO_SLEW, _, _, _, _),
+	LPI_PINGROUP(6, LPI_NO_SLEW, _, _, _, _),
+	LPI_PINGROUP(7, LPI_NO_SLEW, _, _, _, _),
+	LPI_PINGROUP(8, LPI_NO_SLEW, _, _, i2s1_clk, _),
+	LPI_PINGROUP(9, LPI_NO_SLEW, _, _, i2s1_ws, _),
+	LPI_PINGROUP(10, LPI_NO_SLEW, _, _, _, i2s1_data),
+	LPI_PINGROUP(11, LPI_NO_SLEW, _, i2s1_data, _, _),
+	LPI_PINGROUP(12, LPI_NO_SLEW, _, _, _, _),
+	LPI_PINGROUP(13, LPI_NO_SLEW, _, _, _, _),
+	LPI_PINGROUP(14, LPI_NO_SLEW, _, _, _, _),
+	LPI_PINGROUP(15, LPI_NO_SLEW, _, _, _, _),
+	LPI_PINGROUP(16, LPI_NO_SLEW, _, _, _, _),
+	LPI_PINGROUP(17, LPI_NO_SLEW, _, _, _, _),
+	LPI_PINGROUP(18, LPI_NO_SLEW, _, slimbus_clk, _, _),
+	LPI_PINGROUP(19, LPI_NO_SLEW, mclk0, _, pdm_sync, _),
+	LPI_PINGROUP(20, LPI_NO_SLEW, _, pdm_tx, _, _),
+	LPI_PINGROUP(21, LPI_NO_SLEW, _, pdm_rx, _, _),
+	LPI_PINGROUP(22, LPI_NO_SLEW, _, comp_rx, _, _),
+	LPI_PINGROUP(23, LPI_NO_SLEW, pdm_rx, _, _, _),
+	LPI_PINGROUP(24, LPI_NO_SLEW, comp_rx, _, _, _),
+	LPI_PINGROUP(25, LPI_NO_SLEW, pdm_rx, _, _, _),
+	LPI_PINGROUP(26, LPI_NO_SLEW, dmic1_clk, _, _, _),
+	LPI_PINGROUP(27, LPI_NO_SLEW, dmic1_data, _, _, _),
+	LPI_PINGROUP(28, LPI_NO_SLEW, dmic2_clk, _, _, _),
+	LPI_PINGROUP(29, LPI_NO_SLEW, dmic2_data, lpi_cdc_rst, _, _),
+	LPI_PINGROUP(30, LPI_NO_SLEW, _, _, _, _),
+	LPI_PINGROUP(31, LPI_NO_SLEW, _, _, _, _),
+};
+
+const struct lpi_function sdm670_lpi_pinctrl_functions[] = {
+	LPI_FUNCTION(comp_rx),
+	LPI_FUNCTION(dmic1_clk),
+	LPI_FUNCTION(dmic1_data),
+	LPI_FUNCTION(dmic2_clk),
+	LPI_FUNCTION(dmic2_data),
+	LPI_FUNCTION(i2s1_clk),
+	LPI_FUNCTION(i2s1_data),
+	LPI_FUNCTION(i2s1_ws),
+	LPI_FUNCTION(lpi_cdc_rst),
+	LPI_FUNCTION(mclk0),
+	LPI_FUNCTION(pdm_tx),
+	LPI_FUNCTION(pdm_rx),
+	LPI_FUNCTION(pdm_sync),
+	LPI_FUNCTION(slimbus_clk),
+};
+
+static const struct lpi_pinctrl_variant_data sdm670_lpi_pinctrl_data = {
+	.pins = sdm670_lpi_pinctrl_pins,
+	.npins = ARRAY_SIZE(sdm670_lpi_pinctrl_pins),
+	.groups = sdm670_lpi_pinctrl_groups,
+	.ngroups = ARRAY_SIZE(sdm670_lpi_pinctrl_groups),
+	.functions = sdm670_lpi_pinctrl_functions,
+	.nfunctions = ARRAY_SIZE(sdm670_lpi_pinctrl_functions),
+	.flags = LPI_FLAG_SLEW_RATE_SAME_REG,
+};
+
+static const struct of_device_id sdm670_lpi_pinctrl_of_match[] = {
+	{
+		.compatible = "qcom,sdm670-lpass-lpi-pinctrl",
+		.data = &sdm670_lpi_pinctrl_data,
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, sdm670_lpi_pinctrl_of_match);
+
+static struct platform_driver sdm670_lpi_pinctrl_driver = {
+	.driver = {
+		.name = "qcom-sdm670-lpass-lpi-pinctrl",
+		.of_match_table = sdm670_lpi_pinctrl_of_match,
+	},
+	.probe = lpi_pinctrl_probe,
+	.remove = lpi_pinctrl_remove,
+};
+module_platform_driver(sdm670_lpi_pinctrl_driver);
+
+MODULE_AUTHOR("Richard Acayan <mailingradian@gmail.com>");
+MODULE_DESCRIPTION("QTI SDM670 LPI GPIO pin control driver");
+MODULE_LICENSE("GPL");
-- 
2.53.0


