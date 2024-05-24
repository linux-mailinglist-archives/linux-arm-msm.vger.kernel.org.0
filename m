Return-Path: <linux-arm-msm+bounces-20404-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F388CE780
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 17:05:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3E3081C213C0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 15:05:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA09D12CD9D;
	Fri, 24 May 2024 15:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=classfun.cn header.i=@classfun.cn header.b="BG3SH4f9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from classfun.cn (unknown [129.204.178.38])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7629948CCC;
	Fri, 24 May 2024 15:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.204.178.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716563114; cv=none; b=sCWoagOq3UbBnpuF+DjUxlxOMgXlmT1BubQvoB0VGMZLvGD8uuAJrcKvwmW10ftxdcB2SgXgoaAGYPvRcjjAj9yBJzJWOyZVyiA2OvujSVx8EFYdxuf+cD8dbA/Y66pF5y4i3IzrXAAc8heXzUJjv+6MAEJLhabuxKEbzQnGPl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716563114; c=relaxed/simple;
	bh=W2qwYe5lYoI206gE8u1Jt6VhgkTCXZUz+nZbdVJdKmY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ajB1Q3+1eEkTFAr4fATrSQioslc5laiMo5nsZiE2GOXWPHplAAP0c3uY4jI/gljMOqmSUcMVJZBfCaA4J2GngEYJOaOqcnMKaODx7cNYB2TSwLVC7HBpuzc9El1iC/0WWB1H/pz8orJrQIgUWiF7s2JLiiZis2aBJFWtRywM81g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=classfun.cn; spf=pass smtp.mailfrom=classfun.cn; dkim=pass (1024-bit key) header.d=classfun.cn header.i=@classfun.cn header.b=BG3SH4f9; arc=none smtp.client-ip=129.204.178.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=classfun.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=classfun.cn
Received: from bigfoot-server-arm-node1.classfun.cn (unknown [124.72.161.66])
	(Authenticated sender: bigfoot)
	by classfun.cn (Postfix) with ESMTPSA id 2C6E27884E;
	Fri, 24 May 2024 23:03:01 +0800 (CST)
DKIM-Filter: OpenDKIM Filter v2.11.0 classfun.cn 2C6E27884E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=classfun.cn;
	s=default; t=1716562985;
	bh=f1k1hDmw66DJaeViB0/rUpPvjFxDh3qw/IrEdAXHUpQ=;
	h=From:To:Cc:Subject:Date:From;
	b=BG3SH4f9nod7nbps+0gOGya81zfuxAOL8ao1HwcTA9DCjBnz5O1R0ZRrqOw6kcgLQ
	 BOnIZpETXOt4bDdqHXFElXuPNHbS8e5os6VgThwLlghfQCY+BoPDx5UIw1bZcMsFYf
	 FZWm56Lc74R/rgWJd5HFJukCuYufoW28FdyNbjjU=
From: Junhao Xie <bigfoot@classfun.cn>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Ryan McCann <quic_rmccann@quicinc.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jonathan Marek <jonathan@marek.ca>
Cc: Junhao Xie <bigfoot@classfun.cn>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm/dpu: drop duplicate drm formats from wb2_formats arrays
Date: Fri, 24 May 2024 23:01:12 +0800
Message-ID: <20240524150128.1878297-2-bigfoot@classfun.cn>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are duplicate items in wb2_formats_rgb and wb2_formats_rgb_yuv,
which cause weston assertions failed.

weston: libweston/drm-formats.c:131: weston_drm_format_array_add_format:
Assertion `!weston_drm_format_array_find_format(formats, format)' failed.

Signed-off-by: Junhao Xie <bigfoot@classfun.cn>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 47fd8baf53e6..3138e73c04f1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -216,12 +216,9 @@ static const u32 wb2_formats_rgb[] = {
 	DRM_FORMAT_RGBA4444,
 	DRM_FORMAT_RGBX4444,
 	DRM_FORMAT_XRGB4444,
-	DRM_FORMAT_BGR565,
 	DRM_FORMAT_BGR888,
-	DRM_FORMAT_ABGR8888,
 	DRM_FORMAT_BGRA8888,
 	DRM_FORMAT_BGRX8888,
-	DRM_FORMAT_XBGR8888,
 	DRM_FORMAT_ABGR1555,
 	DRM_FORMAT_BGRA5551,
 	DRM_FORMAT_XBGR1555,
@@ -250,12 +247,9 @@ static const u32 wb2_formats_rgb_yuv[] = {
 	DRM_FORMAT_RGBA4444,
 	DRM_FORMAT_RGBX4444,
 	DRM_FORMAT_XRGB4444,
-	DRM_FORMAT_BGR565,
 	DRM_FORMAT_BGR888,
-	DRM_FORMAT_ABGR8888,
 	DRM_FORMAT_BGRA8888,
 	DRM_FORMAT_BGRX8888,
-	DRM_FORMAT_XBGR8888,
 	DRM_FORMAT_ABGR1555,
 	DRM_FORMAT_BGRA5551,
 	DRM_FORMAT_XBGR1555,
-- 
2.44.0


