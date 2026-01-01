Return-Path: <linux-arm-msm+bounces-87150-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B62BDCED0DD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 01 Jan 2026 14:50:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 862D93006A88
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jan 2026 13:50:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 707F12192FA;
	Thu,  1 Jan 2026 13:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="FzDzYMcb";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="UHX3oXuT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C437165F1A;
	Thu,  1 Jan 2026 13:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767275442; cv=none; b=EiYjyM+AKsIF5cRvm65tYpmPn92+s68DG1gduRn+P5ocr+0V/moP/+yH3HcH5XKFMdHl5Z30tcsc0VMGiYqeQU4hMhzIGZuBNMs3vXL1fyGPR8GKsGT+2jN0w441e1qhf2gfHjSoPjLWB693O755JvhpsYSxd9GzrNnUo0P7qY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767275442; c=relaxed/simple;
	bh=3e4H6haB2jmKOTitA+ZkBpM/1nxyyNMmSCrrwVZumFk=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=GUGMDSjx5B2wtBudQQEfu9aPLyuf2XjIGfKa+nPB5OcJTzfMPB1ek6P/5i4bQq6N45DGCJC1te6tvoYcZtLx0vmXRNl6WN0FmEqrpNBtr1W8YwRWJVZq1kO5HVIVwHvAgyXi0pD1410VfDGZDegEjpOY0L1G7q7rV7Co71M/PmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=FzDzYMcb; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=UHX3oXuT; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1767275436; bh=gVVy6N7IBHr0dQ0MDVMgUdo
	GWyU9B+K2sDhgf03Tfk8=; b=FzDzYMcbS5sz5vmDCa7h+n7ZVT3fn3LLAFsKO7EkeyXiUftyvL
	yAAUFwXyvUIKl4Awg6Fj+D2+s4tds7eQl9cuPrayk4TuDocaznuzZv7/Errd6ohFCiBjsx/xYlB
	Jhck9whH/Az++uQbFqzXC2qBjHDJM5Cq2y9XlRSFu2Y7mFLGh7GdK9fMHtu7dOUaUwm1gFnoGIU
	FzKQvgR3Fcct5p3R+++xTQPrPmnHw+x7GV1yv+jzhJhwJNrxSxFbjla4pLjeHA7Gs8b8GhXU4Qm
	e/omwZMmCqppfEOaAIAjT5f8GJL8qrJCuHBTcCwypzjb9eEZKXUc9DxjNJ8teDNaqTg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1767275436; bh=gVVy6N7IBHr0dQ0MDVMgUdo
	GWyU9B+K2sDhgf03Tfk8=; b=UHX3oXuTwYVWza1r2G5cNyE+01O1PNwhIVkxPAnBorsjZG8SLf
	IN0ZLL635kJ7azmoSFHnFRDRemVHuxJ7+ADg==;
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 01 Jan 2026 14:50:36 +0100
From: barnabas.czeman@mainlining.org
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Stephan
 Gerhold <stephan@gerhold.net>, linux-arm-msm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/9] remoteproc: qcom_q6v5_mss: Add MDM9607
In-Reply-To: <6bfc790d-b0da-4c5b-bd2d-ceed9a75bb24@kernel.org>
References: <20251231-mss-v3-0-f80e8fade9ec@mainlining.org>
 <NLGulU4z-1Wrf5120YfX8CYJ_8DSP-9-DhaJ3KAIQCvqF9Qf184udOzFoEQH1qgJDZUl9cxEpsdyztfhcz8G-w==@protonmail.internalid>
 <20251231-mss-v3-3-f80e8fade9ec@mainlining.org>
 <6bfc790d-b0da-4c5b-bd2d-ceed9a75bb24@kernel.org>
