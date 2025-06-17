Return-Path: <linux-arm-msm+bounces-61629-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC23ADDC19
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 21:16:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B262519405D7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 19:16:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F16125291C;
	Tue, 17 Jun 2025 19:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pG9x1vD+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA86C215073;
	Tue, 17 Jun 2025 19:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750187792; cv=none; b=usY39xM395BNCtZs7fx/cxwFMt7Xkn4exhOLP0HoKm4WvaI/U3EYFqOzZNMctyTZLr3Ab9cc4pDsRLXpk04/IK6oR/oGTDStBGfYRfNJOJb6N5PBC/I+8oMeRgqRnsSE5XfOs2qnPLWyV4RwNG5Lswqdoe6vWeZpS24yyMTzNbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750187792; c=relaxed/simple;
	bh=e4ZmAXrMj3T7tIYtIjUVGlwUosdLIiocLhMXZU7REME=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=siREmXJWBplidW6OX/4kgD+fC4zSJNFn449q6mwva0mvO+jmc02E0tn09rN8qY5b19tVqqlDOzbT614jD48zSyJxal7h44G+NwEOk1MI8xNaRehUsyH7RUWPcRaOLURHvLaRub++CLng8LKxOKM3CnBPGJ3wOpAl+iOZ6QBtItM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pG9x1vD+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55HFQRPm014469;
	Tue, 17 Jun 2025 19:16:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MTFCG+fA3J+Tywsn4aalU3NdM1MPIzMKpjg3FMwZsd4=; b=pG9x1vD+koyg1mg3
	vlQgA94eA5Pju4PBBDep1mzURN7yFolR5z5icd1kgtdYTS1w0v86hBchcCtgh+9m
	82ArYOXQ03/6qDC7KYZrWH/UfCC3Wbw2cSFIEOaNP5c4s349BzRk6AYf2a3haj9v
	s9pab7sOzG1cj0b9pAnkmKNmGLAOnVHBOT0xEz4Uc64PWq/dbFwI1lVyt2QUbgpW
	1lz54oTGR8AdmFc4nL4i3qXBLmu5yNyOVE+efk/1onmga7YTGO0r7h5Jg4tNtVph
	JxgX3ne2L5wQVDKxvhLAD0TJG7xgljwzPC0JXm0nFiga2Td8HML5hTvnOg4LJ97C
	ChqzIg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47akuwcy5s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Jun 2025 19:16:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55HJGOCk010033
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Jun 2025 19:16:24 GMT
Received: from [10.216.17.156] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 17 Jun
 2025 12:16:17 -0700
Message-ID: <cc737a89-77e0-43bc-8766-2c8e9cce1863@quicinc.com>
Date: Wed, 18 Jun 2025 00:46:13 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v5 00/18] clk: qcom: Add support to attach
 multiple power domains in cc probe
To: Bjorn Andersson <andersson@kernel.org>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Vladimir
 Zapolskiy" <vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov
	<lumag@kernel.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Satya Priya
 Kakitapalli" <quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>
References: <20250530-videocc-pll-multi-pd-voting-v5-0-02303b3a582d@quicinc.com>
 <174970084192.547582.612305407582982706.b4-ty@kernel.org>
 <65828662-5352-449b-a892-7c09d488a1f4@quicinc.com>
 <91c11e62-b0d4-40e9-91a1-20da9973e415@linaro.org>
 <0d9846f8-da23-4f2a-a593-35350c026b44@quicinc.com>
 <wew4ptjmsugbahtpxe3z6647mapp5k6fyhajdzkd75ml6cqwaz@ulwhe6ikkb6m>
Content-Language: en-US
From: Jagadeesh Kona <quic_jkona@quicinc.com>
In-Reply-To: <wew4ptjmsugbahtpxe3z6647mapp5k6fyhajdzkd75ml6cqwaz@ulwhe6ikkb6m>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: WFHuGgN27LitrKrSoHwFoRotCJtNbNoV
X-Authority-Analysis: v=2.4 cv=He0UTjE8 c=1 sm=1 tr=0 ts=6851bf09 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=d8K3xM53n2JVf4ZB_MIA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: WFHuGgN27LitrKrSoHwFoRotCJtNbNoV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDE1NCBTYWx0ZWRfX8rWc0jZEmRZ9
 J3U6ngLuR6FTV2lDvCaGsOiqLpo9PfhSLyIyYaDq43a/FHTkC4lpL13blLJY0/0Zx7him60Lf1i
 d/7jCZCbfCLavcram5isBHaIIehscyNHMh9pqVALlEfsWhOdqCzHCG1nc9EPMenfddV0qVUq31b
 dfzNyO9T0a/d4dbj7WJ2vZG3pvbh/KNPhaO/tn2UB8+L05XvCBdjIxaUIThWFIcmGB8e7oSqmNG
 wcrs+uVHSnO2wzTOsiogNvkHtTiFKfVWBju363OKheXGuDhrMmtm/bXH2ppqy9lTN6qq5Gn0ut6
 +3+EGrTi8YsMhz9uM3FiSkLLQcD9zJB8vjc8YiVpdLS4hue2qgFI2Iv5ERtRA/P2zHkQS1fDN/o
 FmcFxzJ7TW1xSwAIbYhqC+0MaSxzEuIO5fe/cE1AKhePX3an7ugszoLZLVV/0cuJSc0R3oC3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_08,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 bulkscore=0 mlxlogscore=988 lowpriorityscore=0 phishscore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506170154



