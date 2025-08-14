Return-Path: <linux-arm-msm+bounces-69120-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 004A0B25CD5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 09:15:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 09C354E01CE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 07:15:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D95B23D7E9;
	Thu, 14 Aug 2025 07:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OqteK6wp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B971A9F8F;
	Thu, 14 Aug 2025 07:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755155733; cv=none; b=KuTVBHejsxyNCQbNI68blXCaNw7DXAL2023KJ1VBxtqThZCVVDBzZbc8ZzR6FOb4jOAwGy9Rc23cM+BL560qgO/hKNKGJB5LnrcuE6LJIUNUgWOPAHqxkrDVVTPml4D5ML2IiorRFNAq9UpIe4oEQJSUlA5CtrMpPDLI636CSQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755155733; c=relaxed/simple;
	bh=Q76elz5OfAOCUyiPxLaPswZ/mRc86NecebFPSfGGyCU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=F7wrcw2Q/oYINv0w0GyIHNCH1tQJih66ArJeP/3d3ngRDI3wo5luUvUuYQ/RAGa12ywtQjnQp6806ujkEbxEdLDcy+8Qcqqw3ySia7hCViPfAYvNXQfUTaJul+SRDAS09NQEURQYG4kNbiTgmsspsbtfObHsKKNbHyoEcYV6Db4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OqteK6wp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DNS32b025686;
	Thu, 14 Aug 2025 07:15:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MVJ2/ZBIIfsqqOG7o0XSDJgZ8RX55I7X6cWhwMyyOS4=; b=OqteK6wpH4Yf/IMk
	rRsdvBCEc6bm1FaSCf481VRDkxtMFUlWo0fDyX7sMXqs692hKLJcq5wG/Yj3wwvr
	O7mUQ/9jKw9p/gp3luL3DUG8LTyetw9Bkt620eUhPdH+V/rFutrZltNuucFHKN37
	AkzBYpQAAJW8n6XGYznW4HycmxMkX970dr0Y2ZZFEOSQxbwiEe6DHLhCdkUdY56+
	k3NN/KfaD1AGd7MhUDNbm1UeD2rWioKyZY8A3Xf69ZDF4NnvAsyhOAF8JRd2jieX
	pJE2yb9hdgm2PjeA9m9YOUETjpIjWinaqIjct2Wb9oUT1TFM0e8duToDrnjVPEBD
	R5ly3w==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dy3gene1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Aug 2025 07:15:27 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57E7FRhq022400
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Aug 2025 07:15:27 GMT
Received: from [10.204.78.60] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 14 Aug
 2025 00:15:21 -0700
Message-ID: <dda9a2ef-5b86-4883-8347-b5ccf25e8d5d@quicinc.com>
Date: Thu, 14 Aug 2025 12:45:18 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 4/4] arm64: dts: qcom: sm8550: Remove SDR104/SDR50
 broken capabilities
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski
	<krzk@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>
CC: <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_cang@quicinc.com>, <quic_nguyenb@quicinc.com>,
        <quic_rampraka@quicinc.com>, <quic_pragalla@quicinc.com>,
        <quic_sayalil@quicinc.com>, <quic_nitirawa@quicinc.com>,
        <quic_bhaskarv@quicinc.com>, <kernel@oss.qualcomm.com>
References: <20250801084518.2259767-1-quic_sartgarg@quicinc.com>
 <20250801084518.2259767-5-quic_sartgarg@quicinc.com>
 <69f2807c-9a28-4b31-97cc-2756f0ab9fd4@kernel.org>
 <c7e36755-9255-4209-9d53-20077bd1d3ba@quicinc.com>
 <8b023e56-435b-43df-8b15-c562a494e06f@kernel.org>
 <ab5d3811-9fbf-4749-9463-4457fbf50023@quicinc.com>
 <4091c488-996c-4318-82ad-c054a9ef5a22@oss.qualcomm.com>
 <a93fb5bf-1fd5-4e00-8338-b8608a9ba8fa@kernel.org>
 <f2f13082-20d6-4f22-8dfb-f11b01cd6706@oss.qualcomm.com>
Content-Language: en-US
From: Sarthak Garg <quic_sartgarg@quicinc.com>
In-Reply-To: <f2f13082-20d6-4f22-8dfb-f11b01cd6706@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=X4lSKHTe c=1 sm=1 tr=0 ts=689d8d0f cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=bExINVLK0oqGhwCZNEEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzMSBTYWx0ZWRfX8CUu284FyLnM
 IwIk9PTqDxDN5GrBUfAzjyOrwijF6Ued3IbM4tWsz+u7O3gWV5nqWCD8QDYJd3rt/x13SoqKkTI
 jKzFrGtueFaHWKEJj7OT6eDVdYDBI34u1XHoj7jLgSoKHlAx8SfnXoY6l1LHiun+OrRqOGo/v+R
 6/NoSufiekkDfMLLjsuYKEcu1SOAVsxhynnXeZjhnKiNsBJAWYLQCwYx3M8zo/O/6Rm6eZJOdoz
 Csp2QHMs7pfViljnOw+ld68t4lY+k9Wj0AaXZpxYF6xtyTuTnLEJJ10GSLJ3Qe8tQIYsbn5W0FD
 XzfiJbZjjK0oq9hAuUOcBh6VVnAl7hS2UQcSbVNSHpC3q7zJS8/ZXJkBT672xR8AJ7cIMgfBwOH
 zZjpfmsm
