Return-Path: <linux-arm-msm+bounces-72083-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA2CB43F92
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 16:50:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A46737B38C1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 14:48:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AD6F30507F;
	Thu,  4 Sep 2025 14:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nWBjnhvg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4DD9301466
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Sep 2025 14:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756997410; cv=none; b=RvzYMk4Bfmbsv0V7z16RrR4An/X/7wcphtjw7yndsP4fSZTaALGp1TcDZRWFu/JBoF9l4P567vbUFpt2rYPBQUtCe1/YOSwz3mxrE1dchhoJ+oUYao20bpob4k7nW/m4S5iMXWRhbajlXoiTclP8H1E6Wa98TlIFn4bWe4BY2Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756997410; c=relaxed/simple;
	bh=alMbirdT3CCc6D7G4e583oLfyh6D9HJKmtifjlFhTOk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QjI88q2vBBZh8uOo0iF2/jdmry01e6jvmNOdwz9t2yDIGsCOL8aaWHg+0qka/abXU1/f9MJSJ/Bp7yDE1fE5EOnujk0w8OtyzCmlJduwg4/G/yxW8VL005yeVRAttwe5rn5IhukKeRZB3kvbkXwrJMHs4Mjvie4RobMhfZC1URA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nWBjnhvg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5849X7cx013583
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Sep 2025 14:50:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vEN3DVQPWnQ3YmNmi0dGVFvSE5AeHGCdQkQ8yWp6IEM=; b=nWBjnhvgBAlcyJEd
	8K6sQ67Jt1vV0mUBXuWNZB+AydZGmLwO7+mQn/QTdhJEmnNJuR8YBYCSvkHnhBuZ
	iDiuP60TvAkucuIN4zMJ/SqcgtBVS6qUZxVuk+s3d+YxKKcCov7Hrfjxu3V7F9US
	fBSVit+0cQzXoXHUBmuCosYJUyzi74tuK7wTIY2xFGsJ+CZIbq+4AsTrze4WRt7L
	xI8xGXNZbUYTX9Jzq64Mi8g7k84jVxUVyXdDiM1V9qzyr+Sawp1oiu9dANZ3CrrH
	xYMS9RrjcGUCXSS8jvCMAQ0/dt/CyIlh2VbcpsH2J+xFhdBMUi8NG5GW/fPHTXhc
	oRx9VA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48w8wybrax-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 14:50:07 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b48f648249so3193601cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 07:50:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756997406; x=1757602206;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vEN3DVQPWnQ3YmNmi0dGVFvSE5AeHGCdQkQ8yWp6IEM=;
        b=k+lOHqDHy+xm41XzZZkKrtqm7nLbyYoaTfdSaOrecZ38TBWXCczSgaPn0WxjwJyHzu
         Zbz3F3cpj1p+7aSHlxPIneTXWWsCaUwe6gp/Hv9KhJ5FaHYFJzffz8F22WNdgD4zTv0G
         9CUAgmr/NPrh/WWcGVGgnxMjz7t+5C0NGt2HOTw5eZ6PwiEtjTrqk01Ll05NQTRtb9Cc
         u0H05+TkNcMTpETEj3oldtsgQz0JrFYxHAZSuRHZ/BRDSAYHpdUWUiJkYAYcfGTSlLkm
         CfnvdLjt/fO1HfJgQPIvMXsRmEPnRzZ86pFUw+bsEWRCs/Gvb5dgMRMtBeBoQujZWzlj
         HxkA==
X-Forwarded-Encrypted: i=1; AJvYcCUR+RPU9MPOIf8uVshjRhHKOrx1bjT5Gq/3KRQ2d/pLsF5J6rQd5UnF5A4sQtwa/DzjRWWT/j5P9+WY5Mht@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8Ce9p2IwBXkFJVefcM0h9P05mbSwND4TlvGLZjcwdfjB6azt8
	Yy20DV7P13jUyF3dWlW5EQ0fjp9k9fQd+TBZ00by8bZQq3g5Tai3WwacS+TU3WI7wBpAKgzc7WV
	oIfJEVF8qNgzK8ib8RkQdTLAoqMMdrFb/dZMOSm4uOm8IK5RX3Sdx12ksvLICvB5SlU2H9T3aCN
	O1
X-Gm-Gg: ASbGncv2d26LQLcqw33l7leZJN6PnMlzU1bA0XanYFWy6f9pfI61e2nJO46XJogxsWH
	nt9F6tYFKnXOjDRUJm+FYqPLOoqfcG4+dWp9yCgRE6RLhh6rVMSIdAkABLUfjGO3idMW5VxsdhW
	CQSFpxlPpYdEf1QCMqEaocM4zwvY8cmgYobpo+PHTSfbxWiGHRV4WKLd9Y4rWoeEvSIl93w3WCq
	1j0R13VWqaJCMxPYcK45W5oMxoOddeMwIeKQMJaQX3fXP0TnW75o6Fiwg2+1K2NA+K5dAclXJsb
	ohY7M+oFQuzNzCsIFRhjhPyEYqrml00+18dlZGTANgJduthVL7EjO5yuFw7KVL73mdvVyoUo8LN
	FEibQYYD2D2MwVXxT8bIBbQ==
