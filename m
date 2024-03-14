Return-Path: <linux-arm-msm+bounces-14060-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B17C87B5A1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 01:02:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34A2C283F8B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 00:02:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A4886110;
	Thu, 14 Mar 2024 00:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G8qsFdjh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22252CA9
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Mar 2024 00:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710374551; cv=none; b=hF88/zIZ1M/DLC+N0eOWCjgQ5u6tU1gNnTy0hfULgTCVTzXjzyOpErvXHmb0DqEOSlx1BmQ72lAYftLh6BFO/nZPpABHjXJmkpc5jDQgCcwWKKZ1FBS9CQcVLS0zfm/Gb6MohI7T8BzO5/LYtE0FPGlmj5y5TB0ZfmyGzRVeTYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710374551; c=relaxed/simple;
	bh=6ZwnFtVdtOactYP4jjDN2vjwZ76xsNeJ2fEShISJGW0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QB4ZTCJKLA+e6FrdqblNkaUzKlFpyUY0HkcAVxZnEkkGD4OYFqqAE6AUIAnWh7zXytRa8gpM57ncl/hWJRmQG8XqAYknRCTGmc3Uol9LyhXp6h1R8RxdSLsI2nUAVA6DboWLxdq+23u+nSRIBJd1Nxm+bgkqx/z/2Qy04iVbd5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G8qsFdjh; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-513c847c24dso616724e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Mar 2024 17:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710374548; x=1710979348; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2GfLHKk51yokbHFsUy9rW9NS1Ye+I79+zYu8xgq0djI=;
        b=G8qsFdjhE+3zXnCCflb+kaZBZk32sCelgK97HkajsFAeiFb1kZdz8xIluZ/Mwz0XOM
         OsVy9m7wktbrCrjai2joYNKZq4+8D11+/F46LW+ZVqbk8c20w0R6dsge5a8v8VkxGAZE
         Dmqq9M5avuxTwdfP3/fYr5tGNq4VD9J52cVXPSBVcBV/RnBJS1fdlvBwCZZ7/69sdPP+
         F/BkVkxIrHTB0kmWmtjruxnSyJZ9Qh9vHEfOTHXJ4ojvyz/U245eXz9r/vQkPCWUxKtI
         TEnC8ly2TRPR2sgaudtwmXaWuPecG+I7BydoQSOPikk0O7M9AIbVI5WwyWQiLIe88OX4
         iFiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710374548; x=1710979348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2GfLHKk51yokbHFsUy9rW9NS1Ye+I79+zYu8xgq0djI=;
        b=Uxp42/4haqhK/niJYMr4xAyC5SQw6IzqRILXsmCl/Yco+j7OA1aCaKnFOW7dnqGZry
         1TE2LI7IsvRc+jS4qC3mnldwP0g15sOfPBGp4YqCFaXbIkE5uSOhmblY1OG61/Uq/lhP
         xniLsqZuIHf+ZoOHCDOEjSVjEnq3CZsZou1mPCMgyjEbpzHITeG70Opl+btR8wkQEPNF
         MMVqCDOXV+efsTbbrMEh8EdTzz4ttClf1bRSCkgO+eo4lv7yMk0f8pnmAESfk8JUEuYi
         /D9RyIoqrmM888y4BhGPgHOL4mX6T8V0wPDvt3R5NehDQkYx0LjUe6swfXKgvB+ziK4Z
         luvg==
X-Forwarded-Encrypted: i=1; AJvYcCXfYafDaPfZDCmNRv68BQ0LCvnnbsb4+O/XB65I59iYT1eju7zVD2051mMZvFL/mSyUcszUABnjjaiRhDxseTvdbgiruH3IFrmxIsiXOQ==
X-Gm-Message-State: AOJu0YxnjJ6znnD/qpIc0C3q16UStT4NFOox+7r3oyGLaMREpZJkTB8m
	ZFcMOGh6ReGyL69kH4B1jVMmqblZtkV95qtUDsopJSz9Hwoy9HEoykgHGD55nZMWu8umIYF+1cF
	B
X-Google-Smtp-Source: AGHT+IG9l6RhjTY3xnURjv28dBhN0Wrft+Gt8dYaSXwfs+xcisrHiNLdYNeZ8YPsIqGLHokWYXweCQ==
X-Received: by 2002:a19:ad02:0:b0:513:1385:c943 with SMTP id t2-20020a19ad02000000b005131385c943mr41947lfc.40.1710374547993;
        Wed, 13 Mar 2024 17:02:27 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x5-20020a19e005000000b00513360ebd22sm46111lfg.118.2024.03.13.17.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 17:02:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>
Cc: Stephen Boyd <swboyd@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH v4 11/13] drm/msm/dpu: create additional virtual planes
Date: Thu, 14 Mar 2024 02:02:14 +0200
Message-Id: <20240314000216.392549-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240314000216.392549-1-dmitry.baryshkov@linaro.org>
References: <20240314000216.392549-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since we have enabled sharing of SSPP blocks between two planes, it is
now possible to use twice as much planes as there are hardware SSPP
blocks. Create additional overlay planes.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index becdd98f3c40..feb4d3bae0cf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -790,6 +790,18 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 			primary_planes[primary_planes_idx++] = plane;
 	}
 
+	if (dpu_use_virtual_planes) {
+		for (i = 0; i < catalog->sspp_count; i++) {
+			plane = dpu_plane_init_virtual(dev, DRM_PLANE_TYPE_OVERLAY,
+						       (1UL << max_crtc_count) - 1);
+			if (IS_ERR(plane)) {
+				DPU_ERROR("dpu_plane_init failed\n");
+				ret = PTR_ERR(plane);
+				return ret;
+			}
+		}
+	}
+
 	max_crtc_count = min(max_crtc_count, primary_planes_idx);
 
 	/* Create one CRTC per encoder */
-- 
2.39.2


