Return-Path: <linux-arm-msm+bounces-17147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 928468A067A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 05:07:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4ECC128BF67
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 03:07:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8411F13B5B4;
	Thu, 11 Apr 2024 03:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F+Kk6WFz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABB5629E4;
	Thu, 11 Apr 2024 03:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712804824; cv=none; b=djwjX4n73toW0Vm92b4SjypF2JtVeLCOjSUFuZIX7umbOYDjoId4gPxYBrihb7zDUZbXw1cqB21nQHuMdxPJFrU0eiIiFO0lhrCooWEgU2lnFSR0TEzBFSVD7EJkXCljixFug5ugYbWW4iBXlVRmHAfasFeGX4r202XxXKH1Gu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712804824; c=relaxed/simple;
	bh=bnVt6K57/nt4KUKgLs7f1HAwAdHPz3yZD2sdY2LGZYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sXlMsOzmHjkxos/nvhF1bou8i9BsHQfZhXt3D6ESSI7fRN0V6SJ/QBv5egznM16u8gmoxj3dT5XSvErDucY5wrQx1gMgU63AexGVdpvCgSRzgxRSASULcyU5Bdoez/Whg3Y58n1hk+Uqf0aAQAWq7ySeP21tagHJM6GUvVnYx/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F+Kk6WFz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E09CBC433F1;
	Thu, 11 Apr 2024 03:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712804823;
	bh=bnVt6K57/nt4KUKgLs7f1HAwAdHPz3yZD2sdY2LGZYg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F+Kk6WFznJkm35E5WxOhKTCjOdA8cL0sy0QkLxuGwnFd3phxBXaiiMquKB1OfYTcy
	 PhkoGNFf6OHyLD6Bvu9Lmud8sJvq3nuoz/SCE9llK1A0tYE5+hBw5dVkzfISsB0wP1
	 K+Kzo52gg9RaMzrqPdffRC25IUw3M9GkpFcgJuznaXoEAsgB3LJ5QzJ+J1YIJLMs+z
	 OnFW46yiUrX2ABBp+N0uGpz6mvzGOpJ1eW3ZP7LPB3X7spU/gXIU1bw0P2wzD/H1no
	 fRM0XOWuxV1YGu6/ocQDfG1cdvj2RdxCU2dZ3FRDBDsGSFZBSzN8Zbq4ShUaU8OnE6
	 iA+/2kJy2+ymg==
Date: Wed, 10 Apr 2024 22:07:00 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	MSM <linux-arm-msm@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Bryan O Donoghue <bryan.odonoghue@linaro.org>, 
	Vikash Garodia <quic_vgarodia@quicinc.com>, Jeffrey Hugo <quic_jhugo@quicinc.com>, 
	Douglas Anderson <dianders@chromium.org>, Pierre-Hugues Husson <phhusson@freebox.fr>, 
	Arnaud Vrac <avrac@freebox.fr>
Subject: Re: [PATCH v2] clk: qcom: mmcc-msm8998: fix venus clock issue
Message-ID: <ev2laysswhkkqmm2lih5iztop2a2slkb36l77fzz6rquliqnab@2kr7c5xzphac>
References: <c325691e-1cbe-4589-87fc-b67a41e93294@freebox.fr>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c325691e-1cbe-4589-87fc-b67a41e93294@freebox.fr>

On Wed, Apr 10, 2024 at 01:13:17PM +0200, Marc Gonzalez wrote:
> Video decoder (venus) was broken on msm8998.

Could you please express something about in what way it was broken, or
how this manifested itself etc?

> 
> PH found crude work-around:

Would be nice if these names are spelled out, if you'd like to give
credit to the individuals.

> Drop venus_sys_set_power_control() call.
> 
> Bryan suggested proper fix:
> Set required register offsets in venus GDSC structs.
> Set HW_CTRL flag.
> 
> GDSC = Globally Distributed Switch Controller
> 
> Use same code as mmcc-msm8996 with:
> s/venus_gdsc/video_top_gdsc/
> s/venus_core0_gdsc/video_subcore0_gdsc/
> s/venus_core1_gdsc/video_subcore1_gdsc/
> 
> https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/include/dt-bindings/clock/msm-clocks-hwio-8996.h
> https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/include/dt-bindings/clock/msm-clocks-hwio-8998.h
> 
> 0x1024 = MMSS_VIDEO GDSCR (undocumented)
> 0x1028 = MMSS_VIDEO_CORE_CBCR
> 0x1030 = MMSS_VIDEO_AHB_CBCR
> 0x1034 = MMSS_VIDEO_AXI_CBCR
> 0x1038 = MMSS_VIDEO_MAXI_CBCR
> 0x1040 = MMSS_VIDEO_SUBCORE0 GDSCR (undocumented)
> 0x1044 = MMSS_VIDEO_SUBCORE1 GDSCR (undocumented)
> 0x1048 = MMSS_VIDEO_SUBCORE0_CBCR
> 0x104c = MMSS_VIDEO_SUBCORE1_CBCR
> 

Would you mind providing me a Fixes tag as well?

Thanks,
Bjorn

> Suggested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> ---
>  drivers/clk/qcom/mmcc-msm8998.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/clk/qcom/mmcc-msm8998.c b/drivers/clk/qcom/mmcc-msm8998.c
> index 1180e48c687ac..275fb3b71ede4 100644
> --- a/drivers/clk/qcom/mmcc-msm8998.c
> +++ b/drivers/clk/qcom/mmcc-msm8998.c
> @@ -2535,6 +2535,8 @@ static struct clk_branch vmem_ahb_clk = {
>  
>  static struct gdsc video_top_gdsc = {
>  	.gdscr = 0x1024,
> +	.cxcs = (unsigned int []){ 0x1028, 0x1034, 0x1038 },
> +	.cxc_count = 3,
>  	.pd = {
>  		.name = "video_top",
>  	},
> @@ -2543,20 +2545,26 @@ static struct gdsc video_top_gdsc = {
>  
>  static struct gdsc video_subcore0_gdsc = {
>  	.gdscr = 0x1040,
> +	.cxcs = (unsigned int []){ 0x1048 },
> +	.cxc_count = 1,
>  	.pd = {
>  		.name = "video_subcore0",
>  	},
>  	.parent = &video_top_gdsc.pd,
>  	.pwrsts = PWRSTS_OFF_ON,
> +	.flags = HW_CTRL,
>  };
>  
>  static struct gdsc video_subcore1_gdsc = {
>  	.gdscr = 0x1044,
> +	.cxcs = (unsigned int []){ 0x104c },
> +	.cxc_count = 1,
>  	.pd = {
>  		.name = "video_subcore1",
>  	},
>  	.parent = &video_top_gdsc.pd,
>  	.pwrsts = PWRSTS_OFF_ON,
> +	.flags = HW_CTRL,
>  };
>  
>  static struct gdsc mdss_gdsc = {
> -- 
> 2.34.1
> 

