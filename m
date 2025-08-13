Return-Path: <linux-arm-msm+bounces-68967-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16702B24829
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 13:15:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1AECF564E07
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 11:15:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 473B82F6595;
	Wed, 13 Aug 2025 11:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Zhy9BWCw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888A22F2907;
	Wed, 13 Aug 2025 11:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755083702; cv=none; b=C/cSKJcE+eb60bEB6wexhqGGtfn/1BeRQFoT7dXXG7MqPNJJuB1w5la1Jj2lIUeCPTmeYeNV6YNdehZxxhAYzhMWaWNExBXlOvnpivHPfFjEb2mYxiq4SUjMucXRCvmKZJOEKUY2GDa7TEdkrgWU2LYVi8r/dC7n1cxrYSq0Tgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755083702; c=relaxed/simple;
	bh=1QxaAmP+6pQhj48WneZYdN3/rWlwl+Vu83S1PMxmyRU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=dt3QWgCF2oe8tDv2mXMMTf07eoZmg64ZxYE7Wa/OK6vszubin/KMCkiByix7FZl/H4LEiTq1ucijdaziNyzslaFmwzgIxbarnCpBs+L2qGCBWyTGu0bLAU0U6lo5UFuEl5jlmzZGLRppPKy6S2Z5Lp0FErcL6hz1RqPB4dkSQW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Zhy9BWCw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57D9evup022111;
	Wed, 13 Aug 2025 11:14:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LxVT+oSsndCU73CVTzLksBdFa/Vu7DeCLNwV9iANB3A=; b=Zhy9BWCwzjjNaFE/
	5XHUIUYzKJK8tBxuE+j1+tNNGEaF0Cp9B98jrCPxeINeLJyTQy0JQ1obLJ/tcMtc
	JhxPq2GF8LeVsaD+oIPALwpkY43GRP2GuBUH7sWfbVsNTfwE54rPL3sztOvdv408
	npthUAI+x4V5+VvX43MYLaitqKwyMKq0cvp6f7sBoN6EOkVxJByjgbHI69WpEI+B
	8tA/oH7rBBYeJHGeCHbqSSvlTxXe1Ce9YlXZLlm58iJSwxG7fv+obzQ5Q1RFH4fA
	A6myn4N4mLLSa6dhTaMv0i5qG7VNrr9KkKzgO2GNvn1ESrwQ7T7eAlUCT1bStMDM
	U+tzkw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48gr9rr853-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 11:14:56 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57DBEtpG029317
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 11:14:55 GMT
Received: from [10.206.107.4] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 13 Aug
 2025 04:14:50 -0700
Message-ID: <7934659a-0f2f-4c8f-9699-f32ae0fff53c@quicinc.com>
Date: Wed, 13 Aug 2025 16:44:47 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 4/4] arm64: dts: qcom: sm8550: Remove SDR104/SDR50
 broken capabilities
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>,
        Ulf Hansson
	<ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Adrian Hunter
	<adrian.hunter@intel.com>, <linux-mmc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <quic_cang@quicinc.com>,
        <quic_nguyenb@quicinc.com>, <quic_rampraka@quicinc.com>,
        <quic_pragalla@quicinc.com>, <quic_sayalil@quicinc.com>,
        <quic_nitirawa@quicinc.com>, <quic_bhaskarv@quicinc.com>,
        <kernel@oss.qualcomm.com>
References: <20250801084518.2259767-1-quic_sartgarg@quicinc.com>
 <20250801084518.2259767-5-quic_sartgarg@quicinc.com>
 <69f2807c-9a28-4b31-97cc-2756f0ab9fd4@kernel.org>
 <c7e36755-9255-4209-9d53-20077bd1d3ba@quicinc.com>
 <lkjp2353athoi76h3j3bgkcxdwfn6akcyyweipt4g774ztmmer@vcw7ru5red3n>
