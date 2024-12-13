Return-Path: <linux-arm-msm+bounces-41912-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EDE79F0699
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 09:42:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F35E4281239
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 08:42:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96EC11AB52F;
	Fri, 13 Dec 2024 08:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oPAubIv7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ACC76EB4C;
	Fri, 13 Dec 2024 08:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734079348; cv=none; b=ESzDWnR8934n6FN5cR2b6y8Na3OYxPdqoiW8W5kPzg4UFucRY73Fmn2vIod9cEEGkA471UT5b0m9+OryJjcEApMuzbZcpigHooYDGZthH85VNu3G7odStDgX0vut7BngvZgF0UboN7JVE7BW8GWOgFyGTeqvjEJ22iN3N8JY7AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734079348; c=relaxed/simple;
	bh=KKIRkAFTUQFvttvDAyK+ZVcs9cr2LFgnAu3nr9wXyuA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=maxednPYoD5FGkE4aBvAo5ISjvuDbqXaIsMpbVpIrnhZ5WLIde9dd4PX1bftkIO1FX1djI+6KDiErZZxJfrBVnbVaV6yFMXBuWpSbqid6ppIV/mDCZ6jn23XP4MSceUaNnRgUE0sVMo32jcR8va6/NL/Dt6KwpP8rSWQyIGqoGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oPAubIv7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C13A3C4CED0;
	Fri, 13 Dec 2024 08:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734079345;
	bh=KKIRkAFTUQFvttvDAyK+ZVcs9cr2LFgnAu3nr9wXyuA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oPAubIv7KukII47p+eFH3AwalPkfBfUiZgWZpoohewPfGo12WrZzAmcfU1OCIpcfj
	 RQtnetf1hGpKwQP1XdVlX63fgpFUjgC5Qs8oBj5ceTzxkaLRH7vY0oU2jWzMmRM3tx
	 99Q1YKqn5e8DjTymkuEwlUXMe1VSwP+i54lni9qAUSALcHu4Db/0/uhLxA7QEeMCX9
	 s8n4b7HeBpyFt5YDPSdQB0IFNcNhr1S51COE8p2iIbBgYU6vc4T1v2ESiHxwVtSz8O
	 0ovearkj1sP998gVkW6z5Z/ronHb5VyBpz/0PZPMG08K+p0v9Fxb1X0xG3T8DFdLdr
	 W0hyDTL8K1fiQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tM1Fl-000000000El-2JSq;
	Fri, 13 Dec 2024 09:42:30 +0100
Date: Fri, 13 Dec 2024 09:42:29 +0100
From: Johan Hovold <johan@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] soc: qcom: llcc: Enable LLCC_WRCACHE at boot on X1
Message-ID: <Z1vzddhyrnwq7Sl_@hovoldconsulting.com>
References: <20241212-topic-llcc_x1e_wrcache-v2-1-e44d3058d06c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241212-topic-llcc_x1e_wrcache-v2-1-e44d3058d06c@oss.qualcomm.com>

On Thu, Dec 12, 2024 at 05:32:24PM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Do so in accordance with the internal recommendations.

Your commit message is still incomplete as it does not really say
anything about what this patch does, why this is needed or what the
implications are if not merging this patch.

How would one determine that this patch is a valid candidate for
backporting, for example.

> Fixes: b3cf69a43502 ("soc: qcom: llcc: Add configuration data for X1E80100")
> Cc: stable@vger.kernel.org
> Reviewed-by: Rajendra Nayak <quic_rjendra@quicinc.com>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
> Changes in v2:
> - Cc stable
> - Add more context lines
> - Pick up r-b
> - Link to v1: https://lore.kernel.org/r/20241207-topic-llcc_x1e_wrcache-v1-1-232e6aff49e4@oss.qualcomm.com
> ---
>  drivers/soc/qcom/llcc-qcom.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
> index 32c3bc887cefb87c296e3ba67a730c87fa2fa346..1560db00a01248197e5c2936e785a5ea77f74ad8 100644
> --- a/drivers/soc/qcom/llcc-qcom.c
> +++ b/drivers/soc/qcom/llcc-qcom.c
> @@ -2997,20 +2997,21 @@ static const struct llcc_slice_config x1e80100_data[] = {
>  		.bonus_ways = 0xfff,
>  		.cache_mode = 0,
>  	}, {
>  		.usecase_id = LLCC_WRCACHE,
>  		.slice_id = 31,
>  		.max_cap = 1024,
>  		.priority = 1,
>  		.fixed_size = true,
>  		.bonus_ways = 0xfff,
>  		.cache_mode = 0,
> +		.activate_on_init = true,

If this is so obviously correct, why isn't this flag set for
LLCC_WRCACHE for all the SoCs?

Johan

