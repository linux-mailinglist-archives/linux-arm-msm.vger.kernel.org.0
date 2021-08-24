Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 704C93F6BBD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Aug 2021 00:37:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229837AbhHXWiX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Aug 2021 18:38:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229618AbhHXWiW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Aug 2021 18:38:22 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1248EC061764
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Aug 2021 15:37:38 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id g66-20020a9d12c8000000b0051aeba607f1so41844599otg.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Aug 2021 15:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1lJfH4wOJMmxE0ajatpSxG4P5pBAHDcGb2+cRaSL28E=;
        b=ywFDc+LPrrWaukM9IgOlHwuhqaHHnTjzR+ePdmB+lZAfbkzLwyDnVF3GQSdi4e5Bk9
         E9oVUkHx+9mKjyWts6mvt30KoTW7g4x/AuP2K8Bakf+N8Adg7h83Uoyr+xX5qDnCvNim
         5UfehGbbTR34atM9vlo00eBNTRE/Xyvkrvyp+rjXNnMs8p6/2OGxDGYpIeM/4WY2yUNV
         clVyJXtCzG2eVgprJxzl/XasP7yfKhdSyH75j2PC6DboMs4VydMC6bSYvGydtmP5MFGI
         rA83yNQD9nHSRfJpVTAS0GW2vEQbCSwsb2J7roq6U83daiWnUwDsfo624ng2mybgdi0Y
         jZ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1lJfH4wOJMmxE0ajatpSxG4P5pBAHDcGb2+cRaSL28E=;
        b=de55jOge6SM4Z2nW0ALenVZf57sBk6FsZjzAiqm8nL/8sCqoA3ztbGhCEN7pJw+hm5
         2da0Ea2+hAETLQoeJNzH1QkXmQTYHMZ+I5ij99f6846Q2FJVuolapeedsiyTuRLpjtDn
         75GhxWcfqMq2m5lPce4sRkp2485Fr1g0X+m8P38fOBxcobC/9pHptWDSO4k6bGH8DgZM
         48N6cP/3lIXheF2Cd8rG47Ld7o9Q2QCNGpvtTaZW2lxLxAE4lnJSAZi7FhzI8NvODhDc
         Sm6WEGzIQ41OSUm9NYhbmcAxqPZLR6SBZLT7zYI67Jm148dxhJqYv8ARV5PAOy4DpNLu
         61sg==
X-Gm-Message-State: AOAM5319Mp6TscHIyJ3m5v33USwGuL2N+wR0UnUz33JDRzBsBCM7ErJO
        iVidtkcoiZznBIWA4nN8bYfKMw==
X-Google-Smtp-Source: ABdhPJw5Ma9QotdP5zqVWblvun23nSYXRtkobA/qBDoVv82DX73Jz4Ic+V298jXD/ocNulCAHb9mRg==
X-Received: by 2002:a05:6830:44a4:: with SMTP id r36mr7064745otv.107.1629844657267;
        Tue, 24 Aug 2021 15:37:37 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id w15sm4525430oiw.19.2021.08.24.15.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Aug 2021 15:37:36 -0700 (PDT)
Date:   Tue, 24 Aug 2021 15:38:53 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        angelogioacchino.delregno@somainline.org
Subject: Re: [PATCH] clk: qcom: gcc-sdm660: Replace usage of parent_names
Message-ID: <YSV0/bFiPgY3fjPF@ripper>
References: <20210824150606.678666-1-bjorn.andersson@linaro.org>
 <386db1a6-a1cd-3c7d-a88e-dc83f8a1be96@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <386db1a6-a1cd-3c7d-a88e-dc83f8a1be96@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 24 Aug 13:46 PDT 2021, Marijn Suijten wrote:

> Hi Bjorn,
> 
> Thanks for this cleanup, that's needed and much appreciated!
> 
> On 8/24/21 5:06 PM, Bjorn Andersson wrote:
> > Using parent_data and parent_hws, instead of parent_names, does protect
> > against some cases of incompletely defined clock trees. While it turns
> > out that the bug being chased this time was totally unrelated, this
> > patch converts the SDM660 GCC driver to avoid such issues.
> > 
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> 
> Tested-by: Marijn Suijten <marijn.suijten@somainline.org>
> 
> On the Sony Xperia XA2 Ultra, bar the necessary change in the 14NM DSI PHY
> driver commented below.
> 
> > [..]
> > -
> > -static struct clk_fixed_factor xo = {
> > -	.mult = 1,
> > -	.div = 1,
> > -	.hw.init = &(struct clk_init_data){
> > -		.name = "xo",
> > -		.parent_names = (const char *[]){ "xo_board" },
> > -		.num_parents = 1,
> > -		.ops = &clk_fixed_factor_ops,
> > -	},
> > -};
> 
> 
> Removing the global "xo" clock makes it so that our 14nm DSI PHY does not
> have a parent clock anymore, as the clock is called "xo_board" nowadays
> ("xo" in the position of fw_name is, as you know, only local to this driver
> because it is named that way in the clock-names property). We (SoMainline)
> suffer the same DSI PHY hardcoding issue on many other boards and are at
> this point investigating whether to provide &xo_board in DT like any other
> sane driver.  Do you happen to know if work is already underway to tackle
> this?
> 

As far as I can tell most other platforms doesn't define "xo" either.
E.g. according to debugfs dsi0vco_clk doesn't have a parent on sdm845...

Sounds like we should update the dsi phys to specify a fw_name and
update binding and dts to provide this...


Does this cause a noticeable regression or it's just that we have a
dangling clock?

> >   static struct clk_alpha_pll gpll0_early = {
> >   	.offset = 0x0,
> >   	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
> > @@ -158,7 +35,9 @@ static struct clk_alpha_pll gpll0_early = {
> >   		.enable_mask = BIT(0),
> >   		.hw.init = &(struct clk_init_data){
> >   			.name = "gpll0_early",
> > -			.parent_names = (const char *[]){ "xo" },
> > +			.parent_data = &(const struct clk_parent_data){
> > +				.fw_name = "xo",
> > +			},
> 
> 
> I wish we could use .parent_names for a list of .fw_name's too

Afaict specifying "name" in struct clk_parent_data is the same as using
parent_names. But I'm not up to speed on the details of how to migrate
the dsi phys.

> > [..]
> > @@ -265,7 +270,7 @@ static struct clk_rcg2 blsp1_qup1_i2c_apps_clk_src = {
> >   	.freq_tbl = ftbl_blsp1_qup1_i2c_apps_clk_src,
> >   	.clkr.hw.init = &(struct clk_init_data){
> >   		.name = "blsp1_qup1_i2c_apps_clk_src",
> > -		.parent_names = gcc_parent_names_xo_gpll0_gpll0_early_div,
> > +		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
> >   		.num_parents = 3,
> 
> 
> How about using ARRAY_SIZE(gcc_parent_data_xo_gpll0_gpll0_early_div) now?
> Same for every other occurrence of this pattern.
> 

I omitted that because it felt unrelated to the change I was doing, but
it could certainly be done.

Regards,
Bjorn
