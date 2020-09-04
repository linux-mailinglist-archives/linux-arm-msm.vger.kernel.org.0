Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9A3425E387
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Sep 2020 23:59:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727949AbgIDV7v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Sep 2020 17:59:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727057AbgIDV7u (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Sep 2020 17:59:50 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2113DC061244
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Sep 2020 14:59:50 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id e17so8059075wme.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2020 14:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=U3spfXQmO2BRaJHGudjEyITOjhah8je6NW5iKf3Fh4I=;
        b=KDlxzvn+rzpjApnqElJuPXhCljKoqyBKG8f9WahNk8FJP53EPszdWs4t0tUp47I5LK
         h8ZU0d/IJdzanRthbzPkmPvhkv9nKflt7eXoaKINWiv4OECggyf4IxXx6Rw0ir1rycJU
         ufwzMfgnzZILJP6rQIq0MCEcaWPwySvaUln+Bvou7nflu3Em3fxFHkab9HFc/nCR94dO
         lQa2XCQylWTs3VYDOsI0PtJJfrIxh5lyceNr7s/psh0FZeEy1LVYpZDFiQdtoGpDDe2M
         ADvu3ouE4OnQlpB0Cs903L9F++qyXfWOmQN2z4kdHbyOqYStcZubrcJejSSS6pCgSo7m
         3ABw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=U3spfXQmO2BRaJHGudjEyITOjhah8je6NW5iKf3Fh4I=;
        b=F3DsA8DQdXBavNvbKvAHaTRPMsp2dFaRyW1sHPy4WFBmAx2kjep1cjQRKhGHlWqSVs
         yuRaSNR4iGN68QbK33FaL2ouWGAM2CDwEpU4/w+LHSpv0k8IvCjwGIrSntPUGsipTOfl
         i3t/WTayLBxf1ggUZH9ITCC+ETQsH0Z2nQvC9s4BrJShP2uJuLMzPbZ/VCrlxZToREBF
         59NNFqx9v6JHPIm23uL62CVQemo9oX9f9GZaMv04x8qi3tsb6H45BMFiZvGPS4sRrqfT
         RP1FSxTt58ZpXSXnM9sYCmBVDT9OuSvGbWrZ/7BYMoNMqvSYskdHr2ISMWng/eQticZB
         /YlQ==
X-Gm-Message-State: AOAM530CfJENGWdA5cUjaYOVDx9uQtXTtNcic9zbXLJ6JPOEzUJ2NYRR
        II25Nw6RV353B45/OUeV3VwMDsH5gf7zsoGB5Mo=
X-Google-Smtp-Source: ABdhPJzQSXMefTwCwfsJ62JIXHVJSF1qjBmc0EIMobb5Rax3AVQbmJefcrTwN92VWnLnNYppDlINyPj2nR+DcvuvCfM=
X-Received: by 2002:a1c:2dcb:: with SMTP id t194mr9134014wmt.94.1599256788672;
 Fri, 04 Sep 2020 14:59:48 -0700 (PDT)
MIME-Version: 1.0
From:   Rob Clark <robdclark@gmail.com>
Date:   Fri, 4 Sep 2020 15:00:44 -0700
Message-ID: <CAF6AEGvnr6Nhz2J0sjv2G+j7iceVtaDiJDT8T88uW6jiBfOGKQ@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-fixes-2020-09-04
To:     Dave Airlie <airlied@gmail.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Sean Paul <sean@poorly.run>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dave,

A few fixes for a potential RPTR corruption issue.

The following changes since commit 5e0c22d4a9ddae4e784a3e171b9d3d452b37aeb2:

  drm/msm/a6xx: fix frequency not always being restored on GMU resume
(2020-08-22 10:56:45 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git drm-msm-fixes-2020-09-04

for you to fetch changes up to f6828e0c4045f03f9cf2df6c2a768102641183f4:

  drm/msm: Disable the RPTR shadow (2020-09-04 12:14:15 -0700)

----------------------------------------------------------------
Jordan Crouse (4):
      drm/msm: Split the a5xx preemption record
      drm/msm: Enable expanded apriv support for a650
      drm/msm: Disable preemption on all 5xx targets
      drm/msm: Disable the RPTR shadow

 drivers/gpu/drm/msm/adreno/a2xx_gpu.c     |  5 +++++
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c     | 10 ++++++++++
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c     | 10 ++++++++++
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c     | 14 +++++++++++---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.h     |  1 +
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c | 25 ++++++++++++++++++++-----
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 13 ++++++++++++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c   | 27 ++-------------------------
 drivers/gpu/drm/msm/msm_gpu.c             |  2 +-
 drivers/gpu/drm/msm/msm_gpu.h             | 11 +++++++++++
 drivers/gpu/drm/msm/msm_ringbuffer.c      |  4 ++--
 11 files changed, 85 insertions(+), 37 deletions(-)
