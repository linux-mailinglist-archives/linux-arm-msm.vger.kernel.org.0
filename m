Return-Path: <linux-arm-msm+bounces-72243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94EB7B4543D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 12:13:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 408FB16AA85
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 10:13:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6B7D2C15B4;
	Fri,  5 Sep 2025 10:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Scfbw+ef"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60D129DB6E;
	Fri,  5 Sep 2025 10:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757067233; cv=none; b=ZXnn5yEGsny3BeagYfvgDbtnBi9mDBq+SXx5OicrIx8OKeLRXYmoU7QaJ6+hZEB1Xnge8pB/D/DgsIJdIRc+34H27N9+4ofhFAmpd53pX4FFYIjxfgLw4KRwW8Cx4EG2fONvLpGWYpytxBTbsQ8zdPtq/AMewMS3GnBJ7iZXzRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757067233; c=relaxed/simple;
	bh=LRuKOaO+n2yIjuT/h9x09zHrpQzEh/obHoMz5tG+wOw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=WIPPzYc4h0uvYxh5C6DDxD6Hp3k5vS32oA8nt+6YEUjnKIl3O68jZzJwoXjdHU7FmgWaM249LIMx1zU/5p2/AnMdV7GT0dfD8xrc//pnyJS3SkCzVNdA44yaNtLL3+Yb1IAgQy+ycmZ/UDEf8ksGFUX1Q0Ka6veK23XbvDBlqpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Scfbw+ef; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5857Cr4X003768;
	Fri, 5 Sep 2025 10:13:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XJFvL0RqazroZaBBv1+xKznzKr6wxnr8iimAKhuAKOk=; b=Scfbw+efdQx7v78u
	3H3CNS4WGUAxEJvkBjO9JBrS2mkidUq/qTto08EshBvfGHdP117FyNFH1z1M26RS
	x+gpspxjM4cGme/3XACoD8OgAhN3ZCxEUhrxtrsq4yLYFRaPVWfDyFDcFKhALxPv
	OiBOQQWqKvvfNtk0NSXDva9DEq3fj0yJfocX2rceTR9GpQjMgqFN0dkQ/7VKc/3Q
	Bc6Kyo0fIMaNNg8dvK0S7/aGY2Mla0/u7eMN9fIDBOaZdnOp3U0BWUwe+a8fRYBO
	OvLwgaUra0KcQ688aO3JB9T7yTsDJ2hBHo3iXaqwlKNxPl0pJFrAGlXXMAKVdIcA
	qBIkIw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ur8sauv1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Sep 2025 10:13:42 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 585ADgOm001637
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 5 Sep 2025 10:13:42 GMT
Received: from [10.217.216.168] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Fri, 5 Sep
 2025 03:13:36 -0700
Message-ID: <33610903-8dbf-4c34-b0cf-406640ff98d4@quicinc.com>
Date: Fri, 5 Sep 2025 15:43:33 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 4/4] arm64: dts: qcom: sm8550: Add max-sd-hs-hz
 property
Content-Language: en-US
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
        <quic_nguyenb@quicinc.com>, <quic_rampraka@quicinc.com>,
        <quic_pragalla@quicinc.com>, <quic_sayalil@quicinc.com>,
        <quic_nitirawa@quicinc.com>, <quic_bhaskarv@quicinc.com>,
        <kernel@oss.qualcomm.com>
References: <20250903080404.3260135-1-quic_sartgarg@quicinc.com>
 <20250903080404.3260135-5-quic_sartgarg@quicinc.com>
 <6deac56f-e21a-4447-bfa7-a414084676b8@kernel.org>
 <be87fb2f-7036-4039-8ba2-63d54a9ae732@oss.qualcomm.com>
 <23c29fb7-c0a4-4519-9b8d-e68255b83a10@kernel.org>
 <a304ec1c-7364-4926-8763-8c731e461eb9@kernel.org>
 <d12957f0-f8b5-4b29-967c-576dadd565de@oss.qualcomm.com>
 <d2d9d5fc-27c4-4a5c-8ece-0f2e8b7030e2@kernel.org>
 <18092427-3a4a-4fb2-9f75-675de98957d4@oss.qualcomm.com>
