Return-Path: <linux-arm-msm+bounces-76072-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E787ABBE3E4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Oct 2025 15:55:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C73874EB59E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Oct 2025 13:55:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFDDB2D4818;
	Mon,  6 Oct 2025 13:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cMLvpT2W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862DB2D3A9D
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Oct 2025 13:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759758918; cv=none; b=ckZ0UPk12pTaohNN0ZN7kIuPXsHnxmXIu0n0NY5HeWO5wJqvKdIJhJ9Aj2H4l+gHdEuZ8YKHN84AbrhYNRCLsObWfNLHs6Kc0FlXpX9TdjUjQ/hIpGE3lENMaPKEKLujlYGTY4VGhSLON1+uuNwpmgAOORVtt6JmGjCX84kZopc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759758918; c=relaxed/simple;
	bh=Jvq57DphFi7wtmww07r08dRLu0LQHutOYqaDw8wnv1Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kW+YamE/pJD4E+EkpX13yrjfQc+rWxnrbKF8XeH45EzSivLo0avWMQ9J4ya+fWS/FhBhnAZsWBEL6kWLKxyRydrfnRLi1hBgmA+sZWsdACoEUMJMu3rYA6IiGUMXCbN8D6AOScOd4rz8CG7R4cmh5saBcXxSZg5NcpY9xOOqNz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cMLvpT2W; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-46e6a689bd0so39061485e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 06:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759758914; x=1760363714; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+3PwY2Su8FGUm8I2o7iZNHQaUPPiuR6Gy8cotqp3czU=;
        b=cMLvpT2WFGB+xfYwfvbGSxh50j9y00BKrLzeAFuuXMwxOePU2p3HgXbp2n9DYmswea
         LyZy37sK9HOdVXOI+sk1Kt/YB+9uJ5NRgdcEfawh72FOo+T67hJF1muVHAe3C+9EWUYc
         Gcqec8wDKAv58xxN3COICmoLWzb63DVnTs1hCWrM6J71ZYIzmkiKUlYXBzWdZNQAkcXL
         2r3zm9H1QXaeIKqecluFgKjyTV9AxP46LA3Y/Yy63YFEBj6bgQ2K7e05NzCUt8e1e3Vx
         iP2A6e5V2Zx5iPzE5Hi1Xw9hZeZHTNgqBREc57NY1edEb52+kt8EYY+u1Vi8RdUXHc4D
         GCSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759758914; x=1760363714;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+3PwY2Su8FGUm8I2o7iZNHQaUPPiuR6Gy8cotqp3czU=;
        b=hgwrsh/4Pi2KrKP0pQegC9yGUZNpbE9WdwI0h1kc4KuvyCnRa1mByvlu7Xq6TWTxYp
         glajOP2kljhed41/p5wh8B1w2O8OLC5oOVolQOt4sI+8EVfHw90kKRsDOxtDYT/umIjQ
         kXGwV4hzGdaIQ7i7rrAtCyQeTa2mONYga125kvL6CrBIZB8n2MEYFefgt6WprKtg+6Ud
         hZuIa4Kbfc7BrmGLHUecuJYfRJI4dB6ti5tVg8krTD3cb78js4zyT2aF3x3DSotKu5Zb
         8nTnVQ6BN9HDfsqDMbWvLqUNDNl28rDUdEdKRvVjReFwAiEbXlbu1vYcNyz3GDQ6rhbe
         1VVg==
X-Forwarded-Encrypted: i=1; AJvYcCXbsdJG5a4E1/+KYkFz785Fo/g0HrXEH+cy3+wfvXQW9WsrCIiP1YVuwr4Z7Qc9WK6JbMbB5vL+HcoaZPMm@vger.kernel.org
X-Gm-Message-State: AOJu0Yy43KPYe8lS1rxNrsq7T2/J4ewBmRuUvN/4NFoitW6J+pAv6PaZ
	mFeRaXSMBqMjaEnD8Rzy20UrzjFadesKKUwMOmXjIJsUqSGNKdBYRyb/XUL75MCe7cs=
