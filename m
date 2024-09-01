Return-Path: <linux-arm-msm+bounces-30367-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8F0967984
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Sep 2024 18:47:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 997491F21B6E
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Sep 2024 16:47:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C97D318786B;
	Sun,  1 Sep 2024 16:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fNV0CvYk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB76187866;
	Sun,  1 Sep 2024 16:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725209077; cv=none; b=jlGt/Dgi6Z0i2Xs6v5xOeaeaYN+HMh/ju7if0C6Rqa73r7w415ANqwaIpi4fJRZsIazCt6iqWL/tf8cpnsGFjdT+M/E6z8ZntifpT4kYDUN1p6mo4HCqVLGlxJ5vfYGhSAC4R3zH6gXsiHj+BvIuJtoFErrf30n41MGbLlYW0RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725209077; c=relaxed/simple;
	bh=zfIVDZ++hPOLBEK3oz6U1xatxw9Z40PH3RNul3DMFXY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GLVID/9LIYO4I+hUv85wpgukGppk+NlbraNoiKLOekoHvx3f6qmsevQ+eXSIJTsC9PTpTsX4L4BXbDPBbJtgryjDW2aCCiHNVX9buwDepTFOtemGJVPuah/BgnyWi4/b6b6+grlsPS6U6LJ75qM1tPI1/n0pkBM+hI2Vj8ocwMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=fNV0CvYk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18FAEC4CEC9;
	Sun,  1 Sep 2024 16:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1725209077;
	bh=zfIVDZ++hPOLBEK3oz6U1xatxw9Z40PH3RNul3DMFXY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fNV0CvYkQTCOk8E9kMp7TXvIdwXgkTjWnBylbR6mQWxOcqrLSHKQCLfai5w4ZoUka
	 IRvqo5skcXTJ6MZwcFgpI1ZChu0myJEiVXr+4B2taH2tfPeHOMnCuWvOGalGBh2Xb0
	 wEv1oelWwA37iWj9Icn6WSPG7cjf8x3MWlKKMX80=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	patches@lists.linux.dev,
	Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Jani Nikula <jani.nikula@intel.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 5.4 095/134] drm/msm: use drm_debug_enabled() to check for debug categories
Date: Sun,  1 Sep 2024 18:17:21 +0200
Message-ID: <20240901160813.670282230@linuxfoundation.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240901160809.752718937@linuxfoundation.org>
References: <20240901160809.752718937@linuxfoundation.org>
User-Agent: quilt/0.67
X-stable: review
X-Patchwork-Hint: ignore
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

5.4-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Jani Nikula <jani.nikula@intel.com>

[ Upstream commit d8db0b36d888b6a5eb392f112dc156e694de2369 ]

Allow better abstraction of the drm_debug global variable in the
future. No functional changes.

v2: Move unlikely() to drm_debug_enabled()

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
Reviewed-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/c7142cdebb5f6fed527272b333cd6c43c0aa68ec.1569329774.git.jani.nikula@intel.com
Stable-dep-of: df24373435f5 ("drm/msm/dpu: don't play tricks with debug macros")
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index 6a4813505c33c..d6c26426b1c6e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -31,7 +31,7 @@
  */
 #define DPU_DEBUG(fmt, ...)                                                \
 	do {                                                               \
-		if (unlikely(drm_debug & DRM_UT_KMS))                      \
+		if (drm_debug_enabled(DRM_UT_KMS))                         \
 			DRM_DEBUG(fmt, ##__VA_ARGS__); \
 		else                                                       \
 			pr_debug(fmt, ##__VA_ARGS__);                      \
@@ -43,7 +43,7 @@
  */
 #define DPU_DEBUG_DRIVER(fmt, ...)                                         \
 	do {                                                               \
-		if (unlikely(drm_debug & DRM_UT_DRIVER))                   \
+		if (drm_debug_enabled(DRM_UT_DRIVER))                      \
 			DRM_ERROR(fmt, ##__VA_ARGS__); \
 		else                                                       \
 			pr_debug(fmt, ##__VA_ARGS__);                      \
-- 
2.43.0




