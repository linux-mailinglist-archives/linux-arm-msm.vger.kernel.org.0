Return-Path: <linux-arm-msm+bounces-61388-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 91518ADA967
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 09:26:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DCBA81895D83
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 07:26:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C1401F0E58;
	Mon, 16 Jun 2025 07:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KEeBvaFx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30322CA6;
	Mon, 16 Jun 2025 07:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750058763; cv=none; b=Q4qr0eIcSc5lVRUv6p5Gd5iJE30Oi7epIEl5HxGz5RXYx5/vj7ujyXZKaPnKxCiP6Tl5xs/izoVOJzbPTtzIOqJLMbz7p/2yrD8FrOrRMpw48ArGgG07ccVe/dNJYxzxEICo92wLfNSAEN7EKQsKrCG4+g7x1qG39BeRv9ZTdCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750058763; c=relaxed/simple;
	bh=XP9PvxbbFwpO9eJAx75niUIURXU9zqEWph+Lc77aPAk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=k8aKLKxaDoUqRDWCgWomC/vTyFXidT/XERGpLHppTx9s1QuPGhpWottqvss7E8Qv0PqG1BQh2MivrKYCNsoKycsUESJ4kGSid4wwGapQ0ApCMIYW2bZdHcJNM7Nok4CFJM4/qfkKtpu2nfu44o22Nj6u+vNzWPC+esmlbhsORck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KEeBvaFx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55FNqAWg025415;
	Mon, 16 Jun 2025 07:25:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XcAily78zL3qaqYDxn/xmpaLjAqqMN5K0g0hvjaD8L4=; b=KEeBvaFxHO77fjN/
	FeHD3Q0WqQJpOUjk1oRLS1za33xmvfGQ6nvVU9lW3XF3NcsU2SerVFqyjCaTyDmB
	nsRMZVIzaobiESI/Qp9z7EP6tU8S6cTxkhlGJ6hZfG6TBIqitlAokgxqyguslflK
	0abLCOm+t0H9pc9r5wfBl9+6LmBnx3rGsIy04xfofhTMS4oGchCg+lIJCXYsLDW+
	DbJ0oUkZRBEMyDdMMQgwnG/SS2E1/ABIGctG3H3eJjX5dpF/Gp/ZfbXdbVMoXx1Y
	7zcvMG2c8VBiVNq0mSO8yL3m/Pbo47/Sf3MzJ75MHOWs8CpJZ47b8OWPb06CEgss
	VfgGag==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 479qp5j2jd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Jun 2025 07:25:57 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55G7Puis009950
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Jun 2025 07:25:56 GMT
Received: from [10.217.216.47] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 16 Jun
 2025 00:25:50 -0700
Message-ID: <0d9846f8-da23-4f2a-a593-35350c026b44@quicinc.com>
Date: Mon, 16 Jun 2025 12:55:47 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v5 00/18] clk: qcom: Add support to attach
 multiple power domains in cc probe
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
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
Content-Language: en-US
From: Jagadeesh Kona <quic_jkona@quicinc.com>
In-Reply-To: <91c11e62-b0d4-40e9-91a1-20da9973e415@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: uIkot9sHibWn9vjlb_aH7r3PxNan9Lg7
X-Proofpoint-ORIG-GUID: uIkot9sHibWn9vjlb_aH7r3PxNan9Lg7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDA0OCBTYWx0ZWRfX5Z/C+ZXYek0t
 Q3OLc16zslcmrB0Hz0nVi8H/55dGfx8M8lnH3TdJnsKnO/6beNzsKkYtD9GB4bvuVIq2XWyGkfN
 j2Vz4391McwGr3HnvNsfL7BUa9aCBxZmBSaLTs2fFM3IRKUbV29/+9GvS9MCNnq4HJR2hk9oNSQ
 0GuIGAlGSOHQlWj3hpQcICtWH6vYvP0/0XSBNTKybKjcomBacOFoLVCal27pbtL9ClpliGpEgqw
 6LtE/nPcoR0pA+J+4N+NiV/wbpE/8wD6Njp0hYcBBKi3z6k1EysVmxKL+u/KMRTS/O5HQf0BCau
 RipXrcBjpsAsbmjfXLW50QM68+x4wAQwVidw/bTgraQc0T+kYutnAOqHvhJvPj+9qRKOy6X5KDa
 EOp2zdwB+7gzd1yXcpZJHt/0d7K9wpcv6kNBQDS0DTbSAVl0S032RDWrkbrjC/1wN7wfOZYY
