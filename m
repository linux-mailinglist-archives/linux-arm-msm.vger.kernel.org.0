Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24F2B35EB64
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Apr 2021 05:17:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346904AbhDNDRZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Apr 2021 23:17:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346897AbhDNDRY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Apr 2021 23:17:24 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9ADCC061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Apr 2021 20:17:03 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id nm3-20020a17090b19c3b029014e1bbf6c60so5878257pjb.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Apr 2021 20:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=UyWa4apo3TOwjYMjSQh4reAE84rIdbfCEBEygOg3904=;
        b=dpee4gxvPllwyK85S+W/u7eMJLRfSQ+uwClt/aapdhbdlHZGhWOGPRlJePeQGICFEL
         je7oTUk+b7fhD2sJ2AQTGcVkYsNvMoMyt05wpLo6FZv4lDwM3UhCzxvKiLBUWbWp6fMX
         LuZuKnH3eWPDRtTUVlY7iNwkZDEuDuTNNirRc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=UyWa4apo3TOwjYMjSQh4reAE84rIdbfCEBEygOg3904=;
        b=jB+JUO1lggDGnsBoMdgU7YNNaGoFN7N7I9DUW0zulWB0g+Da44raPZ7NhHF1MTI8eA
         3/HZ0K3nZHrYDVAPKOzJFn2x3UXMegPw3JMph1hx2tCJl25CoHWSGw4OuQRqsL2xQiKF
         05b8u6W2aUmwsVyvLMVJILmX6GtHpOwPeNHTVdog9M3AACiZ3z7inPTC1cA1WNhEwvVH
         6fZmdwGUmki5xQ++bBjplsPzIhAg9lfQhigo3Fjx9mCJXBIZiyhGSr7v0e/hI3EfKa2c
         MdWBLJp2V8Sp0XAsJ8mAPsl7c0RwUgRMbozeE20UwsU74bMbSf55w7+Kis7c7dRHaRRL
         HFHg==
X-Gm-Message-State: AOAM530BpH1UENfXOz4JiYGZhQY/TNW19LEcAMLjSKAVvWtzPpHrXPSc
        fkLRvaVGHsyebD9cgSSGScMo7Q==
X-Google-Smtp-Source: ABdhPJxG8gJn4/9Tdm2GnwnYN6cg36Ox7phGHtV14+oMYkxG3dWfNU0i/W1zwe2CYbxOe2Z31HRSWQ==
X-Received: by 2002:a17:902:8f8d:b029:ea:e059:84a6 with SMTP id z13-20020a1709028f8db02900eae05984a6mr17306846plo.35.1618370223402;
        Tue, 13 Apr 2021 20:17:03 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:1d18:a339:7993:e548])
        by smtp.gmail.com with ESMTPSA id u24sm128634pga.78.2021.04.13.20.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 20:17:02 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1618355490-5292-1-git-send-email-khsieh@codeaurora.org>
References: <1618355490-5292-1-git-send-email-khsieh@codeaurora.org>
Subject: Re: [PATCH v2 2/3] drm/msm/dp: do not re initialize of audio_comp at display_disable()
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     tanmay@codeaurora.org, abhinavk@codeaurora.org,
        aravindh@codeaurora.org, khsieh@codeaurora.org, airlied@linux.ie,
        daniel@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
To:     Kuogee Hsieh <khsieh@codeaurora.org>, robdclark@gmail.com,
        sean@poorly.run
Date:   Tue, 13 Apr 2021 20:17:01 -0700
Message-ID: <161837022104.3764895.807226402876043006@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2021-04-13 16:11:30)
> At dongle unplug, dp initializes audio_comp followed by sending disconnect
> event notification to audio and to make sure audio had shutdown completely
> by wait for audio completion notification at display_disable(). This patch

Is this dp_display_disable()? Doubtful that display_disable() is the
function we're talking about.

> will not re initialize audio_comp at display_disable() if audio shutdown
> is triggered by dongle unplugged.

This commit text seems to say the why before the what, where why is "dp
initializes audio_comp followed by sending disconnect.." and the what is
"this patch will no re-initialized audio_comp...". Can you reorder this
so the what comes before the why?

>=20
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp=
/dp_display.c
> index 0ba71c7..1d71c95 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -894,8 +894,10 @@ static int dp_display_disable(struct dp_display_priv=
ate *dp, u32 data)
>         /* wait only if audio was enabled */
>         if (dp_display->audio_enabled) {
>                 /* signal the disconnect event */
> -               reinit_completion(&dp->audio_comp);
> -               dp_display_handle_plugged_change(dp_display, false);
> +               if (dp->hpd_state !=3D ST_DISCONNECT_PENDING) {
> +                       reinit_completion(&dp->audio_comp);

Why is this reinitialized here at all? Wouldn't it make more sense to
initialize the completion once at cable plug in and then not initialize
the completion anywhere else? Or initialize the completion whenever
dp_display->audio_enabled is set to true and then only wait for the
completion here if that boolean is true? Or initialize the completion
when dp_display_handle_plugged_change() is passed true for the 'plugged'
argument?

I started reading the code and quickly got lost figuring out how
dp_display_handle_plugged_change() worked and the interaction between
the dp display code and the audio codec embedded in here. There seem to
be a couple of conditions that cut off things early, like
dp_display->audio_enabled and audio->engine_on. Why? Why does
dp_display_signal_audio_complete() call complete_all() vs. just
complete()? Please help! :(

> +                       dp_display_handle_plugged_change(dp_display, fals=
e);

I think it's this way because dp_hpd_unplug_handle() is the function
that sets the hpd_state to ST_DISCONNECT_PENDING and then reinitializes
the completion (why?) and calls dp_display_handle_plugged_change(). So
the commit text could say that reinitializing the completion again here
at dp_display_disable() is racing with the audio code in the case that
dp_hpd_unplug_handle() already called
dp_display_handle_plugged_change() and it would make more sense. But the
question still stands why that race even exists in the first place vs.
initializing the completion variable in only one place unconditionally
when the cable is connected, in dp_hpd_plug_handle() or
dp_display_post_enable().

> +               }
>                 if (!wait_for_completion_timeout(&dp->audio_comp,
>                                 HZ * 5))
>                         DRM_ERROR("audio comp timeout\n");
