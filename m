Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF6D43D8630
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jul 2021 05:46:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233679AbhG1Dqt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Jul 2021 23:46:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233608AbhG1Dqt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Jul 2021 23:46:49 -0400
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com [IPv6:2607:f8b0:4864:20::c30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69CE0C061760
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jul 2021 20:46:47 -0700 (PDT)
Received: by mail-oo1-xc30.google.com with SMTP id z3-20020a4a98430000b029025f4693434bso348481ooi.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jul 2021 20:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=X9/Ttley1HiyBx6xJyZs3xHP3lRgNd9DQtcFshUv0Ww=;
        b=s0q4lFbJtw1BDyfhfL4JP6N4B5nitFldtGIYE2Ay6jg/+PlevFWeqww+5Qg0m+OPo/
         03TTPs5LI/bHEoEyKfU1FNYmSoqGuhBm4NABdfClbTNQZqP+qvb2tBZOFVHUy2mO8fGl
         UbS3kXBQ1jM/h3IeAZNBlVpigtFl23ali5QF+oh1ofJCo90J4Ges4MSQRmBjvobU+aBR
         AOZuQmVvgOP61TA9x8T9TeqK9wyD9aRMSZiJ0ZU3ydR93KMTGwIf2Piu5q8tE2IMYhWx
         5KBrajlUVdUmMe4mnFb/Jk/RlPUGylwNPh5LqHyms/h1/3tsLaeSiSvhz0104BOPEiLP
         LC4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=X9/Ttley1HiyBx6xJyZs3xHP3lRgNd9DQtcFshUv0Ww=;
        b=s2pj0D7f5JH2gcC20upe1W4UrPNPNmvxvaUL7n4PHN2iVhSitc9Z4cKpF0xJPeoMrT
         L4Nmxutld96X2/Px5FvmhBGzrE9idLfu9zADSTkoC8VR9yf5S8d5iY+WZtWcfRR1cBeD
         j83THY7KJiAxMUW6icaYVzHTqdL3KkFVb0EN9duc/cHRs0X+yqlvJLfK0r4GaL96o+mQ
         zGkju/aB3iKa+hPvVtKznxbT2Hi2VkjD3dB39np/82hesYjoGJsjrCRjWjdhd5SuX2pw
         WKE3f4Op66blYQ65dYv+70ybUt0UHl3R9xWoeb38naC4SewmVJ17pwqK9Xh+9IR126Op
         RGsg==
X-Gm-Message-State: AOAM531LRY4EPrpsYq7RkZ8diOKC6KZyQ/ySR78H/uDC5pn5Gj21rvBo
        N18fm8Fn71eFH0xOaoBymPcGyA==
X-Google-Smtp-Source: ABdhPJxnK+Awvd9p/hgL7jvGhR8ApUYTH+icENX6THkmZAQZQ1o0lkTtt0FxKku6L5PV3fWh3bjjNg==
X-Received: by 2002:a4a:a542:: with SMTP id s2mr15783273oom.78.1627444005665;
        Tue, 27 Jul 2021 20:46:45 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id x22sm935256oie.28.2021.07.27.20.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 20:46:44 -0700 (PDT)
Date:   Tue, 27 Jul 2021 22:46:42 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     Stephen Boyd <swboyd@chromium.org>, ulf.hansson@linaro.org,
        viresh.kumar@linaro.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, rojay@codeaurora.org,
        stephan@gerhold.net
Subject: Re: [PATCH v4 2/2] arm64: dts: sc7180: Add required-opps for i2c
Message-ID: <YQDTImwRhp8juvKh@yoga>
References: <YPHpsO5LlQRQxj9y@yoga>
 <CAE-0n53CHD8c7C4ETWRgzmZmFSCcBw46wSs4pKbYMRjA_tD3yg@mail.gmail.com>
 <YPHxfHPC/faq/y+J@yoga>
 <CAE-0n50qx80cMFPJ1x9rc+EMR1L+j2CUMyDjWAbnE9mPHjf-TQ@mail.gmail.com>
 <YPIBK/NJgBNZVI8Y@yoga>
 <12711a61-e16c-d2bc-6e04-ab94c7551abe@codeaurora.org>
 <YPXQNFYKfH/xZxFY@yoga>
 <bc79ea3e-4981-8f9b-f9a7-59cb972047a7@codeaurora.org>
 <YP2Y6qs5P5mb2jzE@yoga>
 <b6b315ae-ee68-6ba8-7453-f28dace3d8d2@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b6b315ae-ee68-6ba8-7453-f28dace3d8d2@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 27 Jul 02:35 CDT 2021, Rajendra Nayak wrote:

> 
> On 7/25/2021 10:31 PM, Bjorn Andersson wrote:
> > On Mon 19 Jul 23:29 CDT 2021, Rajendra Nayak wrote:
> > 
> > > 
> > > 
> > > On 7/20/2021 12:49 AM, Bjorn Andersson wrote:
> > > > On Mon 19 Jul 04:37 CDT 2021, Rajendra Nayak wrote:
> > > > 
> > > > > 
> > > > > 
> > > > > On 7/17/2021 3:29 AM, Bjorn Andersson wrote:
> > > > > > On Fri 16 Jul 16:49 CDT 2021, Stephen Boyd wrote:
> > > > > > 
> > > > > > > Quoting Bjorn Andersson (2021-07-16 13:52:12)
> > > > > > > > On Fri 16 Jul 15:21 CDT 2021, Stephen Boyd wrote:
> > > > > > > > 
> > > > > > > > > Quoting Bjorn Andersson (2021-07-16 13:18:56)
> > > > > > > > > > On Fri 16 Jul 05:00 CDT 2021, Rajendra Nayak wrote:
> > > > > > > > > > 
> > > > > > > > > > > qup-i2c devices on sc7180 are clocked with a fixed clock (19.2 MHz)
> > > > > > > > > > > Though qup-i2c does not support DVFS, it still needs to vote for a
> > > > > > > > > > > performance state on 'CX' to satisfy the 19.2 Mhz clock frequency
> > > > > > > > > > > requirement.
> > > > > > > > > > > 
> > > > > > > > > > 
> > > > > > > > > > Sounds good, but...
> > > > > > > > > > 
> > > > > > > > > > > Use 'required-opps' to pass this information from
> > > > > > > > > > > device tree, and also add the power-domains property to specify
> > > > > > > > > > > the CX power-domain.
> > > > > > > > > > > 
> > > > > > > > > > 
> > > > > > > > > > ..is the required-opps really needed with my rpmhpd patch in place?
> > > > > > > > > > 
> > > > > > > > > 
> > > > > > > > > Yes? Because rpmhpd_opp_low_svs is not the lowest performance state for
> > > > > > > > > CX.
> > > > > > > > 
> > > > > > > > On e.g. sm8250 the first available non-zero corner presented in cmd-db
> > > > > > > > is low_svs.
> > > > > 
> > > > > what rail is this? the mmcx? Perhaps it does not support RET.
> > > > > cx usually supports both collapse state and RET.
> > > > > 
> > > > 
> > > > That was the one I was specifically looking at for the MDSS_GDSC->MMCX
> > > > issue, so it's likely I didn't look elsewhere.
> > > > 
> > > > > > > 
> > > > > > > Indeed. On sc7180 it's not the first non-zero corner. I suppose
> > > > > > > retention for CX isn't actually used when the SoC is awake so your
> > > > > > > rpmhpd patch is putting in a vote for something that doesn't do anything
> > > > > > > at runtime for CX? I imagine that rpmh only sets the aggregate corner to
> > > > > > > retention when the whole SoC is suspended/sleeping, otherwise things
> > > > > > > wouldn't go very well. Similarly, min_svs may be VDD minimization? If
> > > > > > > so, those first two states are basically states that shouldn't be used
> > > > > > > at runtime, almost like sleep states.
> > > > > > > 
> > > > > > 
> > > > > > But if that's the case, I don't think it's appropriate for the "enabled
> > > > > > state" of the domain to use any of those corners.
> > > > > 
> > > > > I rechecked the downstream kernels where all this voting happens from within
> > > > > the clock drivers, and I do see votes to min_svs for some clocks, but Stephen is
> > > > > right that RET is not something that's voted on while in active state.
> > > > > 
> > > > > But always going with something just above the ret level while active will also
> > > > > not work for all devices, for instance for i2c on 7180, it needs a cx vote of
> > > > > low svs while the rail (cx) does support something lower than that which is min svs.
> > > > > (why can't it just work with min svs?, I don't know, these values and recommendations
> > > > > come in from the voltage plans published by HW teams for every SoC and we just end up
> > > > > using them in SW, perhaps something to dig further and understand which I will try and
> > > > > do but these are the values in voltage plans and downstream kernels which work for now)
> > > > > 
> > > > 
> > > > So to some degree this invalidates my argumentation about the
> > > > enabled_corner in rpmhpd, given that "enabled" means a different corner
> > > > for each rail - not just the one with lowest non-zero value.
> > > 
> > > Right, it might work in some cases but might not work for all.
> > > 
> > 
> > Which makes it way less desirable.
> > 
> > The enable state for rpmhpd power domains doesn't meet my expectations
> > for how a power domain should behave,
> 
> Right and that's perhaps because these are not the usual power-domains,
> which have one "on/active" state and one or more "off/inactive" states (off/ret/clock-stop)
> Rpmhpd has multiple "on/active" states, and whats "on/active" for one consumer
> might not be "on/active" for another, so this information is hard to be managed
> at a generic level and these requests in some way or the other need to come
> in explicitly from the resp. consumers.
> 

I think it's fine if we just acknowledge that this is how the rpmhpd
domains works.

But I am worried about how we're going to handle the case where the
consumer is indirectly referencing one of these power-domains using a
subdomain (gdsc).

And the open question is if a solution to that problem will solve this
problem as well, or if we need to have this and some mechanism to
describe the "on state" for the parent of a subdomain.

Regards,
Bjorn
