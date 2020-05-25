Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA5361E12CA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2020 18:36:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729660AbgEYQgs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 May 2020 12:36:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726308AbgEYQgs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 May 2020 12:36:48 -0400
Received: from mo6-p00-ob.smtp.rzone.de (mo6-p00-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5300::8])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D942FC061A0E
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2020 09:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1590424604;
        s=strato-dkim-0002; d=gerhold.net;
        h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=lLqRSb6lU5rcEts+Wmt6wgBPFte3gpw0kUegKZRKRJs=;
        b=WmBfWTtCwgXIPF4/3b3BIanqPiSRnL9X9EKbsUnGQDeGwcL0Sw7U86UYMGu92Ovx6Z
        zeH6f/4v2cEQBWTCl73hE/SJr952OP2KypFXIQlTqwTWMJoe2Yh3zqsgM41DDK9o6Kee
        7eeEG90zvDLrlb9Qb0/JAxHO3NHyZ4wTpJWaxej7la1KCjkN+UTqDQA3NUCbKX24TAxH
        QrjhVcxCmgl92BkCflRevqJj5uy1wjsroQNdZjMaRDkw/UlzfBoMSGreyztO9A34x81y
        r+UjUNXKFOQESuhRmFerAy9XphCT63t1chS5lv2O9BT/A81PBowW8kVli0S5g6YSoJZU
        0Ecw==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j9Ic/Fboo="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
        by smtp.strato.de (RZmta 46.7.0 DYNA|AUTH)
        with ESMTPSA id C07db0w4PGahYoH
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Mon, 25 May 2020 18:36:43 +0200 (CEST)
Date:   Mon, 25 May 2020 18:36:38 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Niklas Cassel <nks@flawful.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>, agross@kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arch: arm64: dts: apq8016-dbc: Add missing cpu opps
Message-ID: <20200525163638.GA41001@gerhold.net>
References: <1585763459-21484-1-git-send-email-loic.poulain@linaro.org>
 <20200402081349.GA932@gerhold.net>
 <20200403013119.GB20625@builder.lan>
 <20200403100923.GB2652@gerhold.net>
 <20200403175934.GA96064@gerhold.net>
 <20200423045506.GJ987656@yoga>
 <20200525153246.GA9224@flawful.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200525153246.GA9224@flawful.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, May 25, 2020 at 05:32:47PM +0200, Niklas Cassel wrote:
> On Wed, Apr 22, 2020 at 09:55:06PM -0700, Bjorn Andersson wrote:
> > > Based on the available downstream sources I guessed the defines to add
> > > for MSM8916 to the rpmpd driver. Then I added the VDD_MX OPPs as
> > > "required-opps" to the CPU OPP table so it would vote for the appopriate
> > > corners (with the mapping you mentioned above).
> > > 
> > 
> > I was not aware it was possible to describe the dependency between the
> > CPU opp table and MX in this fashion. If that's the case then this looks
> > really good and it should be straight forward to add MSM8916 support to
> > the CPR driver as well.
> > 
> > > I haven't tested it yet, maybe I can get some feedback first if the code
> > > seems reasonable or if I'm missing something obvious? :)
> > > 
> > 
> > Have you tested this yet?
> > 
> > > Also: Is there a good way to validate these changes?
> > > I suppose I could check the genpd state but that wouldn't tell me if the
> > > corner was applied correctly. Maybe I can check the actual voltage
> > > through the SPMI interface, hm...
> > > 
> > 
> > Validating that S2 and VDD_MX changes appropriately in Linux would be a
> > pretty good test.
> 
> Like Bjorn says,
> 
> Downstream CPR on MSM8916 controls 3 things; VDD_APC, VDD_MX and MEMACC.
> 
> On QCS404 we don't have to adjust VDD_MX, therefore this is no code for
> this in the upstream CPR driver. It just scales VPP_APC and MEMACC.
> 
> I like Stephan's idea of scaling VDD_APC and VDD_MEM to the maximum
> necessary for the selected CPU frequency, until there is full CPR
> support for MSM8916 (if ever).
> 
> 
> The patch suggested so far looks good, however, I'm slightly worried
> that this might lead to unstable boards, since MEMACC is never scaled
> in the suggested patch.
> 

Yeah, I was recently looking at that. I have no idea if it's needed.

If I understand this correctly, on downstream this is implemented
separately as "mem-acc-regulator", although it is controlled by the
"cpr-regulator" driver.

The mapping seems to be fairly static:
Essentially it is just set to Nominal (1), SVS (2) or Turbo (3),
depending on the CPU frequency. (On downstream this is specified in the
device tree as qcom,cpr-corner-map = <1 1 2 2 3 3 3 3 3>; where each
value is one CPU frequency.)

Additionally there seem to be some fuses to eventually override
that behavior slightly (qcom,override-corner-acc-map).
See: https://source.codeaurora.org/quic/la/kernel/msm-3.10/tree/arch/arm/boot/dts/qcom/msm8916-regulator.dtsi?h=LA.BR.1.2.9.1-02310-8x16.0#n29

On mainline this is currently entirely handled by the CPR driver,
and the register sequence for QCS404 actually looks a bit more
complicated... Hmm.

The reason I mention all this: At least as I understand it,
this isn't much different from the VDD_MX scaling. Essentially it
doesn't strictly have something to do with the voltage scaling
we do for CPR (VDD_APC), but rather it seems to be just another
requirement when scaling the CPU frequency.

In other words, I wonder if we should separate this into yet another
power domain driver, and then reference it independently from CPR
as additional required-opps for both MSM8916 and QCS404.

CPR would then be only responsible for the actual adaptive voltage
scaling of VDD_APC.

Does that make sense?

Thanks,
Stephan
