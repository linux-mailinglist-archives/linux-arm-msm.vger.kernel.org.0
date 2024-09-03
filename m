Return-Path: <linux-arm-msm+bounces-30447-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9899691F4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 05:23:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A28C31F23965
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 03:23:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14D351CE6F0;
	Tue,  3 Sep 2024 03:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oeMNhGJp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C061CDA2F
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Sep 2024 03:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725333785; cv=none; b=Zpz2GeGjS65YhYKMuqJPKHCBn4fWvSXigGikwQmRWkNs/Jf6/iPlfk7wGfDMqUmd24tDIyvUhOqhdQxdB/tkQ/hnogu18BmIngfmKxBfLArurck7xtL9Nrcowbzw5IVB8tHfGnnkYaLYv67WaSsVnqNDacofSblg7qorFmXMkyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725333785; c=relaxed/simple;
	bh=Fbj8uMqodekZoSHu891oRcXYi7bheHJqE14udy7BZ7c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WdUsuLUC9ZedrFDW8Q4ogyCVF3yRLzQ9jH/anl/9N21SNzzWvX8X9xoChSmPmgljjdNy3CqepCZRsxnFVLdKoCKvKdWIGoYqXZSD2zqPAdpcBCDKvndkeNdaLeFVE7HSDhY/+jD4cb8ynnDHFDeEtIPSzNWgbFSoMc0DNTEgggQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oeMNhGJp; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2f51e5f0656so54060521fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Sep 2024 20:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725333781; x=1725938581; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Uo1WJaoJi5l7x5tFLTltWmiX3GtjP7d94O/uZZbrMc=;
        b=oeMNhGJpQXUDJhdpwrqh+bL2SDtnNcVZ2xCUct4z8bUOtJIpHBRuqDe0eoheTZyP2K
         lTa11hQfW/PCD1uGk8D04a2jKXe7npQLa3o1OKi69dpVEDZUO55BTMtZfXzQ0BY59zFq
         zuCyXdS19adnhq3l8/6Q9r4xanPh6KK2T9eyn8p2iM5w3VhlUMgF2DtaWCH6cZlxBb+5
         ISwyiAa3kC9O59fe4ZvCGAxWcOyVVvgl6Y2eT/goVEqZsFe3foA75J8kZsXIry3r0fRW
         BjYGhHcZuSkHtEy/JlS/O2t6Q+wwQY/aqDmBx2LErSR/LBX5YVSEGzf4utNPNSz2/qsT
         h9Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725333781; x=1725938581;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Uo1WJaoJi5l7x5tFLTltWmiX3GtjP7d94O/uZZbrMc=;
        b=jLxwmqVOke8xRtykTzi8ttINwys0Noba4W52hRhYbf4Kx3xIgl6p/miKsKZJRnZuDR
         BoVXGMbzp7imYEYgnlVqf9atQMTrM7l1Td8rx0KwPC6SqDbbRhCxGQJB6ii6NE2iz0J5
         hpil6v9zEYANVlbg32JlIgayr/O7bOGuHoJg7ZRoXVN0N+WYw+/Gd3prt9yTA7+KkjbA
         Z4AmRaX1udnatckozPbI07+73DBEs9ErjfsDWLVqW5srySlMBRydFwt3deBSjQKT9WZQ
         SQhjkX4p0n6pTn0DajGZFVuSxIVdJd9Q3S5XIUFd/tLegW0jx5mNAt1ndVVXj1oJ640k
         y96w==
X-Forwarded-Encrypted: i=1; AJvYcCXYfwucOqepQkJPpH+EPL6oKUgMVSaRU8XJC7/6Ttf1U93XiP22QJWwKSL/PIOR6RFDP0YIGZDkGeeXpohP@vger.kernel.org
X-Gm-Message-State: AOJu0YzIblnf3SGXbermr9lr9y4HpgaaMCi7uWJcU1bFPQ8i1PkLl/vk
	7EHHIg3UAIT1huLYXe3DlKHzWPgEqVsBrO2FHo7zGlU4pN4ts6KOS9ib3YqqiLE=
