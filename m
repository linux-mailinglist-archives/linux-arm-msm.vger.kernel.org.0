Return-Path: <linux-arm-msm+bounces-67624-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FFDB19AC7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 06:40:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD3D917177B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 04:40:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3109F2135D1;
	Mon,  4 Aug 2025 04:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jMa7M094"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920D12E36ED;
	Mon,  4 Aug 2025 04:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754282404; cv=none; b=mnRAoKtKFZLB4buSxO6sh2TkH7TOKfTP7DzbXrqhn8pxMNadsuiuKyuZ/2vTq6feMjny1k2xkIe2Fd/bxQtgKdH4L5CaqkmX/6vTEir5RJhgTnwfSDPB+Zg77kjlyJRxHmX4bzrOzMPxENZzTT9vpdsWoUoaQKgZsVy0H/C2Wc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754282404; c=relaxed/simple;
	bh=vsPqsM5kqGgsUq4VouaCwYfOemzos981oOXZcrNXCuA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=DaEIv+gNLCrWO8aG9BsVtyOf4oNzTvN57kAVHfH18Shp4D09Rwib2w3zGHUROo/1fi4l1ATiqTRcy3c/ixAEvGftOBrTpM0RKtwaMworSmKJnpkgUdcyul4+AHdVWJKREqUhvUTWKEfaD8ZNzSrDWWCw+cue4pSHGsQSK8X4ijo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jMa7M094; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 573Nm2ur030769;
	Mon, 4 Aug 2025 04:39:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zfMQjfbLh+UWmFf1vkrGIwDMEQENS0ViYVm115Y0Omg=; b=jMa7M094X08fiEGH
	PxZQWnRXmQcVn/HOFICeIs+PycUT7g+PvJe1rl/830ZP5RlmT9fJjwaGp8gTUeXs
	avd0SzFnB4EQGSw7fEgMUycar7os0OtIm2pzijGSSDSn0lAntrpyOYE9GvYG99kA
	1b0wM24I3ZNyWsGEoYvDwnNwkUspzf4MH8BBX4KHBcb8l0gdNGrLd+5W8Af/LUxl
	VgIg/agV5lRTMQLDScYzuH5Ron2gBEBnQrXwpyAv2i0h99za6GSwVnE07TtXDBFY
	PS2JgU9J3BldId69WUCdx9dFzYvWc3HNubySJG+yziWkvOoG4IBf314YppyRzTN7
	Y62PiA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489arwkfyv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Aug 2025 04:39:59 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5744dwXc028243
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 4 Aug 2025 04:39:58 GMT
Received: from [10.64.68.119] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Sun, 3 Aug
 2025 21:39:55 -0700
Message-ID: <d6559256-81e7-475f-b91f-04ae237a92f1@quicinc.com>
Date: Mon, 4 Aug 2025 12:39:52 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] arm64: dts: qcom: qcs8300: add display dt nodes
 for MDSS, DPU, DisplayPort and eDP PHY
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250730-dts_qcs8300-v4-0-5e2dd12ddf6d@quicinc.com>
 <20250730-dts_qcs8300-v4-1-5e2dd12ddf6d@quicinc.com>
 <f3aeacf5-f178-4e61-b34a-60353f89daae@oss.qualcomm.com>
Content-Language: en-US
From: Yongxing Mou <quic_yongmou@quicinc.com>
In-Reply-To: <f3aeacf5-f178-4e61-b34a-60353f89daae@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDAyMSBTYWx0ZWRfXz7yI/5cLV4cN
 AAknikvWqmfiwerkFED0fEqmTnf0+Pfymv5IoXAt4qMaKwO1bL2e7OKsGw4jGCaJXkA+/mKGaqY
 YWbHLL6q5q6CwglH4zixxhwVlBxha0hWBAMgdFTUdGCmKmVqtWuB0b8v+Iya2vRCWItQT4NsjTS
 3o0h+EUK4mZrCoJszc3AfYJ3rlwTTNtYllA6Bjvu4dkNHlgK8H+AkwIdpN3PvNq7/Yt7WLxBWSv
 UXGuKO+9iHiJ1hIaWwfuakspyippISUbBhYEpldUc3eUfJMSLrBs4ngFkq8W572z7VaQt7Cdw1p
 Qt9ivHYC3CM0akrkvth2EfQ27LLskD/JvtBYAYmEjYPRaO0QHhDLYFdlEfA/G6gwuRTCa5YOjth
 Tlb85dpepVFf5gkvBuO7kIzNffjJhqBkQqeY7lI1RswgIWVI7asXTs5kei6MFfJyg0EMFFv4
X-Authority-Analysis: v=2.4 cv=We8Ma1hX c=1 sm=1 tr=0 ts=6890399f cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=vMr85nfYEXAW92xGcFIA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: W8MIQX6Tb6oD4ozZZfJhB-rDVkdKApi9
X-Proofpoint-ORIG-GUID: W8MIQX6Tb6oD4ozZZfJhB-rDVkdKApi9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_02,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=687 malwarescore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0 mlxscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508040021



On 2025/7/30 18:25, Konrad Dybcio wrote:
> On 7/30/25 11:49 AM, Yongxing Mou wrote:
>> Add devicetree changes to enable MDSS display-subsystem,
>> display-controller(DPU), DisplayPort controller and eDP PHY for
>> Qualcomm QCS8300 platform.
>>
>> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
>> ---
> 
> [...]
> 
>> +
>> +				assigned-clocks = <&dispcc MDSS_DISP_CC_MDSS_VSYNC_CLK>;
>> +				assigned-clock-rates = <19200000>;
> 
> is this necessary?
> 
Emm, i try to remove assigned-clocks and assigned-clock-rates here, 
device can still work.. here we just want to keep consistent with sa8775p.
>> +
>> +				operating-points-v2 = <&mdp_opp_table>;
>> +				power-domains = <&rpmhpd RPMHPD_MMCX>;
>> +
>> +				interrupt-parent = <&mdss>;
>> +				interrupts = <0>;
> 
> interrupts-extended, file-wide
> 
> Konrad
Sure. thanks~


