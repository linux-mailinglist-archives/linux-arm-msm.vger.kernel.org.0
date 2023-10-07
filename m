Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 872167BC731
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Oct 2023 13:35:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233669AbjJGLfE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 7 Oct 2023 07:35:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233662AbjJGLfD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 7 Oct 2023 07:35:03 -0400
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46B76109
        for <linux-arm-msm@vger.kernel.org>; Sat,  7 Oct 2023 04:34:59 -0700 (PDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-59f4f80d084so34639997b3.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Oct 2023 04:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696678498; x=1697283298; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jSGXM9PaTj8Iqla8u7waxHlJMDX8neA9/CvBL3oU1vs=;
        b=BZ0n+EIsozhQJCo+1e4QkR8gcdJOuLEovFba0HMuDHb/5c3CZXx9iYo4rSBeeYPHfN
         9Jvi3SjDpj2j/H1B3ngDnMcsoml3nYZbKW/Jqz/MnTVFmcUcx28Jo+QVwxI4Nu1i8JW+
         SN84x+oo0ZJa2FYf/A+EzK9Cw6IAzYqZYk/uBlWDKJfORR2jFs05C3xAkKFpjXzpz+oG
         8YPSGBMElaLrCHs8hd/fSLLA2s6kZlPUyFmNweUoScWr74kySQ+4NzX849Cpkg7C3S1u
         fncsSmAAUk4IQvPYu0FrVXnKXUNb+rOz5ZEKPZNquIZLi6lzrJVG862ButOYtxNCG+N0
         7F2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696678498; x=1697283298;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jSGXM9PaTj8Iqla8u7waxHlJMDX8neA9/CvBL3oU1vs=;
        b=pDckIyM6Sxg0fWK0nkfgJmx3UTjHHtRijIvLyNZ3yDJ8SyJ5714/KsKT2/ChJaw2fu
         +5JwhGoB7y8yWa7ldzBPdNGC49buJkktiaG/0Aikxcr8+Vqt2vjIqFUqVVhw8Q4ebN52
         LPM0VNn9E5g31OpxJ+ESphZH+LV11o0A4hmjIq303EaXbLC9tTB3p8swKPmuvQLBPoJC
         NNRSCpUc+h60qH6zJS35lH8hqqqybGg3OOGFDzZ9SMyixQ0wVie2TgBu399+0K1qjqiV
         ckTYfVD2Xbv5SET/gMiy0XKxfa0OCj4BDZWI+LS8Nrv7TSXVLzSByMth/rG+zTGcdx9Y
         fuDg==
X-Gm-Message-State: AOJu0YzIG7NyChdAyQhxeVhDV8mAvxwJP6EZP51QDV9989H8vu8k0ttz
        nvWv2JelILx3riiDMZy9/v/UwRkz5MFeVQ5Hj1D10evlEVS4oYaF4xpxPZF6
X-Google-Smtp-Source: AGHT+IHKG97Lbeo+UsrdR1nmTFCgOqLGW2T7I5kZ+QxpgcEZM+JxKgbJ1VtzfFGONuwMVUMAzhcrWeC5dW14K+7atQ8=
X-Received: by 2002:a81:7b8a:0:b0:59b:c805:de60 with SMTP id
 w132-20020a817b8a000000b0059bc805de60mr10110241ywc.45.1696678498310; Sat, 07
 Oct 2023 04:34:58 -0700 (PDT)
MIME-Version: 1.0
References: <1696632910-21942-1-git-send-email-quic_khsieh@quicinc.com> <1696632910-21942-5-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1696632910-21942-5-git-send-email-quic_khsieh@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 7 Oct 2023 14:34:47 +0300
Message-ID: <CAA8EJpocnfaoJ9syC8YahfwgRad7sCEhJx_njEVpkY66HSMvOA@mail.gmail.com>
Subject: Re: [PATCH v7 4/7] drm/msm/dp: move parser->parse() and
 dp_power_client_init() to probe
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc:     dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, swboyd@chromium.org, dianders@chromium.org,
        vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
        agross@kernel.org, andersson@kernel.org, quic_abhinavk@quicinc.com,
        quic_jesszhan@quicinc.com, quic_sbillaka@quicinc.com,
        marijn.suijten@somainline.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 7 Oct 2023 at 01:55, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> Original both parser->parse() and dp_power_client_init() are done at
> dp_display_bind() since eDP population is done at binding time.
> In the preparation of having eDP population done at probe() time,
> move both function from dp_display_bind() to dp_display_probe().
>
> Changes in v6:
> -- move dp_power_client_deinit() to remove()
>
> Changes in v5:
> -- explain why parser->parse() and dp_power_client_init() are moved to
>    probe time
> -- tear down sub modules if failed
>
> Changes in v4:
> -- split this patch out of "incorporate pm_runtime framework into DP
>    driver" patch
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 24 +++++++++++++-----------
>  1 file changed, 13 insertions(+), 11 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
