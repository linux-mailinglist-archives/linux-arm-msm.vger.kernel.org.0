Return-Path: <linux-arm-msm+bounces-51050-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B0641A5CEC0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 20:05:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F15EB16FB94
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 19:05:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EACA266589;
	Tue, 11 Mar 2025 19:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ARFr6HzX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D908C2661B7
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Mar 2025 19:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741719760; cv=none; b=tV8ezTlG70cOdcj+Ne57dU+g4SjTQRheEooLysj5MIeYBRMcpZiMNsKwOol9YEmFDbxZvqhT24XzBVHWFWwoocU1Xalp7LLqrxhXGFGofKD1Rk9vuaeI3N0vkkgGUD4HZd04Z3vsihXInU1TrTYyUdadZAWBaK/bJIJ5laSUTcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741719760; c=relaxed/simple;
	bh=y6bWRccagbxiPugi9lqg3LxI5q7Luq+aGXW341tS1oo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FDuE0dixswCKX5VlG85reLUY2oQ9nJLeTivRsgzcOhipWNYyEYTZKhYXXyXSLtZQ4G5z/3Axpcu35fV8qCdSwhGK0MA4O6+Y1z30Lny+ngaP2oyfxBSzwmLuImSgn2l8PpWYzlNaubemSSLLbcHzhbx1bLJ5506i/BrWPltQGW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ARFr6HzX; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cee550af2so2905115e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Mar 2025 12:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741719756; x=1742324556; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RcjB+241gLR6s1cCQ4uICqRoaXk8v/y0NqsWEvqWvyI=;
        b=ARFr6HzXsHCIcXWFRKSm8L9WA7Y1/gQeepLLeW3Ns5hUp289yI2ChlsKX6ZHKgIhUh
         E9xLpzD2364fNMAdIuVXCxUCjKeZpOT9ThxnNhj/3yafN977cBRuwJNoyceCEeHRzACx
         o9IEWZAYvOBJyQ99dsU2kaITh/rw5bFNQOKSfygK50FxiY9s1XgX3F0dFsNzbTiQPpME
         pN7BU9XZuKv8HJAZQfKeXXAFG05LUdjLieEeCKxb4+mcTq5CCs0R0RfjMPBdxO2VRqza
         U4fsYswhTh0vZsWhC/M8/tFnYrGEuw84AjW2TuaSL7N5g//z2bC6irtQNEbFn/Gbs402
         JrCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741719756; x=1742324556;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RcjB+241gLR6s1cCQ4uICqRoaXk8v/y0NqsWEvqWvyI=;
        b=fqv/xC12A5N4l5EWLUeZV5HMriXnBAwT6aR10nfT4XDiWZfgCkTrUdh2I5cCdp6MWI
         ffyGhfYgeswpUDZweR7/TjCntybcYrvTj9/DyOlahfRi+u40x/788G28sWctiH+PnARK
         uKMKVIdFVDnKKIvhj+vX8kpwkcNnzoqXRY0LLDQv4aGquElh1fQckCua12BLNrBEn4hi
         7dqbAj4FA+pC8m480HQVq2aKJH6sm8QSnPcu8d/suF59jU+C5v+nEuzhX5z/cv+1AH+K
         AniYI3HOTPskanxCqyQF5AW0nvnSp/VPMA9WCpP58ZOSE1DTd7IGoxf8pbcB6chnvSA7
         8E6w==
X-Gm-Message-State: AOJu0Yzrpq/lM8LLdBPV3wEFIZDyt+BqRWmfg8Nm1/F9ieebhRyFcswf
	e81gby2Y0jYqxr1XuOtnPR+kMnM6w3wsdbL7/MFdf1BMphhV3Ecvfl9Y6co740U=
X-Gm-Gg: ASbGncuzuDrpyNvroCq7XK+UTVKNEVdT8mI5RNzFPQBk3Y89VeM9+AAdu227th6e3Iu
	r1ZsMscmUWBu0AXveD2UMFmR2AKru9weLwN8kRxMjjgWStsuQdHQda/i+XVztVmX1Ivbd9d5DUK
	DHp7YQSmHO95WvLaRgJHqhQGdlvc5ae4LYc/1OennEqqqP4Re4qPYk9XMAGRLQ2Gj9MF3XmAZt5
	e+vLZ9tI5A69ZzIUN+PKNqbRqtF3LwxaG86cwXsw6RvxO41skUMSz00re9j8ogn8Wzp9gZzyiZ/
	+TzZSI+R8AKV16w53d/o/tuioMHsxZq7+kEhtxxeD+LwRAUjb68BIKajC48=
