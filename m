Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A17F6FCB88
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 May 2023 18:43:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230024AbjEIQn2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 May 2023 12:43:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229708AbjEIQn2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 May 2023 12:43:28 -0400
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D4B91BD3;
        Tue,  9 May 2023 09:43:26 -0700 (PDT)
Received: from g550jk.localnet (unknown [62.108.10.64])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 17950CED0E;
        Tue,  9 May 2023 16:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=z3ntu.xyz; s=z3ntu;
        t=1683650575; bh=QzWQiK/lo9dKK9ebOYbmAkyu7a6xBAB9as4jzTnky/Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=kgqDGXSl1jGdD8LujnoqBM43/s7L/U8DRahMWbu39i0LmMTa+2G4JrrosB6TLhoKD
         DSZ3EEtVPIs373T6Y08a3KmQJUnZw1Ndr3dQChEHDukxjDmo6IoE45H5/peRggN4Qx
         XFeIwEDQ77EDuRsNOoiffUCIDbBdrgKB7WGQ3Z0A=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: mmcc-msm8974: remove oxili_ocmemgx_clk
Date:   Tue, 09 May 2023 18:42:54 +0200
Message-ID: <2880099.ElGaqSPkdT@z3ntu.xyz>
In-Reply-To: <033952d2-af42-3980-95ab-1aea158f60f1@linaro.org>
References: <20230508153319.2371645-1-dmitry.baryshkov@linaro.org>
 <033952d2-af42-3980-95ab-1aea158f60f1@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Montag, 8. Mai 2023 18:39:24 CEST Konrad Dybcio wrote:
> On 8.05.2023 17:33, Dmitry Baryshkov wrote:
> > After the internal discussions, it looks like this clock is managed by
> > RPM itself. Linux kernel should not touch it on its own, as this causes
> > disagreement with RPM. Shutting down this clock causes the OCMEM<->GPU
> > interface to stop working, resulting in GPU hangchecks/timeouts.
> > 
> > Fixes: d8b212014e69 ("clk: qcom: Add support for MSM8974's multimedia
> > clock controller (MMCC)")
> Feels good to fix 9 year old code!
> 
> > Suggested-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> 
> +CC Luca please give it a spin on your smartwatch
> 
> (fun to say isn't it)

You didn't actually CC me here but appears to work fine on apq8026-lg-lenok 
with GPU. Ocmem inits fine and GPU runs fine also. No change in behavior 
observed.

Tested-by: Luca Weiss <luca@z3ntu.xyz>

(didn't try on msm8974 but should hopefully be fine there also)

> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> 
> Konrad
> 
> >  drivers/clk/qcom/mmcc-msm8974.c | 19 -------------------
> >  1 file changed, 19 deletions(-)
> > 
> > diff --git a/drivers/clk/qcom/mmcc-msm8974.c
> > b/drivers/clk/qcom/mmcc-msm8974.c index 277ef0065aae..82f6bad144a9 100644
> > --- a/drivers/clk/qcom/mmcc-msm8974.c
> > +++ b/drivers/clk/qcom/mmcc-msm8974.c
> > @@ -2204,23 +2204,6 @@ static struct clk_branch ocmemcx_ocmemnoc_clk = {
> > 
> >  	},
> >  
> >  };
> > 
> > -static struct clk_branch oxili_ocmemgx_clk = {
> > -	.halt_reg = 0x402c,
> > -	.clkr = {
> > -		.enable_reg = 0x402c,
> > -		.enable_mask = BIT(0),
> > -		.hw.init = &(struct clk_init_data){
> > -			.name = "oxili_ocmemgx_clk",
> > -			.parent_data = (const struct clk_parent_data[]){
> > -				{ .fw_name = "gfx3d_clk_src", .name = 
"gfx3d_clk_src" },
> > -			},
> > -			.num_parents = 1,
> > -			.flags = CLK_SET_RATE_PARENT,
> > -			.ops = &clk_branch2_ops,
> > -		},
> > -	},
> > -};
> > -
> > 
> >  static struct clk_branch ocmemnoc_clk = {
> >  
> >  	.halt_reg = 0x50b4,
> >  	.clkr = {
> > 
> > @@ -2512,7 +2495,6 @@ static struct clk_regmap *mmcc_msm8226_clocks[] = {
> > 
> >  	[MMSS_MMSSNOC_AXI_CLK] = &mmss_mmssnoc_axi_clk.clkr,
> >  	[MMSS_S0_AXI_CLK] = &mmss_s0_axi_clk.clkr,
> >  	[OCMEMCX_AHB_CLK] = &ocmemcx_ahb_clk.clkr,
> > 
> > -	[OXILI_OCMEMGX_CLK] = &oxili_ocmemgx_clk.clkr,
> > 
> >  	[OXILI_GFX3D_CLK] = &oxili_gfx3d_clk.clkr,
> >  	[OXILICX_AHB_CLK] = &oxilicx_ahb_clk.clkr,
> >  	[OXILICX_AXI_CLK] = &oxilicx_axi_clk.clkr,
> > 
> > @@ -2670,7 +2652,6 @@ static struct clk_regmap *mmcc_msm8974_clocks[] = {
> > 
> >  	[MMSS_S0_AXI_CLK] = &mmss_s0_axi_clk.clkr,
> >  	[OCMEMCX_AHB_CLK] = &ocmemcx_ahb_clk.clkr,
> >  	[OCMEMCX_OCMEMNOC_CLK] = &ocmemcx_ocmemnoc_clk.clkr,
> > 
> > -	[OXILI_OCMEMGX_CLK] = &oxili_ocmemgx_clk.clkr,
> > 
> >  	[OCMEMNOC_CLK] = &ocmemnoc_clk.clkr,
> >  	[OXILI_GFX3D_CLK] = &oxili_gfx3d_clk.clkr,
> >  	[OXILICX_AHB_CLK] = &oxilicx_ahb_clk.clkr,




