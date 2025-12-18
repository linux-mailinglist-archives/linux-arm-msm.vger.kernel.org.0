Return-Path: <linux-arm-msm+bounces-85618-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F48CCA161
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 03:30:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 68F5930161E3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 02:30:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5982F2FD1D6;
	Thu, 18 Dec 2025 02:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ETSTbyck"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2756D2FC86C;
	Thu, 18 Dec 2025 02:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766025052; cv=none; b=u9xEb+dAo8Tkx6Fn4j7o/Feo+fu2hyKo1nCuXTsGYG9WtXG0E4f7TCpBmDn4I45//DcuQwovpYsB40HqwHJ76852aLZt4aH//3FTjMXkUWU7tMOxH3XEClt42lliXf/7k51zFTTkDyi3E+d+CXL/IzyTWpy6fg9BcPrmNrtKKYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766025052; c=relaxed/simple;
	bh=K2dArtFWSx1SJagrfM0jmP3vLHcRBN4OQ89z6eMPFpI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OVZuNHqs8EXJwDxDqpypFwXZ8fbMZKQf7Eev6ev/ITjmZbPWq4wWBGyEuy+RI0yA4WioReCQQwcbZB5B0lyxnzBMjxalfHTLEyPUH8FwKuqQm01WHgW8KChONcFPL8p8zlfBtT76d9qEfRiCINTSqtCTVPa8AR4Auwa/DdL8rbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ETSTbyck; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2FBCC4CEF5;
	Thu, 18 Dec 2025 02:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766025051;
	bh=K2dArtFWSx1SJagrfM0jmP3vLHcRBN4OQ89z6eMPFpI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ETSTbyckcEeVE/fgcuMEt90ZP6vpVKMY0N4VRnpNm606+IozjvvF/EG8XnCzJtFZR
	 8tVrTUA2W5S1083gv+PUxlzKBPmbv4rTOGtxSKfTpBhQwLjCkgYe3m4VT1bQLEoMaR
	 Tk4k9yLt6tzzY0sYpWP0QFXP4JE5YPhYOCkcjyl1vY9RC34ojfzmi6jwbOYeQXnxuW
	 DrWMG46VjghyOPmZeZpEFb+vJKBcI91qq3Ci6CXj7/3+tMw0FyUQCoiq9ykZfPHUEC
	 tHbZhM8YF2Lbr8FR3ywle92VyUPzBwBksy0LfpbEHh622NALOAxEaA/YOuO5dfRONm
	 wpreThDixRPmw==
Date: Wed, 17 Dec 2025 18:39:00 -0800
From: Bjorn Andersson <andersson@kernel.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Ajit Pandey <ajit.pandey@oss.qualcomm.com>, Imran Shaik <imran.shaik@oss.qualcomm.com>, 
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: clk-rpmh: Update the clock suffix for Glymur
Message-ID: <ilxtc76huyt47fqueiko5t5o6xe6kgc6bunlxenbqlg4dzltha@clpk2bpraax7>
References: <20251125-glymur_rpmhcc_fix-v1-1-60081b3cce7f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125-glymur_rpmhcc_fix-v1-1-60081b3cce7f@oss.qualcomm.com>

On Tue, Nov 25, 2025 at 11:42:39PM +0530, Taniya Das wrote:
> Update the RPMh VRM clock definitions for Glymur to add the suffix to
> indicate the clock div and e0 for the C3A_E0, C4A_E0, C5A_E0, and
> C8A_E0 clock resources.

This clearly explain what the patch does, but could you please start the
commit message with a paragraph (or sentence) that explains why this
change is done?

Regards,
Bjorn

> 
> Fixes: ebcb9db98bda ("clk: qcom: rpmh: Add support for Glymur rpmh clocks")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-rpmh.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> index 1a98b3a0c528c24b600326e6b951b2edb6dcadd7..a370ab2d96c34fa8e7a090e8427b11008318c02f 100644
> --- a/drivers/clk/qcom/clk-rpmh.c
> +++ b/drivers/clk/qcom/clk-rpmh.c
> @@ -390,10 +390,10 @@ DEFINE_CLK_RPMH_VRM(clk7, _a4, "clka7", 4);
>  
>  DEFINE_CLK_RPMH_VRM(div_clk1, _div2, "divclka1", 2);
>  
> -DEFINE_CLK_RPMH_VRM(clk3, _a, "C3A_E0", 1);
> -DEFINE_CLK_RPMH_VRM(clk4, _a, "C4A_E0", 1);
> -DEFINE_CLK_RPMH_VRM(clk5, _a, "C5A_E0", 1);
> -DEFINE_CLK_RPMH_VRM(clk8, _a, "C8A_E0", 1);
> +DEFINE_CLK_RPMH_VRM(clk3, _a1_e0, "C3A_E0", 1);
> +DEFINE_CLK_RPMH_VRM(clk4, _a1_e0, "C4A_E0", 1);
> +DEFINE_CLK_RPMH_VRM(clk5, _a1_e0, "C5A_E0", 1);
> +DEFINE_CLK_RPMH_VRM(clk8, _a1_e0, "C8A_E0", 1);
>  
>  DEFINE_CLK_RPMH_BCM(ce, "CE0");
>  DEFINE_CLK_RPMH_BCM(hwkm, "HK0");
> 
> ---
> base-commit: 92fd6e84175befa1775e5c0ab682938eca27c0b2
> change-id: 20251125-glymur_rpmhcc_fix-5daa36a1e8ff
> 
> Best regards,
> -- 
> Taniya Das <taniya.das@oss.qualcomm.com>
> 

