Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BDEF66CE29
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jan 2023 18:59:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232686AbjAPR7j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Jan 2023 12:59:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235165AbjAPR6o (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Jan 2023 12:58:44 -0500
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com [IPv6:2001:4860:4864:20::2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4006241CE
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jan 2023 09:41:28 -0800 (PST)
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-15eeec85280so8415349fac.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jan 2023 09:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=32etmJGtnoqZs4BKYvAsZxgp4Z8S6ohTWuwi/XPlaIY=;
        b=PvRXv20O6DvvrQohvHLThOVursOGZoHGCN2kKLOUEBl+JlR++v8pM94Rsdy+06TzUD
         u3nljlp1FNHPwvXBcmTsJQwp5H1hGn8IPm856UZTRnbPtrFRl7W84tpUJXbZl1HzLC42
         eqWloiTobk3CJkGgEEIyOLOP+ig3gjISbbDWsltJJk4dOFlrjgn9rWUN7Py8pr2Qw3ct
         KKMwPo18GrWMGwi7ePfdIWFFhEKZo7AFWB8fi1obVJVVN0HXpg2T/0WKU0KzvEMCBPND
         1CxvpeA1K8zaqluCHxAwRBQsULmXXLB/zx0TCmeChCv8oPySCtsAbc6p6IUrW9xuzyDB
         5DNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=32etmJGtnoqZs4BKYvAsZxgp4Z8S6ohTWuwi/XPlaIY=;
        b=kN58RSADuQb+6UWuVb3zd3A4JDQ644PozGo1bxA+LylhEcINpzJEtyytosU0RHLo0z
         mBjTefg8kqnx9rDOropq9Tw6CQ+SwVpnT9arUlyH1gGSO3KoqmgeXEuTASxufQWlF/Mk
         kM3nG5ZKe+vWip9xSkRdoHpa46zrcdfIw4ldvONjSeIfZpfvqUsc9dPrIIcKOiG8P3LY
         pid9Ae26gMpcr6OjhMy9MH6RTkav9ug0tE7NmERfRJHICLyr8QRd2RBg3Tz3Yv5WYxAS
         6Plfk/t4mHitBJUkdstewZmgQYO9YOTvEreiDvfGr53+WQHakOTy/VS5VMtrhF4mGy2q
         VdFQ==
X-Gm-Message-State: AFqh2kpV0TWy4gbCCzERWed4sywaEg/a/STtevDbOp/EH+D8DD1DhKt6
        GSTzYtGPuqKPLTlPRKwkAigh2iNndsgM85QtkqM=
X-Google-Smtp-Source: AMrXdXv/fJdDosEVH5QdjcHknh+mizzHGjnQeD0B3IXf279r17ct66uUwAb+qk2pfx3Fq5drTaa1P/d+FtTgWTMAjOU=
X-Received: by 2002:a05:6870:9a9b:b0:13d:51fe:3404 with SMTP id
 hp27-20020a0568709a9b00b0013d51fe3404mr31029oab.183.1673890887961; Mon, 16
 Jan 2023 09:41:27 -0800 (PST)
MIME-Version: 1.0
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 16 Jan 2023 09:41:25 -0800
Message-ID: <CAF6AEGskguoVsz2wqAK2k+f32LwcVY5JC6+e2RwLqZswz3RY2Q@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-fixes-2023-01-16 for v6.3-rc5
To:     Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
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

Hi Dave,

A couple more fixes for the v6.3 cycle, which were meant to be part of
the previous fixes pull, but I fumbled at git when applying the tag.

The following changes since commit f4a75b5933c998e60fd812a7680e0971eb1c7cee:

  drm/msm/a6xx: Avoid gx gbit halt during rpm suspend (2023-01-05
15:13:16 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-fixes-2023-01-16

for you to fetch changes up to a66f1efcf748febea7758c4c3c8b5bc5294949ef:

  drm/msm/gpu: Fix potential double-free (2023-01-11 09:00:14 -0800)

----------------------------------------------------------------
msm-fixes for v6.3-rc5

Two GPU fixes which were meant to be part of the previous pull request,
but I'd forgotten to fetch from gitlab after the MR was merged so that
git tag was applied to the wrong commit.

- kexec shutdown fix
- fix potential double free

----------------------------------------------------------------
Joel Fernandes (Google) (1):
      adreno: Shutdown the GPU properly

Rob Clark (1):
      drm/msm/gpu: Fix potential double-free

 drivers/gpu/drm/msm/adreno/adreno_device.c |  5 +++--
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    |  4 ++++
 drivers/gpu/drm/msm/msm_gpu.c              |  2 ++
 drivers/gpu/drm/msm/msm_gpu.h              | 12 ++++++++++--
 4 files changed, 19 insertions(+), 4 deletions(-)
