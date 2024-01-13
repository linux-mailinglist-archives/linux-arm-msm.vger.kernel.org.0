Return-Path: <linux-arm-msm+bounces-7174-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 497CE82C9AD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jan 2024 06:43:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C85501F23A8D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jan 2024 05:43:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 446FF1A286;
	Sat, 13 Jan 2024 05:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OZ9zstdI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E71D1AAA9
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jan 2024 05:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2ccec119587so87380181fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jan 2024 21:42:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705124570; x=1705729370; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z5irpYM5MTpJq3VqIMDtY9CGRoQJVYlNPi44Y66fgdM=;
        b=OZ9zstdIbLrqrj4dUOR4sly9iF9tMXKCeus7RygTBeOvTCsyLFyl4h7zlv/ZBgjKQk
         jlqc6xSTvUMJQWGSKRRhkpWNpDk2+1NXyPqs4DmDnF2TILXpQoHt1vJBp8UK+BHEkS7j
         hjZzzmWCvQc79lLgmj4pfChvc05FosccuWeoRBsldQ37zZA/T4/h9LhcjOzD4qm/FSy3
         tkhHYJ0GPOvZpeNGMDZ9UaE1s1DvNJVngPozudrRn4KyANapGeE0aXKs7eXPz1b4AKsU
         VvIGWKtfVsfQpJdThG8ryGfFrhoO893nE9uSQj5xZ6dB71r5w4wuS2SCPf2mkA/c4PwX
         8R/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705124570; x=1705729370;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z5irpYM5MTpJq3VqIMDtY9CGRoQJVYlNPi44Y66fgdM=;
        b=TyTvMfMe6q6DeG2dGdlalVFfvN5dnGwJJ/nqmkDH5yv3q0uUCA9TBW6q3qV2EMnE2+
         NfSLy0jCPrYcWlXy/P3Gr0P0b9nFn0cT81A6/NwTtzCq/m3hjmTcDRCLpVndkLhDHPN2
         E+931wqHn49uSh9tmfaShcrcgkzwOeJC5kgA5VecuEqCwQ+/Rjm75eK6WoA+xJ//jpPc
         AJjIlZlF5oBI3KTwLzhqDvU4xyIh6wEJv7PAG9x/VnBG0G/316UyQFMqTKcXv2uAgobN
         a1SwY5ibxZvsoJDqi4NdNom+7zF07XI1pdhqrYSr8i+cPmmrsPC+uZMJK3+FnJJ+I5wW
         MNQw==
X-Gm-Message-State: AOJu0YwQi6fkUR6QJPcvkxOO7/hhgeNrIPn70oP4vQKJfcZBvFWEMnGp
	PaiiVX40EMTpP+C9eWBDIFYWgTAyYCJJmQ==
X-Google-Smtp-Source: AGHT+IHgLTCBUBb+cumPz42qHGnYZI45jV8ou7S+J/ZocJ/9+xC5j1fd9zLANoBkfFDBc7IR9hb5Vg==
X-Received: by 2002:a2e:98d4:0:b0:2cc:fe03:4360 with SMTP id s20-20020a2e98d4000000b002ccfe034360mr1325938ljj.24.1705124570525;
        Fri, 12 Jan 2024 21:42:50 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id r22-20020a2eb616000000b002cc71e9168csm677719ljn.129.2024.01.12.21.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 21:42:50 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 13 Jan 2024 07:42:47 +0200
Subject: [PATCH 10/13] phy: qcom: qmp-usbc: add support for the Type-C
 handling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240113-pmi632-typec-v1-10-de7dfd459353@linaro.org>
References: <20240113-pmi632-typec-v1-0-de7dfd459353@linaro.org>
In-Reply-To: <20240113-pmi632-typec-v1-0-de7dfd459353@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=5166;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=vrGMpxrK0VSYVpeyxHuCQp6gFuTsIdr2EtQDlSiiH6Y=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBloiLR1IiCvPDQIJxTk7qswUkejvN9Hk5ieoTCU
 gqFwEGaw1OJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZaIi0QAKCRCLPIo+Aiko
 1QJuCACb3srGHjAYjlfjgCSx4EPBnhy083HxD8b9m48H5Z32tNkKO13DRO4gTl/MF3ksLubXKua
 omVVcyFbxskE0BPiR1Y+WG73f600A+K9/WDgGEK1V1FnadjjDzM+EHoEEucYm5GdeLGVZbAEodc
 wU3GV2vD/wAsk8iukiphskvHhdAbwe1uwrwGVwvnLXpmiuyzvV4t2lS978vN8V0Up/1aHdQ1qWE
 lVu85OoovoHHrQMEFnW4TsBKCMskSOEhwklhCdYUuDfdU+QYp9lKlECPfanmWSjXJvwcQPSCOR+
 Mnb6fqHrZWMxBs/MeJ6Fm2ks5c2C7/a7nuTks+YR0pPAKhHq
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The USB-C PHYs on the msm8998, QCM2290 and SM6115 platforms use special
register to control which lanes of the Type-C port are used for the
SuperSpeed USB connection. Mimic the qmp-combo driver and handle this
register.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 97 +++++++++++++++++++++++++++++++-
 1 file changed, 94 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index 21faed7f648a..9cddba30b52e 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -18,6 +18,8 @@
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
+#include <linux/usb/typec.h>
+#include <linux/usb/typec_mux.h>
 
 #include "phy-qcom-qmp.h"
 #include "phy-qcom-qmp-pcs-misc-v3.h"