X-Gm-Gg: ASbGncsQXfKo50dmqrgIUjTp82T38pRA73xbgXgOksATK89curJZTn6/ky3VIQGRuft
	EpMKfQ341Bt63A57yelobkeghiDlDXLqSktehYlchDhPArnCwtN7uY487jEXSKMAmCz27ObLC/I
	DaFrK/CDk95jrq0B2ibVnlNMX3d35BPpY95qFE/VesTKwPON24fLz/D00dzArjiPz+gSnob9UEp
	2s/yQ4Dll1Y+VlzsE57LvReVOyLmVRJMmd7Wp21h4iGOfxAuACzq55hjKskniljc/C6etoSpeqc
	d/I/3VBNPYQmb/BAOrsSqcMbylNPBgEDfM4Vv03mlDc994YQFg0Ou7slMbazT7CsQsOZnzBO4mP
	U9nsPxmCq3RaqN4IWI9WRn6krGNK4cpHqyZJQpxYHEXxtvEy52fYYdgwf6zHYFGnbu0hRyDI=
X-Google-Smtp-Source: AGHT+IE1WdC9uOmXoaHZ/kUEuDfuryRH8fzwZAqkoRcIFoX1p4U9e95Adhwxwb44aVahTYfD8Cr7jA==
X-Received: by 2002:a05:600c:621a:b0:46e:2801:84aa with SMTP id 5b1f17b1804b1-46e710b22a6mr88635645e9.0.1759758913732;
        Mon, 06 Oct 2025 06:55:13 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8a6daasm21291921f8f.7.2025.10.06.06.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 06:55:13 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 06 Oct 2025 15:55:04 +0200
Subject: [PATCH v5 2/3] phy: qcom: qmp-combo: get the USB3 & DisplayPort
 lanes mapping from DT
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251006-topic-x1e80100-hdmi-v5-2-c006311d59d7@linaro.org>
References: <20251006-topic-x1e80100-hdmi-v5-0-c006311d59d7@linaro.org>
In-Reply-To: <20251006-topic-x1e80100-hdmi-v5-0-c006311d59d7@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Xilin Wu <sophon@radxa.com>, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6594;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=Jvq57DphFi7wtmww07r08dRLu0LQHutOYqaDw8wnv1Q=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBo48o+eHZS3KJP3oymWX7K6DJ1dPPz7JTIdOLexb1y
 zSySfD+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaOPKPgAKCRB33NvayMhJ0crgD/
 9+vb85Pg/4YGgVWF3VdV7Cy5RDYLMQkd0TSxBpUqpjSbZ6mOsP+HfyQS8RLO0cjc8pNizXXbsQ/Eww
 jjCRocAOQJx4kz1rSuFE0jStlrU2Zgw5oJ3iksqMjJq5u84/ZO2Nkglvmmpb3b7ao15vtG3B5XdZPA
 7R9srTMGOLe++0MEFipAIoKG+V8Z/e3o0FteEVeQuwNz03OXOvWri5kFN+JG2tvKupd1PvMktWvEfh
 toU5/SAas4fmC1nmpWNK2XnNTGoajdSgafDrzKGkKB4o/Bd1aj1MCDnNpsFFlR7KjhXudWmDoqLtYt
 5aCgRhLsNQTPo1DDhWDmobPYgYPF/y55JvLmFJY6NAm9HcU0HiUJnF/iUD27i+j2bxubJzw2TCSj1H
 HM77gQ1FGUyo9pDL7d4HLgxoUcyLb7/hPfTnp3sTpzsKa7E6KButEz2GJO/r2KIxextHrQVZTkJLKc
 67JpyooC+5QKYcTaag8xO4SgnIuHi1iBdNLz4cD5uvBeEjeW+9jlXOLm1oBa7GI0S2cq5uGTxQHcV3
 DgRNDOrHP6GP2OBURBK3vregYSeTheiVkmYYCSqz9oy10iTs6Cm9k++tV3dUMAC2YHk/FB7iEe1HXS
 GqZak7w0bdZqbuy9VNxUphFKnvnjvT7BYD2HFlsZstMaddgCwNyhhvgTzM9g==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The QMP USB3/DP Combo PHY hosts an USB3 phy and a DP PHY on top
