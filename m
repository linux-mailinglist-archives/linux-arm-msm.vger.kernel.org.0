Return-Path: <linux-arm-msm+bounces-40868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2619E80DF
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Dec 2024 17:19:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F3A911884473
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Dec 2024 16:19:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4351E194A54;
	Sat,  7 Dec 2024 16:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PX3Qiv2k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CEB619415D;
	Sat,  7 Dec 2024 16:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733588281; cv=none; b=codpMjmrHGGVIl3ka4BjGMFs8Qd+FCDn0Gfv58qaT72yRXiMNyHpjmIeInzf4D951CVfMzbu1LV8oR2nKMkHP0gK/Rtn/TZm9LG4l9zdb8UuaWrrkpeWGvpBg4nXr3S0kQogyWNyY2HJWKiFRHNv1qdpO57Y2mRKsqbfiRjXER0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733588281; c=relaxed/simple;
	bh=4B0DyawciV/rkEoO74tCAkZydTyIMiAEsxbicM8zZ3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J4D8ERHPPF4KCqYO5Fk58AKC5bitTP5XICz6fMladjppxPlmIWrSOr9ob/G5b6faV81E7Ne3p0LrOtRQI1aEXsAuFTN/mXLvOXRzN9EekuuN8yqybU+okXWV5uyltlzSWRlTfPdl705EFn/xEi7tdlnpxZZACLYBSGiYkP/Zz/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PX3Qiv2k; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7251331e756so3323858b3a.3;
        Sat, 07 Dec 2024 08:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733588279; x=1734193079; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W8+aynnXkT2Tv8509cM1dO0nO9C5LPhaKj9kzwLt5iA=;
        b=PX3Qiv2kgCDnE7lJ6KrY3JeZYwXMXJ7mn5p+WOhifGyrDBsiMDf9p2TfxcW7wER7x3
         IRs2hSbdfGV7XOgMLvfA2kUdbYjfPYtV44T06vvMezL1S0sNPvUR6oaDVmkuNkMx+l8C
         VYC34YD3THVDNIEKr8kF/tqUnEmwqCqRcyt8AMiB6vU4TqUIZXqfqHp437eDRS3Px1lj
         t+jXU9CBJMFR3p4MFB8xCoyL/yZJI6GW5RoWzf+K9AuUg9QU9M7cRzAUq6J/wv07tF3u
         Dl5LALm0Rr5hBQdN+LqGo7NElcGHjuAvbup+v6Mx0qnMC/gDH5UyIC+IgYeNw+f4qfrU
         FVbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733588279; x=1734193079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W8+aynnXkT2Tv8509cM1dO0nO9C5LPhaKj9kzwLt5iA=;
        b=DZmSy6TpoiLlgJIeVaiuPLpiEQQqlQkYJSlqt8g+PvblHw+6vfaUN2PRAeWtHeOLxg
         vmk4zInAnk6tfqPT76Uu8vDZD3mJiFrBVhfuLwrptvghv249JJFQIaaYXQs3PpuNHqn+
         qI2+x8LXWVlnBTIwTbMB74VuYj1giwpRvhQso8l37pIUx2QcP9LgcXotvWSmmCuQD3K1
         fPWTEIiMXxu3yHGvY/9LoowvQG/Km+khKoaqyLf+8rn0rHK9ttXOZjn3aPy9tNbjbNZM
         dyE51E8WzbW1BOiQXDHlG4U4IVp2mc+o+dAb0mmQqNRqTEF0UuuKdD7/mv6vdhjI7/zP
         2Xbw==
X-Forwarded-Encrypted: i=1; AJvYcCVffyTzqV2PuEq5o42QiEXSTSbRxmttj40AcmriavssI6HM3S/P7Mj6pfViRw/lagNAxeSwRoBpj5hlglCW@vger.kernel.org, AJvYcCWIxrUfebojUSHTMipztp5ie5bYX5ILOGQxe0BoGzhA/DLGinS1OTy2UZJEokkhXy+kMQLGxBSaCP2sq8Gx@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/WOTvctV/mYusJ9HZkX8oxQPUtHJV8kffQjxyXVCkBa3tBPXT
	DFmpsGh193AHo/7js38lGOlKmpL2/ci9hlUSBcHmAXbp2qg13TsJ
