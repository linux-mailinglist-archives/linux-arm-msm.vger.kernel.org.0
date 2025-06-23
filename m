Return-Path: <linux-arm-msm+bounces-62066-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A952CAE4057
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 14:32:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8DC241883FC6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 12:31:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8FDD2459D2;
	Mon, 23 Jun 2025 12:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eyrH0Bjl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5395423E23C
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 12:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750681882; cv=none; b=HBweXiQAsmt2ej2hhK2VouhdxDyIaWkDyIqPhfACaRuLVs19El5OxwqxMVV1ZB7JCEGGWfNsyz0bNU5FUcn38E4Zc9FlNJ8ogV6mxEkk0nnyBZtJouZxrJhDhhyZaUi7VLX2Twh2FwI9Y1j01tNnZibjDAcM1mOssgSQs5+0GhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750681882; c=relaxed/simple;
	bh=2zFRKZQk6Qcx7V0TRS6RA0Y4R3e2uFWEfPn5Z1JUZPY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E9QT6mBvrdNi8d/RA91cvIdfirCZcpCSDYN5LJH850cSl9cjFAa4jAaW8jjdIEQZkVseCTCkauS5gGEW2bn61Q5W5XVYYyl2KG9DUxpPyQQ3AAOXk4cOOiwb5N6HOeFLrHmcH85Q8HW79J9lqBTiVbDwNeMtt4LySjGbLhFU4W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eyrH0Bjl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N93Ag5015471
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 12:31:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E6864q4XX7Y1lJBXPh3P8WERZFM3Mm8/80MbfQ9oBQg=; b=eyrH0BjllGGw+pTX
	IwjyydI/FasyKcbyFAyphISewm08UJdHWnCeutuTtHfe2hFJSCCzqbmDKjWsEK3C
	lc+9wAgN6tMP1oEia6Zxma8aZzJf482/xdsp0Rs9VZEH26hh5Fo6Bt4xOXp6nmPV
	HWeuO2+M9H4/juE/wz3+nTPGdBGsxvBIJYXuJcBcXoqmEke3ofiBpUn50A8RyaKn
	CkTHAgPST7KAg4eMort3gfWDFZMkhPhQ+LBBwCAMy7ocVcU59L3P7OTaXWrgknEh
	DqP0RgCcIVMFqzSNid8/lQ2dkRdF3tWPS3E8ZiuZTkrp+cgzVKOSgMbgfrG7BWgi
	L+B4+Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3xu0k21-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 12:31:20 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d09b74dc4bso111377885a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 05:31:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750681879; x=1751286679;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E6864q4XX7Y1lJBXPh3P8WERZFM3Mm8/80MbfQ9oBQg=;
        b=pEZeHq8yEEHkOdEair4S+FNUiCm2v369vDmYl/9b1GgDdUZlXNg6HIQEkGKRDdMhjb
         0XnrLxO6EOHn0e9TJy1nzTPvn8OMrQjSBFWbYPbO4RZtV9rB3QABmkrDMpr2myNY+nAn
         S+9ggba8sU+fg0I7aIiHhUHt7RJBksuuuelureHWu5mAFkWLxkrAnjMWml6c4TvEZKki
         LPZfdDLLLoZ2FlfVSLivFazsvMnS/+jJbZbLS1J4oOvVxyB2T2USvwnaEZiapmqXy3Ja
         gcSeoyz7gEYHSTy0sIKTYpolnCvOI+7au7F/NT7OwWfbCWKJbV2rJgU/olor6YdzQ8F9
         +47g==
X-Forwarded-Encrypted: i=1; AJvYcCXuiyhwnQMyJ9/lHZ9J+mDnosgtUb2cfZdjqB9l3kHb5lpm+04jJjHDSRO6F7pWFwl6Ike5pTM2NK7d//jg@vger.kernel.org
X-Gm-Message-State: AOJu0YynHQi+cfcnEopQiC7jgzOqd+enZ82y6VAYHuRt8DtpUAPMqjRr
	EMpv4/iAJ/MWVxqgMU2N62Iu3BNKqbbhWU6GQwHiWCbQagQAdWHMYCofvFa4Dll+wJfQvEdHN2g
	qddnq1xGtqLSAPa1jnlBY2tp6l84xRlZr3sFsJnQzOcnvz7lkXngKg4Oipg1rxVQXIsyXgmW99+
	Sj
X-Gm-Gg: ASbGncsik96PPGr8gBhloemYQuQsMLq55ReYHEob2gzxe+bXtdyPU4MHHLMmOi0C06l
	i9o06C7NJdYp3XHs3kSr8MHvwDbaIwE/h0UBs0zHiX6C9mXTlkk1qtr9CefdNVJa+RmvPrJ5TPl
	AP+kb26HylyPG7Ia/3Q4StGlLJzCSC65UGnNw75MK6H6zj8Ez/gRduWyI0Xjyj1dnqz2EycbBME
	WhrtgV/ip+JxqRY61XOKSuqjYGkltAWH5Wmj2WXzxit4F3toVmDlFZrySeyOOw3OPXeGJ1fFnLk
	RhNuVAidyQWom6JJIM9Q5VFWalKQ8LO7KRjRr5lPSAOhEbtSzn/ERvm92rOJZCjas4oFrOOsMjW
	PD3Q=
