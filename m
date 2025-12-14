Return-Path: <linux-arm-msm+bounces-85175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 14AA5CBBC09
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Dec 2025 15:52:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3EFF6300F726
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Dec 2025 14:51:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 001582874E9;
	Sun, 14 Dec 2025 14:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JOf+N7n/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A1327EFE9;
	Sun, 14 Dec 2025 14:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765723885; cv=none; b=uephou/58rj+yy8/6a9rDvB86s2h08Ul3ZRL/JfXJ0Nc1X99fVEGtkkPRUEiZMyVDvEB6Ef8G1fYkSwPzgsiGGpCSDkvdTuRESvEOujoLLSf/oMe7ibz+PoA+YdwXu9PEgnzJdOujSx8Qs1ol28YOItKHPdoTVcA1afAQeTF7oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765723885; c=relaxed/simple;
	bh=yqGCB9uagcDios2lrbvEV2ATeYHUVOeKQI+6hrowsf0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f5ZvHiZywz+dtku28cdallVvtV7ZPQvRYvqKc5cMxyW4cLR98H2tsq83Vrp6/07Vtjz7TOi2RvXqiXaBfRVhxjgh64rFV/YLDCcAPI2oUerDSHNXID/gUqUWqTAM7Nlv17LcqUW1GQOfzfJiVTUfMHvnokvcxdqdDrpra2bEsJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JOf+N7n/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 28801C2BCB2;
	Sun, 14 Dec 2025 14:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765723885;
	bh=yqGCB9uagcDios2lrbvEV2ATeYHUVOeKQI+6hrowsf0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=JOf+N7n/wHFQFqcRKogy2oDSGC9ydwmBIU0P/r2BryQgYtXBox24itn7Mmqg0rajz
	 P8SONqPnoVLtDcGdVM5ey+4HDaw4k8BBu02RKxhDi0UBxGQqkfTbP7akcZTMFEQZip
	 Cu35fHKOnoEya76UhL7NQq0+/lFI+tG8iY2dzPzEHV7QNxCKMv+yW42GWugQs7J+Xt
	 M5bjXOJNI7V7ou9j1dSnejgtWKnWz3jaw3+M4taBlJzElurrv90N5k8GhI+ZoYFMdm
	 M6WxdahBZ3WNELyxQGTIIXkixP/eQ65/VjPnbLbL0kRQwAEl+FkRLvPjpPckff6Itn
	 Po2OMmHgXVOsQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20B3DD5B171;
	Sun, 14 Dec 2025 14:51:25 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 14 Dec 2025 15:51:21 +0100
Subject: [PATCH v7 5/8] drm/panel: sw43408: Remove manual invocation of
 unprepare at remove
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251214-pixel-3-v7-5-b1c0cf6f224d@ixit.cz>
References: <20251214-pixel-3-v7-0-b1c0cf6f224d@ixit.cz>
In-Reply-To: <20251214-pixel-3-v7-0-b1c0cf6f224d@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Petr Hodina <phodina@protonmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1036; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=YxNdyRsS+jWwF0GJLCXUSzneFgU0OdR+Q5S8ObKr8gg=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpPs7pk5JtLKnKdkCIskNQb6JYz2ZtvsFDRNpEd
 OVVuVzvsMGJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaT7O6QAKCRBgAj/E00kg
 cns5D/423Rzm9+Lz7y7yDWnGiOf57algKXXrUD013LL5l4xOI+/kxRgZeAYs8+ohpxUEI3M3gHK
 zgKvoOxD8BNMu06Zzx8iWjw91Y8IE35kw7YuTx+eQ1wDREM816OPYTe6FMZ3LS6aAWBcwKO6+gF
 4gZsw8WbQce1mnYJxQY94Y9qqxJSHwTIkVpmCCudnSq3SlDQax3HwV6QUOv6WwMU7fmXFlyOivA
 Liz4JPAK4szUIwLeaCiNTYI5wF7M4pZeJ6G64qDEihS/vst2Wjq0rMt8lJKvs0nLS6IZ9sogVje
 fNatplEdIW91cUUDLeiJpZ+K7b515awonAWX8c7IqGQonbCInpJNUyHddsBOkFmTc4xHYMElDEl
 6I7NBUcl/2r6HlSBDcRyjLXAZy8cniyVexI7uBz7MUh3bEi0GKetAQoaBglpmPbo0rt5QBeux6b
 cCdBhObNqJEZuaWVjaIh+845H9VgcYiKHOQsPYAmpuTATIiiKpeDpkArnFto8eroHZd+ElaF6aF
 aBh9DW+GFtp+LWCF9V4bt72cIt80C5PDb9rewh7Sm5AcOcbQk9scp/xKeHBVhS4G5RjCRCho4Be
 LuRHf2b9lAiHpeLbWKVck5szkVmAccHEE0MPvHEAzsej1H/SeP9lplCA/9nfVvWa87bQKBSySmR
 OBl9IugoQcFLnyA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

The drm_panel_remove should take care of disable/unprepare. Remove the
manual call from the sw43408_remove function.

Fixes: 069a6c0e94f9 ("drm: panel: Add LG sw43408 panel driver")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/gpu/drm/panel/panel-lg-sw43408.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-lg-sw43408.c b/drivers/gpu/drm/panel/panel-lg-sw43408.c
index ed9c7452ea846..f9ec6e9b02c70 100644
--- a/drivers/gpu/drm/panel/panel-lg-sw43408.c
+++ b/drivers/gpu/drm/panel/panel-lg-sw43408.c
@@ -300,10 +300,6 @@ static void sw43408_remove(struct mipi_dsi_device *dsi)
 	struct sw43408_panel *ctx = mipi_dsi_get_drvdata(dsi);
 	int ret;
 
-	ret = sw43408_unprepare(&ctx->base);
-	if (ret < 0)
-		dev_err(&dsi->dev, "failed to unprepare panel: %d\n", ret);
-
 	ret = mipi_dsi_detach(dsi);
 	if (ret < 0)
 		dev_err(&dsi->dev, "failed to detach from DSI host: %d\n", ret);

-- 
2.51.0



