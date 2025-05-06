Return-Path: <linux-arm-msm+bounces-56927-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD80AAC1E6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 13:02:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8752C3B012B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 11:01:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 293CC279331;
	Tue,  6 May 2025 11:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CHlNVFCt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84AF1277021
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 May 2025 11:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746529305; cv=none; b=lh1fUqqpF4GrI8alFuk30GeFVyKPGxo+PTanZ5Fmdr8tjfpiQut7BkDA/rnaDR//Yg02tbfR2pEVEoXX8oYC58ro+lioKrb3wJMlrNM6bIqLBu9aCdkIt04pHkpSHjei7cyRqPnZ/gEYExhkMJ+BHMJbbtmplL+36b5Max7wW3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746529305; c=relaxed/simple;
	bh=PWlHvaLkhP5+f90ag8a7QEwiDzn90AR2tA+8AynAPYk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ctK//nd9SsRsCkZSGW5hDPGxIq+Vk0x9+nWmWIxgHHMZNaHMSL+Yxisx5KyeVwpr7or0P9PInc4w2F9uAHA4YGqiC25N6PU6+/304RXkWxs8BaBYoX0vZ8Pd1/KXqoN50ncGX7B9yCsVYX4fd/ao4yQP8xOSCArFwJxcVhxm+5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CHlNVFCt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54689M70016421
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 May 2025 11:01:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XPlGScL2K0GhtQO2Jsx+T3g5O9rnsybDR05h9CmsTv8=; b=CHlNVFCtrULDQeoZ
	pvYl7XsI0x6+at4eNz+WLW4oUkZXYc7kE5j8V//CSYXSjMqmdb489uAHIBbnn3NY
	WqfXEjQJaoBrsX7evJ/1lh8uHjE4uKrOFeasBBRL/22rEj+qTANNtnE8LATJK6Tk
	uqj7Iwd0ToW39Ze29MBLZ7U1YRJ2UduVqKGUGm80f5zNJYXa8Tz4n6PQfT+m8+qe
	LqT2Xt7FNhyhyOnMOWD2XkWScR+XNcpiplBPugkHr5wfNrG46FdA260imQpmEpzc
	nZTFZ5dJmaw5SLjCWgAMnCkZy7rF6VmZ4gbAgG93sHIPts46TRmwsMmmc1VmHSRI
	Hy8s9A==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46e0xswuav-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 May 2025 11:01:41 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-739525d4d7bso3626589b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 May 2025 04:01:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746529300; x=1747134100;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XPlGScL2K0GhtQO2Jsx+T3g5O9rnsybDR05h9CmsTv8=;
        b=b9YhLTDPGFPupkyuwMN+Goo7L/qbqrY5ex2KFcWgzHXfZ5yN8mdnHSogkUctO8+hv2
         ZMxSGZh5gUcYZiAA0FEbRIaxWnndaI/oUYRBHF5g44vX8Sx/9WvZx2zcEZWl/GAoXhP7
         LUyPnLeHrTNKEzr2Kw8NJgQqQQzV5dw7VTHERHBZQko/wNUXJ0+3/xZTPRXHJObmkWlY
         7S0zXJofaDxnBGmF6oV+zJaJNyZExGdS2crmT+7N8oBR2Mlz8DRTiJ7zD+Uu+edKUK7v
         QtQ+3VdfWrTZHUk7Pf6bILsyRHtWu0QeXYpPrArrmhd5E91ynPSQwWmVR0JxLu/Gt/ij
         GMMw==
X-Gm-Message-State: AOJu0Yyby7hDgHRJmfMiYzqLEo6yhtjxjHlU7G5yrm5XaFnCgbae8hhh
	WDO8seC+iGOIKVrjj5XIic9DnWg9fSvdqXrzByB+def6JjO5uM8Gz0JvtSOaRq6Uy5oYCvPEaq+
	DPMoxoH7yYBwYosU0ZnX4IR8NBzhelgNtw4Px7JOLI1tk7ybsKkxdvuDzr+Eiha3Y
X-Gm-Gg: ASbGncuE4PacmI1EZvDINnGQe5OaNTI/xMInYWNHE64S6CaZ33znf12SAWtvXO46jz4
	9IhklxaTmT08hB4o75kgUaiiNkmMbtEBWE/NGMdv2lIuYD7DmzgEFp0WxmsYGtpapXlefXqBy8P
	EqsAafX1eKbyfPvOAPBvFT52l485AGAVW8WWXV1QEPPLVMLy6R9P4QqozvNoJKyA1x2rB9Nxh1K
	5DWRAPbrtOcu+TKmoJEbZOAAhTnN64k5xsT78Y4VgvvfQLNr0s9NY1e9UJiQhfuw0KZ8bejaJ93
	Rf4svSLj8pgM/lJ/HGOKxgnC9sJ1Pj71Vy1e+biYtleBWDzHnZLe
X-Received: by 2002:a05:6a00:35c9:b0:736:9f20:a175 with SMTP id d2e1a72fcca58-7406f089f3fmr13259729b3a.2.1746529299876;
        Tue, 06 May 2025 04:01:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYvf5EOj9tN8ah4mjYU0f/1q9qe3RBcD/dExIRKVlIb2Q6kIGMD9BKmcQB9z12H2X9ZRBhhA==
X-Received: by 2002:a05:6a00:35c9:b0:736:9f20:a175 with SMTP id d2e1a72fcca58-7406f089f3fmr13259694b3a.2.1746529299466;
        Tue, 06 May 2025 04:01:39 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7405909c491sm8577001b3a.159.2025.05.06.04.01.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 04:01:38 -0700 (PDT)
