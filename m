Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B3AC3D7A5C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jul 2021 18:01:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229569AbhG0QBL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Jul 2021 12:01:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbhG0QBK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Jul 2021 12:01:10 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4005DC061757
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jul 2021 09:01:09 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id k4so7901468wms.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jul 2021 09:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=fWpsiDeQTO8Umc8Q7ThOZBRvsvug1xPlx+gEHjpKDo8=;
        b=NhSFf8RALH6r8ytAzyNnJjlDi7K3ZO2hoQov4SieOYP7hnmw/e9ee7qfc/BcRkisHV
         w+LXRefabeKfixiOZ49LJ2Gq9TS7gLeQn3H3BvhQeJMi5Eco9Epn6n+ibO8enowAT9en
         zCkdjNkk9ZKc9sWDfI6vaxLd4nvthjJR7FOi4WkHLDfm3Spe/7cDw7nV9fKf8UXsbD1r
         9+e3nr2B5lT8rll0WXlHtW2Dn4IkYvNYxNce6+ljmBzaESd1RtbymOWcyLVAR1v4uGmd
         N+Q3c7lGS8/EpA5mK3aYsSSZ6lTMKJts3qTmWIqMe7oYF7o8K1DG2RiMh7louHmwyITd
         9wgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=fWpsiDeQTO8Umc8Q7ThOZBRvsvug1xPlx+gEHjpKDo8=;
        b=biySoRqzO7Hgdu/ilatZ64oQK/xoyGvo0+VIVptomhB7HM9lhJEG1Q7AkAwfvErYfp
         gA13NrqfE30EJyA7WkqbtwYLWkVLtdEwnWVmxxeFOHMVovMiaJfAsprk+HRSxHcwDqgq
         VTklf88AcADgEiQmLGL8qCyKHuZkxQcjmmCawH34RkW7x1SYVIzM83EbUcMPYbq2TYIk
         QEKtSna+zG8RLszqNfvEQMShJ/RA106kHF++8Y8MITjWwn+Z/43ZFn7d0JX3tG8G9sAa
         gafsy04G/6/REfKOYx6UIPWmRJJYlom2MKuS+6L533UwvLl85CEre0qsWNON2rRdZ5tJ
         2ZBA==
X-Gm-Message-State: AOAM530lsmOIEc56Um6IvhcvxgEsXyHhK09oa9KmXIv7Mqul7EkBZcFM
        DtBuy6CM6GJMVKY097I41Y2VzqudNuQfbA4u+V8=
X-Google-Smtp-Source: ABdhPJxN2KtavHy/pdkhzu3eo2D9p8fkth7CptRD+0XpNLWfxXlcUGZNjiZbbC6EfWX1xl8ICrC13JS3KrlzMfjGrlI=
X-Received: by 2002:a05:600c:19cb:: with SMTP id u11mr13331594wmq.175.1627401667801;
 Tue, 27 Jul 2021 09:01:07 -0700 (PDT)
MIME-Version: 1.0
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 27 Jul 2021 09:05:17 -0700
Message-ID: <CAF6AEGubeV_uzWhsqp_+EmQmPcPatnqWOQnARoing2YvQOHbyg@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-fixes-2021-07-27 for v5.14-rc4
To:     Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        John Stultz <john.stultz@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dave & Daniel,

A few fixes for v5.14, including a fix for a crash if display triggers
an iommu fault (which tends to happen at probe time on devices with
bootloader fw that leaves display enabled as kernel starts)

The following changes since commit ff1176468d368232b684f75e82563369208bc371:

  Linux 5.14-rc3 (2021-07-25 15:35:14 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git drm-msm-fixes-2021-07-27

for you to fetch changes up to fc71c9e6f41f9912d22a75dfa76bc10811af7e22:

  drm/msm/dp: Initialize dp->aux->drm_dev before registration
(2021-07-27 08:14:58 -0700)

----------------------------------------------------------------
Bjorn Andersson (1):
      drm/msm/dp: Initialize the INTF_CONFIG register

Kuogee Hsieh (2):
      drm/msm/dp: use dp_ctrl_off_link_stream during PHY compliance test run
      drm/msm/dp: signal audio plugged change at dp_pm_resume

Rob Clark (1):
      drm/msm: Fix display fault handling

Robert Foss (1):
      drm/msm/dpu: Fix sm8250_mdp register length

Sean Paul (1):
      drm/msm/dp: Initialize dp->aux->drm_dev before registration

 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  2 +-
 drivers/gpu/drm/msm/dp/dp_catalog.c            |  1 +
 drivers/gpu/drm/msm/dp/dp_ctrl.c               |  2 +-
 drivers/gpu/drm/msm/dp/dp_display.c            |  5 +++++
 drivers/gpu/drm/msm/msm_iommu.c                | 11 ++++++++++-
 5 files changed, 18 insertions(+), 3 deletions(-)
