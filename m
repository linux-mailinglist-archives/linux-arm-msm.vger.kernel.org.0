Return-Path: <linux-arm-msm+bounces-130-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 987837E4CD1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Nov 2023 00:23:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4CB972812D6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 23:23:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5793130675;
	Tue,  7 Nov 2023 23:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SVuKPU29"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389B930670
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Nov 2023 23:23:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8BD7C433C9;
	Tue,  7 Nov 2023 23:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699399421;
	bh=FfSoOLJSjIvu9bYP8bifjYJkIGSvPBT800ZV1f55glA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SVuKPU29Z1kTqpcofaX7xdnZddlSu5g8mzzztGo8rGZQjaKBY6VelZ4aLnh95LvE7
	 1Fsq6aXn5ojfISNCbOeMqOH0EhxFenxv7EaewX5zZBnBfqOF3HYj31tcver6nGHanL
	 xwm7zttrVrpsloimACqpkCQLb8Y2vF2PFZG7FI9o7cMFAvQlGdFLiucDqnOS5wGG+1
	 F/5YQlpS3bAKDgTHYqgUfPTRbSfMri8eWNcvx3dzU8rSwYvE+PIzjyHXP4rp+1YA9y
	 6NJ7WxsDXetfknqmtI1dMGYjCbjEt3tJDO5frQ8q8TUzGHpAYmC8CX+WuA8u2jaxw2
	 bv3fY+tX3DOeA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	agross@kernel.org,
	andersson@kernel.org,
	kishon@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org
Subject: [PATCH AUTOSEL 6.5 05/18] phy: qualcomm: phy-qcom-eusb2-repeater: Use regmap_fields
Date: Tue,  7 Nov 2023 18:23:00 -0500
Message-ID: <20231107232330.3776001-5-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107232330.3776001-1-sashal@kernel.org>
References: <20231107232330.3776001-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.5.10
Content-Transfer-Encoding: 8bit

From: Konrad Dybcio <konrad.dybcio@linaro.org>

[ Upstream commit 4ba2e52718c0ce4ece6a269bec84319c355c030f ]

Switch to regmap_fields, so that the values written into registers are
sanitized by their explicit sizes and the different registers are
structured in an iterable object to make external changes to the init
sequence simpler.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Link: https://lore.kernel.org/r/20230830-topic-eusb2_override-v2-2-7d8c893d93f6@linaro.org
Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../phy/qualcomm/phy-qcom-eusb2-repeater.c    | 91 +++++++++++++------
 1 file changed, 61 insertions(+), 30 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c b/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
index 90f8543ba265b..b20b805414a2a 100644
--- a/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
+++ b/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
@@ -29,14 +29,42 @@
 #define EUSB2_TUNE_SQUELCH_U		0x54
 #define EUSB2_TUNE_USB2_PREEM		0x57
 
-#define QCOM_EUSB2_REPEATER_INIT_CFG(o, v)	\
+#define QCOM_EUSB2_REPEATER_INIT_CFG(r, v)	\
 	{					\
-		.offset = o,			\
+		.reg = r,			\
 		.val = v,			\
 	}
 
+enum reg_fields {
+	F_TUNE_USB2_PREEM,
+	F_TUNE_SQUELCH_U,
+	F_TUNE_IUSB2,
+	F_NUM_TUNE_FIELDS,
+
+	F_FORCE_VAL_5 = F_NUM_TUNE_FIELDS,
+	F_FORCE_EN_5,
+
+	F_EN_CTL1,
+
+	F_RPTR_STATUS,
+	F_NUM_FIELDS,
+};
+
+static struct reg_field eusb2_repeater_tune_reg_fields[F_NUM_FIELDS] = {
+	[F_TUNE_USB2_PREEM] = REG_FIELD(EUSB2_TUNE_USB2_PREEM, 0, 2),
+	[F_TUNE_SQUELCH_U] = REG_FIELD(EUSB2_TUNE_SQUELCH_U, 0, 2),
+	[F_TUNE_IUSB2] = REG_FIELD(EUSB2_TUNE_IUSB2, 0, 3),
+
+	[F_FORCE_VAL_5] = REG_FIELD(EUSB2_FORCE_VAL_5, 0, 7),
+	[F_FORCE_EN_5] = REG_FIELD(EUSB2_FORCE_EN_5, 0, 7),
+
+	[F_EN_CTL1] = REG_FIELD(EUSB2_EN_CTL1, 0, 7),
+
+	[F_RPTR_STATUS] = REG_FIELD(EUSB2_RPTR_STATUS, 0, 7),
+};
+
 struct eusb2_repeater_init_tbl {
-	unsigned int offset;
+	unsigned int reg;
 	unsigned int val;
 };
 
