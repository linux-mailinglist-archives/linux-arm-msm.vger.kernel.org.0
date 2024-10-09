Return-Path: <linux-arm-msm+bounces-33650-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A846996411
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 10:54:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 633FA1C23FA3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 08:54:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8064C1922FD;
	Wed,  9 Oct 2024 08:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cRTHj0ks"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0881922F4
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Oct 2024 08:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728463886; cv=none; b=FTTmJyWAV0OfbFGr9s7DxUtaUC/uXSy+xxqsMv3kGehR8O5BqLiezYNrA3sADq8FlJma3weOGwGEFtwym79aWGhb3OpMnEKno7Txdhm7PEuuQo5ye582hTEB+fvcOUBIWaifCdJicpn53S6kTFyL/lTiJEPlmR4GHwS+2CIOT44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728463886; c=relaxed/simple;
	bh=GMo45gPySZjy72Hc4Yw7xEv8zW3cyCFzGsnKJn8DLoY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pY00i4nGPghi26kQxmdr3zNcQYFWB+++i2L6MzDhJafjBV660al6jUP8nqHWiYNWT5fj+LD+lJsZDbP0jBMcrrxTaoBa+DXHaEx3fYKQcByEjOZGubRPnDKg6/OSCQsZl7C9T7tjzkfwjnjZa7GBSEKqzalYm4ZiZ3UeI8P897w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cRTHj0ks; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-7db90a28cf6so474957a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Oct 2024 01:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728463884; x=1729068684; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F3RVtVtcWQ38kTkihMst8OMHNbsHVAelds2Db2o3IYo=;
        b=cRTHj0ksWijCyqPtamOvnuG8m5HFGjNvAgThSr321LoY/nNVdGTZZZq7cKBYRZo6P+
         AtMOWyVMUNrd2TP+zBcWq9To4RARz2G6p1Gc2b9v4LnnDoX8Xk3Iy8MXgqNsVkrB2pje
         Lwsdbo6DO9y24znRe6zw2+fmshFU4djlIo6/yE6v3WkLd3laQmxVtlPe66HzGaGb6y5c
         53+SwPuqab7T8lngWaPrunV7XM4G8WHCFg8ssr4ImCyZyVKoHyzPDQ+U6zfnCXnlJnis
         wm28FBHUrI68Z7QX4Gs+xdnXHK4NDzJq+Z2QaAaTBhFck/KQEDftHbbexgJvLcZ4tFOw
         TOEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728463884; x=1729068684;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F3RVtVtcWQ38kTkihMst8OMHNbsHVAelds2Db2o3IYo=;
        b=K826UzoloCXQh12etyvwriFl2NcvNSy7q84iQtxg629w7EfjfzLHKodOtT0mTxUITl
         YbQocE56sKYfZza50brkU7tkoxbiG/3k98wtdUtOtiQIH9H/woBsV82xhaynkqTfMfsD
         JHulKcU8IerzwdASobDzy+xseeRg6speX8gKfEB3Wpt/hdRzReFaXW06DeaycaHR82Ih
         ySM0jHoQqx5mwhWDWB46+XNl4RsOjtI85PLvEGmH5JfylJtHL5iSnNp5h23L3nHljs2I
         v/3rdbOBdRf7G1i8tfP257S8g2mQURft26+6bGZyiCSBbAMvq7ADkHZLti2/z1iexb7k
         BXUw==
X-Gm-Message-State: AOJu0YwkdyT5Es5trTn/j4v3PWUTfDBz0kclT+uOZKUofQk4H5S5eXew
	pAqmP937VDKESDZJjCozOvCIp4pp4TTive07D6UPI/gcJjNzt7vKm7D3MWrQ1OI=
X-Google-Smtp-Source: AGHT+IHvpp82pkdvaPTIW66VfEKItG5LVqsQe3Zkoe6/T3/uxKCH9ZD03Stms/drz+eJxsVEGQyKiA==
X-Received: by 2002:a17:90b:fd7:b0:2e2:91aa:e683 with SMTP id 98e67ed59e1d1-2e2a084ca8amr2758796a91.13.1728463884302;
        Wed, 09 Oct 2024 01:51:24 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.217])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e2abad236esm898157a91.10.2024.10.09.01.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 01:51:24 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 09 Oct 2024 16:50:24 +0800
Subject: [PATCH v2 11/14] drm/msm/dpu: Share SSPP info for multi-rect case
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-11-76d4f5d413bf@linaro.org>
References: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org>
In-Reply-To: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728463820; l=1040;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=GMo45gPySZjy72Hc4Yw7xEv8zW3cyCFzGsnKJn8DLoY=;
 b=S5CivVtMEYLewBJNoQ4eLfAA051Szb5Ae40kwyuCmurPDIxSr7oJL65CcW9kP+NnxKrfSzSw/
 R6CxNMzFZddCCXWtYFQwLsGDsthBKAZQ35QcxpcHqcQtfuGd6WUQh18
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

Share SSPP info for multi-rect case if virtual plane is not enabled.
Otherwise, the 2nd half of DMA content is not displayed due to sspp
pointer of r_pipe is null.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 904ebec1c8a18..898fc2937954e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1042,6 +1042,11 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 		pipe->multirect_index = DPU_SSPP_RECT_0;
 		pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
 
+		/*
+		 * Signifies that r_pipe is to be used if the width of the 2nd
+		 * pipe is not 0. This does not apply to virtual plane case.
+		 */
+		r_pipe->sspp = pipe->sspp;
 		r_pipe->multirect_index = DPU_SSPP_RECT_1;
 		r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
 	}

-- 
2.34.1


