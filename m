Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C242463ADF9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Nov 2022 17:40:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232244AbiK1QkU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Nov 2022 11:40:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232856AbiK1QkC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Nov 2022 11:40:02 -0500
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84A6926491
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Nov 2022 08:39:50 -0800 (PST)
Received: by mail-oi1-x235.google.com with SMTP id v82so12181740oib.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Nov 2022 08:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DOBbN+yGOTJblq8Kcqb5gYmtWCZuirUERvLLETmfmEA=;
        b=KUq+4Fh4suvdwDSsDUXMUw66rZgOGwzs52q9I+3ENYDittdcKSClLo3UVV0ayEQS8S
         sEcG7ClD7waTLdN+lVHKkhU3oz16kp7OE6Lur5QBk3zKpyo+Q/6tbuYbXCv9Z9/x4mcI
         eK0IXLICIFWXzwTYhmIZWYHvO0PYUgMiPy/rwf9hZdcjUvBGVMujN+aDpWQqv73WjJ77
         dqgvR6UVM8bBYOeyv/pJE/OkOmjMSvP2lJ4aYmxX3d03SmrhVy9cYndhYZaqDDYRY+6t
         rhD5DQsCuDSzSusgMHGsqjK1sCf/K1O7RuR5k0+gACNL4NYQha9AX+ywkBJXNE/5IkD8
         0ajw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DOBbN+yGOTJblq8Kcqb5gYmtWCZuirUERvLLETmfmEA=;
        b=GONv24SnmvJ4tGRPEiNl7gT6JFDgVUNP+bnQ81geBx8k9mt6rDOATPo6Mit+Iyn6BF
         u/s9tqmnKXUOhghZ4+L1KowYAnILcY5YToemT26+maAYNCC4M597BfnKR/RmfV9XdbO/
         P6b2zuwilSDl/qkv/xs/8r1Bzfv+7huPv//wnD2BE3gSgKqKmuNt0nrSlxN/np8VJGHJ
         Wi/esRBSclLFw3Wr67hcBvHdlSBlILX+u0ht9UFrZ17ZeUjCwE464AteYjj2jVjfSFN+
         0SYSIGNCQuKfJFyqRqB4gq7RHkpOLncV9ZWiO0Mfc2hCc96/ymRx6SbNT11bpWFTmpV2
         uVvQ==
X-Gm-Message-State: ANoB5pnEyj8Y141HZ3xaxOHYx7TVVNwOFNugP5Ozh4jNVBnvshvM/Qzg
        FuR5ZoQvH8tqGkq8m/aYxGPrzKJPG4JQBQXWdRk=
X-Google-Smtp-Source: AA0mqf4S1IOj9AcvlZXtlLm+aCrlaJsKesQnaEcd5iOyI1R7KhOltGzgZn7tfxhi3OaspVR4xjnoH45OM9whV4iQPIs=
X-Received: by 2002:aca:3984:0:b0:35b:94a8:4f89 with SMTP id
 g126-20020aca3984000000b0035b94a84f89mr7535447oia.183.1669653589598; Mon, 28
 Nov 2022 08:39:49 -0800 (PST)
MIME-Version: 1.0
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 28 Nov 2022 08:39:39 -0800
Message-ID: <CAF6AEGvT1h_S4d=YRgphgR8i7aMaxQaNW8mru7QaoUo9uiUk2A@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-next-2022-11-28 for v6.2
To:     Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dave & Daniel,

Here are the gpu/gem bits for v6.2.  Dmitry already sent a separate
pull request[1] for the display bits.  Summary below and in tag.

[1] https://patchwork.kernel.org/project/dri-devel/patch/20221126102141.721353-1-dmitry.baryshkov@linaro.org/

The following changes since commit 7f7a942c0a338c4a2a7b359bdb2b68e9896122ec:

  Merge tag 'drm-next-20221025' of git://linuxtv.org/pinchartl/media
into drm-next (2022-10-27 14:44:15 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-next-2022-11-28

for you to fetch changes up to d73b1d02de0858b96f743e1e8b767fb092ae4c1b:

  drm/msm: Hangcheck progress detection (2022-11-17 10:39:12 -0800)

----------------------------------------------------------------
msm-next for v6.2 (the gpu/gem bits)

- Remove exclusive-fence hack that caused over-synchronization
- Fix speed-bin detection vs. probe-defer
- Enable clamp_to_idle on 7c3
- Improved hangcheck detection

----------------------------------------------------------------
Rob Clark (6):
      drm/msm: Remove exclusive-fence hack
      drm/msm/a6xx: Fix speed-bin detection vs probe-defer
      drm/msm: Enable clamp_to_idle for 7c3
      drm/msm: Enable unpin/eviction by default
      drm/msm/adreno: Simplify read64/write64 helpers
      drm/msm: Hangcheck progress detection

 drivers/gpu/drm/msm/adreno/a4xx_gpu.c       |  3 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c       | 27 ++++------
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c   |  4 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c       | 84 ++++++++++++++++++-----------
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |  3 +-
 drivers/gpu/drm/msm/msm_drv.c               |  1 -
 drivers/gpu/drm/msm/msm_drv.h               |  8 ++-
 drivers/gpu/drm/msm/msm_gem_shrinker.c      |  2 +-
 drivers/gpu/drm/msm/msm_gem_submit.c        |  3 +-
 drivers/gpu/drm/msm/msm_gpu.c               | 31 ++++++++++-
 drivers/gpu/drm/msm/msm_gpu.h               | 22 +++++---
 drivers/gpu/drm/msm/msm_ringbuffer.h        | 28 ++++++++++
 12 files changed, 150 insertions(+), 66 deletions(-)
