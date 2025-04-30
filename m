Return-Path: <linux-arm-msm+bounces-56278-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C33AA4CC0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 15:09:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 55F231BA4483
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 13:05:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10295269CED;
	Wed, 30 Apr 2025 13:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SdGc+vcW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191EC2686AD
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 13:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746018095; cv=none; b=qkgzKhHtwqJmw23WuS1cVMOke+yTRYsRDUUbkf1/HXAIbNa05FwZgmXuUoGl4ZxGeU/NkiTvOWPnT0xhWvycNX5y+/qV2nET9ndwNIfmriJRpuq8phURQc2kMLrDdkKyo2pTTiXQ/rKdlwOjLy6GUGUL1BHRvrazhy3/x68O0NU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746018095; c=relaxed/simple;
	bh=EgQvRIwsoBEOkUVe8WeaPf0nvrRgE3ViQnu5z4RaG84=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UrxHqLVTGgU6Jwzo8lomyXl+Jk9CBJs5zi23QewT80x0Z1xto1SvhvgjgLAuEOqjRsRY33f6bkLjVur664xiFHo+eRyIw3be3Zg9lQ8N5PftYO+WGLRT/6lPYzGyW/9PhPDo2B9utIjREW8s0WyeXJZIFY6069YnjJorSUqZeMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SdGc+vcW; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3912387cf48so244479f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 06:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746018091; x=1746622891; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6W8PiSICnArGlEy5suIco/UFspl13NFPEnygazXjjlY=;
        b=SdGc+vcW0MZVX8ENjnSweftBI7r7E391i5IebAC+A+8NlMzxhWF8WUv/JGwyb62P6F
         mj46RWedS8r/vGGUFj9g2qSli2TPEzcouJNHKIB78t4aYCe0/2DUgytxT1+wSbbqvSvE
         LHGyasHrOFkC9dwUTKZrUYJZ331T6L/cFUgpboeQu+2Vt1cf12MdIwAH/u6L14RHPXrn
         yIf8NmFg+bG+wdOTU8a7yo3Qo4CaMNvGw9eeW63AuUKZJnzz1YkvGvXVDZag8aK6ThqC
         Ar9COXjjtMxGvgDGquDLl7wG59ATs1mJNkXHDFgdxXjnHv8uNb8rTj5ed5wvED4QIJ0p
         LVjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746018091; x=1746622891;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6W8PiSICnArGlEy5suIco/UFspl13NFPEnygazXjjlY=;
        b=Kaohz8hqD6d3QSaVk64VPfZagIl/W6bUwdwj1hdEDszlViImPJzSbH8OIQXadkrHFl
         /RLECyiOqZxI/SXEk0I0NF8RrgYm4mmomvmVgZluQ07PSbHJuts57SwIeZvr3QJ/PWlt
         EWjmpClWvOfUhMdFaHkpaBD/q1S4s4kK8iCJZ3+rNtUNyyfh4kII4EAxhf503NaHP2ED
         OsUK0TnjFJgzZwr5a6Vw0M5HSetvC7PI+FqegiN5r4mXPf7+9Jm0DryBdDRxl1pZgoF0
         Hyznvt0axiEdrhvPh3ZfnTmMWZyDDgAwzj6r4F2Zp2Or2UpQBtciD+JI1haR21tNnrgS
         HvKA==
X-Gm-Message-State: AOJu0Yy5TVCueeOPQ71T/U6piEUnIxG+BWw3ScXvE7mOHZiaoCBMU6Ph
	2QUviLXJqbFiku2teHzr5f83thu9CXOwHZ+iyV8M09RMzz2lYiKhx1KVfjgJHnY=
X-Gm-Gg: ASbGncsBvmq2nF6875DD1NMfvM2pae4PuylyVz/86POBwq5EnqwwivTj1tcUYgAp9DH
	J7Zwjo9/QKv0oXLMYPZr9JpcKftlwiJhdz01DJ70Pj6Z/bmRqqOL0T0ixiLgxAQKdAAj3tqEma+
	T5JljCfJriV6vOS12+tJ9lXyhBEmL5GiHeUZnR/qHObYk7tVrvEkemxmDU7My0wmTtUrPdMRPcH
	5/gGZK7GHyWaC5gLCMYuM2xHXelj4iCOay9PsKPhD2PBtv309FxLWgim9Yp7T6efy/u+x3dQ5QU
	xkOqp/4jpDh3Ln1XOwE6fb7XgzUl9Q5q7Qexny7NJj0J85WVNxQnhPPhkLM=
