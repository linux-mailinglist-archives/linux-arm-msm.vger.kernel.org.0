Return-Path: <linux-arm-msm+bounces-50662-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E81A57683
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 01:04:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EA2E17AA606
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 00:02:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC894946F;
	Sat,  8 Mar 2025 00:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tmxc3X9Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE703C38;
	Sat,  8 Mar 2025 00:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741392156; cv=none; b=gUXjC5a2W86EyHvFEfgFBOUZD+sDbQ3ixBgDNdTku1W8EscL2OcbiN0mADGbQVHy+psaCdIdsNHNmFNd5M+mY0E3mDZIomeut61J0Ccz6WQOC848jqZ7R+RsOdbxss9lj44stGvgwIm0vGVEPxYdhjjD5vk68hKLXnc+Bo4aINs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741392156; c=relaxed/simple;
	bh=sv0z2i271sLcYXMwXuCh8oJoHQPmuOM3lbEjxtsEYSc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=azESBrusVRU/nJ4nClF/0ubPaj4DXCB1ocOmpRUTgpRmfgwXDrbeBHbIBLZOwzr8eck/iQVlzdB/OdLb8P6cRD3RIdZX4S1PfWABaZGwneN0uw/pyfRM0TAfWqcT5GPzeP2g5bFpPJn2jwL+92KE6ZL5wdIgr6qwUPnVvvlWosE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tmxc3X9Q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4C61C4CEE5;
	Sat,  8 Mar 2025 00:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741392156;
	bh=sv0z2i271sLcYXMwXuCh8oJoHQPmuOM3lbEjxtsEYSc=;
	h=From:Date:Subject:To:Cc:From;
	b=tmxc3X9QY1L548O/4YBVNDxEfnblVhiXvcUc5wYqvpcWvfRfqTukC0DYL1v1rGAtu
	 cRcX4gDiaN7d4TIfkRZQ+EKn7IeM6k+19qnb00Egh+/bL4UWBAYzbGjZWakg8zT17Q
	 s5hTfr+Gko3Lk/IT69/0Is9wzOUmfyPacedVdb+vKR7Ed16l74bq99goc4KIy5jpte
	 /f67mcOB9jgRQWykMHulXJY3pYyP9tQQaQ4p+KeWMwa/QmB6c5bcG8Q7XQImY9lD/V
	 dMqkE7gOt+pMXJreRTc50CiR6zfCamx7fK4kuEkIGUotLNrYVQph0xj89nIcPQrORd
	 bi4XPvLrOORQg==
From: Dmitry Baryshkov <lumag@kernel.org>
Date: Sat, 08 Mar 2025 02:02:21 +0200
Subject: [PATCH] drm/msm/dpu: drop wb2_formats_rgb
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250308-dpu-drop-wb2-rgb-v1-1-f5503fcd1bc2@linaro.org>
X-B4-Tracking: v=1; b=H4sIAAyJy2cC/x2MywqAIBAAf0X23IIaQvUr0SFzq72krPSA8N+TT
 sMcZl7IJEwZBvWC0MWZ41HFNAqWfT42Qg7VwWrrdKs7DOnEIDHh7S3K5pG63llN3lRCzZLQys+
 /HKdSPjfjJsJiAAAA
X-Change-ID: 20250308-dpu-drop-wb2-rgb-e89520eb1895
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1880;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=EOtjiLQMv2fwvuf/Yb/mRhhdNPCaVvy3NMCUZU0syAs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBny4kZmuKTVnAzQdUndCI36m92REaQw0uUC/NXU
 W8nSrWC/oOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8uJGQAKCRCLPIo+Aiko
 1VBMCACWKdyzWyJCgqqaZ+zr2EUMR3YhiBc80tZa5Qq0HhHvgA1pW5lPGbw8Knq+Y7WInPEqjZL
 2ZV+BU20rBvcyaBK0otgGHCMISL48MmqTqf9ki+k2N858VGGvLddJYyDlUbJ5ZH5rU9mS1XekeA
 tiEzaCc20VrkI9wF3IEmPeuQfv0Xxe0sF74r11EqnEOx+dchWIXKT5HuytObVWPGXacOfnPQSkl
 WuOw6gWGAQAORFePfiwRMfukEplVWQOaoHPmaHPse+icfC5DaVwBkzt9f0ul0OfMIdnPXnA1pIr
 OfoLSlVkybWFbYb+j1/J7RvLJepX1pAZpMMkSyFGzPCeyt3Q
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

After enabling YUV support for writeback on a variety of DPU hardware,
the wb2_formats_rgb is now unused. Drop it following the report of LKP.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202503071857.oZbQsPaE-lkp@intel.com/
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 31 --------------------------
 1 file changed, 31 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index a6bb46b201e907566e88abce945507d1bab51b3b..64265ca4656a04d8c5a1d9582d7124c7eb897099 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -232,37 +232,6 @@ static const u32 rotation_v2_formats[] = {
 	/* TODO add formats after validation */
 };
 
-static const u32 wb2_formats_rgb[] = {
-	DRM_FORMAT_RGB565,
-	DRM_FORMAT_BGR565,
-	DRM_FORMAT_RGB888,
-	DRM_FORMAT_ARGB8888,
-	DRM_FORMAT_RGBA8888,
-	DRM_FORMAT_ABGR8888,
-	DRM_FORMAT_XRGB8888,
-	DRM_FORMAT_RGBX8888,
-	DRM_FORMAT_XBGR8888,
-	DRM_FORMAT_ARGB1555,
-	DRM_FORMAT_RGBA5551,
-	DRM_FORMAT_XRGB1555,
-	DRM_FORMAT_RGBX5551,
-	DRM_FORMAT_ARGB4444,
-	DRM_FORMAT_RGBA4444,
-	DRM_FORMAT_RGBX4444,
-	DRM_FORMAT_XRGB4444,
-	DRM_FORMAT_BGR888,
-	DRM_FORMAT_BGRA8888,
-	DRM_FORMAT_BGRX8888,
-	DRM_FORMAT_ABGR1555,
-	DRM_FORMAT_BGRA5551,
-	DRM_FORMAT_XBGR1555,
-	DRM_FORMAT_BGRX5551,
-	DRM_FORMAT_ABGR4444,
-	DRM_FORMAT_BGRA4444,
-	DRM_FORMAT_BGRX4444,
-	DRM_FORMAT_XBGR4444,
-};
-
 static const u32 wb2_formats_rgb_yuv[] = {
 	DRM_FORMAT_RGB565,
 	DRM_FORMAT_BGR565,

---
base-commit: 54143d20fce136123fa4d48487a71747f842bdc3
change-id: 20250308-dpu-drop-wb2-rgb-e89520eb1895

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


