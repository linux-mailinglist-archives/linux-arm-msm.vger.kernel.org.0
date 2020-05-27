Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C101E1E519C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2020 01:10:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725747AbgE0XKb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 May 2020 19:10:31 -0400
Received: from ste-pvt-msa1.bahnhof.se ([213.80.101.70]:57390 "EHLO
        ste-pvt-msa1.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725385AbgE0XKb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 May 2020 19:10:31 -0400
Received: from localhost (localhost [127.0.0.1])
        by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id A86F741CC5;
        Thu, 28 May 2020 01:10:28 +0200 (CEST)
Authentication-Results: ste-pvt-msa1.bahnhof.se;
        dkim=pass (1024-bit key; unprotected) header.d=flawful.org header.i=@flawful.org header.b=sYKxmCQf;
        dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
        DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
        by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id DYvitJkC04gg; Thu, 28 May 2020 01:10:27 +0200 (CEST)
Received: from flawful.org (c-96c8e055.011-101-6d6c6d3.bbcust.telenor.se [85.224.200.150])
        (Authenticated sender: mb274189)
        by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 6DD3941CC3;
        Thu, 28 May 2020 01:10:27 +0200 (CEST)
Received: by flawful.org (Postfix, from userid 1001)
        id C05F1292; Thu, 28 May 2020 01:10:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flawful.org; s=mail;
        t=1590621025; bh=A1vyMH2hsA3QIPFLaDfzIU7nFicn+1S/u0UEJyqbR9w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sYKxmCQfn5htix0TyT+K7SaOlAwPtqzz+isdlrdqtCPw6+0B5gDVO3cIWmL5XiW1Y
         91nwZfwp0ZGVZ6CWMwjyhlzT7LWAknsgq5DlM6bR0jlu1Hm2H3x5mdm7TgcJC6FnqO
         3nn8Xz1igYqutkur217cuVTwFfLw9wYNbWxy+IE8=
Date:   Thu, 28 May 2020 01:10:25 +0200
From:   Niklas Cassel <nks@flawful.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, Viresh Kumar <vireshk@kernel.org>
Subject: Re: [PATCH] arch: arm64: dts: apq8016-dbc: Add missing cpu opps
Message-ID: <20200527231025.GA32707@flawful.org>
References: <20200525153246.GA9224@flawful.org>
 <20200525163638.GA41001@gerhold.net>
 <20200525194443.GA11851@flawful.org>
 <20200526085948.GA1329@gerhold.net>
 <20200526155419.GA9977@flawful.org>
 <20200526205403.GA7256@gerhold.net>
 <20200527103921.GB9977@flawful.org>
 <20200527120441.GA4166@gerhold.net>
 <20200527125919.GA16363@flawful.org>
 <20200527205518.GA8254@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200527205518.GA8254@gerhold.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, May 27, 2020 at 10:56:07PM +0200, Stephan Gerhold wrote:
> > If the CPR driver is not changed, which I doubt, you will simply change
> > the device tree to remove the cpu-supply regulator and move it into the
> > new CPR DT node.
> > 
> > Old device trees will still use your DVFS solution, new device
> > trees will use the CPR DT node and will use the AVS solution.
> > 
> 
> I think my concern is essentially that I would duplicate the MEMACC code
> into a new driver utilizing .set_opp() - and to keep backwards
> compatibility we would need to keep that duplication forever.

The cleanest solution is probably to create a new memacc platform device
driver, and make the new code use that, and refactor CPR to use the same.

> 
> The MEMACC scaling isn't all that complicated, but overall I would
> prefer to avoid introducing duplication in the first place.
> 
> Also: If full CPR ever happens we would be basically back
> to one part of the current discussion: specifying two "required-opps"
> MX and CPR (= APC + MEMACC) would result in the wrong order
> when scaling up/down.
> 
> But maybe I just worry too much?

I guess that whoever implements CPR on msm8916 will either call
dev_pm_genpd_set_performance_state() on MX directly from cpr_scale_voltage()
or perhaps change OPP core so that it runs the required-opps in reverse
order when scaling down, like you previously suggested.

Please don't take my suggestions as the only way forward though.
Hopefully I provided more clarity than confusion.
Will step back so that someone else has a chance to chime in :)


Kind regards,
Niklas