From: Sarthak Garg <quic_sartgarg@quicinc.com>
In-Reply-To: <18092427-3a4a-4fb2-9f75-675de98957d4@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAxOSBTYWx0ZWRfX0+XO4CQZ3x+2
 L82p59wmWOn/dgxfKJ5iiTdfedDj/0h7KJZ8F6ajbagI8W3iLJmBHn/OM/tU6csCrdPbJrLg2Cb
 C+i+QkVyATK3XfbzQjxuQkSsGOhhW4LsZe2HMEgUnJG+VN4aiL9q0wWsvUf8MLxhokVD81Yao8n
 /ttly0uubyLy1ezIpw2vZs4IG1Nd831BLpXwXpl7/MV5M5kFJIi3KYQM8hmNK2S0fviCdn0iwFo
 aS9PFfcBHeHNAovYrp3t4eMq8rbNl9DOYtCQ3QEYM9Mdl7Ij0dkroYqShddNaPjXZWvqYzsWGEd
 g/9B3kfpqv6dTYCuoyfSwoJrVNFoRxnHwMyU+N+g+3Rx5O2v0OncRw+PmlbdPt37JiB/jgAUGnj
 hMzJwydf
X-Proofpoint-GUID: -dzS8_b23Lj0NMGLTPl02ceOtPbMOzDN
X-Proofpoint-ORIG-GUID: -dzS8_b23Lj0NMGLTPl02ceOtPbMOzDN
X-Authority-Analysis: v=2.4 cv=PNkP+eqC c=1 sm=1 tr=0 ts=68bab7d6 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10
 a=zTRmu9PctcSeQRTcj_MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_02,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300019



On 9/4/2025 8:20 PM, Konrad Dybcio wrote:
> On 9/4/25 3:07 PM, Krzysztof Kozlowski wrote:
>> On 04/09/2025 14:27, Konrad Dybcio wrote:
>>> On 9/4/25 12:52 PM, Krzysztof Kozlowski wrote:
>>>> On 04/09/2025 12:51, Krzysztof Kozlowski wrote:
>>>>> On 04/09/2025 10:36, Konrad Dybcio wrote:
>>>>>> On 9/3/25 10:21 AM, 'Krzysztof Kozlowski' via kernel wrote:
>>>>>>> On 03/09/2025 10:04, Sarthak Garg wrote:
>>>>>>>> Due to board-specific hardware constraints particularly related
>>>>>>>> to level shifter in this case the maximum frequency for SD High-Speed
>>>>>>>> (HS) mode must be limited to 37.5 MHz to ensure reliable operation of SD
>>>>>>>> card in HS mode.
>>>>>>>>
>>>>>>>> This is achieved by introducing the `max-sd-hs-hz` property in the
>>>>>>>> device tree, allowing the controller to operate within safe frequency
>>>>>>>> limits for HS mode.
>>>>>>>>
>>>>>>>
>>>>>>> Probably we will now replicate the same discussion... And it will be
>>>>>>> happening every time you send the same and not reflect it in commit msg.
>>>>
>>>> Just to emphasize this - it will happen EVERY time.
>>>>
>>>>>>>
>>>>>>> Bindings say board setup, this commit msg says board config, but the
>>>>>>> patch says SoC. This is not correct.
>>>>>>
>>>>>> Both are correct, looking at the problem from two perspectives.
>>>>>>
>>>>>> The bindings description mentions board-specific limitations (e.g. because
>>>>>> "the board's electrical design does not allow one to achieve the full rated
>>>>>> frequency that the SoC can otherwise do, in a stable way")
>>>>>>
>>>>>> Here the author tries to argue that almost all SM8550 boards are broken
>>>>>> in this sense, because the reference design did not feature the required
>>>>>> passive components, making most (derivative) designs sort of "broken by
>>>>>> default" - and only some (if any?) vendors decided to go with the
>>>>>> additional components required to lift this limitation.
>>>>>>
>>>>>> This in turn makes it fair to assume the developer experience would benefit
>>>>>> from having the SD card high speed modes always work (with the slight speed
>>>>>> cap which may not be required for the 1 or 2 designs that took the extra
>>>>>> step) without each board DT creator having to track down this property
>>>>>> separately.
>>>>>
>>>>> And then if you send same v3, I will ask the same. Can the author
>>>>
>>>> v3 -> v6
>>>
>>> So, would you be accepting of this patch if the commit message was:
>>>
>>> arm64: dts: qcom: sm8550: Limit max SD HS mode frequency by default
>>>
>>> Due to an implementation detail in this SoC, additional passive
>>> electrical components are required to achieve the maximum rated speed
>>> of the SD controller when paired with a High-Speed SD Card. Without them,
>>> the clock frequency must be limited to 37.5 MHz for link stability.
>>>
>>> Because the reference design does not contain these components, most
>>> (derivative) boards do not have them either. To accommodate for that,
>>> apply the frequency limit by default and delegate lifting it to the
>>> odd boards that do contain the necessary onboard hardware.
>> Yes, it is an excellent explanation.
> 
> Sarthak, if you believe what I said is accurate, feel free to copy-paste
> as is
> 
> Konrad

I’ll incorporate your suggested wording in the next version of the patch
to ensure it reflects the discussion accurately and avoids any confusion
going forward.

Appreciate your guidance!

Best regards,
Sarthak

