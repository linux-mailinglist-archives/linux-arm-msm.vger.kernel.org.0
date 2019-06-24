Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 441A3503FC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2019 09:50:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727409AbfFXHuH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Jun 2019 03:50:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:46796 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726807AbfFXHuH (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Jun 2019 03:50:07 -0400
Received: from localhost (unknown [106.201.35.23])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5A1482089F;
        Mon, 24 Jun 2019 07:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561362607;
        bh=NUTTLothhzzOC0j5vETDOOEWK+MUpP+R2scD8KdK/uI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BXuHjSgHZJKxpUdzMa11Wo38NxGuIWwnrrv60gbZ5/K+HOSGQq11oqhRlNTEL24vq
         Q34eihSka8mFMqZ9Wx0aOwJTxCMUrkSql1oyThwmGTq/zrNqBOht+ichGirmtkBE95
         kU1YDEPUVASPDm9F1qjIJvg9GWKmC9NOObhx/FeI=
Date:   Mon, 24 Jun 2019 13:16:57 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 1/5] clk: qcom: clk-alpha-pll: Remove unnecessary cast
Message-ID: <20190624074657.GX2962@vkoul-mobl>
References: <20190612091722.9377-1-vkoul@kernel.org>
 <20190612091722.9377-2-vkoul@kernel.org>
 <20190617043734.GH750@tuxbook-pro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190617043734.GH750@tuxbook-pro>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16-06-19, 21:37, Bjorn Andersson wrote:
> On Wed 12 Jun 02:17 PDT 2019, Vinod Koul wrote:
> 
> > We have couple of instances in the driver with unnecessary
> > u64 casts, drop them.
> > 
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> >  drivers/clk/qcom/clk-alpha-pll.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
> > index 0ced4a5a9a17..b48707693ffd 100644
> > --- a/drivers/clk/qcom/clk-alpha-pll.c
> > +++ b/drivers/clk/qcom/clk-alpha-pll.c
> > @@ -832,7 +832,7 @@ static int clk_alpha_pll_postdiv_set_rate(struct clk_hw *hw, unsigned long rate,
> >  	int div;
> >  
> >  	/* 16 -> 0xf, 8 -> 0x7, 4 -> 0x3, 2 -> 0x1, 1 -> 0x0 */
> > -	div = DIV_ROUND_UP_ULL((u64)parent_rate, rate) - 1;
> > +	div = DIV_ROUND_UP_ULL(parent_rate, rate) - 1;
> 
> Afaict DIV_ROUND_UP_ULL() will first add "parent_rate" and "rate" and
> then stash this in a unsigned long long and do the division. So what
> happens if parent_rate + rate > 32 bits on a 32-bit target?
> 
> (Shouldn't there be a cast of (ll) in the macro to ULL?)

Agreed, though DIV_ROUND_DOWN_ULL does it correctly, right fix would be to make it:

#define DIV_ROUND_UP_ULL(ll, d)         DIV_ROUND_DOWN_ULL(unsigned long long(ll) + (d) - 1, (d)) 

I will post that as well..

Thanks

-- 
~Vinod
