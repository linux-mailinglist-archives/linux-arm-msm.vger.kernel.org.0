Return-Path: <linux-arm-msm+bounces-48602-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD41FA3D1F9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 08:18:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A5A7317D81A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 07:14:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D325E1E571A;
	Thu, 20 Feb 2025 07:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="D1RO4W3s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FAD1E493C;
	Thu, 20 Feb 2025 07:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740035636; cv=none; b=LcoEVIAp9LEJIwfPUAeEJT3xV99rqkY2LekjrNC9Nj47pgVOFFfo87L6CCyuH4mvsNzLeVsNcaXD19mlZTFmhJpZbwYZCOdiiob1zAb5zhqnU8mS9acMQDduhAmbJx/cdgD4lg8kC3H5lfj1zAY9MQgob7yHx5g95wSDZDpj5bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740035636; c=relaxed/simple;
	bh=VG8lNcVj90O83C+WiumWzQYNp1FPPB9IfLlFvTOM4SQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Q4ZVi+2YWeFTJOSMtgneCV66mB++LUQtXHaKpr9DHZkRiGeBRrZlwPUWUQlOeY3pq9UPw3kO5zjV0K7lwtmvS3aKsrMoY3sTCuV+dX1FUtmcWOhPOpToDIjFq36beuK4pFT7cmRb8rvgSZIQL9ijlYWVR85+A5pDYUfuE49/Pqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=D1RO4W3s; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51K6wSDQ001819;
	Thu, 20 Feb 2025 07:13:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M9HrpZLNFgYRVRtP+OG3QpgkuY9QtTGEtyY7OzY9/oc=; b=D1RO4W3ssnnE/pZF
	Pn0SebUocA33BRP8ei250YlzYYRmRpP4DA6KNQT0LH0E5+CQoIxkP3oRng/Dgqoi
	Qe7ZKrffME2GkqknsitUykvOVZZQIC4lywz7dw5AG9X60/zXeHltFxbqqmx1/MBm
	hkMkpbYIWNSWTvXHKE4j7E00Y9iI0IpH+ZYSYfhlOO7oT4tF22bXs5/AlIhaH7l4
	+b0lPO0woTsVmIojFxTrcWUpDT1s5Il1l0Hv0Jl6oautmZRAl+qcY4/f+k+KMB99
	VbawaNac9Jtv9KBkMc+oKPyI2oJ4ThI+sqFvWVYr8bP/7nmY6wN2WVxDMz3pZfYn
	Qy4mCA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy2d7t2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Feb 2025 07:13:51 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51K7DoIs025634
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Feb 2025 07:13:50 GMT
Received: from [10.217.216.47] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 19 Feb
 2025 23:13:45 -0800
Message-ID: <bf217f30-967c-4ffb-a3ee-f47e8ee97ad4@quicinc.com>
Date: Thu, 20 Feb 2025 12:43:42 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] clk: qcom: common: Attach clock power domains
 conditionally
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey
	<quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        "Taniya
 Das" <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250218-videocc-pll-multi-pd-voting-v1-0-cfe6289ea29b@quicinc.com>
 <20250218-videocc-pll-multi-pd-voting-v1-3-cfe6289ea29b@quicinc.com>
 <2c5rbbpe5muw53oemyq6vhsmhzpzcpn7on4ujl5v7i7s3fdlob@eh37gy5dpfnp>
 <bb4cd14e-a9ea-4c13-9774-cca169dcb8d1@quicinc.com>
 <fvcmc3ibqcwzokvqomntxn2vkgduvbdsx3gd5vkctzwrik7bis@iyjrejmqkpfp>
Content-Language: en-US
From: Jagadeesh Kona <quic_jkona@quicinc.com>
In-Reply-To: <fvcmc3ibqcwzokvqomntxn2vkgduvbdsx3gd5vkctzwrik7bis@iyjrejmqkpfp>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: xppRhYgnNNvcvo5MHr3vU94_Bi28S5qd
X-Proofpoint-GUID: xppRhYgnNNvcvo5MHr3vU94_Bi28S5qd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-20_02,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 mlxlogscore=717
 bulkscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502200050



On 2/19/2025 5:27 PM, Dmitry Baryshkov wrote:
> On Wed, Feb 19, 2025 at 05:06:11PM +0530, Jagadeesh Kona wrote:
>>
>>
>> On 2/18/2025 10:48 PM, Dmitry Baryshkov wrote:
>>> On Tue, Feb 18, 2025 at 07:56:48PM +0530, Jagadeesh Kona wrote:
>>>> Attach clock power domains in qcom_cc_really_probe() only
>>>> if the clock controller has not already attached to them.
>>>
>>> Squash this to the previous patch and call the new function. No need to
>>> duplicate the code.
>>>
>>
>> I tried calling the new function here instead of duplicating code, but that
>> is leading to below warning since the desc passed to qcom_cc_really_probe()
>> has a const qualifier and hence we cannot update desc->pd_list inside
>> qcom_cc_really_probe().
>>
>> drivers/clk/qcom/common.c:305:33:   WARNING : passing argument 2 of ‘qcom_cc_attach_pds’ discards ‘const’ qualifier from pointer target type [-Wdiscarded-qualifiers]
> 
> It sounds like this can be fixed with a one-line patch.
> 

Removing const qualifier to qcom_cc_really_probe() will fix this, but that requires changes in
many other drivers which are currently passing const descriptor to it.

But I can squash this to my previous patch by updating my qcom_cc_attach_pds() function
prototype as below and then calling that new function here

-int qcom_cc_attach_pds(struct device *dev, struct qcom_cc_desc *desc)
+int qcom_cc_attach_pds(struct device *dev, struct dev_pm_domain_list *pd_list)

-               ret = devm_pm_domain_attach_list(dev, NULL, &cc->pd_list);
-               if (ret < 0 && ret != -EEXIST)
+               ret = qcom_cc_attach_pds(dev, cc->pd_list);
+               if (ret)

Thanks,
Jagadeesh

>>
>> Thanks,
>> Jagadeesh
>>
>>>>
>>>> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
>>>> ---
>>>>  drivers/clk/qcom/common.c | 9 ++++++---
>>>>  1 file changed, 6 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
>>>> index ec27f70b24bdec24edd2f6b3df0d766fc1cdcbf0..eb7e2a56d1d135f839fd9bd470ba6231ce775a8c 100644
>>>> --- a/drivers/clk/qcom/common.c
>>>> +++ b/drivers/clk/qcom/common.c
>>>> @@ -300,9 +300,12 @@ int qcom_cc_really_probe(struct device *dev,
>>>>  	if (!cc)
>>>>  		return -ENOMEM;
>>>>  
>>>> -	ret = devm_pm_domain_attach_list(dev, NULL, &cc->pd_list);
>>>> -	if (ret < 0 && ret != -EEXIST)
>>>> -		return ret;
>>>> +	cc->pd_list = desc->pd_list;
>>>> +	if (!cc->pd_list) {
>>>> +		ret = devm_pm_domain_attach_list(dev, NULL, &cc->pd_list);
>>>> +		if (ret < 0 && ret != -EEXIST)
>>>> +			return ret;
>>>> +	}
>>>>  
>>>>  	reset = &cc->reset;
>>>>  	reset->rcdev.of_node = dev->of_node;
>>>>
>>>> -- 
>>>> 2.34.1
>>>>
>>>
> 