@@ -49,11 +77,10 @@ struct eusb2_repeater_cfg {
 
 struct eusb2_repeater {
 	struct device *dev;
-	struct regmap *regmap;
+	struct regmap_field *regs[F_NUM_FIELDS];
 	struct phy *phy;
 	struct regulator_bulk_data *vregs;
 	const struct eusb2_repeater_cfg *cfg;
-	u16 base;
 	enum phy_mode mode;
 };
 
@@ -62,9 +89,9 @@ static const char * const pm8550b_vreg_l[] = {
 };
 
 static const struct eusb2_repeater_init_tbl pm8550b_init_tbl[] = {
-	QCOM_EUSB2_REPEATER_INIT_CFG(EUSB2_TUNE_IUSB2, 0x8),
-	QCOM_EUSB2_REPEATER_INIT_CFG(EUSB2_TUNE_SQUELCH_U, 0x3),
-	QCOM_EUSB2_REPEATER_INIT_CFG(EUSB2_TUNE_USB2_PREEM, 0x5),
+	QCOM_EUSB2_REPEATER_INIT_CFG(F_TUNE_IUSB2, 0x8),
+	QCOM_EUSB2_REPEATER_INIT_CFG(F_TUNE_SQUELCH_U, 0x3),
+	QCOM_EUSB2_REPEATER_INIT_CFG(F_TUNE_USB2_PREEM, 0x5),
 };
 
 static const struct eusb2_repeater_cfg pm8550b_eusb2_cfg = {
@@ -94,7 +121,6 @@ static int eusb2_repeater_init(struct phy *phy)
 {
 	struct eusb2_repeater *rptr = phy_get_drvdata(phy);
 	const struct eusb2_repeater_init_tbl *init_tbl = rptr->cfg->init_tbl;
-	int num = rptr->cfg->init_tbl_num;
 	u32 val;
 	int ret;
 	int i;
@@ -103,17 +129,14 @@ static int eusb2_repeater_init(struct phy *phy)
 	if (ret)
 		return ret;
 
-	regmap_update_bits(rptr->regmap, rptr->base + EUSB2_EN_CTL1,
-			   EUSB2_RPTR_EN, EUSB2_RPTR_EN);
+	regmap_field_update_bits(rptr->regs[F_EN_CTL1], EUSB2_RPTR_EN, EUSB2_RPTR_EN);
 
-	for (i = 0; i < num; i++)
-		regmap_update_bits(rptr->regmap,
-				   rptr->base + init_tbl[i].offset,
-				   init_tbl[i].val, init_tbl[i].val);
+	for (i = 0; i < rptr->cfg->init_tbl_num; i++)
+		regmap_field_update_bits(rptr->regs[init_tbl[i].reg],
+					 init_tbl[i].val, init_tbl[i].val);
 
-	ret = regmap_read_poll_timeout(rptr->regmap,
-				       rptr->base + EUSB2_RPTR_STATUS, val,
-				       val & RPTR_OK, 10, 5);
+	ret = regmap_field_read_poll_timeout(rptr->regs[F_RPTR_STATUS],
+					     val, val & RPTR_OK, 10, 5);
 	if (ret)
 		dev_err(rptr->dev, "initialization timed-out\n");
 
@@ -132,10 +155,10 @@ static int eusb2_repeater_set_mode(struct phy *phy,
 		 * per eUSB 1.2 Spec. Below implement software workaround until
 		 * PHY and controller is fixing seen observation.
 		 */
-		regmap_update_bits(rptr->regmap, rptr->base + EUSB2_FORCE_EN_5,
-				   F_CLK_19P2M_EN, F_CLK_19P2M_EN);
-		regmap_update_bits(rptr->regmap, rptr->base + EUSB2_FORCE_VAL_5,
-				   V_CLK_19P2M_EN, V_CLK_19P2M_EN);
+		regmap_field_update_bits(rptr->regs[F_FORCE_EN_5],
+					 F_CLK_19P2M_EN, F_CLK_19P2M_EN);
+		regmap_field_update_bits(rptr->regs[F_FORCE_VAL_5],
+					 V_CLK_19P2M_EN, V_CLK_19P2M_EN);
 		break;
 	case PHY_MODE_USB_DEVICE:
 		/*
@@ -144,10 +167,10 @@ static int eusb2_repeater_set_mode(struct phy *phy,
 		 * repeater doesn't clear previous value due to shared
 		 * regulators (say host <-> device mode switch).
 		 */
-		regmap_update_bits(rptr->regmap, rptr->base + EUSB2_FORCE_EN_5,
-				   F_CLK_19P2M_EN, 0);
-		regmap_update_bits(rptr->regmap, rptr->base + EUSB2_FORCE_VAL_5,
-				   V_CLK_19P2M_EN, 0);
+		regmap_field_update_bits(rptr->regs[F_FORCE_EN_5],
+					 F_CLK_19P2M_EN, 0);
+		regmap_field_update_bits(rptr->regs[F_FORCE_VAL_5],
+					 V_CLK_19P2M_EN, 0);
 		break;
 	default:
 		return -EINVAL;
@@ -176,8 +199,9 @@ static int eusb2_repeater_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct phy_provider *phy_provider;
 	struct device_node *np = dev->of_node;
+	struct regmap *regmap;
+	int i, ret;
 	u32 res;
-	int ret;
 
 	rptr = devm_kzalloc(dev, sizeof(*rptr), GFP_KERNEL);
 	if (!rptr)
@@ -190,15 +214,22 @@ static int eusb2_repeater_probe(struct platform_device *pdev)
 	if (!rptr->cfg)
 		return -EINVAL;
 
-	rptr->regmap = dev_get_regmap(dev->parent, NULL);
-	if (!rptr->regmap)
+	regmap = dev_get_regmap(dev->parent, NULL);
+	if (!regmap)
 		return -ENODEV;
 
 	ret = of_property_read_u32(np, "reg", &res);
 	if (ret < 0)
 		return ret;
 
-	rptr->base = res;
+	for (i = 0; i < F_NUM_FIELDS; i++)
+		eusb2_repeater_tune_reg_fields[i].reg += res;
+
+	ret = devm_regmap_field_bulk_alloc(dev, regmap, rptr->regs,
+					   eusb2_repeater_tune_reg_fields,
+					   F_NUM_FIELDS);
+	if (ret)
+		return ret;
 
 	ret = eusb2_repeater_init_vregs(rptr);
 	if (ret < 0) {
-- 
2.42.0


