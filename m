Return-Path: <linux-arm-msm+bounces-30360-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1019677C8
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Sep 2024 18:24:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D603A1F2102C
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Sep 2024 16:24:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A054E18132F;
	Sun,  1 Sep 2024 16:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="gCYD8Bp2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780A444C97;
	Sun,  1 Sep 2024 16:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725207838; cv=none; b=a8jcfIymklLIuRtwmD0cvck1NJWPWemoPz1x99CuGdEM/OIL7GpY/sBGSpUFrlCk5pk4+yY1Q4iRYQxSLTRg5IgzGShk4PmfSV/UkKZrhlrEOiFtp8ckh4s+MyUBg+Eutozmnkl4nevUCTJkf87wOo54sN9oIycJhTjbGIhzuUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725207838; c=relaxed/simple;
	bh=wWRdV5p4nQfoqiJ0mlLfx4NkNTOoGZNwSUVpEcTxru0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RfY9nT78RvqDWhI6Mn46wHo4nRkT/PgYezTVQur2lhGAZT1Igw9IBNLYQ8sIm3S7JmW+N2GhbNiFNhMQKPpgzSPJXM8pao4OZUPntoCzWl4A0uP9qaEVeSZwAA5dZSN84lijzuqUhpvRuWgWHteKXknPJ3rrczkHUdk0H8jsssY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=gCYD8Bp2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 897F1C4CEC3;
	Sun,  1 Sep 2024 16:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1725207838;
	bh=wWRdV5p4nQfoqiJ0mlLfx4NkNTOoGZNwSUVpEcTxru0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gCYD8Bp2OMrFkC4W5H9jNgMZPCefXGqV+5MMbD+KGfb8a0+CnliVzuy2RL/XJwBEn
	 Knt8vjdjEIXldma0xzdgStxw7/5JCtKgYhiudOsmzZ+fiXb+Y+v5ih+dsa+jYbSTIb
	 S81Lsp58kmmRPH9e3f5/3aK/QtDh37qZg3D+e3NU=
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
Subject: [PATCH 4.19 61/98] drm/msm: use drm_debug_enabled() to check for debug categories
Date: Sun,  1 Sep 2024 18:16:31 +0200
Message-ID: <20240901160805.999662896@linuxfoundation.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240901160803.673617007@linuxfoundation.org>
References: <20240901160803.673617007@linuxfoundation.org>
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

4.19-stable review patch.  If anyone has any objections, please let me know.

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
index 56ae888e18fc7..97840b29fd7a2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -42,7 +42,7 @@
  */
 #define DPU_DEBUG(fmt, ...)                                                \
 	do {                                                               \
-		if (unlikely(drm_debug & DRM_UT_KMS))                      \
+		if (drm_debug_enabled(DRM_UT_KMS))                         \
 			DRM_DEBUG(fmt, ##__VA_ARGS__); \
 		else                                                       \
 			pr_debug(fmt, ##__VA_ARGS__);                      \
@@ -54,7 +54,7 @@
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




