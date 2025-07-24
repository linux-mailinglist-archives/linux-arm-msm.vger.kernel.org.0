Return-Path: <linux-arm-msm+bounces-66502-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAC1B10961
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 13:39:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B0A801892874
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 11:39:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 494E02459D7;
	Thu, 24 Jul 2025 11:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="btqezY8p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACEAB23F40C
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 11:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753357173; cv=none; b=mFngh06nsMqzO4a3wr3ZdywtK5zJ18ZbWUBatsUKXr9iSdWrJYtI1EdpZE236BVroBxUTaYjIZPfmYrF4LiBMQhHtPqt8vs3EhBgogY2Dpz8xfQ7jkb49Dz+BClxVWtgE1E99L003aA/7Y2tlPuwIlKZIj2JgD4l9JDcWXBrOig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753357173; c=relaxed/simple;
	bh=CucY8CClJThC160kd0K167/37SBD1Bmj+AaitNmYoq0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TTezg0lRbVkM16DYBRriL+vqKQyGOXApRX4/ESfEjVvlvzLxMbowsaCb2boC3TvLgz+489vswtPyPCACJzhREGPhlQtcgL1VQTlTN0yHvYm/ryFCXIdvBDuoPuCnhfKIczFMDtgEY+xP87OYaF3FeUI+kpTSjp06bV7daOY4cE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=btqezY8p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56O9ejmB029833
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 11:39:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oqSerAH08mV+bu18I/AJbmlNy8XOCWAaqntFX3ows/0=; b=btqezY8pJgbADaRU
	scEYcRojeNpyXK+P8q8dFPu5gGoh7D/jOaR/MtgR4VpicfK4BCZ85M2rrImgK7kJ
	Ec0Q+znmi4C1uN7BzyrhTSFx6VauxEkKxHhRSRnm+fHeM90yyQ4Ve2rho90VofRK
	xly/1DSOsAqhafmpoRD67mxKDypFGkhs0pHWwlnU/WzLPtErI6oBYNJnQ0YT71SB
	tb9lYpdHBgEXRBoD8nCAI3gHQKZwzqXcDNGzlMAC2j1OfzXBym1EmEA3Fyy0f+yC
	omV67354n7tPn5p3Uf7SgMxm/NE8hF+SVx6Lgaj3fo2FEzROiTNZkLJLVYmMzqnS
	XigT7w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481t6w9ra2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 11:39:30 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e33990ba42so14244585a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 04:39:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753357169; x=1753961969;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oqSerAH08mV+bu18I/AJbmlNy8XOCWAaqntFX3ows/0=;
        b=k+205ETBEQdWxTL/I5lsTf1TVWMYAVbgXs/IjHdNdFutHOEYPDKeX8tcz6oudtgClp
         1v+mWfCtZUfCgYDHtgXX0Nnko+acoklRuKXcGoZu90XujLXmtZxuhgIbB3jH04qGGaLC
         KgtDTXfVvM0sfEpd6WpE/w+jJhIlH0EyZpq0RRML6XPmgDRJA9+r3ZTaRhTFYXd9JLqI
         PUglHltFFHi6e/S4lRBY/OSXcrV2NIVTivkYUrLUW+LgM6MIzQBZnqfMV/navi1dIXLr
         q0pttvgSRGzvIC8Xzx4LayDZuHfeJQNUvLzoJVWde7W4FSWAdFoj3nM63CmxRlIrkj1E
         X5UQ==
X-Gm-Message-State: AOJu0YwEpsh/TGLOBx0IfpijqErfLE8Pxm6/twe5OCVfYIyE7P3Y1QsP
	f1TbiCxxIAIXtkhJrR4HBY6t8i5+lRFv6pN+tf5tLnLoHDwKZnKG4najtGuk1joZj13zY04RaaO
	XHtzKisjoQD+mXxWPXvi3Gif9P7llfws6rU5vl8XzSgYGEvJRtMzIgjn6vwLx/WYEFX5E
X-Gm-Gg: ASbGncurECKRrkE5DX9TmMhS62b8POUTYfV7f2picYd5+CaaelGjwGZqcYa1allH7vY
	CNOxLVvogZ7c99VNL5W+Qo+nRGHIEHREt4qleAFrt+UIFWpusGiM+XAG06tn0J4IrqTS4OE3WwY
	odT7rXY6IdFJh0Knz2Z4nfyRDZKx+4bkLezQEFK8p0CGxtL/Y/V0qBqHtBSaMLIBtS92WdIXOK7
	+3Jcs0IUeVLxvbrzpBZF44sJexj/jLruKv+Rh6ze62v6gIedVXKDOsUtN9B0X4k8upmlqMS0lkY
	PzjyAcmgnsRR+1xhAaYWkQI/uDa2Tl4hBG9Mhp5f2XqnfPT6OpjD2HOSGnumPw1xWsz6c+z/kbl
	X5ZJWOc1V0ax8erzH0w==
X-Received: by 2002:a05:620a:1010:b0:7e2:ee89:2059 with SMTP id af79cd13be357-7e62a161c98mr301780285a.4.1753357169370;
        Thu, 24 Jul 2025 04:39:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrXXj7nS41J4tzvt5vYVWROB7LrrdrXAgkyDwKGD/CaWyzImC+WopFcS+OfvIBt6ZwiO1KzA==
