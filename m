Return-Path: <linux-arm-msm+bounces-95841-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPKOIF3jqmkTYAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95841-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 15:23:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D1622290B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 15:23:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 484413025E15
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 14:23:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2689B3AE188;
	Fri,  6 Mar 2026 14:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="lPIxUs5D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9BD3ACF0B
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 14:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772806949; cv=none; b=nHBdjamrPgUg+6fAtPRbflo8rycQP5cEcitGN3Sgn1f+GSbsv6hfosSjbInIfysiRW+CphbXxpT5jt4kKEQ7Qa+gd08x++Ye34xi1br4e2wVol+lZ/nPCMWajyEWMmiNFnoVPcMu/5LVFIt7mNxWjYXrcTbG0azwJ/sUENBvHM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772806949; c=relaxed/simple;
	bh=h5gWHA0irmgEDKdcC2MAqtMGfH7nJlQdsrUo0byY85o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hfNy8tM4+koDjiVb+XDzvNWYvjIP8Xe78tHwtt8Hl3s5bH3lbmn2BKUoy9h520gpAC8Gkq2W6aRdQHM6HloQba53+N76XytdDXolC1oDxYazs7dui2wZaToNVJJBzXaBXXmBt7qu8iz2wD0T3CwtQk9sPMdCWEFU0osVTqV1XHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=lPIxUs5D; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6610bd5f322so4811285a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 06:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1772806942; x=1773411742; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mMBIOHxR2+nMFJ2aIh2HQDzYkMfDXx1MthiMZ/Lxokk=;
        b=lPIxUs5DqRPAhEkLbiUwlY3Ij1/QfQs2eUPz6VgbloinnMcQE1n8Quast0lRykj0Gj
         SpPVb5VGmjUYAANME8Vfhe3lGgrmylXpd9l8WJcJojeYqEWTRUa4BU3f+yKM1RjQyHAn
         6csXQQRZ0QnYzvJ8ON2gp0W91nc5lUc5BU4i852o/rLFiCv3WERFyhtZBgyCWC5ZC4iY
         7srdEukZQP4uVwUicivzA20h+JMZCGR0OeC7EGse7qqXWMLVUqW6FjrTeXU1unu9qDax
         fBz48mb6/L8vP9S6PdYjvFpE4oN6akzXoR8JUxzb33i4AH77RmhaW5xy+WVubXJZb95T
         n6hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772806942; x=1773411742;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mMBIOHxR2+nMFJ2aIh2HQDzYkMfDXx1MthiMZ/Lxokk=;
        b=AB2cc/KRvL49nputAQwO1Sk2exUSJc4nS9LT56CR8jHx9xkOXeA+FfkKcXS4CjV40y
         uR9vstmr2PMJ5pzkJCL3OMyetwguOTK3q+iVtIsjkHIwr60sfoTmkc4H4NWGLoGh4Hw+
         CMG2otryWc8c1jLtF7QnpGZs2OSTPiSLYrvBPuJQ8mkFa93e2wDmHUc539Q9UFOZoqyd
         AkLigzgZTIUp9z3+yeYJ6slwIqQIS+AQA1ugg9pHjFmGJQkQnD/zQExzh9wo/t+qyOC+
         mRQte2qWxZsPPAxXWMaxLVh9IsfQtR3ztJ9UikGXrUsZo0Qzj8Y/v+cTKTh95xFFH7bU
         Qrcw==
X-Forwarded-Encrypted: i=1; AJvYcCWWVS9BLUCGvEWzjazPwUX3rFc8YZyJuoh5Ku4Grw/ylBnoW2wI2GGLRTQM/9+nYExrBNEutG/pzGMb9xqY@vger.kernel.org
X-Gm-Message-State: AOJu0YwZtGeuMfllH3OGVgn/6GbjqJp3pwpC6rf0Mi5dz13WtS7OKne1
	+UBVaUPm0D47o1w+fk4Uf+S6Fh7ayvO/lu/gITRxx7XKNWLhlRPDbNu3E6+iLdKUdbI=
