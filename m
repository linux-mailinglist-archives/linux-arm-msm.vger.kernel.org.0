Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19BB31E552C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2020 06:44:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725764AbgE1Eo4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 May 2020 00:44:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725308AbgE1Eo4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 May 2020 00:44:56 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DCA7C05BD1E
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2020 21:44:56 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id y18so12858200pfl.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2020 21:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=tJwb6NgXaAMt+UTbPVtGDaiNmTuQFn3dNgXFWvKRvnw=;
        b=dcnLymxvZW/qdTM/djO9j1r93X/5ToAZPefwVc43lAiKeOf+EN0TRtx7bLeyPGI2vj
         W0Cer5JcbUuVbc9CfnoxtDikDX5KVkVQ+LPQkMQXutg0w4zZQJrXA+7QsUi75NotJyg1
         V1Q+JcXeXei0X0lv89xaK8JYxedz7lxsMSgIyCMsb1+eHcmfpzZkxdW7E9XB10V7ZwPf
         8INhUkL9TvQjjgsjJcPZOnWeIduLUi3y4vPkwageKUKVIlvw4QOQn/9rawXwYmzfXt43
         hwqK0FWKsKl6/dMy0JqXTodDxESIyp9MjMoCmUhaorQ0ZAdWjKAobgFoYdiKDLwTxepd
         XPOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=tJwb6NgXaAMt+UTbPVtGDaiNmTuQFn3dNgXFWvKRvnw=;
        b=M/Q3m+4H9wfb49VWMjslE1H+8pwSsOzZNNysYFaw0XvAq6ICnl8Y8fM/rAFp+WVZSP
         gMLGTRiPuexLqTS7TS9DKgdI9TB4g2UvJWiKNdH32Kbc64Lf1p9iMdgT7KFGx3f53RkU
         JPtZmZykmiQCg5wRN3CAxsXfDVs1UUV7WfED645hVVmtWugiqn2PPGHFidYQi+LxmvDo
         m+veslZOjJ5dPq/lUxGTn2FEDaN0z0OcLzZTc1nqOLZOdEUyj8nxM3yUMnayjvttKIqA
         3UluZTEYBtz0zvXTt36mvKZzOrSZTpai2a0w9+84Le8TJYcALXKNKGZJUrUJrvAKZUZL
         xCiw==
X-Gm-Message-State: AOAM530BZbRFKLZPZNR9rh8WCWLCOe+nCQjcSV9BBjs77rOl+xo9Z1Rm
        i82MX9X6zNHcN9dFhDO5o5xdjQ==
X-Google-Smtp-Source: ABdhPJyKYx7TMXMeRkv/hPTfDi5DXyY3mVe1z0hiFNdH9r0D6Dwi5YhrO7UUuL9Ahtc3FtAuMB52Bw==
X-Received: by 2002:a63:4b0c:: with SMTP id y12mr1142604pga.56.1590641095251;
        Wed, 27 May 2020 21:44:55 -0700 (PDT)
Received: from localhost ([122.172.60.59])
        by smtp.gmail.com with ESMTPSA id nl8sm4278365pjb.13.2020.05.27.21.44.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 May 2020 21:44:54 -0700 (PDT)
Date:   Thu, 28 May 2020 10:14:51 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Niklas Cassel <nks@flawful.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, Viresh Kumar <vireshk@kernel.org>
Subject: Re: [PATCH] arch: arm64: dts: apq8016-dbc: Add missing cpu opps
Message-ID: <20200528044451.5kegaw2icvnjl4up@vireshk-i7>
References: <20200403175934.GA96064@gerhold.net>
 <20200423045506.GJ987656@yoga>
 <20200525153246.GA9224@flawful.org>
 <20200525163638.GA41001@gerhold.net>
 <20200525194443.GA11851@flawful.org>
 <20200526085948.GA1329@gerhold.net>
 <20200526155419.GA9977@flawful.org>
 <20200526205403.GA7256@gerhold.net>
 <20200527103921.GB9977@flawful.org>
 <20200527120441.GA4166@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200527120441.GA4166@gerhold.net>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27-05-20, 14:04, Stephan Gerhold wrote:
