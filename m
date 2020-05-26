Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A10821E2616
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2020 17:54:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728301AbgEZPyZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 May 2020 11:54:25 -0400
Received: from ste-pvt-msa2.bahnhof.se ([213.80.101.71]:37150 "EHLO
        ste-pvt-msa2.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727862AbgEZPyZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 May 2020 11:54:25 -0400
Received: from localhost (localhost [127.0.0.1])
        by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 94ABC3F9F2;
        Tue, 26 May 2020 17:54:22 +0200 (CEST)
Authentication-Results: ste-pvt-msa2.bahnhof.se;
        dkim=pass (1024-bit key; unprotected) header.d=flawful.org header.i=@flawful.org header.b=Px7jTzX1;
        dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
        DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Authentication-Results: ste-ftg-msa2.bahnhof.se (amavisd-new);
        dkim=pass (1024-bit key) header.d=flawful.org
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
        by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 7kXxTb9uT6oN; Tue, 26 May 2020 17:54:21 +0200 (CEST)
Received: from flawful.org (c-96c8e055.011-101-6d6c6d3.bbcust.telenor.se [85.224.200.150])
        (Authenticated sender: mb274189)
        by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 88B503F59B;
        Tue, 26 May 2020 17:54:21 +0200 (CEST)
Received: by flawful.org (Postfix, from userid 1001)
        id 9D00B35E; Tue, 26 May 2020 17:54:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flawful.org; s=mail;
        t=1590508460; bh=lcyKmclJP5KC81fgfTEw5+UBikn03GMwHGl4vGoDQgs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Px7jTzX1TvEsSOszS9arv5Hgfl7S+P3cUEFIkJUCN4YxUBVHQGmqsthmaswWeXFt0
         8CI/TDFxvm/N/3sYY1/UNo91Q2ci5KWSRyYjabG8vFA197Pr6zi9gpqndgZC/shX/8
         rv1IPKtOP+bQOHPYdojFIgKIa2ReTDszA4/CLKwM=
Date:   Tue, 26 May 2020 17:54:20 +0200
From:   Niklas Cassel <nks@flawful.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>, agross@kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arch: arm64: dts: apq8016-dbc: Add missing cpu opps
Message-ID: <20200526155419.GA9977@flawful.org>
References: <1585763459-21484-1-git-send-email-loic.poulain@linaro.org>
 <20200402081349.GA932@gerhold.net>
 <20200403013119.GB20625@builder.lan>
 <20200403100923.GB2652@gerhold.net>
 <20200403175934.GA96064@gerhold.net>
 <20200423045506.GJ987656@yoga>
 <20200525153246.GA9224@flawful.org>
 <20200525163638.GA41001@gerhold.net>
 <20200525194443.GA11851@flawful.org>
 <20200526085948.GA1329@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200526085948.GA1329@gerhold.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, May 26, 2020 at 10:59:48AM +0200, Stephan Gerhold wrote:
> > Considering that CPR is not an actual power domain, CPR gives
> > adjustments to VDD_APC, but I don't know of any other device
> > connected to VDD_APC, other than the CPU, so in hindsight the CPR
> > driver probably should have been implemented using .target_index(),
> > rather than as a power domain provider using performance states.
> 
> I suppose having CPR, MEMACC etc as power domain providers is a bit
> overkill, given there is just one consumer. However, at least the
> "performance state" part fits quite well in my opinion. At the end
> all these requirements represent some performance state that must be
> set when the CPU frequency is changed.
> 

For MX, it makes sense to model it as a power domain provider, and for
it to have its own OPP table, since this actually is a power domain.

For CPR, I think that the target_index() model of just giving an index
in a frequency table is much better, the OPP library can still be used
to get the frequencies/frequency_table.
Since at least for Qualcom CPU's, the corner (opp-level) is defined as
an increasing number 1,2,3,4, without skips.

Even if it wasn't always without skips, we could just put opp-level in
the CPU opp table, and get it from there.

The only thing that the corner is used for really, is to use it as an
index the local drv->corner array, which is where the (current) VDD_APC
voltage is stored for each index/corner.

For CPR, the .target_index() in cpufreq-dt.c gets called, which is
supplied with an index, but the index gets converted to a frequency.
This frequency is then sent to the OPP library, and is then converted
back to an index of the same value (just increased by one), before
cpr_set_performance_state() is called (which then has to subtract one).
In this case, all the extra overhead of going via genpd is totally
unnecessary.

This is totally correct when setting a performance state on a power
domain like MX, since for an actual power domain you might have
multiple consumers, so you need to go via genpd.

Considering that CPR is not a power domain, I wish the driver wasn't
designed around performance states, which, _for the CPR case_,
is misleading, unnecessary, and adds extra overhead for no reason.

I realize the irony of me criticizing my own code.
I simply know better now, and wish I had designed it differently :)


Kind regards,
Niklas