X-Received: by 2002:a05:622a:314:b0:4b2:9c61:4925 with SMTP id d75a77b69052e-4b313f6f611mr170378131cf.11.1756997406632;
        Thu, 04 Sep 2025 07:50:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6TDGPjmSsCamHewOM2+IFNcFZnByXwpc+6NwBdpVl4gFaguUqKR2wdfL7cEbd1fWAsWZrWw==
X-Received: by 2002:a05:622a:314:b0:4b2:9c61:4925 with SMTP id d75a77b69052e-4b313f6f611mr170377791cf.11.1756997405872;
        Thu, 04 Sep 2025 07:50:05 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b046cd5c274sm375616366b.98.2025.09.04.07.50.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 07:50:05 -0700 (PDT)
Message-ID: <6501e5b4-9939-4dac-991c-7a2033cfb506@oss.qualcomm.com>
Date: Thu, 4 Sep 2025 16:50:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] i2c: qcom-cci: Add OPP table support and enforce
 FAST_PLUS requirements
To: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20250904-topic-cci_updates-v1-0-d38559692703@oss.qualcomm.com>
 <20250904-topic-cci_updates-v1-4-d38559692703@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250904-topic-cci_updates-v1-4-d38559692703@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ycq95xRf c=1 sm=1 tr=0 ts=68b9a71f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=scFqH3SFngUqC7XewS8A:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: tgj1I_BF-QsTsiU2PkhMkDh2NrOj0m69
X-Proofpoint-ORIG-GUID: tgj1I_BF-QsTsiU2PkhMkDh2NrOj0m69
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDEwMSBTYWx0ZWRfXxsGBa8Qcewgo
 EzjQAgaoALD1ix7Nmq4pwSI1euxcsSEkoSL7i0CJxKinVndjmsTYI5PfBU/vwrUFCimsMEs20vU
 YBKBYXf5yD/wjBcnLAS9PL04gCS69EX0Vh1yhWmGTw/CieAtxWw3BJX1rjdWtNsUt0FyYCrHZo7
 T8XNzmwDI6J91HRjt2oNLvsh5A2sGDisqME82Fj9hNrYROdZ3qTOw2ZxgLvY4spI0cumyYNLL2f
 Ii4vATL8ZNB1Y6vsSI2Z09NiZCsrh+CJagTzBr8tx+XGBwj32CqbhfSVTj59vr3j2sdKJTMuLvi
 gAq0mma/X6+dDtAUpi28zknkdQWOyYOMf1nUIkMQbw9E8V/VbenlRhuLYFwsd5Qhz3fUbHVOGjE
 tRxFN9sA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_05,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509010101

On 9/4/25 4:31 PM, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The CCI clock has voltage requirements, which need to be described
> through an OPP table.
> 
> The 1 MHz FAST_PLUS mode requires the CCI core clock runs at 37,5 MHz
> (which is a value common across all SoCs), since it's not possible to
> reach the required timings with the default 19.2 MHz rate.
> 
> Address both issues by introducing an OPP table and using it to vote
> for the faster rate.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/i2c/busses/i2c-qcom-cci.c | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
> index 74fedfdec3ae4e034ec4d946179e963c783b5923..d6192e2a5e3bc4d908cba594d1910a41f3a41e9c 100644
> --- a/drivers/i2c/busses/i2c-qcom-cci.c
> +++ b/drivers/i2c/busses/i2c-qcom-cci.c
> @@ -10,6 +10,7 @@
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_opp.h>
>  #include <linux/pm_runtime.h>
>  
>  #define CCI_HW_VERSION				0x0
> @@ -121,6 +122,7 @@ struct cci_data {
>  	struct i2c_adapter_quirks quirks;
>  	u16 queue_size[NUM_QUEUES];
>  	struct hw_params params[3];
> +	bool fast_mode_plus_supported;
>  };
>  
>  struct cci {
> @@ -466,9 +468,22 @@ static const struct i2c_algorithm cci_algo = {
>  	.functionality = cci_func,
>  };
>  
> +static unsigned long cci_desired_clk_rate(struct cci *cci)
> +{
> +	if (cci->data->fast_mode_plus_supported)
> +		return 37500000ULL;
> +
> +	return 19200000ULL;

Well this is embarrassing

ULL -> UL

Konrad