X-Received: by 2002:a05:620a:4547:b0:7ca:d396:1460 with SMTP id af79cd13be357-7d3f9946b37mr700482585a.14.1750681878934;
        Mon, 23 Jun 2025 05:31:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSojH4qUqF5DcRgr/YMoel0AnNXPXaqZPjr++zZf5nj/R/1BTdf8HbieLdvXtY32sDyj5h6w==
X-Received: by 2002:a05:620a:4547:b0:7ca:d396:1460 with SMTP id af79cd13be357-7d3f9946b37mr700477085a.14.1750681877944;
        Mon, 23 Jun 2025 05:31:17 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae053ecbda9sm698877366b.48.2025.06.23.05.31.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 05:31:17 -0700 (PDT)
Message-ID: <fd73a142-3b22-407f-8e6d-00f4e1e1c8eb@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 14:31:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 2/4] dt-bindings: mmc: controller: Add
 max-sd-hs-frequency property
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sarthak Garg <quic_sartgarg@quicinc.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_cang@quicinc.com, quic_nguyenb@quicinc.com,
        quic_rampraka@quicinc.com, quic_pragalla@quicinc.com,
        quic_sayalil@quicinc.com, quic_nitirawa@quicinc.com,
        quic_bhaskarv@quicinc.com, kernel@oss.qualcomm.com
References: <20250618072818.1667097-1-quic_sartgarg@quicinc.com>
 <20250618072818.1667097-3-quic_sartgarg@quicinc.com>
 <6040afd9-a2a8-49f0-85e9-95257b938156@kernel.org>
 <9627ed6f-2bb8-40b0-b647-5f659d87f2f9@oss.qualcomm.com>
 <bba062a3-f96c-456b-8e9e-fdeb0dc2d28d@kernel.org>
 <5bdae07b-a7b1-49be-b843-1704981bc63b@oss.qualcomm.com>
 <ffc62906-c3bb-4968-8f7c-fa7ae5028ad5@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ffc62906-c3bb-4968-8f7c-fa7ae5028ad5@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA3NSBTYWx0ZWRfX6OcaVLXZvrAr
 lUIUEpz7/iV4sLt6CSCujW/1znhk+tlr6YIUzpPoRKvosLh9oE0FWSROU0HJ2ZQcC7VNebG4wJM
 dUzr0g+KCiB0OZdaX8rcqwsQpP8sJDipM/OJKcAD4CC1t8OHmbw62vz6WyG3im8K6x5BFm9uXDX
 ++m75gFUASzn7cXodV8MpMRKRPoHRrJDv7ZIH27GfJTb3VrC218b/73Nmq58fWkLsZNNXsbLDS1
 qXvqrof1kKCcL58Sp9E3cbvvqSKRDNTD/cDp7ctbBKUvM2v9U/QDBihDk/2WcP8szqiTNY19sIJ
 b90Clb4M5PpXlN0isU3ERXD4m/s2u38upHaybdAPgGIs7IR5XkePcjL9F51XKHLstUDiH7n78xF
 43DlKHUYXw/QhvoCLEzYvVKuXnTjKZ1bDP2CVQLXMhgBsNJBMhMLUTINjlbUt9Xh67uV1ii7
X-Authority-Analysis: v=2.4 cv=SvuQ6OO0 c=1 sm=1 tr=0 ts=68594918 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=jqoZUo8hMgpNG5C4G1UA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: cCfeIW2YbRd-_A6Dl19JAHrA3JmlmhdB
X-Proofpoint-GUID: cCfeIW2YbRd-_A6Dl19JAHrA3JmlmhdB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_03,2025-06-23_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 adultscore=0 malwarescore=0
 mlxlogscore=999 bulkscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506230075

On 6/23/25 2:16 PM, Krzysztof Kozlowski wrote:
> On 23/06/2025 14:08, Konrad Dybcio wrote:
>>>>>
>>>>> This might be fine, but your DTS suggests clearly this is SoC compatible
>>>>> deducible, which I already said at v1.
>>>>
>>>> I don't understand why you're rejecting a common solution to a problem
>>>> that surely exists outside this one specific chip from one specific
>>>> vendor, which may be caused by a multitude of design choices, including
>>>> erratic board (not SoC) electrical design
>>>
>>> No one brought any arguments so far that common solution is needed. The
>>> only argument provided - sm8550 - is showing this is soc design.
>>>
>>> I don't reject common solution. I provided review at v1 to which no one
>>> responded, no one argued, no one provided other arguments.
>>
>> Okay, so the specific problem that causes this observable limitation
>> exists on SM8550 and at least one more platform which is not upstream
>> today. It can be caused by various electrical issues, in our specific
>> case by something internal to the SoC (but external factors may apply
>> too)
>>
>> Looking at the docs, a number of platforms have various limitations
>> with regards to frequency at specific speed-modes, some of which seem
>> to be handled implicitly by rounding in the clock framework's
>> round/set_rate().
>>
>> I can very easily imagine there are either boards or platforms in the
>> wild, where the speed must be limited for various reasons, maybe some
>> of them currently don't advertise it (like sm8550 on next/master) to
>> hide that
> 
> But there are no such now. The only argument (fact) provided in this
> patchset is: this is issue specific to SM8550 SoC, not the board. See
> last patch. Therefore this is compatible-deducible and this makes
> property without any upstream user.

When one appears, we will have to carry code to repeat what the property
does, based on a specific compatible.. And all OS implementations will
have to do the same, instead of parsing the explicit information

Konrad