X-Google-Smtp-Source: AGHT+IEzCVJSZiNy03fnea/6PddfMije0Ez6+H5H/3q7+6IeMV2wmIColAuFLdNMOykqDCe1ho59RQ==
X-Received: by 2002:a05:6000:2dc3:b0:3a0:7a00:61e9 with SMTP id ffacd0b85a97d-3a08ff35f51mr816355f8f.0.1746018091363;
        Wed, 30 Apr 2025 06:01:31 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e46c23sm16884043f8f.75.2025.04.30.06.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 06:01:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 30 Apr 2025 15:00:41 +0200
Subject: [PATCH v5 11/24] drm/msm/dpu: Drop useless comments
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-b4-sm8750-display-v5-11-8cab30c3e4df@linaro.org>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
In-Reply-To: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1894;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=EgQvRIwsoBEOkUVe8WeaPf0nvrRgE3ViQnu5z4RaG84=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoEh7/hjxULANnZsDBXQ9N4MIbAkaAFea1m4jPi
 E+UFb7/NniJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBIe/wAKCRDBN2bmhouD
 1w72D/49TEEa+O1HXIvMk8OwZyiFgnoDx2yoNXTIZm8QQFkLIQxNbY1WHWkL6uu/mqeglbwGJ/N
 K7XZjzF5yIY+UuBv0lHDqbU1HYoXoJlQhQjkL7/PC95TiF9JxhizGNa0DPvS2DfVIoEVJAwZwZX
 LZQjyTeUPP4K5hD47QA1+Z5mq9+FuuyRna3P2I04PREAfWCJ7XKpE5aREGGvjL6YH178pdUdK6c
 8MdFYwjGYIDNnUdh1g5ouNoRJg2wLpOvTQXx3TfPoC9Y934tngeSHhhKiXyLo12hcd9x6bcNW1c
 +nXr08JZYQjE8yyEbxVspdObll9D/qoj192GAytqqplPK8LWYvJzxmP9zuXfAVCkduPooy0fzx5
 vQByLDEsyWU28Z0+m6Kp0ov+ozQnu7pTZfsTjl0/dbi1WsGam1FWGxGhrddBUDiyug4eAKMjEba
 c3BhvLd9pgNJXy5i6AUoF5hP9tfYbjd12FUGlg8CY3dLZxLDk1W7vA0ve8IO+QSuiEr4ZJ3SA6j
 NVBaR/FTwWi1ATtoR7KPs6gbVupFmCjRp/oB1UfFrzjDpaxNx1lIJpup6L3zM/P+fAD2bciZV3R
 9WW+JZbsiYa80I6x0Gx4PAl6+IYDEL+LZ5JoiRxC2VK74YizWNiWfXfuZ++A7FzfC6QVVVQMG9e
 E1s4mNyiNLcYCjQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Drop comments about SoC before each 'struct dpu_lm_sub_blks' for given
SoC because it's duplicating the actual name of structure.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 2db27c55787791309962acf796d5c49aaf018fc1..a310a5234e99ea4886e82ac2100c4099e6a1841e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -331,8 +331,6 @@ static const struct dpu_sspp_sub_blks dpu_dma_sblk = _DMA_SBLK();
  * MIXER sub blocks config
  *************************************************************/
 
-/* MSM8998 */
-
 static const struct dpu_lm_sub_blks msm8998_lm_sblk = {
 	.maxwidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.maxblendstages = 7, /* excluding base layer */
@@ -342,8 +340,6 @@ static const struct dpu_lm_sub_blks msm8998_lm_sblk = {
 	},
 };
 
-/* SDM845 */
-
 static const struct dpu_lm_sub_blks sdm845_lm_sblk = {
 	.maxwidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.maxblendstages = 11, /* excluding base layer */
@@ -353,8 +349,6 @@ static const struct dpu_lm_sub_blks sdm845_lm_sblk = {
 	},
 };
 
-/* SC7180 */
-
 static const struct dpu_lm_sub_blks sc7180_lm_sblk = {
 	.maxwidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.maxblendstages = 7, /* excluding base layer */
@@ -363,8 +357,6 @@ static const struct dpu_lm_sub_blks sc7180_lm_sblk = {
 	},
 };
 
-/* QCM2290 */
-
 static const struct dpu_lm_sub_blks qcm2290_lm_sblk = {
 	.maxwidth = DEFAULT_DPU_LINE_WIDTH,
 	.maxblendstages = 4, /* excluding base layer */

-- 
2.45.2