X-Google-Smtp-Source: AGHT+IFOljbQ3f4QkvdnlpYaQ9zXmZPHExDy7nUsyA0Aa+cGyuQ/SwxvvjywoyhGAqzKJ1hmCWs14w==
X-Received: by 2002:a2e:80cc:0:b0:2f0:2a55:8c4a with SMTP id 38308e7fff4ca-2f610552deemr85722471fa.49.1725333780606;
        Mon, 02 Sep 2024 20:23:00 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f614ed15a5sm21003961fa.8.2024.09.02.20.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 20:23:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 03 Sep 2024 06:22:52 +0300
Subject: [PATCH v6 09/15] drm/msm/dpu: move pitch check to
 _dpu_format_get_plane_sizes_linear()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240903-dpu-mode-config-width-v6-9-617e1ecc4b7a@linaro.org>
References: <20240903-dpu-mode-config-width-v6-0-617e1ecc4b7a@linaro.org>
In-Reply-To: <20240903-dpu-mode-config-width-v6-0-617e1ecc4b7a@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1833;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Fbj8uMqodekZoSHu891oRcXYi7bheHJqE14udy7BZ7c=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ9q1Rp4n+5Zq7ts1/Yj/6qMdc0Je2d9tX11T3rx57uYgI
 2VpnoNanYzGLAyMXAyyYoosPgUtU2M2JYd92DG1HmYQKxPIFAYuTgGYiOxm9t8sjczprSbVct+i
 hBWdE6r62N7N0vrqVf1UobRExPvP1R3vpfXM2laLVpV9ORQk0hr47+OPTZmBthdC10tf0dK9O1X
 wzkRlq7qdsc2OPhHravN86/wuT/+T9Ji38Lm6vIG4wb18/YfXNobV2Kv5Lvjp+S6wJPXhlkOlU3
 UjOj6Jx2jqOfxmiNmrnpq5b5uKgtbpffcv5+1+L+798au3SCDb8wbrisvz2gIk10qqzzQoTdB3T
 TnxfW/IqRNLqlIrDpUv+6K59nAFd3zBe1m+9hNbHtjKO96QD77g+607q9dbP9Gk7U+I8SX1DCdX
 Pmu10q08uxsSxNxj/i1YbMMQyOFixXdlgdTOB0z2GuYA
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The _dpu_format_get_plane_sizes_linear() already compares pitches of
the framebuffer with the calculated pitches. Move the check to the same
place, demoting DPU_ERROR to DPU_DEBUG to prevent user from spamming the
kernel log.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index df046bc88715..4d17eb88af40 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -229,8 +229,13 @@ static int _dpu_format_get_plane_sizes_linear(
 	 * all the components based on ubwc specifications.
 	 */
 	for (i = 0; i < layout->num_planes && i < DPU_MAX_PLANES; ++i) {
-		if (layout->plane_pitch[i] < fb->pitches[i])
+		if (layout->plane_pitch[i] <= fb->pitches[i]) {
 			layout->plane_pitch[i] = fb->pitches[i];
+		} else {
+			DRM_DEBUG("plane %u expected pitch %u, fb %u\n",
+				  i, layout->plane_pitch[i], fb->pitches[i]);
+			return -EINVAL;
+		}
 	}
 
 	for (i = 0; i < DPU_MAX_PLANES; i++)
@@ -360,15 +365,6 @@ static int _dpu_format_populate_addrs_linear(
 {
 	unsigned int i;
 
-	/* Can now check the pitches given vs pitches expected */
-	for (i = 0; i < layout->num_planes; ++i) {
-		if (layout->plane_pitch[i] > fb->pitches[i]) {
-			DRM_ERROR("plane %u expected pitch %u, fb %u\n",
-				i, layout->plane_pitch[i], fb->pitches[i]);
-			return -EINVAL;
-		}
-	}
-
 	/* Populate addresses for simple formats here */
 	for (i = 0; i < layout->num_planes; ++i) {
 		layout->plane_addr[i] = msm_framebuffer_iova(fb, aspace, i);

-- 
2.39.2


