Return-Path: <linux-arm-msm+bounces-48875-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4AEA3F337
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 12:43:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 234B819C217C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 11:43:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADEAD209669;
	Fri, 21 Feb 2025 11:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AG5FXi9L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77F51F4E3B;
	Fri, 21 Feb 2025 11:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740138193; cv=none; b=DUfA85TWU1rBUZzxeTgzpvSLXhfWeClGu4pB9iRxS0M+1wfhT8IpsdA4o1ebC23koXcV4YSu9Hisfq+nh6mStI+eTpZLCKkYQ6E+B/Rfiy8OWLYq6VNsYXfQ7GSMXSXEj6bPu98dkqa9sJuhgi345+tN4acu7qhx+zBHYH4cLs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740138193; c=relaxed/simple;
	bh=3hH0roRCcLz4sS5DMVPEnjWhxH3Sjt1/xxmZLnBbHm4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=E5rrFMQUo4b1uBKX6nqHQQk8T/7C/DDYDDtiF0cOOSFx9e1F1z3BFF4lFuvOSGdzP5N2Yd7VqsuzxoPyp7qjrojn+TK6snijjpz0qHR8v4agYETcUftzxfFHJ8gjCG74maS/4cDavLEigZuEEFnt5ZIL3rhU0ydJCVe6euKQot0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AG5FXi9L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51L5VDLM012173;
	Fri, 21 Feb 2025 11:43:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZwcPHelaXI8L8nejP7UHjJnno81zL6w+b4NxNFzbR6U=; b=AG5FXi9LtspVBLQB
	9fgQPlaCQ1VF1Hg6LMHvZfSSrq+anLpyFQiKmJENn6daVi89/2uBMKgIAHcfKgNU
	KyFmlerBbCEmtJ9Y90NyFd841UxTQIZVgHkOR1I8zqcbelHPL3EICPvoRR/OBWdd
	scVbC70Q8IqlCCEJ3usuEs9WtD53fZfk5PBLqRvrIQ9oyeY/A7/el8Sd+iVwx4+S
	dyUR5HLhssbbaEC1XLSYaA46osoURInA6g2j8ByNE6EVpqTwLnvkGIFO+rtwGSDt
	JazCHiDJI5Qk2oH2KJSj1t0EzJkYR5Z1IZuVdSsrWf2AsZoh40zPwn4osDZNKlDq
	ATBQ/Q==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy1svug-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 11:43:07 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51LBh61R006226
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 11:43:06 GMT
Received: from [10.217.216.47] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 21 Feb
 2025 03:43:01 -0800
Message-ID: <10fc47a3-a58d-4ee8-8f88-fea7d69f38d1@quicinc.com>
Date: Fri, 21 Feb 2025 17:12:58 +0530
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
 <bf217f30-967c-4ffb-a3ee-f47e8ee97ad4@quicinc.com>
 <bap2qy5cqhdzphc7qeoqztp65g6jsmwpxkghpgagxpj4qdifts@ogj7nb34rv6f>
Content-Language: en-US
From: Jagadeesh Kona <quic_jkona@quicinc.com>
In-Reply-To: <bap2qy5cqhdzphc7qeoqztp65g6jsmwpxkghpgagxpj4qdifts@ogj7nb34rv6f>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 3CLcKd6wPvGQLb905-WlPTG7XTK-IayK
X-Proofpoint-ORIG-GUID: 3CLcKd6wPvGQLb905-WlPTG7XTK-IayK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-21_03,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 adultscore=0 malwarescore=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=979 suspectscore=0 phishscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502210086



On 2/20/2025 4:18 PM, Dmitry Baryshkov wrote:
> On Thu, Feb 20, 2025 at 12:43:42PM +0530, Jagadeesh Kona wrote:
>>
>>
>> On 2/19/2025 5:27 PM, Dmitry Baryshkov wrote:
>>> On Wed, Feb 19, 2025 at 05:06:11PM +0530, Jagadeesh Kona wrote:
>>>>
>>>>
>>>> On 2/18/2025 10:48 PM, Dmitry Baryshkov wrote:
>>>>> On Tue, Feb 18, 2025 at 07:56:48PM +0530, Jagadeesh Kona wrote:
>>>>>> Attach clock power domains in qcom_cc_really_probe() only
>>>>>> if the clock controller has not already attached to them.
>>>>>
>>>>> Squash this to the previous patch and call the new function. No need to
>>>>> duplicate the code.
>>>>>
>>>>
>>>> I tried calling the new function here instead of duplicating code, but that
>>>> is leading to below warning since the desc passed to qcom_cc_really_probe()
>>>> has a const qualifier and hence we cannot update desc->pd_list inside
>>>> qcom_cc_really_probe().
>>>>
>>>> drivers/clk/qcom/common.c:305:33:   WARNING : passing argument 2 of ‘qcom_cc_attach_pds’ discards ‘const’ qualifier from pointer target type [-Wdiscarded-qualifiers]
>>>
>>> It sounds like this can be fixed with a one-line patch.
>>>
>>
>> Removing const qualifier to qcom_cc_really_probe() will fix this, but that requires changes in
>> many other drivers which are currently passing const descriptor to it.
> 
> And this points out that the pd_list should not be a part of the
> struct qcom_cc_desc. You are not using it in the code, so allocate that
> memory on the fly, pass it to devm_pm_domain_attach_list() and then
> forget about it.
> 