X-Gm-Gg: ATEYQzxHvXcCycIUZRgYNnZQ8D1H5ZDHBT2sFpbmftxMc5nNOtqqYYvQw6CBt8A17MO
	GONKCTLDChHu66l4lI/TsWEDh33ledz5GBJey2i6N3LH577KVkRG3rILqj1viv4E9Zbvkt0/Qjk
	4yPkmKD1WsDuR34UNWIonG8bDfH7wDQ/yj0g/V/ysYVAWcvtAiTsbLbwQbHm9j2RnAMPQslkAno
	XOG6yycViEYjvH5Jv2aOZcgVQZS/st5S6GvvC8gqfT5v/7TpkZz2iMQZ58+uBzSVQFvvNxG8uzY
	zGrl3UhziPXsZ8ieHT+4p8/qQjF8gadrVNwu3HCgvopWN9iOtuMwpJcj+0obY6aSz2PxmCxGsQI
	5fwi3tVUCiU+ACm1YP38mN4CXmbU7y7krVvro82n/stOwn9TkdCsDKicWf/9w3jxHD+BSQOdTdJ
	6aQdjmm08h9gnlsmVAErCngvnRundNB5PGYu5WAUn4RFWKsBR97cNscgAMyX2Uv0M18rt2A0jTR
	gvc
X-Received: by 2002:a05:6402:274d:b0:65c:3c43:d9c4 with SMTP id 4fb4d7f45d1cf-6619d47bb56mr1378123a12.10.1772806941665;
        Fri, 06 Mar 2026 06:22:21 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-661a3c66d3fsm517251a12.2.2026.03.06.06.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 06:22:21 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 06 Mar 2026 15:22:16 +0100
Subject: [PATCH 2/4] pinctrl: qcom: Add Milos LPASS LPI TLMM
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-milos-pinctrl-lpi-v1-2-086946dbb855@fairphone.com>
References: <20260306-milos-pinctrl-lpi-v1-0-086946dbb855@fairphone.com>
In-Reply-To: <20260306-milos-pinctrl-lpi-v1-0-086946dbb855@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772806937; l=10462;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=h5gWHA0irmgEDKdcC2MAqtMGfH7nJlQdsrUo0byY85o=;
 b=1OAEp7Rt/+L3HcoUCG87WyO+/aDLSp+A9OR7Ph7tDnDh5TK9ybU61b3/NRCx1UV2nW2Xgn/Pj
 TCrFb1ypWvZBSViZtxNIYTSAK1PwvEv/NjNg4zcvD+JjwYNVL1zs7GS
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Rspamd-Queue-Id: 25D1622290B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95841-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[172.232.135.74:from];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[fairphone.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[100.90.174.1:received,144.178.202.138:received];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,fairphone.com:dkim,fairphone.com:email,fairphone.com:mid]
X-Rspamd-Action: no action

Add a driver for the pin controller in the Low Power Audio SubSystem
(LPASS) on the Milos SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Not quite sure what to do with gpio15-gpio18, while downstream just
treats them as the others, based on the datasheets there's no GPIO_*
where they could be routed to. Shall we just remove them from the driver
and treat them as missing? Do holes in pinctrl drivers not cause any
extra issues?
---
 drivers/pinctrl/qcom/Kconfig                   |  10 ++
 drivers/pinctrl/qcom/Makefile                  |   1 +
 drivers/pinctrl/qcom/pinctrl-milos-lpass-lpi.c | 217 +++++++++++++++++++++++++
 3 files changed, 228 insertions(+)

diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
index f56592411cf6..ee34ffca3917 100644
--- a/drivers/pinctrl/qcom/Kconfig
+++ b/drivers/pinctrl/qcom/Kconfig
@@ -60,6 +60,16 @@ config PINCTRL_LPASS_LPI
 	  Qualcomm Technologies Inc LPASS (Low Power Audio SubSystem) LPI
 	  (Low Power Island) found on the Qualcomm Technologies Inc SoCs.
 
+config PINCTRL_MILOS_LPASS_LPI
+	tristate "Qualcomm Technologies Inc Milos LPASS LPI pin controller driver"
+	depends on ARM64 || COMPILE_TEST
+	depends on PINCTRL_LPASS_LPI
+	help
+	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
+	  Qualcomm Technologies Inc LPASS (Low Power Audio SubSystem) LPI
+	  (Low Power Island) found on the Qualcomm Technologies Inc Milos
+	  platform.
+
 config PINCTRL_SC7280_LPASS_LPI
 	tristate "Qualcomm Technologies Inc SC7280 and SM8350 LPASS LPI pin controller driver"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/pinctrl/qcom/Makefile b/drivers/pinctrl/qcom/Makefile
