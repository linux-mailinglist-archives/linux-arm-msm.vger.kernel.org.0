Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA56654FE2F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jun 2022 22:16:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231890AbiFQUPZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jun 2022 16:15:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229794AbiFQUPY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jun 2022 16:15:24 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 886035C64D
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 13:15:23 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id c3-20020a9d6843000000b0060c2c63c337so3874532oto.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 13:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=x4as2ZkeTzWY1neBp0pSqFxYj7FvUKGmqCj9lFfh46Y=;
        b=jL9i7Buk6SOOHObeThBYqPreYlCVl+OpGSR+jNZBMrSfoB1QYntFn3u6z+nJTvigce
         VBwenMjhFopuHqns/67g6yQAunM9l/71QNfBId3EqQ2MflO/F5EKVaC7RRlQ/ADStdG5
         2smcG2mIm1zKF2VFUSfELh3VT3Zvt/s+Ubv68=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=x4as2ZkeTzWY1neBp0pSqFxYj7FvUKGmqCj9lFfh46Y=;
        b=ekWyTGfakwoaoiXDCUYMh0HMeIwatN7WfLxo+u6Ca0sye/DHq8YrU1DaPkwqnZ+LFP
         27TKvxgExMqaw27/syDMeyv3Rwl5XqWsMyQFIERdQ6vvzfREq1u0BVFuAW28xK/t29iq
         FNE8sftPQkTceA63PKLmpEy801Cct1qU0Zbk87mtQXdU6ap+tKVYYmdrIhu7tvvPNLQ3
         X/p2VDA/W8LaafItrA4RsjY7smNQyYFNpBAHjsoPfZFGA8Jr6Z55K7UHqzglqf6wZTpe
         HoCKHZVv9ol7Qa8XTTmmMaepvr8XW/eUxdvPqqTvEQCv6bFfO/jXLeoELUg5RRZsFv3s
         VZ5A==
X-Gm-Message-State: AJIora+kknwaHSHW662AO4yGR7zj2HsMZyZz79+LEY7nDzhuDP6ZL3m6
        ITOO0TmzWdoWDl8ma6zO20qVK3obCoifP4G4yi5ADA==
X-Google-Smtp-Source: AGRyM1u4nMHweik4URlw+DCJbLUl0w+UrlWDIBvKtDehatittlrFKAJ8bL5+y6eZyKP4hA1WsTKrT7WnEl7enizsIq4=
X-Received: by 2002:a9d:6484:0:b0:60b:eb0b:4054 with SMTP id
 g4-20020a9d6484000000b0060beb0b4054mr4702235otl.159.1655496922910; Fri, 17
 Jun 2022 13:15:22 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 17 Jun 2022 13:15:22 -0700
MIME-Version: 1.0
In-Reply-To: <20220617194921.1098725-2-dmitry.baryshkov@linaro.org>
References: <20220617194921.1098725-1-dmitry.baryshkov@linaro.org> <20220617194921.1098725-2-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Fri, 17 Jun 2022 13:15:22 -0700
Message-ID: <CAE-0n51vDC-a=87hbM_rvxhNNV7KNpCHy3=wH0N5VCEvdrjyuw@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/msm/dp: remove dp_display_en/disable prototypes
 and data argument
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-06-17 12:49:21)
> Remove unused dp_display_en/disable prototypes. While we are at it,
> remove extra 'data' argument that is unused.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 1e34ac2126f6..42ceb4c5796c 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -607,9 +607,6 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
>         return 0;
>  };
>
> -static int dp_display_enable(struct dp_display_private *dp, u32 data);
> -static int dp_display_disable(struct dp_display_private *dp, u32 data);
> -

This part looks good.

>  static void dp_display_handle_plugged_change(struct msm_dp *dp_display,
>                 bool plugged)
>  {
> @@ -856,7 +853,7 @@ static int dp_display_set_mode(struct msm_dp *dp_display,
>         return 0;
>  }
>
> -static int dp_display_enable(struct dp_display_private *dp, u32 data)
> +static int dp_display_enable(struct dp_display_private *dp)

This will conflict with Kuogee's patch[1]

>  {
>         int rc = 0;
>         struct msm_dp *dp_display = &dp->dp_display;

[1] https://lore.kernel.org/r/1655411200-7255-1-git-send-email-quic_khsieh@quicinc.com
