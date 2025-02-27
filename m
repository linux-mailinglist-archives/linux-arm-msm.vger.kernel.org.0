Return-Path: <linux-arm-msm+bounces-49612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C25DDA4746D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 05:27:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A1D83AAA9C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 04:26:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF3E11E8359;
	Thu, 27 Feb 2025 04:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Z9l9y78Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414481D935C;
	Thu, 27 Feb 2025 04:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740630408; cv=none; b=X0yBZaTHbtRSpxlkoauIGsIRjBi5IceVmzXqRL64lynmVvIj8arQGWDt0rXxFvRuvyAYX9U8u2mLg6vPgZT+c3hgKHuQYQCrUiycxB1pVBAuxhHaSQH4sslqiqoCkKmTf/SQrf4lL1MgdqpITzxYnLLhm/1Klh5sysP1GKFkIdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740630408; c=relaxed/simple;
	bh=3RWyJJzzq6v1nd9iBnaxQ/p73P3rqYIJGHwpi5gSqEE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=pyNPDsKSczu4462qJpohpzBWz2cT/HxBW31PblFbPFPA30twSazhM56kddVbtHltKkVjh1LzIEkpCR/oTQes7OYzy/cvL8IlVb6OHJnFMSB2o7XxFGIqCjN7KPlzU4a4H7IF8Sv5pZpvD7TV01FXmrBn8uMHS3EnzbMnUcL3g9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Z9l9y78Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51QLn0a5017726;
	Thu, 27 Feb 2025 04:26:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U/T8a1Fx3ITU8GIQbqj0sTjwmK+KBWadvoZrZuc6APo=; b=Z9l9y78QXQinHBeP
	oMyo05Bjq/gkpI0ok5dbrVRvn1ro2PXAN62lN9eAVnj4WlGkcox7vnJL8MuKfXTX
	vzmnGw+aP6YcXBvM7rmkfx5nncGjrP/pym27PjFDENCvwSzNZbbL3DNfBmz9ccOX
	txXg/u8/UYo3XO1GjUQ/NQqoT1uEVqCCLGjvnwgBqcmjqyfpd3mkMGlN9izhN8Oo
	T04VmCayX6KHJ8iuHqNTfzQ7dUsFWQIAw/NU34fmyCdwGFrJWHj7ctL0dWIfxg4F
	JTJ5A9GSHOWLF4wX46sTpBtFK1tBjazK9xQ/log8F7dVNN9L2jWPkH3Kwr6Fu4GR
	ri3yGg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prn48sv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Feb 2025 04:26:35 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51R4QYN2017891
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Feb 2025 04:26:34 GMT
Received: from [10.217.216.53] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 26 Feb
 2025 20:26:30 -0800
Message-ID: <0ab2552a-3b8d-4b4f-8f9e-8b0c4f5bf6ea@quicinc.com>
Date: Thu, 27 Feb 2025 09:56:27 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcm6490-idp: Update protected clocks
 list
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ajit Pandey
	<quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        "Jagadeesh Kona" <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250206-protected_clock_qcm6490-v1-1-5923e8c47ab5@quicinc.com>
 <j43f4wu6wgoho2tl4crckemnngyvek5mma6ghkdyqcivk65dcf@gfsimovfuqy5>
 <72cc2c52-1d0d-4a60-93da-14acd5947f1f@quicinc.com>
 <o53nnmt5ypuoms3b37lehtmpwloudusr7647alehvnwsiltsyo@grd6ua7mh4o2>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <o53nnmt5ypuoms3b37lehtmpwloudusr7647alehvnwsiltsyo@grd6ua7mh4o2>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: KIaSJOpMTn0nsZEDGeM9B3cYTXz2l3Gu
X-Proofpoint-GUID: KIaSJOpMTn0nsZEDGeM9B3cYTXz2l3Gu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_02,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 clxscore=1015 mlxscore=0 adultscore=0 mlxlogscore=572
 suspectscore=0 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502270031



On 2/27/2025 9:50 AM, Dmitry Baryshkov wrote:
> On Thu, Feb 27, 2025 at 09:42:39AM +0530, Taniya Das wrote:
>>
>>
>> On 2/26/2025 10:12 AM, Bjorn Andersson wrote:
>>> On Thu, Feb 06, 2025 at 03:43:21PM +0530, Taniya Das wrote:
>>>> Certain clocks are not accessible on QCM6490-IDP board,
>>>> thus mark them as protected.
>>>>
>>>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>>>> ---
>>>> Mark few clocks as protected on IDP of QCM6490.
>>>>
>>>> This patchset is separated out from the series[1] to remove dependency from
>>>> the LPASS reset.
>>>> [1]: https://lore.kernel.org/all/20240816-qcm6490-lpass-reset-v1-0-a11f33cad3c5@quicinc.com/
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 21 +++++++++++++++++++++
>>>
>>> I merged the patch adding this board in November 2023, are you saying
>>> that for the last 15 months no one has actually booted it!?
>>>
>>
>> I am not sure, I had got request to help boot the board which was not
>> due to these clocks.
> 
> So, was the original submission in November 2023 broken or was it broken
> by a later firmware upgrade which started to protect those clocks?
> 
That's a fair question, probably the later broke it.

