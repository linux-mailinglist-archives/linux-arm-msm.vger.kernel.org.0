Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED9A740CBDE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Sep 2021 19:44:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230444AbhIORp0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Sep 2021 13:45:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230442AbhIORp0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Sep 2021 13:45:26 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9167C061575
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Sep 2021 10:44:06 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id c42-20020a05683034aa00b0051f4b99c40cso4688796otu.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Sep 2021 10:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=wonPalCaX9F+KZ2w00RyDLy7np4dOZ17CrNdnuNESbA=;
        b=mNCvYC2WClusDkPNwnmFtjCDCfn06nSK2llI5Ef1Ia9EHmBKJWFCkWyTZLUOc+G8tG
         6pf43nPo6gQAem+fL5U9WJ625jkwjlKE48QqZDKE4W7n0GNPw1HdoCEolCfb9CrG1HNJ
         OQNbP/dI8KTpv9ucV8ns+U0UHTsUxxoUs1XeY88mf52kaoJIPlzbFZ8lZcW8pOezeMGt
         6ZFI+MjD9pFnchRJmy6A+IpABaSgHrzDGraq4tdjyryKCE/DUTFRkrOFFWrrgSPqZgHm
         2uUFj39tFYiUMAmExkiXlX0EkMNNYDUhC1oxMiwWkpsru1MQHUEUJF39RNGhDybagNfb
         7Xsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wonPalCaX9F+KZ2w00RyDLy7np4dOZ17CrNdnuNESbA=;
        b=vt+gyp0mdokA6AOJZMyVaMqbOfEsmSdjFdUxdrx/qNvI4vTd/aukYLjy8qwsAg/D0P
         Vss70jE//Fcz5QSsN9rkMqUuzILb1mTQk+BJa02dzHSrnN+tdrOLRRlGlNjEiPfq2t9U
         pnqesu1iu7Hl1ldBRk2sq15W1ICHHUVqxF0xA8yF+irMvThfxhRiV6pYyWuBPSv8/CpD
         4PaiegrNvEeT770FCE3USZmmfgLcDaPT7JKi1dRumORpAJeXtLwzK4P073ztaSyqZPu0
         aIhYwSkKU0dcppY/vpeG6ucAxMfB+tNuJCysZH2+5LqIMCf/yY1rmDSivPH9s/gp5ynO
         ncNw==
X-Gm-Message-State: AOAM5314xBoMSEGH4BWomwU+FRFePgT+tb940LxfksLEb6gK6vVEg+5k
        d4uMohIjtRucCZMxsy2/E1WTFg==
X-Google-Smtp-Source: ABdhPJwduwJaaSf18cVPub1E76Ic7TyCUAoDWoKdRIviHZi19eKVOUFLbADTd+O5CNE6j3YNYRqilQ==
X-Received: by 2002:a9d:4003:: with SMTP id m3mr1072678ote.62.1631727846158;
        Wed, 15 Sep 2021 10:44:06 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id x22sm178067oox.26.2021.09.15.10.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Sep 2021 10:44:05 -0700 (PDT)
Date:   Wed, 15 Sep 2021 10:44:56 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] clk: qcom: smd-rpm: Add rate hooks for
 clk_smd_rpm_branch_ops
Message-ID: <YUIxGH17+AjVluCM@ripper>
References: <20210914025554.5686-1-shawn.guo@linaro.org>
 <20210914025554.5686-2-shawn.guo@linaro.org>
 <163165658855.763609.14080313241484048687@swboyd.mtv.corp.google.com>
 <20210915150526.GE25255@dragon>
 <YUIr/002dfXxDWDY@ripper>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YUIr/002dfXxDWDY@ripper>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 15 Sep 10:23 PDT 2021, Bjorn Andersson wrote:

