Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12F88515F5A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Apr 2022 18:54:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232947AbiD3Q6A (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 30 Apr 2022 12:58:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232692AbiD3Q6A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 30 Apr 2022 12:58:00 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14F445AA77
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Apr 2022 09:54:38 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id n126-20020a1c2784000000b0038e8af3e788so6344975wmn.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Apr 2022 09:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=UgcfR9fxU4zn71AkYAESURVcvwrfVRwbY7xOuXfpyVs=;
        b=RaVNxJ1ZS3dYfc2EW9OaPpgudBJ6n/5ARY+OKf5kiz//QhyBK2GzO9Vw2u8KbabzK1
         frw4eR+tJiKArbMjTF1ZgMt9cUi5CyFBn3dsiQS8tMnWM4ARCMV8qABMTXq7Uo2/7hNk
         6aTo//bGnmWPO7PTMJqBlOG+zEaJ9kIohIdOCiu3XG7dd3qP6H0jvG6sT1xDQ2gG6rJb
         bQraA3FCd35zqxDSTIAMW1w/3vFr/9Iu3fRWdUKM3TnRNGmbvz/ywWY+ldq2vaKwRdLR
         Gm6n0vax5hJ949t7uHBVkyFjfzCDpS61SxeDyOgGuWddSdEpCTQo9vjMmun8SNYezJHI
         w0vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=UgcfR9fxU4zn71AkYAESURVcvwrfVRwbY7xOuXfpyVs=;
        b=udn9Dd/0Ogs/0WLq5a/Mr7kbiSwb45aeNDX5iB/c1Hyc/ryw7Dw4y+djiQSLYj0nPd
         cCJJYEZbEGaJoFper9zWftmIaCZ/kU+kr5cHodHpi8YpK7dAdKM9ATjCcTGeWPR4M7K2
         MizqJqnS9JT23nGxynObitc/ANNsHLGtPGjWrPMyyO8BO3rOuF8mrnJ15of9Ccgjz2ye
         R8emqO7vJrOk3hjOHP/jsupHMb+cN7Z0U9lQfzVknmQAHGAkASNfrFKKnjvZt1zLLJAm
         HTFQt1Ad7jnZ8g4cFfGt2+Gtb2S56sGQ8w8OrHwO+S5N0PbHhjX4ubhTjEqQMVQ+VBaO
         X+cg==
X-Gm-Message-State: AOAM5304gKOmrfawixOjy8S15xeACW1JYHSAdgfVv7YEi/DYbR0XO4gx
        HZYb7UQGSZmO5uA3EKPxxp8F3iWnYfNnhEy7N+M=
X-Google-Smtp-Source: ABdhPJwdO4xjsnmx6Bm8HEjwC+mQZtQxVrKTkJrHIUXRSOWdtkI810k4ORQlSla+k9gRR1V+zWGIQR6Xo0tEsV3sFr4=
X-Received: by 2002:a05:600c:1548:b0:392:8e1a:18c3 with SMTP id
 f8-20020a05600c154800b003928e1a18c3mr4259445wmg.102.1651337676201; Sat, 30
 Apr 2022 09:54:36 -0700 (PDT)
MIME-Version: 1.0
From:   Rob Clark <robdclark@gmail.com>
Date:   Sat, 30 Apr 2022 09:54:24 -0700
Message-ID: <CAF6AEGtkzqzxDLp82OaKXVrWd7nWZtkxKsuOK1wOGCDz7qF-dA@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-fixes-2022-04-30
To:     Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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

One last fix for v5.18, to fix a lockdep issue.  Sorry, I meant to
send this a couple days ago but forgot.

The following changes since commit 0371870b96907bf560ecf7dc3fadc238fadf7845:

  drm/msm: Revert "drm/msm: Stop using iommu_present()" (2022-04-19
10:33:07 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git drm-msm-fixes-2022-04-30

for you to fetch changes up to 3f65b1e2f424f44585bd701024a3bfd0b1e0ade2:

  drm/msm/dp: remove fail safe mode related code (2022-04-27 10:17:05 -0700)

----------------------------------------------------------------
Kuogee Hsieh (1):
      drm/msm/dp: remove fail safe mode related code

 drivers/gpu/drm/msm/dp/dp_display.c |  6 ------
 drivers/gpu/drm/msm/dp/dp_panel.c   | 11 -----------
 drivers/gpu/drm/msm/dp/dp_panel.h   |  1 -
 3 files changed, 18 deletions(-)
