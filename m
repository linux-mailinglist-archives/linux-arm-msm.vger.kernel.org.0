Return-Path: <linux-arm-msm+bounces-87148-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 590D3CED0AA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 01 Jan 2026 14:20:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4B6AC3006F65
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jan 2026 13:20:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F87A23D7CD;
	Thu,  1 Jan 2026 13:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RufB/FQa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD791CAA6C;
	Thu,  1 Jan 2026 13:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767273601; cv=none; b=fmSPHfpYGHhgmPYw/+yzKpOsH0F+svv4Czski4FZCfYmTAeBeZvakknPG4A6iwlHQA6gVdOqqiGFqMwW90JE2IWXoUTqGp9GyG2ppeNrebrCxoCI62DlZ901bGjSCEUTSbsJdfCF4njtVn31WzFtvm02GWTXfsHBojHZ2Dsyxxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767273601; c=relaxed/simple;
	bh=uolQMn6LEaEMyfkcPNhcgz8YHv5D8CZHeBGVfG/nuSY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=uMbLjMQ/Po2eTm4NbIgDsuN4/d9ioHdPq5M26Obm/AO5gLAcC0njLvEFjTIwOebEIwWEUQ6PFo+Nz5T4caqktAgZQFKhJoHLeofcDf/3M1EBUr9mwwLSpJbnebpAkCn2g5ewZSRVIeagxOfUPkgxWQ3BDTOyBOz6Zq6sD6J4pLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RufB/FQa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7BEEC4CEF7;
	Thu,  1 Jan 2026 13:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767273600;
	bh=uolQMn6LEaEMyfkcPNhcgz8YHv5D8CZHeBGVfG/nuSY=;
	h=Date:Subject:From:To:Cc:Reply-To:References:In-Reply-To:From;
	b=RufB/FQaz2kaCXxtZQGWjd2a4Iuvx0EjbKKryxoBmDom+7HIwIKX3PO8RSJ6RekF5
	 3JMb9qaEL+2Vc8KOKDqRyzadM65gZhwqDRHwaolYyPC2C9cLuA1utogn2XSObwB5xy
	 gkNpKYCyhDbAt+0oIJH8CfIWYKIzFZJZILURIdm2WeSbz+IXpjbU9TM0n60/waJ9eT
	 FVwKtJ7I+eRzcFT/q5njtS026ZBGbdCQl2Uvh0lJS2gJycGr9e7E2x5vtyt7qniURk
	 smjxZ9vbn/D2dhgfXfdU09oGVSpnYfDrifsqIT9Y3KrkvDDqyIad16Wi7vtZY9DRmz
	 PX9i37T0mgRnA==
Message-ID: <39090d1c-06ee-4a74-acbb-e63d1b8bdef0@kernel.org>
Date: Thu, 1 Jan 2026 13:19:55 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/9] remoteproc: qcom_q6v5_mss: Add MDM9607
From: Bryan O'Donoghue <bod@kernel.org>
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Reply-To: Bryan O'Donoghue <bod@kernel.org>
References: <20251231-mss-v3-0-f80e8fade9ec@mainlining.org>
 <NLGulU4z-1Wrf5120YfX8CYJ_8DSP-9-DhaJ3KAIQCvqF9Qf184udOzFoEQH1qgJDZUl9cxEpsdyztfhcz8G-w==@protonmail.internalid>
 <20251231-mss-v3-3-f80e8fade9ec@mainlining.org>
 <bhfoYnVs7452tgSQQdem4OsIZpx27RNAfLgcTgVCY3QX8lm0hiUmFxwxH6kRFfrCBFBFfIxmLNdL5dH0X8U0lA==@protonmail.internalid>
 <6bfc790d-b0da-4c5b-bd2d-ceed9a75bb24@kernel.org>
