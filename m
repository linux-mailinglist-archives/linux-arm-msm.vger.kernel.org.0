Return-Path: <linux-arm-msm+bounces-40173-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3B29E32B3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 05:42:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C97941680A7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 04:42:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A696B169AE6;
	Wed,  4 Dec 2024 04:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TLjMdvyI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A1F383;
	Wed,  4 Dec 2024 04:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733287369; cv=none; b=dICt09rn2gd4PcqdAb444ykUou24HwKFGmcN2FFHhEGdw9KO8Qc9jgXnEU/IpXaRoT7/Us1GwkILp3qov7X3Ikn5uYjiG8k2nSRRaJsp0Bfm8a9A0M6l2yfr4F20SPaHi3qxS72jltJIhA6QPs8jS8RqURm2C72yPyz0lt0v8SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733287369; c=relaxed/simple;
	bh=5EKfOt38K82BnMIxNgyxs4POZDCXZEsPDK8yiorxv0U=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=AgcQ/oGMZtXO40Djk2Z1N+CsGXse7bgmTsQIZcTrxm0SrELpsg/Lhx3Cn+VjdWOEAFp0zB2xDqETwoPtCOZE90v9lOIk+bVKPE8z6I3jSO/FivcbVogK2II13EgQI0RghUp/mjlI/jsK+dE/sBWp6a7S58IGsgRP3NGMCpmW8dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TLjMdvyI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B445VG9020221;
	Wed, 4 Dec 2024 04:42:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uWCTtijkX4Ym2tIYCpmzq6UqmSqL+/Rn/56+j7deBjc=; b=TLjMdvyImEtAvjHZ
	dOD3bmnycsnpUVwdSbVmhwWfdvIi+WD91Z6h7yD9eEOGJee/xsnEW7aQnS8oYdsY
	tVCbzcytPBZ0VsJ6phmm3tLDQA05xVPNJbR47ktpKm4XYfnK1OjaYvnHjf6uip4n
	4Ined8RGD9/3Ntho7/tfS8T5Ip7Gvu+xpwilwHZXCSrBjzm2XRSyBsCe0bonFQ+v
	MHVlWVJz6x1W+VHLtx40pQkg60HwqYrA28meV5y0l/1ZypkIpqJFFw19MA4dN0te
	b9cTMM12p4Rt8K+w5U910hGxtUf6Fkw2Vu/6mAxalz07R/IoPf7UlzGWWBC85GpP
	Fdatlw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43a3exa0bt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Dec 2024 04:42:32 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B44gV8J001336
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Dec 2024 04:42:31 GMT
Received: from [10.217.217.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 3 Dec 2024
 20:42:26 -0800
Message-ID: <6cbe51ea-01a0-4adf-af41-314d42ec6d65@quicinc.com>
Date: Wed, 4 Dec 2024 10:12:24 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] clk: qcom: rpmh: Add support for SM8750 rpmh
 clocks
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Melody Olvera
	<quic_molvera@quicinc.com>
CC: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        "Satya Durga
 Srinivasu Prabhala" <quic_satyap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Bryan
 O'Donoghue" <bryan.odonoghue@linaro.org>
References: <20241112002807.2804021-1-quic_molvera@quicinc.com>
 <20241112002807.2804021-3-quic_molvera@quicinc.com>
 <5pgwerxhqhyr2u47grqzgzvvng4rojzq4gozil7vy37bew5pqj@wt676vfjs7bg>
 <8d3c2efd-b6c3-4b01-ae01-78460f4e9f26@quicinc.com>
 <lyqiwzahl46fy2eqaz6g4wqwik623mstbjlew5mkfqj2zp4jxz@xjnt5uh2bc3p>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <lyqiwzahl46fy2eqaz6g4wqwik623mstbjlew5mkfqj2zp4jxz@xjnt5uh2bc3p>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: QxO7JkSaVZU_cyUo6Os1g_BZxg5fkDb5
X-Proofpoint-GUID: QxO7JkSaVZU_cyUo6Os1g_BZxg5fkDb5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412040035



On 11/19/2024 7:28 AM, Dmitry Baryshkov wrote:
> On Mon, Nov 18, 2024 at 10:53:16AM -0800, Melody Olvera wrote:
>> On 11/15/2024 7:31 AM, Dmitry Baryshkov wrote:
>>> On Mon, Nov 11, 2024 at 04:28:02PM -0800, Melody Olvera wrote:
>>>> From: Taniya Das <quic_tdas@quicinc.com>
> 
> [...]
> 
>>>> @@ -894,6 +919,7 @@ static const struct of_device_id clk_rpmh_match_table[] = {
>>>>    	{ .compatible = "qcom,sa8775p-rpmh-clk", .data = &clk_rpmh_sa8775p},
>>>>    	{ .compatible = "qcom,sar2130p-rpmh-clk", .data = &clk_rpmh_sar2130p},
>>>>    	{ .compatible = "qcom,sc7180-rpmh-clk", .data = &clk_rpmh_sc7180},
>>>> +	{ .compatible = "qcom,sc7280-rpmh-clk", .data = &clk_rpmh_sc7280},
>>>>    	{ .compatible = "qcom,sc8180x-rpmh-clk", .data = &clk_rpmh_sc8180x},
>>>>    	{ .compatible = "qcom,sc8280xp-rpmh-clk", .data = &clk_rpmh_sc8280xp},
>>>>    	{ .compatible = "qcom,sdm845-rpmh-clk", .data = &clk_rpmh_sdm845},
>>>> @@ -909,7 +935,7 @@ static const struct of_device_id clk_rpmh_match_table[] = {
>>>>    	{ .compatible = "qcom,sm8450-rpmh-clk", .data = &clk_rpmh_sm8450},
>>>>    	{ .compatible = "qcom,sm8550-rpmh-clk", .data = &clk_rpmh_sm8550},
>>>>    	{ .compatible = "qcom,sm8650-rpmh-clk", .data = &clk_rpmh_sm8650},
>>>> -	{ .compatible = "qcom,sc7280-rpmh-clk", .data = &clk_rpmh_sc7280},
>>> Please don't mix fixes and actual code. I'd suggest splitting sc7280
>>> move to the separate commit.
>>
>> Bryan O'Donoghue requested we sort these as part of this patch. I don't feel
>> strongly either way,
>> but clear guidance here would be appreciated.
> 
> I don't see v1 of this patch on the linux-arm-msm list (hint: use b4
> tool to send patches), so I can not comment on what Bryan ment. But I'd
> definitely say, moving of the sc7280 entry is a _separate_ commit.
> 
>>

I will push the latest patch fixing the issues in this patch.

>> Thanks,
>> Melody
>>
>>>
>>>> +	{ .compatible = "qcom,sm8750-rpmh-clk", .data = &clk_rpmh_sm8750},
>>>>    	{ .compatible = "qcom,x1e80100-rpmh-clk", .data = &clk_rpmh_x1e80100},
>>>>    	{ }
>>>>    };
>>>> -- 
>>>> 2.46.1
>>>>
>>
> 

-- 
Thanks & Regards,
Taniya Das.

