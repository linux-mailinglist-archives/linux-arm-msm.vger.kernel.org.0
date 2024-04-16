Return-Path: <linux-arm-msm+bounces-17632-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2101B8A796B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Apr 2024 01:57:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 521A31C22037
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Apr 2024 23:57:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2336113AA3E;
	Tue, 16 Apr 2024 23:57:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [5.144.164.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB1F13A87C
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Apr 2024 23:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.144.164.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713311870; cv=none; b=Rx2Du/sN8cbW3Ww4OpcAU5SV4+is7Ffo3ucmspnSsGoRcyguXpzwNUhawDjjBodi6neD0dagtfG7qA8TGVp5mgZYyRZlnPbjZWxu8rfc+lroZvBZnzZagwqohYL3aojiOCAmSuaZo59C/WqIfnGmwg2kcQ33n7cjEYpmJKB4Ho8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713311870; c=relaxed/simple;
	bh=5ttiwjfaLJXNdpmC8bn2ll2jKYVITC5JFxVVth4v55g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UrRwWiYcTY5hOHvLndm+pV3ayVUtOJuHtOjqprT/rwa1cIBTIx64xtJJOLy8xnsUxvquyGKMf5kCMAsiLRjdvN4iHwMf/mH7L6Xojzk5Alc3Y0YiBenpnDOtPJME8RCzFThUA+Ff+DtqbJGFj6/FGEBLsf8MLgVofVR252kYo3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org; spf=pass smtp.mailfrom=somainline.org; arc=none smtp.client-ip=5.144.164.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=somainline.org
Received: from Marijn-Arch-PC.localdomain (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r2.th.seeweb.it (Postfix) with ESMTPSA id C53143F003;
	Wed, 17 Apr 2024 01:57:44 +0200 (CEST)
From: Marijn Suijten <marijn.suijten@somainline.org>
Date: Wed, 17 Apr 2024 01:57:41 +0200
Subject: [PATCH 1/7] drm/msm/dsi: Print dual-DSI-adjusted pclk instead of
 original mode pclk
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240417-drm-msm-initial-dualpipe-dsc-fixes-v1-1-78ae3ee9a697@somainline.org>
References: <20240417-drm-msm-initial-dualpipe-dsc-fixes-v1-0-78ae3ee9a697@somainline.org>
In-Reply-To: <20240417-drm-msm-initial-dualpipe-dsc-fixes-v1-0-78ae3ee9a697@somainline.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Archit Taneja <architt@codeaurora.org>, 
 Chandan Uddaraju <chandanu@codeaurora.org>, Vinod Koul <vkoul@kernel.org>, 
 Sravanthi Kollukuduru <skolluku@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jordan Crouse <jordan@cosmicpenguin.net>, 
 Rajesh Yadav <ryadav@codeaurora.org>, 
 Jeykumar Sankaran <jsanka@codeaurora.org>, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Martin Botka <martin.botka@somainline.org>, 
 Jami Kettunen <jami.kettunen@somainline.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>
X-Mailer: b4 0.13.0

When dual-DSI (bonded DSI) was added in commit ed9976a09b48
("drm/msm/dsi: adjust dsi timing for dual dsi mode") some DBG() prints
were not updated, leading to print the original mode->clock rather
than the adjusted (typically the mode clock divided by two, though more
recently also adjusted for DSC compression) msm_host->pixel_clk_rate
which is passed to clk_set_rate() just below.  Fix that by printing the
actual pixel_clk_rate that is being set.

Fixes: ed9976a09b48 ("drm/msm/dsi: adjust dsi timing for dual dsi mode")
Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 9d86a6aca6f2..c80be74cf10b 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -356,8 +356,8 @@ int dsi_link_clk_set_rate_6g(struct msm_dsi_host *msm_host)
 {
 	int ret;
 
-	DBG("Set clk rates: pclk=%d, byteclk=%lu",
-		msm_host->mode->clock, msm_host->byte_clk_rate);
+	DBG("Set clk rates: pclk=%lu, byteclk=%lu",
+	    msm_host->pixel_clk_rate, msm_host->byte_clk_rate);
 
 	ret = dev_pm_opp_set_rate(&msm_host->pdev->dev,
 				  msm_host->byte_clk_rate);
@@ -430,9 +430,9 @@ int dsi_link_clk_set_rate_v2(struct msm_dsi_host *msm_host)
 {
 	int ret;
 
-	DBG("Set clk rates: pclk=%d, byteclk=%lu, esc_clk=%lu, dsi_src_clk=%lu",
-		msm_host->mode->clock, msm_host->byte_clk_rate,
-		msm_host->esc_clk_rate, msm_host->src_clk_rate);
+	DBG("Set clk rates: pclk=%lu, byteclk=%lu, esc_clk=%lu, dsi_src_clk=%lu",
+	    msm_host->pixel_clk_rate, msm_host->byte_clk_rate,
+	    msm_host->esc_clk_rate, msm_host->src_clk_rate);
 
 	ret = clk_set_rate(msm_host->byte_clk, msm_host->byte_clk_rate);
 	if (ret) {

-- 
2.44.0


