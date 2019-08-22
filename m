Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D206995C9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2019 16:04:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730733AbfHVOCr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Aug 2019 10:02:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:43312 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732473AbfHVOCr (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Aug 2019 10:02:47 -0400
Received: from localhost (unknown [171.61.89.145])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0751622CE3;
        Thu, 22 Aug 2019 14:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566482566;
        bh=c65S8/JE0pz/X8+BdF45NzFA9QJJR53tkisF4bc26IE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HoyYLw2WErBxBAYXaQDRSmwu7UrvUDY82hIHaQpqYMl0aIUiFfLTwCDsnsB2CXUPz
         Dwwskk3K2elpTMsl59Nz74QmQ5xwL8ZorMrs/aYam8dfZjjg6m01kPPueNc0x0H99k
         JxeqKDrF6vCKpM/7D1LUE7rYaD2U8n/+tbag75LY=
Date:   Thu, 22 Aug 2019 19:31:34 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] clk: qcom: clk-rpmh: Add support for SM8150
Message-ID: <20190822140134.GQ12733@vkoul-mobl.Dlink>
References: <20190819073947.17258-1-vkoul@kernel.org>
 <20190819073947.17258-5-vkoul@kernel.org>
 <20190820050944.GL26807@tuxbook-pro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190820050944.GL26807@tuxbook-pro>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19-08-19, 22:09, Bjorn Andersson wrote:
> On Mon 19 Aug 00:39 PDT 2019, Vinod Koul wrote:
> > +static const struct clk_rpmh_desc clk_rpmh_sm8150 = {
> > +	.clks = sm8150_rpmh_clocks,
> > +	.num_clks = ARRAY_SIZE(sm8150_rpmh_clocks),
> > +};
> 
> Maybe an empty line here?

Sounds better

> 
> >  static struct clk_hw *of_clk_rpmh_hw_get(struct of_phandle_args *clkspec,
> >  					 void *data)
> >  {
> > @@ -453,6 +479,7 @@ static int clk_rpmh_probe(struct platform_device *pdev)
> >  
> >  static const struct of_device_id clk_rpmh_match_table[] = {
> >  	{ .compatible = "qcom,sdm845-rpmh-clk", .data = &clk_rpmh_sdm845},
> > +	{ .compatible = "qcom,sm8150-rpmh-clk", .data = &clk_rpmh_sm8150},
> >  	{ }
> >  };
> >  MODULE_DEVICE_TABLE(of, clk_rpmh_match_table);
> 
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Thanks for the review, will send an update.

-- 
~Vinod
