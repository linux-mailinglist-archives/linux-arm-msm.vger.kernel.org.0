Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78C9E3F7B69
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Aug 2021 19:18:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234054AbhHYRSn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Aug 2021 13:18:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232493AbhHYRSm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Aug 2021 13:18:42 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE2E4C061757
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Aug 2021 10:17:56 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id w19so308940oik.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Aug 2021 10:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=M/sU0CU7x+4zcBgKHZ1x1BhVQLsUMGGMN8tY9Wv96W8=;
        b=Mmg/23v9r01eEz7kGLuYbdxyrhadb91CE2h7h7fHk01+AnHWwYzaFp6PMvnOVJxxUX
         Ko9wmTCiiU8wi4Vznv44yZtu5BFOrEitzGcYI451pUKshXXXyriE3ELAEeVbjhUolc9F
         WixZpAckRRxXSfMl4SdG/QwNbSLSqhh7/jnIp5I2u9CqV/GPkbWiutr8WJqYjxNgiTLL
         yKc3raE7Eal8CvCALzYXtm9sjS9a6A8m4XZRy7hyZHN5q7EIWiF16/V+zkpFTjMcUcOY
         8cnYv1iAHL2AsXAxIGDhwFob0SVxKn5QsxrsbRxvfSKl/S3bERbaZekvRUEEwRb/JRN5
         pgSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=M/sU0CU7x+4zcBgKHZ1x1BhVQLsUMGGMN8tY9Wv96W8=;
        b=U7bvihqUNv7gWkYPgiRjllIfb66qHiGQfyun9H6eZVpgOVo+YvRmO1x7PbNGAj15A5
         GjovaiAAdwCqRbAp9xTmqZygBCN8f4bfPwo2erMddr94uYir0p/D7IRkNo2Jv+XaUnaG
         1iJiGmAQggK+nwGH6CyymVbswptrppxayxYqSs9DZxA469nEhh6EEiJP9nv92d7lNTON
         7sztWHtbEm9Jlcdzq5xKAh7pz+M8fkdeq+cSQ3grPqWqDYlmkd/8Jg0sMjtOCEI3DgqT
         uSt5F38OKsDNhy0N5YzAGRFx1CKxo4j/EqSrKTmAP2zzUQqSqrnui8gD+9b2A32isj6Y
         Lp6Q==
X-Gm-Message-State: AOAM531VSJ70TeNXaoEgeBJxezZy0gEkhfWhh547dDeW/HA9elr1jSsH
        0NGul+foMkjlRcLdmrryPGU8tQ==
X-Google-Smtp-Source: ABdhPJzgMHbGXTHN17OnIlh1FgpR9m5QhY7tvBle8B1TJrt03iC696uUzuMmKIZVy0s0A3mHINzCPw==
X-Received: by 2002:a05:6808:690:: with SMTP id k16mr7757663oig.43.1629911876258;
        Wed, 25 Aug 2021 10:17:56 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id r25sm95305oic.13.2021.08.25.10.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 10:17:55 -0700 (PDT)
Date:   Wed, 25 Aug 2021 12:17:54 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: Re: [PATCH] clk: qcom: gcc-sdm660: Replace usage of parent_names
Message-ID: <YSZ7Qi93T4u8cKH/@builder.lan>
References: <20210824150606.678666-1-bjorn.andersson@linaro.org>
 <386db1a6-a1cd-3c7d-a88e-dc83f8a1be96@somainline.org>
 <YSV0/bFiPgY3fjPF@ripper>
 <bc2fd17a-66f4-7f60-cdbd-e3548fa4f1a4@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bc2fd17a-66f4-7f60-cdbd-e3548fa4f1a4@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 25 Aug 05:39 CDT 2021, AngeloGioacchino Del Regno wrote:

> Il 25/08/21 00:38, Bjorn Andersson ha scritto:
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
> > 
> > 
> > Does this cause a noticeable regression or it's just that we have a
> > dangling clock?
> > 
> 
> Both, actually... but sincerely I would be more for updating the DSI PHY
> drivers instead of keeping a "mock" crystal clock in there (since we do
> always specify one in DT), also because, as Marijn pointed out and as I
> can also confirm, we're seeing the same situation on multiple platforms.
> 
> That would allow us to solve the issue simply with DT, and would make us
> able to switch platforms one by one to the RPM/RPMh XO in a perfect future
> where we will be able to perform XO shutdown on selected platforms.
> 

Fixing the DSI PHY to properly acquire the reference clock using
.fw_name is the right solution in the end. But afaict sdm845, sm8150 and
sm8250 doesn't have a "xo" clock.

So that's why I'm wondering if there's a functional regression caused by
this...and hence if I need to respin this patch with the clock
remaining.

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
> > 
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
> > 
> 
> Totally fair and I totally agree.
> 
> By the way,
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> 

Thanks,
Bjorn
