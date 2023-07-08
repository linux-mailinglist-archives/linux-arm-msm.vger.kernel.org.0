Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D77EA74BAA9
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jul 2023 03:04:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229646AbjGHBEM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jul 2023 21:04:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229582AbjGHBEL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jul 2023 21:04:11 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D34B210C
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jul 2023 18:04:10 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2b703caf344so38219571fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jul 2023 18:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688778249; x=1691370249;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wj7LNm7j8uJ6srVzyDHm7xnSDGTFeyf7qEu/J+OSTyk=;
        b=VzR53hJYdkUKIz0f6Y4HBRN6BwBlIO0nBViJ+QNXHktqVvNlBtgQLuezuTXKpgfAq9
         CzPw/bP/+MSEANGDX0OEprP+hPvsmbRy+EHgGA0HL5o88aEr0pBfJwElePFPRmL3pVmN
         vOqHD+Sb2sEoUtWVFH3srdtwYkw8wGAc/BeBMFk/GltTLM0URw5b89621e6d4v0G8EjH
         43l3X6eRd869S80/c0yvz8hH4s97YCp/NhH7Y3F5265eo0RuDBvsJU8Up+MoEZ3btG3Y
         aweQiA9g90GVOUm4hI0LqIsLgFM1wZ0d0/hXdeYM0H08I62/ZBs/VpkyAhZkjqGjw3J2
         WS0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688778249; x=1691370249;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wj7LNm7j8uJ6srVzyDHm7xnSDGTFeyf7qEu/J+OSTyk=;
        b=ddK+noEv25JBvNgq0aTN7LnSr/k17Ymp8ttNQ7fL5D0AJbr82wcJM5lUoJHFyt/Z9i
         avXNeJSWFYaQOKOAqsoaVSVGqUanKFgMgvglgKeRFSvBb5g0+hVM1NjxWzf9p1nsz1Ma
         JHRf0f5lw7uSxL8H6Wj4MRejjHNvsH3Y99GBd5NNow6a5taGmI8JZegdQi5UcBd1jnXq
         tHFAsBluQMp8pK/dlspSMjsQFX2+se782mR4+6sFwkDBAMT8pa0YqJHFkCoblMNW/GzC
         WTZdWs+gcRDRcez1hFBFSFbYyYjj9BYf4+EkbTzFmQ3Y5jMGnu2/8VhOUpitLSgqU/Q5
         Wv+g==
X-Gm-Message-State: ABy/qLarhBOWY04/+RIBRTaeuFTC9DK/sLXwoHILameDooAd8Fx09dzJ
        1sgbnJScqwTDYDEabxyw90pnIQ==
X-Google-Smtp-Source: APBJJlFxsuuokLyKhRQ1fUfj3a1WJAB0a76r5DhYNKwKNL06bFTd/N+9oYHZdjMagvGn11Grjrub6Q==
X-Received: by 2002:a2e:87c3:0:b0:2b6:bd09:4d64 with SMTP id v3-20020a2e87c3000000b002b6bd094d64mr5007973ljj.34.1688778248725;
        Fri, 07 Jul 2023 18:04:08 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id l5-20020a2e8685000000b002b6ee99fff2sm1012807lji.34.2023.07.07.18.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 18:04:08 -0700 (PDT)
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
Subject: [PATCH 00/17] drm/msm/mdp[45]: use managed memory allocations
Date:   Sat,  8 Jul 2023 04:03:50 +0300
Message-Id: <20230708010407.3871346-1-dmitry.baryshkov@linaro.org>
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

Follow the DPU patchset ([1]) and use devm_ and drmm_ functions to
allocate long-living data structures in mdp4 and mdp5 drivers.

[1] https://patchwork.freedesktop.org/series/120366/

Dmitry Baryshkov (17):
  drm/msm: add arrays listing formats supported by MDP4/MDP5 hardware
  drm/msm/mdp5: use devres-managed allocation for configuration data
  drm/msm/mdp5: use devres-managed allocation for CTL manager data
  drm/msm/mdp5: use devres-managed allocation for mixer data
  drm/msm/mdp5: use devres-managed allocation for pipe data
  drm/msm/mdp5: use devres-managed allocation for SMP data
  drm/msm/mdp5: use devres-managed allocation for INTF data
  drm/msm/mdp5: use drmm-managed allocation for mdp5_crtc
  drm/msm/mdp5: use drmm-managed allocation for mdp5_encoder
  drm/msm/mdp5: use drmm-managed allocation for mdp5_plane
  drm/msm/mdp4: use bulk regulators API for LCDC encoder
  drm/msm/mdp4: use drmm-managed allocation for mdp4_crtc
  drm/msm/mdp4: use drmm-managed allocation for mdp4_dsi_encoder
  drm/msm/mdp4: use drmm-managed allocation for mdp4_dtv_encoder
  drm/msm/mdp4: use drmm-managed allocation for mdp4_lcdc_encoder
  drm/msm/mdp4: use drmm-managed allocation for mdp4_plane
  drm/msm: drop mdp_get_formats()

 drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c     | 33 +++----
 .../gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c  | 32 ++-----
 .../gpu/drm/msm/disp/mdp4/mdp4_dtv_encoder.c  | 37 ++------
 .../gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c | 87 +++++--------------
 drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c    | 59 +++++--------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c      | 24 ++---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h      |  1 -
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c     | 30 +++----
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c      | 21 +----
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.h      |  1 -
 drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c  | 29 +------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c      | 25 +-----
 drivers/gpu/drm/msm/disp/mdp5/mdp5_mixer.c    | 10 +--
 drivers/gpu/drm/msm/disp/mdp5/mdp5_mixer.h    |  4 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c     | 10 +--
 drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.h     |  4 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c    | 40 ++-------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c      | 19 +---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.h      |  1 -
 drivers/gpu/drm/msm/disp/mdp_format.c         | 67 +++++++++-----
 drivers/gpu/drm/msm/disp/mdp_kms.h            |  6 +-
 21 files changed, 171 insertions(+), 369 deletions(-)

-- 
2.39.2

