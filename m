Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAA6070A406
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 May 2023 02:28:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230174AbjETA2x (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 May 2023 20:28:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230149AbjETA2w (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 May 2023 20:28:52 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CC1E107
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 May 2023 17:28:50 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2af24ee004dso14988521fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 May 2023 17:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684542528; x=1687134528;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bMGr9P2blyZdtx0k6MOAZO/VRNZnIFqyOTcs7i1nXs8=;
        b=wdiUtVE6Y2b7iJii03kWFsDYFv51sLiZSgfvaOApTOkHUhxH887H4uv599Av/l0CFl
         okZ6kDXVPDDXGD9lCKlYzo44K6IDW2EC/oPQG8Ubt/uTbdpiXVEp3Jp57zuexAdUwjub
         ZoPAfxqFmRjnYnfgg5UJOM0CxjY+g3+pgfJaFcZO7cj16F0D1Ag5RYBvKgTSBFtyQvdd
         6vxv1yT04Mqb/1XXVRtKTP1xtsPsFDqjGHp5ZOzgWd+QWgr1V/aCBewkBo1WeskjXGys
         +hwBgdK9TW1ne794ZVRkvq+C/CFkAuxTpPbQj08DS168nHL9z8kwjEC6SqS+iiC8nHb8
         aaCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684542528; x=1687134528;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bMGr9P2blyZdtx0k6MOAZO/VRNZnIFqyOTcs7i1nXs8=;
        b=V4hDHGYVDVEbugcZuXdrrVhz5qjp1nfcP+P6fj7Bil7c91aCWc5wL7aik8QrIrTu+K
         yfQiTenBTlCUvEp0x+OPlkx5w1/l0EpGl1ObsNwEIEfV7/lEiDbfJ8itN9TvFhCZN4nT
         uD5jlRqSeqSZxt+Hzix9/nAzLf6fsFco/5l7LLXcrzanASUGllhw/hdnat4RBRJPa97c
         hSujW0x6SI2g/k4OOtWLAYJ1XIXLpNxNgCOze4Oqk2mZvvdCkk9Y9hmE5SSVQEvXbbLS
         aftWawIB6/xc8+hoHvz0vU9MtdxO8EjBws+YnH3JgcVp+yagrOgRcB6ysYXzD2yaHreY
         c1Qw==
X-Gm-Message-State: AC+VfDzmuJuJo5fo4LKAgxMochMqCR+T5+OvjrCH6KonEDGlXMfW8QFT
        4AMFWCd9RWQGs5z87z0rm/ezfg==
X-Google-Smtp-Source: ACHHUZ4qfx+S+98U1ygfBKqYAiEhEsclkUhCrZDXTfp6bJSfZIpVw0g/Rn6k8VUtAkuZd0BPNpDa6A==
X-Received: by 2002:a2e:8695:0:b0:298:ad8e:e65 with SMTP id l21-20020a2e8695000000b00298ad8e0e65mr1348947lji.21.1684542528285;
        Fri, 19 May 2023 17:28:48 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id l14-20020a2e99ce000000b0029c96178425sm60950ljj.19.2023.05.19.17.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 17:28:47 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 1/2] drm/msm/dsi: remove extra call to dsi_get_pclk_rate()
Date:   Sat, 20 May 2023 03:28:45 +0300
Message-Id: <20230520002846.2870546-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In dsi_calc_clk_rate_v2() there is no need to call dsi_get_pclk_rate().
This functions has just been called and it's result is stored at
msm_host->pixel_clk_rate. Use this variable directly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 961689a255c4..2b257b459974 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -633,7 +633,7 @@ int dsi_calc_clk_rate_v2(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 
 	dsi_calc_pclk(msm_host, is_bonded_dsi);
 
-	pclk_bpp = (u64)dsi_get_pclk_rate(msm_host->mode, is_bonded_dsi) * bpp;
+	pclk_bpp = (u64)msm_host->pixel_clk_rate * bpp;
 	do_div(pclk_bpp, 8);
 	msm_host->src_clk_rate = pclk_bpp;
 
-- 
2.39.2

