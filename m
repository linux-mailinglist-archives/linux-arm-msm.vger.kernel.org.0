Return-Path: <linux-arm-msm+bounces-87146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 75042CED07A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 01 Jan 2026 14:13:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3022F3005EA9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jan 2026 13:13:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B588221FCA;
	Thu,  1 Jan 2026 13:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="japOD/dx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5C51EF36C;
	Thu,  1 Jan 2026 13:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767273210; cv=none; b=f7C8HCJ+CrlECMVL/J6krQUcYkm9INfV8gGqNz+wxYRA9rJKMNGXt+SHB3Zg7s0BcZGxh7JC8HiJQPX63aCVNM/HAwuffimuZMfpPuDcxDX7kOf+D8gw3fVDqLjgaQkjrlHREAx0hcviqoKIAByGyAH3YbbAmhPBtXBOzZ/VCIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767273210; c=relaxed/simple;
	bh=9V8aI1o7n1SnXYltnmhx6oUQI7KKm53MEbLdll8kc2E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aG6R0AWckSGfMJPa4Sh15hIrFAGbRQVov5jaDlonraCM496qPVeevrB+XkiYbKsEj5OYt57KY3O71IoZ8jdW+OUYfazVXEU+3Zcq38zMmwpZgnYZGTwZVYJej3eApKsiVgRJz/zk/APJ4VcFX8CBRl6/V0ddWirBMi5hwtUom0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=japOD/dx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 070ABC4CEF7;
	Thu,  1 Jan 2026 13:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767273209;
	bh=9V8aI1o7n1SnXYltnmhx6oUQI7KKm53MEbLdll8kc2E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=japOD/dxyeNFqscSPSWpEs49PJOBBZlZYLi8Lm85/Z2VAb4tMKrHgHQUMSidvlKE9
	 XNWQkh7n/6qFVwTLpRSSwUTTm80U+xkLNADeiXzqdcNrWDYD8s6UtB0b3Tk4fBs25Y
	 Wy5bi/cd9hSnLVbPeh9h2juAYCtww+w9wxEzf/9dnTKzF5McFobHVEZJsLHg7Mb29N
	 HoC+943PjCL1ZoP05TTZxwzEuYxcxyoGt3MBFsVitnCFcUfzYegK8BPT1oKzb6bahL
	 mKU+fxFmhNrbrdyOazLHoftdpZurp76ma4yLCqLAa1f8o7F3nHH+po5ZCAjHiWyBVs
	 zp9n5Ce19cKhA==
Message-ID: <6bfc790d-b0da-4c5b-bd2d-ceed9a75bb24@kernel.org>
Date: Thu, 1 Jan 2026 13:13:24 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/9] remoteproc: qcom_q6v5_mss: Add MDM9607
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251231-mss-v3-0-f80e8fade9ec@mainlining.org>
 <NLGulU4z-1Wrf5120YfX8CYJ_8DSP-9-DhaJ3KAIQCvqF9Qf184udOzFoEQH1qgJDZUl9cxEpsdyztfhcz8G-w==@protonmail.internalid>
 <20251231-mss-v3-3-f80e8fade9ec@mainlining.org>