Message-ID: <8c2a53c2-c11b-4d49-bfb5-b948767ba6c7@oss.qualcomm.com>
Date: Tue, 6 May 2025 16:31:33 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] watchdog: qcom: add support to read the restart
 reason from IMEM
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>, bod.linux@nxsw.ie,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20250502-wdt_reset_reason-v3-0-b2dc7ace38ca@oss.qualcomm.com>
 <20250502-wdt_reset_reason-v3-4-b2dc7ace38ca@oss.qualcomm.com>
 <2036ef2f-c7ef-4f42-858d-8d95c430c21a@oss.qualcomm.com>
 <68d280db-f7df-48c8-821d-f7d408c302ad@oss.qualcomm.com>
 <8a763c70-adcf-4a14-bb68-72ddc61fa045@oss.qualcomm.com>
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <8a763c70-adcf-4a14-bb68-72ddc61fa045@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 8HZMbR8HIuk7t06Wo8_AaaO3kV8jiDTd
X-Proofpoint-ORIG-GUID: 8HZMbR8HIuk7t06Wo8_AaaO3kV8jiDTd
X-Authority-Analysis: v=2.4 cv=bdprUPPB c=1 sm=1 tr=0 ts=6819ec15 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=rRT3dCuw-ihC3ouNC9MA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDEwNSBTYWx0ZWRfX0fQWaY2d2y8a
 I2nawv0YzqT7NDNQ/WJHtIxufkKMqRdVBBiqnuQTNRgksINiRTm307SQwZAJCr0UQdseT/j4Z+e
 3xITtib6IonBIoVvfVI6uiuu8PaE6+SwCORC3Xt1x3Zwu43NhkSpjNyG3GvX/LtT8FH4iq1e97+
 2XGQfLUwAyrSTMtqhSuFdhjOEcmJnyZIaGmgz0sSoq9n2hmkXBFwmj3xLd6OF6+FVqC65r9/G7l
 WDr//QLFviqicjO/edHKdquxvtVzJadJwfVkbNimWELg+Krr5fyFRhrpLm5vEbDiT/K45x/1Uby
 7+KG/tUW4GbEET5C8/qXz2+amGSzrW4v17wFIKX5LAnCYu8O7eGzFI481DbpZ4RxzNEELec0qXN
 u+h3yix5OG46i6ovP06EWTgJKjmVF5jYstRTcHcj9KRccK/gJVB1i4mBxVaQa9mbyxmIJnZe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_05,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 phishscore=0 adultscore=0 spamscore=0 impostorscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505060105


On 5/3/2025 3:53 AM, Konrad Dybcio wrote:
> On 5/2/25 6:28 PM, Kathiravan Thirumoorthy wrote:
>> On 5/2/2025 7:33 PM, Konrad Dybcio wrote:
>>>> +static int  qcom_wdt_get_restart_reason(struct qcom_wdt *wdt,
>>>> +                    const struct qcom_wdt_match_data *data)
>>>> +{
>>>> +    struct regmap *imem;
>>>> +    unsigned int val;
>>>> +    int ret;
>>>> +
>>>> +    imem = syscon_regmap_lookup_by_compatible(data->imem_compatible);
>>> Try syscon_regmap_lookup_by_phandle_args() and pass a phandle, see e.g.
>>> drivers/phy/qualcomm/phy-qcom-qmp-pcie.c & phy@1bfc000 in x1e80100.dtsi
>>>
>>> That way all platform specifics will live in the DT, requiring no
>>> hardcode-y driver changes on similar platforms
>>
>> Thanks. I thought about this API but it didn't strike that I can use the args to fetch and match the value.
>>
>> I need a suggestion here. There is a plan to extend this feature to other IPQ targets and also support WDIOF_POWERUNDER and WDIOF_OVERHEAT cause as well. For IPQ5424, all 3 cause will support and for other IPQ platforms, we are exploring how to integrate WDIOF_OVERHEAT. In any case, can I define the DT entry like below
>>
>>          imem,phandle = <&imem 0x7b0 <Non secure WDT value> <Power Under value> <Overheat value>>;
>>
>> and store these in values args[1], args[2] and args[3] respectively and use it for manipulation? If any of the platform doesn't support all 3, I can update the bindings and define the number of args as required.
> Let's call the property qcom,restart-reason and only pass the register value
>
> Because we may have any number of crazy combinations of various restart
> reasons, we can go two paths:
>
> 1. promise really really really hard we won't be too crazy with the number
>     of possible values and put them in the driver
> 2. go all out on DT properties (such as `bootstatus-overheat`,
> `bootstatus-fanfault` etc.


Thanks Konrad for the suggestions and the offline discussions.

@Guenter, I need a suggestion here. Currently as part of this series, we 
are planning to expose WDIOF_CARDRESET, WDIOF_POWERUNDER, WDIOF_OVERHEAT 
reasons.

Once this is done, we do have the custom reason codes like Kernel Panic, 
Secure Watchdog Bite, Bus error timeout, Bus error access and few many. 
Is it okay to expose these values also via the bootstatus sysFS by 
extending the current list of reasons? Since these are outside the scope 
of watchdog, need your thoughts on this.


>
> I'd much prefer to go with 1 really.. If we used nvmem, we could have a map
> of cell names to restart reasons, but we've already established IMEM is
> volatile and we shouldn't mess up the convention just because that
> subsystem has nicer APIs..
>
> Unless we rename the subsystem to `fuses`, `magic-values` or something..
> +Srini? :P
>
> Konrad