Content-Language: en-US
In-Reply-To: <6bfc790d-b0da-4c5b-bd2d-ceed9a75bb24@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 01/01/2026 13:13, Bryan O'Donoghue wrote:
> On 31/12/2025 16:30, Barnabás Czémán wrote:
>> From: Stephan Gerhold <stephan@gerhold.net>
>>
>> Add support for MDM9607 MSS it have different ACC settings
>> and it needs mitigation for inrush current issue.
>>
>> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
>> [Reword the commit, add necessary flags, rework inrush current mitigation]
>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>> ---
>>    drivers/remoteproc/qcom_q6v5_mss.c | 89 ++++++++++++++++++++++++++++++++------
>>    1 file changed, 75 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
>> index 3c404118b322..19863c576d72 100644
>> --- a/drivers/remoteproc/qcom_q6v5_mss.c
>> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
>> @@ -124,6 +124,7 @@
>>    #define QDSP6v56_CLAMP_QMC_MEM		BIT(22)
>>    #define QDSP6SS_XO_CBCR		0x0038
>>    #define QDSP6SS_ACC_OVERRIDE_VAL		0x20
>> +#define QDSP6SS_ACC_OVERRIDE_VAL_9607	0x80800000
>>    #define QDSP6v55_BHS_EN_REST_ACK	BIT(0)
>>
>>    /* QDSP6v65 parameters */
>> @@ -256,6 +257,7 @@ struct q6v5 {
>>    };
>>
>>    enum {
>> +	MSS_MDM9607,
>>    	MSS_MSM8226,
>>    	MSS_MSM8909,
>>    	MSS_MSM8916,
>> @@ -747,15 +749,19 @@ static int q6v5proc_reset(struct q6v5 *qproc)
>>    			return ret;
>>    		}
>>    		goto pbl_wait;
>> -	} else if (qproc->version == MSS_MSM8909 ||
>> +	} else if (qproc->version == MSS_MDM9607 ||
>> +		   qproc->version == MSS_MSM8909 ||
>>    		   qproc->version == MSS_MSM8953 ||
>>    		   qproc->version == MSS_MSM8996 ||
>>    		   qproc->version == MSS_MSM8998 ||
>>    		   qproc->version == MSS_SDM660) {
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
>>    			writel(QDSP6SS_ACC_OVERRIDE_VAL,
>>    			       qproc->reg_base + QDSP6SS_STRAP_ACC);
>>
>> @@ -800,7 +806,7 @@ static int q6v5proc_reset(struct q6v5 *qproc)
>>    		writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
>>
>>    		if (qproc->version != MSS_MSM8909) {
>> -			int mem_pwr_ctl;
>> +			int mem_pwr_ctl, reverse = 0;
>>
>>    			/* Deassert QDSP6 compiler memory clamp */
>>    			val = readl(qproc->reg_base + QDSP6SS_PWR_CTL_REG);
>> @@ -812,7 +818,8 @@ static int q6v5proc_reset(struct q6v5 *qproc)
>>    			writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
>>
>>    			/* Turn on L1, L2, ETB and JU memories 1 at a time */
>> -			if (qproc->version == MSS_MSM8953 ||
>> +			if (qproc->version == MSS_MDM9607 ||
>> +			    qproc->version == MSS_MSM8953 ||
>>    			    qproc->version == MSS_MSM8996) {
>>    				mem_pwr_ctl = QDSP6SS_MEM_PWR_CTL;
>>    				i = 19;
>> @@ -822,16 +829,34 @@ static int q6v5proc_reset(struct q6v5 *qproc)
>>    				i = 28;
>>    			}
>>    			val = readl(qproc->reg_base + mem_pwr_ctl);
>> -			for (; i >= 0; i--) {
>> -				val |= BIT(i);
>> -				writel(val, qproc->reg_base + mem_pwr_ctl);
>> +			if (qproc->version == MSS_MDM9607) {
>>    				/*
>> -				 * Read back value to ensure the write is done then
>> -				 * wait for 1us for both memory peripheral and data
>> -				 * array to turn on.
>> +				 * Set first 5 bits in reverse to avoid
>> +				 * "inrush current" issues.
>>    				 */
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
> 
Also now that I look at this, shouldn't you interrogate the bit gets set 
as per your write ?

Does this bit mean "yes I acknowledge your request" or "yes I carried 
out your request" ?

In the first case you care that the bit indicates something useful, in 
the second case it barely indicates anything at all.

---
bod

