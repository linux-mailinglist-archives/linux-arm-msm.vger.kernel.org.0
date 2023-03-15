Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AAE566BBED8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Mar 2023 22:19:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232734AbjCOVTR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Mar 2023 17:19:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232502AbjCOVTN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Mar 2023 17:19:13 -0400
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com [IPv6:2001:4860:4864:20::30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63454B740
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Mar 2023 14:18:31 -0700 (PDT)
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-177ca271cb8so9950382fac.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Mar 2023 14:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678915110;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bdnBdXjPaPq22bh3GzRy4ABzX+bcEMJKNRNVLLGgBsg=;
        b=ZuL2udCMxwn5gI+q6+YtLJPvHyiQauuHTEAkzSR37Mf9S/l7ajIqmQYYZluoNVYV+S
         r7amWms85839VXN9elIXHTNnEMMNzZ9mSnouOURlIUn1OqIBuKDwrVokNg5NZn4MRVad
         on9OwOrcpEr8EgFzS++1+/nbd734g0uOW0dDjD1WuLoRsoLrBFZfKkGxNHyNSm1KikhZ
         RGtkIuPeyeG0Yiis8XNXkMsa/nXaUxBH4zwTpWSKJUy8dOB2w6rXrXioQ5tcda+wjtDm
         407b2/CM+yuUzPwLKZXlqnBsRGbY+hp6Jl1QCSLgxnAB/AH51dnHL06bIRUsoPsRUqBg
         2Wxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678915110;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bdnBdXjPaPq22bh3GzRy4ABzX+bcEMJKNRNVLLGgBsg=;
        b=rkOnNCGhQZjk7WoZ53EIQIMKxBcHt/4FcCZarfI2fayk2hHzoMRxix/KpgdBPccJ6F
         wdEJWTySJUAedhBFUlZGOOgnU55hidUtlomydfIo/PFFtYuXAc/8EKl0Q2jQCxtTpCVg
         48WUJ4AxYqeTRIU/U3Pd2E/5gPCsqkciCbURE23CW3bSAbJJRhhxzaR2HGas8wen57Rv
         YVJBGQpmecPazDFJEyWCLSUlwK/rwDAHGL2LXzAxZ/mQ9MxflaW0gnKiBzDF1lj7TwWM
         HxyTD/m9BHtQ3fXhJHMQyS7OM66wAwTtpsXAt+osGNRNnvhJfywPzaT1Qaj8QTKg9QyB
         M7oA==
X-Gm-Message-State: AO0yUKXMWJrleAqDr1PysgY0kDya5wpJYE1QYuQYA7RELbu59gfYTLva
        LGPms9UF9ov20U6gYb9YJecA5Py1RcaFuv6fJkshrne8GcQ=
X-Google-Smtp-Source: AK7set/jIUXiHKsEUbCoIzuLYS6XHPxHBp77q+c5ZikbCCIGYHgBEO0xRM1r9B0hFYKNvoXYN55JfPSCWpuoRnXBB38=
X-Received: by 2002:a05:6870:11d1:b0:17a:d52e:77de with SMTP id
 17-20020a05687011d100b0017ad52e77demr891023oav.5.1678915109865; Wed, 15 Mar
 2023 14:18:29 -0700 (PDT)
MIME-Version: 1.0
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 15 Mar 2023 14:18:18 -0700
Message-ID: <CAF6AEGurNEeARQjVRH3gVcE+qznnfd_NB2n-1s+Tsozcm0t8oQ@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-next-2023-03-15 for v6.4
To:     Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Vinod Polimera <quic_vpolimer@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dave,

As discussed, an early msm-next pull req for v6.4 with PSR and related
core helper bits.

The following changes since commit dbd7a2a941b8cbf9e5f79a777ed9fe0090eebb61:

  PM / devfreq: Fix build issues with devfreq disabled (2023-01-30
07:37:40 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-next-2023-03-15

for you to fetch changes up to 1844e680d56bb0c4e0489138f2b7ba2dc1c988e3:

  drm/msm/dp: set self refresh aware based on PSR support (2023-03-13
04:43:50 +0300)

----------------------------------------------------------------
msm-next for v6.4

Early pull req with PSR and related drm core helpers

----------------------------------------------------------------
Vinod Polimera (14):
      drm: add helper functions to retrieve old and new crtc
      drm/bridge: use atomic enable/disable callbacks for panel bridge
      drm/bridge: add psr support for panel bridge callbacks
      drm/msm/disp/dpu: check for crtc enable rather than crtc active
to release shared resources
      drm/msm/disp/dpu: get timing engine status from intf status register
      drm/msm/disp/dpu: wait for extra vsync till timing engine status
is disabled
      drm/msm/disp/dpu: reset the datapath after timing engine disable
      drm/msm/dp: use atomic callbacks for DP bridge ops
      drm/msm/dp: Add basic PSR support for eDP
      drm/msm/dp: use the eDP bridge ops to validate eDP modes
      drm/msm/disp/dpu: use atomic enable/disable callbacks for
encoder functions
      drm/msm/disp/dpu: add PSR support for eDP interface in dpu driver
      drm/msm/disp/dpu: update dpu_enc crtc state on crtc
enable/disable during self refresh
      drm/msm/dp: set self refresh aware based on PSR support

 drivers/gpu/drm/bridge/panel.c                     |  68 +++++++-
 drivers/gpu/drm/drm_atomic.c                       |  60 +++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |  40 ++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  26 +++-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |  22 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |   8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   2 +-
 drivers/gpu/drm/msm/dp/dp_catalog.c                |  80 ++++++++++
 drivers/gpu/drm/msm/dp/dp_catalog.h                |   4 +
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   |  80 ++++++++++
 drivers/gpu/drm/msm/dp/dp_ctrl.h                   |   3 +
 drivers/gpu/drm/msm/dp/dp_display.c                |  36 +++--
 drivers/gpu/drm/msm/dp/dp_display.h                |   2 +
 drivers/gpu/drm/msm/dp/dp_drm.c                    | 173 ++++++++++++++++++++-
 drivers/gpu/drm/msm/dp/dp_drm.h                    |   9 +-
 drivers/gpu/drm/msm/dp/dp_link.c                   |  36 +++++
 drivers/gpu/drm/msm/dp/dp_panel.c                  |  22 +++
 drivers/gpu/drm/msm/dp/dp_panel.h                  |   6 +
 drivers/gpu/drm/msm/dp/dp_reg.h                    |  27 ++++
 include/drm/drm_atomic.h                           |   7 +
 22 files changed, 683 insertions(+), 43 deletions(-)
