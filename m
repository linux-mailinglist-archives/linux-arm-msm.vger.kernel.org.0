Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 072A717965B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2020 18:09:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729389AbgCDRJo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Mar 2020 12:09:44 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:43156 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726915AbgCDRJo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Mar 2020 12:09:44 -0500
Received: by mail-pl1-f193.google.com with SMTP id x17so1266166plm.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2020 09:09:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=dItOkhPJDUpYFTNol2a7MlqjygGGU4rVaI43p4O8xZ0=;
        b=Lk2kj+Wg+uxMhy6Op8iAbbhlA8OkY+U+/Kd6XDKA/s3lLf1+RAk7ViRlew9D/jd2wU
         3B+RGi42mLqFZKGzVy+YwUH3Ygz1l3OMhTGYPak5tBdTS/sAnjuu7i85Uh+KinCTQ/iy
         mHWta6g92+tBAWR2INwAWXhrv5NBCbGkWsrsA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=dItOkhPJDUpYFTNol2a7MlqjygGGU4rVaI43p4O8xZ0=;
        b=jFUxVENXCxdSnz7VTsKl0943gKjmFQRbx+Pg7PXz1CdQVzEw/NSpYDATanLS2CrdKC
         LhfZzpv66AJq3oxDiGG8zivlgjitgcrQNNEEi2VMZ95hzeyfawyA1u70E7clvqTzeWIZ
         BGE2z8UJyJJuh/1HWccl/FWm6xUPXs90lNVQmt96RdrKBBH5JfE+tYr/4/ZFSA7Vn6/O
         lTH/UtJySCj3px7AK3BZm4BwlM+PGbF/IEs44dfqPzP/4pAtfmFo1JCfbAO4R69Oz3uT
         7bVGTGXmlbDaQzbV3L3fcikfCSO0MR20Y0ocsbw208iQv8J/f9HA3kpWz9NIO2otRnPl
         QZoA==
X-Gm-Message-State: ANhLgQ0cuIs8+deGwJuPCuDuszBUTYPZrCmkjeiijlG+BKzAcdZ3q+BR
        GKJMvV9lrJaziZaO2PskklGY9g==
X-Google-Smtp-Source: ADFU+vuwSSZRhhuCIdCdTpxc70BFCzAww+Ka2DRFQelVw8/RNXMZWG1fdqh/hpdtP+zmh3NaYQ4kqQ==
X-Received: by 2002:a17:90a:eb0b:: with SMTP id j11mr3946783pjz.145.1583341781976;
        Wed, 04 Mar 2020 09:09:41 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id e189sm24245654pfa.139.2020.03.04.09.09.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2020 09:09:40 -0800 (PST)
Date:   Wed, 4 Mar 2020 09:09:39 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Taniya Das <tdas@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>, robh@kernel.org,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh+dt@kernel.org, Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v1 2/2] clk: qcom: dispcc: Remove support of
 disp_cc_mdss_rscc_ahb_clk
Message-ID: <20200304170939.GR24720@google.com>
References: <1581423236-21341-1-git-send-email-tdas@codeaurora.org>
 <1581423236-21341-2-git-send-email-tdas@codeaurora.org>
 <20200303201629.GP24720@google.com>
 <f0529793-c51d-4baf-5217-173c552f4cbe@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f0529793-c51d-4baf-5217-173c552f4cbe@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Taniya,

