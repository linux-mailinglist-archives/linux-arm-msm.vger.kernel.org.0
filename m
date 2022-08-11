Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BDAE58F510
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Aug 2022 02:09:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232655AbiHKAJE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Aug 2022 20:09:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230118AbiHKAJE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Aug 2022 20:09:04 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 727347FE5F
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Aug 2022 17:09:03 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id s199so13801324oie.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Aug 2022 17:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc;
        bh=C16lQ11m+Fol+4L80u44mbuXPnmczf0UX1lY5QRXlHs=;
        b=lnof+J9e73sWWV2P76DkdnT/flxhdLwzk6IjqWOzztc2OWwFBmRuRmO2scHgZk3CBq
         GRV169KOmILKU6IlpvWyXSKDwR7qOjbfJwa2NoYWM/DdvVcl/tQTqR2YaOqa4BF3SFQ9
         7NAdg4han2f2MPvoMjGoseen/7yjFmViBjY5U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc;
        bh=C16lQ11m+Fol+4L80u44mbuXPnmczf0UX1lY5QRXlHs=;
        b=1tT2d6mMgvANgVVs9LTHtghAXAmNoCZiJzloK4DzUnAaMWemf1zNwGbyzBJ6rreUDb
         5lCzu5Cr64ZbiTKj4VGPBxe/TwRK497ylr8IK+DeZhS7l18nm4/JKu6JbJsuvqAZFqhj
         PYZh2IRNK+iVtde+9srqbE/0ocq2ysCovLNKAxYCuLcXi0QuhBskoItd8B1VeG1kaKGJ
         D5xhrX9PNjNv+cYmAR0Pjgl/xHDgH0i7jMvr1kChG+3ObCrL27a3Fhu7cmfwq7qfvRyB
         kS5fzqtL0G+djk/K38iV810XzAY95aUT1HKEe7Gj0jIYGtOkYlXcWtGvx7KUaBz9Ss/C
         5Lqg==
X-Gm-Message-State: ACgBeo0xaSZmMBSxJ479LqxffJ4HoLKCY4KwvGlf97MN9qNC9VlqWT0l
        O/aLrkcsr5bgRaEUfTZ1aA9h2avdX4xy2VnZ0Myx9Q==
X-Google-Smtp-Source: AA6agR7F6LqzTmmYZL1w8+YTn3rn4S/SBFkTvVsA8yDgkZNAItYJ9GAkZkPgvUPtLX/4083aPvTD7sMBZqfcFrz/tj4=
X-Received: by 2002:a05:6808:1389:b0:33a:bd16:c4e4 with SMTP id
 c9-20020a056808138900b0033abd16c4e4mr2311696oiw.0.1660176542614; Wed, 10 Aug
 2022 17:09:02 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 10 Aug 2022 19:09:02 -0500
MIME-Version: 1.0
In-Reply-To: <dbda8bce-2890-e5e3-4052-073a52eb06a6@quicinc.com>
References: <1660159551-13828-1-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n533SUb3Bg=pR8Fhwo-M5qLWiti4nzLR-rSGVAsrXgEYNQ@mail.gmail.com> <dbda8bce-2890-e5e3-4052-073a52eb06a6@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 10 Aug 2022 19:09:02 -0500
Message-ID: <CAE-0n51NyrP8CikcK_3wj4EEsurmmSZ4RY3pLhJJmkY2_8wNZw@mail.gmail.com>
Subject: Re: [PATCH v3] drm/msm/dp: check hpd_state before push idle pattern
 at dp_bridge_disable()
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org,
        airlied@linux.ie, bjorn.andersson@linaro.org, daniel@ffwll.ch,
        dianders@chromium.org, dmitry.baryshkov@linaro.org,
        robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
Cc:     quic_abhinavk@quicinc.com, quic_aravindh@quicinc.com,
        quic_sbillaka@quicinc.com, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2022-08-10 16:57:51)
>
> On 8/10/2022 3:22 PM, Stephen Boyd wrote:
> > Quoting Kuogee Hsieh (2022-08-10 12:25:51)
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> >> index b36f8b6..678289a 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> >> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> >> @@ -1729,10 +1729,20 @@ void dp_bridge_disable(struct drm_bridge *drm_bridge)
> >>          struct msm_dp_bridge *dp_bridge = to_dp_bridge(drm_bridge);
> >>          struct msm_dp *dp = dp_bridge->dp_display;
> >>          struct dp_display_private *dp_display;
> >> +       u32 state;
> >>
> >>          dp_display = container_of(dp, struct dp_display_private, dp_display);
> >>
> >> +       mutex_lock(&dp_display->event_mutex);
> >> +
> >> +       state = dp_display->hpd_state;
> >> +       if (state != ST_DISCONNECT_PENDING && state != ST_CONNECTED) {
> > It's concerning that we have to check this at all. Are we still
> > interjecting into the disable path when the cable is disconnected?
>
> yes,
>
> The problem is not from cable disconnected.
>
> There is a corner case that this function is called at drm shutdown
> (drm_release).
>
> At that time, mainlink is not enabled, hence dp_ctrl_push_idle() will
> cause system crash.

The mainlink is only disabled when the cable is disconnected though?

Let me put it this way, if we have to check that the state is
"connected" or "disconnected pending" in the disable path then there's
an issue where this driver is being called in unexpected ways. This
driver is fighting the drm core each time there's a state check. We
really need to get rid of the state tracking entirely, and make sure
that the drm core is calling into the driver at the right time, i.e.
bridge disable is only called when the mainlink is enabled, etc.
