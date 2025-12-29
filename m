Return-Path: <linux-arm-msm+bounces-86835-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 67743CE6B2C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 13:33:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 358533008888
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 12:33:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 430B930F7E2;
	Mon, 29 Dec 2025 12:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="JqQ1dasu";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="m9d7A8fw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CBF82DA759;
	Mon, 29 Dec 2025 12:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767011627; cv=none; b=hdt/o+e2HP0zMUyaAGsHCVve9uqF3r7B0/b2BLFbO93/BXCKDL/WEEHR3gd3NX9tQlAw+RGhhminGZmRBcFwuRcaTF4suWgkq3Fp2H16taFKVgZo7lXrLsZXDneRC+KfM2yIpv6I3g4DaioPF9f79c2ZT3HTg9mnHMdYC0Ev4Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767011627; c=relaxed/simple;
	bh=q0Mtfk3/Csce1J0oLHDV930hZvWTnepvDZsbDVs17gM=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=YI2fX6DL/LGeSn7qVJRn7hrMz1h6JZOD10bn63cB0to03HwfE31pCLLpSHA3Cm+9BTOHPmUeSfvW81NTFSduErh0SJqYQeTSDJSYwSHoag3Fpx2E+QnAZ+w0vQba/LUDNq6jTZzFPM27Ije0e+tUn5uqycWHaqoyT5b5rLdro20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=JqQ1dasu; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=m9d7A8fw; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1767011621; bh=LcQHqzHh4nhBC7vPasEJMZd
	EfKtsGmouwejn7o3sprU=; b=JqQ1dasu5Ysg2pD7SkIdyVvSOhPMSn05PihlmJPYOQ2yTPyt2R
	bEObUgswANQi1WRuDkRajf+Yppzpcp64xm4jH67W1v/o+ML/ijjmqcMyieeCdwTTKNDBsTJkmTG
	0P0eBsMXBojV172MzJACWvRFvVYi/QaJaXwtOn+rSTfnAEtDz+smR6KwB5xhSJ1OdgwmauTXB23
	umHwDsv6kJLsguOZzCDMktlnUgKaFNRSbVK3MuoG0gvlAgjQCJvHiOiFLVNZwdwGTIbrEIuQgTN
	+nI9GvL/40VAR9trsMD+yO5SMtYFm9MB/H9koxU7qcDowf4O4dqTPpDdLp/9hFwcJkg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1767011621; bh=LcQHqzHh4nhBC7vPasEJMZd
	EfKtsGmouwejn7o3sprU=; b=m9d7A8fwcW/wb6RxD5Exfd5E0nRqloHKIbDo2ks0i9n0phC+wk
	0/o19x+lJ6Evb9R0YM1I9dAxyCHN/XR2LXDA==;
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 29 Dec 2025 13:33:41 +0100
From: barnabas.czeman@mainlining.org
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Stephan
 Gerhold <stephan@gerhold.net>, linux-arm-msm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/8] remoteproc: qcom_q6v5_mss: Add MSM8917
In-Reply-To: <aVJhH17XH1srlroL@linaro.org>
References: <20251228-mss-v1-0-aeb36b1f7a3f@mainlining.org>
 <20251228-mss-v1-4-aeb36b1f7a3f@mainlining.org>
 <aVJhH17XH1srlroL@linaro.org>
Message-ID: <d531f1346b59af06c323f393883b1d13@mainlining.org>
X-Sender: barnabas.czeman@mainlining.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-12-29 12:08, Stephan Gerhold wrote:
> On Sun, Dec 28, 2025 at 03:21:54PM +0100, Barnabás Czémán wrote:
>> Add support for MSM8917 MSS it is similar for MDM9607 MSS
>> only difference is the mss power domain.
>> 
>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>> ---
>>  drivers/remoteproc/qcom_q6v5_mss.c | 46 
>> ++++++++++++++++++++++++++++++++++++--
>>  1 file changed, 44 insertions(+), 2 deletions(-)
>> 
>> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c 
>> b/drivers/remoteproc/qcom_q6v5_mss.c
>> index ffafbe501a05..2579558fb567 100644
>> --- a/drivers/remoteproc/qcom_q6v5_mss.c
>> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
>> @@ -259,6 +259,7 @@ enum {
>>  	MSS_MSM8226,
>>  	MSS_MSM8909,
>>  	MSS_MSM8916,
>> +	MSS_MSM8917,
>>  	MSS_MSM8926,
>>  	MSS_MSM8953,
>>  	MSS_MSM8974,
>> @@ -749,13 +750,15 @@ static int q6v5proc_reset(struct q6v5 *qproc)
>>  		goto pbl_wait;
>>  	} else if (qproc->version == MSS_MDM9607 ||
>>  		   qproc->version == MSS_MSM8909 ||
>> +		   qproc->version == MSS_MSM8917 ||
>>  		   qproc->version == MSS_MSM8953 ||
>>  		   qproc->version == MSS_MSM8996 ||
>>  		   qproc->version == MSS_MSM8998 ||
>>  		   qproc->version == MSS_SDM660) {
>> 
>>  		/* Override the ACC value if required */
>> -		if (qproc->version == MSS_MDM9607)
>> +		if (qproc->version == MSS_MDM9607 ||
>> +		    qproc->version == MSS_MSM8917)
>>  			writel(QDSP6SS_ACC_OVERRIDE_VAL_9607,
>>  			       qproc->reg_base + QDSP6SS_STRAP_ACC);
>>  		else if (qproc->version != MSS_MSM8909 &&
>> @@ -817,6 +820,7 @@ static int q6v5proc_reset(struct q6v5 *qproc)
>> 
>>  			/* Turn on L1, L2, ETB and JU memories 1 at a time */
>>  			if (qproc->version == MSS_MDM9607 ||
>> +			    qproc->version == MSS_MSM8917 ||
>>  			    qproc->version == MSS_MSM8953 ||
>>  			    qproc->version == MSS_MSM8996) {
>>  				mem_pwr_ctl = QDSP6SS_MEM_PWR_CTL;
>> @@ -826,7 +830,8 @@ static int q6v5proc_reset(struct q6v5 *qproc)
>>  				 * Set first 5 bits in reverse to avoid
>>  				 * "inrush current" issues.
>>  				 */
>> -				if (qproc->version == MSS_MDM9607)
>> +				if (qproc->version == MSS_MDM9607 ||
>> +				    qproc->version == MSS_MSM8917)
>>  					reverse = 6;
>>  			} else {
>>  				/* MSS_MSM8998, MSS_SDM660 */
>> @@ -2538,6 +2543,42 @@ static const struct rproc_hexagon_res 
>> msm8916_mss = {
>>  	.version = MSS_MSM8916,
>>  };
>> 
>> +static const struct rproc_hexagon_res msm8917_mss = {
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
>> +	.proxy_pd_names = (char*[]) {
>> +		"cx",
>> +		"mx",
>> +		"mss",
> 
> Are you sure mss/pm8937_s1 also works as a power domain? It seems to be
> a plain regulator downstream (similar to msm8226/msm8974).
> 
> Same thing applies to MSM8953 as well though and there we seem to have
> decided to model it as a power domain ...
They have this at downstream, i guess this is why handled as a power 
domain.
vdd_mss-uV = <RPM_SMD_REGULATOR_LEVEL_TURBO>;
> 
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
>> +	.version = MSS_MSM8917,
> 
> You could set MSS_MDM9607 here to drop the extra diff above (but not
> sure if that would be clearer).
> 
> Thanks,
> Stephan

