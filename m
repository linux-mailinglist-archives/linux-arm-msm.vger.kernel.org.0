Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34B98432918
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Oct 2021 23:34:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229529AbhJRVgY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Oct 2021 17:36:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229524AbhJRVgY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Oct 2021 17:36:24 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7460C06161C
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Oct 2021 14:34:12 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id e3so43544428wrc.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Oct 2021 14:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=T0jbfDzJhAYd0E08unfXmLsF1SeJ11JRZ9S7Xu6DDhA=;
        b=Ap4Sec0h0DHf5IaMMymV165P9PD7vk5os+9JkSO2YPCQiD1tKgErEELDtFHBK6LN7y
         OhJONaKS39EMam+tjxYM4sR9D318mrT4YHuUmGDo+dAGqKgoevFztXfR4TwiTLb3xxlv
         LtZ2x5OMONacvjDCPcskcsevkG17TpoUZjW+MixCxKWnbRU8GBHTGQIsC8KYxF5QYKsN
         q27A7Li37de3wnukyYkA9E969mlofeq9TmCT7Z1cy3KeUnda4s8VPQBuZgfK+vi6amIX
         sfWG38lTXe2PiftbMojT22O+KODUIbVOKcoeG9zuwND8BrjP3ZObkZ4WiRO3NdqCOhe6
         CDTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=T0jbfDzJhAYd0E08unfXmLsF1SeJ11JRZ9S7Xu6DDhA=;
        b=WaITVVntZ8cICD2JAyeb9lsTIe1isd5Uhepa8ZqhdHdC8qBtOM0JawC7+L2+XPy0AV
         X1gJPvwl0qZ+ymbtUSWzQKU1n62yTLJJJp+ttqXrh4zAJX/OMGOwwen+zfrTqZYFPvLq
         b1DHY3YJyIqkEzmVYt+Bdq8vZP6HHJq6M2h/Irod9QsvaJVuVEjiMjAtIfgKRFIi/oMA
         unj2eXBJDhbP2PKO6U0vpR8TWe2QvrFMWjGzqB/mTvzH+dnYjS+J03UDIN8ifJyZ+5Xh
         NbVAkmO1YGGYxHBBPDA4ZScoCuDnLHxWTuDVgoDn7yMpBwedPYaIFnBszlfDqRpizL2a
         nzbw==
X-Gm-Message-State: AOAM531eRZf/cM5STXs7K0Eb9XH/MSYmC3puFmtb+6R114vgcWX7qlEt
        V4a/Qp9WuBKUnFLS934uMns002xWPSXRrR1cl0g=
X-Google-Smtp-Source: ABdhPJw0IclkSarK4jj7Q6U+Oj1MJqGgjHDd5sF7mnnCra0vsssJR4GhC5Ky4Zwpe9LcQwMeFo1ews/EDBUMvl1/0kg=
X-Received: by 2002:adf:bbd1:: with SMTP id z17mr38272312wrg.61.1634592851221;
 Mon, 18 Oct 2021 14:34:11 -0700 (PDT)
MIME-Version: 1.0
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 18 Oct 2021 14:38:50 -0700
Message-ID: <CAF6AEGs1WPLthmd=ToDcEHm=u-7O38RAVJ2XwRoS8xPmC520vg@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-fixes-2021-10-18
To:     Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dave & Daniel,

One more fix for v5.15, to work around a power stability issue on a630
(and possibly others)

The following changes since commit c8f01ffc83923a91e8087aaa077de13354a7aa59:

  drm/msm/dsi: fix off by one in dsi_bus_clk_enable error handling
(2021-10-11 17:30:54 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git drm-msm-fixes-2021-10-18

for you to fetch changes up to 5ca6779d2f18b195cb3b66a14a271911fc609094:

  drm/msm/devfreq: Restrict idle clamping to a618 for now (2021-10-18
14:31:57 -0700)

----------------------------------------------------------------
Rob Clark (1):
      drm/msm/devfreq: Restrict idle clamping to a618 for now

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 7 +++++++
 drivers/gpu/drm/msm/msm_gpu.h         | 4 ++++
 drivers/gpu/drm/msm/msm_gpu_devfreq.c | 3 ++-
 3 files changed, 13 insertions(+), 1 deletion(-)
