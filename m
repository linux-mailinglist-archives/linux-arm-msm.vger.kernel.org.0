Return-Path: <linux-arm-msm+bounces-79992-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A7036C27E72
	for <lists+linux-arm-msm@lfdr.de>; Sat, 01 Nov 2025 13:54:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0732A189B217
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Nov 2025 12:55:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 420872F6193;
	Sat,  1 Nov 2025 12:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FDl3+iFN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10FAF2877E8;
	Sat,  1 Nov 2025 12:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762001683; cv=none; b=Go819QBN+HN6Pg8uArpI6TntXW2o5RDTBIP15zPpcqi6RgjlSvekut/zjcbvqMsbkOUvcuv6tC//uO6dUYfB2hJVTBU5HZZuVUyiLIIsOHQ8uQQKD9Hd9n2BHOM2jYNJvS8l0Vh8BNAQke1jOC1GHCjh3xWNKml7Lx3zuH8FUwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762001683; c=relaxed/simple;
	bh=34fBKEVmSrDlBYzlnxgdHZYKRjKJ1Cvqi+CUp4jBifc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jJOmVpAoZg6XngyR4OEJWqxfWIt9O5AeUxzmgVg6zDLN06s+Wrq0KMndCklz0yWSwGIZilgaIg9PjMIYPrid7lNDe7+atEAooIlZg0ndKOSnJzH6tnhXLpaIF3HKxN1x+dTptplgtmh+8S5n7p9ryojyMJcMdSKzC6h59t+Qd1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FDl3+iFN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 73BDEC4CEF7;
	Sat,  1 Nov 2025 12:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762001682;
	bh=34fBKEVmSrDlBYzlnxgdHZYKRjKJ1Cvqi+CUp4jBifc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=FDl3+iFN7tEsZEwVmqJ+lChvTXdN0+1rbhYzKFfoQKdy15bw+kkQnXVZMmtRQB9G5
	 c/lpQXnh8OI/fXSBL2koPjCHYjNWg2jRkqMZNWDTQ35zvpE8bNV3IFyieySy1ggETV
	 SFBg2+1KleWgZmByJtDvOgoUDkHmPtuM30zTkhnQZ/eI+KxdIonIqocuxprh6ReCts
	 cWpzGXBKCIhxFuSAV0L5nLrPLIFinm0AleM10Ze6N3HOhTS51FDivaR4EV40Le8vxF
	 0Zbcs6SM3KBZiXKDBWZ3yD+XOG2c1S5iKH6D6XU31UBFAsbclK9VnMhOq/wDWTPsIk
	 xW/SXErQhT6uA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61EB5CCFA05;
	Sat,  1 Nov 2025 12:54:42 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maud_spierings.hotmail.com@kernel.org>
Date: Sat, 01 Nov 2025 13:54:13 +0100
Subject: [PATCH 2/6] drm/bridge: simple: add the Parade PS185HDM DP-to-HDMI
 bridge
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251101-asus_usbc_dp-v1-2-9fd4eb9935e8@hotmail.com>
References: <20251101-asus_usbc_dp-v1-0-9fd4eb9935e8@hotmail.com>
In-Reply-To: <20251101-asus_usbc_dp-v1-0-9fd4eb9935e8@hotmail.com>
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
 Maud Spierings <maud_spierings@hotmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762001681; l=878;
 i=maud_spierings@hotmail.com; s=20241110; h=from:subject:message-id;
 bh=JveCFK4Fcru2L6BkYjAzFCnJSI15w5M+ECzlRiEDBSM=;
 b=uPnPPwYFaE56zAbPMhVdabtgpX9Jn98+I9vrMQs7Dre/1A1UHccacFTwIi3ZdaR+VA8m4R3ML
 qG9gVFpGoOjCW/VlFySjsh/GPUk6iqwsHasLQDQy9cWyxmb/7nQSXIS
X-Developer-Key: i=maud_spierings@hotmail.com; a=ed25519;
 pk=CeFKVnZvRfX2QjB1DpdiAe2N+MEjwLEB9Yhx/OAcxRc=
X-Endpoint-Received: by B4 Relay for maud_spierings@hotmail.com/20241110
 with auth_id=273
X-Original-From: Maud Spierings <maud_spierings@hotmail.com>
Reply-To: maud_spierings@hotmail.com

From: Maud Spierings <maud_spierings@hotmail.com>

The Parade PS185HDM is a transparent Displayport to HDMI bridge.

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
2.51.1



