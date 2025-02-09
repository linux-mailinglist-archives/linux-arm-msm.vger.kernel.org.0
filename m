Return-Path: <linux-arm-msm+bounces-47331-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F31A2E0EB
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2025 22:43:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 26A201641C2
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2025 21:43:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 466CA1FC10F;
	Sun,  9 Feb 2025 21:43:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it [5.144.164.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ADA81E5721
	for <linux-arm-msm@vger.kernel.org>; Sun,  9 Feb 2025 21:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.144.164.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739137385; cv=none; b=fgxwzkOaejfO5gMa9FQeRR0tnrWdircUGC3mPvtFy75+LFhyXYfKAEySSfgjG4aJYkoLbTIOIxSzrCFfC9uE9laJMlh0jiLv6ovEgJPO6Mq3SKj+2yFzXCK+AIc6LWdPxBwD4a/g/Fd0Ey9jwny/HE24h8MYTKo9MRnYzRtHjvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739137385; c=relaxed/simple;
	bh=Tfsl+1a40BScE8ikvZaM3H+qVdmMOmXUCGzcdcW2ync=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CKgwHQ+ur7oUBcgM1f+k9UxZ9NEeC/Y5MC6d4PBezKvPwXIQIey0rKGCUyXeV2slsxZTTi9/3dH4Vtrlgk7RHGiu/cvQUDalObJvAvgDLzMkby56JE9PHY9U38ciPf+MCNt16f4QlScJD3xmoNyyKLb3jAizApeVzplPK7792Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org; spf=pass smtp.mailfrom=somainline.org; arc=none smtp.client-ip=5.144.164.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=somainline.org
Received: from Marijn-Arch-PC.localdomain (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 89E572018C;
	Sun,  9 Feb 2025 22:43:00 +0100 (CET)
From: Marijn Suijten <marijn.suijten@somainline.org>
Date: Sun, 09 Feb 2025 22:42:53 +0100
Subject: [PATCH v2 2/3] drm/msm/dsi: Set PHY usescase (and mode) before
 registering DSI host
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250209-drm-msm-initial-dualpipe-dsc-fixes-v2-2-9a60184fdc36@somainline.org>
References: <20250209-drm-msm-initial-dualpipe-dsc-fixes-v2-0-9a60184fdc36@somainline.org>
In-Reply-To: <20250209-drm-msm-initial-dualpipe-dsc-fixes-v2-0-9a60184fdc36@somainline.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Vinod Koul <vkoul@kernel.org>, 
 Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jordan Crouse <jordan@cosmicpenguin.net>, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Martin Botka <martin.botka@somainline.org>, 
 Jami Kettunen <jami.kettunen@somainline.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3553;
 i=marijn.suijten@somainline.org; h=from:subject:message-id;
 bh=Tfsl+1a40BScE8ikvZaM3H+qVdmMOmXUCGzcdcW2ync=;
 b=owEBbQKS/ZANAwAIAfFi0jHH5IZ2AcsmYgBnqSFiT34CP+ZJaA+rzArxEFLoN1LWvZjH/Bies
 mr2e4ZztEmJAjMEAAEIAB0WIQROiwG5pb6la1/WZxbxYtIxx+SGdgUCZ6khYgAKCRDxYtIxx+SG
 dvTGEACxAnMNqxkekAmzf0r7lozEJOigflfa9+ZcLs+RUG7X/3DZ3zzzlLauHO0tzU/HWB+OWEm
 3JJ1xU8ckjnH8J0J6shnG2dL3xS4VlHq5Ix55Z3ZkyJIF6pxnBuBqthHZGF3imuXex9fnHHVNp3
 h8lTfYj42YJRUGDlEYDyWUHFSo5tD76Y8guTlcvyQ12vLXlPKudvCoVz8yqmK5JFlwdzywazPhf
 KlgFyWlyzBbHHG+XLel5Z0kqbTMI/b1PizeFvyPUuADCQ1zBwIur2M88v3scfDbA5TxUyQuUAnM
 2+KlC2LVjgrG/h6VCK21Bg8ndojIowYAiDdsWMu/2HmAyH/X8L3/BBIudDLoo7Ya+xCeI7mBPvk
 oHzGMC60CVTp9Z4Xgd9Cq9xzO//SekabwP/RTMlkVk59eujBHGRDRs5i1p7IaawUVnF0QkON3EO
 5eBNrhsvYFURfpiodTLrfg1gn9sNQkfhslulY/dr0nNtx8F82FIUBGu8qsJS40ZCWYeDfi+/Uof
 JWPwVLWsEtXBTys3nDGhMmG5jCb+mr1zhtHzbpOUQBS0qHAfxdVORnIZ5TYVzYrc/pnreo7J2mi
 SYMOmVIz8ZwP+dlyeAFY3WUHeRUFhmaYbvZvh2/k+ffO6lkSR8y4GTbEAMQBrR0NbwE+/k/kTQo
 71QhOLH1+c0sUgA==
X-Developer-Key: i=marijn.suijten@somainline.org; a=openpgp;
 fpr=4E8B01B9A5BEA56B5FD66716F162D231C7E48676

Ordering issues here cause an uninitialized (default STANDALONE)
usecase to be programmed (which appears to be a MUX) in some cases
when msm_dsi_host_register() is called, leading to the slave PLL in
bonded-DSI mode to source from a clock parent (dsi1vco) that is off.

This should seemingly not be a problem as the actual dispcc clocks from
DSI1 that are muxed in the clock tree of DSI0 are way further down, this
bit still seems to have an effect on them somehow and causes the right
side of the panel controlled by DSI1 to not function.

In an ideal world this code is refactored to no longer have such
error-prone calls "across subsystems", and instead model the "PLL src"
register field as a regular mux so that changing the clock parents
programmatically or in DTS via `assigned-clock-parents` has the
desired effect.
But for the avid reader, the clocks that we *are* muxing into DSI0's
tree are way further down, so if this bit turns out to be a simple mux
between dsiXvco and out_div, that shouldn't have any effect as this
whole tree is off anyway.

Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 30 +++++++++++++++++++-----------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index a210b7c9e5ca281a46fbdb226e25832719a684ea..b93205c034e4acc73d536deeddce6ebd694b4a80 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -74,17 +74,33 @@ static int dsi_mgr_setup_components(int id)
 	int ret;
 
 	if (!IS_BONDED_DSI()) {
+		/* Set the usecase before calling msm_dsi_host_register(), which would
+		 * already program the PLL source mux based on a default usecase.
+		 */
+		msm_dsi_phy_set_usecase(msm_dsi->phy, MSM_DSI_PHY_STANDALONE);
+		msm_dsi_host_set_phy_mode(msm_dsi->host, msm_dsi->phy);
+
 		ret = msm_dsi_host_register(msm_dsi->host);
 		if (ret)
 			return ret;
-
-		msm_dsi_phy_set_usecase(msm_dsi->phy, MSM_DSI_PHY_STANDALONE);
-		msm_dsi_host_set_phy_mode(msm_dsi->host, msm_dsi->phy);
 	} else if (other_dsi) {
 		struct msm_dsi *master_link_dsi = IS_MASTER_DSI_LINK(id) ?
 							msm_dsi : other_dsi;
 		struct msm_dsi *slave_link_dsi = IS_MASTER_DSI_LINK(id) ?
 							other_dsi : msm_dsi;
+
+		/* PLL0 is to drive both DSI link clocks in bonded DSI mode.
+		 *
+		/* Set the usecase before calling msm_dsi_host_register(), which would
+		 * already program the PLL source mux based on a default usecase.
+		 */
+		msm_dsi_phy_set_usecase(clk_master_dsi->phy,
+					MSM_DSI_PHY_MASTER);
+		msm_dsi_phy_set_usecase(clk_slave_dsi->phy,
+					MSM_DSI_PHY_SLAVE);
+		msm_dsi_host_set_phy_mode(msm_dsi->host, msm_dsi->phy);
+		msm_dsi_host_set_phy_mode(other_dsi->host, other_dsi->phy);
+
 		/* Register slave host first, so that slave DSI device
 		 * has a chance to probe, and do not block the master
 		 * DSI device's probe.
@@ -98,14 +114,6 @@ static int dsi_mgr_setup_components(int id)
 		ret = msm_dsi_host_register(master_link_dsi->host);
 		if (ret)
 			return ret;
-
-		/* PLL0 is to drive both 2 DSI link clocks in bonded DSI mode. */
-		msm_dsi_phy_set_usecase(clk_master_dsi->phy,
-					MSM_DSI_PHY_MASTER);
-		msm_dsi_phy_set_usecase(clk_slave_dsi->phy,
-					MSM_DSI_PHY_SLAVE);
-		msm_dsi_host_set_phy_mode(msm_dsi->host, msm_dsi->phy);
-		msm_dsi_host_set_phy_mode(other_dsi->host, other_dsi->phy);
 	}
 
 	return 0;

-- 
2.48.1