> On Wed 15 Sep 08:05 PDT 2021, Shawn Guo wrote:
> 
> > On Tue, Sep 14, 2021 at 02:56:28PM -0700, Stephen Boyd wrote:
> > > Quoting Shawn Guo (2021-09-13 19:55:52)
> > > > On QCM2290 platform, the clock xo_board runs at 38400000, while the
> > > > child clock bi_tcxo needs to run at 19200000.  That said,
> > > > clk_smd_rpm_branch_ops needs the capability of setting rate. Add rate
> > > > hooks into clk_smd_rpm_branch_ops to make it possible.
> > > 
> > > This doesn't sound right. The branch is a simple on/off. If xo_board is
> > > 38.4MHz, then there is an internal divider in the SoC that makes bi_tcxo
> > > (i.e. the root of the entire clk tree) be 19.2MHz. We don't model the
> > > divider, I guess because it isn't very important to. Instead, we tack on
> > > a divider field and implement recalc_rate op. See clk-rpmh.c in the qcom
> > > directory for this.
> > 
> > Thanks for the comment, Stephen!  To be honest, I copied the
> > implementation from vendor kernel, and wasn't really sure if it's
> > correct or the best.
> > 
> > So here is what I get based on your suggestion.  Let's me know if
> > it's how you wanted it to be.  Thanks!
> > 
> > Shawn
> > 
> > ----8<---------
> > 
> > From 23dda79fee412738f046b89bdd20ef95a24c35cc Mon Sep 17 00:00:00 2001
> > From: Shawn Guo <shawn.guo@linaro.org>
> > Date: Wed, 15 Sep 2021 22:00:32 +0800
> > Subject: [PATCH] clk: qcom: smd-rpm: Add a divider field for branch clock
> > 
> > Similar to clk-rpmh, clk-smd-rpm has the same need to handle the case
> > where an internal divider is there between xo_board and bi_tcxo.  The
> > change is made in the a back compatible way below.
> > 
> >  - Add div field to struct clk_smd_rpm, and have
> >    __DEFINE_CLK_SMD_RPM_BRANCH() assign it.
> > 
> >  - Update all existing __DEFINE_CLK_SMD_RPM_BRANCH() wrappers to pass a
> >    zero div.
> > 
> >  - Add DEFINE_CLK_SMD_RPM_BRANCH_DIV() which doesn't take rate argument
> >    but div.
> > 
> >  - Update clk_smd_rpm_recalc_rate() to handle div and add it as
> >    .recalc_rate of clk_smd_rpm_branch_ops.
> > 
> 
> This looks good to me.
> 
> And the confirmed that the xo_board in sdm630.dtsi (and hence SDM660) is
> wrong, it should be 38.4MHz as well.
> 
> Unfortunately adding the appropriate divider to the sdm660 bcxo would
> break existing .dtsi (but we can probably convince the community that it
> would be ok, if we do it now).
> 

And as I sent that and was going to close the editor...

In contrast to clk-rpmh we already have a "rate" defined for each
clock in clk-smd-rpm, it's just that we don't let anyone know what it is
for branches.

But with your change of defining recalc_rate() for the branches we would
return 19.2MHz for the tcxo - without specifying a divider.

So your patch can be reduced to simply specifying recalc_rate() - i.e.
the last line in your patch.

I tested this on my sdm660 board, by updating xo_board and ensuring that
all nodes referring to "xo" refers to rpmcc tcxo intead and it boots
just fine. And it's backwards compatible with existing DT!



However, as we specify recalc_rate(), we'd start reporting that all the
buffered XO clocks are ticking at 1kHz, so I suspect that there might be
things that doesn't work. This is done so that rate/1000 becomes 0 or 1
for the branches.

But that will happen with the patch as you have given it as well, until
we've defined all the divs.

In other words, I don't think we should introduce the div, but rather
just rely on the "rate". And for the buffered clocks we need to correct
the rate - while ensuring that we pass a binary enable/rate to the
interface.

Regards,
Bjorn

