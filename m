Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0B5545525D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Nov 2021 02:51:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240998AbhKRByV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Nov 2021 20:54:21 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:62529 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239516AbhKRByV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Nov 2021 20:54:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1637200282; x=1668736282;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pHAUTMlLZUcPH+j0lo9O2t4oMTrQMjACYd/sq9HoKG0=;
  b=olT+tvH7Ueg+IPoykr2HVt6b3BBoAt/0cgs9DEpZa5OZUgVZiT0+YzNW
   d+bf1NG6gqfJjrA2Bl79E78v83G0qGN0SvI1grIxCHR+rCRNMGDO/nBP9
   cF9Z624JB4UGYWMBdyhUeKBp1mdvQDUOn8n0GXkJkUf876CG4fgnlG7pd
   E=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 17 Nov 2021 17:51:21 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2021 17:51:20 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 17 Nov 2021 17:51:19 -0800
Received: from quicinc.com (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Wed, 17 Nov
 2021 17:51:19 -0800
Date:   Wed, 17 Nov 2021 17:51:18 -0800
From:   Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
To:     Vinod Koul <vkoul@kernel.org>
CC:     <agross@kernel.org>, <bjorn.andersson@linaro.org>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <robh+dt@kernel.org>, <tglx@linutronix.de>, <maz@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <manivannan.sadhasivam@linaro.org>,
        "kernel test robot" <lkp@intel.com>
Subject: Re: [PATCH v4 3/6] clk: qcom: Add SDX65 GCC support
Message-ID: <20211118015117.GA18984@quicinc.com>
References: <cover.1637047731.git.quic_vamslank@quicinc.com>
 <b61d16ad890bcf07057f8fbd83dfffaf9812cda6.1637047731.git.quic_vamslank@quicinc.com>
 <YZNsvjwp0/AX0Hdo@matsya>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <YZNsvjwp0/AX0Hdo@matsya>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Nov 16, 2021 at 02:03:02PM +0530, Vinod Koul wrote:
> On 15-11-21, 23:38, quic_vamslank@quicinc.com wrote:
> > From: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
> > 
> > Add Global Clock Controller (GCC) support for SDX65 SoCs from Qualcomm.
> > 
> > Signed-off-by: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
> > Reported-by: kernel test robot <lkp@intel.com>
> 
> Missing support reported ??

Not mising support but it reported to delete unused varaibles and after
the fix mentioned to add the reported tag.

> 
> > +static struct clk_branch gcc_ahb_pcie_link_clk = {
> > +	.halt_reg = 0x2e004,
> > +	.halt_check = BRANCH_HALT,
> > +	.clkr = {
> > +		.enable_reg = 0x2e004,
> > +		.enable_mask = BIT(0),
> > +		.hw.init = &(struct clk_init_data){
> > +			.name = "gcc_ahb_pcie_link_clk",
> > +			.flags = CLK_IS_CRITICAL,
> > +			.ops = &clk_branch2_ops,
> > +		},
> 
> If this clk is critical then why model in linux, enable directly in probe
> and leave it...?

Yes, actually i have the code which is enabling it directly inside the probe function.
so i will remove it here.

> 
> > +static struct clk_branch gcc_pcie_0_clkref_en = {
> > +	.halt_reg = 0x88004,
> > +	.halt_check = BRANCH_HALT_DELAY,
> 
> Why delay, add a comment at least for that

sure, will do

> > +	.clkr = {
> > +		.enable_reg = 0x88004,
> > +		.enable_mask = BIT(0),
> > +		.hw.init = &(struct clk_init_data){
> > +			.name = "gcc_pcie_0_clkref_en",
> > +			.ops = &clk_branch2_ops,
> > +		},
> > +	},
> > +};
> > +
> > +static struct clk_branch gcc_pcie_aux_clk = {
> > +	.halt_reg = 0x43034,
> > +	.halt_check = BRANCH_HALT_DELAY,
> 
> Here too

will do.

> 
> > +static struct clk_branch gcc_pcie_mstr_axi_clk = {
> > +	.halt_reg = 0x43024,
> > +	.halt_check = BRANCH_HALT_VOTED,
> > +	.hwcg_reg = 0x43024,
> > +	.hwcg_bit = 1,
> > +	.clkr = {
> > +		.enable_reg = 0x6d010,
> > +		.enable_mask = BIT(1),
> > +		.hw.init = &(struct clk_init_data){
> > +			.name = "gcc_pcie_mstr_axi_clk",
> > +			.ops = &clk_branch2_ops,
> > +		},
> > +	},
> > +};
> > +
> > +static struct clk_branch gcc_pcie_pipe_clk = {
> > +	.halt_reg = 0x4303c,
> > +	.halt_check = BRANCH_HALT_DELAY,
> 
> here as well and few more places I guess
> 
> > +static struct clk_branch gcc_xo_pcie_link_clk = {
> > +	.halt_reg = 0x2e008,
> > +	.halt_check = BRANCH_HALT,
> > +	.hwcg_reg = 0x2e008,
> > +	.hwcg_bit = 1,
> > +	.clkr = {
> > +		.enable_reg = 0x2e008,
> > +		.enable_mask = BIT(0),
> > +		.hw.init = &(struct clk_init_data){
> > +			.name = "gcc_xo_pcie_link_clk",
> > +			.flags = CLK_IS_CRITICAL,
> 
> Here as well

Same as above.


> -- 
> ~Vinod
