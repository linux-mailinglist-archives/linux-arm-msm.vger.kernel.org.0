Return-Path: <linux-arm-msm+bounces-11573-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D13A859477
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Feb 2024 05:12:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E66391F21642
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Feb 2024 04:12:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B111B1848;
	Sun, 18 Feb 2024 04:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VtyXVumL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01321849
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 Feb 2024 04:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708229530; cv=none; b=nq2BA0f0vbbC6sBWYiIsqXeNj9wSsvnm+/AMjZPx2IwdBA/D62iJov0VwUbDGsmSr/WOm0mou2tTfY1FjBhx5LiGPx+11ep3nKutL1mPhRSIYydczeJyFYh8gC0Ts8mf09JWwwQgu0kRRX3+cWmbHxfprIPBkUnHdK8V9lfTRXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708229530; c=relaxed/simple;
	bh=vjUJue7xROlC1JndRWiUtpQ9ldV/7Ab8n/lSyQaWuxo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FeeANAaOU1wso1R/J6KM4FUZOenu0NTDuUJgZVD98LbWwyzNA/bxVr0jFDJ6a2H7Rdgur+3cOP1TXI1V/YjDOZiu/mhWhUgXF4M8hlIWSngJmfGkLHoJaZq1IwxbV60eud3Bz8iC+qq40SboQhXFEF0gNFCX9zL7vN5HHhgxSkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VtyXVumL; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-512b0c26dd2so90562e87.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Feb 2024 20:12:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708229527; x=1708834327; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sdq9YGtFPuh68clN/bcMQ3lDJoxtvUngfBuWNMv8NJE=;
        b=VtyXVumLU9riDtKAyh2cWMC6/iC9SLg/zq+sRgydWONudr7lgXZ6CU/2SmKQUZLsnd
         4BMHVZ81ssB5FYrbQZmIJjMk22/knFaAO08NAFmKQGg7t5Ucha7kWxCKFOo+9DW2lTjQ
         42k21mpJUxEYUTO43JO39fzWa2DCNAB+X2L52ppfzmh8H5XeP7iYRg8/CTW3kQVt3DvK
         Xn7WexplABzan8eSWG+/azVB8nU0x5qRNaqYdcN15YZo3q3ZoTefXhwv8fVxxlOZhF47
         1Vfc2PBt+pxY9QDPcdM11JbM3t5FXNfEb3hpKAKBjvQzUiqtta/SVLHrqvhj/zGI2OPd
         kl6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708229527; x=1708834327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sdq9YGtFPuh68clN/bcMQ3lDJoxtvUngfBuWNMv8NJE=;
        b=lVrjr4VZhl6bHFEXClTrrUpg0RG5LXdpI3RiAJ15UQGGuPcFfr8LxKmRd3vMVYAxHp
         BF2ml0u3nmueJ6cVRakjnUE93RuTs/Ic9uUbpeidIFm7erzszjBG6vk21xhPXFQoFWjj
         ZT/hVKdUoXTfvR0K1ZVatJeUrW+8A8PocATuaWZLtC4DZAC7iOiBbx4LsASF4Bp6Y3Ql
         TV0z33hD4xqs6LCaIgTynZQMIVcfbG1kSIkQGQgbL+62tS5VBExkmuWkce8gWkvOXZSo
         cWULrRWG79w/OhgDih/WjO8yCvJbz1QNCsRBlXyNhpCV2TP4KlZnNxVTpikHh+SplMDx
         tOMA==
X-Forwarded-Encrypted: i=1; AJvYcCUjqW+5+ulj2AFd/vy4exUf0DfljAzhlXV+j0qebz+mFyEQGwiVjH/4WxsiG6IBezhxWEnle9gVo66w+ip155eslGoiuNrlxnUCp9Uy4g==
X-Gm-Message-State: AOJu0Yy/EZl8/i2MSKZIIoBI3XANHQo6Kw1pV+ktJSvi8GJWdtrSVW30
	SWLhaWWW3EYJPfkAsRIRQyuXW52P/MScGHhi89+uzVuwze8H9t7zL8p76QGHgF8=
X-Google-Smtp-Source: AGHT+IHWACc/nvXkq0IaBi9yO1yC2cB8MAQZ7sAlzDgSUDta5J5/mnwtHC6aNnUFZMaP7xvgm7RRoA==
X-Received: by 2002:a05:6512:214f:b0:512:b09d:3bc4 with SMTP id s15-20020a056512214f00b00512b09d3bc4mr118922lfr.3.1708229526935;
        Sat, 17 Feb 2024 20:12:06 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id e20-20020ac25474000000b00511aad978dfsm436606lfn.121.2024.02.17.20.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Feb 2024 20:12:06 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Helen Koike <helen.koike@collabora.com>
Cc: Stephen Boyd <swboyd@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH 3/3] drm/ci: mark universal-plane-sanity as failing on SC7180
Date: Sun, 18 Feb 2024 06:12:04 +0200
Message-Id: <20240218041204.2522828-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240218041204.2522828-1-dmitry.baryshkov@linaro.org>
References: <20240218041204.2522828-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The test kms_universal_plane@universal-plane-sanity fails on both SC7180
platforms. The drm/msm returns -ERANGE as it can not handle passet
scaling range, however the test is not ready to handle that. Mark the
test as failing until it is fixed.

ERROR - Igt error: (kms_universal_plane:1554) CRITICAL: Test assertion failure function sanity_test_pipe, file ../tests/kms_universal_plane.c:438:
ERROR - Igt error: (kms_universal_plane:1554) CRITICAL: Failed assertion: drmModeSetPlane(data->drm_fd, primary->drm_plane->plane_id, output->config.crtc->crtc_id, test.oversized_fb.fb_id, 0, 0, 0, mode->hdisplay + 100, mode->vdisplay + 100, IGT_FIXED(0,0), IGT_FIXED(0,0), IGT_FIXED(mode->hdisplay,0), IGT_FIXED(mode->vdisplay,0)) == expect
ERROR - Igt error: (kms_universal_plane:1554) CRITICAL: Last errno: 34, Numerical result out of range

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt    | 1 +
 .../drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt    | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
index 7e4d8744fcc6..f0576aa629e8 100644
--- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
@@ -15,3 +15,4 @@ kms_plane_alpha_blend@alpha-7efc,Fail
 kms_plane_alpha_blend@coverage-7efc,Fail
 kms_plane_alpha_blend@coverage-vs-premult-vs-constant,Fail
 kms_rmfb@close-fd,Fail
+kms_universal_plane@universal-plane-sanity,Fail
diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
index 7e4d8744fcc6..f0576aa629e8 100644
--- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
@@ -15,3 +15,4 @@ kms_plane_alpha_blend@alpha-7efc,Fail
 kms_plane_alpha_blend@coverage-7efc,Fail
 kms_plane_alpha_blend@coverage-vs-premult-vs-constant,Fail
 kms_rmfb@close-fd,Fail
+kms_universal_plane@universal-plane-sanity,Fail
-- 
2.39.2


