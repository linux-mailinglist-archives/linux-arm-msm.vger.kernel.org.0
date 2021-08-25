Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B8A63F7B72
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Aug 2021 19:20:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233612AbhHYRU6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Aug 2021 13:20:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232906AbhHYRU6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Aug 2021 13:20:58 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14C26C0613C1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Aug 2021 10:20:12 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id p2so674191oif.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Aug 2021 10:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=cl05HjhOd4YjlawD0/p56yGpJ35axAZhOs6i5BBeFOs=;
        b=IhrkRAxV6XDDOu79mzcgeT8qDfmZhTxIAlDLXuoWFuDqRpVvMC8ums2jYYy1Ml3qoX
         ct5HuR+qX2hlJAXYF1i8rex/Cookm2QeZ2YlXq4inhKuCU5sg8/VwZ+WAPpU7gvoaBtc
         pGJMDe9jzdg1xpnfp7JIjJAGeRLUCO+9zYzXcOUYSvnKE7fjNz6L4uwREIQBqm9vYr+z
         emOZLJHeGMcc72/6iBByHcBzA/MfXf96iZk0i+hLEwWHAwlMq365V2DmRjxpAde1KbQT
         tZbGTR+NwuF7GM+hk7AGBiTPGtujiqVI3S/xn7HIKxuQPFTo7tOMRZvc1PWrMkfzB2Cp
         9hxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cl05HjhOd4YjlawD0/p56yGpJ35axAZhOs6i5BBeFOs=;
        b=W/RBapg3EC7XwQrdCfBBV5VCbRiZ/yXsYqFBYWj1aMDFZIMfomDOq8EsW235VVBW4r
         OwYfAwVG72dGa6IbcRJeL5rOyjVmB2SYcyexWl5KR968YNHGD7nHuWpgPbEFoAGyh/lz
         /6vbRUQKNygsi70p2/taXXHyZAWMUU5yXHm7Whr5SgJvjjGcsQupd5FbS7zZrgmHse2C
         CZizSvTzleXNmuDeZoUDlycBx/OJeSXXfeAVVKGnXIy4IHKWc3Leja914gCAOhN5rVVA
         KJFWBZUK1GWdX9wovxU1lkfdVJqd9IwxD6zDzOlnhVoQio8lRpPIdydZFdSep4kfZ15Q
         +TEg==
X-Gm-Message-State: AOAM531QjSTzywakCqr1VT4tFVM4mDM90Hk0UVjGp+R6DPFIBKQAJ9eT
        3KImL8IWcuOwVzux/ViUW5UMSA==
X-Google-Smtp-Source: ABdhPJz3tTVdfYPXKQ/Qw1UbGw+AufFf+Sce6P0LgePO8uCxsQ1RBzuS8Eq4iuiJIyT4uOvnd3kSBA==
X-Received: by 2002:aca:bfc6:: with SMTP id p189mr7638738oif.167.1629912011375;
        Wed, 25 Aug 2021 10:20:11 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id v5sm85699oos.17.2021.08.25.10.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 10:20:11 -0700 (PDT)
Date:   Wed, 25 Aug 2021 12:20:09 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        angelogioacchino.delregno@somainline.org
Subject: Re: [PATCH] clk: qcom: gcc-sdm660: Replace usage of parent_names
Message-ID: <YSZ7yQLasmTMWBaK@builder.lan>
References: <20210824150606.678666-1-bjorn.andersson@linaro.org>
 <386db1a6-a1cd-3c7d-a88e-dc83f8a1be96@somainline.org>
 <YSV0/bFiPgY3fjPF@ripper>
 <ed5d27eb-5a54-04c4-dbc4-63da80df1638@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ed5d27eb-5a54-04c4-dbc4-63da80df1638@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 25 Aug 11:00 CDT 2021, Marijn Suijten wrote:

