Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 860DF721ADC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jun 2023 00:29:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229635AbjFDW32 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Jun 2023 18:29:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231560AbjFDW31 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Jun 2023 18:29:27 -0400
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com [IPv6:2607:f8b0:4864:20::c30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 986BFB0
        for <linux-arm-msm@vger.kernel.org>; Sun,  4 Jun 2023 15:29:26 -0700 (PDT)
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-559b0ddcd4aso53478eaf.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Jun 2023 15:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685917766; x=1688509766;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0HYIe7NBs3P4VaCcSqqfBcyZi2lvil1HmX6vOv0yNEs=;
        b=Q/2KGS45cvdOZ9hNhKmQXnE6X8tXuMiyNxBwA7vPtUgEZvZHp9XTAgnmJzDiqhd4T3
         Pmsk4nQGquBXMafK41YK+fdbuxsEw0yu/SDXaErGB2HFawdcslVCuTfLjZIovKgzQVJN
         rqgSqdAQj3Rnc9MCdvrEgQk/qBYTbDxy53LjNOyRF6vrcDzrIJn5hwIBB6NSbLxnXd9X
         KYOXp05O+CIJJslcTQzmkhfRBLiF7RN89+TPd4EBOnc8ZTBdReT7Wse4xRDS4g2Gumv+
         py+7nAAQGFAwa05SE+Iuv4U/vsoXhROy8t6LIYW3Ot5mVBXIAM1xCko3Vy2KeRNKdqVP
         3QEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685917766; x=1688509766;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0HYIe7NBs3P4VaCcSqqfBcyZi2lvil1HmX6vOv0yNEs=;
        b=btXU/3VBQDn72oGdRZY1W2OT6F1DOCBftDNQHTr8KszWjKhd3tnPxllaLaShYHgPPR
         K68N/U9DAegBNPd6J83F/rwOfV4DMwroggmhUwUeLD9SNIGO4hXXkHmNehS1JFIOrQ1a
         GwsNKEAUvN8iPBqfKD+3MpVbsG8B3vlXt2meBU0onD3AcY91eYGycFzZ/4my1F3Q6e8W
         rOVv9tgVMNlSBHheXEIvua+1+GWyoZw8+DJsxlRJAFmTHacs6gl1F8bkHV/y74TxX0gn
         ExAZoI0aZNsiHG5qmGzvrHF063DSTXnFv3K46dxYGsIKOw1Ss1RT/I0NVe9+yBy90B7r
         Jieg==
X-Gm-Message-State: AC+VfDwZH0ffMieGWk2l40aH3kVYbOmn4a8AM71UwOqY2v5bgv7VSO9t
        2nqiTFVEvUxjFzzO9YtpNSvjBOJc+lp0MM2SrBw=
X-Google-Smtp-Source: ACHHUZ4jbbYC91lwNstgBF4Cg9ALfDPcvokzPLiT9nXdqsg66TSnmhhB/lR59A34A8B7NIHdzVg9VH79OKPi21U+vHk=
X-Received: by 2002:a4a:97ca:0:b0:555:7682:7644 with SMTP id
 x10-20020a4a97ca000000b0055576827644mr10516748ooi.2.1685917765747; Sun, 04
 Jun 2023 15:29:25 -0700 (PDT)
MIME-Version: 1.0
From:   Rob Clark <robdclark@gmail.com>
Date:   Sun, 4 Jun 2023 15:29:14 -0700
Message-ID: <CAF6AEGuHujkFjRa6ys36Uyh0KUr4Hd16u1EMqJo8tOZ3ifVubQ@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-fixes-2023-06-04 for v6.4-rc6
To:     Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "Kuogee Hsieh (QUIC)" <quic_khsieh@quicinc.com>
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

A few late fixes for v6.4.. meant to send this out last week but got
distracted setting my new x13s.

The following changes since commit 5c054db54c43a5fcb5cc81012361f5e3fac37637:

  drm/msm: Be more shouty if per-process pgtables aren't working
(2023-05-17 08:53:47 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-fixes-2023-06-04

for you to fetch changes up to 203a878ae6f483fa6a99895f90bddd425626b9d2:

  drm/msm/a6xx: initialize GMU mutex earlier (2023-06-04 09:59:03 -0700)

----------------------------------------------------------------
A few more late fixes for v6.4-rc6

+ Fix max segment size to address splat on newer a6xx
+ Disable PSR by default w/ modparam to re-enable, since there
  still seems to be a lingering issue
+ Fix HPD issue
+ Fix issue with unitialized GMU mutex

----------------------------------------------------------------
Abhinav Kumar (1):
      drm/msm/dp: add module parameter for PSR

Dmitry Baryshkov (1):
      drm/msm/a6xx: initialize GMU mutex earlier

Kuogee Hsieh (1):
      drm/msm/dp: enable HDP plugin/unplugged interrupts at hpd_enable/disable

Rob Clark (1):
      drm/msm: Set max segment size earlier

 drivers/gpu/drm/msm/adreno/a6xx_gmu.c |  2 -
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c |  2 +
 drivers/gpu/drm/msm/dp/dp_catalog.c   | 15 ++++++-
 drivers/gpu/drm/msm/dp/dp_catalog.h   |  3 +-
 drivers/gpu/drm/msm/dp/dp_display.c   | 77 +++++++++++------------------------
 drivers/gpu/drm/msm/msm_drv.c         |  4 +-
 6 files changed, 44 insertions(+), 59 deletions(-)
