Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AB1E456498
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Nov 2021 21:58:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232201AbhKRVB4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Nov 2021 16:01:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232033AbhKRVB4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Nov 2021 16:01:56 -0500
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2B6DC06173E
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Nov 2021 12:58:55 -0800 (PST)
Received: by mail-oi1-x22d.google.com with SMTP id q25so17215822oiw.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Nov 2021 12:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=91GeqIWTjAR13+LV2uW1MXb4ha/yLI/RBUqg6aZi2YM=;
        b=gfO60vbKcjLX7FxkESmJkAFaOl261KXxMjJMjb977LzwwaKkZsuH+CmAjB/Et9WRtj
         r+u3puenNvExOt1rldDLUTKd7deM8ECGpjw5qe27xJX17q6GockbK3Xc+qgjkPfEe6yu
         Bifuv7MssSfwmJtiuZJS6A95CJT3YIOCXUwpeG8DSXXpHKMGZuf2AlUr9jMxHu7/KXnn
         dvhBO+CBG7vc4MIUSRbCrGedMcT/LBnI/FFPOTfTNklSZqtsJiXeuLWAYBOcBwrkcIBG
         BV3heSoYxjPKJG0hj02l7FtqDK2Yfwp+qWsYnPX4FbijcdeTE510W6X66LegTAjIivX4
         DKpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=91GeqIWTjAR13+LV2uW1MXb4ha/yLI/RBUqg6aZi2YM=;
        b=Y2fyAALrIj10LC7N4+P0DLE1yDWyaCve9Bfbv+adPOpvi42Sb++dirmhAT+WSvk2g8
         bv1+fmCt82G7UJlah8IPzFYNPXhn7hiig0SmtEcu93jjnfmrYa94MApRa7RDSzX86Rmc
         RaMmD59VW53VUPtmnl4LmACvulh+BRL23oWkl9512eUFerFRpctZiJWpYvvVDaTM/Ucd
         b2XSd3MDc1VjV32Pia/ao4hKyHBnmE5AVPpFTOSqYPQSMmXF/UEmTh3jCnyHXExHRzwz
         FhVUyMZvmrvoyrkSaGJKIcF63ujX2Gms/BMQAds3WuYP/okaVr6b5FCoyi9sqyokxk2V
         +RFQ==
X-Gm-Message-State: AOAM530mODLlxIN2tdsUNAI7sthLoEHxUJs9/cSMZc+ka6xC9Rn3vPB6
        2r+NZd56GktuaaY1lyLkhNJguw==
X-Google-Smtp-Source: ABdhPJw1bIFpzmIfJB9+ZCozgdSLth4gDcahcxk9K3nG5nwuRRsLxhNGvZxowtrIBV6aiv1fjrnNcg==
X-Received: by 2002:a05:6808:3096:: with SMTP id bl22mr10523944oib.92.1637269135060;
        Thu, 18 Nov 2021 12:58:55 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id n23sm190468oig.4.2021.11.18.12.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Nov 2021 12:58:54 -0800 (PST)
Date:   Thu, 18 Nov 2021 14:58:50 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Maulik Shah <mkshah@codeaurora.org>
Subject: Re: [PATCH 2/3] soc: qcom: stats: Add fixed sleep stats offset for
 older RPM firmwares
Message-ID: <YZa+iks+4yKRa7Xt@builder.lan>
References: <20211018110803.32777-1-stephan@gerhold.net>
 <20211018110803.32777-3-stephan@gerhold.net>
 <YZWlyiY0FH489cYz@builder.lan>
 <YZYu5scy/fAetKaH@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YZYu5scy/fAetKaH@gerhold.net>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 18 Nov 04:45 CST 2021, Stephan Gerhold wrote:

> On Wed, Nov 17, 2021 at 07:00:58PM -0600, Bjorn Andersson wrote:
> > On Mon 18 Oct 06:08 CDT 2021, Stephan Gerhold wrote:
> > 
> > > Not all RPM firmware versions have the dynamic sleep stats offset
> > > available. Older versions use a fixed offset of 0xdba0.
> > > 
> > > Add support for this using a new qcom,rpm-legacy-stats compatible
> > > that can be used for older SoCs like MSM8916.
> > > 
> > > Suggested-by: Maulik Shah <mkshah@codeaurora.org>
> > > Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> > > ---
> > >  drivers/soc/qcom/qcom_stats.c | 10 ++++++++++
> > >  1 file changed, 10 insertions(+)
> > > 
> > > diff --git a/drivers/soc/qcom/qcom_stats.c b/drivers/soc/qcom/qcom_stats.c
> > > index 817505bd99b5..67728de718fd 100644
> > > --- a/drivers/soc/qcom/qcom_stats.c
> > > +++ b/drivers/soc/qcom/qcom_stats.c
> > > @@ -237,6 +237,15 @@ static const struct stats_config rpm_data = {
> > >  	.subsystem_stats_in_smem = false,
> > >  };
> > >  
> > > +/* Older RPM firmwares have the stats at a fixed offset instead */
> > > +static const struct stats_config rpm_legacy_data = {
> > > +	.stats_offset = 0xdba0,
> > > +	.num_records = 2,
> > > +	.appended_stats_avail = true,
> > > +	.dynamic_offset = false,
> > > +	.subsystem_stats_in_smem = false,
> > > +};
> > 
> > Is this the only variation that existed back in the "legacy" days? Will
> > we end up with multiple "legacy" variants?
> > 
> 
> I think most old platforms that are still somewhat maintained use 0xdba0
> (e.g. MSM8916, MSM8974, APQ8084, MSM8226).
> I found a different offset for APQ8064, MSM8960, but they also seem to
> use a different stats format ("v1" instead of "v2") which is not
> currently supported by the qcom_stats driver here.
> 

Okay, so there's an even more legacy format as well...

> I guess I could add SoC-specific compatibles if you prefer (e.g.
> "qcom,rpm-stats-msm8916"), or do you have any other suggestion?
> 

Yes, as we have examples of another "legacy format" I would prefer that
we sprinkle some platform names in there; and as newer platforms all
seems to use the same format this effort should be bound to whatever old
platforms we end up supporting.

Nit. I would prefer the qcom,msm8916-rpm-stats format though.

Regards,
Bjorn