> Hi Bjorn,
> 
> On 8/25/21 12:38 AM, Bjorn Andersson wrote:
> > On Tue 24 Aug 13:46 PDT 2021, Marijn Suijten wrote:
> > 
> > > Hi Bjorn,
> > > 
> > > Thanks for this cleanup, that's needed and much appreciated!
> > > 
> > > On 8/24/21 5:06 PM, Bjorn Andersson wrote:
> > > > Using parent_data and parent_hws, instead of parent_names, does protect
> > > > against some cases of incompletely defined clock trees. While it turns
> > > > out that the bug being chased this time was totally unrelated, this
> > > > patch converts the SDM660 GCC driver to avoid such issues.
> > > > 
> > > > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > 
> > > 
> > > Tested-by: Marijn Suijten <marijn.suijten@somainline.org>
> > > 
> > > On the Sony Xperia XA2 Ultra, bar the necessary change in the 14NM DSI PHY
> > > driver commented below.
> > > 
> > > > [..]
> > > > -
> > > > -static struct clk_fixed_factor xo = {
> > > > -	.mult = 1,
> > > > -	.div = 1,
> > > > -	.hw.init = &(struct clk_init_data){
> > > > -		.name = "xo",
> > > > -		.parent_names = (const char *[]){ "xo_board" },
> > > > -		.num_parents = 1,
> > > > -		.ops = &clk_fixed_factor_ops,
> > > > -	},
> > > > -};
> > > 
> > > 
> > > Removing the global "xo" clock makes it so that our 14nm DSI PHY does not
> > > have a parent clock anymore, as the clock is called "xo_board" nowadays
> > > ("xo" in the position of fw_name is, as you know, only local to this driver
> > > because it is named that way in the clock-names property). We (SoMainline)
> > > suffer the same DSI PHY hardcoding issue on many other boards and are at
> > > this point investigating whether to provide &xo_board in DT like any other
> > > sane driver.  Do you happen to know if work is already underway to tackle
> > > this?
> > > 
> > 
> > As far as I can tell most other platforms doesn't define "xo" either.
> > E.g. according to debugfs dsi0vco_clk doesn't have a parent on sdm845...
> > 
> > Sounds like we should update the dsi phys to specify a fw_name and
> > update binding and dts to provide this...
> 
> 
> I'm all for using .fw_name there, and I hope we all agree that clock
> dependencies based on global names should become a thing of the past; every
> such inter-driver dependency should be clearly visible in the DT.  We
> (SoMainline) can tackle this DSI side if no-one else is working on it yet.
> 
> > Does this cause a noticeable regression or it's just that we have a
> > dangling clock?
> 
> 
> Unfortunately this regresses yes, starting with:
> 
>     dsi0n1_postdiv_clk: Zero divisor and CLK_DIVIDER_ALLOW_ZERO not set
> 
> And proceeding with more such errors on different clocks, clocks getting
> stuck or failing to update, and the panel never showing anything at all.
> 
> Should we fix DSI PHYs first and let this patch sit for a while, or keep the
> implicit global "xo" clock just a little while longer until that's over
> with?
> 

Thanks, should have read your email as well before replying to the
other.

I will respin this with "xo" intact, then once we've fixed up the DSI
code we can drop it.


But I still don't understand why we don't have this problem on e.g.
sdm845. I must be missing something...

> Either way, feel free to attach my:
> 
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> 
> After that.
> 
> > > >    static struct clk_alpha_pll gpll0_early = {
> > > >    	.offset = 0x0,
> > > >    	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
> > > > @@ -158,7 +35,9 @@ static struct clk_alpha_pll gpll0_early = {
> > > >    		.enable_mask = BIT(0),
> > > >    		.hw.init = &(struct clk_init_data){
> > > >    			.name = "gpll0_early",
> > > > -			.parent_names = (const char *[]){ "xo" },
> > > > +			.parent_data = &(const struct clk_parent_data){
> > > > +				.fw_name = "xo",
> > > > +			},
> > > 
> > > 
> > > I wish we could use .parent_names for a list of .fw_name's too
> > 
> > Afaict specifying "name" in struct clk_parent_data is the same as using
> > parent_names. But I'm not up to speed on the details of how to migrate
> > the dsi phys.
> 
> 
> Yes it is, both do _not_ look at clocks specified in DT before "falling
> back" to global names (that only happens when both .name and .fw_name are
> specified).  I'm sort of expressing the desire for .parent_fw_names here in
> hopes of phasing out global clock names on DT platforms altogether.  We
> definitely shouldn't rework .parent_names to support both, that only causes
> confusion and an implicit fallback to global clocks when the DT is
> under-specifying the required clocks is exactly what we're trying to avoid.
> 
> > > > [..]
> > > > @@ -265,7 +270,7 @@ static struct clk_rcg2 blsp1_qup1_i2c_apps_clk_src = {
> > > >    	.freq_tbl = ftbl_blsp1_qup1_i2c_apps_clk_src,
> > > >    	.clkr.hw.init = &(struct clk_init_data){
> > > >    		.name = "blsp1_qup1_i2c_apps_clk_src",
> > > > -		.parent_names = gcc_parent_names_xo_gpll0_gpll0_early_div,
> > > > +		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
> > > >    		.num_parents = 3,
> > > 
> > > 
> > > How about using ARRAY_SIZE(gcc_parent_data_xo_gpll0_gpll0_early_div) now?
> > > Same for every other occurrence of this pattern.
> > > 
> > 
> > I omitted that because it felt unrelated to the change I was doing, but
> > it could certainly be done.
> 
> 
> Fair, if done at all it should end up in a separate (2/2) patch or I'll take
> care of this in a followup.
> 

Sounds good, I'd be happy to give you a review on that patch :)

Regards,
Bjorn
