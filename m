Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA3D23548F8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Apr 2021 00:49:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236203AbhDEWt1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Apr 2021 18:49:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236204AbhDEWt1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Apr 2021 18:49:27 -0400
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E8ABC061756
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Apr 2021 15:49:20 -0700 (PDT)
Received: by mail-qk1-x735.google.com with SMTP id x14so13098306qki.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Apr 2021 15:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OkSbjhz6xE8syqTiE1aa5v0NU7tO6RjOafyM87apJUQ=;
        b=cEZ0emlAnQ59lWZQ+CG0PzBqUiA3jMclJ9ifiMjgtnYA9n3YdWwLkIrPhOa5quYpnt
         M68i+VH5GPO4Qf5To7C74KHAXG/1RoHeg3RH6+LYW/QU8o6nQJae0JV9l/0tF7tBGEPP
         9tP9PXQucIn3DQAOfRH4ai8PfXUkwOcNabYio1qEzrkINIJ1MM+swD7lTJ8uV54m8Tvk
         JL77Mbkehb8F8hPsEVCFJ9ednolHiRcQBU4V9OL4jLCRopJrH+FDfwOJAFlPujUXcGnK
         CAHRkaZPy98ofjK6exIuEgnLoTw3A/0//qbkoWZlX7vo9Zs1HF2WMUh3LhHQqTKFE6yj
         j64Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OkSbjhz6xE8syqTiE1aa5v0NU7tO6RjOafyM87apJUQ=;
        b=I2d4JSoSVqdGpOM8xcwkpZoPopVuZXXa4pod+oSjWYOObLDC2hybhoYVKHh5rl1AH9
         0VALec3XQ4hBCoxvkdSL48HeA5kcjRemW+TatFQv88YRpgvzPEXFNlcjMp9fODhLeHKP
         jMAPN3+HzbqxEx3r6P/vl+xGyDmACNPDmYJfVVSc6X8ZibWbaZPHUoHj7xamaCNJH9q0
         HXHOBvKa6GPysZ7oSLZ1cPb3bhMkBPhnmGjwGvIjam7Fx/vMaUJVZordpt1N6Gmx8gme
         WHPKL5lX5FYJAivdVe/ay2iUGZByit2243+Lp6LNda+e0SHnmpMjUGV4kgH7VBrBN2bA
         cBqg==
X-Gm-Message-State: AOAM530j4G6jNtqJJa2+iyYp3l1KdWEbWYJxbiod99H3q8eGRh+tqQAH
        ngzgUXmjQRENQIttk9jn1o7Q97NdsfHQ2kBcEAtlJw==
X-Google-Smtp-Source: ABdhPJx7BfYrPo/9BY8xtRLwUPd2M1lLpiXx9DfiWItGCW0F3eDMebsFZhl6jfdyG8XUZUMEcrJgIMFewmGMt9H3vFQ=
X-Received: by 2002:a37:a016:: with SMTP id j22mr26877448qke.486.1617662959432;
 Mon, 05 Apr 2021 15:49:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210405224743.590029-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20210405224743.590029-1-dmitry.baryshkov@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 6 Apr 2021 01:49:08 +0300
Message-ID: <CAA8EJpq_bTcAZUx0mcwFp4uURNoayVdGvbobt72hC2rrqRwGbA@mail.gmail.com>
Subject: Re: [PATCH v4 00/33] clk: qcom: cleanup sm8250/sdm845/sc7180 clock drivers
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 6 Apr 2021 at 01:47, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Cleanup several Qualcomm clock drivers by removing unused entries from
> parents map, removing test clock, etc.
>
> Changes since v3:
>  - Use ARRAY_SIZE() for num_parents and parent_hws instead of
>    parent_data where applicable as suggested by Marijn Suijten
>    These changes are applied both as a part of 'convert ot parent data'
>    patches and as separate changes to respective clock drivers (which
>    already used parent_data).
>
> Changes since v2:
>  - Comment out unsupported video_pll0_out_odd/_even clocks instead of
>    removing them or just using .name for them. The clocks are
>    unsupported, but mux values are provided for the future reference.
>
> Changes since v1:
>  - Remove unused entries from gpucc-sc7180, gpucc-sdm845, videocc-sc7180
>    and videocc-sm8150 drivers
>  - Restore video_pll0_out_odd/_even entries in videocc-sdm845 driver as
>    requested by Taniya Das.