> Regards,
> Bjorn
> 
> > Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> > ---
> >  drivers/clk/qcom/clk-smd-rpm.c | 23 ++++++++++++++++-------
> >  1 file changed, 16 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
> > index 66d7807ee38e..66ef0d3795fd 100644
> > --- a/drivers/clk/qcom/clk-smd-rpm.c
> > +++ b/drivers/clk/qcom/clk-smd-rpm.c
> > @@ -66,13 +66,14 @@
> >  	}
> >  
> >  #define __DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, _active, type, r_id,    \
> > -				    stat_id, r, key)			      \
> > +				    stat_id, r, key, _div)		      \
> >  	static struct clk_smd_rpm _platform##_##_active;		      \
> >  	static struct clk_smd_rpm _platform##_##_name = {		      \
> >  		.rpm_res_type = (type),					      \
> >  		.rpm_clk_id = (r_id),					      \
> >  		.rpm_status_id = (stat_id),				      \
> >  		.rpm_key = (key),					      \
> > +		.div = (_div),						      \
> >  		.branch = true,						      \
> >  		.peer = &_platform##_##_active,				      \
> >  		.rate = (r),						      \
> > @@ -92,6 +93,7 @@
> >  		.rpm_status_id = (stat_id),				      \
> >  		.active_only = true,					      \
> >  		.rpm_key = (key),					      \
> > +		.div = (_div),						      \
> >  		.branch = true,						      \
> >  		.peer = &_platform##_##_name,				      \
> >  		.rate = (r),						      \
> > @@ -112,7 +114,12 @@
> >  
> >  #define DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, _active, type, r_id, r)   \
> >  		__DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, _active, type,  \
> > -		r_id, 0, r, QCOM_RPM_SMD_KEY_ENABLE)
> > +		r_id, 0, r, QCOM_RPM_SMD_KEY_ENABLE, 0)
> > +
> > +#define DEFINE_CLK_SMD_RPM_BRANCH_DIV(_platform, _name, _active, type, r_id,  \
> > +				      _div)				      \
> > +		__DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, _active, type,  \
> > +		r_id, 0, 0, QCOM_RPM_SMD_KEY_ENABLE, _div)
> >  
> >  #define DEFINE_CLK_SMD_RPM_QDSS(_platform, _name, _active, type, r_id)	      \
> >  		__DEFINE_CLK_SMD_RPM(_platform, _name, _active, type, r_id,   \
> > @@ -121,12 +128,12 @@
> >  #define DEFINE_CLK_SMD_RPM_XO_BUFFER(_platform, _name, _active, r_id)	      \
> >  		__DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, _active,	      \
> >  		QCOM_SMD_RPM_CLK_BUF_A, r_id, 0, 1000,			      \
> > -		QCOM_RPM_KEY_SOFTWARE_ENABLE)
> > +		QCOM_RPM_KEY_SOFTWARE_ENABLE, 0)
> >  
> >  #define DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(_platform, _name, _active, r_id) \
> >  		__DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, _active,	      \
> >  		QCOM_SMD_RPM_CLK_BUF_A, r_id, 0, 1000,			      \
> > -		QCOM_RPM_KEY_PIN_CTRL_CLK_BUFFER_ENABLE_KEY)
> > +		QCOM_RPM_KEY_PIN_CTRL_CLK_BUFFER_ENABLE_KEY, 0)
> >  
> >  #define to_clk_smd_rpm(_hw) container_of(_hw, struct clk_smd_rpm, hw)
> >  
> > @@ -140,6 +147,7 @@ struct clk_smd_rpm {
> >  	bool branch;
> >  	struct clk_smd_rpm *peer;
> >  	struct clk_hw hw;
> > +	u8 div;
> >  	unsigned long rate;
> >  	struct qcom_smd_rpm *rpm;
> >  };
> > @@ -370,10 +378,10 @@ static unsigned long clk_smd_rpm_recalc_rate(struct clk_hw *hw,
> >  
> >  	/*
> >  	 * RPM handles rate rounding and we don't have a way to
> > -	 * know what the rate will be, so just return whatever
> > -	 * rate was set.
> > +	 * know what the rate will be, so just return divided parent
> > +	 * rate or whatever rate was set.
> >  	 */
> > -	return r->rate;
> > +	return r->div ? parent_rate / r->div : r->rate;
> >  }
> >  
> >  static int clk_smd_rpm_enable_scaling(struct qcom_smd_rpm *rpm)
> > @@ -416,6 +424,7 @@ static const struct clk_ops clk_smd_rpm_ops = {
> >  static const struct clk_ops clk_smd_rpm_branch_ops = {
> >  	.prepare	= clk_smd_rpm_prepare,
> >  	.unprepare	= clk_smd_rpm_unprepare,
> > +	.recalc_rate	= clk_smd_rpm_recalc_rate,
> >  };
> >  
> >  DEFINE_CLK_SMD_RPM(msm8916, pcnoc_clk, pcnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 0);
> > -- 
> > 2.17.1
> > 
