Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3ED03E3BAD
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Aug 2021 18:48:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231357AbhHHQs0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 8 Aug 2021 12:48:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231199AbhHHQsZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 8 Aug 2021 12:48:25 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83216C061760;
        Sun,  8 Aug 2021 09:48:05 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id n12so8067033wrr.2;
        Sun, 08 Aug 2021 09:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JXfeb0h2Rs3hUCpDGX6lDXta9BpXf3ivi+Tsv9Cz5oU=;
        b=Y6qRakymlL5hNKzbXC1b0gS36TwLPBHRFmTcrnvCqYwz47d/bh8te4D8IeJT5+2bIg
         B+Hv1pP6GTt2VJiVWUEwd7JgdlbvKua89PtY6LdCc/AefxoJ7mA7brKxE5Z3wjjEERUa
         pKN/J3i+Il+rLcARyKYfizYMQvFUF3Os1XGpoyDkM3EHg8f4dU3kgEKjS4qynQSUmtL/
         UhecDK/IS7raCJrSxpl/hiyXXeAvHM/LWKbUU6HEzl0HvHfpklt5/hZje3we8R8bNlYS
         QK+QrQ+EBjCY0alAtybAQF6oj978n4h0FRym38UvJpw4tx2JmaCe3Xpzt5dm48XfInCE
         o3KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JXfeb0h2Rs3hUCpDGX6lDXta9BpXf3ivi+Tsv9Cz5oU=;
        b=ocEX/azfjAd9zQzjenhyqPtj+CKSvYZvVqlsK3fQdmwmt9HyetTAw2hoA+FBikseyR
         PJbouyfq898kp1prUbmeaw/LD+D+mRbHNv1qQeqcTCRjJDsOYTgT+69GBag9YusVN7tq
         x0rengZtdmWwjaMGjTGPFlQxw8tpJIc312ItywPMgX6kQHhLKVq/w9lO7cihCkL7TW2X
         rUh20dtik810St25eJJ7VTnJcAlgOu8MRFxAt+TWnXEQJitja+Od1d7GWKDztgDxAsaP
         AFAZpcw5HmX2VSrq2q/4La6PbS6i6xLeZxoFcVCvggyC+/ANgsXx+3sxkQwXrfbMu+EE
         FDqw==
X-Gm-Message-State: AOAM531YX4EQSFTSd9zOJBsTjvIFIrBmH6GCw8owkyQ07W/fLQa+t9gW
        dD08CixruQFHRDkd4xyamuGjLPaTP0lIcWh7HMc=
X-Google-Smtp-Source: ABdhPJzoQUH0KWDa6+nSup+HM8551pa5+dtvv5IrHloQk7J6tnSPfM/63A5lZv5/eDqP87DYsKbdGl7jP9sre9sTDsQ=
X-Received: by 2002:adf:e3c7:: with SMTP id k7mr19930357wrm.327.1628441283775;
 Sun, 08 Aug 2021 09:48:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210729183942.2839925-1-robdclark@gmail.com> <1a38a590-a64e-58ef-1bbf-0ae49c004d05@linaro.org>
 <CAF6AEGs5dzA7kfO89Uqbh3XmorXoEa=fpW+unk5_oaihHm479Q@mail.gmail.com>
 <e2cebf65-012d-f818-8202-eb511c996e28@linaro.org> <CAF6AEGs11aYnkL30kp79pMqLTg3_4otFwG2Oc890Of2ndLbELw@mail.gmail.com>
 <b7334a1a-c4ad-da90-03b4-0d19e1811b13@linaro.org> <CAF6AEGv0WWB3Z1hmXf8vxm1_-d7fsNBRcaQF35aE2JXcJn8-cA@mail.gmail.com>
 <8aa590be-6a9f-9343-e897-18e86ea48202@linaro.org>
