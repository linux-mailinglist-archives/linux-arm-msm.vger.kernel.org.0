Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67E40402501
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Sep 2021 10:19:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242332AbhIGIUh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Sep 2021 04:20:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236269AbhIGIUh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Sep 2021 04:20:37 -0400
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63B76C061575
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Sep 2021 01:19:31 -0700 (PDT)
Received: by mail-io1-xd34.google.com with SMTP id m11so11642783ioo.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Sep 2021 01:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9MXLDJhiY0fcXEg+LnGTR4OLM7jMrz/NHCTwfTLwDMg=;
        b=ElO/UJxIHNBjrNw3yfn9GFGNJhWRax3Eba+PUZ2fRtFre/HLcwkOVfWXRighUoPjEM
         51pdOWhi5deDUkefb5ithDBAYMI1Xt3Ha6kCwxlz2jU3xLR7RY9A2cvZS1TToCOjgiwb
         G90h5wXsl4q8wEdtWuWhAcFViVGAa6gdHujMmr+8R2+97UhFUYN8BnSW82RzYCS9z25m
         U3Hbpw/V04VgoxO2f7CU769BkfR4sAUGF4mft1VQBJSWBaog2UPCDTdWjAc5BfTT59gu
         jjL8bOtXSq9C7rgou3bRoFo0EQUhz/R3Vi7onjxMLCD33If4/Ri4kEThFAQfEbRnGaik
         JwGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9MXLDJhiY0fcXEg+LnGTR4OLM7jMrz/NHCTwfTLwDMg=;
        b=PvzeIAtIJB9qF9Ofc2v1Y81Naogw/EjQTXjGBXsghbj/LX4cPVkt6FBGLWpXDgAGxx
         GkLd3SuDFfdqG5Y8ixoBFIGTzep/F00wklF7hMYqf0jiNFoDmKqk35sMMRQufF+uNVfr
         QfH3b1OZXK8scdmQP1TBWZJ6UH5rV1/+VxKBAHylj61byDDLSnc8wMGJco7N7+1bnP4a
         VJbRWG1TzBsstsmIM8koo/zNp/xqI3WS2PdtIwUewwrVpAPnT8+V+/Ynx/RSg38ZIPQa
         mC1HRwFG1Q/8M34NduA9QxP6iH1D5ey+iszvOgOyUhdzlsKSxAEaL7MJxzDJLAgEPObD
         yOMQ==
X-Gm-Message-State: AOAM532MP3Zc0u4QHV7zP8JN6lFJq2ilU+nZylkT3IhHrIqhTIpvv4u5
        8ULRVW7qUHZh3RkJGyjjiLxIX2FOpf3dsbQLVrASvQ==
X-Google-Smtp-Source: ABdhPJwIQXLBjfDY4x2hegViI0I26x9Ldz3+Wvni8m5cPnPark5Q3y14GL2LxjfcnaO2magWZu87krrTNuiTaU5QMBA=
X-Received: by 2002:a6b:be02:: with SMTP id o2mr12593752iof.103.1631002770826;
 Tue, 07 Sep 2021 01:19:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210729183942.2839925-1-robdclark@gmail.com> <1a38a590-a64e-58ef-1bbf-0ae49c004d05@linaro.org>
 <CAF6AEGs5dzA7kfO89Uqbh3XmorXoEa=fpW+unk5_oaihHm479Q@mail.gmail.com>
 <e2cebf65-012d-f818-8202-eb511c996e28@linaro.org> <CAF6AEGs11aYnkL30kp79pMqLTg3_4otFwG2Oc890Of2ndLbELw@mail.gmail.com>
 <CALAqxLUkyXK2gqNMBbtJFfh01ZpcG46dZaM7Zq4jG3OngvFREg@mail.gmail.com>
 <CAF6AEGsACLcDuszcgmHHs04GghLPiRfei3tGo161yBXsg7Y-YA@mail.gmail.com>
 <CAMi1Hd0dniDXPNOuh05ywqHKY+cGvAsd-cnD91K1GLppfO=x0w@mail.gmail.com>
 <CAF6AEGvtw06MYST2PdhqHVpsG4Tec2DnUA-uwFRP-6xqa9yf5Q@mail.gmail.com>
 <CAMi1Hd1kp8ijH8y3U2sxs5cE3Zfat_v-C3rrGtTK01ry8Om6Lw@mail.gmail.com>
 <CAF6AEGuE2KAnOQRGwbbVHmms0uOfq4XCvF=a8FJ98spzJ5=+XQ@mail.gmail.com> <CAF6AEGukn2=z-7CroxiKcHiCPfS_U3reOBe0ZYV1fj9UBap17w@mail.gmail.com>
In-Reply-To: <CAF6AEGukn2=z-7CroxiKcHiCPfS_U3reOBe0ZYV1fj9UBap17w@mail.gmail.com>
From:   Amit Pundir <amit.pundir@linaro.org>
Date:   Tue, 7 Sep 2021 13:48:54 +0530
Message-ID: <CAMi1Hd2cO=vmFA81y2T9oAPxyKPpKn5d+uOs9emFbiop1vFD-A@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Disable frequency clamping on a630
To:     Rob Clark <robdclark@gmail.com>
Cc:     John Stultz <john.stultz@linaro.org>,
        Caleb Connolly <caleb.connolly@linaro.org>,
        Rob Clark <robdclark@chromium.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sean Paul <sean@poorly.run>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 7 Sept 2021 at 02:53, Rob Clark <robdclark@gmail.com> wrote:
>
> On Mon, Sep 6, 2021 at 1:50 PM Rob Clark <robdclark@gmail.com> wrote:
> >
> >
> > ok, I guess it is at least not a board specific thing (ie. won't need
> > to introduce some dt binding)..
> >
> > It would be nice to know what the maximum we can safely increase freq
> > in one step, if we need to limit that.
>
> Also, one sanity check.. for android builds, are you using the same
> a630_gmu.bin from linux-firmware?  If not, does the l-f gmu fw change
> things?

We are using the same a630_gmu.bin from linux-firmware.

>
> For freq changes, we basically ask gmu for the freq we want, and it
> votes for the requested freq.. so a gmu fw bug could be possible here.
>
> BR,
> -R
