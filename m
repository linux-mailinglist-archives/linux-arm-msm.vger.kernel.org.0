Return-Path: <linux-arm-msm+bounces-33206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE12991BEA
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 04:03:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D5A4A1F2200C
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 02:03:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82F3D42AA1;
	Sun,  6 Oct 2024 02:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fYDwnYxx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FACC4409;
	Sun,  6 Oct 2024 02:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728180188; cv=none; b=pLlyewfaWflreGnkZp0Go06er8kKz4FonSQKjHgUUX10SrOLtY+sYvD/e3v51U8/ffr7qtZmuPkjjv9TJp8detQU85Tgohvv1MmsA7XdU+u54/2HHNKzJVCDDRWKE0L5C/mVl1TY7yp3HCKogn0XiGXj4nHvDXqSwfQipOjJPV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728180188; c=relaxed/simple;
	bh=dM/GJwrUwetQVTARNYA5YMUecBhQis5UkShFb+bVDLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ggEtTCQhXiHiNDOeEAX9INNFKYIR3GO12VmydfDO54JWWH24Kdks33WFojS+a/mvecFgMGUrrV/g6P9GabbkXL+Pm9JcM1EVOUTILqx2i8UIQ2JcfM9jBTWnZEWNfNHDVj5Wnl6vIY4j6x+635sxu/RSJiHaOxtPZapvDNt3vNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fYDwnYxx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AD09C4CEC2;
	Sun,  6 Oct 2024 02:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728180187;
	bh=dM/GJwrUwetQVTARNYA5YMUecBhQis5UkShFb+bVDLg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fYDwnYxxKojqN6BNJ1YHuhHWAtGa1pHgLBtEEZ/oohiTnTHi3cJ5FCG+zq1tPvJOl
	 rJbppdQEw9T6aNp7yMujW5ggrjpXVMYwkGMDwBod93iwNuHrjvSXfeRaK/7G8+tJAT
	 GuAAYm8g1qHEi5Lg9nMAGG2hlR7+AetnIkq0XQUlfhio5eY5ShbsKKNeeUDSuGjl4x
	 tUDXpfO5ASCxLbMJSdEoLrdhIYrMiqtbypNahKWdL4QzK+JETkLtsKGt7wDvq/RnzI
	 vwFiV0amloU3Md8j2WNqikExDNAe/aVWjo3PJHh8N9clDLHNmIEUjIU/gnhIAbBxuX
	 WYhBHeX/BbrLQ==
Date: Sat, 5 Oct 2024 21:03:05 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Song Xue <quic_songxue@quicinc.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, kernel@quicinc.com, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] soc: qcom: llcc: Add configuration data for QCS615
Message-ID: <p72feqwqhs3gjzzq53gfaz4ljk2qjdgeanhzomyzvk5ymjdbg2@7jxdlknz2onv>
References: <20240924-add_llcc_support_for_qcs615-v1-0-a9f3289760d3@quicinc.com>
 <20240924-add_llcc_support_for_qcs615-v1-2-a9f3289760d3@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240924-add_llcc_support_for_qcs615-v1-2-a9f3289760d3@quicinc.com>

On Tue, Sep 24, 2024 at 06:07:12PM GMT, Song Xue wrote:
> Add LLCC configuration support for the QCS615 platform.
> 
> Signed-off-by: Song Xue <quic_songxue@quicinc.com>
> ---
>  drivers/soc/qcom/llcc-qcom.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
> index 8fa4ffd3a9b5921d95c20648048dcdfa20dde5db..11507eb3efff101e4f330e7f4282a31aa172369d 100644
> --- a/drivers/soc/qcom/llcc-qcom.c
> +++ b/drivers/soc/qcom/llcc-qcom.c
> @@ -151,6 +151,13 @@ enum llcc_reg_offset {
>  	LLCC_COMMON_STATUS0,
>  };
>  
> +static const struct llcc_slice_config qcs615_data[] =  {
> +	{ LLCC_CPUSS,    1,  128, 1, 0, 0xF, 0x0, 0, 0, 0, 0, 1, 1 },

I accepted Konrad's reformatting of these tables, so please check
linux-next in a couple of days (or the qcom for-next today), update and
resubmit this.

While doing so, please use lowercase hex digits.

No other concerns.

Thanks,
Bjorn

> +	{ LLCC_MDM,      8,  256, 0, 1, 0xF, 0x0, 0, 0, 0, 0, 1, 0 },
> +	{ LLCC_GPUHTW,   11, 128, 1, 1, 0xF, 0x0, 0, 0, 0, 0, 1, 0 },
> +	{ LLCC_GPU,      12, 128, 1, 0, 0xF, 0x0, 0, 0, 0, 0, 1, 0 },
> +};
> +
>  static const struct llcc_slice_config sa8775p_data[] =  {
>  	{LLCC_CPUSS,    1, 2048, 1, 0, 0x00FF, 0x0, 0, 0, 0, 1, 1, 0, 0},
>  	{LLCC_VIDSC0,   2, 512, 3, 1, 0x00FF, 0x0, 0, 0, 0, 1, 0, 0, 0},
> @@ -539,6 +546,16 @@ static const u32 llcc_v2_1_reg_offset[] = {
>  	[LLCC_COMMON_STATUS0]	= 0x0003400c,
>  };
>  
> +static const struct qcom_llcc_config qcs615_cfg[] = {
> +	{
> +		.sct_data	= qcs615_data,
> +		.size		= ARRAY_SIZE(qcs615_data),
> +		.need_llcc_cfg	= true,
> +		.reg_offset	= llcc_v1_reg_offset,
> +		.edac_reg_offset = &llcc_v1_edac_reg_offset,
> +	},
> +};
> +
>  static const struct qcom_llcc_config qdu1000_cfg[] = {
>  	{
>  		.sct_data       = qdu1000_data_8ch,
> @@ -721,6 +738,11 @@ static const struct qcom_llcc_config x1e80100_cfg[] = {
>  	},
>  };
>  
> +static const struct qcom_sct_config qcs615_cfgs = {
> +	.llcc_config	= qcs615_cfg,
> +	.num_config	= ARRAY_SIZE(qcs615_cfg),
> +};
> +
>  static const struct qcom_sct_config qdu1000_cfgs = {
>  	.llcc_config	= qdu1000_cfg,
>  	.num_config	= ARRAY_SIZE(qdu1000_cfg),
> @@ -1375,6 +1397,7 @@ static int qcom_llcc_probe(struct platform_device *pdev)
>  }
>  
>  static const struct of_device_id qcom_llcc_of_match[] = {
> +	{ .compatible = "qcom,qcs615-llcc", .data = &qcs615_cfgs },
>  	{ .compatible = "qcom,qdu1000-llcc", .data = &qdu1000_cfgs},
>  	{ .compatible = "qcom,sa8775p-llcc", .data = &sa8775p_cfgs },
>  	{ .compatible = "qcom,sc7180-llcc", .data = &sc7180_cfgs },
> 
> -- 
> 2.25.1
> 

