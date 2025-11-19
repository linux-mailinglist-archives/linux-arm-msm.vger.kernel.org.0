Return-Path: <linux-arm-msm+bounces-82451-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 498B7C6D866
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 09:52:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 66D8F4F4868
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 08:46:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE933306B38;
	Wed, 19 Nov 2025 08:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LN0+rZhY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D882FD1AE
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 08:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763541951; cv=none; b=eTddBYx/huBpVi3M0Z5RLgI5OsR3Xv4jZxYtgPoBoypfpDxbHVXc9aqg3wL/BF4POUbOxEow7eVfZRBOotAwhNoRNzOXR/nyXCtti2K1HEyzvcVLR/JtOW77Nrc1v/cERL9l1GNsDtOYtx2CuzgC62sKtwnFQDAnXM7IH3p3fN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763541951; c=relaxed/simple;
	bh=LGyRbs3nEpd8TPaRuDnl3oNEOOnmR63dD5K+Fo1T0B8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pEatWI3c65UIKLSqbSM25C5IliVYYYagSLZnBIXXL01g/ZeDEpDcyHOTpx7OC4JCAXWc5omsa/G0+JShC9ZuBZIgvNiTZyIwa4zxhaZQZRMT+NrVwzwRl5L03+9we/D5/HPzkZlYPwrJ1caBJUnUoASRhE8l9/7cU9l139SLMMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LN0+rZhY; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-42b32a3e78bso5166019f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 00:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763541946; x=1764146746; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dCxZuR4nvCuHh/n6CAwD2wdIj5XPsLnOXttvnGgl2Hk=;
        b=LN0+rZhYh9I8Ovk5plBwDaqEwy359FK3M92lyuBIuNj5tKXfxTlLc21RKxD7Sl5x3b
         rh5g+t678EzMghFE6Ecf72peBWwWDXUOeUCE96Q0xbFk8aq1YRy0a3MtJQDfW6Dt3HFT
         fcTmyjJTh2DGHF+SEbV0ASksYmYYUtlxYKrHBt6AiBAPMVgLouCafkhHBPcbAQy6IzDx
         jlNVFyVjv4K7cS/Xics0cVbsrd74iM7prfc3SYozT96L1mr8Ajr4brV80OH3XPe/stn5
         uSB0rn2bLPO11hP19SHpDAZb9YqY0tUSDq5ogdtRxHp+MYXO4jzxHxoZ44162JieSUk0
         NlYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763541946; x=1764146746;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dCxZuR4nvCuHh/n6CAwD2wdIj5XPsLnOXttvnGgl2Hk=;
        b=t0z6KFVsr2MWlNfnI+2tJKDY5Uxxrq6doUDdn3jFKmNUAE1Qxzu0FRVjWUldf9FYSq
         C3dNXLxxZHsdmY8KF+531gJRj61Vw9BtDjt0tb+ezUvlDxGBv7ipt/m9QYsY5f7VeTUH
         gMGkSgY5k0eJK0DXugo6Di9KDg9cs+/cTkIZFeKgaTkTFy5mUS2n2+iDO4zsLUs+654p
         VCo+e1tinUiydq+fKNsKoAWwFyF3Gq8U5Y+DFm1dkedjpVJZoCsgJtHk93ziz0Hm8R6C
         dnLuOa2UNqcWcFH5xv1EWntICcgJwhVVNssCLqKdrL1m5E/gXQvby3M4Qr674vaW+Z8z
         Hb3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWMrKxQyWHnk/XPfYfTeYIfcdn+ZNzdtXysSbgRKr3GhOKSyyvIqEdq+I5iKki8Shs3wc9+NhIITDChkozn@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1VYeGbHEVjlbVq95wRCX+7Ab9YKuJxz9q9yX5V/j2EgiCv7YT
	+Cz0vlmRU4gWokGHUUi4w4huqwXiQUAu71i6HD04JM/XWSWVm5qk4Ea0laX/pSsig9Q=
X-Gm-Gg: ASbGncvTYeBtmdtbfu/QM3IKUmD1j3IctU/w2ZUwb7BOnhEeBGHxfyXPBtNOcPLVQPh
	GQafPaeKg8Lp3NjH5ESMprgLt1WeFuE2fkHL6qNRXKgH+UopU+NckZ5ap8PUccbUJ888kHsijs/
	GwqOW67jfJuSNAhRNL1e0eE+bTeql79k8w7QnsXQy3Tl29k81RYpgbEbpJRgGB+ok10yErwe1pO
	r5LdHsW+0sD8UN0ubBVhmPy3BFeej8IPl8QnQQU8GDJWD9PndIZOH2qAfgc98ZoZEuwbb9fy8PB
	G8fLTGn3NrBP96VSVaK8mOQ/eNpJlelsyU2C2zM58XPRcwyuk0YpmWmdPt67EpMNqHBbe3XvvoP
	B2FJSWedxffmRLH5WXPrHeVsb0o0Qce3wJCncpcDVVmjA51YuRSPxJ0d2cljXIShKQNMY4mEpC2
	+WKwHtzf0DwcFfOtuF36e4Ce6bXxVCS8QZRNybByxkPA==