In-Reply-To: <8aa590be-6a9f-9343-e897-18e86ea48202@linaro.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Sun, 8 Aug 2021 09:52:18 -0700
Message-ID: <CAF6AEGtd_5jKhixp6h+NnN8-aqjBHTLopRozASE73oT3rfnFHA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Disable frequency clamping on a630
To:     Caleb Connolly <caleb.connolly@linaro.org>
Cc:     Akhil P Oommen <akhilpo@codeaurora.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Jonathan Marek <jonathan@marek.ca>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        open list <linux-kernel@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Aug 8, 2021 at 7:33 AM Caleb Connolly <caleb.connolly@linaro.org> wrote:
>
>
>
> On 07/08/2021 21:04, Rob Clark wrote:
> > On Sat, Aug 7, 2021 at 12:21 PM Caleb Connolly
> > <caleb.connolly@linaro.org> wrote:
> >>
> >> Hi Rob, Akhil,
> >>
> >> On 29/07/2021 21:53, Rob Clark wrote:
> >>> On Thu, Jul 29, 2021 at 1:28 PM Caleb Connolly
> >>> <caleb.connolly@linaro.org> wrote:
> >>>>
> >>>>
> >>>>
> >>>> On 29/07/2021 21:24, Rob Clark wrote:
> >>>>> On Thu, Jul 29, 2021 at 1:06 PM Caleb Connolly
> >>>>> <caleb.connolly@linaro.org> wrote:
> >>>>>>
> >>>>>> Hi Rob,
> >>>>>>
> >>>>>> I've done some more testing! It looks like before that patch ("drm/msm: Devfreq tuning") the GPU would never get above
> >>>>>> the second frequency in the OPP table (342MHz) (at least, not in glxgears). With the patch applied it would more
> >>>>>> aggressively jump up to the max frequency which seems to be unstable at the default regulator voltages.
> >>>>>
> >>>>> *ohh*, yeah, ok, that would explain it
> >>>>>
> >>>>>> Hacking the pm8005 s1 regulator (which provides VDD_GFX) up to 0.988v (instead of the stock 0.516v) makes the GPU stable
> >>>>>> at the higher frequencies.
> >>>>>>
> >>>>>> Applying this patch reverts the behaviour, and the GPU never goes above 342MHz in glxgears, losing ~30% performance in
> >>>>>> glxgear.
> >>>>>>
> >>>>>> I think (?) that enabling CPR support would be the proper solution to this - that would ensure that the regulators run
> >>>>>> at the voltage the hardware needs to be stable.
> >>>>>>
> >>>>>> Is hacking the voltage higher (although ideally not quite that high) an acceptable short term solution until we have
> >>>>>> CPR? Or would it be safer to just not make use of the higher frequencies on a630 for now?
> >>>>>>
> >>>>>
> >>>>> tbh, I'm not sure about the regulator stuff and CPR.. Bjorn is already
> >>>>> on CC and I added sboyd, maybe one of them knows better.
> >>>>>
> >>>>> In the short term, removing the higher problematic OPPs from dts might
> >>>>> be a better option than this patch (which I'm dropping), since there
> >>>>> is nothing stopping other workloads from hitting higher OPPs.
> >>>> Oh yeah that sounds like a more sensible workaround than mine .
> >>>>>
> >>>>> I'm slightly curious why I didn't have problems at higher OPPs on my
> >>>>> c630 laptop (sdm850)
> >>>> Perhaps you won the sillicon lottery - iirc sdm850 is binned for higher clocks as is out of the factory.
> >>>>
> >>>> Would it be best to drop the OPPs for all devices? Or just those affected? I guess it's possible another c630 might
> >>>> crash where yours doesn't?
> >>>
> >>> I've not heard any reports of similar issues from the handful of other
> >>> folks with c630's on #aarch64-laptops.. but I can't really say if that
> >>> is luck or not.
> >> It looks like this affects at least the OnePlus 6 and PocoPhone F1, I've done some more poking and the following diff
> >> seems to fix the stability issues completely, it seems the delay is required to let the update propagate.
> >>
> >> This doesn't feel like the right fix, but hopefully it's enough to come up with a better solution than disabling the new
> >> devfreq behaviour on a630.
> >>
> >> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> >> index d7cec7f0dde0..69e2a5e84dae 100644
> >> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> >> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> >> @@ -139,6 +139,10 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp)
> >>                   return;
> >>           }
> >>
> >> +       dev_pm_opp_set_opp(&gpu->pdev->dev, opp);
> >> +
> >> +       usleep_range(300, 500);
> >> +
> >
> > Hmm, this is going to be in the critical path on idle -> active
> > transition (ie. think response time to user-input).. so we defn don't
> > want to do this unconditionally..
> >
> > If I understand the problem, we just want to limit how far we jump the
> > gpu freq in one go.. maybe deleting the lowest (and perhaps highest)
> > OPP would accomplish that?  Could that be done in the board(s)'s
> > toplevel dts files?
> That would be a workaround, however I'd really like to avoid limiting performance as a solution if I can help it,
> especially as the fix might just be "set the opp first, wait for it to apply, then set the core clock".
>
> Is there a sensible way to get a callback from the opp notify chain? Or from rpmh directly? Or is this solution really
> not the right way to go?

It does seem a bit strange to me that we are telling GMU to change
freq before calling dev_pm_opp_set_opp()..  if dev_pm_opp_set_opp() is
increasing voltage, it seems like you'd want to do that *before*
increasing freq (but reverse the order when decreasing freq).. But I'm
not an expert on the ways of the GMU..  maybe Akhil or Jordan knows
better how this is supposed to work.

But the delay seems like papering something over, and I'm trying to go
in the other direction and reduce latency between user input and
pageflip..

BR,
-R

> >
> > BR,
> > -R
> >
> >>           gmu_write(gmu, REG_A6XX_GMU_DCVS_ACK_OPTION, 0);
> >>
> >>           gmu_write(gmu, REG_A6XX_GMU_DCVS_PERF_SETTING,
> >> @@ -158,7 +162,6 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp)
> >>           if (ret)
> >>                   dev_err(gmu->dev, "GMU set GPU frequency error: %d\n", ret);
> >>
> >> -       dev_pm_opp_set_opp(&gpu->pdev->dev, opp);
> >>           pm_runtime_put(gmu->dev);
> >>    }
> >>>
> >>> Maybe just remove it for affected devices?  But I'll defer to Bjorn.
> >>>
> >>> BR,
> >>> -R
> >>>
> >>
> >> --
> >> Kind Regards,
> >> Caleb (they/them)
>
> --
> Kind Regards,
> Caleb (they/them)
