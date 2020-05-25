Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 776821E11F4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2020 17:41:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404193AbgEYPlx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 May 2020 11:41:53 -0400
Received: from ste-pvt-msa2.bahnhof.se ([213.80.101.71]:64781 "EHLO
        ste-pvt-msa2.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404002AbgEYPlw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 May 2020 11:41:52 -0400
X-Greylist: delayed 540 seconds by postgrey-1.27 at vger.kernel.org; Mon, 25 May 2020 11:41:51 EDT
Received: from localhost (localhost [127.0.0.1])
        by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 378D63FE6B;
        Mon, 25 May 2020 17:32:49 +0200 (CEST)
Authentication-Results: ste-pvt-msa2.bahnhof.se;
        dkim=pass (1024-bit key; unprotected) header.d=flawful.org header.i=@flawful.org header.b=aU9e2QEc;
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
        with ESMTP id 5D2iwmztp_kT; Mon, 25 May 2020 17:32:48 +0200 (CEST)
Received: from flawful.org (c-96c8e055.011-101-6d6c6d3.bbcust.telenor.se [85.224.200.150])
        (Authenticated sender: mb274189)
        by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 283603FAFA;
        Mon, 25 May 2020 17:32:47 +0200 (CEST)
Received: by flawful.org (Postfix, from userid 1001)
        id 449E92B5; Mon, 25 May 2020 17:32:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flawful.org; s=mail;
        t=1590420767; bh=fHww7QcZaB+rodGtmBOPryEIb9sraIhAxG9R4DdFnrY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aU9e2QEcjSB85HtCxQd24cg+OYchqI/t/w3+LlZw/MfJ1kxSV0Q4cGicYZ8eTnWvL
         YX7JKmxIK9NSl0lyzW0B9oU/AxK/3lLKRs3Vm7Phoo5XGtCW91bAJYJ/4tEg/c6NXT
         dz4Qtf5EqGNJqBeYZpjmlJzeeGxE8MoCIblh8PiM=
Date:   Mon, 25 May 2020 17:32:47 +0200
From:   Niklas Cassel <nks@flawful.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephan Gerhold <stephan@gerhold.net>,
        Loic Poulain <loic.poulain@linaro.org>, agross@kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arch: arm64: dts: apq8016-dbc: Add missing cpu opps
Message-ID: <20200525153246.GA9224@flawful.org>
References: <1585763459-21484-1-git-send-email-loic.poulain@linaro.org>
 <20200402081349.GA932@gerhold.net>
 <20200403013119.GB20625@builder.lan>
 <20200403100923.GB2652@gerhold.net>
 <20200403175934.GA96064@gerhold.net>
 <20200423045506.GJ987656@yoga>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200423045506.GJ987656@yoga>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Apr 22, 2020 at 09:55:06PM -0700, Bjorn Andersson wrote:
> > Based on the available downstream sources I guessed the defines to add
> > for MSM8916 to the rpmpd driver. Then I added the VDD_MX OPPs as
> > "required-opps" to the CPU OPP table so it would vote for the appopriate
> > corners (with the mapping you mentioned above).
> > 
> 
> I was not aware it was possible to describe the dependency between the
> CPU opp table and MX in this fashion. If that's the case then this looks
> really good and it should be straight forward to add MSM8916 support to
> the CPR driver as well.
> 
> > I haven't tested it yet, maybe I can get some feedback first if the code
> > seems reasonable or if I'm missing something obvious? :)
> > 
> 
> Have you tested this yet?
> 
> > Also: Is there a good way to validate these changes?
> > I suppose I could check the genpd state but that wouldn't tell me if the
> > corner was applied correctly. Maybe I can check the actual voltage
> > through the SPMI interface, hm...
> > 
> 
> Validating that S2 and VDD_MX changes appropriately in Linux would be a
> pretty good test.

Like Bjorn says,

Downstream CPR on MSM8916 controls 3 things; VDD_APC, VDD_MX and MEMACC.

On QCS404 we don't have to adjust VDD_MX, therefore this is no code for
this in the upstream CPR driver. It just scales VPP_APC and MEMACC.

I like Stephan's idea of scaling VDD_APC and VDD_MEM to the maximum
necessary for the selected CPU frequency, until there is full CPR
support for MSM8916 (if ever).


The patch suggested so far looks good, however, I'm slightly worried
that this might lead to unstable boards, since MEMACC is never scaled
in the suggested patch.

Perhaps someone could ask Qualcomm nicely if this is really required.
Last time I talked to a Qualcomm engineer, he claimed that it was
needed, but I remember that his response was a bit ambiguous.


Kind regards,
Niklas
