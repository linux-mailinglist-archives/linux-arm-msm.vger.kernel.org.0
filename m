Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77061455959
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Nov 2021 11:46:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245756AbhKRKtR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Nov 2021 05:49:17 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.54]:25345 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245753AbhKRKtL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Nov 2021 05:49:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1637232364;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=pC5o60YUkoMsBuPVxLeGITzGH28aHnuOd4z40O4VA3U=;
    b=m+yS//D5VyJT9xk9rgEzC8zWapycpdqbSr5rQcmcBbb+ofvn9Tp/DEIHVib/Tsf6B7
    EPxTZjlyzIIIYnjV4HClYtGunsC5252eYIpxyTrt71WR1P8v0F+CuvArZ5DKmDRQIico
    14CtZ2gV/PtXkOtnoWKjhIVTUprRfczj42roO5fNwEijyTs3nu5T337UM7WdDOJ8guZp
    TmgoD9nD4NCN5IQ1xou5b4hOq16XPL5PEbN8FxbziU7Tsfr3EOIRYPnTyO2WeLodOV7l
    ptaFP8N+q4+ZSeBepLoinaCFAiUA2qzz6XBBX1pkOsNkx6/StlAYfPA59h2irvA5kouI
    uZsA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u267FZF9PwpcNKLVrKw7/aY="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
    by smtp.strato.de (RZmta 47.34.5 AUTH)
    with ESMTPSA id j05669xAIAk1s2m
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Thu, 18 Nov 2021 11:46:01 +0100 (CET)
Date:   Thu, 18 Nov 2021 11:45:58 +0100
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Maulik Shah <mkshah@codeaurora.org>
Subject: Re: [PATCH 2/3] soc: qcom: stats: Add fixed sleep stats offset for
 older RPM firmwares
Message-ID: <YZYu5scy/fAetKaH@gerhold.net>
References: <20211018110803.32777-1-stephan@gerhold.net>
 <20211018110803.32777-3-stephan@gerhold.net>
 <YZWlyiY0FH489cYz@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YZWlyiY0FH489cYz@builder.lan>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Nov 17, 2021 at 07:00:58PM -0600, Bjorn Andersson wrote:
> On Mon 18 Oct 06:08 CDT 2021, Stephan Gerhold wrote:
> 
> > Not all RPM firmware versions have the dynamic sleep stats offset
> > available. Older versions use a fixed offset of 0xdba0.
> > 
> > Add support for this using a new qcom,rpm-legacy-stats compatible
> > that can be used for older SoCs like MSM8916.
> > 
> > Suggested-by: Maulik Shah <mkshah@codeaurora.org>
> > Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> > ---
> >  drivers/soc/qcom/qcom_stats.c | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> > 
> > diff --git a/drivers/soc/qcom/qcom_stats.c b/drivers/soc/qcom/qcom_stats.c
> > index 817505bd99b5..67728de718fd 100644
> > --- a/drivers/soc/qcom/qcom_stats.c
> > +++ b/drivers/soc/qcom/qcom_stats.c
> > @@ -237,6 +237,15 @@ static const struct stats_config rpm_data = {
> >  	.subsystem_stats_in_smem = false,
> >  };
> >  
> > +/* Older RPM firmwares have the stats at a fixed offset instead */
> > +static const struct stats_config rpm_legacy_data = {
> > +	.stats_offset = 0xdba0,
> > +	.num_records = 2,
> > +	.appended_stats_avail = true,
> > +	.dynamic_offset = false,
> > +	.subsystem_stats_in_smem = false,
> > +};
> 
> Is this the only variation that existed back in the "legacy" days? Will
> we end up with multiple "legacy" variants?
> 

I think most old platforms that are still somewhat maintained use 0xdba0
(e.g. MSM8916, MSM8974, APQ8084, MSM8226).
I found a different offset for APQ8064, MSM8960, but they also seem to
use a different stats format ("v1" instead of "v2") which is not
currently supported by the qcom_stats driver here.

I guess I could add SoC-specific compatibles if you prefer (e.g.
"qcom,rpm-stats-msm8916"), or do you have any other suggestion?

Thanks,
Stephan
