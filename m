Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 288F82C0448
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Nov 2020 12:26:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728857AbgKWLTm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Nov 2020 06:19:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728902AbgKWLTm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Nov 2020 06:19:42 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3817C061A4E
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2020 03:19:40 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id s8so18164718wrw.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2020 03:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OGha5UqBCWjGaqYLvn2kA/udGvrTgy+sHOhNO6DMwsQ=;
        b=gXkkTC6H+UFH08yhkRlrTq+ECpl9TiCBAhPbhU1Q2wglsVlLTa7TPBuExVxAQA+h1+
         buZgV1RE8zABspnufkBcR4QQvKnj1G39ZzRDpntI1skmsADHbqKcCs0xQQSrvF9O11el
         +dicnKLrz/VtnwMKPy/RF4b/NX53AvADtyAFRPtpuMRz1itliQVhtIax7NvzUYFgIgQJ
         hXyHUjHhambHyfU4mO4EYKKuAN0OFVZ2CHu5tv5tX62CaSc3lJ7FCcdmepmd7iUXXDzZ
         4cAnhemtLxIkDj9trzA8Tws0sJ85sJhQiQ9/kY9zBiw0KrWj8EpIjTDvsA2LEKfuKcEW
         P3iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OGha5UqBCWjGaqYLvn2kA/udGvrTgy+sHOhNO6DMwsQ=;
        b=IfPczHrnsDoTfmuearpTNDM9fRvKM/ovKgePITh1MYfScn/hs5//nUAetCejnu41jV
         ouwfG2XdSk6UIKchh32psCTMvdNNVLelRa2YG1ZsqZR3QBsol9otsL/Mtr73c/KZwlOT
         Un+GN/m4yyeGt1Ikw662b1UtxkgFCvZT+Q55MFzhnMkFcaiwCV+CKPazq/5j/RHvAFb5
         W2kS3rayKuPJEJrCXDuZ/rX4zyQ7RA0tMbAtgV+JZolOMiDyyWP4lg64yYIHvZKUM5gs
         eYFx/B6ydvii0kXRiUEC+5Co/aZzeL7+wLIlNGvxAxTFAmX9m62hMb9F7m0aZHJx62rq
         1vPQ==
X-Gm-Message-State: AOAM5317jQg1HYY8oAopQRS9iQhqBVB32BoNi7KoHCa2RJEiZsgAyw3A
        +fkaBB/lqgGDT6VJnPF6+r2Ykg==
X-Google-Smtp-Source: ABdhPJyV3tUNuLJgBT0X66FnuJfX13+uUiwhFMU2TsTA5vLgX4suC6ag1MBZQ//yuv6h1ps/wdxJfg==
X-Received: by 2002:a5d:6805:: with SMTP id w5mr5882581wru.266.1606130379551;
        Mon, 23 Nov 2020 03:19:39 -0800 (PST)
Received: from dell.default ([91.110.221.218])
        by smtp.gmail.com with ESMTPSA id n9sm16317290wmd.4.2020.11.23.03.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 03:19:38 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 13/40] drm/msm/disp/dpu1/dpu_hw_catalog: Remove duplicated initialisation of 'max_linewidth'
Date:   Mon, 23 Nov 2020 11:18:52 +0000
Message-Id: <20201123111919.233376-14-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201123111919.233376-1-lee.jones@linaro.org>
References: <20201123111919.233376-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c:124:19: warning: initialized field overwritten [-Woverride-init]
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c:124:19: note: (near initialization for ‘sm8250_dpu_caps.max_linewidth’)

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 6a6a7172e3beb..a7004f18523b0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -113,7 +113,6 @@ static const struct dpu_caps sm8150_dpu_caps = {
 static const struct dpu_caps sm8250_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
-	.max_linewidth = 4096,
 	.qseed_type = DPU_SSPP_SCALER_QSEED3, /* TODO: qseed3 lite */
 	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
 	.ubwc_version = DPU_HW_UBWC_VER_40,
-- 
2.25.1