Above suggestion looks good, but we need to store the pd_list to pass it to GDSC driver to attach
the power domains as GDSC parent domains. Instead, we can add a new API wrapper for attaching PDs
and to map the regmap(qcom_cc_attach_pds_map) and all clock drivers that need multiple power domains
support can update to use below new API and all new clock drivers can just use the new API.

The implementation would be something like below

--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
+struct regmap *qcom_cc_attach_pds_map(struct platform_device *pdev, struct qcom_cc_desc *desc)
+{
+       int ret;
+
+       ret = devm_pm_domain_attach_list(&pdev->dev, NULL, &desc->pd_list);
+       if (ret < 0 && ret != -EEXIST)
+               return ERR_PTR(ret);
+
+       return qcom_cc_map(pdev, desc);
+}
+EXPORT_SYMBOL_GPL(qcom_cc_attach_pds_map);
+


--- a/drivers/clk/qcom/videocc-sm8550.c
+++ b/drivers/clk/qcom/videocc-sm8550.c
@@ -542,6 +542,12 @@ static int video_cc_sm8550_probe(struct platform_device *pdev)
        int ret;
        u32 sleep_clk_offset = 0x8140;

+       regmap = qcom_cc_attach_pds_map(pdev, &video_cc_sm8550_desc);
+       if (IS_ERR(regmap)) {
+               pm_runtime_put(&pdev->dev);
+               return PTR_ERR(regmap);
+       }
+
        ret = devm_pm_runtime_enable(&pdev->dev);
        if (ret)
                return ret;
@@ -550,12 +556,6 @@ static int video_cc_sm8550_probe(struct platform_device *pdev)
        if (ret)
                return ret;

-       regmap = qcom_cc_map(pdev, &video_cc_sm8550_desc);
-       if (IS_ERR(regmap)) {
-               pm_runtime_put(&pdev->dev);
-               return PTR_ERR(regmap);
-       }
-

This way also, we are aligning more towards common code and the code will be uniform across all
clock drivers and this doesn't require separate callback in each individual clock driver.

Thanks,
Jagadeesh 

>>
>> But I can squash this to my previous patch by updating my qcom_cc_attach_pds() function
>> prototype as below and then calling that new function here
>>
>> -int qcom_cc_attach_pds(struct device *dev, struct qcom_cc_desc *desc)
>> +int qcom_cc_attach_pds(struct device *dev, struct dev_pm_domain_list *pd_list)
>>
>> -               ret = devm_pm_domain_attach_list(dev, NULL, &cc->pd_list);
>> -               if (ret < 0 && ret != -EEXIST)
>> +               ret = qcom_cc_attach_pds(dev, cc->pd_list);
>> +               if (ret)
>>
>> Thanks,
>> Jagadeesh
>>
>>>>
>>>> Thanks,
>>>> Jagadeesh
>>>>
>>>>>>
>>>>>> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
>>>>>> ---
>>>>>>  drivers/clk/qcom/common.c | 9 ++++++---
>>>>>>  1 file changed, 6 insertions(+), 3 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
>>>>>> index ec27f70b24bdec24edd2f6b3df0d766fc1cdcbf0..eb7e2a56d1d135f839fd9bd470ba6231ce775a8c 100644
>>>>>> --- a/drivers/clk/qcom/common.c
>>>>>> +++ b/drivers/clk/qcom/common.c
>>>>>> @@ -300,9 +300,12 @@ int qcom_cc_really_probe(struct device *dev,
>>>>>>  	if (!cc)
>>>>>>  		return -ENOMEM;
>>>>>>  
>>>>>> -	ret = devm_pm_domain_attach_list(dev, NULL, &cc->pd_list);
>>>>>> -	if (ret < 0 && ret != -EEXIST)
>>>>>> -		return ret;
>>>>>> +	cc->pd_list = desc->pd_list;
>>>>>> +	if (!cc->pd_list) {
>>>>>> +		ret = devm_pm_domain_attach_list(dev, NULL, &cc->pd_list);
>>>>>> +		if (ret < 0 && ret != -EEXIST)
>>>>>> +			return ret;
>>>>>> +	}
>>>>>>  
>>>>>>  	reset = &cc->reset;
>>>>>>  	reset->rcdev.of_node = dev->of_node;
>>>>>>
>>>>>> -- 
>>>>>> 2.34.1
>>>>>>
>>>>>
>>>
> 

