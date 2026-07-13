Return-Path: <linux-arm-msm+bounces-118875-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9mQLJhBFVWosmQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118875-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 22:05:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E788074EF0F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 22:05:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=VaptUl05;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118875-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118875-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BA79A302D13E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 20:05:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ACF235AC2C;
	Mon, 13 Jul 2026 20:05:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4A32D46B3;
	Mon, 13 Jul 2026 20:05:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783973134; cv=none; b=BUyzfodJfDRdzOQUDewBflRftNxvx5U6a/JeGqPb6z3oND24aSDrssJ8KE1lB7sH5sOywZ5oAbegylXxKZXPPi7dgUJ561uJkWT8V53go0AwBT4GPli5lk2DZ2nUpp+M6nVN4cWe8q1mmVR7gm2T/H11iVUBlGuDmyTREw9OSOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783973134; c=relaxed/simple;
	bh=8c5WwOhY3CXvoJT4w0whyVKwCKAi3oCOYGRu/091b30=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ipVkwt3lt5Zo8UMYsy4eftVIzVB0ZnX3rS2Cqz1oETsrE3hLXXLKT+6o4slCXTvftJYWvdD7dDSqI1LG4YSr2SpTha9jpe2QqpH1k8nDgIVtl690zb5Te+rNT/yLAhHBBNFec8QhYcgZZv2oreN68bBlh+Ez7TddlcZhW0SsDVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VaptUl05; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A0863C2BCF5;
	Mon, 13 Jul 2026 20:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783973133;
	bh=8c5WwOhY3CXvoJT4w0whyVKwCKAi3oCOYGRu/091b30=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=VaptUl05dzjZhMKvxVrB9xY4+QGXTaiGJzdZp83HQZhcQqXMwac9iEtBSxJQkO268
	 m24gY2HiCSLo3pPbTpMm5RINQtJxQJ0BEdkIrylK2I8GKOU1RlW9AeytlXLnnaIFnu
	 OeNu920yaggKUVJeiwr/42Kw2w7ZvKA06lH1colRbNvjmU2xCpCieSVoUkCd2YZUtU
	 OD1OrtPTpSLLnTgJImDF3/ySQdhBw5reIy9X9rQlhDW0U2Pxnva8BJdVV18cWsyKeu
	 ciRqwm6EW81x2yU86sT1AnZvM8QNTVJl/0KrgUc1KCmV3PFqg9DeCBwvc2jNm1rJJR
	 S6zpBFaLbb+TA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F37DC44508;
	Mon, 13 Jul 2026 20:05:33 +0000 (UTC)
From: Sarath Ganapathiraju via B4 Relay <devnull+sarath.ganapathiraju.oss.qualcomm.com@kernel.org>
Date: Tue, 14 Jul 2026 01:35:33 +0530
Subject: [PATCH 2/2] ASoC: Add LPASS VA CSR heartbeat pulse clock
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-master-v1-2-1ebe5993225e@oss.qualcomm.com>
References: <20260714-master-v1-0-1ebe5993225e@oss.qualcomm.com>
In-Reply-To: <20260714-master-v1-0-1ebe5993225e@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 prasad.kumpatla@oss.qualcomm.com, 
 Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783973132; l=6958;
 i=sarath.ganapathiraju@oss.qualcomm.com; s=default;
 h=from:subject:message-id;
 bh=ypNbWhmhzRsGcz5RvLQ5KhScCqzC7URlIIzBE8KzUXI=;
 b=jWXpRi8qLEsCDpGs2R6QKLBtDQk4IyUTfcDPlrAlxRTTyCCZ928q3c0qQxjMrF4WR4+pz5iXF
 JUKHA4nbeKHBchnSagbHeaPQ8gxJSjduHsSAb8bDp2qnSFVGguuddYQ
X-Developer-Key: i=sarath.ganapathiraju@oss.qualcomm.com; a=ed25519;
 pk=4p2FWGXM+F2sir13Lu5stw5aKX5trUymK/ttESvgxQg=
X-Endpoint-Received: by B4 Relay for
 sarath.ganapathiraju@oss.qualcomm.com/default with auth_id=870
