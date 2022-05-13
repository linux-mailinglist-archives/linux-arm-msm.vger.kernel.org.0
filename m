Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE088526AF7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 May 2022 22:08:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1384047AbiEMUHy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 May 2022 16:07:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344906AbiEMUHx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 May 2022 16:07:53 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED5C5E72
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 13:07:50 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id ba17so11207221edb.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 13:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VjLYKQz9W+b9Ub9U9HIkTaFYWELaFcx+tDToyM0Q0Is=;
        b=Z8kJgkrl1ICP+BHtwk0Kv0Ik1kTt5soCfHi56pWTcJMzYbpRkqUX6jgW6iVpuM01bP
         dUCoGTDtoou29KeWoXgevvlN94X1JwMBX+3AxqZRfib5zFYYWhL3QUauNdrp4YwUf081
         Ei6HAkxKxBgT9UY+3J7C2pJspiT8AMzk0Axq8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VjLYKQz9W+b9Ub9U9HIkTaFYWELaFcx+tDToyM0Q0Is=;
        b=ldo6Zu6tHlcT+CVjp/G0c4YUu1GRpgJwf7y7m1MK5eSO3CQklGUsdEVstkwCDYP/uI
         rtqyu9oezq6oMYbNgs3qhMWnqLwuGmCMkh4TMlJ7Ef20IwZV3431/yW9Jam7oZDJfECr
         nT1YM5jq9gFrBflbxFpRpskkKmz+fXyztjXqTy3O7CFaVDvnUYeMwcdGf7z6AYDwrrcO
         UEXt+hpIIvh+9nkawSs6UZxg0SImRmJYxbmAF/udHcLrUORTvxdDZGzP5JWTO2R0lO+t
         TYcT17Rsb7/CPCoWNaagtlOimmdg0NMfaiVI5HzzNX5AVvUUBE4vqjkgbgC13O26a9To
         niIQ==
X-Gm-Message-State: AOAM532ryTxEKzD+xPyyFHcRJtiiWbDLQe2G8OH4zE+UZZyq9ztOCJqc
        eN9DNhGIVaoEW4xfYUUb2eGcViGT6Mn3SY+pq8o=
X-Google-Smtp-Source: ABdhPJzL/XgG6hbXOyJaFU419RGZTLUTjhRRJny6hsEKcQc3ihekB6LaNZ2UCrtgYGxm+C3ZpSLgKg==
X-Received: by 2002:a05:6402:350f:b0:428:43a1:647d with SMTP id b15-20020a056402350f00b0042843a1647dmr395367edd.62.1652472469119;
        Fri, 13 May 2022 13:07:49 -0700 (PDT)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com. [209.85.221.54])
        by smtp.gmail.com with ESMTPSA id yl15-20020a17090693ef00b006f3ef214de7sm1086089ejb.77.2022.05.13.13.07.48
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 May 2022 13:07:48 -0700 (PDT)
Received: by mail-wr1-f54.google.com with SMTP id e29so3113686wrc.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 13:07:48 -0700 (PDT)
X-Received: by 2002:a05:6000:c7:b0:20a:d8c1:d044 with SMTP id
 q7-20020a05600000c700b0020ad8c1d044mr5361193wrx.422.1652472467490; Fri, 13
 May 2022 13:07:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220510135101.v2.1.I31ec454f8d4ffce51a7708a8092f8a6f9c929092@changeid>
 <db7a2b7f-3c94-d45d-98fd-7fd0b181e6aa@suse.de> <CAD=FV=WoSTcSOB_reDbayNb=q7w00rd7p-zHUDt+evTkSjQ=2g@mail.gmail.com>
In-Reply-To: <CAD=FV=WoSTcSOB_reDbayNb=q7w00rd7p-zHUDt+evTkSjQ=2g@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 13 May 2022 13:07:35 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VbwkK-z8T-98aPSiybd2c94n8p46oBxY_MtPjV608YRQ@mail.gmail.com>
Message-ID: <CAD=FV=VbwkK-z8T-98aPSiybd2c94n8p46oBxY_MtPjV608YRQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/probe-helper: Default to 640x480 if no EDID
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        LKML <linux-kernel@vger.kernel.org>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "Abhinav Kumar (QUIC)" <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        "Aravind Venkateswaran (QUIC)" <quic_aravindh@quicinc.com>,
        "Kuogee Hsieh (QUIC)" <quic_khsieh@quicinc.com>,
        freedreno <freedreno@lists.freedesktop.org>
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

Hi,

On Wed, May 11, 2022 at 2:32 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Wed, May 11, 2022 at 12:14 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >
> > Hi
> >
> > Am 10.05.22 um 22:51 schrieb Douglas Anderson:
> > > If we're unable to read the EDID for a display because it's corrupt /
> > > bogus / invalid then we'll add a set of standard modes for the
> > > display. When userspace looks at these modes it doesn't really have a
> > > good concept for which mode to pick and it'll likely pick the highest
> > > resolution one by default. That's probably not ideal because the modes
> > > were purely guesses on the part of the Linux kernel.
> >
> > I'm skeptical. Why does the kernel do a better job than userspace here?
> > Only the graphics driver could possibly make such a decision.
> >
> > Not setting any preferred mode at least gives a clear message to userspace.
>
> OK, that's a fair point. So I tried to find out what our userspace is
> doing. I believe it's:
>
> https://source.chromium.org/chromium/chromium/src/+/main:ui/ozone/platform/drm/common/drm_util.cc;l=529
>
> Specifically this bit of code:
>
>   // If we still have no preferred mode, then use the first one since it should
>   // be the best mode.
>   if (!*out_native_mode && !modes.empty())
>     *out_native_mode = modes.front().get();
>
> Do you agree with what our userspace is doing here, or is it wrong?
>
> If our userspace is doing the right thing, then I guess the problem is
> the call to "drm_mode_sort(&connector->modes);" at the end of
> drm_helper_probe_single_connector_modes(). Would you be OK with me
> _not_ sorting the modes in the "bad EDID" case? That also seems to fix
> my problem...

I've implemented the "don't mark preferred, but don't sort" as a v3.
Hopefully it looks good.

https://lore.kernel.org/r/20220513130533.v3.1.I31ec454f8d4ffce51a7708a8092f8a6f9c929092@changeid

-Doug