X-Proofpoint-GUID: r5uJAFNl0ZtT51drEVfGfxf6wGMoljaP
X-Proofpoint-ORIG-GUID: r5uJAFNl0ZtT51drEVfGfxf6wGMoljaP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090031



On 8/13/2025 5:37 PM, Konrad Dybcio wrote:
> On 8/13/25 1:56 PM, Krzysztof Kozlowski wrote:
>> On 13/08/2025 13:21, Konrad Dybcio wrote:
>>> On 8/13/25 1:08 PM, Sarthak Garg wrote:
>>>>
>>>>
>>>> On 8/5/2025 2:55 PM, Krzysztof Kozlowski wrote:
>>>>> On 05/08/2025 11:19, Sarthak Garg wrote:
>>>>>>
>>>>>>
>>>>>> On 8/1/2025 2:32 PM, Krzysztof Kozlowski wrote:
>>>>>>> On 01/08/2025 10:45, Sarthak Garg wrote:
>>>>>>>> The kernel now handles level shifter limitations affecting SD card
>>>>>>>> modes, making it unnecessary to explicitly disable SDR104 and SDR50
>>>>>>>> capabilities in the device tree.
>>>>>>>>
>>>>>>>> However, due to board-specific hardware constraints particularly related
>>>>>>>> to level shifter in this case the maximum frequency for SD High-Speed
>>>>>>>> (HS) mode must be limited to 37.5 MHz to ensure reliable operation of SD
>>>>>>>> card in HS mode. This is achieved using the max-sd-hs-frequency property
>>>>>>>> in the board DTS.
>>>>>>>>
>>>>>>>> Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
>>>>>>>> ---
>>>>>>>>     arch/arm64/boot/dts/qcom/sm8550-hdk.dts                     | 1 +
>>>>>>>>     arch/arm64/boot/dts/qcom/sm8550-mtp.dts                     | 1 +
>>>>>>>>     arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts | 1 +
>>>>>>>>     arch/arm64/boot/dts/qcom/sm8550.dtsi                        | 3 ---
>>>>>>>>     4 files changed, 3 insertions(+), 3 deletions(-)
>>>>>>>>
>>>>>>>
>>>>>>> This will break MMC for all of the users and nothing in commit msg or
>>>>>>> cover letter explains that or mentions merging strategy.
>>>>>>>
>>>>>>> Exactly this case is covered by your internal guideline, no? Please read it.
>>>>>>>
>>>>>>> Best regards,
>>>>>>> Krzysztof
>>>>>>
>>>>>> Just to make sure I’m addressing the right concern — are you primarily
>>>>>> worried about the introduction of the max-sd-hs-frequency property in
>>>>>> the board DTS files, or about the removal of the sdhci-caps-mask
>>>>>> from the common sm8550.dtsi?
>>>>>
>>>>>
>>>>> Apply this patch and test MMC. Does it work? No. Was it working? Yes.
>>>>>
>>>>>
>>>>> Best regards,
>>>>> Krzysztof
>>>>
>>>>
>>>> You're absolutely right to raise the concern about potential breakage.
>>>> After conducting additional testing across multiple boards, I’ve confirmed that the removal of SDR104/SDR50 broken capabilities does indeed affect V1 SM8550 devices.
>>>
>>> v1 is a prototype revision, please forget it exists, we most definitely
>>> do not support it upstream
>>
>>
>> You should double check. SM8450 (not v1!) needed it, so either it was
>> copied to SM8550 (v2!) by mistake or was also needed.
> 
> I believe that the speed capabilities are indeed restricted on 8550-final
> and that's why this patchset exists in the first place
> 
> Konrad

Hi Krzysztof, Konrad,

Konrad is right — this patch series addresses limitations seen on
SM8550-final silicon.

SDR50 mode: The tuning support introduced in this series helps ensure
reliable operation.
SDR104 mode: limitations are resolved in SM8550 v2.

But still to avoid regressions, *I’ll like to retain sdhci-caps-mask in
sm8550.dtsi for now and revisit its removal for future targets after
thorough validation and testing from the beginning.*

Konrad suggested placing max-sd-hs-frequency in the SoC dtsi.
Krzysztof, could you please share your thoughts on this approach?

Best regards,
Sarthak Garg

