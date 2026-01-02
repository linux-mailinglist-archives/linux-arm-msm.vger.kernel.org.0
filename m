Return-Path: <linux-arm-msm+bounces-87278-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD3FCEF5CA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 02 Jan 2026 22:43:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CAFFE30056C0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jan 2026 21:43:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF2542D8DB9;
	Fri,  2 Jan 2026 21:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VbYWheCb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934431E5734;
	Fri,  2 Jan 2026 21:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767390197; cv=none; b=dC1FCaqwCglzIEiyyGaAva8suE/dYEWRIBp+psHwTn5BjrMr12AqK/BoJgiDLtt+ON1NX6ZqMduQelXh1dMefqyXy4PpMYFUm7gKUZaGkiyfPV1IZpIFes9CaNg0jR6zaNWZrtguG+s91HzsbLqBtGBXnxNEa8yEDycz2aprY0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767390197; c=relaxed/simple;
	bh=Fw+n87duyCWC01lK5K2jFFX5rVfSDfVEdaklPH7wBhY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jxEQ6afs6dbI4smO1D2Eqzv0To0NHUZohwAH+D/UvYqiofqvxf30izrHQe5D3RLMiUm9fg5Ot2d7h1mf0DQVdmdyeoSfkBNOpe9QSeO8NoO9WLFrB+ghzwKxF7Pox6q0SF/yqFy+olbd4FXI42g91nIPUqsRIHz4Oq9WlIoEBKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VbYWheCb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2E4EC116B1;
	Fri,  2 Jan 2026 21:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767390197;
	bh=Fw+n87duyCWC01lK5K2jFFX5rVfSDfVEdaklPH7wBhY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VbYWheCbEJaftH7XdKLEv6KJpO8gDZ15tPFP1cYhFzfY0/Kg3SDNTo4X1bUU/skrn
	 c+EPew1DA7meDcq19YyXeh0V2sbTmcte/T8otK2oAISivBal2xmLq/mca3KNb015V7
	 lMZjij3sMPLOb+JxbGLYmLRaePkQyTwt3qwkrNmdfSgY5AssfKG/BEpw89wvmtFm97
	 4JjedgwxCY8GeAjEFc36HYRC9ehJzFk6rSexdSGAY6hu2/nKnZKKzngW6oHdpgV7G6
	 5oWYt+jtGrEWjRJFg8R6v1CFyJ861MCdrYtu5vG90kefWuNWUMr7TCVd4gVHAcNyW1
	 KC4F4EPMYcoYQ==
Date: Fri, 2 Jan 2026 15:43:14 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Taniya Das <taniya.das@oss.qualcomm.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Subject: Re: [PATCH 1/2] clk: qcom: gcc-kaanapali: Fix double array
 initializer
Message-ID: <ldcherld5hsyvgdzzoqvetcfleh7olj6zswc5qx5q3nntejbht@jhrgo4yitsva>
References: <20251224112257.83874-3-krzysztof.kozlowski@oss.qualcomm.com>
 <j2qvtpdsak2z2l3o5ckpin7zun4wo3c5uc6jvutfdkfbqebfxa@zvbg6tmph7eg>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <j2qvtpdsak2z2l3o5ckpin7zun4wo3c5uc6jvutfdkfbqebfxa@zvbg6tmph7eg>

On Fri, Jan 02, 2026 at 03:10:10PM -0600, Bjorn Andersson wrote:
> On Wed, Dec 24, 2025 at 12:22:58PM +0100, Krzysztof Kozlowski wrote:
> > [GCC_QMIP_VIDEO_VCODEC_AHB_CLK] element in clk_regmap array is already
> > initialized, as reported by W=1 clang warning:
> > 
> >   gcc-kaanapali.c:3383:36: error: initializer overrides prior initialization of this subobject [-Werror,-Winitializer-overrides]
> > 
> > Fixes: d1919c375f21 ("clk: qcom: Add support for Global clock controller on Kaanapali")
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > 
> > ---
> > 
> > Does anyone even build this code before sending it to upstream?
> 
> It hope the author does...but I of couse sanity check the result through
> an allmodconfig build across a few different architectures before
> pushing.
> 
> But it seems passing '--environment "W=1"' to tuxmake doesn't actually
> enable these warnings :(
> 

Realized that W=1 should be passed as a build target, not through
environment.

Do you have any sensible post-processing tools/steps that you could
share to make the output usable?

Regards,
Bjorn

> Thanks for the report, and the fixes.
> 
> Regards,
> Bjorn
> 
> > ---
> >  drivers/clk/qcom/gcc-kaanapali.c | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/drivers/clk/qcom/gcc-kaanapali.c b/drivers/clk/qcom/gcc-kaanapali.c
> > index 182b152df14c..b9743284927d 100644
> > --- a/drivers/clk/qcom/gcc-kaanapali.c
> > +++ b/drivers/clk/qcom/gcc-kaanapali.c
> > @@ -3380,7 +3380,6 @@ static struct clk_regmap *gcc_kaanapali_clocks[] = {
> >  	[GCC_QMIP_VIDEO_CV_CPU_AHB_CLK] = &gcc_qmip_video_cv_cpu_ahb_clk.clkr,
> >  	[GCC_QMIP_VIDEO_CVP_AHB_CLK] = &gcc_qmip_video_cvp_ahb_clk.clkr,
> >  	[GCC_QMIP_VIDEO_V_CPU_AHB_CLK] = &gcc_qmip_video_v_cpu_ahb_clk.clkr,
> > -	[GCC_QMIP_VIDEO_VCODEC_AHB_CLK] = &gcc_qmip_video_vcodec_ahb_clk.clkr,
> >  };
> >  
> >  static struct gdsc *gcc_kaanapali_gdscs[] = {
> > -- 
> > 2.51.0
> > 

