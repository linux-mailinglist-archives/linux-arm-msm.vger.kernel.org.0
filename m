Return-Path: <linux-arm-msm+bounces-48197-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 423E9A3817F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 12:19:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 73EE31704A3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 11:18:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C450C217F20;
	Mon, 17 Feb 2025 11:18:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [5.144.164.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28EC2165E2
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 11:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.144.164.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739791084; cv=none; b=I3Hb+Mrh3qkhVpLLAqvYROqjZEalLqLJM07y3w1nZm3Pjc7E+9ZBfeskpvxXpnAcjOr9WJKyN1LOsrRjrcBW1gr71X7yMczNj48WhoV7SJdFniTuOyWNcvW2foXNRBoxi0L0bQcDLmTncFYtsXV5wS8Qd7at2QPBp0bkHgopQlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739791084; c=relaxed/simple;
	bh=drRnFxgg1L1HkjA8cDu1XcjU//ZbLn26xuJFrUxc9i0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KA/LoSQLKLR5ZvHuYxH9jZARTJgvauakqEzs5pixpgALtm3wWJDcAYIUS2BJ5T/BxT+FONPCa1TDbwQd8+gw/KtaRTakM1k/+GX1pQVs5T7CQ2+cxOot+sFi5l2TAVrzIdZkhNKaekUzrUjP3mIGnTAtpgAmBOWx8XVoHgyouM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org; spf=pass smtp.mailfrom=somainline.org; arc=none smtp.client-ip=5.144.164.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=somainline.org
Received: from Marijn-Arch-PC.localdomain (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 7B5391F8B0;
	Mon, 17 Feb 2025 12:17:54 +0100 (CET)
From: Marijn Suijten <marijn.suijten@somainline.org>
Date: Mon, 17 Feb 2025 12:17:42 +0100
Subject: [PATCH v3 2/3] drm/msm/dsi: Set PHY usescase (and mode) before
 registering DSI host
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-drm-msm-initial-dualpipe-dsc-fixes-v3-2-913100d6103f@somainline.org>
References: <20250217-drm-msm-initial-dualpipe-dsc-fixes-v3-0-913100d6103f@somainline.org>
In-Reply-To: <20250217-drm-msm-initial-dualpipe-dsc-fixes-v3-0-913100d6103f@somainline.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Vinod Koul <vkoul@kernel.org>, 
 Simona Vetter <simona@ffwll.ch>, Archit Taneja <architt@codeaurora.org>, 
 Hai Li <hali@codeaurora.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3750;
 i=marijn.suijten@somainline.org; h=from:subject:message-id;
 bh=drRnFxgg1L1HkjA8cDu1XcjU//ZbLn26xuJFrUxc9i0=;
 b=owEBbQKS/ZANAwAIAfFi0jHH5IZ2AcsmYgBnsxrg6BTjtoTx1KOrLJGWkv3nYFR7o9tYMTZpu
 dy9JlOc1ReJAjMEAAEIAB0WIQROiwG5pb6la1/WZxbxYtIxx+SGdgUCZ7Ma4AAKCRDxYtIxx+SG
 dvkdD/9Ix7zgahopBu6M5R/YDwxrCljO/pPcsiyk/iWcUXH4KKAt3l/JuP6kdsN4XlS7Kt9fKYs
 g8vKBEcTZPdTB3nki9p7IDBqRLnBhTGlclTLwrpz26xPIfDj+eYCS+EneoN7RfDGxkuQtWSKJYw
 oFxbysWK5GylEb//zCbDTRH+4iVK9jyKbQdg2vxZonpb2EfZ0ZmlOimFMaXUNw1QPUFcsj0ozus
 /kMlVhGkTm3+tQRVkMEIE91tkK58osmsxbiaEfhvNKm/wpDlfTK7jjdPmIrV+g5NoBIdZHQlE4W
 o7zpG0Ss+2iF6UMu4Hp+Zy2+84CI9UhEDe6FyRDbnw/FMzl/3JwDNdRQmdCCoiMJ9f4nxltRa+4
 GuQkQs/i7HkAlWI4n2k0R5IVnUL43Jod90EoPc/KkcG56c92TQkHrBi9ZxFv5l5XE1rncCdvw/1
 5nfUBE4cQz5qVd4uhpFqJdXVoVmA/jE+p6WyyDstlxB2GI7xV1y+tHx+GXA1TfK4BrlekU4Eb06
 4OuQSbqL1aLOpVljhGF6Bh2X7haZpDxXM8+jcNpv2aLQjzyRs0uELJhKRNEdYKsVqVOyFev5ONN
 +PGejxHGraPwH5Xl9DXr/9TtgeCRoMIMwSKGHB+igX8RWetcuBS+dYL8M2kpbkA9E2HjRYDo2em
 pMaBntImu06E4cw==
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

Fixes: 57bf43389337 ("drm/msm/dsi: Pass down use case to PHY")
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index a210b7c9e5ca281a46fbdb226e25832719a684ea..4fabb01345aa2a6de60bee4dc0dd0b1a4245509c 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -74,17 +74,35 @@ static int dsi_mgr_setup_components(int id)
 	int ret;
 
 	if (!IS_BONDED_DSI()) {
+		/*
+		 * Set the usecase before calling msm_dsi_host_register(), which would
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
+		/*
+		 * PLL0 is to drive both DSI link clocks in bonded DSI mode.
+		 *
+		 * Set the usecase before calling msm_dsi_host_register(), which would
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
@@ -98,14 +116,6 @@ static int dsi_mgr_setup_components(int id)
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