On Wed, Mar 04, 2020 at 09:05:20AM +0530, Taniya Das wrote:
> 
> On 3/4/2020 1:46 AM, Matthias Kaehlcke wrote:
> > On Tue, Feb 11, 2020 at 05:43:56PM +0530, Taniya Das wrote:
> > > The disp_cc_mdss_rscc_ahb_clk is default enabled from hardware and thus
> > > does not require to be marked CRITICAL. This which would allow the RCG to
> > > be turned OFF when the display turns OFF and not blocking XO.
> > > 
> > > Signed-off-by: Taniya Das <tdas@codeaurora.org>
> > > ---
> > >   drivers/clk/qcom/dispcc-sc7180.c | 19 -------------------
> > >   1 file changed, 19 deletions(-)
> > > 
> > > diff --git a/drivers/clk/qcom/dispcc-sc7180.c b/drivers/clk/qcom/dispcc-sc7180.c
> > > index dd7af41..0a5d395 100644
> > > --- a/drivers/clk/qcom/dispcc-sc7180.c
> > > +++ b/drivers/clk/qcom/dispcc-sc7180.c
> > > @@ -592,24 +592,6 @@ static struct clk_branch disp_cc_mdss_rot_clk = {
> > >   	},
> > >   };
> > > 
> > > -static struct clk_branch disp_cc_mdss_rscc_ahb_clk = {
> > > -	.halt_reg = 0x400c,
> > > -	.halt_check = BRANCH_HALT,
> > > -	.clkr = {
> > > -		.enable_reg = 0x400c,
> > > -		.enable_mask = BIT(0),
> > > -		.hw.init = &(struct clk_init_data){
> > > -			.name = "disp_cc_mdss_rscc_ahb_clk",
> > > -			.parent_data = &(const struct clk_parent_data){
> > > -				.hw = &disp_cc_mdss_ahb_clk_src.clkr.hw,
> > > -			},
> > > -			.num_parents = 1,
> > > -			.flags = CLK_IS_CRITICAL | CLK_SET_RATE_PARENT,
> > > -			.ops = &clk_branch2_ops,
> > > -		},
> > > -	},
> > > -};
> > > -
> > >   static struct clk_branch disp_cc_mdss_rscc_vsync_clk = {
> > >   	.halt_reg = 0x4008,
> > >   	.halt_check = BRANCH_HALT,
> > > @@ -687,7 +669,6 @@ static struct clk_regmap *disp_cc_sc7180_clocks[] = {
> > >   	[DISP_CC_MDSS_PCLK0_CLK_SRC] = &disp_cc_mdss_pclk0_clk_src.clkr,
> > >   	[DISP_CC_MDSS_ROT_CLK] = &disp_cc_mdss_rot_clk.clkr,
> > >   	[DISP_CC_MDSS_ROT_CLK_SRC] = &disp_cc_mdss_rot_clk_src.clkr,
> > > -	[DISP_CC_MDSS_RSCC_AHB_CLK] = &disp_cc_mdss_rscc_ahb_clk.clkr,
> > >   	[DISP_CC_MDSS_RSCC_VSYNC_CLK] = &disp_cc_mdss_rscc_vsync_clk.clkr,
> > >   	[DISP_CC_MDSS_VSYNC_CLK] = &disp_cc_mdss_vsync_clk.clkr,
> > >   	[DISP_CC_MDSS_VSYNC_CLK_SRC] = &disp_cc_mdss_vsync_clk_src.clkr,
> > 
> > We found that this change leads to a panic at boot time on SC7180 devices
> > without display configuration (e.g. the SC7180 IDP with the current DT):
> > 
> > [    2.412820] SError Interrupt on CPU6, code 0xbe000411 -- SError
> > [    2.412822] CPU: 6 PID: 1 Comm: swapper/0 Tainted: G S                5.4.22 #103
> > [    2.412822] Hardware name: Qualcomm Technologies, Inc. SC7180 IDP (DT)
> > [    2.412823] pstate: 20c00089 (nzCv daIf +PAN +UAO)
> > [    2.412823] pc : regmap_mmio_read32le+0x28/0x40
> > [    2.412823] lr : regmap_mmio_read+0x44/0x6c
> > [    2.412824] sp : ffffffc01005ba90
> > [    2.412824] x29: ffffffc01005ba90 x28: 0000000000000000
> > [    2.412825] x27: 0000000000000000 x26: 0000000000000000
> > [    2.412826] x25: 0000000000000000 x24: ffffffd1f4aed018
> > [    2.412827] x23: ffffffd1f4c12148 x22: ffffff8177a6c800
> > [    2.412827] x21: 0000000000002048 x20: ffffff8177489e00
> > [    2.412828] x19: 0000000000002048 x18: 000000004a746f4b
> > [    2.412829] x17: 00000000d0e09034 x16: 000000005079b450
> > [    2.412830] x15: 000000003e3bf7ed x14: 0000000000007fff
> > [    2.412830] x13: ffffff8177309b40 x12: 0000000000000000
> > [    2.412831] x11: 0000000000000000 x10: 0000000000000000
> > [    2.412831] x9 : 0000000000000001 x8 : ffffffc011c02048
> > [    2.412832] x7 : aaaaaaaaaaaaaaaa x6 : 0000000000000000
> > [    2.412833] x5 : 0000000000000000 x4 : 0000000000000000
> > [    2.412834] x3 : 0000000000000000 x2 : ffffffc01005bb84
> > [    2.412834] x1 : 0000000000002048 x0 : 0000000080000000
> > [    2.412835] Kernel panic - not syncing: Asynchronous SError Interrupt
> > [    2.412836] CPU: 6 PID: 1 Comm: swapper/0 Tainted: G S                5.4.22 #103
> > [    2.412836] Hardware name: Qualcomm Technologies, Inc. SC7180 IDP (DT)
> > [    2.412836] Call trace:
> > [    2.412837]  dump_backtrace+0x0/0x150
> > [    2.412837]  show_stack+0x20/0x2c
> > [    2.412837]  dump_stack+0xa0/0xd8
> > [    2.412838]  panic+0x158/0x360
> > [    2.412838]  panic+0x0/0x360
> > [    2.412838]  arm64_serror_panic+0x78/0x84
> > [    2.412839]  do_serror+0x110/0x118
> > [    2.412839]  el1_error+0x84/0xf8
> > [    2.412839]  regmap_mmio_read32le+0x28/0x40
> > [    2.412840]  regmap_mmio_read+0x44/0x6c
> > [    2.412840]  _regmap_bus_reg_read+0x34/0x44
> > [    2.412841]  _regmap_read+0x88/0x164
> > [    2.412841]  regmap_read+0x54/0x78
> > [    2.412841]  clk_is_enabled_regmap+0x3c/0x8c
> > [    2.412842]  clk_core_is_enabled+0x68/0xac
> > [    2.412842]  clk_disable_unused_subtree+0x90/0x22c
> > [    2.412843]  clk_disable_unused_subtree+0x34/0x22c
> > [    2.412843]  clk_disable_unused+0x74/0x108
> > [    2.412843]  do_one_initcall+0x13c/0x2c8
> > [    2.412844]  do_initcall_level+0x144/0x16c
> > [    2.412844]  do_basic_setup+0x30/0x48
> > [    2.412844]  kernel_init_freeable+0xc4/0x140
> > [    2.412845]  kernel_init+0x14/0x100
> > [    2.412845]  ret_from_fork+0x10/0x18
> > [    2.412858] SMP: stopping secondary CPUs
> > [    2.412859] Kernel Offset: 0x11e3a00000 from 0xffffffc010000000
> > [    2.412859] PHYS_OFFSET: 0xffffffe780000000
> > [    2.412860] CPU features: 0x0006,2a80aa18
> > [    2.412860] Memory Limit: none
> > 
> 
> Hi Matthias,
> 
> The display device node is not present and we encounter this crash, would it
> be possible to add ALWAYS_ON for the MDSS GDSC and give it a try.

It still crashes when ALWAYS_ON is set for the MDSS GDSC.
