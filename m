Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3B11995B7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2019 16:01:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731957AbfHVOAc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Aug 2019 10:00:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:42624 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726096AbfHVOAc (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Aug 2019 10:00:32 -0400
Received: from localhost (unknown [171.61.89.145])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D5B0522CE3;
        Thu, 22 Aug 2019 14:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566482431;
        bh=DWwwr3qPkjE4y1klETI0/GZhGb33KyLJV8JKbxYx8mI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YvQJ7oGkcjX82C23lfVZfJm+UzNfRuqFQPgn7k1BocoUF1hWtH6zzXyf1nsxPScJV
         VjLpanuLLNZj6ff3bpKSk+gvNOFOXjvgF+99cxCKinKhMAGe09mrLcWV5V60yoE+b7
         wapypQsCjygzhmEuThSy+Famze8EnfqcYwxdJ5m4=
Date:   Thu, 22 Aug 2019 19:29:17 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] clk: qcom: clk-rpmh: Convert to parent data scheme
Message-ID: <20190822135917.GP12733@vkoul-mobl.Dlink>
References: <20190819073947.17258-1-vkoul@kernel.org>
 <20190819073947.17258-3-vkoul@kernel.org>
 <20190820050829.GJ26807@tuxbook-pro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190820050829.GJ26807@tuxbook-pro>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19-08-19, 22:08, Bjorn Andersson wrote:
> On Mon 19 Aug 00:39 PDT 2019, Vinod Koul wrote:
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
> > index c3fd632af119..16d689e5bb3c 100644
> > --- a/drivers/clk/qcom/clk-rpmh.c
> > +++ b/drivers/clk/qcom/clk-rpmh.c
> > @@ -95,7 +95,10 @@ static DEFINE_MUTEX(rpmh_clk_lock);
> >  		.hw.init = &(struct clk_init_data){			\
> >  			.ops = &clk_rpmh_ops,				\
> >  			.name = #_name,					\
> > -			.parent_names = (const char *[]){ "xo_board" },	\
> > +			.parent_data =  &(const struct clk_parent_data){ \
> > +					.fw_name = "xo",		\
> > +					.name = "xo",		\
> 
> Shouldn't .name be "xo_board" to retain backwards compatibility?

Yes I have updated that

Thanks
-- 
~Vinod