@@ -381,11 +383,17 @@ struct qmp_usbc {
 	struct reset_control_bulk_data *resets;
 	struct regulator_bulk_data *vregs;
 
+	struct mutex phy_mutex;
+
 	enum phy_mode mode;
+	unsigned int usb_init_count;
 
 	struct phy *phy;
 
 	struct clk_fixed_rate pipe_clk_fixed;
+
+	struct typec_switch_dev *sw;
+	enum typec_orientation orientation;
 };
 
 static inline void qphy_setbits(void __iomem *base, u32 offset, u32 val)
@@ -516,6 +524,7 @@ static int qmp_usbc_init(struct phy *phy)
 	struct qmp_usbc *qmp = phy_get_drvdata(phy);
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
 	void __iomem *pcs = qmp->pcs;
+	u32 val = 0;
 	int ret;
 
 	ret = regulator_bulk_enable(cfg->num_vregs, qmp->vregs);
@@ -542,6 +551,14 @@ static int qmp_usbc_init(struct phy *phy)
 
 	qphy_setbits(pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL], SW_PWRDN);
 
+#define SW_PORTSELECT_VAL			BIT(0)
+#define SW_PORTSELECT_MUX			BIT(1)
+	/* Use software based port select and switch on typec orientation */
+	val = SW_PORTSELECT_MUX;
+	if (qmp->orientation == TYPEC_ORIENTATION_REVERSE)
+		val |= SW_PORTSELECT_VAL;
+	writel(val, qmp->pcs_misc);
+
 	return 0;
 
 err_assert_reset:
@@ -646,23 +663,34 @@ static int qmp_usbc_power_off(struct phy *phy)
 
 static int qmp_usbc_enable(struct phy *phy)
 {
+	struct qmp_usbc *qmp = phy_get_drvdata(phy);
 	int ret;
 
+	mutex_lock(&qmp->phy_mutex);
+
 	ret = qmp_usbc_init(phy);
 	if (ret)
-		return ret;
+		goto out_unlock;
 
 	ret = qmp_usbc_power_on(phy);
-	if (ret)
+	if (ret) {
 		qmp_usbc_exit(phy);
+		goto out_unlock;
+	}
+
+	qmp->usb_init_count++;
+out_unlock:
+	mutex_unlock(&qmp->phy_mutex);
 
 	return ret;
 }
 
 static int qmp_usbc_disable(struct phy *phy)
 {
+	struct qmp_usbc *qmp = phy_get_drvdata(phy);
 	int ret;
 
+	qmp->usb_init_count--;
 	ret = qmp_usbc_power_off(phy);
 	if (ret)
 		return ret;
@@ -900,6 +928,61 @@ static int phy_pipe_clk_register(struct qmp_usbc *qmp, struct device_node *np)
 	return devm_add_action_or_reset(qmp->dev, phy_clk_release_provider, np);
 }
 
+#if IS_ENABLED(CONFIG_TYPEC)
+static int qmp_usbc_typec_switch_set(struct typec_switch_dev *sw,
+				      enum typec_orientation orientation)
+{
+	struct qmp_usbc *qmp = typec_switch_get_drvdata(sw);
+
+	if (orientation == qmp->orientation || orientation == TYPEC_ORIENTATION_NONE)
+		return 0;
+
+	mutex_lock(&qmp->phy_mutex);
+	qmp->orientation = orientation;
+
+	if (qmp->usb_init_count) {
+		qmp_usbc_power_off(qmp->phy);
+		qmp_usbc_exit(qmp->phy);
+
+		qmp_usbc_init(qmp->phy);
+		qmp_usbc_power_on(qmp->phy);
+	}
+
+	mutex_unlock(&qmp->phy_mutex);
+
+	return 0;
+}
+
+static void qmp_usbc_typec_unregister(void *data)
+{
+	struct qmp_usbc *qmp = data;
+
+	typec_switch_unregister(qmp->sw);
+}
+
+static int qmp_usbc_typec_switch_register(struct qmp_usbc *qmp)
+{
+	struct typec_switch_desc sw_desc = {};
+	struct device *dev = qmp->dev;
+
+	sw_desc.drvdata = qmp;
+	sw_desc.fwnode = dev->fwnode;
+	sw_desc.set = qmp_usbc_typec_switch_set;
+	qmp->sw = typec_switch_register(dev, &sw_desc);
+	if (IS_ERR(qmp->sw)) {
+		dev_err(dev, "Unable to register typec switch: %pe\n", qmp->sw);
+		return PTR_ERR(qmp->sw);
+	}
+
+	return devm_add_action_or_reset(dev, qmp_usbc_typec_unregister, qmp);
+}
+#else
+static int qmp_usbc_typec_switch_register(struct qmp_usbc *qmp)
+{
+	return 0;
+}
+#endif
+
 static int qmp_usbc_parse_dt_legacy(struct qmp_usbc *qmp, struct device_node *np)
 {
 	struct platform_device *pdev = to_platform_device(qmp->dev);
@@ -1027,16 +1110,24 @@ static int qmp_usbc_probe(struct platform_device *pdev)
 
 	qmp->dev = dev;
 
+	qmp->orientation = TYPEC_ORIENTATION_NORMAL;
+
 	qmp->cfg = of_device_get_match_data(dev);
 	if (!qmp->cfg)
 		return -EINVAL;
 
+	mutex_init(&qmp->phy_mutex);
+
 	ret = qmp_usbc_vreg_init(qmp);
 	if (ret)
 		return ret;
 
+	ret = qmp_usbc_typec_switch_register(qmp);
+	if (ret)
+		return ret;
+
 	/* Check for legacy binding with child node. */
-	np = of_get_next_available_child(dev->of_node, NULL);
+	np = of_get_child_by_name(dev->of_node, "phy");
 	if (np) {
 		ret = qmp_usbc_parse_dt_legacy(qmp, np);
 	} else {

-- 
2.39.2