X-Original-From: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
Reply-To: sarath.ganapathiraju@oss.qualcomm.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118875-lists,linux-arm-msm=lfdr.de,sarath.ganapathiraju.oss.qualcomm.com];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:srinivas.kandagatla@oss.qualcomm.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prasad.kumpatla@oss.qualcomm.com,m:sarath.ganapathiraju@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	HAS_REPLYTO(0.00)[sarath.ganapathiraju@oss.qualcomm.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,oss.qualcomm.com:mid,oss.qualcomm.com:replyto]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E788074EF0F

From: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>

The HeartBeat Pulse (also known as RateGen Pulse) synchronizes the
start of the DMAs and Codec Interfaces for the audio usecases
and can serve as a periodic wakeup source for the DSP.

Add the LPASS VA CSR driver that models the rate generator as a clock
provider so it is enabled and disabled automatically alongside the
other clocks during runtime PM resume and suspend.

Signed-off-by: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
---
 sound/soc/codecs/Kconfig        |  13 ++++
 sound/soc/codecs/Makefile       |   2 +
 sound/soc/codecs/lpass-va-csr.c | 143 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 158 insertions(+)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index a41d0f508..e898c34a6 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -2902,11 +2902,24 @@ config SND_SOC_LPASS_WSA_MACRO
 	select SND_SOC_LPASS_MACRO_COMMON
 	tristate "Qualcomm WSA Macro in LPASS(Low Power Audio SubSystem)"
 
+config SND_SOC_LPASS_VA_CSR
+	depends on COMMON_CLK
+	select REGMAP_MMIO
+	tristate "Qualcomm LPASS VA CSR heartbeat pulse clock provider"
+	help
+	  Qualcomm LPASS VA CSR block contains the rate generator hardware
+	  that produces the HeartBeat Pulse (also known as RateGen Pulse).
+	  This driver models the rate generator as a clock provider so
+	  that consumers can enable or disable it via the common clock
+	  framework, and it can be used to synchronize the start of DMAs
+	  and Codec Interfaces or as a periodic wakeup source for the DSP.
+
 config SND_SOC_LPASS_VA_MACRO
 	depends on COMMON_CLK
 	depends on PM_CLK
 	select REGMAP_MMIO
 	select SND_SOC_LPASS_MACRO_COMMON
+	select SND_SOC_LPASS_VA_CSR
 	tristate "Qualcomm VA Macro in LPASS(Low Power Audio SubSystem)"
 
 config SND_SOC_LPASS_RX_MACRO
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index aa0396e5b..3e86c1bbf 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -163,6 +163,7 @@ snd-soc-lpass-rx-macro-y := lpass-rx-macro.o
 snd-soc-lpass-tx-macro-y := lpass-tx-macro.o
 snd-soc-lpass-wsa-macro-y := lpass-wsa-macro.o
 snd-soc-lpass-va-macro-y := lpass-va-macro.o
+snd-soc-lpass-va-csr-y := lpass-va-csr.o
 snd-soc-madera-y := madera.o
 snd-soc-max9759-y := max9759.o
 snd-soc-max9768-y := max9768.o
@@ -886,6 +887,7 @@ obj-$(CONFIG_SND_SOC_TPA6130A2)	+= snd-soc-tpa6130a2.o
 obj-$(CONFIG_SND_SOC_LPASS_MACRO_COMMON)	+= snd-soc-lpass-macro-common.o
 obj-$(CONFIG_SND_SOC_LPASS_WSA_MACRO)	+= snd-soc-lpass-wsa-macro.o
 obj-$(CONFIG_SND_SOC_LPASS_VA_MACRO)	+= snd-soc-lpass-va-macro.o
+obj-$(CONFIG_SND_SOC_LPASS_VA_CSR)	+= snd-soc-lpass-va-csr.o
 obj-$(CONFIG_SND_SOC_LPASS_RX_MACRO)	+= snd-soc-lpass-rx-macro.o
 obj-$(CONFIG_SND_SOC_LPASS_TX_MACRO)	+= snd-soc-lpass-tx-macro.o
 
