Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94E8F9C960
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2019 08:22:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729661AbfHZGWj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Aug 2019 02:22:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:40406 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729549AbfHZGWj (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Aug 2019 02:22:39 -0400
Received: from localhost (unknown [122.178.200.231])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3D38C2173E;
        Mon, 26 Aug 2019 06:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566800558;
        bh=KFNbrZ6qEMsYfgZwnS0s0XTNmO51VafzOnYIKfvEtbI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ea522QzFQ9vOTMiawCaZIDJ2Je1TDRwroFiuvoq2mjLR8wwWYxqCu8NpFOybU5DmE
         ZH5VssvGnAhUotWhzXE8WZ3sOjQPe9RPHsbowXNVYaNvxBrrRImJB/ymhar6dN/tsE
         IwDCxWCY7ksFGHAavCV2cKCpoGoolsrDxy3wlMaE=
Date:   Mon, 26 Aug 2019 11:51:27 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] clk: qcom: clk-rpmh: Convert to parent data scheme
Message-ID: <20190826062127.GH2672@vkoul-mobl>
References: <20190822170140.7615-1-vkoul@kernel.org>
 <20190822170140.7615-3-vkoul@kernel.org>
 <20190824063115.GW26807@tuxbook-pro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190824063115.GW26807@tuxbook-pro>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23-08-19, 23:31, Bjorn Andersson wrote:
> On Thu 22 Aug 10:01 PDT 2019, Vinod Koul wrote:
> 
> > Convert the rpmh clock driver to use the new parent data scheme by
> > specifying the parent data for board clock.
> > 
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> >  drivers/clk/qcom/clk-rpmh.c | 10 ++++++++--
> >  1 file changed, 8 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> > index c3fd632af119..0bced7326a20 100644
> > --- a/drivers/clk/qcom/clk-rpmh.c
> > +++ b/drivers/clk/qcom/clk-rpmh.c
> > @@ -95,7 +95,10 @@ static DEFINE_MUTEX(rpmh_clk_lock);
> >  		.hw.init = &(struct clk_init_data){			\
> >  			.ops = &clk_rpmh_ops,				\
> >  			.name = #_name,					\
> > -			.parent_names = (const char *[]){ "xo_board" },	\
> > +			.parent_data =  &(const struct clk_parent_data){ \
> > +					.fw_name = "xo_board",		\
> > +					.name = "xo_board",		\
> 
> Iiuc .name here refers to the global clock namespace and .fw_name refers
> to the device_node local name space. As such I really prefer this to be:
> 
>   .fw_name = "xo",
>   .name = "xo_board",
> 
> This ensures the backwards compatibility (when using global lookup),
> without complicating the node-local naming.

Sure, while thinking more on this, should we finalize the name as xo or
cxo, I see latter being also used at few places. It would be great to
get a name and stick to it for longer time :)

-- 
~Vinod