X-Google-Smtp-Source: AGHT+IHUI/GfBvqMOBGLfMGJ5oC3n7CH3DWUPWiGMnSbl7+9ajR5P08W9uLIpwe5ervzERP38Emslg==
X-Received: by 2002:a05:600c:198e:b0:439:94f8:fc74 with SMTP id 5b1f17b1804b1-43d01b88b9amr24028355e9.0.1741719756112;
        Tue, 11 Mar 2025 12:02:36 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ce70d13b4sm127681155e9.38.2025.03.11.12.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 12:02:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 11 Mar 2025 20:01:58 +0100
Subject: [PATCH v4 08/19] drm/msm/dpu: Clear CTL_FETCH_PIPE_ACTIVE on
 ctl_path reset
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250311-b4-sm8750-display-v4-8-da6b3e959c76@linaro.org>
References: <20250311-b4-sm8750-display-v4-0-da6b3e959c76@linaro.org>
In-Reply-To: <20250311-b4-sm8750-display-v4-0-da6b3e959c76@linaro.org>
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
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Clark <robdclark@chromium.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1115;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=y6bWRccagbxiPugi9lqg3LxI5q7Luq+aGXW341tS1oo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBn0IirZiMlFxIwx/kR+5CN6LQ3oI+wkm7qHAayp
 hUmAyRP61CJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ9CIqwAKCRDBN2bmhouD
 1wb3EACZNeztGLSxAB1Jrehurx9bUz7y7xVphpXYvou6pmU5jzCVchBQAyL8H06dHtkF/USEAME
 PjWBgSX+pMv+XgZPHpS5LMcwTMbqhq+Wqkr2kcDK6NlJmcs73zqBXrth372YEkRA8o5GCdw8FNC
 Y6sJ4dZlEQ9SsrCrSX2zkKZqtWigfDoA7xT/t5YV+1CBKG8Fl4wT/6PMVqIdxZuuedrh16802jU
 uKsFObCjV7DbADi4TGkM3VobbZ4JNyUC+A5h9cTICYDPo2TZF2RRCazQNXtUnDdy+kahUi6mrnY
 vKBDezawNLxOzN1L2D4YaDKxBjNvULH7GF0kdSe9F+Wnqu/r9GIh/q9aa+7hOwe5ZzjtQA9WOjE
 8vgCEuSTwFpbBYOJoda2m+eLXLAXWyI+aCTnQm1LwFmfv6hoif5uOYEstvl8k/0U9itEvlKDtaB
 jhQBIEe7YH+FzNcofg1WXN14yOITrTbdj7Foz6axPodRVHweRunALci7Bn4pTogy5yOXoiiwrf9
 2eKLxrVAGWwACGfqaePe85ONfxCaDB/aYSKZnu9OKHaOQ78OTswV6BagZKrQ8EE2/yoBgCcnwBi
 GLhNs1AQy9dconnR8Q+137TWMtS49s/SqCp9cPq8azzW002V6nKJS4E91m72uSWWuYevbwpWaeo
 iyggg/4Vc6qXoHg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Resetting entire CTL path should also include resetting active fetch
pipes.

Fixes: e1a950eec256 ("drm/msm/dpu: add reset_intf_cfg operation for dpu_hw_ctl")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Changes in v3:
1. New patch, split from previous big DPU v12.0.
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 951d5dccab6faf34a519d06683514aea1ee6ef60..2ce59ba50ffa0d14eaa07e993fadf0f218390ef1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -667,6 +667,9 @@ static void dpu_hw_ctl_reset_intf_cfg_v1(struct dpu_hw_ctl *ctx,
 
 	dpu_hw_ctl_clear_all_blendstages(ctx);
 
+	if (ctx->ops.set_active_fetch_pipes)
+		ctx->ops.set_active_fetch_pipes(ctx, NULL);
+
 	if (cfg->intf) {
 		intf_active = DPU_REG_READ(c, CTL_INTF_ACTIVE);
 		intf_active &= ~BIT(cfg->intf - INTF_0);

-- 
2.43.0


