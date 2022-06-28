Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D9D655EA0E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 18:43:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233508AbiF1Qkm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jun 2022 12:40:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347860AbiF1Qj4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jun 2022 12:39:56 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD3CF24F2B
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jun 2022 09:37:35 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id m184so7697891wme.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jun 2022 09:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=zTrnKXsP357t4essNdCGgt/pIcSI3m0gn7jRuKNWiEQ=;
        b=dYQyZu9hKQVdrmwLqjZuuis22j79t0huSOLkc/q7KbSN2p5jEDEmGQKqxKccXO4PEQ
         /AF/u57LtJgqmCBOmjUXGL9LVX3784EwUj7hbppVcj/fRXLNxRe4Zn6KJsf9uH6TVtZs
         Qm6EjILKgODglsV1SG+Vzn4jqAenxwNHHN4gB7I8CUYz+wJ+20h6HaE7BzonhBbSffEC
         q6Hm7zIG/4bzIW9KxOYoJ+4T/kvaavYZX0DXsF3BJONMyOUsicaZoVq5xJOshlgck260
         5IiRk3gZ9x0e7Bu1fpYJytGdiA0otZ5WOfhrmUp7lyS9I17yjPUSYuDznR/GJrW6r6A/
         qqDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=zTrnKXsP357t4essNdCGgt/pIcSI3m0gn7jRuKNWiEQ=;
        b=p0fOcC/jCoDzJiEzJsMC7LchOYi4E2LOQgLzu7+42AiW3TWovdj6MZdukgKMkwW+iJ
         501ZcV3WsYYf+GrvQAWguN95qu1rDLVkzy0OlbH+C3erxuCtPklpi4wD5CmkYWZ8jmh/
         UOnB3Px8fsWeO1wowxwPNAhbRGOLyu0HaclFFZThDSWoMj1fWVoOFp5vfEG4d8tO0Sbv
         i4HtEpTMMeXaHaCk3d6MSlHP4NqWBeLDGq0+Y8zXM5EW/UVEJTCdNOM8nF2KZEQi9hR6
         SMUsC+rDdBBTeMKMbNraKvX2Ut24W65fXTc9/2SeYSv621eIKDPj7L0saqKQ9HLbaOVu
         Vr4Q==
X-Gm-Message-State: AJIora/w8pk7ttaE6nbekmDqD+Vdw1gWsuxNVcP+TUeH40YN62KLVXAl
        3xhv/+BWjjWtXBMHYga8MzV2GirUIMG7305cwZCIjr+Bikw=
X-Google-Smtp-Source: AGRyM1uOPdxafZdL1L2hYPRlKZOts53RkqBtiPY4vRVqV7TiAXTMG9m44Ga3PBCJeX+pOZH4DKOC2Gr5zsxTPxL6B/Y=
X-Received: by 2002:a05:600c:4f96:b0:39c:951e:66b7 with SMTP id
 n22-20020a05600c4f9600b0039c951e66b7mr556966wmq.84.1656434254256; Tue, 28 Jun
 2022 09:37:34 -0700 (PDT)
MIME-Version: 1.0
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 28 Jun 2022 09:37:48 -0700
Message-ID: <CAF6AEGvswNKdd02EYKYv5Zjv7f+mcqeWC7hHQ1SBjqYzN_ZHnA@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-fixes-2022-06-28 for v5.19-rc5
To:     Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dave,

A couple remaining fixes for v5.19, summary below (and in tag msg)

The following changes since commit a6e2af64a79afa7f1b29375b5231e840a84bb845:

  drm/msm/dp: force link training for display resolution change
(2022-06-18 09:14:06 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-fixes-2022-06-28

for you to fetch changes up to 08de214138cdea438a0dfcb10d355a6650c6017c:

  drm/msm/gem: Fix error return on fence id alloc fail (2022-06-27
12:48:27 -0700)

----------------------------------------------------------------
Fixes for v5.19-rc5

- Fix to increment vsync_cnt before calling drm_crtc_handle_vblank so that
  userspace sees the value *after* it is incremented if waiting for vblank
  events
- Fix to reset drm_dev to NULL in dp_display_unbind to avoid a crash in
  probe/bind error paths
- Fix to resolve the smatch error of de-referencing before NULL check in
  dpu_encoder_phys_wb.c
- Fix error return to userspace if fence-id allocation fails in submit
  ioctl

----------------------------------------------------------------
Kuogee Hsieh (1):
      drm/msm/dp: reset drm_dev to NULL at dp_display_unbind()

Rob Clark (1):
      drm/msm/gem: Fix error return on fence id alloc fail

Stephen Boyd (1):
      drm/msm/dpu: Increment vsync_cnt before waking up userspace

sunliming (1):
      drm/msm/dpu: Fix variable dereferenced before check

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c         |  3 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 10 +++++-----
 drivers/gpu/drm/msm/dp/dp_display.c                 |  2 ++
 drivers/gpu/drm/msm/msm_gem_submit.c                |  2 +-
 4 files changed, 10 insertions(+), 7 deletions(-)
