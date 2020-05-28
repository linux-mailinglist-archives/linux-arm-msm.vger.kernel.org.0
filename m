Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 723211E626A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2020 15:38:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390428AbgE1Nil (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 May 2020 09:38:41 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.218]:30631 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390421AbgE1Nik (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 May 2020 09:38:40 -0400
X-Greylist: delayed 359 seconds by postgrey-1.27 at vger.kernel.org; Thu, 28 May 2020 09:38:39 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1590673118;
        s=strato-dkim-0002; d=gerhold.net;
        h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=kjl9BWwNBG2CmtZy+2hvbWWFjQWeDns8CFs3ho2SONA=;
        b=PvwVGibIR+l0vySOZoMU+iBSlh/cSaRQtu9V5hYuutjaInezTI07mN98/+HtuWj8sq
        JHN4dy1GwTQvFo4iNPF5qEQkPfR5FjlsYWrM9D6qwsGrUbDHOQLGjTYXmve+DIykkp2H
        wqjo1ioj5l9bUanxFQciAsEAab1izvnWwZnvtiixZeK41IS8p7IVyJo49/5eBr6YBEw+
        YpuqFTFJE5PjhHF04lsK5kp4gYnKgLZEIsppwYPr8cO5tpbDQVQuqGp1b6VIi/naY0KW
        SdHXa+vrc0kkH93Hx5cS6R5bMHK/fnhlbibcnj1wk8gn2y5SGXXgWRbaUufBXwOBxhm/
        1p9g==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j9IcjDBg=="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
        by smtp.strato.de (RZmta 46.9.0 DYNA|AUTH)
        with ESMTPSA id w0afa6w4SDWa2nI
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Thu, 28 May 2020 15:32:36 +0200 (CEST)
Date:   Thu, 28 May 2020 15:32:30 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Niklas Cassel <nks@flawful.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, Viresh Kumar <vireshk@kernel.org>
Subject: Re: [PATCH] arch: arm64: dts: apq8016-dbc: Add missing cpu opps
Message-ID: <20200528133230.GA1469@gerhold.net>
References: <20200525163638.GA41001@gerhold.net>
 <20200525194443.GA11851@flawful.org>
 <20200526085948.GA1329@gerhold.net>
 <20200526155419.GA9977@flawful.org>
 <20200526205403.GA7256@gerhold.net>
 <20200527103921.GB9977@flawful.org>
 <20200527120441.GA4166@gerhold.net>
 <20200527125919.GA16363@flawful.org>
 <20200527205518.GA8254@gerhold.net>
 <20200527231025.GA32707@flawful.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200527231025.GA32707@flawful.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, May 28, 2020 at 01:10:25AM +0200, Niklas Cassel wrote:
> On Wed, May 27, 2020 at 10:56:07PM +0200, Stephan Gerhold wrote:
> > > If the CPR driver is not changed, which I doubt, you will simply change
> > > the device tree to remove the cpu-supply regulator and move it into the
> > > new CPR DT node.
> > > 
> > > Old device trees will still use your DVFS solution, new device
> > > trees will use the CPR DT node and will use the AVS solution.
> > > 
> > 
> > I think my concern is essentially that I would duplicate the MEMACC code
> > into a new driver utilizing .set_opp() - and to keep backwards
> > compatibility we would need to keep that duplication forever.
> 
> The cleanest solution is probably to create a new memacc platform device
> driver, and make the new code use that, and refactor CPR to use the same.
> 

I will try to come up with something like that, thank you!

> > 
> > The MEMACC scaling isn't all that complicated, but overall I would
> > prefer to avoid introducing duplication in the first place.
> > 
> > Also: If full CPR ever happens we would be basically back
> > to one part of the current discussion: specifying two "required-opps"
> > MX and CPR (= APC + MEMACC) would result in the wrong order
> > when scaling up/down.
> > 
> > But maybe I just worry too much?
> 
> I guess that whoever implements CPR on msm8916 will either call
> dev_pm_genpd_set_performance_state() on MX directly from cpr_scale_voltage()
> or perhaps change OPP core so that it runs the required-opps in reverse
> order when scaling down, like you previously suggested.
> 
> Please don't take my suggestions as the only way forward though.
> Hopefully I provided more clarity than confusion.
> Will step back so that someone else has a chance to chime in :)

I'm a bit confused at the moment, but it's mainly because we discussed
so many different options. I will need some time to properly look
at all of them and come up with a potential solution.

Thanks for taking the time to answer all my questions! :)
Stephan
