Return-Path: <linux-arm-msm+bounces-68964-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C22D2B2480A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 13:08:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0664117816F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 11:08:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 313ED2F6586;
	Wed, 13 Aug 2025 11:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="U5uCGNiO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421502D060C;
	Wed, 13 Aug 2025 11:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755083308; cv=none; b=ZblI5Pvx9dUj5JR3F0hv4tPuVqH9O/BQMP/zVVj3KBhaYBy7ZJV3nYPw+63DAQXZNWaW3Z5YuQ+B9gv74I1rIJvUI2zDjlxayuXZpho1d3ImJ0aH/dy7fIgPjUiQmrWa51SoqjQ+wuviIaR9WAFVLTU90o+ZyDHnHI6+8lKRMPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755083308; c=relaxed/simple;
	bh=agLW0VIDcUGVqtF+PXqlqKoUZfF/53CioVgWfMwAxpo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Y6nNU1ktOTUoDaeGGklHl2Tt2N2Yrm41qwNdjPti0NZrdRM3S/bIgcy1vM5x7Bsv4oWsd6A1zRmywrgrSWw0wO2qorb8pUCdqZbaaBmIsegF3UzyKnlUkSs40J9M+t6rLhrQj5ASQ11Z5vy8/kbIyelgqvx1irxd7CZOkBwA97U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=U5uCGNiO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57D6mJlR008724;
	Wed, 13 Aug 2025 11:08:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eSJS8iaPgTC+NMg4WjXp7ShROEazviRD3VPvqnJIBbA=; b=U5uCGNiO4KmIu6qv
	+OLEsZrxQmGVFgmbBz0pWnhCnTXq2stiedu4MgSg5L9KsM/AsTXIt69WzJg8v+E5
	E368aovOlIAw6pJppkNqUd42ubxJ/qR3G7LVGcdQnRkhSc4hEkAzJD5tFBU7W4Fv
	KwCFTuWhPSel0qBrCgh5JMuTqLvRA2VjECARWt4bdVa6ryOrkGokSQqxXVHrhNOI
	4x3Pbhv9Ed5KwXu91hR/wRDjT43sUYJjWuIjChUWj4oP1fHe7tDoV1MOt2RKgdZA
	Ol7m9IBGV/UQwyC3lUxxcxp41UtrRYuXwwr4Xf0MOn5+4fXpdJuxmlbIm6DEz5A+
	CTUBhg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fem4fg51-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 11:08:20 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57DB8JOF015501
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 11:08:19 GMT
Received: from [10.206.107.4] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 13 Aug
 2025 04:08:14 -0700
Message-ID: <ab5d3811-9fbf-4749-9463-4457fbf50023@quicinc.com>
Date: Wed, 13 Aug 2025 16:38:11 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 4/4] arm64: dts: qcom: sm8550: Remove SDR104/SDR50
 broken capabilities
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Ulf Hansson
	<ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Adrian Hunter
	<adrian.hunter@intel.com>
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
Content-Language: en-US
From: Sarthak Garg <quic_sartgarg@quicinc.com>
In-Reply-To: <8b023e56-435b-43df-8b15-c562a494e06f@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: CX22bScD_SV7lCuBYIpCB4sFzipBqTpI
X-Proofpoint-ORIG-GUID: CX22bScD_SV7lCuBYIpCB4sFzipBqTpI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA2OCBTYWx0ZWRfX98xLFV266QbX
 m27GIrJhSGb85YleytGJ0sQtrACMSDLz2lJ9QoDSGFvL1IjUV8jzFpWDdwJ6Pf35WJ5HWUvIU7N
 yEppGUGTbYsYOFqHBCLPlynigAx0A3xSUKyh9BmYGe3ubhPVn3/mA2VFSTLtsUJYjG/WYMgteTP
 mjmuowFZxJB7ndNXUuWDGF8mi+RSurRoahyot3Pj257xkyj0Ivh8Ofq3QEkCoZX9wozlDmlwj/s
 1zxKaTlg3P3EAg8efJvTzcx4WbHTp4whNwyfIxkvKHE8G/N+u1My3TrR5HENQsiBec/vLPB/WT9
 yrK+K6Gu8YgkEjl8vcj8z66TM71mWqDUw+iZhR35AzeDyDsA7as6whxe7UHWhi8xdrtYzzdWVtq
 xyZ6Yizv
X-Authority-Analysis: v=2.4 cv=YMafyQGx c=1 sm=1 tr=0 ts=689c7224 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=7vkX0yn46oB1UrFKko0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_01,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110068



On 8/5/2025 2:55 PM, Krzysztof Kozlowski wrote:
> On 05/08/2025 11:19, Sarthak Garg wrote:
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
>> worried about the introduction of the max-sd-hs-frequency property in
>> the board DTS files, or about the removal of the sdhci-caps-mask
>> from the common sm8550.dtsi?
> 
> 
> Apply this patch and test MMC. Does it work? No. Was it working? Yes.
> 
> 
> Best regards,
> Krzysztof


You're absolutely right to raise the concern about potential breakage.
After conducting additional testing across multiple boards, I’ve 
confirmed that the removal of SDR104/SDR50 broken capabilities does 
indeed affect V1 SM8550 devices.
However, on V2 devices, all modes—including SDR104, SDR50, and HS—are 
fully functional and have been verified to work reliably.

Based on your feedback, I will revise the patch to retain the broken 
SDR104/SDR50 capabilities in the common sm8550.dtsi, ensuring no impact 
on current sm8550 devices already in use.

We will revisit the removal of broken capabilities dt property for 
upcoming targets after thorough validation and testing to ensure no 
regressions from the beginning.

Please let me know if this approach aligns with your expectations. I’ll 
prepare and send out a revised patch accordingly.

Best regards,
Sarthak

