Return-Path: <linux-arm-msm+bounces-47269-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B32A2DA81
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2025 04:21:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D498165C48
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2025 03:21:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AE23243365;
	Sun,  9 Feb 2025 03:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LO1gCDhR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4934E6FB0
	for <linux-arm-msm@vger.kernel.org>; Sun,  9 Feb 2025 03:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739071302; cv=none; b=GOc34p2xd0SzFYgzXb/r04qZ+bStDoXw2DI5RC4KwcKLD05ufMsLdctvoDSzdi09eE5BoVNbPeZ9FtBNHGZYGnPTuTJW5R4gysCO/0LpHTTytUpW5ZgjQ78WclV5z2sRedpyt7gDNJdK7SpFLivODlWQ0xTcvF/M+IBq05W8VhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739071302; c=relaxed/simple;
	bh=nDUhilGfCQVAayq/I/z8Ob2cdZRV9/FaOC6Z8D7SAY0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VtZLNo7ACIyNqoTmm8ARK/dKF5E4Zrj6gJpt/sjPn42GsdOJkAZMpES/d4EVFJzew0e25G1c/CCq0yyG78riJIjQ4cCxUKjcSbLb3QoaZza5es+PGYH8eUH9G/H0I6S6tMEH/ujxoLU3eiKxNHpfFbI2m4+xftqHDXRhLp+XcMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LO1gCDhR; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54506b54268so586801e87.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Feb 2025 19:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739071298; x=1739676098; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qmShZr8BhGzfSJcqwOvmipr0+7sVDw+FI8erW52dlqE=;
        b=LO1gCDhRH7YJ8FMDwks52GQ5vvQ3DGGWr4gzMoKaBnMK4WNOWM6odW3EAR+pi+U0Lo
         2dHW77l9zRMax1yMdmU38fHZfKGPa22OMaI3E9UyCn/6aM97Z5UQfdxBh3fg+jotFrAM
         xKGigCZxUSBXgPzZeHkx/qmwGiUTkIp1Y9JncMj0KspM2xe2we/anF8j3ArDdmZ7l6Qz
         vo70zH/DpGKNSdqxEAxQ3NVhhL7FpUOYHrCsMml9sP0uTnQvQ1y8HEfF5bsplHWrq+5H
         iEAqaQSHam6zGys4uGalpeqiGQSUlHcy6x9mj3SmvwMp9fUu+lGQjSIRhF1X2yEfwp+9
         QOFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739071298; x=1739676098;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qmShZr8BhGzfSJcqwOvmipr0+7sVDw+FI8erW52dlqE=;
        b=PAP4B8jUh5gVE0r272/3Muih9vR6A6BQI4lCRFLtrdCTUZSNA9WEVmR2iuE2+AhKXe
         ttHNJORgUw7TvoXTpkLgALq9IvSU4+srUaUKjaQlPac1SUoI9Gq7x83Htc2WnwSHAJ6P
         o+n73EbkM/wueGzxnwAWlrwHTWlffD2Am03Qt9QCDnBouoZz4C/FW42YQBX1A06+f475
         wSVdvidx5q3p4QPJ7iSuFkGaM/0mj7K+4F0XDMCaqen5ovZPefsupGVh71X46cTU4lv6
         EkLSJaMB76ygLjCK//QKzRvIHyxiOXYtl+U2rJ+SXcLbxTnf+2jBGeRnmg5ltDtyXCyC
         s4Iw==
X-Gm-Message-State: AOJu0YzgJbTy702qWyATaf371GyMe0KUhLDjH8A6cMuYay6py1Eq55ef
	INX5MR6anS43eqCp1irzoVFpZrKKqKCX1cpYkbtYJrE27BqFxCGFJbGov3Gb1dI=
X-Gm-Gg: ASbGncvBr1thNcWwH4qCK/YGsf93l1ifm+jnDn+nqu0BByQc3H/musxFCSzaT72o8IB
	bknsWuvtnF19USCjS9PwAwmYD70HLgPXp7vJgrZVPWqCUApxTbLS83QdIs8oxSNhupXOUjt1c4E
	ExnHI1o3w7RsfoK+DqBxnDuLx0FbJcXEMLKKOwCHhkJtwF1qhqTvqkYfrtCcCMA0NUea9uOLXM9
	no3ruaNg8UEA1SgDzuxfGXxvb++JMIT/4wS8hSY52zd8Yh8Xj6DLwOXyVRU9jxJfN7Ks8Vby4JN
	7C13C31XElU0X+NXiUx8uik=
X-Google-Smtp-Source: AGHT+IF+E2lofGpgEIlH1mo2jb7pOLChFh1RWXSwjjqDj1osaZa4t5hh1hH4/w7xYOZqateCgBxL3Q==
X-Received: by 2002:a05:6512:4024:b0:545:746:f36a with SMTP id 2adb3069b0e04-5450746f4a1mr738996e87.34.1739071298414;
        Sat, 08 Feb 2025 19:21:38 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54505e41c63sm279711e87.148.2025.02.08.19.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 19:21:37 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 09 Feb 2025 05:21:16 +0200
Subject: [PATCH v5 6/8] drm/msm/dpu: rename average bandwidth-related
 debugfs files
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250209-dpu-perf-rework-v5-6-87e936cf3004@linaro.org>
References: <20250209-dpu-perf-rework-v5-0-87e936cf3004@linaro.org>
In-Reply-To: <20250209-dpu-perf-rework-v5-0-87e936cf3004@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Stephen Boyd <swboyd@chromium.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1348;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=nDUhilGfCQVAayq/I/z8Ob2cdZRV9/FaOC6Z8D7SAY0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnqB8x3OR7Ca1tuaLoz9sFjn4we4MgkSO2z5FnP
 v5kDn4TMNCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ6gfMQAKCRCLPIo+Aiko
 1W+JB/9MmL89omNtMkNihdFHUoYIcD93L5lMfDfuVIPuV/sswg2iy/9vE58JLWzYG5w/pQGu0ee
 K1qTLql81r8nyGAF6gP+0Oyp9dk8aJZ7pfMpiZ3nb7HL7Eie8BnCidkr1KZ608reycOrZ4k4ZYJ
 MxkHUpbKLoQRDrcat0MC1KnCZKsmfwXBRSlKMe4zLiX+iHjAI3aBZkt6y1yCOmk5n8ezKP1lpa5
 Ex4fy5+9faQp4jPANUlrrAuDx9O0oRmQvqP85f9hIStcT9HS2KraU90mdEXO++17X8DBoLv9Rgt
 /UdE+Ts0hddoUh/+PAJnw+drsVJCzibrYiARky1igeyQH/bG
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Rename the debugfs files to match their purpose and the patter provided
by other bandwidth and clock-related files:

threshold_high -> max_core_ab
threshold_low -> low_core_ab

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
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