X-Authority-Analysis: v=2.4 cv=fMc53Yae c=1 sm=1 tr=0 ts=684fc705 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=4vALZuFKeRXYYujc2Y0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_03,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506160048



On 6/12/2025 4:22 PM, Krzysztof Kozlowski wrote:
> On 12/06/2025 12:03, Jagadeesh Kona wrote:
>>
>>
>> On 6/12/2025 9:30 AM, Bjorn Andersson wrote:
>>>
>>> On Fri, 30 May 2025 18:50:45 +0530, Jagadeesh Kona wrote:
>>>> In recent QCOM chipsets, PLLs require more than one power domain to be
>>>> kept ON to configure the PLL. But the current code doesn't enable all
>>>> the required power domains while configuring the PLLs, this leads to
>>>> functional issues due to suboptimal settings of PLLs.
>>>>
>>>> To address this, add support for handling runtime power management,
>>>> configuring plls and enabling critical clocks from qcom_cc_really_probe.
>>>> The clock controller can specify PLLs, critical clocks, and runtime PM
>>>> requirements using the descriptor data. The code in qcom_cc_really_probe()
>>>> ensures all necessary power domains are enabled before configuring PLLs
>>>> or critical clocks.
>>>>
>>>> [...]
>>>
>>> Applied, thanks!
>>>
>>> [01/18] dt-bindings: clock: qcom,sm8450-videocc: Add MXC power domain
>>>         commit: 1a42f4d4bb92ea961c58599bac837fb8b377a296
>>> [02/18] dt-bindings: clock: qcom,sm8450-camcc: Allow to specify two power domains
>>>         commit: a02a8f8cb7f6f54b077a6f9eb74ccd840b472416
>>> [03/18] dt-bindings: clock: qcom,sm8450-camcc: Move sc8280xp camcc to sa8775p camcc
>>>         commit: 842fa748291553d2f56410034991d0eb36b70900
>>> [04/18] clk: qcom: clk-alpha-pll: Add support for common PLL configuration function
>>>         commit: 0f698c16358ef300ed28a608368b89a4f6a8623a
>>> [05/18] clk: qcom: common: Handle runtime power management in qcom_cc_really_probe
>>>         commit: c0b6627369bcfec151ccbd091f9ff1cadb1d40c1
>>> [06/18] clk: qcom: common: Add support to configure clk regs in qcom_cc_really_probe
>>>         commit: 452ae64997dd1db1fe9bec2e7bd65b33338e7a6b
>>> [07/18] clk: qcom: videocc-sm8450: Move PLL & clk configuration to really probe
>>>         commit: 512af5bf312efe09698de0870e99c0cec4d13e21
>>> [08/18] clk: qcom: videocc-sm8550: Move PLL & clk configuration to really probe
>>>         commit: a9dc2cc7279a1967f37192a2f954e7111bfa61b7
>>> [09/18] clk: qcom: camcc-sm8450: Move PLL & clk configuration to really probe
>>>         commit: eb65d754eb5eaeab7db87ce7e64dab27b7d156d8
>>> [10/18] clk: qcom: camcc-sm8550: Move PLL & clk configuration to really probe
>>>         commit: adb50c762f3a513a363d91722dbd8d1b4afc5f10
>>> [11/18] clk: qcom: camcc-sm8650: Move PLL & clk configuration to really probe
>>>         commit: 3f8dd231e60b706fc9395edbf0186b7a0756f45d
>>> [12/18] clk: qcom: camcc-x1e80100: Move PLL & clk configuration to really probe
>>>         commit: d7eddaf0ed07e79ffdfd20acb2f6f2ca53e7851b
>>>
>>> Best regards,
>>
>>
>> Hi Bjorn,
>>
>> Thanks for picking these patches. However, the dt-bindings patches are closely linked with
>> the DT patches in this series and needs to be picked together. The dt-bindings changes adds
> 
> DT bindings are the DT patches. What do you mean by DT? DTS? If so, then
> you introduce regressions without explaining this at all in cover letter
> or patches.
> 
>> multiple power domains support for clock controllers, and without the corresponding DT
>> patches, dtbs_check will give warnings.
>>
>> Can you please help to pick DT patches as well?
> 
> Please read soc maintainer profile explaining how DTS is being organized.
> 

I apologize for not mentioning this details in cover letter. Here the dt-bindings documentation
changes(patches 1-3) are only applied and the corresponding DTS changes(patches 13-18) are not
yet applied via DTS tree, leading to dtbs_check warnings.

Thanks,
Jagadeesh

> 
> Best regards,
> Krzysztof