On 6/17/2025 6:57 PM, Bjorn Andersson wrote:
> On Mon, Jun 16, 2025 at 12:55:47PM +0530, Jagadeesh Kona wrote:
>>
>>
>> On 6/12/2025 4:22 PM, Krzysztof Kozlowski wrote:
>>> On 12/06/2025 12:03, Jagadeesh Kona wrote:
>>>>
>>>>
>>>> On 6/12/2025 9:30 AM, Bjorn Andersson wrote:
>>>>>
>>>>> On Fri, 30 May 2025 18:50:45 +0530, Jagadeesh Kona wrote:
>>>>>> In recent QCOM chipsets, PLLs require more than one power domain to be
>>>>>> kept ON to configure the PLL. But the current code doesn't enable all
>>>>>> the required power domains while configuring the PLLs, this leads to
>>>>>> functional issues due to suboptimal settings of PLLs.
>>>>>>
>>>>>> To address this, add support for handling runtime power management,
>>>>>> configuring plls and enabling critical clocks from qcom_cc_really_probe.
>>>>>> The clock controller can specify PLLs, critical clocks, and runtime PM
>>>>>> requirements using the descriptor data. The code in qcom_cc_really_probe()
>>>>>> ensures all necessary power domains are enabled before configuring PLLs
>>>>>> or critical clocks.
>>>>>>
>>>>>> [...]
>>>>>
>>>>> Applied, thanks!
>>>>>
>>>>> [01/18] dt-bindings: clock: qcom,sm8450-videocc: Add MXC power domain
>>>>>         commit: 1a42f4d4bb92ea961c58599bac837fb8b377a296
>>>>> [02/18] dt-bindings: clock: qcom,sm8450-camcc: Allow to specify two power domains
>>>>>         commit: a02a8f8cb7f6f54b077a6f9eb74ccd840b472416
>>>>> [03/18] dt-bindings: clock: qcom,sm8450-camcc: Move sc8280xp camcc to sa8775p camcc
>>>>>         commit: 842fa748291553d2f56410034991d0eb36b70900
>>>>> [04/18] clk: qcom: clk-alpha-pll: Add support for common PLL configuration function
>>>>>         commit: 0f698c16358ef300ed28a608368b89a4f6a8623a
>>>>> [05/18] clk: qcom: common: Handle runtime power management in qcom_cc_really_probe
>>>>>         commit: c0b6627369bcfec151ccbd091f9ff1cadb1d40c1
>>>>> [06/18] clk: qcom: common: Add support to configure clk regs in qcom_cc_really_probe
>>>>>         commit: 452ae64997dd1db1fe9bec2e7bd65b33338e7a6b
>>>>> [07/18] clk: qcom: videocc-sm8450: Move PLL & clk configuration to really probe
>>>>>         commit: 512af5bf312efe09698de0870e99c0cec4d13e21
>>>>> [08/18] clk: qcom: videocc-sm8550: Move PLL & clk configuration to really probe
>>>>>         commit: a9dc2cc7279a1967f37192a2f954e7111bfa61b7
>>>>> [09/18] clk: qcom: camcc-sm8450: Move PLL & clk configuration to really probe
>>>>>         commit: eb65d754eb5eaeab7db87ce7e64dab27b7d156d8
>>>>> [10/18] clk: qcom: camcc-sm8550: Move PLL & clk configuration to really probe
>>>>>         commit: adb50c762f3a513a363d91722dbd8d1b4afc5f10
>>>>> [11/18] clk: qcom: camcc-sm8650: Move PLL & clk configuration to really probe
>>>>>         commit: 3f8dd231e60b706fc9395edbf0186b7a0756f45d
>>>>> [12/18] clk: qcom: camcc-x1e80100: Move PLL & clk configuration to really probe
>>>>>         commit: d7eddaf0ed07e79ffdfd20acb2f6f2ca53e7851b
>>>>>
>>>>> Best regards,
>>>>
>>>>
>>>> Hi Bjorn,
>>>>
>>>> Thanks for picking these patches. However, the dt-bindings patches are closely linked with
>>>> the DT patches in this series and needs to be picked together. The dt-bindings changes adds
>>>
>>> DT bindings are the DT patches. What do you mean by DT? DTS? If so, then
>>> you introduce regressions without explaining this at all in cover letter
>>> or patches.
>>>
>>>> multiple power domains support for clock controllers, and without the corresponding DT
>>>> patches, dtbs_check will give warnings.
>>>>
>>>> Can you please help to pick DT patches as well?
>>>
>>> Please read soc maintainer profile explaining how DTS is being organized.
>>>
>>
>> I apologize for not mentioning this details in cover letter. Here the dt-bindings documentation
>> changes(patches 1-3) are only applied and the corresponding DTS changes(patches 13-18) are not
>> yet applied via DTS tree, leading to dtbs_check warnings.
>>
> 
> Mentioning this in the cover letter wouldn't change the fact that the
> binding is changing in an unexpected way.
> 
> As the binding now express that 2 power-domains is required, the driver
> author would be free to expect that the loaded DTB has 2 power-domains
> specified. But the user might still have an older DTB on their system
> (exactly what dtbs_check is complaining about now).
> 
> A quick look makes me think that it's because you removed the maxItems:1
> which means that the properties needs to match completely. Changing this
> to minItems:1 should allow for both cases, I think.
> 
> 
> Can you please send a patch that fixes up the bindings to allow both the
> old and new case?
> 

Thanks Bjorn and Krzysztof for the info and suggestion.

I tried adding minItems as 1 to power-domains and required-opps properties
and dtbs_check is working fine now for both single and multi power-domains cases.

I have posted the below series with this fixes:
https://lore.kernel.org/all/20250618-sm8450-videocc-camcc-bindings-single-pd-fix-v1-0-02e83aeba280@quicinc.com/

Thanks,
Jagadeesh

> Regards,
> Bjorn
> 
>> Thanks,
>> Jagadeesh
>>
>>>
>>> Best regards,
>>> Krzysztof

