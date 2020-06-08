Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CBD71F21FA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2020 00:53:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726857AbgFHWx4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Jun 2020 18:53:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726741AbgFHWxz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Jun 2020 18:53:55 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79F4DC08C5C2;
        Mon,  8 Jun 2020 15:53:55 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id l1so14791248ede.11;
        Mon, 08 Jun 2020 15:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o0dkW7AvLyKn1HRWpsXIOwbF0Y+dLturfn26dWeNBGk=;
        b=oUIUtFODJiEax1cYkKvYmwAdbOx/v8zdOrVZjhTeHg6/0BEdjS1WeDOIvOZ3WMb7/i
         ONJQj9vfW3ieG2L3o2wsqtHBNoMNMe0kdkpPu0rhTZ2QSLOgtlPblqJ264grL9R+WwlL
         7kR8ay5zlNj18Un3z9RIxrNLAzj3b6mRroHeqYtD09xsq62yqPZ7dHPaNSD5vqvJRgB3
         tdCRffLsbtIGDVwc0U62UqtymSVZErg50b+7kgsYm9l8F9rZhjK/gEVBiVT/Vn4nuK/1
         FiocN+z1p5MEN7CyXQV0CRu18kNf1pHA5GgmoLMFu+qoZ9Q5zfrmT5ME7kJeoWR6apjq
         tZ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o0dkW7AvLyKn1HRWpsXIOwbF0Y+dLturfn26dWeNBGk=;
        b=npldMPLKtImlug97zypKL7xLXWE/DJ9m7b3LS2sAP0G6CuupMtR2QLOo3ym9YewKdh
         ysyx3hauiwfHdoRyOQWpe4ZxvsIb2eo7EFdj2ZzsGE4+slQKycKl9sjIjrVfmr0vg7k+
         IvnULWcu1/KZIVb1RfjnTt18JHZkQn4ZaT6QQwLnANuRyZ0KkBG9sTm5IcWnpU+145+a
         d1aeN1krKNafD7nnhZirx0RzZAz83btKsB8CihDtQJd8JBfYfIHCh3SimEIMZE/tpypJ
         Qz0Dtk/pv13UeEFrZDa9hAYR3aXPtucI1uDpSfPSuapyT+9jibzd1nh10VCYfhFXymxW
         FgIw==
X-Gm-Message-State: AOAM53259hekU0D6RNwfYv/FuuP7cAxcBJbE3YQJ7XUeKzLqrQH4cA53
        tsKrgW2vzMhF/fDK7UiwHNuewfF6u09DGi5EgkE=
X-Google-Smtp-Source: ABdhPJwibOfu09ZokvFJB8guqz4Rh/t6R+97kctxbqsoYNwmzeb7qaLLtQeLrCUX3dmQ1Jq2dt20A6x9O/nH7nNQ8Mg=
X-Received: by 2002:a50:9d46:: with SMTP id j6mr24741835edk.362.1591656833950;
 Mon, 08 Jun 2020 15:53:53 -0700 (PDT)
MIME-Version: 1.0
References: <1585044079-358-1-git-send-email-kalyan_t@codeaurora.org>
 <CALAqxLViRrga-XW2o1J1JutFdS1d-qmmgOrEP2beNygw3A7H4A@mail.gmail.com> <CALAqxLWbhioSH4pFyM348VrGWxRXHQV1s9bdz6HArYguLtAFcw@mail.gmail.com>
In-Reply-To: <CALAqxLWbhioSH4pFyM348VrGWxRXHQV1s9bdz6HArYguLtAFcw@mail.gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 8 Jun 2020 15:54:19 -0700
Message-ID: <CAF6AEGvGxyen5DbYCoc1x5ZeWiZo0mgvtsNev0k7WJnw+Xgqjg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/msm/dpu: add support for color processing blocks
 in dpu driver
To:     John Stultz <john.stultz@linaro.org>
Cc:     Kalyan Thota <kalyan_t@codeaurora.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Krishna Manikandan <mkrishn@codeaurora.org>,
        Raviteja Tamatam <travitej@codeaurora.org>,
        Doug Anderson <dianders@chromium.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Sean Paul <seanpaul@chromium.org>,
        "Kristian H. Kristensen" <hoegsberg@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jun 8, 2020 at 3:37 PM John Stultz <john.stultz@linaro.org> wrote:
>
> On Mon, Jun 8, 2020 at 3:25 PM John Stultz <john.stultz@linaro.org> wrote:
> >
> > On Wed, Mar 25, 2020 at 1:17 AM Kalyan Thota <kalyan_t@codeaurora.org> wrote:
> > >
> > > This change adds support to configure dspp blocks in
> > > the dpu driver.
> > >
> > > Macro description of the changes coming in this patch.
> > > 1) Add dspp definitions in the hw catalog.
> > > 2) Add capability to reserve dspp blocks in the display data path.
> > > 3) Attach the reserved block to the encoder.
> > >
> > > Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
> >
> > Hey all,
> >   With this patch now merged upstream, I'm seeing a regression on
> > db845c that I bisected down to it.
> >
> > When I boot up I see:
> > [   40.976737] [drm:_dpu_rm_check_lm_and_get_connected_blks] [dpu
> > error]failed to get dspp on lm 0
> > [   40.985600] [drm:_dpu_rm_check_lm_and_get_connected_blks] [dpu
> > error]failed to get dspp on lm 0
> > [   40.994587] [drm:_dpu_rm_check_lm_and_get_connected_blks] [dpu
> > error]failed to get dspp on lm 0
> > [   41.003492] [drm:_dpu_rm_check_lm_and_get_connected_blks] [dpu
> > error]failed to get dspp on lm 0
> > [   41.012283] [drm:_dpu_rm_make_reservation] [dpu error]unable to
> > find appropriate mixers
> > [   41.020369] [drm:dpu_rm_reserve] [dpu error]failed to reserve hw
> > resources: -119
> >
> > Over and over, and the display doesn't start up.
> >
> > I suspect we're supposed to catch the following check before the failure:
> >
> > +       if (!reqs->topology.num_dspp)
> > +               return true;
> >
> > I suspect the issue is in dpu_encoder_get_topology() we don't fully
> > initialize the topology structure on the stack before returning it.
> >
> > Does that sound plausible or is there likely some other cause?
>
> This guess is wrong. The topology.num_dspp is 2, but lm_cfg->dspp is
> coming back as zero.
>
> I'll continue digging to see if I can understand better whats going wrong.
>

It looks like no DSPP was added to 845, see sdm845_lm vs sc7180_lm


Kaylan, can this be fixed sanely to make DSPP optional, or should we
revert and try again next time?

BR,
-R
