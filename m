Return-Path: <linux-arm-msm+bounces-77097-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BFCBD793E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 08:36:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F1B53AE424
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 06:36:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 315A1275870;
	Tue, 14 Oct 2025 06:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GRPcsTi8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E2A1A294;
	Tue, 14 Oct 2025 06:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760423802; cv=none; b=OLot0qeNRD2TPf3VFUa4qcyHVRIe7iZCFpniKC2a2cGdc5dRWI9JomGT3eDr6lzNmvroaQ4ki27SGqhfto9JDt55BTMw3cG/DzuszomkNcsczfDUDpkXqUk7U81y+Rrlk5g1un+U4Ws/GEhmlX2xE0RJS+Q1ZmfShqieWfXXNq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760423802; c=relaxed/simple;
	bh=zW1Mvwcc6YZpYBcBXAqQw/2L7XYMglJpp72ucvn3WXA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=lSS4F7uFMF/57r9r/fc2CzTWRLtUYz+TTZnftLqB/n20oSAIh8Nosn41nm4E4530E3xEQQowttzpRUg05t2NZGO52fXKAlP3wuj6NuJ5fagOLkbBS2s7qLVYVnrqO8EH04g/RbXXnUOcX3WvoYJFu/Be5ni0Cy7pzAi/EKDHUQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GRPcsTi8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DHDDlc006284;
	Tue, 14 Oct 2025 06:36:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YmPM+9+/75wCotgzCr4OKguA9j5H6AUiPVPWPPGG0lI=; b=GRPcsTi8UzSgD/LN
	6IwwDWrstm3UoBYu/1vNZrYbqosi6EkualLYD29Qaz7TwMGiDVwEXiySLEaNsCz9
	CC+Je5gRsaPsDgoyogmCXiVJAsO1G0c7YV5f7Pm17Y9JwIQ+nHrjkXrVsgtnaRf6
	V+6he9ltqeSMDH1ssQ+pzsr0jobd1qsu2cTo1IkX5Gmd1E2wHR3ebsYVDGQ8r4kO
	EicIW1LHepYCYO0+YJRjtXd0jM4IqRSb7S/YJRDA5w57gHvoKlrEnGFJIe8LhAqC
	Enqw4KpN1pf0w7nvDkCwVuxTTDwoIJGLIQI5CQF6zXKZXvAj/Ik8FVlIt0cNPalo
	3cGSyg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfa87dyx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Oct 2025 06:36:25 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 59E6aOxC027189
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Oct 2025 06:36:24 GMT
Received: from [10.206.97.61] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Mon, 13 Oct
 2025 23:36:17 -0700
Message-ID: <3597f849-fe69-48a5-91cb-7a0bdc9f3e7d@quicinc.com>
Date: Tue, 14 Oct 2025 12:06:13 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] arm64: dts: qcom: qcs8300-ride: add anx7625 DSI to
 DP bridge node
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <robdclark@gmail.com>,
        <sean@poorly.run>, <marijn.suijten@somainline.org>,
        <andersson@kernel.org>, <robh@kernel.org>, <robh+dt@kernel.org>,
        <krzk+dt@kernel.org>, <konradybcio@kernel.org>, <conor+dt@kernel.org>,
        <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
        <rfoss@kernel.org>, <Laurent.pinchart@ideasonboard.com>,
        <jonathan@marek.ca>, <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>,
        <quic_rajeevny@quicinc.com>, <quic_vproddut@quicinc.com>
References: <20251006013924.1114833-1-quic_amakhija@quicinc.com>
 <20251006013924.1114833-8-quic_amakhija@quicinc.com>
 <vj3pwikzgbflzwqwkbvdfac44llinsmrhrqnvu6gx756xz4h3e@2lspa6zx5xgr>
Content-Language: en-US
From: Ayushi Makhija <quic_amakhija@quicinc.com>
In-Reply-To: <vj3pwikzgbflzwqwkbvdfac44llinsmrhrqnvu6gx756xz4h3e@2lspa6zx5xgr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 6pIeDMGhl_gS_o6TMR0FwFETliOFXVvM
X-Proofpoint-ORIG-GUID: 6pIeDMGhl_gS_o6TMR0FwFETliOFXVvM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxNyBTYWx0ZWRfX8+f5m85/e0ML
 o1/2mu/K3/i1saQEyo+Ee5r64okh9WUzfdl9pyIFX13dbl/8fAEXygTo76rsIpicr21tNOEIxUP
 witDx10h3ERatrZa3q4LRUrXoUL4KcdzJ/bS64aF+ofQtTG1p+hu4pJZVrVsOoynD2x+urZg1d/
 GQT7zKC1wzqXfwfS0Os8F6ktm8mwbJshBiNBoEWPubv4VqQLRwgSAJKt+L+qY5xxbDpA26T2zos
 9NTUzkn8tpMW+GIPogXSnbuiTCpNbLdWZQYUHF9FzBpKnHP4byOixM17HYZHifGEf0pPuNoPDw1
 60JA9NDN3QkuSd+kPE9+XLFbwQWLIMMFBcLTBaYuSIzzFxpVIOORhOS0nFd5GjTcgpYLwyQu3me
 lrSBSWhsdL+toYtAj0glnXJG8pFNSQ==
X-Authority-Analysis: v=2.4 cv=JLw2csKb c=1 sm=1 tr=0 ts=68edef69 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=ifKuFezDO-Mh6WUAf3UA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
 a=nl4s5V0KI7Kw-pW0DWrs:22 a=pHzHmUro8NiASowvMSCR:22 a=xoEH_sTeL_Rfw54TyV31:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110017

On 10/6/2025 3:46 PM, Dmitry Baryshkov wrote:
> On Mon, Oct 06, 2025 at 07:09:24AM +0530, Ayushi Makhija wrote:
>> Add anx7625 DSI to DP bridge device node.
>>
>> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 170 ++++++++++++++++++++++
>>  1 file changed, 170 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
>> index 891e49602c97..5d4040376857 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
>> @@ -24,6 +24,64 @@ chosen {
>>  		stdout-path = "serial0:115200n8";
>>  	};
>>  
>> +	vreg_12p0: vreg-12p0-regulator {
> 
> Why are these nodes not in a correct place? Also, why are they named
> differently from all other regulators in this board file?

Hi Dmitry,

Will keep the nodes at their correct place based on alphabetical order in next patchset.
Similar names I have used in LeMans for these regulators. We have kept these name based on the information of these regulator we got from SW doc for monaco.

Thanks,
Ayushi
  