X-Google-Smtp-Source: AGHT+IFh+5jaYZ8H9QYyCVf2+FyHofQ3p91R6Qj+AJh8dPTzh1+rjurln6VPtOL0H/XejsiFY3o/ew==
X-Received: by 2002:a05:6000:2601:b0:42b:3d9d:c605 with SMTP id ffacd0b85a97d-42b5938f92fmr16878886f8f.49.1763541946355;
        Wed, 19 Nov 2025 00:45:46 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f0b894sm38132306f8f.26.2025.11.19.00.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 00:45:45 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 19 Nov 2025 09:45:41 +0100
Subject: [PATCH v7 2/3] phy: qcom: qmp-combo: get the USB3 & DisplayPort
 lanes mapping from DT
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-topic-x1e80100-hdmi-v7-2-2bee0e66cc1b@linaro.org>
References: <20251119-topic-x1e80100-hdmi-v7-0-2bee0e66cc1b@linaro.org>
In-Reply-To: <20251119-topic-x1e80100-hdmi-v7-0-2bee0e66cc1b@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Xilin Wu <sophon@radxa.com>, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Abel Vesa <abel.vesa@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6719;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=LGyRbs3nEpd8TPaRuDnl3oNEOOnmR63dD5K+Fo1T0B8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBpHYO2taghZb3+XQkAM4Jj92JhEwExoKfZzh355Qc8
 4y/zf8KJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaR2DtgAKCRB33NvayMhJ0RKvD/
 0Y63pvt6Ypito3i6X5PDB2pJtRv37J47mUFyaJkuodl0ACF9VzsqFBPgWBrkMjQUJQqU9vajIWpzF4
 kT9SiourQmYWgewVivWXen+Xim6jT6kNE/O55OhYS2k160ur13cyjAmP522nQheVQIeaSzn3N3Sp9b
 7FV0oGptS0aMFSULC8Ek6jPIhh65v3QcSx+wIAsA7A+vBNnEu3XGYBrBAtL24fIceMHmBYgyktCWjH
 RYtNH9PvHdrKXbdvC4zd3VH5euTnUWx2N9bbwtaC+xmLGt0hpy9K+PNdNRI2ur8J1GCW3E251qphIy
 J8nPEUz1gPPBp1AUwDpMspKDeI1e/+lZAROrWw6OzHCOuL7b2iKHauRbWqAM8NtGWA9nFyygP4PvGa
 7K8LD0W2OyZyPuf2mwuBLQlWP7xaZJzbOQQxOPRchPxZcrM3u/ITkHQ+LKmbBjobewKD1TtgXVlu/R
 Y7jWMGtgCFlN9ApkfgpGDxCGxnSArs/Fdh/xcHKcRl+796X1ylB5ng9eI2/PZj/K7xNSRHD1oJaCda
 Qi/lSMPn0mY07bcPhYHznNOdB5uyKgDx/tPu32zQhdopxSYfSnXTQxhcgFnSxWMGUbQ9yuEqltf7Cu
 JArmqZEJMJ9pblsKgRFF/8f/EhOfjxSYWQktUCb0TQAfjcGX2Tn6N+wVpDRw==
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
Tested-by: Xilin Wu <sophon@radxa.com> # qcs6490-radxa-dragon-q6a
Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 142 ++++++++++++++++++++++++++++--
 1 file changed, 134 insertions(+), 8 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 7b5af30f1d02..18321f441baf 100644
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
@@ -4117,6 +4138,84 @@ static struct phy *qmp_combo_phy_xlate(struct device *dev, const struct of_phand
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
+	struct device_node *ep __free(device_node) = NULL;
+	int ret;
+
+	ep = of_graph_get_endpoint_by_regs(dev->of_node, 0, endpoint);
+	if (!ep)
+		return -EINVAL;
+
+	ret = of_property_count_u32_elems(ep, "data-lanes");
+	if (ret < 0)
+		return ret;
+
+	*count = ret;
+	if (*count > max)
+		return -EINVAL;
+
+	return of_property_read_u32_array(ep, "data-lanes", data_lanes,
+					  min_t(unsigned int, *count, max));
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
@@ -4167,9 +4266,41 @@ static int qmp_combo_probe(struct platform_device *pdev)
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
@@ -4189,11 +4320,6 @@ static int qmp_combo_probe(struct platform_device *pdev)
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


