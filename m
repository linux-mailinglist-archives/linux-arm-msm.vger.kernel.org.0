Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E2BB43291C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Oct 2021 23:35:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231234AbhJRVhW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Oct 2021 17:37:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229524AbhJRVhV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Oct 2021 17:37:21 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C584EC06161C;
        Mon, 18 Oct 2021 14:35:09 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id y74-20020a1c7d4d000000b00322f53b9bbfso516966wmc.3;
        Mon, 18 Oct 2021 14:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4XnmvNvPxfEVQWVq8EDgUudNaRlsqBTECY97KmH3+qU=;
        b=O0zLSgwbv/mkY4bc4Kww3dE+SdAgue0GUdt7Qe7jFGrv9/CqH/cNqfg6OqtVT/iq8W
         06tWL8aeII2Qtp82LRpcTg+VWuaJ9vTe9169Q65ifvVFpRGyJ5j9T9i+85aQ608x2eSa
         kTH+WXzreNwNVkxswqH/U43e5XlaySzrug5pAbn1uXPUkcCSowgjvIPZmcqLk7+AbnMh
         OOHr9INXUktXDJMe233LClz/YafxvJtpDz51b7bOYuG2TyMdSBDp1gjqnMky0jNEXnNz
         61vwJswFQPPdTiEkxvMIYQzKt8BusLS26DQRkeGiIJwIx8l3/iPpUQ8E+J8lr3U3cqCF
         fe9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4XnmvNvPxfEVQWVq8EDgUudNaRlsqBTECY97KmH3+qU=;
        b=GegwOMaaSupyNsoDvSfhYbD9BhbPnTVuJk5vXu/gVfGHvaeo7QNU+NjVwMqvTmrlVX
         t95ez63+VAdN4qQsSdGXKZymZcUzFf+c++UcahWfr6j/iWFNWrubRqiJGxZfa9OLSGiw
         3EA2HBtqRwgQzKszxPWlIWyC8CwGIypkygrb1FHCqS2vnh3lIx/TTKgC5kKOanG4YahB
         f5iRdud6BXgxVT8cLBAOqS0unwpsZCOcETIr8dksMktu9gdudTEjQULobj4PmTD519yc
         Gq+iVTstnx2od6K0SWBjPmbA9QKXiXeTYpdjNzJD8/1b1ZeSw7aZYxSMT11g8eMdPj+X
         YT0g==
X-Gm-Message-State: AOAM530BBeJJeeJ6hsEhZuRenKTg/+PYJuuo7DIO6pIknpwhy9MQh1p5
        SNOHlbL/JTd7A18bRhvszzanFi37GLycNFW09Rs=
X-Google-Smtp-Source: ABdhPJzhkbwDthvcSIEV0Hy1PC5sK3geesT4m3ojkKN7yJzHPDU3Yix216y4pCnSidZYgZUwO7yn99zm1abKlrnJpco=
X-Received: by 2002:a05:600c:4f43:: with SMTP id m3mr1484775wmq.151.1634592908342;
 Mon, 18 Oct 2021 14:35:08 -0700 (PDT)
MIME-Version: 1.0
References: <20211018153627.2787882-1-robdclark@gmail.com> <CALAqxLU=O2yaJ=ZOtg0S-zX4KyirbXNx+0iF3EJ9d4=rVL6Z=Q@mail.gmail.com>
 <5c460ee3-9079-02a7-e674-a4dde5815f0d@linaro.org>
In-Reply-To: <5c460ee3-9079-02a7-e674-a4dde5815f0d@linaro.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 18 Oct 2021 14:39:46 -0700
Message-ID: <CAF6AEGusfFofWh6eE1fPd_6PQ2KQpZ2sU9GSxnvbqaTi5_nwtw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/devfreq: Restrict idle clamping to a618 for now
To:     Caleb Connolly <caleb.connolly@linaro.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        open list <linux-kernel@vger.kernel.org>,
        Amit Pundir <amit.pundir@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 18, 2021 at 10:33 AM Caleb Connolly
<caleb.connolly@linaro.org> wrote:
>
> Hi all,
>
> On 18/10/2021 17:42, John Stultz wrote:
> > On Mon, Oct 18, 2021 at 8:31 AM Rob Clark <robdclark@gmail.com> wrote:
> >>
> >> From: Rob Clark <robdclark@chromium.org>
> >>
> >> Until we better understand the stability issues caused by frequent
> >> frequency changes, lets limit them to a618.
> >>
> >> Signed-off-by: Rob Clark <robdclark@chromium.org>
> >> ---
> >> Caleb/John, I think this should help as a workaround for the power
> >> instability issues on a630.. could you give it a try?
> >
> > While I hit it fairly often, I can't reliably reproduce the crash, but
> > in limited testing this seems ok to me.
> > I've not hit the crash so far, nor seen any other negative side
> > effects over 5.14.
> >
> > So for what that's worth:
> > Tested-by: John Stultz <john.stultz@linaro.org>
> >
> > Caleb has better luck tripping this issue right away, so they can
> > hopefully provide a more assured response.
> This prevents the crash on the OnePlus 6 as the frequency can no longer go to zero.
>
> I would like to find a better solution that still allows proper idling on a630, but that can wait for 5.16.
>
> Tested-by: Caleb Connolly <caleb.connolly@linaro.org>

Thanks for testing, I've sent one last -fixes pull request with this patch

BR,
-R

> >
> > thanks
> > -john
> >
>
> --
> Kind Regards,
> Caleb (they/them)