For your convenience:

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  https://git.linaro.org/people/dmitry.baryshkov/kernel.git qcom-clk-cleanup

for you to fetch changes up to 576546d30f7df4813b0bb5874486f08f82f28ec1:

  clk: qcom: gcc-sm8350: use ARRAY_SIZE instead of specifying
num_parents (2021-04-05 23:48:03 +0300)

----------------------------------------------------------------
Dmitry Baryshkov (33):
      clk: qcom: dispcc-sc7180: drop unused enum entries
      clk: qcom: dispcc-sm8250: drop unused enum entries
      clk: qcom: gcc-sm8250: drop unused enum entries
      clk: qcom: gpucc-sc7180: drop unused enum entries
      clk: qcom: gpucc-sdm845: drop unused enum entries
      clk: qcom: gpucc-sm8150: drop unused enum entries
      clk: qcom: gpucc-sm8250: drop unused enum entries
      clk: qcom: videocc-sc7180: drop unused enum entries
      clk: qcom: videocc-sm8150: drop unused enum entries
      clk: qcom: videocc-sm8250: drop unused enum entries
      clk: qcom: dispcc-sdm845: convert to parent data
      clk: qcom: gpucc-sdm845: convert to parent data
      clk: qcom: videocc-sdm845: convert to parent data
      clk: qcom: gpucc-sdm845: get rid of the test clock
      clk: qcom: dispcc-sdm845: get rid of the test clock
      clk: qcom: videocc-sdm845: get rid of the test clock
      clk: qcom: dispcc-sc7180: use parent_hws where possible
      clk: qcom: dispcc-sm8250: use parent_hws where possible
      clk: qcom: gcc-sc7180: use parent_hws where possible
      clk: qcom: gcc-sc7280: use parent_hws where possible
      clk: qcom: gcc-sdx55: use parent_hws where possible
      clk: qcom: gcc-sm8150: use parent_hws where possible
      clk: qcom: gcc-sm8250: use parent_hws where possible
      clk: qcom: gcc-sm8350: use parent_hws where possible
      clk: qcom: gpucc-sm8150: use parent_hws where possible
      clk: qcom: gpucc-sm8250: use parent_hws where possible
      clk: qcom: videocc-sm8150: use parent_hws where possible
      clk: qcom: videocc-sm8250: use parent_hws where possible
      clk: qcom: gcc-sc7180: use ARRAY_SIZE instead of specifying num_parents
      clk: qcom: gcc-sc8180x: use ARRAY_SIZE instead of specifying num_parents
      clk: qcom: gcc-sm8150: use ARRAY_SIZE instead of specifying num_parents
      clk: qcom: gcc-sm8250: use ARRAY_SIZE instead of specifying num_parents
      clk: qcom: gcc-sm8350: use ARRAY_SIZE instead of specifying num_parents

 drivers/clk/qcom/dispcc-sc7180.c  |  70 ++++---
 drivers/clk/qcom/dispcc-sdm845.c  | 217 ++++++++++----------
 drivers/clk/qcom/dispcc-sm8250.c  | 124 ++++++-----
 drivers/clk/qcom/gcc-sc7180.c     | 196 +++++++++---------
 drivers/clk/qcom/gcc-sc7280.c     | 248 +++++++++++-----------
 drivers/clk/qcom/gcc-sc8180x.c    | 122 +++++------
 drivers/clk/qcom/gcc-sdx55.c      |   8 +-
 drivers/clk/qcom/gcc-sm8150.c     | 100 ++++-----
 drivers/clk/qcom/gcc-sm8250.c     | 345 ++++++++++++++++---------------
 drivers/clk/qcom/gcc-sm8350.c     | 418 +++++++++++++++++++-------------------
 drivers/clk/qcom/gpucc-sc7180.c   |   3 -
 drivers/clk/qcom/gpucc-sdm845.c   |  45 ++--
 drivers/clk/qcom/gpucc-sm8150.c   |   9 +-
 drivers/clk/qcom/gpucc-sm8250.c   |   9 +-
 drivers/clk/qcom/videocc-sc7180.c |   4 -
 drivers/clk/qcom/videocc-sdm845.c |  55 +++--
 drivers/clk/qcom/videocc-sm8150.c |  20 +-
 drivers/clk/qcom/videocc-sm8250.c |  30 ++-
 18 files changed, 991 insertions(+), 1032 deletions(-)


-- 
With best wishes
Dmitry
