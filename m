Return-Path: <linux-arm-msm+bounces-55463-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA86A9B40A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 18:31:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4AAA5165DA8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 16:30:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1135228DEF1;
	Thu, 24 Apr 2025 16:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bwicXPBH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD6728D83A;
	Thu, 24 Apr 2025 16:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745512118; cv=none; b=a6EWtgehs5NlMhlleoMrlPVHgtBhxcz7rc5tdt4aQhJyBy8q6NKZvIGNJhvq/HhYMv8h0crugZ9X3CYUB9vIVVewwp0+Z4cuL4casheq8OndOwOdP1ilqNazMdU6KputHxfOIJE5V3VWNT9UpUebVXQoQdZlI5NYr2NHpjNwB0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745512118; c=relaxed/simple;
	bh=BsFj/Ag+vJMcdVSGnGPUr5UdZkAX0WK0nHct3fHTc/w=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=F5w3HxvXn4PCL8/cTYRqrLXlw9YIhNSmN/ulMCq0blqeyx+sd2SUqEnX51QCE8lkMnXBxx2LBGHq9ACUoPeG5rMnjvAbEZ56EVN/yy+K1yVtWx61wy+b1If1k9eFp9jR/a4hvnorQaNmavadYvBAJ9SxJm1iZ7GZubJYTF27jD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bwicXPBH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OC3DpR016250;
	Thu, 24 Apr 2025 16:28:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BlorimMULb+8kz3lWeMKC2xv+9sTTpBrY2NOBLIkBZw=; b=bwicXPBHEQ0YKLiV
	zY0gBg18cRxxnH0uQIswnf9iJW3gww0sD4eR9dI8sETecnhX9J2RA2nowgAtPA/v
	QKNgR2Apzq09y5bVIboBxH2T+X+k/p7z5cY49dc9TD3Ok4wil6CzP1SAEM/QvTck
	dh+NG12OnV9oi3udzdP8gUvPAG351WUts+93GfUl7Fuj3uEv/KdD1qcmO+WRKXkz
	ZZM44b60VO+D3ZYsDIyULiTBheTJ3tLlMdXQBchpn4S6x8z9SHWxTXEb3wVe7hbQ
	1koyXYAW66Nuh2Anze+mJNEYvK49kRCppqDJcI/PKGJrwmT05PuV2UAXBizatoKK
	YoCMQg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0ec79-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 16:28:21 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53OGSKTp015600
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 16:28:20 GMT
Received: from [10.216.17.18] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 24 Apr
 2025 09:28:14 -0700
Message-ID: <dfa2ed59-ba7c-4cb4-ac78-97f3de716b9b@quicinc.com>
Date: Thu, 24 Apr 2025 21:58:11 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 00/10] Add support for videocc, camcc, dispcc and gpucc
 on Qualcomm QCS615 platform
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>
References: <20250424-qcs615-mm-v7-clock-controllers-v8-0-bacad5b3659a@quicinc.com>
 <94a5f0d7-b152-4fe3-b312-a0f7792cc076@kernel.org>
 <8552c048-df45-49ba-83b3-5c39d4b770fe@quicinc.com>
 <3bbef5c3-1859-4a4a-b25a-83428dc15e98@kernel.org>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <3bbef5c3-1859-4a4a-b25a-83428dc15e98@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: HBUMWYhRGfGqFB9-xVhwgCMrFGT5TG-r
X-Proofpoint-ORIG-GUID: HBUMWYhRGfGqFB9-xVhwgCMrFGT5TG-r
X-Authority-Analysis: v=2.4 cv=Fv0F/3rq c=1 sm=1 tr=0 ts=680a66a5 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=P-IC7800AAAA:8
 a=qte3l9YSZrOXRyZcDLIA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDExMyBTYWx0ZWRfX7N+c4nog+brz U0ur3pelvHTIqty9CEytj/4bj743UeFsyNecVVGRNVbu1/qDM/lV3ykKCxohRKoa7blWzR/kNut K+joOk7cddiTQM849C4JcA7SqQG4AMfBN/NvO74QZlzu7BJHYjHDXD1vliEScrPo9b1TQXjnVBV
 B6+yw9a8UUjA8TIk/rk9ShhiLWOVSoBxPITAMIWpRiLUfpWnd+sXElp5IfqA6LtOtdsMEQwjWXU e2LZ0YKNC/ClCWOL7Yju37Ig28JNWCvPsCP5PHEa5jZg2uSF6thaY2Lj61bHw1qKBbsPc6lmwAU cKmf5UkHRXB20p6qq5FRYBfH9T83OS1rsCIrlk1ZfL01/sj01i3l67P1CuIh9Idjpbo9aWSExn/
 RicMEsNk5BrMz0ZYw+FlcKqspvhf4qg31F92x41JLTlSDdH2NBAoKWuPEAaFOsUYbP0X4+7G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-24_07,2025-04-24_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 suspectscore=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240113



On 4/24/2025 8:59 PM, Krzysztof Kozlowski wrote:
> On 24/04/2025 13:13, Taniya Das wrote:
>>
>>
>> On 4/24/2025 4:40 PM, Krzysztof Kozlowski wrote:
>>> On 24/04/2025 11:32, Taniya Das wrote:
>>>> Add support for multimedia clock controllers on Qualcomm QCS615 platform.
>>>> Update the defconfig to enable these clock controllers.
>>>>
>>>> Global clock controller support
>>>> https://lore.kernel.org/all/20241022-qcs615-clock-driver-v4-0-3d716ad0d987@quicinc.com/
>>>>
>>>> Changes in v8:
>>>> - Drop the properties which are already covered as part of gcc.yaml [Krzysztof]
>>>> - Drop the RB tag for dt-bindings for Camera clock controller.
>>>
>>> Why?
>>
>> It had comments, so wanted to share the latest RB-by.
> So there were some comments and that's the basis to ask to do review
> twice? So anyone can comment on anything and you will remove people's
> review? I am not going through this again.
> 

It was your comments, so I thought it would not be good to keep the RB
tag if it has so many comments. That was the reason to drop it.

> Read carefully:
> https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577
> 
> Best regards,
> Krzysztof


