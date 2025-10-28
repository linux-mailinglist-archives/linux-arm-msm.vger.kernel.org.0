Return-Path: <linux-arm-msm+bounces-79166-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8399FC14440
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 12:07:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4BF1F4FF4C2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 10:59:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 081AB30C36F;
	Tue, 28 Oct 2025 10:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VbQud6Pf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2795B2C08C0
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 10:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761649099; cv=none; b=HthdqFN5P+2NlSeJLXCtnU5oLzxXjxeBKJHvKTsXA73NNk5Xa2TH6sSlAkQJnICCG72eBO4m/fvHugfIcKV4O/PXKVQTo0iicY/KfWapYasUpLMLxaYeoJpDCD6jlVb+R9DEXMVr5OAALWzpqT3iusdgSZv4uuLgPoT0rlTBOy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761649099; c=relaxed/simple;
	bh=vqremv0t2yHOOQI/+Hfhb2D20oc4q1/kuqwTB3jLX4E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j0HdnsqsKL+erARqXFuOV1Pgfnqsgg56V9KUj32UKtiaV8GFSCuvF4g7WFoZHdAa8InAWsNAW0QLwcZXCwqOUbDWjs+XYhvhWrnBcpCvwHBJRdhgw4K0bVBf3qF60dyCesR/oDLvU8CQZ6wLV8LBLuFehwhtBhONR7/XdmviIYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VbQud6Pf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59S82HZA2752289
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 10:58:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BctJ7Ge/xFD3/rRPCMnaqZXGXFAhHKqB0rU31331hjo=; b=VbQud6PfI2L7XENN
	Zukjk+GBpCddPcK84H5T6TKNuwLxdcxmJiYHXIB2mZV5vlGtI/7yR9il7CgCvXn/
	yoB37di3Jmscgd9GwG6tFbqnvyFoG0EYkTgg/6855jiyU5gZWA+SNCzJUSEInSRY
	ltwrWTlsrGjFfC0lCfdCoXxGqBtzAxzODEab284lBJE4VAUcrx6WPOs7y35mZJ5o
	BngoLd3lvZu/30vx2mCq1EpkhphPGPonYcFLAawJ/JTCyLAYQdrHhClInoYm7unO
	bG59M11+K+w4j+E6aldOZGzJA2lc0Cjv6ZsI7JD82jMUJdLCMWqBos7J6jC88W72
	Xyd5RQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a28nsuquh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 10:58:17 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-290c2d13a01so43295195ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 03:58:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761649097; x=1762253897;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BctJ7Ge/xFD3/rRPCMnaqZXGXFAhHKqB0rU31331hjo=;
        b=pMvoNNndw+YOj9rcwPAESB+ZwXLyEE1xLYGYs4cQCHgH0wpDhooMYC1mFpjPHaD1yE
         a/ZojMenQe2it/5qwmh4DkC5Vhy9HJzI0SZMwO9CmceiVwpWkg1WSXZuCYQwNAjQAzQ7
         eFPjbOQgh4AJgpxhcucPpdpZE9c2TK/YNAp7wwPVMKccAb2w64Oh1E4jeEeqI58xQDbL
         o66EcLJ9mCyyFdiKIdv4gOY0vXqWI81oQ+rgXWLGI4BqmlACXVZgIhwwRz6Y3WwWfnUe
         e492+W/kO7BTon02xnyGg8+SM9/hfzgjDDqUr74lGZ17UiE+bytrElk7Ne97euXI+hKC
         5H3g==
X-Gm-Message-State: AOJu0Yy8woZMbGzT+gjU3HYSnF88oP6r42Jq7mqXXcR/QXpJhajqlKSm
	dcb5I4dVe4aSBGU3v5yUmjRX+ovmH05xy0qP/FJpfqQDscnY3bUL2KXsVtb3I352benQRkK/0CW
	Oaw5jumLsMCYmBemcQ67igG6zUthFIusD7TiIdWKqEY/coYyu3OtOY3rU8bVuOtPtPq2L