X-Received: by 2002:a05:620a:1010:b0:7e2:ee89:2059 with SMTP id af79cd13be357-7e62a161c98mr301778885a.4.1753357168938;
        Thu, 24 Jul 2025 04:39:28 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-614cd31ac41sm703041a12.54.2025.07.24.04.39.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jul 2025 04:39:28 -0700 (PDT)
Message-ID: <ae143353-b979-452a-be29-0c64fd90dfd0@oss.qualcomm.com>
Date: Thu, 24 Jul 2025 13:39:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/17] drm/msm/a6xx: Poll additional DRV status
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-4-9347aa5bcbd6@oss.qualcomm.com>
 <9778efad-e9a8-4934-9b70-b0429bcfe63e@oss.qualcomm.com>
 <002eb889-87cb-4b8c-98fb-6826c6977868@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <002eb889-87cb-4b8c-98fb-6826c6977868@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SPpCVPvH c=1 sm=1 tr=0 ts=68821b72 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=0a86huQbBvxycGr4qhYA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDA4NyBTYWx0ZWRfX+Lx49ujzJS0q
 0cSUcWekAqfH+1MGAfX0QOPqZVi0ZocWFhfRycJDzOngbipNfwf3XHHS/h8VOQv4YIneVnqbnnz
 opUwns4xCQPo1BkvV6/9T0d5ugq1LmD9QNAP3TltKzC9zIhfRBTD0n0Rku/fo7jY/3X7rlx7XIE
 VMHIpPG1TuEBn7R4hS9YHSi13ndxrHDn2R2OFAde3likgE/G85I1mcAo8zzK2ps6oCJOnjaPeFI
 tttRrCkNT0SG64k/RgjkyquCGu/cQL+Le0M8MDGTzGqwLlUFMVXaaqpb3e1gxdKGqgplAtgIwc1
 nmGq2VW2mmadJ4BEnoaI7pzstqGVTmSFgoHTsAq/2AeHZEeTwFc0vRbsCANJN6ID8lZvq9cxW1N
 GaiBsB+jv0S2n1Wi6U1fPI2GbzXTgjRKg1ggTTxBEvvBhUkMzGzBmxtmdse93Wc6B2YAJVBv
X-Proofpoint-ORIG-GUID: mSMXWzXfhWEuwvU0UJxyzlUIMCPu0zRD
X-Proofpoint-GUID: mSMXWzXfhWEuwvU0UJxyzlUIMCPu0zRD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_01,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 mlxscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507240087

On 7/23/25 9:28 PM, Akhil P Oommen wrote:
> On 7/23/2025 3:31 PM, Konrad Dybcio wrote:
>> On 7/20/25 2:16 PM, Akhil P Oommen wrote:
>>> A7XX_GEN2 generation has additional TCS slots. Poll the respective
>>> DRV status registers before pm suspend.
>>>
>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>> ---
>>>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 16 ++++++++++++++++
>>>  1 file changed, 16 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>> index 790ef2f94a0b0cd40433d7edb6a89e4f04408bf5..3bebb6dd7059782ceca29f2efd2acee24d3fc930 100644
>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>> @@ -987,6 +987,22 @@ static void a6xx_gmu_rpmh_off(struct a6xx_gmu *gmu)
>>>  		val, (val & 1), 100, 10000);
>>>  	gmu_poll_timeout_rscc(gmu, REG_A6XX_RSCC_TCS3_DRV0_STATUS + seqmem_off,
>>>  		val, (val & 1), 100, 1000);
> 
> 1000us here is a typo and I copied the same mistake below. I will update
> all of these timeout values to a common 10000us in the next revision.
> 
>>> +
>>> +	if (!adreno_is_a740_family(adreno_gpu))
>>> +		return;
>>> +
>>> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS4_DRV0_STATUS + seqmem_off,
>>> +		val, (val & 1), 100, 10000);
>>> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS5_DRV0_STATUS + seqmem_off,
>>> +		val, (val & 1), 100, 10000);
>>> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS6_DRV0_STATUS + seqmem_off,
>>> +		val, (val & 1), 100, 10000);
>>> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS7_DRV0_STATUS + seqmem_off,
>>> +		val, (val & 1), 100, 1000);
>>> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS8_DRV0_STATUS + seqmem_off,
>>> +		val, (val & 1), 100, 10000);
>>> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS9_DRV0_STATUS + seqmem_off,
>>> +		val, (val & 1), 100, 1000);
>>
>> FWIW there are places downstream where it polls for 1 ms
>> (gen7_gmu_pwrctrl_suspend) / 2 ms (gen7_gmu_power_off) ms (as opposed
>> to 1 or 10 ms here), but the timeouts are all the same across registers
>> (unlike TCS3 and TCS9 above)
>>
>> Ultimately it's a timeout, so a value too big shouldn't matter, but
>> let's make sure the other threshold is ok
> 
> They are fine. We can try to reduce the timeout 2ms in a separate patch
> outside of this series.

Great, thanks for confirming!

Konrad

