Return-Path: <linux-arm-msm+bounces-48317-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CC8A3928B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 06:23:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 535097A2A60
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 05:22:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 824EC1B0435;
	Tue, 18 Feb 2025 05:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jEAN0Y2N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE72F1B042A;
	Tue, 18 Feb 2025 05:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739856201; cv=none; b=pDHKyqIBfPgX5XyFXmf2Sm4ox8hAbciu8AA7LYPyg8ZKZN0xH3dl+Zz75RYavFao8gLCDFnC0c8g4Vb5sxINNpPkobmRlrfk+M0+404V0+EtXmXXiBsKOvcfHXKJJi2sOryJ3AEvekG9wifwJRbPKSaGGstsH5bhgHGsGNUltSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739856201; c=relaxed/simple;
	bh=mC5Eya+d05zLAwz/V6r20dwxLOZDD6wms97Rf5Ryo1E=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=lXIRFusPyfYe0I8KbBK6S1e2scsfHUJyVgfINJ9kfBP7a2Or9aiLOmLjd2sbU//j6CEDyElN5ET6zD1tpRcC7UKbj9t23P+/EZdSUymCzI0k70nN+Gecs7Mqg/FEnUYMhkgCJ0IP652IqRuQkkjl60ImawrLf0EHHeAZebNEGlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jEAN0Y2N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51HLrlG4005929;
	Tue, 18 Feb 2025 05:23:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e8lsoWpvtNk9BqgA0uweAnSJzppunK4d0+Z7XDw8AQk=; b=jEAN0Y2NmKMuB+6d
	dcuPkcm1JwRizmsBvvDQVO+2Fyuh3aNcJMgFRoYuGQWGPl/wU6Ri8DBMvce5eTLi
	8bSIKoB115Uy1wGhYePMkkRhrppVqBGEYVIIpptpH3iTx98fbxiw8i50KU49QTUa
	Bg2D+6P06CbwuKUfNyfuz4HjmAflUxqCzktGX2wvHgNuRX+WjTmvNza+XCp1z82j
	oTqptjuG+6L4/5wiBuJKzBuaeAkqW5o3rIFgmJtRlrbCt8RaWYJmLcpfMzD35nEp
	nL+BfztYkGHzxHbxHcTQYf+JVDTPUSZGnQfPnW/G3IRwaKvOf19wycStwUWcj0IB
	SUWRrw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ut7uupfe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Feb 2025 05:23:14 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51I5NDel002068
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Feb 2025 05:23:13 GMT
Received: from [10.217.216.53] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 17 Feb
 2025 21:23:08 -0800
Message-ID: <30e84d27-6047-492a-8602-8822b5d492fe@quicinc.com>
Date: Tue, 18 Feb 2025 10:53:05 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] clk: qcom: lpassaudiocc-sc7280: Add support for
 LPASS resets for QCM6490
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
        "Jagadeesh Kona" <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250212-lpass_qcm6490_resets-v3-0-0b1cfb35b38e@quicinc.com>
 <20250212-lpass_qcm6490_resets-v3-2-0b1cfb35b38e@quicinc.com>
 <exyxni7td5vow2n6jarav5euje6dnbue5f5yxzu6az554dthfe@zn5yd2byvkoj>
 <ccc87c55-d157-4ffc-8081-1a5900752931@quicinc.com>
 <CAA8EJpp7e5q36jGmB-TZX5A=XVGKsDtmBF8kJmxoga8NqGZP1A@mail.gmail.com>
 <c820c697-c3ec-4ae3-9720-fb80cb3a0450@quicinc.com>
 <CAA8EJpon5+R5s0HXUmoikjtuyEf3sQUqBVYvWrxuh14h2DvjQg@mail.gmail.com>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <CAA8EJpon5+R5s0HXUmoikjtuyEf3sQUqBVYvWrxuh14h2DvjQg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: zSNxUH2V1gOBfCfc3ZXUsMfssq3VeSDc
X-Proofpoint-ORIG-GUID: zSNxUH2V1gOBfCfc3ZXUsMfssq3VeSDc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-18_01,2025-02-18_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 mlxscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502180038



On 2/13/2025 7:58 PM, Dmitry Baryshkov wrote:
>>>>>>  static const struct qcom_cc_desc lpass_audio_cc_reset_sc7280_desc = {
>>>>>> -    .config = &lpass_audio_cc_sc7280_regmap_config,
>>>>>> +    .config = &lpass_audio_cc_sc7280_reset_regmap_config,
>>>>>>      .resets = lpass_audio_cc_sc7280_resets,
>>>>>>      .num_resets = ARRAY_SIZE(lpass_audio_cc_sc7280_resets),
>>>>>>  };
>>>>>>
>>>>>>  static const struct of_device_id lpass_audio_cc_sc7280_match_table[] = {
>>>>>> -    { .compatible = "qcom,sc7280-lpassaudiocc" },
>>>>>> +    { .compatible = "qcom,qcm6490-lpassaudiocc", .data = &lpass_audio_cc_reset_sc7280_desc },
>>>>>> +    { .compatible = "qcom,sc7280-lpassaudiocc", .data = &lpass_audio_cc_sc7280_desc },
>>>>>>      { }
>>>>>>  };
>>>>>>  MODULE_DEVICE_TABLE(of, lpass_audio_cc_sc7280_match_table);
>>>>>> @@ -752,13 +763,17 @@ static int lpass_audio_cc_sc7280_probe(struct platform_device *pdev)
>>>>>>      struct regmap *regmap;
>>>>>>      int ret;
>>>>>>
>>>>>> +    desc = device_get_match_data(&pdev->dev);
>>>>>> +
>>>>>> +    if (desc->num_resets)
>>>>>> +            return qcom_cc_probe_by_index(pdev, 1, desc);
>>>>> Won't this break SC7280 support by causing an early return?
>>>>>
>>>> The resets are not defined for SC7280.
>>>> static const struct qcom_cc_desc lpass_audio_cc_sc7280_desc = {
>>>>         .config = &lpass_audio_cc_sc7280_regmap_config,
>>>>         .clks = lpass_audio_cc_sc7280_clocks,
>>>>         .num_clks = ARRAY_SIZE(lpass_audio_cc_sc7280_clocks),
>>>> };
>>>>
>>>> The reset get registered for SC7280 after the clocks are registered.
>>>> qcom_cc_probe_by_index(pdev, 1,  &lpass_audio_cc_reset_sc7280_desc);
>>> Could you please make this condition more obvious and error-prone
>>> rather than checking one particular non-obvious property?
>>>
>> Dmitry, we had earlier tried [1], but seems like we could not align on
>> this patchset.
>>
>> If you are aligned, please let me know I can fall back on the approach.
> You have been using of_device_is_compatible(). Krzysztof suggested
> using mach data. Both approaches are fine with me (I'm sorry,
> Krzysztof, this is a clock driver for a single platform, it doesn't
> need to scale).
> 
> You've settled on the second one. So far so good.

Sure, I will go ahead with the existing approach, but ensure I replace
the num_resets check with the of_device_is_compatible(), so it is more
readable. Hope this aligns with your thoughts as well.

> 
> But! The problem is in readability. Checking for desc->num_resets is a
> _hidden_ or cryptic way of checking whether to register only a first
> controller or both.
> 
> BTW: the commit message also tells nothing about the dropped power
> domain and skipped PM code. Is it not required anymore? Is it handled
> automatically by the firmware? But I see that audio codecs still use
> that power domain.
Yes, it will be taken care in the firmware and I will update in the
commit text.


Thanks,
Taniya.

