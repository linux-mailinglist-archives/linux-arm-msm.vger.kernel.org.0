Return-Path: <linux-arm-msm+bounces-72367-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E3532B463EA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 21:47:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B9DD61B27B0C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 19:48:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1550A1096F;
	Fri,  5 Sep 2025 19:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PhPukp9w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18B1BA42;
	Fri,  5 Sep 2025 19:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757101666; cv=none; b=OhwQSIscNnXmoajlbi/YAViUzReoMkwSAnLJR0kFF2OEnYZBSQIQyYEYH5tpd9eOa/ovP0VPGisd7SN4a2+oLH1wRB9M3SOejjyE3TYNxdjYQYfQPXHs8+FSiwf5TswU7gI+E/+3OyK7pEehYj+9DJmtZ1TE1I6CMnMvvHo/Ugc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757101666; c=relaxed/simple;
	bh=cx6/CPIGyA61osR31aBMtV68j0uHciyN4n8/YHwijxM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UKPgaFOgMdeaJefJ0PG8yxWExSOPL0lYf7EnV7eThNFmfD7U9rOoqpvAdzRN/CYKLhPlySGWeijSWVrDniy4/n73exXZXbJTGb6CAWU0NUS4Hfrpb/RZBswqkgXChOetRIUvB70wIWjj7f3VF05J3p1lDa4Db4hnxsPAkeGVIdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PhPukp9w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E10D6C4CEF1;
	Fri,  5 Sep 2025 19:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757101665;
	bh=cx6/CPIGyA61osR31aBMtV68j0uHciyN4n8/YHwijxM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PhPukp9wqFMmK54Ys/i8mi0gMYUym3eMdN0inVJLZ4MpsouRFNwkM9cievyBDfZcm
	 eGxazwzI5Np4kX/6gAgiAEdukrYDO2aWN1KLLEAjrZy5Vckor/TWiTExZwIcSx020v
	 t6G2k3rf/0M4DRt5Yv79/AcMTgTlruVOJDYMtdrlukxA0DSVs34JhuLQHk2rmvyrlX
	 3e5Z7U/s3+mNpKwX/1YEpamD1n9vgDlo4B7+Cq8EuEmd3qPFf1HdFA1OQGgwQtzkea
	 E2XXhjR1i/h2TJPlYdf6Zdv2/vvhMzCYmdKGFEda0p0J4KXsI2Yu7cYAPnmSL6Uaah
	 ql5afQ/6hS4cw==
Date: Fri, 5 Sep 2025 14:47:43 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Pushpendra Singh <quic_pussin@quicinc.com>
Cc: quic_bjorande@quicinc.com, krzysztof.kozlowski@linaro.org, 
	konradybcio@kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	quic_rgottimu@quicinc.com, Shivnandan Kumar <quic_kshivnan@quicinc.com>
Subject: Re: [PATCH V2] soc: qcom: icc-bwmon: Update zone1_thres_count to 3
Message-ID: <zywvspwty3be4eadssi6sylqkhgsioramuamvvoui5tfmml2i6@zsl2nuuos377>
References: <20250905113923.3944347-1-quic_pussin@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250905113923.3944347-1-quic_pussin@quicinc.com>

On Fri, Sep 05, 2025 at 05:09:23PM +0530, Pushpendra Singh wrote:
> From: Shivnandan Kumar <quic_kshivnan@quicinc.com>
> 
> Update zone1_thres_count to 3 from 16 so that
> driver can reduce bus vote in 3 sample windows instead
> of waiting for 16 windows.
> 

Please start your commit message by describing the problem.

> The 16-window (64 ms) waiting time is too long to reduce the
> bus vote. At higher FPS, there will be multiple frames in 64ms
> e.g. 4 frames at 60FPS in 64ms. Hence, delay of 64ms in decision
> making will lead to higher power regression. We tested across
> multiple usecases, and observed significant power savings.
> 

I asked in v1 what the tradeoff is here. Is lower number better in all
cases? What are we loosing by making it 3?

And why 3, why not 2 or 4, or 7?


I'm not saying that 3 is wrong, just saying that the commit message
needs to sufficiently explain why 3 is the "best" number.

Regards,
Bjorn

> USECASE				zone1_thres_count=16     zone1_thres_count=3
> 4K video playback       236.15 mA                  203.15 mA
> Sleep					   7mA			   			6.9mA
> Display (dle display)    71.95mA			       67.11mA
> 
> Signed-off-by: Shivnandan Kumar <quic_kshivnan@quicinc.com>
> Signed-off-by: Pushpendra Singh <quic_pussin@quicinc.com>
> ---
> Changes in v2:
> -Update commit message
> -Link to v1:https://lore.kernel.org/lkml/463eb7c8-00fc-4441-91d1-6e48f6b052c8@quicinc.com
> 
>  drivers/soc/qcom/icc-bwmon.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/qcom/icc-bwmon.c b/drivers/soc/qcom/icc-bwmon.c
> index 3dfa448bf8cf..a245a8b2cfef 100644
> --- a/drivers/soc/qcom/icc-bwmon.c
> +++ b/drivers/soc/qcom/icc-bwmon.c
> @@ -827,7 +827,7 @@ static const struct icc_bwmon_data msm8998_bwmon_data = {
>  static const struct icc_bwmon_data sdm845_cpu_bwmon_data = {
>  	.sample_ms = 4,
>  	.count_unit_kb = 64,
> -	.zone1_thres_count = 16,
> +	.zone1_thres_count = 3,
>  	.zone3_thres_count = 1,
>  	.quirks = BWMON_HAS_GLOBAL_IRQ,
>  	.regmap_fields = sdm845_cpu_bwmon_reg_fields,
> @@ -846,7 +846,7 @@ static const struct icc_bwmon_data sdm845_llcc_bwmon_data = {
>  static const struct icc_bwmon_data sc7280_llcc_bwmon_data = {
>  	.sample_ms = 4,
>  	.count_unit_kb = 64,
> -	.zone1_thres_count = 16,
> +	.zone1_thres_count = 3,
>  	.zone3_thres_count = 1,
>  	.quirks = BWMON_NEEDS_FORCE_CLEAR,
>  	.regmap_fields = sdm845_llcc_bwmon_reg_fields,
> -- 
> 2.34.1
> 

