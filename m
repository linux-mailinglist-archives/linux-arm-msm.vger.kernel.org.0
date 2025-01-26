Return-Path: <linux-arm-msm+bounces-46140-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DA2A1C9B2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jan 2025 16:06:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C9C833AC2F4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jan 2025 15:02:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C1191A262A;
	Sun, 26 Jan 2025 14:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U4BEdvSY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29ACE1A0BF8;
	Sun, 26 Jan 2025 14:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737903237; cv=none; b=QkjJyGjNLGpO1yZ+oh95aeiLVxx8X2UIE7LV0N8LzdNj9TyZwmDJBMnSra07HTGmE66woLPjvkjytR6co24vVf0SWpMonJ9r637w6gO2xCF09fd8VN1z2SLbaAkxl0Nhz7F6+y/UxqA76SQerkqOUAYqLfAaVonwN4t65rXgO/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737903237; c=relaxed/simple;
	bh=+t9llDFbFMn1jJgQFqrQ3k8YWYbBMvG0OVWpHSWc8Q0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=poZaPQ+xUAMWLG8p0G7NMOMRv43+O6gK8Fzb8s3LxtNo6OW/xbArG8Hrh+EONcb9ZQVqcKGDMzM3pA0kZT43qgYh8WPewvFn+XjBTWQhaAgfsFyAS/+P3cUWfToOUxdwfpz7yHb0KSVszgTCYC7XQ0aJ2IDCSZ2DYNGCmQSRJMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U4BEdvSY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54991C4CEE4;
	Sun, 26 Jan 2025 14:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737903236;
	bh=+t9llDFbFMn1jJgQFqrQ3k8YWYbBMvG0OVWpHSWc8Q0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U4BEdvSY9q3Eodj9jcMFVmPvaOst6kWrQBS2Uqj2d3p+5PRgyDMUyZyLS7jJjmfWv
	 q6TQlwtWTzcJda5tjGNRPy8RwS9jBVx6vwrb+ugV2TopRc2ToL7oFXaRCIvpjjKVbM
	 a0el1z/Xh2QgzIg9sgtB/3rwl7TvqBCG2wE/tA05tmewqkwZOx131x76nfo91EqnzH
	 etFNom90/1/PKeDBuF+eDrgS1Q9A/jWJLFMkKdlNjPw1QO3xthBGawpPUPhVQddFI/
	 eO88gFpH8NPyIf+/lJd+A16AWHX+n7ctYU1poaN+ZDXx1K6Q8dRHlPInNZDU9Jbxau
	 ijeWFljouPS+w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Xiangxu Yin <quic_xiangxuy@quicinc.com>,
	Sasha Levin <sashal@kernel.org>,
	robdclark@gmail.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.13 13/34] drm/msm/dpu: filter out too wide modes if no 3dmux is present
Date: Sun, 26 Jan 2025 09:52:49 -0500
Message-Id: <20250126145310.926311-13-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250126145310.926311-1-sashal@kernel.org>
References: <20250126145310.926311-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.13
Content-Transfer-Encoding: 8bit

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

[ Upstream commit dbc7bb1a93f41c533fe31ddc97bdf777d7a61faa ]

On chipsets such as QCS615, there is no 3dmux present. In such
a case, a layer exceeding the max_mixer_width cannot be split,
hence cannot be supported.

Filter out the modes which exceed the max_mixer_width when there
is no 3dmux present. Also, add a check in the dpu_crtc_atomic_check()
to return failure for such modes.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Tested-by: Xiangxu Yin <quic_xiangxuy@quicinc.com> # QCS615
Patchwork: https://patchwork.freedesktop.org/patch/627974/
Link: https://lore.kernel.org/r/20241209-no_3dmux-v3-1-48aaa555b0d3@quicinc.com
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 9f6ffd344693e..ad3462476a143 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -732,6 +732,13 @@ static int _dpu_crtc_check_and_setup_lm_bounds(struct drm_crtc *crtc,
 	struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
 	int i;
 
+	/* if we cannot merge 2 LMs (no 3d mux) better to fail earlier
+	 * before even checking the width after the split
+	 */
+	if (!dpu_kms->catalog->caps->has_3d_merge &&
+	    adj_mode->hdisplay > dpu_kms->catalog->caps->max_mixer_width)
+		return -E2BIG;
+
 	for (i = 0; i < cstate->num_mixers; i++) {
 		struct drm_rect *r = &cstate->lm_bounds[i];
 		r->x1 = crtc_split_width * i;
@@ -1251,6 +1258,12 @@ static enum drm_mode_status dpu_crtc_mode_valid(struct drm_crtc *crtc,
 {
 	struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
 
+	/* if there is no 3d_mux block we cannot merge LMs so we cannot
+	 * split the large layer into 2 LMs, filter out such modes
+	 */
+	if (!dpu_kms->catalog->caps->has_3d_merge &&
+	    mode->hdisplay > dpu_kms->catalog->caps->max_mixer_width)
+		return MODE_BAD_HVALUE;
 	/*
 	 * max crtc width is equal to the max mixer width * 2 and max height is 4K
 	 */
-- 
2.39.5


