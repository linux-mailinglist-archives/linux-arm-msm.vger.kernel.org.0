Return-Path: <linux-arm-msm+bounces-82866-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 657E1C7A3F9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 15:44:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id DEA0C2DEAC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 14:33:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D926F354AC4;
	Fri, 21 Nov 2025 14:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="n73ycFpF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C3734FF53;
	Fri, 21 Nov 2025 14:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763735300; cv=none; b=Dw/yUozsSWDIt8VUO7EqAv7pWf4Lwxyy2MgKlzLmY9w8PuF2Klc1SkmMTxtvwXWafOAbysD85MHW2zKuTdp1XXrPKQ2iSfgeoNlxX/SS29mkfakr6LNyDXs5u7a2u2UgLmI4R4fBJIZdgo23pgLqUeNkEFut64itK4AmJt+uNHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763735300; c=relaxed/simple;
	bh=5eJbP6s5B5kOUCz4EB94uo9D5yvVcCFYtMJbA0B00VM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZUnEO9PvOUFD4FZXVtPucuP09G2UjfmyGykedo+6cGERgDyX5Msl03maqjEooV6KYW50/sZEdVdF1t5ZGTkIc96dMPdsTT8zravT7A0xFBdG7q4xvErCQSHE/hA94pc9HCNMbqugRBWqV+Te2Q+4OU3lR5xIIcbmMWHtp8B3COg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=n73ycFpF; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from ggottleuber-tuxedo.fritz.box (business-24-134-207-61.pool2.vodafone-ip.de [24.134.207.61])
	(Authenticated sender: g.gottleuber@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id AB27B2FC005D;
	Fri, 21 Nov 2025 15:28:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1763735297;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eSZmYREVf5+SWCgkGInNE4R4IMXAyOLdPivvUsmEM7Y=;
	b=n73ycFpFzfVGfpYUgJOJG5RVp8iiDnCfEVJxQLNLA7lx6vocaVP9+tNCxisvrakDZZIKVU
	EnlVwOKMs4ct+4Swa06ENKFKLjpCtvYF8aYyN78Pt1HjSqtv4JG7WXhZzksaY+vYcHfBWt
	DiBHlYbn2DkrFT+3poEznq75NdOQAN0=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=g.gottleuber@tuxedocomputers.com smtp.mailfrom=ggo@tuxedocomputers.com
From: Georg Gottleuber <ggo@tuxedocomputers.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ettore Chimenti <ettore.chimenti@linaro.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	stefan.schmidt@linaro.org,
	stephan.gerhold@linaro.org,
	wse@tuxedocomputers.com,
	cs@tuxedo.de,
	Georg Gottleuber <ggo@tuxedocomputers.com>,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 3/7] drm/bridge: simple: add ASL CS5263 DP-to-HDMI bridge
Date: Fri, 21 Nov 2025 15:26:15 +0100
Message-ID: <20251121142623.251118-4-ggo@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251121142623.251118-1-ggo@tuxedocomputers.com>
References: <20251121142623.251118-1-ggo@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ettore Chimenti <ettore.chimenti@linaro.org>

Add support for the transparent ASL CS5263 DP-to-HDMI bridge.

Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
Signed-off-by: Georg Gottleuber <ggo@tuxedocomputers.com>
---
 drivers/gpu/drm/bridge/simple-bridge.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
index e4d0bc2200f8..94aba5a9c9b9 100644
--- a/drivers/gpu/drm/bridge/simple-bridge.c
+++ b/drivers/gpu/drm/bridge/simple-bridge.c
@@ -261,6 +261,11 @@ static const struct of_device_id simple_bridge_match[] = {
 			.timings = &default_bridge_timings,
 			.connector_type = DRM_MODE_CONNECTOR_VGA,
 		},
+	}, {
+		.compatible = "asl-tek,cs5263",
+		.data = &(const struct simple_bridge_info) {
+			.connector_type = DRM_MODE_CONNECTOR_HDMIA,
+		},
 	}, {
 		.compatible = "radxa,ra620",
 		.data = &(const struct simple_bridge_info) {
-- 
2.43.0