Content-Language: en-US
From: Bryan O'Donoghue <bod@kernel.org>
In-Reply-To: <20251231-mss-v3-3-f80e8fade9ec@mainlining.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 31/12/2025 16:30, Barnabás Czémán wrote:
> From: Stephan Gerhold <stephan@gerhold.net>
> 
> Add support for MDM9607 MSS it have different ACC settings
> and it needs mitigation for inrush current issue.
> 
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> [Reword the commit, add necessary flags, rework inrush current mitigation]
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>   drivers/remoteproc/qcom_q6v5_mss.c | 89 ++++++++++++++++++++++++++++++++------
>   1 file changed, 75 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index 3c404118b322..19863c576d72 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -124,6 +124,7 @@
>   #define QDSP6v56_CLAMP_QMC_MEM		BIT(22)
>   #define QDSP6SS_XO_CBCR		0x0038
>   #define QDSP6SS_ACC_OVERRIDE_VAL		0x20
> +#define QDSP6SS_ACC_OVERRIDE_VAL_9607	0x80800000
>   #define QDSP6v55_BHS_EN_REST_ACK	BIT(0)
> 
>   /* QDSP6v65 parameters */
> @@ -256,6 +257,7 @@ struct q6v5 {
>   };
> 
>   enum {
> +	MSS_MDM9607,
>   	MSS_MSM8226,
>   	MSS_MSM8909,
>   	MSS_MSM8916,
> @@ -747,15 +749,19 @@ static int q6v5proc_reset(struct q6v5 *qproc)
>   			return ret;
>   		}
>   		goto pbl_wait;
> -	} else if (qproc->version == MSS_MSM8909 ||
> +	} else if (qproc->version == MSS_MDM9607 ||
> +		   qproc->version == MSS_MSM8909 ||
>   		   qproc->version == MSS_MSM8953 ||
>   		   qproc->version == MSS_MSM8996 ||
>   		   qproc->version == MSS_MSM8998 ||
>   		   qproc->version == MSS_SDM660) {
> 
> -		if (qproc->version != MSS_MSM8909 &&
> -		    qproc->version != MSS_MSM8953)
> -			/* Override the ACC value if required */
> +		/* Override the ACC value if required */
> +		if (qproc->version == MSS_MDM9607)
> +			writel(QDSP6SS_ACC_OVERRIDE_VAL_9607,
> +			       qproc->reg_base + QDSP6SS_STRAP_ACC);
> +		else if (qproc->version != MSS_MSM8909 &&
> +			 qproc->version != MSS_MSM8953)
>   			writel(QDSP6SS_ACC_OVERRIDE_VAL,
>   			       qproc->reg_base + QDSP6SS_STRAP_ACC);
> 
> @@ -800,7 +806,7 @@ static int q6v5proc_reset(struct q6v5 *qproc)
>   		writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
> 
>   		if (qproc->version != MSS_MSM8909) {
> -			int mem_pwr_ctl;
> +			int mem_pwr_ctl, reverse = 0;
> 
>   			/* Deassert QDSP6 compiler memory clamp */
>   			val = readl(qproc->reg_base + QDSP6SS_PWR_CTL_REG);
> @@ -812,7 +818,8 @@ static int q6v5proc_reset(struct q6v5 *qproc)
>   			writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
> 
>   			/* Turn on L1, L2, ETB and JU memories 1 at a time */
> -			if (qproc->version == MSS_MSM8953 ||
> +			if (qproc->version == MSS_MDM9607 ||
> +			    qproc->version == MSS_MSM8953 ||
>   			    qproc->version == MSS_MSM8996) {
>   				mem_pwr_ctl = QDSP6SS_MEM_PWR_CTL;
>   				i = 19;
> @@ -822,16 +829,34 @@ static int q6v5proc_reset(struct q6v5 *qproc)
>   				i = 28;
>   			}
>   			val = readl(qproc->reg_base + mem_pwr_ctl);
> -			for (; i >= 0; i--) {
> -				val |= BIT(i);
> -				writel(val, qproc->reg_base + mem_pwr_ctl);
> +			if (qproc->version == MSS_MDM9607) {
>   				/*
> -				 * Read back value to ensure the write is done then
> -				 * wait for 1us for both memory peripheral and data
> -				 * array to turn on.
> +				 * Set first 5 bits in reverse to avoid
> +				 * "inrush current" issues.
>   				 */
> -				val |= readl(qproc->reg_base + mem_pwr_ctl);
> -				udelay(1);
> +				reverse = 6;
> +				for (; i >= reverse; i--) {
> +					val |= BIT(i);
> +					writel(val, qproc->reg_base + mem_pwr_ctl);
> +					udelay(1);
> +				}
> +				for (i = 0; i < reverse; i++) {
> +					val |= BIT(i);
> +					writel(val, qproc->reg_base + mem_pwr_ctl);
> +					udelay(1);
> +				}
> +			} else {
> +				for (; i >= 0; i--) {
> +					val |= BIT(i);
> +					writel(val, qproc->reg_base + mem_pwr_ctl);
> +					/*
> +					 * Read back value to ensure the write is done then
> +					 * wait for 1us for both memory peripheral and data
> +					 * array to turn on.
> +					 */
> +					val |= readl(qproc->reg_base + mem_pwr_ctl);
> +					udelay(1);

Isn't the logic here inverted ?

i.e. you've written a thing and ostensibly require a delay for that 
thing to take effect, the power to switch on in this case.

It makes more sense to write, delay and read back rather than write, 
readback and delay surely...


> +				}
>   			}
>   		} else {
>   			/* Turn on memories */
> @@ -2410,6 +2435,41 @@ static const struct rproc_hexagon_res msm8996_mss = {
>   	.version = MSS_MSM8996,
>   };
> 
> +static const struct rproc_hexagon_res mdm9607_mss = {
> +	.hexagon_mba_image = "mba.mbn",
> +	.proxy_supply = (struct qcom_mss_reg_res[]) {
> +		{
> +			.supply = "pll",
> +			.uA = 100000,
> +		},
> +		{}
> +	},
> +	.proxy_clk_names = (char*[]){
> +		"xo",
> +		NULL
> +	},
> +	.active_clk_names = (char*[]){
> +		"iface",
> +		"bus",
> +		"mem",
> +		NULL
> +	},
> +	.proxy_pd_names = (char*[]){
> +		"mx",
> +		"cx",
> +		NULL
> +	},
> +	.need_mem_protection = false,
> +	.has_alt_reset = false,
> +	.has_mba_logs = false,
> +	.has_spare_reg = false,
> +	.has_qaccept_regs = false,
> +	.has_ext_bhs_reg = false,
> +	.has_ext_cntl_regs = false,
> +	.has_vq6 = false,
> +	.version = MSS_MDM9607,
> +};
> +
>   static const struct rproc_hexagon_res msm8909_mss = {
>   	.hexagon_mba_image = "mba.mbn",
>   	.proxy_supply = (struct qcom_mss_reg_res[]) {
> @@ -2672,6 +2732,7 @@ static const struct rproc_hexagon_res msm8926_mss = {
> 
>   static const struct of_device_id q6v5_of_match[] = {
>   	{ .compatible = "qcom,q6v5-pil", .data = &msm8916_mss},
> +	{ .compatible = "qcom,mdm9607-mss-pil", .data = &mdm9607_mss},
>   	{ .compatible = "qcom,msm8226-mss-pil", .data = &msm8226_mss},
>   	{ .compatible = "qcom,msm8909-mss-pil", .data = &msm8909_mss},
>   	{ .compatible = "qcom,msm8916-mss-pil", .data = &msm8916_mss},
> 
> --
> 2.52.0
> 
> 


