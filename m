Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C635F456505
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Nov 2021 22:26:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229687AbhKRV3h (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Nov 2021 16:29:37 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.50]:10537 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229587AbhKRV3h (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Nov 2021 16:29:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1637270789;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=eevGgR2flfxtU47UHQ8Ut8ktUah90rAqKAi8aBgVYuc=;
    b=fwE93d7weUqKdGcslLNUhJTd31qyJLR525JQB3YJ/YWQI2NOJh1f/DP2h5/BURxVkg
    oJmywMIZDrpM9pdJnae8BdKZtDqN+8IhBEU32u8nJMVsWoccnAQZVIMwZhI9F2osNaF0
    n/gz8ONXO2Wq20v8G6lNN6XJb95af/SeA7eYxteB6z1EUrvJ1kskyJzJH9m5t5S6XVxv
    qkx3SNYQGMBygCrko3xfCL04Rx/Eoc/SLXEwbJBefjPbtTqZsAujdTFAnkLp/d/kgCc6
    rHPORYHCo9j5WAui7N9Kd8WpuBfZNGw2hAeR3uyRqXywTCCWxBFvq/ZVKXlVqsbPc7TX
    5HIQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u267FZF9PwpcNKLVrKw7/aY="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
    by smtp.strato.de (RZmta 47.34.5 AUTH)
    with ESMTPSA id j05669xAILQTwgD
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Thu, 18 Nov 2021 22:26:29 +0100 (CET)
Date:   Thu, 18 Nov 2021 22:26:25 +0100
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Maulik Shah <mkshah@codeaurora.org>
Subject: Re: [PATCH 2/3] soc: qcom: stats: Add fixed sleep stats offset for
 older RPM firmwares
Message-ID: <YZbFAQVeLUh4vFLD@gerhold.net>
References: <20211018110803.32777-1-stephan@gerhold.net>
 <20211018110803.32777-3-stephan@gerhold.net>
 <YZWlyiY0FH489cYz@builder.lan>
 <YZYu5scy/fAetKaH@gerhold.net>
 <YZa+iks+4yKRa7Xt@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YZa+iks+4yKRa7Xt@builder.lan>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Nov 18, 2021 at 02:58:50PM -0600, Bjorn Andersson wrote:
> On Thu 18 Nov 04:45 CST 2021, Stephan Gerhold wrote:
> 
> > On Wed, Nov 17, 2021 at 07:00:58PM -0600, Bjorn Andersson wrote:
> > > On Mon 18 Oct 06:08 CDT 2021, Stephan Gerhold wrote:
> > > 
> > > > Not all RPM firmware versions have the dynamic sleep stats offset
> > > > available. Older versions use a fixed offset of 0xdba0.
> > > > 
> > > > Add support for this using a new qcom,rpm-legacy-stats compatible
> > > > that can be used for older SoCs like MSM8916.
> > > > 
> > > > Suggested-by: Maulik Shah <mkshah@codeaurora.org>
> > > > Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> > > > ---
> > > >  drivers/soc/qcom/qcom_stats.c | 10 ++++++++++
> > > >  1 file changed, 10 insertions(+)
> > > > 
> > > > diff --git a/drivers/soc/qcom/qcom_stats.c b/drivers/soc/qcom/qcom_stats.c
> > > > index 817505bd99b5..67728de718fd 100644
> > > > --- a/drivers/soc/qcom/qcom_stats.c
> > > > +++ b/drivers/soc/qcom/qcom_stats.c
> > > > @@ -237,6 +237,15 @@ static const struct stats_config rpm_data = {
> > > >  	.subsystem_stats_in_smem = false,
> > > >  };
> > > >  
> > > > +/* Older RPM firmwares have the stats at a fixed offset instead */
> > > > +static const struct stats_config rpm_legacy_data = {
> > > > +	.stats_offset = 0xdba0,
> > > > +	.num_records = 2,
> > > > +	.appended_stats_avail = true,
> > > > +	.dynamic_offset = false,
> > > > +	.subsystem_stats_in_smem = false,
> > > > +};
> > > 
> > > Is this the only variation that existed back in the "legacy" days? Will
> > > we end up with multiple "legacy" variants?
> > > 
> > 
> > I think most old platforms that are still somewhat maintained use 0xdba0
> > (e.g. MSM8916, MSM8974, APQ8084, MSM8226).
> > I found a different offset for APQ8064, MSM8960, but they also seem to
> > use a different stats format ("v1" instead of "v2") which is not
> > currently supported by the qcom_stats driver here.
> > 
> 
> Okay, so there's an even more legacy format as well...
> 

We could use qcom,rpm-even-more-legacy-stats for those. ;D (just kidding)

> > I guess I could add SoC-specific compatibles if you prefer (e.g.
> > "qcom,rpm-stats-msm8916"), or do you have any other suggestion?
> > 
> 
> Yes, as we have examples of another "legacy format" I would prefer that
> we sprinkle some platform names in there; and as newer platforms all
> seems to use the same format this effort should be bound to whatever old
> platforms we end up supporting.
> 
> Nit. I would prefer the qcom,msm8916-rpm-stats format though.
> 

Both sound good to me, I will send a v2 with the
"qcom,msm8916-rpm-stats" compatible instead.

Thanks,
Stephan
