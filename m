Return-Path: <linux-arm-msm+bounces-78782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3F4C09387
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Oct 2025 18:12:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DB3A34EEA73
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Oct 2025 16:10:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D659F303CAC;
	Sat, 25 Oct 2025 16:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="htPnnBJX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95481302756;
	Sat, 25 Oct 2025 16:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761408619; cv=none; b=oKI+VCa5UsfRCOVORTCdorxPqQpVTf13Brd501R+tmyPmdFij7rVH5KGeFcTwGmum7HXHZflcDHEaURIbhZZ5mk8MbyLg3H9FXbvNYPPmvF1O5KfedTKp33XxGxV4iii+9iUsOQPLjNi5LabxhY0s6wd5T/FQBcu1PA8Q7qDAZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761408619; c=relaxed/simple;
	bh=pcGmMuMSi9n9N/ghJrWh3KPhOx5UytewPFJsWCrLLeE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TtfUC699GxVT+RoLKNutFF5rKBXGfWYd29XErXiWIijl8csMnqxaEPl3fZc2xVbhVgd6D8TX0/AxBi7MLxtY3kIeizeCp3mT6E5s4+q0N8sDJw6kghpzy9ghFPdg86qVlOiOydnKlg8DaP68mf4gZKuw2xoEo58yhHexEWLdWIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=htPnnBJX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 472EFC4CEFF;
	Sat, 25 Oct 2025 16:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761408619;
	bh=pcGmMuMSi9n9N/ghJrWh3KPhOx5UytewPFJsWCrLLeE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=htPnnBJXaoadbQHFI3DodbmOnydStDoumkEqtogR0QY1aqAu1Ws5SjMCRT/pjrS62
	 klqN0dHq4FfT/cIZMT+4rx8VGJ6cHZe427PsIr+urDyQA4NxEjzWl5SIQFOj4gzoq9
	 g9C8EqJW8fKlgXrNQ0qFb4QPVCLLR8nb3ZZ3NUOUHwhYNAaY77fghPXaIOrdzKPBVf
	 dBGqf0KTQHccb71zvVRdvziKgVwM9nv0XYkOPSDyfTNQM0ROkXXhGPPZQyzVnWXsoM
	 9O0tvdNe55kvNCyELusf6RCxw63XNV6hp1vMnjuaYZ56Ca8N0GPnRs+S/XA55990ne
	 MitGZ+WvL4qrw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Sasha Levin <sashal@kernel.org>,
	andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org
Subject: [PATCH AUTOSEL 6.17-5.10] drm/bridge: display-connector: don't set OP_DETECT for DisplayPorts
Date: Sat, 25 Oct 2025 11:54:19 -0400
Message-ID: <20251025160905.3857885-28-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025160905.3857885-1-sashal@kernel.org>
References: <20251025160905.3857885-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

[ Upstream commit cb640b2ca54617f4a9d4d6efd5ff2afd6be11f19 ]

Detecting the monitor for DisplayPort targets is more complicated than
just reading the HPD pin level: it requires reading the DPCD in order to
check what kind of device is attached to the port and whether there is
an actual display attached.

In order to let DRM framework handle such configurations, disable
DRM_BRIDGE_OP_DETECT for dp-connector devices, letting the actual DP
driver perform detection. This still keeps DRM_BRIDGE_OP_HPD enabled, so
it is valid for the bridge to report HPD events.

Currently inside the kernel there are only two targets which list
hpd-gpios for dp-connector devices: arm64/qcom/qcs6490-rb3gen2 and
arm64/qcom/sa8295p-adp. Both should be fine with this change.

Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Acked-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Link: https://lore.kernel.org/r/20250802-dp-conn-no-detect-v1-1-2748c2b946da@oss.qualcomm.com
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES

- What it fixes
  - For DisplayPort connectors using the generic display-connector,
    detection was based solely on the HPD GPIO, which is insufficient
    for DP. The DP spec requires reading DPCD to determine sink
    type/presence; HPD high alone can be a false positive (e.g.,
    adapters/hubs with no actual display).
  - This patch prevents the generic bridge from advertising “I can
    detect” for DP, so the DRM framework will delegate detection to the
    actual DP bridge/driver that can read DPCD.

