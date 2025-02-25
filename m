Return-Path: <linux-arm-msm+bounces-49223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE8BA43630
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 08:30:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F6581682F9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 07:30:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C83FD1DB15B;
	Tue, 25 Feb 2025 07:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YeLtH51u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBBF612DD8A
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 07:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740468634; cv=none; b=nCO1hX9huhE7jBSQR9UtEQ0kMT5gnPM7wDCLOoRtfja81244YcptX9DC2os21nqcoRxQUydCKPgZL5y8nWAiNm0SnUglCEzd+2KUeIb6vAVgoQG+VWTem6FCMZSuWc/4jvncwG3y2VCayS1zUqkv4IyJCGWr34tzXjMOg6c6pLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740468634; c=relaxed/simple;
	bh=lLY/y7/44+oHF/HGys9GOAGZNYPIN8tsHz48KOcoOlA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X0gZPnvM+UVz29bYAUUERJLoOPuzwIW9GF+LyIa1aQEWryX1H/1ELUe9/6A3Bt59bbrLuUEXGSwNehOQI5dgFJyd2veDd4te+V/WZDsTXG3l3Vm06STTGJNV4R7aMFxfd8hpxJ5GlgB5sZR1M9GEHc0i0An8eNDqmPraIAbGB1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YeLtH51u; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5ded51d31f1so9334377a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Feb 2025 23:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740468631; x=1741073431; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TfuM5g5b1bzsFznJjaGXX66+r8znKzFeJVWgK6VGC58=;
        b=YeLtH51uj2ZMwpsbrjGousjmJApJDXWareRt2wehq5iJM8azmSSebwmFhbJuwAmxbn
         xMH/gK3mnTSpJJIFtxqcIIOlxBCIMTcDLpH5XJcEXz3tl2l+QlJgnH29PWvIdZW923E9
         /0ZWy1q2fZRjCkBiCF93nW2rjZ6KWoXWweVq5U8iESuDiXBOVhhQp3YkBcD7nQjoONJ/
         eb/JxOpYogOLipxHKpboNqF8BUrpFbHpvn1t1APitjY17D34nQGVlEWBNKKMErLg0LjN
         3t0PnyENuKcaxRZcK4mx7hbhl3cFWCxemgOzghErkN9A9RZMLOz4t0Ex0YBBptbseZU+
         pcqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740468631; x=1741073431;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TfuM5g5b1bzsFznJjaGXX66+r8znKzFeJVWgK6VGC58=;
        b=FPWs4owNw0XDC5tzM7C0mGJywxzg1P5b4oh3skOSIJeKi3VktRDxh27nXpH9ETF0CQ
         c2hScL9+EpRWHHE7rw4EXnhWeEVweulpVq7ewdyyk8kgp2BQ67lUBppgszdYBb96yP1x
         oFFuNDQO/5uyks/YYsVvd5Ko6jq7OwFrg5Od4Muxe5aGNvgQewS/BfObo5qxwezvQKdS
         p5Bmub3mS/yv4aJqvJTHnfARC4ELV6D+tZAEopd1s91JFqJK+pjMs2+GnXtjSjwlIZ/o
         rK+KnaxDr1bVrApJPcqEyhq4ulwtAyRCTSF2jCyuFOBbsIbYLiCt+MeF0A9w7J3QhwmK
         +PIA==
X-Forwarded-Encrypted: i=1; AJvYcCUhkYHSyWOnf9AUDkewWkgHwIvn75HOdRNjZ4KY9PtYn3UmR4yyO5c1X2ste0Vfk9mZ5g1Aetn3Iv5mUMDm@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2aLeWl6N0wb/zjSs4ZdKllO7iViK+9iaWxyqzTToZ07Ix1PBu
	HnvTDteBLXQ/4xiXHuI8miUipwEjHnAflJVLMil9/cS/NsxgsFwPAQ9+gP/NnFE=
X-Gm-Gg: ASbGncvNgC7S2uUQeaa+uxcJJvlpuW2YeOhlB2ulDDV2tYseqdzo0tZvE0ai19/JKtu
	JPrs3nVMm7F+3+bNLxfpKrM88cTvQsm0VLcpx84Vxe8TSdfyJ0XVaZQHv62fCAIGOT/EKcmcLU5
	bm28b/JmnbyrdYSjFGpM3Pv52K9aylJUuo3yDsECGQC2WmUHVX9zNC+9z9GYr8HPNtQwjJN9nsn
	Z0bWAkUUHtbVHUoJLefTSCOQHY1KZ5ta6qaoUTIJBoVJi6ZPVwd3BK+IJB1wi3eyLGioFdGDEUw
	2qdQy8WRG5x3asSGpX/0ljElBP0zK3s=
X-Google-Smtp-Source: AGHT+IF1jD1nIi0UqQ/yrLSB611MTk3aZB/2hvtf9cDDpXVP93eDIhNTWNWnPWPNHZu27Gv83YTAhQ==
X-Received: by 2002:a05:6402:27c8:b0:5e0:8261:ebb2 with SMTP id 4fb4d7f45d1cf-5e0b70d6598mr16065265a12.12.1740468631260;
        Mon, 24 Feb 2025 23:30:31 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5e461f3e7f8sm788694a12.69.2025.02.24.23.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 23:30:30 -0800 (PST)
Date: Tue, 25 Feb 2025 10:30:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/msm/dpu: fix error pointer dereference in
 msm_kms_init_aspace()
Message-ID: <3221e88c-3351-42e6-aeb1-69f4f014b509@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

If msm_gem_address_space_create() fails, then return right away.
Otherwise it leads to a Oops when we dereference "aspace" on the next
line.

Fixes: 2d215d440faa ("drm/msm: register a fault handler for display mmu faults")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/msm/msm_kms.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index b877278888e6..35d5397e73b4 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -209,6 +209,7 @@ struct msm_gem_address_space *msm_kms_init_aspace(struct drm_device *dev)
 	if (IS_ERR(aspace)) {
 		dev_err(mdp_dev, "aspace create, error %pe\n", aspace);
 		mmu->funcs->destroy(mmu);
+		return aspace;
 	}
 
 	msm_mmu_set_fault_handler(aspace->mmu, kms, msm_kms_fault_handler);
-- 
2.47.2


