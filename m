Return-Path: <linux-arm-msm+bounces-36977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 923A29BBDB0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 20:07:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F0634B222B6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 19:07:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C101F1CC897;
	Mon,  4 Nov 2024 19:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L1rzpenq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998A41CBE85;
	Mon,  4 Nov 2024 19:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730747206; cv=none; b=NJ3SK+qPs0Rhd/nd+zMiCOt3ZIN2+a6VqGzCHLye7+2zkLBxNNpq5fCPz1VmAQI/XMVpSCw0a7aMMMJZYvCX5brcHlgPt5dZRsKljD8af29rkRrba9mJh+wmfApkaKduhLUf/KUSVNlIy65uolRyqt2twz/KnxM3+wzhcwMBRlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730747206; c=relaxed/simple;
	bh=RLzepUvEzi8jZ2gEcW80zZHNRl/o1f2BUC9/lRQBcsQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B7bjZX8w83KgezFbDBRmNB/b2wmhqZ3Bkoz1ZKArM6VooRlHoiqyLTmVFZzrbJEiPR7pHxnKpMRMKufbxELi919qhA7lmNb9+jL2fkP8EMb2jxEOD1+5gFN4/ejv7VMAdC9xgN/NmshmvW/xY6UlkxjOJd6ChCXmS4wXX8Hl/MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L1rzpenq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DB8DC4CECE;
	Mon,  4 Nov 2024 19:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730747206;
	bh=RLzepUvEzi8jZ2gEcW80zZHNRl/o1f2BUC9/lRQBcsQ=;
	h=From:To:Cc:Subject:Date:From;
	b=L1rzpenqUzfXsjKliMp3NKFrjpC1eJfEx7bkxuYDVJPLtcz1JnjY2FP8cKO22jX4t
	 3Vq3JECDbLiRwdy/UndJxh0e3QAYAJAPhMZizem1ucLER9hLLhQoiXAgd6ytPPccO2
	 zZzM5L5WwVKyxT61cgkfJzI3YvilPV3vSUPaRv5MMuXnc3RPfpC9U5xkrbR2IJ80cb
	 T3Zm/IWe3iV89yiqSnrH27Ucdudb6nzOFMv7Q1v9b8kaW2jkoOe9t/XLtgLxXMf5up
	 Sj/WLE1DzNXbjWwLH/BZiLwe73BGXgo/qzFBNjX6YY2MDxyZkbDWbGui+HGDeZhz0s
	 StyDRVGh2rNfA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Phong LE <ple@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH] drm: Use of_property_present() for non-boolean properties
Date: Mon,  4 Nov 2024 13:06:35 -0600
Message-ID: <20241104190636.274926-1-robh@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The use of of_property_read_bool() for non-boolean properties is
deprecated in favor of of_property_present() when testing for property
presence.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/gpu/drm/bridge/ite-it66121.c | 2 +-
 drivers/gpu/drm/bridge/sii902x.c     | 2 +-
 drivers/gpu/drm/drm_panel.c          | 2 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c   | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
index 925e42f46cd8..0eae7c01b975 100644
--- a/drivers/gpu/drm/bridge/ite-it66121.c
+++ b/drivers/gpu/drm/bridge/ite-it66121.c
@@ -1480,7 +1480,7 @@ static int it66121_audio_codec_init(struct it66121_ctx *ctx, struct device *dev)
 
 	dev_dbg(dev, "%s\n", __func__);
 
-	if (!of_property_read_bool(dev->of_node, "#sound-dai-cells")) {
+	if (!of_property_present(dev->of_node, "#sound-dai-cells")) {
 		dev_info(dev, "No \"#sound-dai-cells\", no audio\n");
 		return 0;
 	}
diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
index 7f91b0db161e..f73e1174a5ad 100644
--- a/drivers/gpu/drm/bridge/sii902x.c
+++ b/drivers/gpu/drm/bridge/sii902x.c
@@ -850,7 +850,7 @@ static int sii902x_audio_codec_init(struct sii902x *sii902x,
 	u8 lanes[4];
 	int num_lanes, i;
 
-	if (!of_property_read_bool(dev->of_node, "#sound-dai-cells")) {
+	if (!of_property_present(dev->of_node, "#sound-dai-cells")) {
 		dev_dbg(dev, "%s: No \"#sound-dai-cells\", no audio\n",
 			__func__);
 		return 0;
diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index 19ab0a794add..46d61cc871ca 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -413,7 +413,7 @@ bool drm_is_panel_follower(struct device *dev)
 	 * don't bother trying to parse it here. We just need to know if the
 	 * property is there.
 	 */
-	return of_property_read_bool(dev->of_node, "panel");
+	return of_property_present(dev->of_node, "panel");
 }
 EXPORT_SYMBOL(drm_is_panel_follower);
 
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 185d7de0bf37..78cac4ecc58f 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1831,7 +1831,7 @@ static int dsi_host_parse_dt(struct msm_dsi_host *msm_host)
 		msm_dsi->te_source = devm_kstrdup(dev, te_source, GFP_KERNEL);
 	ret = 0;
 
-	if (of_property_read_bool(np, "syscon-sfpb")) {
+	if (of_property_present(np, "syscon-sfpb")) {
 		msm_host->sfpb = syscon_regmap_lookup_by_phandle(np,
 					"syscon-sfpb");
 		if (IS_ERR(msm_host->sfpb)) {
-- 
2.45.2


