Return-Path: <linux-arm-msm+bounces-43958-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E9992A01E02
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 04:07:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F3E41883F37
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 03:08:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C5AE770E2;
	Mon,  6 Jan 2025 03:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jXfz7ub0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37D43D69
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jan 2025 03:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736132877; cv=none; b=Swk90MAHU6uRYRCmy0nna1R6Rch93SVnKJ8wsp/uHD9+HvKjtngi00nzRh9R3Lp925hBtQGMkrfLPP3qoiCXAj9AAqsicyJAz04w6fgjM3+MC2OSRrFxCtuoGjiaFhQ+aYi089q8zqbfU7KmGz7m8oty2WR7aV/rYOqWJSw0tac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736132877; c=relaxed/simple;
	bh=3GO6BKanzbIFpcGY1492/FnGV+oGzdC81viLdgF4XKU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iMpTQXzMdcFjGQmJEykAqyvXNgubEwYraBKkYY+hCwaSmaP9TWYMmr93vqeT0wbA7ajVSXrkm2SWHmIhfMb4pnFPW04GCY8eEF9n3DA+Mve1Al9zSmglyTqBxCJLOYZjITvlQo0QS+NwstNujLk4YTyYu2wwYhMryiEfbADAD30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jXfz7ub0; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5401be44b58so14896687e87.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jan 2025 19:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736132874; x=1736737674; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d59Z3qrLfT2qIqzs5o3r/0E9tuM8fjfJdM+IihJasEc=;
        b=jXfz7ub08447LxCYSwdJcNwzI3L+ku3NwvVNHK6v9RnbOqcQsbhR/Yugyx3LKPXaGX
         K2T/jgtzUjoFuuk2VevlnhXDRTTUYLpojjp6RJXdlR0r0a123DdQVuKgZ8GzgPDvAj6Y
         HvGlE6ymgnmZoc2GXl9N1YUVYlcu5n8SWwpYy0nhWbmay6PgkNlc5gJZ6M1+ikU+0LHe
         RhXWG67KHrTrPI5D6joQ9GBwb5g/zLtuXKBCdDGFCrbxJTjyrcyaqnVe3t17/TAMDS8h
         Y1/LgQj2SW5o5ymUXUyDKk8aZat0uugHZ/YgfwMhxMnPcOO97cJXNGcYwKCi0bURHqT9
         ns0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736132874; x=1736737674;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d59Z3qrLfT2qIqzs5o3r/0E9tuM8fjfJdM+IihJasEc=;
        b=V2rusLapQVpe163/dnS2uQ01DwxAtJClwJwWg30pAzSqvQoGIEjN1mJN0u5Hk0cjYx
         xlebhfhBYwLaUQaBMjBoB/FaixoI1BCmpLhea0wdg+TyG38v2j1cFT4YjUzzijDflRFE
         rwe9XukfBWbecSC9hXyeKJItTtSfSqRohDEFhCfakpo1RxlsJ38E/s8g5JVN3SjtxAn0
         S/L2jegJPMF8uhgfuRWqra1I/UDVsAIlK1ZUgm6O3/6fgltokaH0Ur+gF6YMr6qFegTF
         xWBwhRbObQxTlLj2q8suXiDerxv28vt8J4u8GZ3CM1k7iViPsfzXDbt5ZbHuOVe/TdGG
         G8sg==
X-Gm-Message-State: AOJu0Yzc/c+R9PLNuIbHD1622vPsAxgMqZRympXn7NVcdZpNYz6p5LJr
	dbuXaYZawRSB/dghSnI2h5S7JXv86E5jXdSx0OwbN+sVNI/WzqP7st+XjcFfSLM=
X-Gm-Gg: ASbGncvn8eT1bkL2DGRNlcfVl2ZuzU8fAheR1cCNDxVIt29PPr0eZTdtCEh+PwOXevQ
	2VN4FmGbL12HH0RznwWVqEHkqPF0o3zyGP2iHtrdez0R10gxJLNbaSDk59xa5DC0eghKeW8jo1O
	eY3SHvlhRxIQs19xgUyymm6D37nuaqn7b4F6reLhh62pEVpNtGJvUsGATGGDoiur9uX3JZ+BbpN
	pxCwaFVmEuPI91C0u+mrtm+410LXZcYbGYzbxGhyyCjvDFqDUABno7eJhVw1EXG
X-Google-Smtp-Source: AGHT+IFKzrJdZbp0VnGmVQddnrS76dcPqx2IOwskz9x2OymOvb0Kcx3KnUojFYk6Yq6nsT7bEn53Og==
X-Received: by 2002:a05:6512:3d22:b0:540:1fcd:1d8a with SMTP id 2adb3069b0e04-5422957afa2mr15539769e87.55.1736132873732;
        Sun, 05 Jan 2025 19:07:53 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542238301efsm4869016e87.247.2025.01.05.19.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 19:07:52 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 06 Jan 2025 05:07:40 +0200
Subject: [PATCH v4 6/9] drm/msm/dpu: rename average bandwidth-related
 debugfs files
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250106-dpu-perf-rework-v4-6-00b248349476@linaro.org>
References: <20250106-dpu-perf-rework-v4-0-00b248349476@linaro.org>
In-Reply-To: <20250106-dpu-perf-rework-v4-0-00b248349476@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Stephen Boyd <swboyd@chromium.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1292;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=3GO6BKanzbIFpcGY1492/FnGV+oGzdC81viLdgF4XKU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBne0j5W7DE/CqwnIGp5JjlR3b+5azAW4JhRlYR6
 23i+RdJ8RWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ3tI+QAKCRCLPIo+Aiko
 1YfJB/9R2mnaUTtPtDTK/pDYG4hf85YzZerMGxPbZ/HA9Mx3dw0AQY5dAaa+YHc/xw4zay7CshX
 StUPZEny53hjKaiSUjY1mm/dgtLpiFd2wqFGIoUAyewCCLarWRzzunyexzz/TOa7A3vFRDH0nW2
 omoYghdwkQLSApGVE/Gg2vSrpIL/8MC+H+Jze9O0ujL8e83QLqHF9MSByLxZKJ5fY5/QpyYcsUV
 XpjEeR0KkaWLLZKV9izhb4F9Wbe8P2TUwHgdH8YvaxwxfKSJsa2B/2+8fQXgc5oQ6AnifuDO4Yt
 tvFgPS5AjR+kCokydIdwAROQuzTzNNOtZE0s1uNHCiVatmC+
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Rename the debugfs files to match their purpose and the patter provided
by other bandwidth and clock-related files:

threshold_high -> max_core_ab
threshold_low -> low_core_ab

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index b93f7556f187d46b325a689ad01ec177cecbc37a..70f43e8359caee2082f2ca9944a17a6a20aa3d49 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -464,9 +464,9 @@ int dpu_core_perf_debugfs_init(struct dpu_kms *dpu_kms, struct dentry *parent)
 			&perf->core_clk_rate);
 	debugfs_create_u32("enable_bw_release", 0600, entry,
 			(u32 *)&perf->enable_bw_release);
-	debugfs_create_u32("threshold_low", 0400, entry,
+	debugfs_create_u32("low_core_ab", 0400, entry,
 			(u32 *)&perf->perf_cfg->max_bw_low);
-	debugfs_create_u32("threshold_high", 0400, entry,
+	debugfs_create_u32("max_core_ab", 0400, entry,
 			(u32 *)&perf->perf_cfg->max_bw_high);
 	debugfs_create_u32("min_core_ib", 0400, entry,
 			(u32 *)&perf->perf_cfg->min_core_ib);

-- 
2.39.5


