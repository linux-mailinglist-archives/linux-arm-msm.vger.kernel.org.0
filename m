Return-Path: <linux-arm-msm+bounces-86608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C16CDD432
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Dec 2025 04:51:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6BACC3016370
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Dec 2025 03:51:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB00D264A74;
	Thu, 25 Dec 2025 03:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R521H4wZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E423EEC3;
	Thu, 25 Dec 2025 03:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766634668; cv=none; b=CEQP9VdoUCWF20uujyUznLHm78LJxyaayhy8gTxxJ3FjcWaPL/aBUvUfR/8XzUfzRpLKGYiT+6TcKnw2Cs8gFHfDLMvi8wLPPnV/HlKq8qvomKP9gsCBohODuNpNg4urbsi8vJZLhWESLr8AkAZNAJlIL/LkZ89iU3dSR7u3X3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766634668; c=relaxed/simple;
	bh=e5B3SSMk1rIkgvNAsHWBN98zYrKbsmUDNmz3J/BZDiw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IZ7jnyc20XmnXTZVgLIrr6oW4MmM/Tw5dJRfNYFvFlSLaj1cffswsP/rRqa40rP2f5r7DleTr8f/wRL5w0S7oU9p4UJN54hjpQkCNC4eUzzV1g8scwiybMjWj1MK4SpyipezTXtx0A2T2Kuyqq74bFQqi5J9EC/QOms3XrIJGq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R521H4wZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 994D5C4CEF1;
	Thu, 25 Dec 2025 03:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766634668;
	bh=e5B3SSMk1rIkgvNAsHWBN98zYrKbsmUDNmz3J/BZDiw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R521H4wZGoK0XBn6ZlrjT/+I+u7qEaqGP5pmsMY52UVwUMypLD/4D8MEJDFvizqWL
	 vids4LmB9oPOjL/f7lpXbko/6x7f/wr9SpsD6FlxBZNtDp1KGSljJMM5L+eATAt4Jn
	 DKAvF7krq4kMeTv+3zm+Yxrvj76Vp34yuP46k6Y4c8rNyfrPfB+Y+Qgv4dNxAqkWGS
	 6cJKSdDXLupMuLuA0T6aa7ZFcG5FtB1MOsSudXn8aVIVRUm4WZ+3PhSywXBvXj+N6e
	 Ms/BAhqTDJ/Yjwc+cOb9cQKV7TtwT2QfoWWgJvzzN6NXPI5ZkhLfk8q5FeLM2ljTb4
	 NK3iutt7aqcKw==
Date: Wed, 24 Dec 2025 21:51:05 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
	Ajit Pandey <ajit.pandey@oss.qualcomm.com>, Imran Shaik <imran.shaik@oss.qualcomm.com>, 
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: rcg2: compute 2d using duty fraction directly
Message-ID: <jxj23rczlysmrrrzdmtaa2ymrntamp2hgkzwnfaxgnnzsqqxoy@l5shaguts5oj>
References: <20251222-duty_cycle_precision-v1-1-b0da8e9fdab7@oss.qualcomm.com>
 <emy273nvnbzznvufe6fmbysrln6d7lm4xi5rwsuwnj4kjlalvx@7j4dxyd2f25l>
 <fa75d5b1-e805-4d3f-9b6c-a21358d3d4b8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fa75d5b1-e805-4d3f-9b6c-a21358d3d4b8@oss.qualcomm.com>

On Tue, Dec 23, 2025 at 04:18:20PM +0530, Taniya Das wrote:
> 
> 
> On 12/23/2025 12:39 AM, Bjorn Andersson wrote:
> > On Mon, Dec 22, 2025 at 10:38:14PM +0530, Taniya Das wrote:
> >> From: Taniya Das <quic_tdas@quicinc.com>
> > 
> > Please use oss.qualcomm.com.
> > 
> 
> My bad, will update it.
> 
> >>
> >> The duty-cycle calculation in clk_rcg2_set_duty_cycle() currently
> >> derives an intermediate percentage `duty_per = (num * 100) / den` and
> >> then computes:
> >>
> >>     d = DIV_ROUND_CLOSEST(n * duty_per * 2, 100);
> >>
> >> This introduces integer truncation at the percentage step (division by
> >> `den`) and a redundant scaling by 100, which can reduce precision for
> >> large `den` and skew the final rounding.
> >>
> >> Compute `2d` directly from the duty fraction to preserve precision and
> >> avoid the unnecessary scaling:
> >>
> >>     d = DIV_ROUND_CLOSEST(n * duty->num * 2, duty->den);
> >>
> >> This keeps the intended formula `d ≈ n * 2 * (num/den)` while performing
> >> a single, final rounded division, improving accuracy especially for small
> >> duty cycles or large denominators. It also removes the unused `duty_per`
> >> variable, simplifying the code.
> >>
> >> There is no functional changes beyond improved numerical accuracy.
> >>
> >> Fixes: 7f891faf596ed ("clk: qcom: clk-rcg2: Add support for duty-cycle for RCG")
> >> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> >> ---
> >> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> >> ---
> >>  drivers/clk/qcom/clk-rcg2.c | 6 ++----
> >>  1 file changed, 2 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
> >> index e18cb8807d73534c6437c08aeb524353a2eab06f..2838d4cb2d58ea1e351d6a5599045c72f4dc3801 100644
> >> --- a/drivers/clk/qcom/clk-rcg2.c
> >> +++ b/drivers/clk/qcom/clk-rcg2.c
> >> @@ -755,7 +755,7 @@ static int clk_rcg2_get_duty_cycle(struct clk_hw *hw, struct clk_duty *duty)
> >>  static int clk_rcg2_set_duty_cycle(struct clk_hw *hw, struct clk_duty *duty)
> >>  {
> >>  	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
> >> -	u32 notn_m, n, m, d, not2d, mask, duty_per, cfg;
> >> +	u32 notn_m, n, m, d, not2d, mask, cfg;
> >>  	int ret;
> >>  
> >>  	/* Duty-cycle cannot be modified for non-MND RCGs */
> >> @@ -774,10 +774,8 @@ static int clk_rcg2_set_duty_cycle(struct clk_hw *hw, struct clk_duty *duty)
> >>  
> >>  	n = (~(notn_m) + m) & mask;
> >>  
> >> -	duty_per = (duty->num * 100) / duty->den;
> >> -
> >>  	/* Calculate 2d value */
> >> -	d = DIV_ROUND_CLOSEST(n * duty_per * 2, 100);
> >> +	d = DIV_ROUND_CLOSEST(n * duty->num * 2, duty->den);
> > 
> > This looks better/cleaner. But for my understanding, can you share some
> > example numbers that shows the problem?
> > 
> 
> Sure Bjorn, will share the examples.
> 

I don't think these examples need to necessarily be added in the git
history - in particular since the proposed new style looks more
reasonable than what's currently is in the code.

So, providing them here would suffice, for me at least.


Adding kunit tests certainly sounds useful though.

Regards,
Bjorn

> > Regards,
> > Bjorn
> > 
> >>  
> >>  	/*
> >>  	 * Check bit widths of 2d. If D is too big reduce duty cycle.
> >>
> >> ---
> >> base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
> >> change-id: 20251222-duty_cycle_precision-796542baecab
> >>
> >> Best regards,
> >> -- 
> >> Taniya Das <taniya.das@oss.qualcomm.com>
> >>
> 
> -- 
> Thanks,
> Taniya Das
> 