index 831103b3827b..a8fd12f90d6e 100644
--- a/drivers/pinctrl/qcom/Makefile
+++ b/drivers/pinctrl/qcom/Makefile
@@ -34,6 +34,7 @@ obj-$(CONFIG_PINCTRL_QDF2XXX)	+= pinctrl-qdf2xxx.o
 obj-$(CONFIG_PINCTRL_MDM9607)	+= pinctrl-mdm9607.o
 obj-$(CONFIG_PINCTRL_MDM9615)	+= pinctrl-mdm9615.o
 obj-$(CONFIG_PINCTRL_MILOS) += pinctrl-milos.o
+obj-$(CONFIG_PINCTRL_MILOS_LPASS_LPI) += pinctrl-milos-lpass-lpi.o
 obj-$(CONFIG_PINCTRL_QCOM_SPMI_PMIC) += pinctrl-spmi-gpio.o
 obj-$(CONFIG_PINCTRL_QCOM_SPMI_PMIC) += pinctrl-spmi-mpp.o
 obj-$(CONFIG_PINCTRL_QCOM_SSBI_PMIC) += pinctrl-ssbi-gpio.o
diff --git a/drivers/pinctrl/qcom/pinctrl-milos-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-milos-lpass-lpi.c
new file mode 100644
index 000000000000..3bf6fe0cf1bb
--- /dev/null
+++ b/drivers/pinctrl/qcom/pinctrl-milos-lpass-lpi.c
@@ -0,0 +1,217 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022-2023 Linaro Ltd.
+ * Copyright (c) 2026 Luca Weiss <luca.weiss@fairphone.com>
+ */
+
+#include <linux/gpio/driver.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+#include "pinctrl-lpass-lpi.h"
+
+enum lpass_lpi_functions {
+	LPI_MUX_dmic1_clk,
+	LPI_MUX_dmic1_data,
+	LPI_MUX_dmic2_clk,
+	LPI_MUX_dmic2_data,
+	LPI_MUX_dmic3_clk,
+	LPI_MUX_dmic3_data,
+	LPI_MUX_dmic4_clk,
+	LPI_MUX_dmic4_data,
+	LPI_MUX_i2s0_clk,
+	LPI_MUX_i2s0_data,
+	LPI_MUX_i2s0_ws,
+	LPI_MUX_i2s1_clk,
+	LPI_MUX_i2s1_data,
+	LPI_MUX_i2s1_ws,
+	LPI_MUX_i2s2_clk,
+	LPI_MUX_i2s2_data,
+	LPI_MUX_i2s2_ws,
+	LPI_MUX_i2s3_clk,
+	LPI_MUX_i2s3_data,
+	LPI_MUX_i2s3_ws,
+	LPI_MUX_qca_swr_clk,
+	LPI_MUX_qca_swr_data,
+	LPI_MUX_slimbus_clk,
+	LPI_MUX_slimbus_data,
+	LPI_MUX_swr_rx_clk,
+	LPI_MUX_swr_rx_data,
+	LPI_MUX_swr_tx_clk,
+	LPI_MUX_swr_tx_data,
+	LPI_MUX_wsa_swr_clk,
+	LPI_MUX_wsa_swr_data,
+	LPI_MUX_ext_mclk1_a,
+	LPI_MUX_ext_mclk1_b,
+	LPI_MUX_ext_mclk1_c,
+	LPI_MUX_ext_mclk1_d,
+	LPI_MUX_ext_mclk1_e,
+	LPI_MUX_gpio,
+	LPI_MUX__,
+};
+
+static const struct pinctrl_pin_desc milos_lpi_pins[] = {
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
+};
+
+static const char * const gpio_groups[] = {
+	"gpio0", "gpio1", "gpio2", "gpio3", "gpio4", "gpio5", "gpio6", "gpio7",
+	"gpio8", "gpio9", "gpio10", "gpio11", "gpio12", "gpio13", "gpio14",
+	"gpio15", "gpio16", "gpio17", "gpio18", "gpio19", "gpio20", "gpio21",
+	"gpio22",
+};
+
+static const char * const dmic1_clk_groups[] = { "gpio6" };
+static const char * const dmic1_data_groups[] = { "gpio7" };
+static const char * const dmic2_clk_groups[] = { "gpio8" };
+static const char * const dmic2_data_groups[] = { "gpio9" };
+static const char * const dmic3_clk_groups[] = { "gpio12" };
+static const char * const dmic3_data_groups[] = { "gpio13" };
+static const char * const dmic4_clk_groups[] = { "gpio21" };
+static const char * const dmic4_data_groups[] = { "gpio22" };
+static const char * const i2s0_clk_groups[] = { "gpio0" };
+static const char * const i2s0_ws_groups[] = { "gpio1" };
+static const char * const i2s0_data_groups[] = { "gpio2", "gpio3", "gpio4", "gpio5" };
+static const char * const i2s1_clk_groups[] = { "gpio6" };
+static const char * const i2s1_ws_groups[] = { "gpio7" };
+static const char * const i2s1_data_groups[] = { "gpio8", "gpio9" };
+static const char * const i2s2_clk_groups[] = { "gpio10" };
+static const char * const i2s2_ws_groups[] = { "gpio11" };
+static const char * const i2s2_data_groups[] = { "gpio12", "gpio13" };
+static const char * const i2s3_clk_groups[] = { "gpio19" };
+static const char * const i2s3_ws_groups[] = { "gpio20" };
+static const char * const i2s3_data_groups[] = { "gpio21", "gpio22" };
+static const char * const qca_swr_clk_groups[] = { "gpio19" };
+static const char * const qca_swr_data_groups[] = { "gpio20" };
+static const char * const slimbus_clk_groups[] = { "gpio19" };
+static const char * const slimbus_data_groups[] = { "gpio20" };
+static const char * const swr_rx_clk_groups[] = { "gpio3" };
+static const char * const swr_rx_data_groups[] = { "gpio4", "gpio5" };
+static const char * const swr_tx_clk_groups[] = { "gpio0" };
+static const char * const swr_tx_data_groups[] = { "gpio1", "gpio2", "gpio14" };
+static const char * const wsa_swr_clk_groups[] = { "gpio10" };
+static const char * const wsa_swr_data_groups[] = { "gpio11" };
+static const char * const ext_mclk1_a_groups[] = { "gpio13" };
+static const char * const ext_mclk1_b_groups[] = { "gpio9" };
+static const char * const ext_mclk1_c_groups[] = { "gpio5" };
+static const char * const ext_mclk1_d_groups[] = { "gpio14" };
+static const char * const ext_mclk1_e_groups[] = { "gpio22" };
+
+static const struct lpi_pingroup milos_groups[] = {
+	LPI_PINGROUP(0, 0, swr_tx_clk, i2s0_clk, _, _),
+	LPI_PINGROUP(1, 2, swr_tx_data, i2s0_ws, _, _),
+	LPI_PINGROUP(2, 4, swr_tx_data, i2s0_data, _, _),
+	LPI_PINGROUP(3, 8, swr_rx_clk, i2s0_data, _, _),
+	LPI_PINGROUP(4, 10, swr_rx_data, i2s0_data, _, _),
+	LPI_PINGROUP(5, 12, swr_rx_data, ext_mclk1_c, i2s0_data, _),
+	LPI_PINGROUP(6, LPI_NO_SLEW, dmic1_clk, i2s1_clk, _, _),
+	LPI_PINGROUP(7, LPI_NO_SLEW, dmic1_data, i2s1_ws, _, _),
+	LPI_PINGROUP(8, LPI_NO_SLEW, dmic2_clk, i2s1_data, _, _),
+	LPI_PINGROUP(9, LPI_NO_SLEW, dmic2_data, i2s1_data, ext_mclk1_b, _),
+	LPI_PINGROUP(10, 16, wsa_swr_clk, i2s2_clk, _, _),
+	LPI_PINGROUP(11, 18, wsa_swr_data, i2s2_ws, _, _),
+	LPI_PINGROUP(12, LPI_NO_SLEW, dmic3_clk, i2s2_data, _, _),
+	LPI_PINGROUP(13, LPI_NO_SLEW, dmic3_data, i2s2_data, ext_mclk1_a, _),
+	LPI_PINGROUP(14, 6, swr_tx_data, ext_mclk1_d, _, _),
+	/* gpio15 - gpio18 do not really exist */
+	LPI_PINGROUP(15, 20, _, _, _, _),
+	LPI_PINGROUP(16, 22, _, _, _, _),
+	LPI_PINGROUP(17, LPI_NO_SLEW, _, _, _, _),
+	LPI_PINGROUP(18, LPI_NO_SLEW, _, _, _, _),
+	LPI_PINGROUP(19, LPI_NO_SLEW, i2s3_clk, slimbus_clk, qca_swr_clk, _),
+	LPI_PINGROUP(20, LPI_NO_SLEW, i2s3_ws, slimbus_data, qca_swr_data, _),
+	LPI_PINGROUP(21, LPI_NO_SLEW, i2s3_data, dmic4_clk, _, _),
+	LPI_PINGROUP(22, LPI_NO_SLEW, i2s3_data, dmic4_data, ext_mclk1_e, _),
+};
+
+static const struct lpi_function milos_functions[] = {
+	LPI_FUNCTION(gpio),
+	LPI_FUNCTION(dmic1_clk),
+	LPI_FUNCTION(dmic1_data),
+	LPI_FUNCTION(dmic2_clk),
+	LPI_FUNCTION(dmic2_data),
+	LPI_FUNCTION(dmic3_clk),
+	LPI_FUNCTION(dmic3_data),
+	LPI_FUNCTION(dmic4_clk),
+	LPI_FUNCTION(dmic4_data),
+	LPI_FUNCTION(i2s0_clk),
+	LPI_FUNCTION(i2s0_data),
+	LPI_FUNCTION(i2s0_ws),
+	LPI_FUNCTION(i2s1_clk),
+	LPI_FUNCTION(i2s1_data),
+	LPI_FUNCTION(i2s1_ws),
+	LPI_FUNCTION(i2s2_clk),
+	LPI_FUNCTION(i2s2_data),
+	LPI_FUNCTION(i2s2_ws),
+	LPI_FUNCTION(i2s3_clk),
+	LPI_FUNCTION(i2s3_data),
+	LPI_FUNCTION(i2s3_ws),
+	LPI_FUNCTION(qca_swr_clk),
+	LPI_FUNCTION(qca_swr_data),
+	LPI_FUNCTION(slimbus_clk),
+	LPI_FUNCTION(slimbus_data),
+	LPI_FUNCTION(swr_rx_clk),
+	LPI_FUNCTION(swr_rx_data),
+	LPI_FUNCTION(swr_tx_clk),
+	LPI_FUNCTION(swr_tx_data),
+	LPI_FUNCTION(wsa_swr_clk),
+	LPI_FUNCTION(wsa_swr_data),
+	LPI_FUNCTION(ext_mclk1_a),
+	LPI_FUNCTION(ext_mclk1_b),
+	LPI_FUNCTION(ext_mclk1_c),
+	LPI_FUNCTION(ext_mclk1_d),
+	LPI_FUNCTION(ext_mclk1_e),
+};
+
+static const struct lpi_pinctrl_variant_data milos_lpi_data = {
+	.pins = milos_lpi_pins,
+	.npins = ARRAY_SIZE(milos_lpi_pins),
+	.groups = milos_groups,
+	.ngroups = ARRAY_SIZE(milos_groups),
+	.functions = milos_functions,
+	.nfunctions = ARRAY_SIZE(milos_functions),
+};
+
+static const struct of_device_id lpi_pinctrl_of_match[] = {
+	{
+		.compatible = "qcom,milos-lpass-lpi-pinctrl",
+		.data = &milos_lpi_data,
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
+
+static struct platform_driver lpi_pinctrl_driver = {
+	.driver = {
+		.name = "qcom-milos-lpass-lpi-pinctrl",
+		.of_match_table = lpi_pinctrl_of_match,
+	},
+	.probe = lpi_pinctrl_probe,
+	.remove = lpi_pinctrl_remove,
+};
+
+module_platform_driver(lpi_pinctrl_driver);
+MODULE_DESCRIPTION("Qualcomm Milos LPI GPIO pin control driver");
+MODULE_LICENSE("GPL");

-- 
2.53.0


