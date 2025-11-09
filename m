Return-Path: <linux-arm-msm+bounces-80862-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DEDEC43B01
	for <lists+linux-arm-msm@lfdr.de>; Sun, 09 Nov 2025 10:41:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1B7E14E4611
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Nov 2025 09:41:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D22C02D7DFF;
	Sun,  9 Nov 2025 09:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lqD2AQso"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBA02D663B;
	Sun,  9 Nov 2025 09:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762681205; cv=none; b=rRx8GTYixXKGg3w8E2RgYJoUbqERjPHSqqnA27LOeJ3uV7H1FMeHpQWGqfTY7hPpOXULrlz2e7Mct7fS1u9+3zXcFeIJiL/yaH5uEiuFY11TeDCwrzrgq/iiZ0U9jifVVHWm2wk9yFbWjZ1kOERLmWS+FzTV+xYgCB9XdUkNQK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762681205; c=relaxed/simple;
	bh=u+4yBiAI4T4NZwmO+4c7YKye9yt8TDbvKEhXxOIQago=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I19po7XUExlX/iHvVO8r5OULYP6BnUIsb7+HKV17o9Kd06oYlDLMlGFNNyI0Ltb9jd8fpSAFVtBLM+elKfRpCD13K+oqi+cQHA10YUBpCebMOh8GJgKt9qgItVLbFhwma0IClEp80/eHOPvvr3y4u+kCidDVIXoD2r4XGGFLf6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lqD2AQso; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 39C03C2BC86;
	Sun,  9 Nov 2025 09:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762681205;
	bh=u+4yBiAI4T4NZwmO+4c7YKye9yt8TDbvKEhXxOIQago=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=lqD2AQsovj4FNVN583cHmobaO8hOGCrsiu8XnidB53uTav2oxBtGO8R8OrufsZ4wq
	 ApnmcePPu9yQYeQGAefGWjfcwOwDHKNlH4CxtMoWfGIaPwszEcLjpL04zhcnJaaj3D
	 8w1snVL68udSFD1kqqL6aIUIrP5l3R/7IAzMI+Hcr2mFNi5JXHg/PZFaSKwsHKS0Xo
	 DOgwRt9Z5jEyXLeARy5cFupbAlCEg7GbxY3EzAFQ2peY8fA3lSJTQ1xrQdiYOJvVyS
	 ylJQpOVzwW+blnqfqWzu/HRBxD+KT0wBa8priJgQ5ooz5j6K80I8Ss+r164BIuAYzc
	 sEOZgzQSEJFaQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 323D3CD13CF;
	Sun,  9 Nov 2025 09:40:05 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 09 Nov 2025 10:39:50 +0100
Subject: [PATCH RFC 7/8] media: qcom: camss: Account for C-PHY when
 calculating link frequency
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251109-qcom-cphy-v1-7-165f7e79b0e1@ixit.cz>
References: <20251109-qcom-cphy-v1-0-165f7e79b0e1@ixit.cz>
In-Reply-To: <20251109-qcom-cphy-v1-0-165f7e79b0e1@ixit.cz>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>, 
 Casey Connolly <casey.connolly@linaro.org>, "Dr. Git" <drgitx@gmail.com>
Cc: Joel Selvaraj <foss@joelselvaraj.com>, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4640; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=2c/mk79UmozICACUyCQCOXzS/+KdKKC6afXmEjBst5I=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpEGFydykdNLSZ1zcmGM1tlnV1yz50pHPr9HPp0
 FL6AaUnrECJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaRBhcgAKCRBgAj/E00kg
 cl6dEACMnIxbepTBnH2iTUFCMplyaAtqFF2yT93rmSF+h/chy4ebayjzpJ2pc24AsyDbtICkFRr
 6lIT3QDfz6Zrf9i399Cm7BKledVObuifjlLdbOcPdpk4oEqIRUBXeydfzRW44vndK/g/e9Z/MzX
 XIIkIHTAhLMFpilG+p7O+gL+fmV4o0SNLB/W+0S4w149JFgaX0JPFms+NlgZR00t+GmjXlfkBY0
 8Q9JrzUwMkm0UzEnBJxQ2MEjcI41LpO/1X/3q05xbKpHSa0yNfU1/wGunTUPzZPp8n8YJJGgu3q
 pxTz/eZUOE+lDg7sOLT1F+uVyLvW6puZMU9OxB2Swrl6GTAGZbpYqlX8Vh/ImhKN+IcdasbvPA/
 Hb/oyvv8PpxKQy0xgwSdUaJjbKZgKfXWk3X73C7v4i/XHQiU2OupF7R5M7oQPDk/WrD3EuRQeE9
 f7w71IyArk8Mdx7TeawzHS0h+B3ZLhSBPEp2plrXjYJVh+QZ2tXtRFWGPtwtoVRHIqVYWEKCP/h
 d9PpuOLD5t1t4RT01NRgZX/Xieho8/IiM3qiwBlaf2UHVO5LmDy/g5QPFpHG5xcUQaU7Jd//g6A
 bZkHFPECYIex0ZVtwGEx2XWqCj0WKb3yWrtO7ZWZK3SZ5h3llPa+WXvyTO+0qim63GtzW5XRHj2
 sgqgdoMMGCRsKgA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Ensure that the link frequency divider correctly accounts for C-PHY