Message-ID: <a627abcaa38c0ba11c76c1f0c42b0c6b@mainlining.org>
X-Sender: barnabas.czeman@mainlining.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2026-01-01 14:13, Bryan O'Donoghue wrote:
> On 31/12/2025 16:30, Barnabás Czémán wrote:
>> From: Stephan Gerhold <stephan@gerhold.net>
>> 
>> Add support for MDM9607 MSS it have different ACC settings
>> and it needs mitigation for inrush current issue.
>> 
>> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
>> [Reword the commit, add necessary flags, rework inrush current 
>> mitigation]
>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>> ---
>>   drivers/remoteproc/qcom_q6v5_mss.c | 89 
>> ++++++++++++++++++++++++++++++++------
>>   1 file changed, 75 insertions(+), 14 deletions(-)
>> 
>> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c 
>> b/drivers/remoteproc/qcom_q6v5_mss.c
>> index 3c404118b322..19863c576d72 100644
>> --- a/drivers/remoteproc/qcom_q6v5_mss.c
>> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
>> @@ -124,6 +124,7 @@
>>   #define QDSP6v56_CLAMP_QMC_MEM		BIT(22)
>>   #define QDSP6SS_XO_CBCR		0x0038
>>   #define QDSP6SS_ACC_OVERRIDE_VAL		0x20
>> +#define QDSP6SS_ACC_OVERRIDE_VAL_9607	0x80800000
>>   #define QDSP6v55_BHS_EN_REST_ACK	BIT(0)
>> 
>>   /* QDSP6v65 parameters */
>> @@ -256,6 +257,7 @@ struct q6v5 {
>>   };
>> 
>>   enum {
>> +	MSS_MDM9607,
>>   	MSS_MSM8226,
>>   	MSS_MSM8909,
>>   	MSS_MSM8916,
>> @@ -747,15 +749,19 @@ static int q6v5proc_reset(struct q6v5 *qproc)
>>   			return ret;
>>   		}
>>   		goto pbl_wait;
>> -	} else if (qproc->version == MSS_MSM8909 ||
>> +	} else if (qproc->version == MSS_MDM9607 ||
>> +		   qproc->version == MSS_MSM8909 ||
>>   		   qproc->version == MSS_MSM8953 ||
>>   		   qproc->version == MSS_MSM8996 ||
>>   		   qproc->version == MSS_MSM8998 ||
>>   		   qproc->version == MSS_SDM660) {
>> 
>> -		if (qproc->version != MSS_MSM8909 &&
>> -		    qproc->version != MSS_MSM8953)
>> -			/* Override the ACC value if required */
>> +		/* Override the ACC value if required */
>> +		if (qproc->version == MSS_MDM9607)
>> +			writel(QDSP6SS_ACC_OVERRIDE_VAL_9607,
>> +			       qproc->reg_base + QDSP6SS_STRAP_ACC);
>> +		else if (qproc->version != MSS_MSM8909 &&
>> +			 qproc->version != MSS_MSM8953)
>>   			writel(QDSP6SS_ACC_OVERRIDE_VAL,
>>   			       qproc->reg_base + QDSP6SS_STRAP_ACC);
>> 
>> @@ -800,7 +806,7 @@ static int q6v5proc_reset(struct q6v5 *qproc)
>>   		writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
>> 
>>   		if (qproc->version != MSS_MSM8909) {
>> -			int mem_pwr_ctl;
>> +			int mem_pwr_ctl, reverse = 0;
>> 
>>   			/* Deassert QDSP6 compiler memory clamp */
>>   			val = readl(qproc->reg_base + QDSP6SS_PWR_CTL_REG);
>> @@ -812,7 +818,8 @@ static int q6v5proc_reset(struct q6v5 *qproc)
>>   			writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
>> 
>>   			/* Turn on L1, L2, ETB and JU memories 1 at a time */
>> -			if (qproc->version == MSS_MSM8953 ||
>> +			if (qproc->version == MSS_MDM9607 ||
>> +			    qproc->version == MSS_MSM8953 ||
>>   			    qproc->version == MSS_MSM8996) {
>>   				mem_pwr_ctl = QDSP6SS_MEM_PWR_CTL;
>>   				i = 19;
>> @@ -822,16 +829,34 @@ static int q6v5proc_reset(struct q6v5 *qproc)
>>   				i = 28;
>>   			}
>>   			val = readl(qproc->reg_base + mem_pwr_ctl);
>> -			for (; i >= 0; i--) {
>> -				val |= BIT(i);
>> -				writel(val, qproc->reg_base + mem_pwr_ctl);
>> +			if (qproc->version == MSS_MDM9607) {
>>   				/*
>> -				 * Read back value to ensure the write is done then
>> -				 * wait for 1us for both memory peripheral and data
>> -				 * array to turn on.
>> +				 * Set first 5 bits in reverse to avoid
>> +				 * "inrush current" issues.
>>   				 */
>> -				val |= readl(qproc->reg_base + mem_pwr_ctl);
>> -				udelay(1);
>> +				reverse = 6;
>> +				for (; i >= reverse; i--) {
>> +					val |= BIT(i);
>> +					writel(val, qproc->reg_base + mem_pwr_ctl);
>> +					udelay(1);
>> +				}
>> +				for (i = 0; i < reverse; i++) {
>> +					val |= BIT(i);
>> +					writel(val, qproc->reg_base + mem_pwr_ctl);
>> +					udelay(1);
>> +				}
>> +			} else {
>> +				for (; i >= 0; i--) {
>> +					val |= BIT(i);
>> +					writel(val, qproc->reg_base + mem_pwr_ctl);
>> +					/*
>> +					 * Read back value to ensure the write is done then
>> +					 * wait for 1us for both memory peripheral and data
>> +					 * array to turn on.
>> +					 */
>> +					val |= readl(qproc->reg_base + mem_pwr_ctl);
>> +					udelay(1);
> 
> Isn't the logic here inverted ?
> 
> i.e. you've written a thing and ostensibly require a delay for that 
> thing to take effect, the power to switch on in this case.
> 
> It makes more sense to write, delay and read back rather than write, 
> readback and delay surely...
This is the original reset sequence without modification, i have just 
moved it in a else case when it is not an MDM9607, MSM8917 or MSM8937.
> 
> 
>> +				}
>>   			}
>>   		} else {
>>   			/* Turn on memories */
>> @@ -2410,6 +2435,41 @@ static const struct rproc_hexagon_res 
>> msm8996_mss = {
>>   	.version = MSS_MSM8996,
>>   };
>> 
>> +static const struct rproc_hexagon_res mdm9607_mss = {
>> +	.hexagon_mba_image = "mba.mbn",
>> +	.proxy_supply = (struct qcom_mss_reg_res[]) {
>> +		{
>> +			.supply = "pll",
>> +			.uA = 100000,
>> +		},
>> +		{}
>> +	},
>> +	.proxy_clk_names = (char*[]){
>> +		"xo",
>> +		NULL
>> +	},
>> +	.active_clk_names = (char*[]){
>> +		"iface",
>> +		"bus",
>> +		"mem",
>> +		NULL
>> +	},
>> +	.proxy_pd_names = (char*[]){
>> +		"mx",
>> +		"cx",
>> +		NULL
>> +	},
>> +	.need_mem_protection = false,
>> +	.has_alt_reset = false,
>> +	.has_mba_logs = false,
>> +	.has_spare_reg = false,
>> +	.has_qaccept_regs = false,
>> +	.has_ext_bhs_reg = false,
>> +	.has_ext_cntl_regs = false,
>> +	.has_vq6 = false,
>> +	.version = MSS_MDM9607,
>> +};
>> +
>>   static const struct rproc_hexagon_res msm8909_mss = {
>>   	.hexagon_mba_image = "mba.mbn",
>>   	.proxy_supply = (struct qcom_mss_reg_res[]) {
>> @@ -2672,6 +2732,7 @@ static const struct rproc_hexagon_res 
>> msm8926_mss = {
>> 
>>   static const struct of_device_id q6v5_of_match[] = {
>>   	{ .compatible = "qcom,q6v5-pil", .data = &msm8916_mss},
>> +	{ .compatible = "qcom,mdm9607-mss-pil", .data = &mdm9607_mss},
>>   	{ .compatible = "qcom,msm8226-mss-pil", .data = &msm8226_mss},
>>   	{ .compatible = "qcom,msm8909-mss-pil", .data = &msm8909_mss},
>>   	{ .compatible = "qcom,msm8916-mss-pil", .data = &msm8916_mss},
>> 
>> --
>> 2.52.0
>> 
>> 

