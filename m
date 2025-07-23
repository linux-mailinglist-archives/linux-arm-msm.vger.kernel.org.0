Return-Path: <linux-arm-msm+bounces-66216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9F3B0EE59
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 11:24:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8196E9676C3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 09:24:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9251288C8A;
	Wed, 23 Jul 2025 09:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dmL/ImZW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0932286888;
	Wed, 23 Jul 2025 09:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753262670; cv=none; b=d43rjYL85lzfGXXUznws62LWKcNQum8uXOn7Ip1TJCGZaCyvacCAiQCBIVfjUTtzHwcQArMYHjHVk8KNWwHqgXoCf4XtcvIZyoEqfhdfbBam37ZPD0uYin8QLYRJ0e/XKgZqI59RgM4oV4IYBnlcO8xZyVlyL6QIgTlipmqleaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753262670; c=relaxed/simple;
	bh=jbXkaT66+gpJy6fC2JJhYF2uNeh2bMTCPpzGLGBU/R0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=AwbbnPvN0+/fciltDmozv0HlD1TXOdfFCWaGaj/L7B6vuiSIl4wPK8qaxOg2yliwLLIpA+xuGpLXXU0kbC99/bklX07+H39l3jZGFnc/7qQHXvqfYOWkCPD+0RwAC5rq5JGJeDoXVt1ghe3HA/ugm8e+rsrRkneVxS7XI1DpSfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dmL/ImZW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MMO6u3019720;
	Wed, 23 Jul 2025 09:24:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0Hvuvy0wV2wPQIy3Q2vMUB1zrcW3JjDh0Lrc3Qw9BXo=; b=dmL/ImZWw66L2Jar
	XbZiVBFfN0L0K5VAp/IKQlxN8xbinRjImC3zeKbYrdzEZVSiy8S9F7x/UMAmMFLF
	scITSRzWELGgCUMBF0qVMVHLsdBx1jVRhh3dw0O4Lleim9LLKROBBlzs48UW4OKh
	QKTZ9eWPbTqQInjDH/IYk/Nd5ZPbnWpZ1+ktkzhkipuU22q6iuFrTQAEEBJZx8nh
	MuoxpmLeZVq7li6Mhk74iPlG8Ls3aMG+EvIAz/ENLbAo6oIYhSz2nG/+RIlP4qew
	rqJtxOdXrDTrBTNxNp9oGHeaj7tHvc1dhGnrh3c5rReBTbcN+J6cJQqPuszqRe3/
	Dl7bTw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481qh6pspj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Jul 2025 09:24:25 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56N9OOf7004853
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Jul 2025 09:24:24 GMT
Received: from [10.64.68.119] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 23 Jul
 2025 02:24:21 -0700
Message-ID: <7baebfcf-3afd-445c-ab88-a8ca503c2e33@quicinc.com>
Date: Wed, 23 Jul 2025 17:24:18 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: hamoa-iot-evk: Enable display support
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250723-x1e-evk-dp-v1-1-be76ce53b9b8@quicinc.com>
 <ad436d4f-dff2-4063-9b9b-e1218f6dc3c7@kernel.org>
 <aa18a24f-a16a-46a1-a66c-732999acb63e@quicinc.com>
 <f5f30f4e-50ee-4539-893b-4a7667a16651@kernel.org>
Content-Language: en-US
From: Yongxing Mou <quic_yongmou@quicinc.com>
In-Reply-To: <f5f30f4e-50ee-4539-893b-4a7667a16651@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=CZ4I5Krl c=1 sm=1 tr=0 ts=6880aa49 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=0ochVkNWXur7tueVziIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: SApVIETixLDH1TcJlCfVjhN4SaeVXP4Q
X-Proofpoint-GUID: SApVIETixLDH1TcJlCfVjhN4SaeVXP4Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDA3OSBTYWx0ZWRfX3r4q8CCvoG+g
 F0U4U3iUcvCOSnyW3HYp5CvDwn886O++ohaiPxRKSrgKmG9Kcl+1FrGpwFlu5MvmLPnWjfSqQLV
 7RJR32orfzAma6uCckLVjgAC7rDe8yWeskDB4PQFzWyPT8/59bgLYWGHjrskQzta8qyT70ZOOF+
 9nNYL12BftrlrnHMBaTvisegwQ2iB06Rz4yawRFH1xXDyRFAeL/8fBdFKw1MAdun2Aw0Wa5uKlM
 6Uq4rGolITvL9/QFif0R07GPWMVlZ09iPsBy/hmTo88osQLFnqxVPk8yCvcXnKMInaV4t/NIXG3
 I1VRjME1+vyNlTTG3y5u/8le7+oTW1JjTXPtGnlURzh4PBKYKOdYEajU1fMWDaOdHpx2w+gbOla
 Xq1Jo/LYckCoEUHIZLdMp/NFHq7/uQwWZcTAzveAEjEKUEzy/m8nQdqnNU7ktIy+vPXKoxa9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_01,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 mlxlogscore=651 impostorscore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 bulkscore=0 spamscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507230079



On 2025/7/23 17:08, Krzysztof Kozlowski wrote:
> WARNING: This email originated from outside of Qualcomm. Please be wary of any links or attachments, and do not enable macros.
> 
> On 23/07/2025 10:08, Yongxing Mou wrote:
>>>> ---
>>>> This change made top of initial DTS:
>>>> https://lore.kernel.org/all/20250716-hamoa_initial-v1-0-f6f5d0f9a163@oss.qualcomm.com/
>>>> ---
>>>>    arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 156 +++++++++++++++++++++++++++++
>>>>    1 file changed, 156 insertions(+)
>>>
>>> Just squash it there. Why are you posting knowingly incomplete DTS just
>>> to fix it later?
>>>
>>> Best regards,
>>> Krzysztof
>> Hi, sorry, I'm just want to enable display based initial DTS. Should
>> this patch merge into the initial DTS?
> 
> 
> Yes, initial DTS is not merged and being reviewed. Adding new board is
> one commit, not two.
> 
> 
> Best regards,
> Krzysztof

Got it. Thanks~ will merge into one patch.


