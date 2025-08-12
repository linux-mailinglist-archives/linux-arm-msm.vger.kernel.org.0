Return-Path: <linux-arm-msm+bounces-68829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C09B22D2E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 18:21:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 891C116D5E7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 16:16:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1230D2F83A4;
	Tue, 12 Aug 2025 16:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b1sY8rUP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D192D8766;
	Tue, 12 Aug 2025 16:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755015381; cv=none; b=qMJv4wtA4FliHxS4cXElhU2nlio5F8to+lYhrddph7mlOOzIilF4KN3q2ZBf9Ylju61vynr9nyTMUE6KHxVdP1xNdCI6Li4AnG6gJlnUONMx0pw9k7lR3zZAv45/PBuT6f5+7Kyc2IrBtqGTenv1Hg1gIy8crVQBguq69uSyd80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755015381; c=relaxed/simple;
	bh=XBecqztfyjitlIby4MRK9UvSucBmQKequxv9bciCRpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ohLezRX5JINDpTWfKPn6/bB05dOf3q8d+vAzKkqbyYRS/P7R6LDKj+6oQS+qClYTsrJ8evsB/eEs24JEyRqTeocI5hkxL9faW5sDAR8HsvN/9F6/7q0zD9HcvIG8VztndV3PlpDWyKRjtOHd0khsfj+OBNF7YxsxjmFZRHolNi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b1sY8rUP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFA6FC4CEF0;
	Tue, 12 Aug 2025 16:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755015381;
	bh=XBecqztfyjitlIby4MRK9UvSucBmQKequxv9bciCRpY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b1sY8rUPaDz8gtbnafY5stBvo1y3WZ2zVAfNUFCAbTfNWJ8USrJsiP7EwDWcY1UAC
	 J7VzId8T3Cc8R048vERfSfUogPYulLTJA63LWLYFCelPKgGATPN3nkTWIVO3+MLD46
	 D/tzFWu6SGj3dUeZbA6JjFaMdGlqBqiFaUFoI/zVj9m7koN65RZh/cuadHz+p2Hbqp
	 /wmXBgDnvB4jn4Qy7BpO4mA5npPbPPxTVS9/1blsBBD08XyqtdE/ZKuKH/Ghgt7t9x
	 G+RPwofDPDm6g6uWeYWOcCKSsnPPdg68s3Mlu4UjMb6ujOR3vKT36uNz/vZ/F4H3N1
	 WJ1cCup8bjgHg==
Date: Tue, 12 Aug 2025 11:16:19 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Richa Bharti <Richa.Bharti@siemens.com>, mturquette@baylibre.com, 
	sboyd@kernel.org, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, srikanth.krishnakar@siemens.com, cedric.hombourger@siemens.com
Subject: Re: [PATCH] clk: qcom: gcc-qcs615: Fix gcc_sdcc2_apps_clk_src
Message-ID: <qqtqberlztcqhs7rv32beec2w6soebpgxovo54omfqijt2nct3@odcwbd5idqnl>
References: <20250729094943.863392-1-Richa.Bharti@siemens.com>
 <81a1bd2c-ad4b-4042-9116-c1604e4f0d98@oss.qualcomm.com>
 <e54l6omqbop5tlithm7cseldtbcz47sde6fo6wcoxvbordoa6w@l63sxertlypq>
 <adcdeaf8-a3ba-46c2-af7d-e37bbc5341dd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adcdeaf8-a3ba-46c2-af7d-e37bbc5341dd@oss.qualcomm.com>

On Tue, Aug 12, 2025 at 12:34:02PM +0530, Taniya Das wrote:
> 
> 
> On 8/12/2025 9:20 AM, Bjorn Andersson wrote:
> > On Tue, Jul 29, 2025 at 04:08:21PM +0530, Taniya Das wrote:
> >>
> >>
> >> On 7/29/2025 3:19 PM, Richa Bharti wrote:
> >>> On QCS615, we see the same issue as reported on SM8250 and SM6350:
> >>> "gcc_sdcc2_apps_clk_src: rcg didn't update its configuration" during boot.
> >>> This is due to GPLL7 not being enabled by default as a parent clock.
> >>>
> >>> Setting `.flags = CLK_OPS_PARENT_ENABLE` ensures that the parent (GPLL7)
> >>> gets prepared and enabled when switching to it, fixing the warning.
> >>>
> >>> Fixes: 39d6dcf67fe9 ("clk: qcom: gcc: Add support for QCS615 GCC clocks")
> >>> Signed-off-by: Richa Bharti <Richa.Bharti@siemens.com>
> > 
> > Thank you Richa for your patch!
> > 
> >>> ---
> >>> This change is similar to upstream commits:
> >>> - SM8250: 783cb693828c ("clk: qcom: gcc-sm8250: Fix
> >>>   gcc_sdcc2_apps_clk_src")
> >>> - SM6350: df04d166d1f3 ("clk: qcom: gcc-sm6350: Fix
> >>>   gcc_sdcc2_apps_clk_src")
> >>> ---
> >>>  drivers/clk/qcom/gcc-qcs615.c | 1 +
> >>>  1 file changed, 1 insertion(+)
> >>>
> >>> diff --git a/drivers/clk/qcom/gcc-qcs615.c b/drivers/clk/qcom/gcc-qcs615.c
> >>> index 9695446bc2a3..b281f0dfe165 100644
> >>> --- a/drivers/clk/qcom/gcc-qcs615.c
> >>> +++ b/drivers/clk/qcom/gcc-qcs615.c
> >>> @@ -830,6 +830,7 @@ static struct clk_rcg2 gcc_sdcc2_apps_clk_src = {
> >>>  		.name = "gcc_sdcc2_apps_clk_src",
> >>>  		.parent_data = gcc_parent_data_8,
> >>>  		.num_parents = ARRAY_SIZE(gcc_parent_data_8),
> >>> +		.flags = CLK_OPS_PARENT_ENABLE,
> >>
> >> This is not the correct way to fix it just because SM8250 and SM6350
> >> uses this ops.
> >>
> >> We are testing the right fix internally and will be posting.
> >>
> > 
> > Please use such opportunities to educate us, rather than just tell us to
> > blindly wait for something (at least share your thoughts/hypothesis).
> > 
> 
> Sure, Bjorn.
> 
> https://patchwork.kernel.org/project/linux-clk/patch/20250804-sdcc_rcg2_shared_ops-v1-1-41f989e8cbb1@oss.qualcomm.com/
> 
> The RCG configuration goes to a bad state because the current floor_ops
> tries to update the rcg configuration even if the clock is not enabled.
> 
> The correct fix is to ensure we do that when the clock is actually
> enabled which is brought it by the shared_floor_ops.
> 

Excellent, thanks for the explanation.

> Please let me know if you still have any queries.
> 

No concerns, this is exactly the kind of transparency I was looking for.

Many thanks for the quick reply,
Bjorn

> > Regards,
> > Bjorn
> > 
> >>>  		.ops = &clk_rcg2_floor_ops,
> >>>  	},
> >>>  };
> >>
> >> -- 
> >> Thanks,
> >> Taniya Das
> >>
> 
> -- 
> Thanks,
> Taniya Das
> 

