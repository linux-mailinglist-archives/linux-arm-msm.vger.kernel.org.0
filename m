Return-Path: <linux-arm-msm+bounces-81964-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DC7C612D7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Nov 2025 11:53:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id AA29435E38B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Nov 2025 10:52:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D746C29D27D;
	Sun, 16 Nov 2025 10:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RgJbXTWe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C57E29BD91;
	Sun, 16 Nov 2025 10:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763290345; cv=none; b=mkGRK+z75Ng2Fg1oUxPneAwrvvGo2a2Mlvi3gOG1tkda03cYfegh0nQgQ5XblSBO9EguuXqmUxMpqMy510UUb1/tqVBhPjr47cU/Yaw+5gB6njGRNE+e7vlYLX8Cc+Rc71BTvAHCdUHU2TD8k5i+OPK0c4fSSkW0O/iKf0Qqtqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763290345; c=relaxed/simple;
	bh=qsGCtEk6WzluqKeFoHg53wFve+N+m+ibvws3FvZDkSo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I0aujsjUwHJIVFJbB4iCWST2YoUPS+VQDagJhbjzd64Nlz3Xrcyj5TpTpm7FnRR+0rL6EHBFIDH/RSgCKoHC6AyDLaIpgW+5prWh/mlG9yBaShO9Xewd9nsgiDy7QfR13bm5Uo8rqRTD0zU+1i4zttmJ2OqRNu5XjIBU4iULqTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RgJbXTWe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 34B67C19423;
	Sun, 16 Nov 2025 10:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763290345;
	bh=qsGCtEk6WzluqKeFoHg53wFve+N+m+ibvws3FvZDkSo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=RgJbXTWexVuwL2Vu5gnmNjlm74qLnYiN6zjgb7PjiBHmrQztPYZP/M1cJTG4yxRTp
	 ae0FT3plzKexY1VewjUV7QYCmb18fwWo7lTndrAoxidfGppMYauaiVTy1VGmWVV2Kv
	 C7OQHi+jbeHc8nfcX+POB8NY3deHzrmemJ/2fNQhLaTuuiPNk3GT+RsZgmO/TToe48
	 r/Di//pwbS4iq4AoOIgIL3ApG5PCAYmVl7UdjYuq9iaj4sDc6NJ38cCe8Mwi0rwHyH
	 TM0vM1hq6EjSESUBNulQ7/4m5kmdRrVv/wzZrTWrXmLnEYIEfRGoRieJTjXo+d/l3W
	 NwP8pU31frtzg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C15BCEBF61;
	Sun, 16 Nov 2025 10:52:25 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maud_spierings.hotmail.com@kernel.org>
Date: Sun, 16 Nov 2025 11:52:07 +0100
Subject: [PATCH v2 2/6] drm/bridge: simple: add the Parade PS185HDM
 DP-to-HDMI bridge
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251116-asus_usbc_dp-v2-2-cc8f51136c9f@hotmail.com>
References: <20251116-asus_usbc_dp-v2-0-cc8f51136c9f@hotmail.com>
In-Reply-To: <20251116-asus_usbc_dp-v2-0-cc8f51136c9f@hotmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Maud Spierings <maud_spierings@hotmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763290343; l=945;
 i=maud_spierings@hotmail.com; s=20241110; h=from:subject:message-id;
 bh=lOwUKlnZWvBGuZzv+yAV11vLtSXDOnT6l1naKVDPm98=;
 b=KeTmdssRRamJCQIgZoutDL6TdRGTm08erGUsWcT8KNW6xLav1onjBFM1b1bIsbAiVHgLhSv1r
 ZZjHf1fHA2LCclKfBO1GZd17K5lP4kjudM4pKsPe1+cwpjkkGpbUhnD
X-Developer-Key: i=maud_spierings@hotmail.com; a=ed25519;
 pk=CeFKVnZvRfX2QjB1DpdiAe2N+MEjwLEB9Yhx/OAcxRc=
X-Endpoint-Received: by B4 Relay for maud_spierings@hotmail.com/20241110
 with auth_id=273
X-Original-From: Maud Spierings <maud_spierings@hotmail.com>
Reply-To: maud_spierings@hotmail.com

From: Maud Spierings <maud_spierings@hotmail.com>

The Parade PS185HDM is a transparent Displayport to HDMI bridge.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
---
 drivers/gpu/drm/bridge/simple-bridge.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
index e4d0bc2200f8..90abda199cea 100644
--- a/drivers/gpu/drm/bridge/simple-bridge.c
+++ b/drivers/gpu/drm/bridge/simple-bridge.c
@@ -261,6 +261,11 @@ static const struct of_device_id simple_bridge_match[] = {
 			.timings = &default_bridge_timings,
 			.connector_type = DRM_MODE_CONNECTOR_VGA,
 		},
+	}, {
+		.compatible = "parade,ps185hdm",
+		.data = &(const struct simple_bridge_info) {
+			.connector_type = DRM_MODE_CONNECTOR_HDMIA,
+		},
 	}, {
 		.compatible = "radxa,ra620",
 		.data = &(const struct simple_bridge_info) {

-- 
2.51.2