diff --git a/sound/soc/codecs/lpass-va-csr.c b/sound/soc/codecs/lpass-va-csr.c
new file mode 100644
index 000000000..14aec8f94
--- /dev/null
+++ b/sound/soc/codecs/lpass-va-csr.c
@@ -0,0 +1,143 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/of_clk.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#define LPASS_RATE_GEN_CTRL		0xD000
+#define LPASS_RATE_GEN_COUNTER_0	0xD004
+#define LPASS_RATE_GEN_DELAY		0xD010
+
+#define LPASS_RATE_GEN_MAX_REG		LPASS_RATE_GEN_DELAY
+
+#define LPASS_RG_CTRL_EN		BIT(0)
+
+struct lpass_va_csr_data {
+	u32 counter_0;
+	u32 delay;
+};
+
+static const struct lpass_va_csr_data hawi_csr_data = {
+	.counter_0 = 0x960,
+	.delay = 0x16,
+};
+
+static const struct regmap_config lpass_rate_gen_regmap_config = {
+	.name = "lpass_rate_gen",
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.max_register = LPASS_RATE_GEN_MAX_REG,
+	.cache_type = REGCACHE_MAPLE,
+};
+
+struct lpass_va_csr {
+	struct regmap *regmap;
+	const struct lpass_va_csr_data *data;
+	struct clk_hw hb_hw;
+};
+
+#define to_lpass_va_csr(_hw) container_of(_hw, struct lpass_va_csr, hb_hw)
+
+static int heartbeat_pulse_enable(struct clk_hw *hw)
+{
+	struct lpass_va_csr *csr = to_lpass_va_csr(hw);
+
+	regmap_write(csr->regmap, LPASS_RATE_GEN_COUNTER_0, csr->data->counter_0);
+	regmap_write(csr->regmap, LPASS_RATE_GEN_DELAY, csr->data->delay);
+	regmap_update_bits(csr->regmap, LPASS_RATE_GEN_CTRL,
+			   LPASS_RG_CTRL_EN, LPASS_RG_CTRL_EN);
+
+	return 0;
+}
+
+static void heartbeat_pulse_disable(struct clk_hw *hw)
+{
+	struct lpass_va_csr *csr = to_lpass_va_csr(hw);
+
+	regmap_update_bits(csr->regmap, LPASS_RATE_GEN_CTRL,
+			   LPASS_RG_CTRL_EN, 0);
+}
+
+static int heartbeat_pulse_is_enabled(struct clk_hw *hw)
+{
+	struct lpass_va_csr *csr = to_lpass_va_csr(hw);
+	unsigned int val;
+
+	regmap_read(csr->regmap, LPASS_RATE_GEN_CTRL, &val);
+
+	return !!(val & LPASS_RG_CTRL_EN);
+}
+
+static const struct clk_ops heartbeat_pulse_ops = {
+	.enable = heartbeat_pulse_enable,
+	.disable = heartbeat_pulse_disable,
+	.is_enabled = heartbeat_pulse_is_enabled,
+};
+
+static int lpass_va_csr_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct lpass_va_csr *csr;
+	struct clk_init_data init = {
+		.name = "lpass_heartbeat_pulse",
+		.ops = &heartbeat_pulse_ops,
+	};
+	void __iomem *base;
+	int ret;
+
+	csr = devm_kzalloc(dev, sizeof(*csr), GFP_KERNEL);
+	if (!csr)
+		return -ENOMEM;
+
+	csr->data = of_device_get_match_data(dev);
+	if (!csr->data)
+		return dev_err_probe(dev, -EINVAL, "no variant data for compatible\n");
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	csr->regmap = devm_regmap_init_mmio(dev, base,
+					    &lpass_rate_gen_regmap_config);
+	if (IS_ERR(csr->regmap))
+		return dev_err_probe(dev, PTR_ERR(csr->regmap),
+				     "failed to init regmap\n");
+
+	csr->hb_hw.init = &init;
+
+	ret = devm_clk_hw_register(dev, &csr->hb_hw);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to register heartbeat clock\n");
+
+	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, &csr->hb_hw);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to add clock provider\n");
+
+	return 0;
+}
+
+static const struct of_device_id lpass_va_csr_dt_match[] = {
+	{ .compatible = "qcom,hawi-lpass-va-csr", .data = &hawi_csr_data },
+	{}
+};
+MODULE_DEVICE_TABLE(of, lpass_va_csr_dt_match);
+
+static struct platform_driver lpass_va_csr_driver = {
+	.driver = {
+		.name = "qcom-lpass-va-csr",
+		.of_match_table = lpass_va_csr_dt_match,
+	},
+	.probe = lpass_va_csr_probe,
+};
+
+module_platform_driver(lpass_va_csr_driver);
+
+MODULE_DESCRIPTION("Qualcomm LPASS VA CSR heartbeat pulse clock provider");
+MODULE_LICENSE("GPL");

-- 
2.34.1



