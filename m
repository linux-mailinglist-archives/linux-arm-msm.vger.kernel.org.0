Return-Path: <linux-arm-msm+bounces-51387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A517A60C75
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 09:59:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE4F717DF21
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 08:59:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A39BB1DE3D1;
	Fri, 14 Mar 2025 08:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="owLJ1WJu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44AF1DE2B4;
	Fri, 14 Mar 2025 08:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741942769; cv=none; b=MS9fwEd1p6uA6Deel5X3R8b6hS4okLnnfovx9pImBzSHD9npAUQGajNb/eULAIrqa3XViOI5r/YvPC1WFxofA2xSUWeVMeZPVVGFZTZAvRvxxDUF1V5aW9Nl+aynRm38Fjck3yd7Ogw8wBZNF5dtRUs5gWEkzqm1AHpSdrA6Fjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741942769; c=relaxed/simple;
	bh=dO2g62Nlwp+u8LGId8NUD6lLWl2ArcKsTpjA88vbPVo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aKNsikXAM9Egwg30ZB1U3skch7HHAj+K5p6jL8j3tKYbsFJtQgLtKiT2g1runz1F2absaw1vTLNChyLus6FfkHusqKxisTKprmKpO15Ja4B63yn/1YIcyGD+xcrT0Y+xE/E7yFpUlnShZeYBqKsM4Vg/vF6B0Py4JJbD4hXZHU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=owLJ1WJu; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741942766;
	bh=dO2g62Nlwp+u8LGId8NUD6lLWl2ArcKsTpjA88vbPVo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=owLJ1WJu0YKFv0vCeABK86Cs/4CF+m+pf5V2jGXI5Th+cqcCaysIujd1olFmyZou5
	 BCH9bEIqNTJqx1LnT4yxIuzQofiE/ZmInPnWe0LdLTgbdS4E7MnSSROdWsAZmRNFIz
	 E57s7m+GwOo0FVvu/yTb63il4pNmhvdRSvBNyYx0AUBBgppteciBMEnkMP1bigrN9n
	 FE8PjZ1TMZLHsZNg5OX+KHgCP8hcGn5LKLQMbGVlb+NrziOiD1kfWAbgOtjjughYo2
	 oPCPP/nflkUJDGUVQesX6PZE5MxUzbvkSpbLSsda6Fn2xQHqxvinFdcXt3g7WPcH2z
	 UW8sjJvbCRGrw==
Received: from debian.. (unknown [103.163.65.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CA66717E0ABD;
	Fri, 14 Mar 2025 09:59:21 +0100 (CET)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com,
	helen.fornazier@gmail.com,
	airlied@gmail.com,
	simona.vetter@ffwll.ch,
	robdclark@gmail.com,
	guilherme.gallo@collabora.com,
	sergi.blanch.torne@collabora.com,
	valentine.burley@collabora.com,
	lumag@kernel.org,
	quic_abhinavk@quicinc.com,
	mripard@kernel.org,
	jani.nikula@linux.intel.com,
	linux-mediatek@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	amd-gfx@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/3] drm/ci: arm64.config: mediatek: enable PHY drivers
Date: Fri, 14 Mar 2025 14:28:52 +0530
Message-ID: <20250314085858.39328-4-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250314085858.39328-1-vignesh.raman@collabora.com>
References: <20250314085858.39328-1-vignesh.raman@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The mediatek display driver fails to probe on mt8173-elm-hana and
mt8183-kukui-jacuzzi-juniper-sku16 in v6.14-rc4 due to missing PHY
configurations.

Enable the following PHY drivers for MediaTek platforms:
- CONFIG_PHY_MTK_HDMI=y for HDMI display
- CONFIG_PHY_MTK_MIPI_DSI=y for DSI display

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---
 drivers/gpu/drm/ci/arm64.config | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/ci/arm64.config b/drivers/gpu/drm/ci/arm64.config
index a8fca079921b..fddfbd4d2493 100644
--- a/drivers/gpu/drm/ci/arm64.config
+++ b/drivers/gpu/drm/ci/arm64.config
@@ -193,6 +193,8 @@ CONFIG_PWM_MTK_DISP=y
 CONFIG_MTK_CMDQ=y
 CONFIG_REGULATOR_DA9211=y
 CONFIG_DRM_ANALOGIX_ANX7625=y
+CONFIG_PHY_MTK_HDMI=y
+CONFIG_PHY_MTK_MIPI_DSI=y
 
 # For nouveau.  Note that DRM must be a module so that it's loaded after NFS is up to provide the firmware.
 CONFIG_ARCH_TEGRA=y
-- 
2.47.2