X-Gm-Gg: ASbGncvYl0L/6GlV9baZcWq7YVg7u70qiPv2zdwvtkAjcVv36QvUFweiYToQQcT53FP
	ADzGxQwBV5ZWusqy8lcJiAKhOWTgJuXIDsU8ZcrlEBNdErsN7nSW1nelrdSCoaG19AjKLY5TCK2
	TZ75BkYIM1Jv2VUN7Wbm3h3bZn9Y+vA4yRNj8CBJsLn39otYNNn1dBVYHrrDIpewBMDIZOH9Cro
	Inlpi96cOILFWjoycmbd25IQ1bnLCm/bJ8v4meHQbUHp6vQTUX2w8wpppr/etSlXloi3JPHt7BG
	+ECft64YYFL55M8mm+T/14NOIQolqYDzyImAOcsWGFMcc0s5H9f5Xc9sZb2yd1nkkJmqX5X/lwd
	DfN4gCHot7WVw1MOnvdol/lEuzKpGv13+WgA1jz/fgEwgB9KLRJr5BEI38hTV8Vrk6zWfC2V3yx
	U9X5c0BUgFjSexjKsrB88DyQ==
X-Received: by 2002:a17:903:1c8:b0:267:8049:7c87 with SMTP id d9443c01a7336-294cc70eccbmr32589955ad.14.1761649096634;
        Tue, 28 Oct 2025 03:58:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0mw89yeFqR3a6GQze79ilRQbukr6qbMLLAHbQ/m/vxaAEX6diASv/5hii+JLxpSNZMzMZQA==
X-Received: by 2002:a17:903:1c8:b0:267:8049:7c87 with SMTP id d9443c01a7336-294cc70eccbmr32589645ad.14.1761649096102;
        Tue, 28 Oct 2025 03:58:16 -0700 (PDT)
Received: from [10.190.211.199] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d40de4sm114963405ad.77.2025.10.28.03.58.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 03:58:15 -0700 (PDT)
Message-ID: <76479593-c47b-41a7-8349-5d7c1403f7c0@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 16:28:10 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] watchdog: Add driver for Gunyah Watchdog
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20251028-gunyah_watchdog-v3-1-e6d1ea438b1d@oss.qualcomm.com>
 <25f7ff09-08ea-4969-9184-9fd01b097558@kernel.org>
Content-Language: en-US
From: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
In-Reply-To: <25f7ff09-08ea-4969-9184-9fd01b097558@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA5MyBTYWx0ZWRfX18cQpES5sN/7
 tQoykc7bSXBtSquxlGVYdl+XJrD3tI6Ovoo3WYMihgqqjJ8m0sXQqvyFSo12EVp10xcMsIMZEHn
 QhLkQdn+dL43X4JOOhbQPXoC8ehxvLRVAU9wt/w55iPOcyofNQ91OYQ1oe1QQV5/h1yVMFP17Ws
 2LtYtOmV0bSPbzErp44TibFcNffpOQIEQjKKp3jCZ9PGi1xPSz2KpzihENyQr3m10ag9a5xAC9I
 l0Mzz2/FOCcVwUiWId16Hi0/FDMtBJPtAOJXFB+TGXsLKYiYvsldAFZ4mu0rUnx8a3XFml/e05t
 M5EGbmh31j5ARS5Uq4dCmOE1YE+yPEfGo6m5NsvHUY95eeIjZQxyFUWGdAAdes23AdaIw9/a3cg
 oEVjB8t9Tj8Nf4TRX7LN9MZgpZ5hfg==
X-Authority-Analysis: v=2.4 cv=RIW+3oi+ c=1 sm=1 tr=0 ts=6900a1c9 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=SxZnsEcJDSkJ1Opw4BEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 5o6PShw3vkUCqqad4T1d0fXbJNm5M7Fa
X-Proofpoint-GUID: 5o6PShw3vkUCqqad4T1d0fXbJNm5M7Fa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280093


On 10/28/2025 3:10 PM, Krzysztof Kozlowski wrote:
> On 28/10/2025 10:35, Hrishabh Rajput via B4 Relay wrote:
>> +
>> +static int __init gunyah_wdt_init(void)
>> +{
>> +	struct arm_smccc_res res;
>> +	struct device_node *np;
>> +	int ret;
>> +
>> +	/* Check if we're running on a Qualcomm device */
>> +	np = of_find_compatible_node(NULL, NULL, "qcom,smem");
> I don't think you implemented my feedback. This again is executed on
> every platform, e.g. on Samsung, pointlessly.
>
> Implement previous feedback.

Do you want us to add platform device from another driver which is 
probed only on Qualcomm devices (like socinfo from previous discussion) 
and get rid of the module init function entirely? As keeping anything in 
the module init will get it executed on all platforms.


With this patch version, we have tried to reduce the code execution on 
non-Qualcomm devices (also tried the alternative as mentioned in the 
cover letter). Adding platform device from another driver as described 
above would eliminate it entirely, please let us know if you want us to 
do that.


Thanks,

Hrishabh


