Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E9387A26DC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Sep 2023 21:03:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232007AbjIOTD3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Sep 2023 15:03:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237082AbjIOTDP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Sep 2023 15:03:15 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B675A2D4C
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Sep 2023 12:02:36 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-d818d4230f6so2217251276.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Sep 2023 12:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694804556; x=1695409356; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=euz/IHIc0mhpSJvprvTibU0nvlspa5qnPH9if5eZjIU=;
        b=GhDNDZgzjkY7uroEzoTvMLvLvekeX52OO1wkLynYCawICliC+hFE61sl4spp4idvvQ
         DIyandwCWjvPXcAOoJudVV+xh5+a9bQubWQbP6l5YVUujbeGn1u/uXHhpSDuXSbj6ygW
         9Gau4B4+n9PfjmdkQJC+OLL8saqedv3l+yj5P2xLCSxmqkK/KlEBpGgwhQsLer3U14ro
         vUXuh5nOjfnT5B+kjAv6hVCdzQH0fJkXkwMdP0nYb0+ANsn8Dal3Hs6630ZlKVScPBMo
         wEb4PMGkpAYwE0HsS5OU9XS/P255SbJLIyI0B8KATIhsw5I0Ln2juQNsoLZUZB9AB3wP
         yHjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694804556; x=1695409356;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=euz/IHIc0mhpSJvprvTibU0nvlspa5qnPH9if5eZjIU=;
        b=XkWHGfAfZIX60qD1wyB6J/rXlI6swH1J+wGkogQqgI9ftC+WJ+S0hKFDV/mOFvXeci
         uM+XkU4KFZjmPvFhvykGc/mUf3wLfG2AgOPsCcFjrMeskzMHBgPxL8YWA1p7l4gHCSLS
         4QFy0uAlTvLsJkFLC576PlCjxjR82iaTGaSbZ2yAE+3Gg/P2rE9EdrB1Y651HIzBs6eF
         wgYMzrOXqa89mGw+wgeQwjHoz9JyxgdxUGWuQ6YnPczxmR2MJf/YLTBP35dOFWbMX8f5
         V73cy3Xv2tOwhUk6dFrwb6UmN+Z72CmSZOa5w7sR4MG7HEn0pK2+UTWp1GJXeeuWYmFV
         lzEg==
X-Gm-Message-State: AOJu0YzNQ+iIEANxuZryW4Zxabn9FmrpRRoQuurUt/zuM468gCaB4hNt
        wCZaKZEvA4VcR2eXVS7TQ8JICPZ0ky2JZ3oRwr55PQ==
X-Google-Smtp-Source: AGHT+IHjvbgo6WAOZyaLXnz4gisXVihpdX/YxZz482tKbWXr6KliN8j5UIIdtWwak5bLhfxaD9Fmf6SeDLlP6dEFAas=
X-Received: by 2002:a25:8250:0:b0:d81:43ea:d018 with SMTP id
 d16-20020a258250000000b00d8143ead018mr2631057ybn.42.1694804555819; Fri, 15
 Sep 2023 12:02:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230915183010.32077-1-quic_abhinavk@quicinc.com>
In-Reply-To: <20230915183010.32077-1-quic_abhinavk@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 15 Sep 2023 22:02:24 +0300
Message-ID: <CAA8EJpp-eK1spEBSJtT0YtRkJtSL6MWPyxN5c4AB-1MJMJXs9A@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dsi: skip the wait for video mode done if not applicable
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, Hai Li <hali@codeaurora.org>,
        dri-devel@lists.freedesktop.org, quic_jesszhan@quicinc.com,
        quic_parellan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 15 Sept 2023 at 21:30, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> dsi_wait4video_done() API wait for the DSI video mode engine to
> become idle so that we can transmit the DCS commands in the
> beginning of BLLP. However, with the current sequence, the MDP
> timing engine is turned on after the panel's pre_enable() callback
> which can send out the DCS commands needed to power up the panel.
>
> During those cases, this API will always timeout and print out the
> error spam leading to long bootup times and log flooding.
>
> Fix this by checking if the DSI video engine was actually busy before
> waiting for it to become idle otherwise this is a redundant wait.
>
> Fixes: a689554ba6ed ("drm/msm: Initial add DSI connector support")
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 0c4ec0530efc..31495e423c56 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -1075,9 +1075,21 @@ static void dsi_wait4video_done(struct msm_dsi_host *msm_host)
>
>  static void dsi_wait4video_eng_busy(struct msm_dsi_host *msm_host)
>  {
> +       u32 data;
> +
> +       data = dsi_read(msm_host, REG_DSI_STATUS0);
> +
>         if (!(msm_host->mode_flags & MIPI_DSI_MODE_VIDEO))
>                 return;

We can probably skip reading REG_DSI_STATUS0 if the host is in CMD mode.
LGTM otherwise.

>
> +       /* if video mode engine is not busy, its because
> +        * either timing engine was not turned on or the
> +        * DSI controller has finished transmitting the video
> +        * data already, so no need to wait in those cases
> +        */
> +       if (!(data & DSI_STATUS0_VIDEO_MODE_ENGINE_BUSY))
> +               return;
> +
>         if (msm_host->power_on && msm_host->enabled) {
>                 dsi_wait4video_done(msm_host);
>                 /* delay 4 ms to skip BLLP */
> --
> 2.40.1
>


-- 
With best wishes
Dmitry