- Code paths and behavior change
  - Previously, the generic connector always advertised
    `DRM_BRIDGE_OP_DETECT` if either DDC was present or an HPD GPIO
    existed:
    - `drivers/gpu/drm/bridge/display-connector.c:363` sets
      `DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_DETECT` when
      `conn->bridge.ddc` exists (DP doesn’t use DDC).
    - `drivers/gpu/drm/bridge/display-connector.c:367` sets
      `DRM_BRIDGE_OP_DETECT` whenever `conn->hpd_gpio` exists (this is
      the problematic path for DP).
    - The detection callback itself relies on `hpd_gpio` to return
      connected/disconnected (no DPCD), see
      `drivers/gpu/drm/bridge/display-connector.c:42`.
  - The patch changes the HPD path to skip `DRM_BRIDGE_OP_DETECT` for
    DP:
    - Replaces the unconditional HPD-based detect flag with: “if
      `conn->hpd_gpio` and `type != DRM_MODE_CONNECTOR_DisplayPort` then
      set `DRM_BRIDGE_OP_DETECT`.” Net effect: DP no longer claims
      detect via HPD only.
  - `DRM_BRIDGE_OP_HPD` remains enabled if the IRQ is available
    (`drivers/gpu/drm/bridge/display-connector.c:368-369`), so hotplug
    events still propagate correctly.

- Why this is correct in DRM’s bridge pipeline
  - DRM uses the last bridge in the chain that advertises
    `DRM_BRIDGE_OP_DETECT` to perform detection
    (`drivers/gpu/drm/display/drm_bridge_connector.c:177-188`). Before
    this change, that “last” bridge was often the dp-connector (generic)
    rather than the DP controller bridge, causing HPD-only detection to
    be used for DP.
  - By not setting `OP_DETECT` on dp-connector for DP, detection falls
    back to the DP bridge/driver, which generally implements proper DP
    detection (reads DPCD). Example: Qualcomm MSM DP sets
    `DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_HPD` and implements `.detect =
    dp_bridge_detect()` based on link readiness
    (`drivers/gpu/drm/msm/dp/dp_drm.c:312-352`).

- Scope and regression risk
  - Device tree usage audit shows that only two in-tree platforms
    currently define `hpd-gpios` on `dp-connector` nodes (exactly as the
    commit states), so the behavioral change is tightly scoped:
    - `arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts:46` (has `hpd-
      gpios`)
    - `arch/arm64/boot/dts/qcom/sa8295p-adp.dts:34,48,62,76,90,104`
      (several DP/eDP-labelled connectors with `hpd-gpios`)
  - `DRM_BRIDGE_OP_HPD` still gets set when the GPIO can provide
    interrupts, so hotplug remains functional. For these platforms, the
    MSM DP bridge advertises `OP_DETECT`, so detection naturally
    migrates to the DP driver which reads DPCD.
  - No architectural changes; the patch is a small, localized condition
    guarding one flag. It doesn’t alter EDID handling or power control
    and doesn’t affect non-DP connectors.

- Stable policy fit
  - This is a correctness fix for user-visible behavior (false
    “connected” status on DP due to HPD-only detection), small and well-
    contained, with minimal regression risk. It touches one driver file
    and only DP behavior when `hpd-gpios` is present on dp-connector
    nodes. It keeps HPD events intact and defers detect to the proper DP
    driver as intended by DRM’s bridge design.

Conclusion: Backporting will improve correctness of DP detection with
very low risk and no architectural churn.

 drivers/gpu/drm/bridge/display-connector.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/display-connector.c b/drivers/gpu/drm/bridge/display-connector.c
index 52b7b5889e6fe..4f0295efb8f68 100644
--- a/drivers/gpu/drm/bridge/display-connector.c
+++ b/drivers/gpu/drm/bridge/display-connector.c
@@ -373,7 +373,8 @@ static int display_connector_probe(struct platform_device *pdev)
 	if (conn->bridge.ddc)
 		conn->bridge.ops |= DRM_BRIDGE_OP_EDID
 				 |  DRM_BRIDGE_OP_DETECT;
-	if (conn->hpd_gpio)
+	/* Detecting the monitor requires reading DPCD */
+	if (conn->hpd_gpio && type != DRM_MODE_CONNECTOR_DisplayPort)
 		conn->bridge.ops |= DRM_BRIDGE_OP_DETECT;
 	if (conn->hpd_irq >= 0)
 		conn->bridge.ops |= DRM_BRIDGE_OP_HPD;
-- 
2.51.0


