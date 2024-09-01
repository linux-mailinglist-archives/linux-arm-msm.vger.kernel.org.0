Return-Path: <linux-arm-msm+bounces-30356-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 176B29676E0
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Sep 2024 15:58:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B45A81F21598
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Sep 2024 13:58:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 868EC17CA1B;
	Sun,  1 Sep 2024 13:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="POd3zqZH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1C323776;
	Sun,  1 Sep 2024 13:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725199115; cv=none; b=d8ga+ASSdjfDt0Nv5ZhunJfXyOU7Vbm7URguEVSdDlw09jR7EPoGpNGnMjm8AjLVX9EsjHIa7/X0Fu3RZsuzAdDzYgxwYAtlRB+JifAfUAOka/+xivFC7C65PyfK0ijeTqGTJnAo2GkUyMWE8ZkpLJTHKFUZ9AbxXDksbAk0sJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725199115; c=relaxed/simple;
	bh=snn4m/zasEEhcc7exBGazglhiLuUySVTjszGGgcH1SY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G0P4LvGIwZiaz4GlEkeqTXpQEA6OfV+5xTlqvo4hHUrv50cYxhfqdmrAx4xfKti/47iLeuSf0hXBnCUOOd0+iVsUhx0ufM6HI1ahy3hBj/JYO8ADNasDlprfAz+3OKMyBeMgPeshpbKRQghjAotZBM1DOU8EcpfBS/sawdw0WlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=POd3zqZH; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5333b2fbedaso5787648e87.0;
        Sun, 01 Sep 2024 06:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725199112; x=1725803912; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+eCXOU2o0WyaxUOWiQryFOZ2WSRKqjV/d0DGCFko1Bo=;
        b=POd3zqZH7Unzaq21QxJkMyOzFqwv6QqYF8W6qkilFqyjnk23Q9Pe4gU0pTPumLm2Ow
         AKn/LxATcBHLROEYmxsT3M8yG+BrWIXLc2gtvqGFbmVz2xcvDnti74CtY7Xo6PwqKwJi
         nCrTn4L9SppZPkcpEEjTOOLxloka2KPP4WzKgbQlsQX5foYFL6iO8Q5ISakQ7GsivQiJ
         u8YWmC+bSmIGCovfA2T0ZQ39shrLUDVGlYs0nurHA5D9/uB6ZNgn3skz3ng4Suc6bOkb
         p+aXmYu7ZH6X+DdEHcJC6FCahdNhVj5D4m/f7c9aEZeMVGOt8UJf1QR1hc6nmew5w/8J
         2ADw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725199112; x=1725803912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+eCXOU2o0WyaxUOWiQryFOZ2WSRKqjV/d0DGCFko1Bo=;
        b=VtaK7VVBPflU4yS0HwsqCvRkxA8e/y09NDc6AAdSnMqov6O25AilV3IhPqO1koo0zJ
         ehKt9+tna53R/9KQRAsF0tOW6IvrBfApRIgratjpLL/bpmI4TRkbwxy0OlyX+w4jBBrP
         W1wLr2/xo71No5PH39FrM7XAs/Snv0fTbtL1XMy6A6O2WTw3sGcKepGF69heV/D9JMCL
         x6CC8x3XnUVRgNwYwofCZhi9ZSXQeMU129eJtsnLP0gNRDzHzM6xmIE8rCfoPL9ma6W9
         hOe2BDvB0PzbqeruwjQ8hmwHxhCRGM/cZAOO8EnNfLZOr1s2VQYiPjyEEboMSwBGgsI/
         Wv2A==
X-Forwarded-Encrypted: i=1; AJvYcCVnQATY/DlwN/H4OGTZbzD8Fye+Xej0aDiIqvg2BxJsodSGR8l70UPORiwOSMsrxnxrL488cQCrfZdT+cwM@vger.kernel.org, AJvYcCX8DE9lJOU1NFjnkRWSjtFefTUgqBNhvtwTDo5MWW3qwLIajfPC8iWuLznsUZkeSwRuU6sl3Bj6FkYC0CVp@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3OlbkNy6Mux/TsJgn6EXou6ZZSFaBXWJ/ewxaprQKO8Kwy1zK
	QMEhsVY705WKuiuyV5cd+w9gcho6NMO0bh9IgpUrG5cPQpDL1jt2
X-Google-Smtp-Source: AGHT+IEhJhR+EGTz9SVuSnRPn3GWsNoA7zhQ8yY5bQFJ0WhnpllSB30EbmSSaMGVYnNQTqlr8qSSfg==
X-Received: by 2002:a2e:851:0:b0:2ee:7a71:6e3b with SMTP id 38308e7fff4ca-2f61e05d76fmr44960571fa.27.1725199111104;
        Sun, 01 Sep 2024 06:58:31 -0700 (PDT)
Received: from localhost.localdomain (public-nat-01.vpngate.v4.open.ad.jp. [219.100.37.233])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c226ccff17sm4051295a12.73.2024.09.01.06.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Sep 2024 06:58:30 -0700 (PDT)
From: Vladimir Lypak <vladimir.lypak@gmail.com>
To: Vladimir Lypak <vladimir.lypak@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Jordan Crouse <jordan@cosmicpenguin.net>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] drm/msm/a5xx: disable preemption in submits by default
Date: Sun,  1 Sep 2024 13:54:00 +0000
Message-ID: <20240901135419.1075412-2-vladimir.lypak@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240901135419.1075412-1-vladimir.lypak@gmail.com>
References: <20240901135419.1075412-1-vladimir.lypak@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fine grain preemption (switching from/to points within submits)
requires extra handling in command stream of those submits, especially
when rendering with tiling (using GMEM). However this handling is
missing at this point in mesa (and always was). For this reason we get
random GPU faults and hangs if more than one priority level is used
because local preemption is enabled prior to executing command stream
from submit.
With that said it was ahead of time to enable local preemption by
default considering the fact that even on downstream kernel it is only
enabled if requested via UAPI.

Fixes: a7a4c19c36de ("drm/msm/a5xx: fix setting of the CP_PREEMPT_ENABLE_LOCAL register")
Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index c0b5373e90d7..6c80d3003966 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -150,9 +150,13 @@ static void a5xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	OUT_PKT7(ring, CP_SET_PROTECTED_MODE, 1);
 	OUT_RING(ring, 1);
 
-	/* Enable local preemption for finegrain preemption */
+	/*
+	 * Disable local preemption by default because it requires
+	 * user-space to be aware of it and provide additional handling
+	 * to restore rendering state or do various flushes on switch.
+	 */
 	OUT_PKT7(ring, CP_PREEMPT_ENABLE_LOCAL, 1);
-	OUT_RING(ring, 0x1);
+	OUT_RING(ring, 0x0);
 
 	/* Allow CP_CONTEXT_SWITCH_YIELD packets in the IB2 */
 	OUT_PKT7(ring, CP_YIELD_ENABLE, 1);
-- 
2.46.0