of a combo glue to route either lanes to the 4 shared physical lanes.

The routing of the lanes can be:
- 2 DP + 2 USB3
- 4 DP
- 2 USB3

Get the lanes mapping from DT and stop registering the USB-C
muxes in favor of a static mode and orientation detemined
by the lanes mapping.

This allows supporting boards with direct connection of USB3 and
DisplayPort lanes to the QMP Combo PHY lanes, not using the
USB-C Altmode feature.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 145 ++++++++++++++++++++++++++++--
 1 file changed, 137 insertions(+), 8 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 7b5af30f1d028c592500e723ecd27b54ed554709..da1823fa5daf316cdec72cdb03159f02961f8545 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -13,6 +13,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/of_graph.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
@@ -1744,6 +1745,26 @@ static const u8 qmp_dp_v6_pre_emphasis_hbr_rbr[4][4] = {
 	{ 0x22, 0xff, 0xff, 0xff }
 };
 
+struct qmp_combo_lane_mapping {
+	unsigned int lanes_count;
+	enum typec_orientation orientation;
+	u32 lanes[4];
+};
+
+static const struct qmp_combo_lane_mapping usb3_data_lanes[] = {
+	{ 2, TYPEC_ORIENTATION_NORMAL, { 1, 0 }},
+	{ 2, TYPEC_ORIENTATION_REVERSE, { 2, 3 }},
+};
+
+static const struct qmp_combo_lane_mapping dp_data_lanes[] = {
+	{ 1, TYPEC_ORIENTATION_NORMAL, { 3 }},
+	{ 1, TYPEC_ORIENTATION_REVERSE, { 0 }},
+	{ 2, TYPEC_ORIENTATION_NORMAL, { 3, 2 }},
+	{ 2, TYPEC_ORIENTATION_REVERSE, { 0, 1 }},
+	{ 4, TYPEC_ORIENTATION_NORMAL, { 3, 2, 1, 0 }},
+	{ 4, TYPEC_ORIENTATION_REVERSE, { 0, 1, 2, 3 }},
+};
+
 struct qmp_combo;
 
 struct qmp_combo_offsets {
@@ -4117,6 +4138,87 @@ static struct phy *qmp_combo_phy_xlate(struct device *dev, const struct of_phand
 	return ERR_PTR(-EINVAL);
 }
 
+static void qmp_combo_find_lanes_orientation(const struct qmp_combo_lane_mapping *mapping,
+					     unsigned int mapping_count,
+					     u32 *lanes, unsigned int lanes_count,
+					     enum typec_orientation *orientation)
+{
+	int i;
+
+	for (i = 0; i < mapping_count; i++) {
+		if (mapping[i].lanes_count != lanes_count)
+			continue;
+		if (!memcmp(mapping[i].lanes, lanes, sizeof(u32) * lanes_count)) {
+			*orientation = mapping[i].orientation;
+			return;
+		}
+	}
+}
+
+static int qmp_combo_get_dt_lanes_mapping(struct device *dev, unsigned int endpoint,
+					  u32 *data_lanes, unsigned int max,
+					  unsigned int *count)
+{
+	struct device_node *ep;
+	int ret;
+
+	ep = of_graph_get_endpoint_by_regs(dev->of_node, 0, endpoint);
+	if (!ep)
+		return -EINVAL;
+
+	ret = of_property_count_u32_elems(ep, "data-lanes");
+	if (ret < 0)
+		goto err_node_put;
+
+	*count = ret;
+
+	ret = of_property_read_u32_array(ep, "data-lanes", data_lanes,
+					 max_t(unsigned int, *count, max));
+
+err_node_put:
+	of_node_put(ep);
+
+	return ret;
+}
+
+static int qmp_combo_get_dt_dp_orientation(struct device *dev,
+					     enum typec_orientation *orientation)
+{
+	unsigned int count;
+	u32 data_lanes[4];
+	int ret;
+
+	/* DP is described on the first endpoint of the first port */
+	ret = qmp_combo_get_dt_lanes_mapping(dev, 0, data_lanes, 4, &count);
+	if (ret < 0)
+		return ret == -EINVAL ? 0 : ret;
+
+	/* Search for a match and only update orientation if found */
+	qmp_combo_find_lanes_orientation(dp_data_lanes, ARRAY_SIZE(dp_data_lanes),
+					 data_lanes, count, orientation);
+
+	return 0;
+}
+
+static int qmp_combo_get_dt_usb3_orientation(struct device *dev,
+					     enum typec_orientation *orientation)
+{
+	unsigned int count;
+	u32 data_lanes[2];
+	int ret;
+
+	/* USB3 is described on the second endpoint of the first port */
+	ret = qmp_combo_get_dt_lanes_mapping(dev, 1, data_lanes, 2, &count);
+	if (ret < 0)
+		return ret == -EINVAL ? 0 : ret;
+
+	/* Search for a match and only update orientation if found */
+	qmp_combo_find_lanes_orientation(usb3_data_lanes, ARRAY_SIZE(usb3_data_lanes),
+					 data_lanes, count, orientation);
+
+	return 0;
+}
+
 static int qmp_combo_probe(struct platform_device *pdev)
 {
 	struct qmp_combo *qmp;
@@ -4167,9 +4269,41 @@ static int qmp_combo_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_node_put;
 
-	ret = qmp_combo_typec_register(qmp);
-	if (ret)
-		goto err_node_put;
+	qmp->qmpphy_mode = QMPPHY_MODE_USB3DP;
+
+	if (of_property_present(dev->of_node, "mode-switch") ||
+	    of_property_present(dev->of_node, "orientation-switch")) {
+		ret = qmp_combo_typec_register(qmp);
+		if (ret)
+			goto err_node_put;
+	} else {
+		enum typec_orientation dp_orientation = TYPEC_ORIENTATION_NONE;
+		enum typec_orientation usb3_orientation = TYPEC_ORIENTATION_NONE;
+
+		ret = qmp_combo_get_dt_dp_orientation(dev, &dp_orientation);
+		if (ret)
+			goto err_node_put;
+
+		ret = qmp_combo_get_dt_usb3_orientation(dev, &usb3_orientation);
+		if (ret)
+			goto err_node_put;
+
+		if (dp_orientation == TYPEC_ORIENTATION_NONE &&
+		    usb3_orientation != TYPEC_ORIENTATION_NONE) {
+			qmp->qmpphy_mode = QMPPHY_MODE_USB3_ONLY;
+			qmp->orientation = usb3_orientation;
+		} else if (usb3_orientation == TYPEC_ORIENTATION_NONE &&
+			 dp_orientation != TYPEC_ORIENTATION_NONE) {
+			qmp->qmpphy_mode = QMPPHY_MODE_DP_ONLY;
+			qmp->orientation = dp_orientation;
+		} else if (dp_orientation != TYPEC_ORIENTATION_NONE &&
+			 dp_orientation == usb3_orientation) {
+			qmp->qmpphy_mode = QMPPHY_MODE_USB3DP;
+			qmp->orientation = dp_orientation;
+		} else {
+			dev_warn(dev, "unable to determine orientation & mode from data-lanes");
+		}
+	}
 
 	ret = drm_aux_bridge_register(dev);
 	if (ret)
@@ -4189,11 +4323,6 @@ static int qmp_combo_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_node_put;
 
-	/*
-	 * The hw default is USB3_ONLY, but USB3+DP mode lets us more easily
-	 * check both sub-blocks' init tables for blunders at probe time.
-	 */
-	qmp->qmpphy_mode = QMPPHY_MODE_USB3DP;
 
 	qmp->usb_phy = devm_phy_create(dev, usb_np, &qmp_combo_usb_phy_ops);
 	if (IS_ERR(qmp->usb_phy)) {

-- 
2.34.1


