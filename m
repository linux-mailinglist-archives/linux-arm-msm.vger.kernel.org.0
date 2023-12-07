Return-Path: <linux-arm-msm+bounces-3738-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FED808BAC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 16:21:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 032981C20930
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 15:21:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A17744C77;
	Thu,  7 Dec 2023 15:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nl4nnvV1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E977446D6
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Dec 2023 15:21:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 666D2C433C7;
	Thu,  7 Dec 2023 15:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701962485;
	bh=45oamiijKSCLo/ORgchi/hZLvxifeiPsd9EiBfcYapY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nl4nnvV1kl1BSDZ7fxNw0ZxUEEQYqDk2GC8ePLDfhpOLnqk232ExGKGTZoHR2iu2h
	 mUi+1APpDklkWy0hnjB/CTAvWErmWSE2onSCMeK9zOf6OhRwhA/Miyne1hpAFX9d9l
	 YoYGddItHTDhWd/0amtZyrjGEPsGq1UDXtlln7FSZKyEJdIJ8zrrrARM+D4RAdD3/0
	 VMeUBzSvycUy3PSEACzl01++jkbxDockEjjiUKA0h+pmI8/bNRYF3v/9X0goDdX7jx
	 5LPmKCZFRgFpEImh9n1cbasp+zD/xwN6bGv9oQzLNz7ZWSMJDn2cL3A648N5OvtYxN
	 7JldAj5D9w5sg==
Date: Thu, 7 Dec 2023 07:24:43 -0800
From: Bjorn Andersson <andersson@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Andy Gross <agross@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Stephen Boyd <swboyd@chromium.org>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] soc: qcom: stats: fix 64-bit division
Message-ID: <57aatyq7y62uocvm76hucgr7zbwu2q573iq5miuua7n4rd4wjm@6fbsuryxo55s>
References: <20231206123717.524009-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231206123717.524009-1-arnd@kernel.org>

On Wed, Dec 06, 2023 at 01:37:06PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Unguarded 64-bit division is not allowed on 32-bit kernels because this
> is very slow. The result of trying anyway is a link failure:
> 
> arm-linux-gnueabi-ld: drivers/soc/qcom/qcom_stats.o: in function `qcom_ddr_stats_show':
> qcom_stats.c:(.text+0x334): undefined reference to `__aeabi_uldivmod'
> 
> As this function is only used for debugging and not performance critical,
> rewrite it to use div_u64() instead. ARCH_TIMER_FREQ is a multiple of
> MSEC_PER_SEC anyway, so there is no loss in precisison.
> 
> Fixes: e84e61bdb97c ("soc: qcom: stats: Add DDR sleep stats")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

I had [1] lined up already, but hadn't pushed the branch out out... Like
your version better, so dropping mine.

[1] https://lore.kernel.org/all/20231205-qcom_stats-aeabi_uldivmod-fix-v1-1-f94ecec5e894@quicinc.com/

Thanks,
Bjorn

> ---
>  drivers/soc/qcom/qcom_stats.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/qcom/qcom_stats.c b/drivers/soc/qcom/qcom_stats.c
> index 4763d62a8cb0..5ec8a754b22b 100644
> --- a/drivers/soc/qcom/qcom_stats.c
> +++ b/drivers/soc/qcom/qcom_stats.c
> @@ -221,7 +221,7 @@ static int qcom_ddr_stats_show(struct seq_file *s, void *unused)
>  
>  	for (i = 0; i < ddr.entry_count; i++) {
>  		/* Convert the period to ms */
> -		entry[i].dur = mult_frac(MSEC_PER_SEC, entry[i].dur, ARCH_TIMER_FREQ);
> +		entry[i].dur = div_u64(entry[i].dur, ARCH_TIMER_FREQ / MSEC_PER_SEC);
>  	}
>  
>  	for (i = 0; i < ddr.entry_count; i++)
> -- 
> 2.39.2
> 