From: Sarthak Garg <quic_sartgarg@quicinc.com>
In-Reply-To: <lkjp2353athoi76h3j3bgkcxdwfn6akcyyweipt4g774ztmmer@vcw7ru5red3n>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEzMDA5NCBTYWx0ZWRfX4KNRyeExqHuW
 GZeMXj8KSwLsz5A6cn2kIGK94OImy65h323srWtphRfiiScG8+NGSwxtjfdxIUj30y99d9DC3Hx
 LQU5Xk6vQvtvAhn42zQG0zHNWbx20Rd6ww6Aacx0sic2iGxDPqjnzOrXwFmO6zaqjXBAzWM+jEg
 HZqtqVmiYY6TOarBesx+7DenGpXD5c+8LqiA5GwAF1Bn+7Ru1yaYs/SfptGnmhMSE1HPFdLLb3Y
 ojhxulrbIR60tUCKRXL2soVAu6yoywNtTPmHVTYSgg59Td36OlJTNsSsi/280g9YeuU/JgnqqHM
 xOFEDnM/eVyMkD6WdleYuNng62L0jbxKOaofI74g75DaWuJlqrP9lfUSFB+YswzHxz1AZWMy5Ns
 Au7ieHwP
X-Authority-Analysis: v=2.4 cv=NIrV+16g c=1 sm=1 tr=0 ts=689c73b0 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=_pBN19rJMsio1WeRKKgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: JEFH25p2LWa6LI4xW1-UL6xptPDYM9kb
X-Proofpoint-GUID: JEFH25p2LWa6LI4xW1-UL6xptPDYM9kb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_01,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0
 spamscore=0 malwarescore=0 phishscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508130094



On 8/5/2025 3:29 PM, Dmitry Baryshkov wrote:
> On Tue, Aug 05, 2025 at 02:49:29PM +0530, Sarthak Garg wrote:
>>
>>
>> On 8/1/2025 2:32 PM, Krzysztof Kozlowski wrote:
>>> On 01/08/2025 10:45, Sarthak Garg wrote:
>>>> The kernel now handles level shifter limitations affecting SD card
>>>> modes, making it unnecessary to explicitly disable SDR104 and SDR50
>>>> capabilities in the device tree.
>>>>
>>>> However, due to board-specific hardware constraints particularly related
>>>> to level shifter in this case the maximum frequency for SD High-Speed
>>>> (HS) mode must be limited to 37.5 MHz to ensure reliable operation of SD
>>>> card in HS mode. This is achieved using the max-sd-hs-frequency property
>>>> in the board DTS.
>>>>
>>>> Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
>>>> ---
>>>>    arch/arm64/boot/dts/qcom/sm8550-hdk.dts                     | 1 +
>>>>    arch/arm64/boot/dts/qcom/sm8550-mtp.dts                     | 1 +
>>>>    arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts | 1 +
>>>>    arch/arm64/boot/dts/qcom/sm8550.dtsi                        | 3 ---
> 
> You missed several devices which use SM8550. Please fix that.
> 
>>>>    4 files changed, 3 insertions(+), 3 deletions(-)
>>>>
>>>
>>> This will break MMC for all of the users and nothing in commit msg or
>>> cover letter explains that or mentions merging strategy.
>>>
>>> Exactly this case is covered by your internal guideline, no? Please read it.
>>>
>>> Best regards,
>>> Krzysztof
>>
>> Just to make sure I’m addressing the right concern — are you primarily
>> worried about the introduction of the max-sd-hs-frequency property in the
>> board DTS files, or about the removal of the sdhci-caps-mask
>> from the common sm8550.dtsi?
> 
> This patch requires all previous patches to work, so it can not be
> applied in parallel. It should be applied after the previous patches are
> merged by MMC maintainers and then available in the Bjorn's tree. This
> requires either skipping a release for this patch or using an immutable
> tag for the MMC patches. All these deteails should be explained in the
> cover letter.
> 

As mentioned in reply to Krzysztof's previous comment we are planning to 
drop the plan to modify broken capabilities for SM8550 in the current 
cycle. The removal of SDR104/SDR50 caps will be revisited for upcoming 
targets, where we can ensure proper validation and alignment with MMC 
patch dependencies.

Best regards,
Sarthak