X-Gm-Gg: ASbGncvpQ9zFDA6zxrs5Ck6y6Q1poDgX4WTaUD9ivLA9N+mgHCbHoLvZABxnXdmSPa6
	DaPHPXOuwGE7Jp6v0dERqSDx85B6RH7/3KDAWejlLYYm1WrRNAPYG+nHVYNTnAGJ+cm1p40MEXw
	FlB5ApkQIpn4HgMOtElUEAHqVp1Gv6CkD92xQyqUc44BDCkrzMh7paWqHkg9C4CT0AxFgcO+xH0
	E9WeYDVSXCOYVkW3hmHCGOJPfOPx4emXBqQQ+QPM/4Iwcs4nOLoAuL9ULDa9NAEVWGgNeB7RlDE
	GJOVsggz
X-Google-Smtp-Source: AGHT+IHIjdGL/dpBA/1X2A/Uf+yw41v8np6MWGp4a+GqznIPYiIdC8DVSHtSkopR6oq532/kgOxirA==
X-Received: by 2002:a05:6a20:7348:b0:1e0:e000:ca60 with SMTP id adf61e73a8af0-1e18712303amr11457387637.28.1733588278791;
        Sat, 07 Dec 2024 08:17:58 -0800 (PST)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725deb60815sm391621b3a.109.2024.12.07.08.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2024 08:17:58 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Connor Abbott <cwabbott0@gmail.com>,
	Akhil P Oommen <quic_akhilpo@quicinc.com>,
	Rob Clark <robdclark@chromium.org>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org (open list)
Subject: [RFC 12/24] drm/msm: Split submit_pin_objects()
Date: Sat,  7 Dec 2024 08:15:12 -0800
Message-ID: <20241207161651.410556-13-robdclark@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241207161651.410556-1-robdclark@gmail.com>
References: <20241207161651.410556-1-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

For VM_BIND, in the first step, we just want to get the backing pages,
but defer creating the vma until the map/unmap/ops are evaluated.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 8a4f4c403404..51c92fe1146f 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -292,12 +292,16 @@ static int submit_fence_sync(struct msm_gem_submit *submit)
 	return ret;
 }
 
-static int submit_pin_objects(struct msm_gem_submit *submit)
+static int submit_pin_vmas(struct msm_gem_submit *submit)
 {
-	struct msm_drm_private *priv = submit->dev->dev_private;
-	int i, ret = 0;
+	int ret = 0;
 
-	for (i = 0; i < submit->nr_bos; i++) {
+	/*
+	 * First loop, before holding the LRU lock, avoids holding the
+	 * LRU lock while calling msm_gem_pin_vma_locked (which could
+	 * trigger get_pages())
+	 */
+	for (int i = 0; i < submit->nr_bos; i++) {
 		struct drm_gem_object *obj = submit->bos[i].obj;
 		struct drm_gpuva *vma;
 
@@ -315,6 +319,13 @@ static int submit_pin_objects(struct msm_gem_submit *submit)
 		submit->bos[i].iova = vma->va.addr;
 	}
 
+	return ret;
+}
+
+static void submit_pin_objects(struct msm_gem_submit *submit)
+{
+	struct msm_drm_private *priv = submit->dev->dev_private;
+
 	/*
 	 * A second loop while holding the LRU lock (a) avoids acquiring/dropping
 	 * the LRU lock for each individual bo, while (b) avoiding holding the
@@ -323,14 +334,12 @@ static int submit_pin_objects(struct msm_gem_submit *submit)
 	 * could trigger deadlock with the shrinker).
 	 */
 	mutex_lock(&priv->lru.lock);
-	for (i = 0; i < submit->nr_bos; i++) {
+	for (int i = 0; i < submit->nr_bos; i++) {
 		msm_gem_pin_obj_locked(submit->bos[i].obj);
 	}
 	mutex_unlock(&priv->lru.lock);
 
 	submit->bos_pinned = true;
-
-	return ret;
 }
 
 static void submit_unpin_objects(struct msm_gem_submit *submit)
@@ -760,10 +769,12 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 			goto out;
 	}
 
-	ret = submit_pin_objects(submit);
+	ret = submit_pin_vmas(submit);
 	if (ret)
 		goto out;
 
+	submit_pin_objects(submit);
+
 	for (i = 0; i < args->nr_cmds; i++) {
 		struct drm_gem_object *obj;
 		uint64_t iova;
-- 
2.47.1


