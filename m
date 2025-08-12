Return-Path: <linux-arm-msm+bounces-68636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2F3B21BD3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 05:50:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E115346073A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 03:50:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AFDB2DA779;
	Tue, 12 Aug 2025 03:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LL24nNZ6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3752571C2;
	Tue, 12 Aug 2025 03:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754970604; cv=none; b=LJ76O/NCYnqP2VdyJzX2W45haOEgPnXU/qznCaiaKny0ULj4EvYRT5XyK2ks09ilI/o5dF7AswjAE+HGcStvHOXHrE9v4w6AmAlvIUtXKFLowI5tPXKtk1LiNKVyqF0x+SDsjd5uYslYWcDzdcNiEjGqIx0fv5GmeM1Scn94Pxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754970604; c=relaxed/simple;
	bh=bOwpHet3xpDyZnt3rGKtJyoyoTT60Mn5I4Nv214CiEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u60WgyP6nztwXw/OkqALBuhqo69SP+WhzWHnRfc/0P8oi6XgnVOrDTtcHfyY/zf+Z8kVb78GAVOcr+7YBa8vJGPjZTrsh9YaaE7QAW3jh//HwHuOlDu6bzElfH5R74Vj2QIXwRnH2jaNLmnEk4JH5BZodFWQaQOVvLnD3ZZ3UP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LL24nNZ6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 406B8C4CEF0;
	Tue, 12 Aug 2025 03:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754970603;
	bh=bOwpHet3xpDyZnt3rGKtJyoyoTT60Mn5I4Nv214CiEQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LL24nNZ6a2EPdZO/gbHyeePEqDInGOWalrjShvaz2gJihTULt+RpOXw/OkxLVpXFu
	 uE5kWuCkY4taKdXm1+TZMkieurAW9TSRfwNj4ldTv0R6jjeobiZfgDfJwcRvzHSo4m
	 JuVFvRSkXmFokCOHjWY0nOM3BLZ2AVZy1yQx0AVZek8Hr/i8ksDAdORA+WldgP4uHd
	 95Ox44xxwA41LU0BbUWVyUwhh7yVkaBOIf783DXkZnQJb9PiH5liAs2btBVHsJqc6H
	 zBL51G2vJFUB3izhZIgB8GELNPBRT0dlkTtoa4dv9vAnDM1nLKMxR5k1KUeoDZcmys
	 RGhmIp64RDD7w==
Date: Mon, 11 Aug 2025 22:50:01 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Richa Bharti <Richa.Bharti@siemens.com>, mturquette@baylibre.com, 
	sboyd@kernel.org, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, srikanth.krishnakar@siemens.com, cedric.hombourger@siemens.com
Subject: Re: [PATCH] clk: qcom: gcc-qcs615: Fix gcc_sdcc2_apps_clk_src
Message-ID: <e54l6omqbop5tlithm7cseldtbcz47sde6fo6wcoxvbordoa6w@l63sxertlypq>
References: <20250729094943.863392-1-Richa.Bharti@siemens.com>
 <81a1bd2c-ad4b-4042-9116-c1604e4f0d98@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <81a1bd2c-ad4b-4042-9116-c1604e4f0d98@oss.qualcomm.com>

On Tue, Jul 29, 2025 at 04:08:21PM +0530, Taniya Das wrote:
> 
> 
> On 7/29/2025 3:19 PM, Richa Bharti wrote:
> > On QCS615, we see the same issue as reported on SM8250 and SM6350:
> > "gcc_sdcc2_apps_clk_src: rcg didn't update its configuration" during boot.
> > This is due to GPLL7 not being enabled by default as a parent clock.
> > 
> > Setting `.flags = CLK_OPS_PARENT_ENABLE` ensures that the parent (GPLL7)
> > gets prepared and enabled when switching to it, fixing the warning.
> > 
> > Fixes: 39d6dcf67fe9 ("clk: qcom: gcc: Add support for QCS615 GCC clocks")
> > Signed-off-by: Richa Bharti <Richa.Bharti@siemens.com>

Thank you Richa for your patch!

> > ---
> > This change is similar to upstream commits:
> > - SM8250: 783cb693828c ("clk: qcom: gcc-sm8250: Fix
> >   gcc_sdcc2_apps_clk_src")
> > - SM6350: df04d166d1f3 ("clk: qcom: gcc-sm6350: Fix
> >   gcc_sdcc2_apps_clk_src")
> > ---
> >  drivers/clk/qcom/gcc-qcs615.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/clk/qcom/gcc-qcs615.c b/drivers/clk/qcom/gcc-qcs615.c
> > index 9695446bc2a3..b281f0dfe165 100644
> > --- a/drivers/clk/qcom/gcc-qcs615.c
> > +++ b/drivers/clk/qcom/gcc-qcs615.c
> > @@ -830,6 +830,7 @@ static struct clk_rcg2 gcc_sdcc2_apps_clk_src = {
> >  		.name = "gcc_sdcc2_apps_clk_src",
> >  		.parent_data = gcc_parent_data_8,
> >  		.num_parents = ARRAY_SIZE(gcc_parent_data_8),
> > +		.flags = CLK_OPS_PARENT_ENABLE,
> 
> This is not the correct way to fix it just because SM8250 and SM6350
> uses this ops.
> 
> We are testing the right fix internally and will be posting.
> 

Please use such opportunities to educate us, rather than just tell us to
blindly wait for something (at least share your thoughts/hypothesis).

Regards,
Bjorn

> >  		.ops = &clk_rcg2_floor_ops,
> >  	},
> >  };
> 
> -- 
> Thanks,
> Taniya Das
> 