operation. The divider differs between D-PHY and C-PHY, as described
in the MIPI CSI-2 specification.

For more details, see:
https://docs.kernel.org/driver-api/media/tx-rx.html#pixel-rate

Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/media/platform/qcom/camss/camss-csid.c   | 2 +-
 drivers/media/platform/qcom/camss/camss-csiphy.c | 6 ++++--
 drivers/media/platform/qcom/camss/camss.c        | 7 ++++---
 drivers/media/platform/qcom/camss/camss.h        | 2 +-
 4 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index 68adea33cc719..9fb5834b28e2b 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -545,7 +545,7 @@ static int csid_set_clock_rates(struct csid_device *csid)
 	fmt = csid_get_fmt_entry(csid->res->formats->formats, csid->res->formats->nformats,
 				 csid->fmt[MSM_CSIPHY_PAD_SINK].code);
 	link_freq = camss_get_link_freq(&csid->subdev.entity, fmt->bpp,
-					csid->phy.lane_cnt);
+					csid->phy.lane_cnt, csid->phy.cphy);
 	if (link_freq < 0)
 		link_freq = 0;
 
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index a734fb7dde0a4..61f2b2ac3f159 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -144,8 +144,9 @@ static int csiphy_set_clock_rates(struct csiphy_device *csiphy)
 	u8 bpp = csiphy_get_bpp(csiphy->res->formats->formats, csiphy->res->formats->nformats,
 				csiphy->fmt[MSM_CSIPHY_PAD_SINK].code);
 	u8 num_lanes = csiphy->cfg.csi2->lane_cfg.num_data;
+	bool cphy = csiphy->cfg.csi2->lane_cfg.cphy;
 
-	link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp, num_lanes);
+	link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp, num_lanes, cphy);
 	if (link_freq < 0)
 		link_freq  = 0;
 
@@ -270,9 +271,10 @@ static int csiphy_stream_on(struct csiphy_device *csiphy)
 	u8 bpp = csiphy_get_bpp(csiphy->res->formats->formats, csiphy->res->formats->nformats,
 				csiphy->fmt[MSM_CSIPHY_PAD_SINK].code);
 	u8 num_lanes = csiphy->cfg.csi2->lane_cfg.num_data;
+	bool cphy = csiphy->cfg.csi2->lane_cfg.cphy;
 	u8 val;
 
-	link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp, num_lanes);
+	link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp, num_lanes, cphy);
 
 	if (link_freq < 0) {
 		dev_err(csiphy->camss->dev,
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 549780f3f948b..248aa6b21b5ad 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -3912,20 +3912,21 @@ struct media_pad *camss_find_sensor_pad(struct media_entity *entity)
  * camss_get_link_freq - Get link frequency from sensor
  * @entity: Media entity in the current pipeline
  * @bpp: Number of bits per pixel for the current format
- * @lanes: Number of lanes in the link to the sensor
+ * @nr_of_lanes: Number of lanes in the link to the sensor
  *
  * Return link frequency on success or a negative error code otherwise
  */
 s64 camss_get_link_freq(struct media_entity *entity, unsigned int bpp,
-			unsigned int lanes)
+			unsigned int nr_of_lanes, bool cphy)
 {
 	struct media_pad *sensor_pad;
+	unsigned int div = nr_of_lanes * 2 * (cphy ? 7 : 16);
 
 	sensor_pad = camss_find_sensor_pad(entity);
 	if (!sensor_pad)
 		return -ENODEV;
 
-	return v4l2_get_link_freq(sensor_pad, bpp, 2 * lanes);
+	return v4l2_get_link_freq(sensor_pad, 16 * bpp, div);
 }
 
 /*
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 9d9a62640e25d..0ab908b0c037f 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -162,7 +162,7 @@ int camss_enable_clocks(int nclocks, struct camss_clock *clock,
 void camss_disable_clocks(int nclocks, struct camss_clock *clock);
 struct media_pad *camss_find_sensor_pad(struct media_entity *entity);
 s64 camss_get_link_freq(struct media_entity *entity, unsigned int bpp,
-			unsigned int lanes);
+			unsigned int lanes, bool cphy);
 int camss_get_pixel_clock(struct media_entity *entity, u64 *pixel_clock);
 int camss_pm_domain_on(struct camss *camss, int id);
 void camss_pm_domain_off(struct camss *camss, int id);

-- 
2.51.0