> +Cc Viresh (should have already done this earlier :) )
> 
> On Wed, May 27, 2020 at 12:39:21PM +0200, Niklas Cassel wrote:
> > On Tue, May 26, 2020 at 10:54:03PM +0200, Stephan Gerhold wrote:
> > > Speaking of the current solution, I also have to say that (IMO) the
> > > device tree binding for "required-opps" is rather confusing
> > > and potentially misleading.
> > > 
> > > e.g. for VDD_MX scaling I use
> > > 
> > > 	required-opps = <&rpmpd_opp_nom>;
> > > 
> > > but looking at just the OPP table absolutely nothing tells me this is
> > > supposed to apply to VDD_MX. You actually need to go search for the cpu@
> > > device tree node and then know that some of the power domains there
> > > (in some order) are eventually going to be used for the required-opps
> > > there. The order is only defined by the qcom-nvmem-cpufreq driver.
> > > 
> > > It took me a few hours to get that right... :)

I agree, we need a way to figure out devices as well for which the
required-opp works. And yes that's missing.

> > > Nevertheless I guess we need a solution for scaling MEMACC without CPR
> > > for now. :) I'm not sure if rewriting all this is very realistic
> > > (if even possible). So I guess we might be stuck with the genpd approach?
> > 
> > I agree, the CPR driver will most likely not be changed now, since we
> > need to be compatible with the existing device tree.

A driver can be changed as much as you want, just that you need to
honor both new and old DTs.

> > 
> > For DVFS without CPR:
> > 
> > You need to scale APC, MX, MEMACC.
> > 
> > If we don't care about MEMACC, then the existing code in the OPP library
> > satisfies all our needs.
> > The problem here is if we need to do MEMACC as well.
> > 
> > I don't think it is proper to implement MEMACC as a power domain
> > (because it is not). Thus, we can't add it as a required-opp.

Required-opps can be extended if there is a real need. It isn't just
about power domains.

> > Another problem is that MEMACC should be done after regulator_set_voltage()
> > when scaling up, and before regulator_set_voltage() when scaling down.
> > 
> > So even if MEMACC was a power domain, currently the OPP library does
> > the _set_required_opps() call in the wrong order needed for MEMACC.
> > 
> > Like you said, the OPP library almost does everything already,
> > so it probably makes most sense to extend it to your needs,
> > rather than duplicating most of the code inside dev_pm_opp_set_rate().
> > 
> > 
> > I guess what you really want is two new optional callbacks in
> > dev_pm_opp_set_rate(), one before _generic_set_opp_regulator() and one
> > after, where you could do the MEMACC thing.
> > 
> > The callbacks need to have a parameter that tells if we are scaling down
> > or up.

NAK :)

> > Or, if Viresh doesn't like new function pointers, create a new
> > OPP_EVENT_* that you can register for, and in that callback you do what
> > you need.

NAK :)

> > Or, maybe you can even use the existing CPUFREQ_TRANSITION_NOTIFIER,
> > with CPUFREQ_PRECHANGE / CPUFREQ_POSTCHANGE, however, I'm not sure
> > how nicely they play when you are using the OPP library.
> > 
> 
> I'm not sure. Overall all of this doesn't really sound like it is going
> to make all this easier to understand (from looking at the device tree).
> We then have required-opps for VDD_MX, and CPR (which isn't really a
> power domain), and something entirely different for MEMACC (which like
> CPR, isn't really a power domain).
> 
> I don't know, right now this mixture of different approaches sounds
> rather complicated (and confusing) to me...
> 
> Just to throw another idea in the room: there seems to be a set_opp()
> callback already in the OPP table, which bypasses the code that
> updates clock and regulators (see ti-opp-supply.c). Actually if I'm
> reading this correctly ti-opp-supply seems to implement adaptive voltage
> scaling similar to CPR with it. Seemingly we have two different solutions
> for the same concept now:
> 
>   - CPR implements a power domain provider (even though it's not really
>     a power domain since it has only one consumer)
>   - ti-opp-supply implements this with the set_opp() callback
> 
> In general I think this looks pretty nice - we don't duplicate the full
> cpufreq driver, but have control about the order
> regulators/clocks/power domains etc are changed.
> 
> I think something like this would fit quite well for my case
> (scaling MX, APC and MEMACC without CPR). However, not sure how it would
> integrate with the existing CPR driver at some point.
> 
> Adding Viresh to Cc in case he has some opinion for all this.

OPP core broadly is a place where we store/parse some data from the DT
and keep, so others can use it. opp_set_rate() was added to it to
avoid duplicating the same thing across drivers. As you have figured
out, the right way for you to solve it is by using your set_opp()
callback along with required-opps thing.

-- 
viresh
