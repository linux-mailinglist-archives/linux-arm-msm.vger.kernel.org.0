Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3323339FD9A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jun 2021 19:29:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231416AbhFHRbI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Jun 2021 13:31:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231278AbhFHRbI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Jun 2021 13:31:08 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CA04C061787
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Jun 2021 10:29:05 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id v206-20020a1cded70000b02901a586d3fa23so2413621wmg.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jun 2021 10:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=kh3U0W8lXjrBe5YvME2LiOdCRvieHJMJ/l2oE7LB1q4=;
        b=NRdrRyXDEwt/oe9k+Tty8IVcHBZsLVbq+DP2weSvJsQJprOLjbrKBH9FUSW/HidQ3B
         zpWUt05xhBz7+HDuKHLDIKkx1EOda4j7njFeASretr450sVoQSfu0xNkshyZYm6zMXry
         Ox0ZGApZjtDtUYHRFZ2K/q+d0+vAIYLdBFPe8TtxSMSsLS94ogtbcRP7PTVnB0J/y7uA
         2KfetVbjgfCAHev4ir3yRSup5tOfr/8kVB22oMCcVVm+w0Xcurcx4WMSzFMSyCPwkrTq
         oqQYkY5XY1k6BDgiugP9k2sDx12b83VYjao6popDUYt564Rs/qExfaP42rCXWH02vK9f
         U/bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=kh3U0W8lXjrBe5YvME2LiOdCRvieHJMJ/l2oE7LB1q4=;
        b=LQSVABDGnPhllT+xbDajxiJYfpmW0QySz8n85YPr3UDIik4oPn3b7DfudtvFeWzQ7v
         bF1xowx65q3DYCve11W5E6qviMz26g4tShK5SIbXnDduA9RXx6mhwNqd4FRY1VmWQ+Np
         fZwLEJz361pdEQgdfebf8HVCBFF7G9QvKM1urmIrHRj7HBXpK0Ao/tFi5uQkJR89Dobo
         YbTJbj+5gowJHUm6csQhJ75Xvb2tYdNFQXX/CpDCFvnblYpgjiOKLYIO5D296xdkvkh3
         lBLHGXa8QD6bTDpypACrboi1h7+aKSLtyJxUFR0/mL/zo4unS33yV/zdajf0VX1KPMH9
         /6SQ==
X-Gm-Message-State: AOAM533wMUyZNWYG8cj2/SDlqo9LAwrQcQUYPjE31dKx2L+z+CPGFyhK
        R+xIIYgUbeTrz6VK/yjqd9tM4GQkqTQmNteUzLemQLUhptM=
X-Google-Smtp-Source: ABdhPJzt6qeJVEAIrJtphShs6jULoPcjL95oJqnADSmPyn9ruBxnkpU2RrhQjbvVA/O4wV96WwrdqeYR1cAMSDyQ6e4=
X-Received: by 2002:a1c:23d6:: with SMTP id j205mr5660343wmj.94.1623173342589;
 Tue, 08 Jun 2021 10:29:02 -0700 (PDT)
MIME-Version: 1.0
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 8 Jun 2021 10:32:56 -0700
Message-ID: <CAF6AEGs+zjKrj2_oU0ByF=UqBgh3oEOuNkNem3eg5HcFhffmBQ@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-fixes-2021-06-08 for v5.13-rc6
To:     Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dave & Daniel,

A few late fixes for v5.13

The following changes since commit f2f46b878777e0d3f885c7ddad48f477b4dea247:

  drm/msm/dp: initialize audio_comp when audio starts (2021-05-06
16:26:57 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git drm-msm-fixes-2021-06-08

for you to fetch changes up to 924f4cba9e68bf2b4717e7941697db96c6f203be:

  drm/msm/a6xx: avoid shadow NULL reference in failure path
(2021-06-08 10:08:05 -0700)

----------------------------------------------------------------
Alexey Minnekhanov (1):
      drm/msm: Init mm_list before accessing it for use_vram path

Jonathan Marek (3):
      drm/msm/a6xx: update/fix CP_PROTECT initialization
      drm/msm/a6xx: fix incorrectly set uavflagprd_inv field for A650
      drm/msm/a6xx: avoid shadow NULL reference in failure path

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 155 +++++++++++++++++++++++++---------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h |   2 +-
 drivers/gpu/drm/msm/msm_gem.c         |   7 ++
 3 files changed, 122 insertions(+), 42 deletions(-)
