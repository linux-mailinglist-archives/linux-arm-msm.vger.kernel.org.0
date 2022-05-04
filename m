Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B68F51A2AF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 May 2022 16:54:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351559AbiEDO5v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 May 2022 10:57:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351564AbiEDO5s (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 May 2022 10:57:48 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF8D2222B6
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 May 2022 07:54:11 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id g20so1988382edw.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 May 2022 07:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3CqMewY2qLhNoVYy8pnABiQEXDBLwdmzuZuCQ9llcqA=;
        b=JIZF4JLztNOcNEo4SWDoc3uVBUY3XVnnSRMHtEmNqfbINrHZhs+RqZgaXWlLYQJKBz
         45bRnisHROq/k5C6gSZLnuw+1KoJTn9/H2tf+974HGCcSzHB5rcmKSJEgIto4cJK9HKy
         8MAoyaI0cOrY6W4KqDLMFN54Jrif7hydeiZrQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3CqMewY2qLhNoVYy8pnABiQEXDBLwdmzuZuCQ9llcqA=;
        b=s2j13sqslYEQCq+5NuwVCSadHn6ph1+tCYGQVG4g2FIsjc1kRoKBOujeXR1upIsUl1
         FsrAgJUQqaDGyv94X4g8JfOvdTA3Q4IhDb/v/O5JGkT6SSTPByYXYUTWGeAtEqrljoYN
         9ZhvE+EndxgrdPRpVogH+hecMG4j7gDwP3c+UIWrkefto1a073hJOfowsDiqMjeFwyWk
         qnTmOvmaX6KbnpC4Mwnmx9o3N+JFZfpXCE8dG2LSc+4L24Q1WIzgaBPb5Rsrknt1qBnb
         p2vSDtkphxHN/oxL1ijjVMnG90BXlhbWdTUMihdQVxKRHFb/u5VSQNdoQam/S3IDi1fe
         EiZg==
X-Gm-Message-State: AOAM531/qq8Y55qPEzz7ANAaNzuBg44lLSNK02cpS2esSnsuAgu/LXHU
        V6bX+WHxMQIXyuaN3ttMH0hFzynsd1oKnljyA6o=
X-Google-Smtp-Source: ABdhPJwAEIW7i34mkX84ne0HwzvzGZuUAFlymVCQVT7wJXy9HrK20hMu2BY8qXgOI8gKB34BvRnI5g==
X-Received: by 2002:aa7:d751:0:b0:425:d38c:41a1 with SMTP id a17-20020aa7d751000000b00425d38c41a1mr23201076eds.162.1651676050030;
        Wed, 04 May 2022 07:54:10 -0700 (PDT)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com. [209.85.221.46])
        by smtp.gmail.com with ESMTPSA id de53-20020a1709069bf500b006f3ef214e77sm5690973ejc.221.2022.05.04.07.54.06
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 May 2022 07:54:08 -0700 (PDT)
Received: by mail-wr1-f46.google.com with SMTP id b19so2365342wrh.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 May 2022 07:54:06 -0700 (PDT)
X-Received: by 2002:a5d:6d09:0:b0:20c:53a9:cc30 with SMTP id
 e9-20020a5d6d09000000b0020c53a9cc30mr15857966wrq.513.1651676045944; Wed, 04
 May 2022 07:54:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220503224029.3195306-1-dianders@chromium.org>
 <20220503153850.v2.1.I4182ae27e00792842cb86f1433990a0ef9c0a073@changeid> <d4541684-337f-4c3f-fafa-a883be370c0e@linaro.org>
In-Reply-To: <d4541684-337f-4c3f-fafa-a883be370c0e@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 4 May 2022 07:53:53 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XMuUELUbLEuzG_r0J2+82gKxNLe5KTsvFBK2hNhKnLHQ@mail.gmail.com>
Message-ID: <CAD=FV=XMuUELUbLEuzG_r0J2+82gKxNLe5KTsvFBK2hNhKnLHQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/dp: Add callbacks to make using DP AUX bus
 properly easier
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Philip Chen <philipchen@chromium.org>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Robert Foss <robert.foss@linaro.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>, Lyude Paul <lyude@redhat.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        LKML <linux-kernel@vger.kernel.org>
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

Hi,

On Wed, May 4, 2022 at 3:41 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> > - We had forgotten a EXPORT_SYMBOL_GPL on the non "devm" populate
> >    function.
>
> This can go to a separate patch, so that the fix can be backported to
> earlier kernels. Please don't forget the Fixes: tag.

Sure. Will do for v3.


> > -EXPORT_SYMBOL_GPL(of_dp_aux_depopulate_ep_devices);
> > +EXPORT_SYMBOL_GPL(of_dp_aux_depopulate_ep_device);
>
> Small note about the name. What if we change that to something more
> future-proof? Something like of_dp_aux_depopulate_bus() (and similarly
> rename other calls)?

Will do for v3.

> > +     /*
> > +      * If no parent "of_node", no "aux-bus" child node, or no available
> > +      * children then we're done. Call the callback (if needed) and return.
> > +      *
> > +      * NOTE: we intentionally pass the return code from done_probing
> > +      * directly out here. eDP controller drivers may want to support
> > +      * panels from old device trees where the panel was an independent
> > +      * platform device. In that case it's expected that done_probing()
> > +      * might need to return -EPROBE_DEFER to our caller.
> > +      */
> > +     if (!np) {
> > +             if (done_probing)
> > +                     return done_probing(aux);
>
> I see your point here (and that it makes code simpler). However I'm a
> little bit uneasy here. What if code this more explicitly in the
> drivers? Like the following:
>
> if (!dev_has_aux_bus()) {
>         ret = panel_ready(....);
> } else {
>         ...
>         ret = of_dp_aux_populate_ep_device(dp_aux, panel_ready);
>         ....;
> }

Yeah, I had considered that and was about 50-50. You think I should
change it? Is it really easier to understand if we break it up like
this? I'll wait for a response from you, but if I don't hear anything
then I'll change this as you suggest.


> This way you won't have to worry about the EPROBE_DEFER. Or you'd rather
> forbid it explicitly. Why? Consider the following scenario:
>
> dp_driver_probe()
>    /* This creates new devices */
>    done_probing returns -EPROBE_DEFER
>    /* device registration is unwound */
>    dp_driver_probe returns -EPROBE_DEFER
>
> However as the state of devices was chagned, the dp_driver_probe() can
> be called again and again, ending up with the the same probe loop that
> we are trying to solve.

Actually, I'm not sure we'd necessarily end up the loop we're trying
to solve. Let's see. If the panel probe itself doesn't create any
sub-devices and neither does done_probing() then done_probing()
returning -EPROBE_DEFER shouldn't cause any looping, right? It would
look just as if the panel returned -EPROBE_DEFER.

So I guess one could argue that _perhaps_ we don't need to forbid
-EPROBE_DEFER from done_probing()? It'd probably work OK (we'd
eventually retry probing the panel and call done_probing() once more
devices were added), but it'd be ugly and the system would report
(/sys/kernel/debug/devices_deferred) that it was the panel that
deferred even though it was this extra callback.

I'm going to go ahead and say this is too hacky, though. Also as long
as Linux still has the probe loop when you create devices and return
-EPROBE_DEFER we can get stuck because the panel _can_ create
sub-devices. It can do this with DP AUX backlight.

So I guess the summary is: yes, I'm confident that we should forbid
-EPROBE_DEFER from being returned by done_probing() when called by
dp_aux_ep_probe()

-Doug
