Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9472728CEC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jun 2023 03:15:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233101AbjFIBPO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Jun 2023 21:15:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229684AbjFIBPN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Jun 2023 21:15:13 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 866AB1B9
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jun 2023 18:15:12 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id 5614622812f47-39bcba263efso220916b6e.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jun 2023 18:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686273312; x=1688865312;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=H0xCMAC/NtHY5CX7dP6e8DaXAI+xP/PPsv73S1ApFK4=;
        b=oblBIKSjWOPANq4L3jUYH9d7owGAzWhrcXAx9DqzBgGb6E6VYgc5ELqConP7Qz9SDY
         zhs2Pa9CsTcYO1R4glWacmaJpMrZVB63fy/O4y1gLyF55K8hPB0TV1gpbAtAVGtwhOlI
         XEDFRflvrZBOIpmJyeXF6ROighWmDeNMtq8y5Ao1V4M9m0XSenEqgypMCtZd/o7iiapM
         /vJSQC8o/uGPJRd40mEq6duxtX7RWCiQmRiq77TWqKat6zn603HwCwDqdPlDtY78Xeso
         Oqabz3PjcfOczDGAI1BroTwLKBDUntw6JXwdlXUwXeGiIjt8uO8bMfY/MHdb32Er4SBZ
         U1UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686273312; x=1688865312;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H0xCMAC/NtHY5CX7dP6e8DaXAI+xP/PPsv73S1ApFK4=;
        b=Ns3XCAVlQJ8lnOGth15pbe8EVVLSwHYulcuZByWsCzwKhmJ/znT8V+wvFnWog2gOxq
         UffJFjrNHalUPlkZyKiKSAlZBCjUIeAHnilAe1ySckAmxbTvVEZ5F/2HwGSXv8Mqalve
         qVyXsrStFX+DJIW700PbeUrr9yYc8VyHKgPqqEwLLDxV3on7dyVS2jxdnGdeRq7ZDZsn
         UUhM6pTJuekhq9P0iDJi0Nm0eCTtB2yYB7SonM9EUMpasZZ65tgooql2bMT7ANtoWs5s
         dVmP+WMT2TMTbQ3J1sqOR24yz97m+M/RAvLlmzK5jE5CKNdMVuf7Ctf7Pee76upe+zV9
         NMmA==
X-Gm-Message-State: AC+VfDznaXXcGdhiNbMckcp9298CkTuM9ifiVR9CW4JL3xut4HFZsIFa
        SEc0skZViZTbnXRRs9jbP5PcgsOwodBAZI6uV28=
X-Google-Smtp-Source: ACHHUZ5i1BVHpXVDIEhb2skg7ja9WfJxN/vbAYrCOckVTX31ArB0mO+iUW6nFeRen41NjCQEQSOjgq2tDHET0NKxuwI=
X-Received: by 2002:aca:efd5:0:b0:38e:ca21:db29 with SMTP id
 n204-20020acaefd5000000b0038eca21db29mr1922386oih.27.1686273311816; Thu, 08
 Jun 2023 18:15:11 -0700 (PDT)
MIME-Version: 1.0
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 8 Jun 2023 18:15:00 -0700
Message-ID: <CAF6AEGufjVZRNT6YfQ7YUXFC7Cz95wdLF7QHAYkiGfp+3Xc3DQ@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-fixes-2023-06-08 for v6.4-rc6 [resend]
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
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dave,

(retry of previous PR with missing s-o-b corrected but otherwise identical)

A few late fixes for v6.4.. meant to send this out last week but got
distracted setting my new x13s.

The following changes since commit 5c054db54c43a5fcb5cc81012361f5e3fac37637:

  drm/msm: Be more shouty if per-process pgtables aren't working
(2023-05-17 08:53:47 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-fixes-2023-06-08

for you to fetch changes up to 12abd735f0300600bfc01b2a3832b966312df205:

  drm/msm/a6xx: initialize GMU mutex earlier (2023-06-08 18:10:51 -0700)

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
