Return-Path: <linux-arm-msm+bounces-56752-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DD739AA8F5D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 11:22:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 52705175146
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 09:22:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04FC41F3D2C;
	Mon,  5 May 2025 09:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="il3ouxPM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3368313E41A;
	Mon,  5 May 2025 09:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746436949; cv=none; b=jM5MMyug4vWeMMB1LUAxsizNuNqh5r22ji5UedeW+k/OL8Bor74tvrH4FY2SIea3nNcgRVHbswxDxybCkKhFijoMFxNulOR8/x/gMABWVA+ma23le/qj2+Z02elE+ThXzgddSI3LAO8vfxGfCL7zWAGI7Bj3vb0sUSex2Orsns8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746436949; c=relaxed/simple;
	bh=4PPmKt8IuhKlMpBTvl8losUbw3pKFTJ9SWl59nts+x0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=AJxTuURS4yJsf/By6azzwKd+A2VbohUF5iLHWumwEHCeeXH0ZvCXxWy1khVQikMVTKfjxH4JRiPvONMrv8ETypcI9VzJeb0fb4izMA0wZhXWuvMs4wjtmaj/7wslW/GZuLy/ezauOJKZKsdMH4v2xEL20gSxw4YAkFowWK8jSUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=il3ouxPM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544NVdZV014482;
	Mon, 5 May 2025 09:22:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lXNQXYb5NPbFeM8ThHXJaleH2ashWd2spg6TCDzP+vw=; b=il3ouxPML3OgCM53
	WdBbupHxmavG7WvLfC72uSS5BPDLtN/qoDHpuyi2W7DrKoMnLVEh/MgqgY4GJX/5
	MZbDXMuGC6DkJhOHYxcB0e5sNADWjVDTG1uN+cxe8bXkKt+Hwg0LQPRhPbp3rca0
	ShcnlSncEt5Z+aeeOkIej1DqtTwXKA9W4+p4d4tayZRm+wdWiwGs/XPRdNnapiBm
	TT/LR0FzzEr2wkz4HBUUAcm2vcqpwibOLGogBDPKKrgI7JAj/JPjWMOV8QxSH565
	iZDe6F/yePKphpqzyxW2fwAtwLOZbNSmHTslIGkt3M0El/drpFCFDtnQ6rrtxa7u
	xWaPlQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46d9nkur26-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 09:22:01 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5459M0kk019240
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 5 May 2025 09:22:00 GMT
Received: from [10.204.66.137] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 5 May 2025
 02:21:53 -0700
Message-ID: <c486415a-1c08-4089-b837-15671d5922f3@quicinc.com>
Date: Mon, 5 May 2025 14:51:50 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/11] arm64: dts: qcom: sa8775p-ride: add anx7625 DSI
 to DP bridge nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <robdclark@gmail.com>, <dmitry.baryshkov@oss.qualcomm.com>,
        <sean@poorly.run>, <marijn.suijten@somainline.org>,
        <andersson@kernel.org>, <robh@kernel.org>, <robh+dt@kernel.org>,
        <krzk+dt@kernel.org>, <konradybcio@kernel.org>, <conor+dt@kernel.org>,
        <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
        <rfoss@kernel.org>, <Laurent.pinchart@ideasonboard.com>,
        <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>,
        <quic_abhinavk@quicinc.com>, <quic_rajeevny@quicinc.com>,
        <quic_vproddut@quicinc.com>, <quic_jesszhan@quicinc.com>
References: <20250424062431.2040692-1-quic_amakhija@quicinc.com>
 <20250424062431.2040692-8-quic_amakhija@quicinc.com>
 <11e76323-db6b-428b-816f-e96fc9523fe5@oss.qualcomm.com>
Content-Language: en-US
From: Ayushi Makhija <quic_amakhija@quicinc.com>
In-Reply-To: <11e76323-db6b-428b-816f-e96fc9523fe5@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDA4OCBTYWx0ZWRfX7bTr2sAFs/qZ
 fRrcuR9T2+BdlU1d8bAio25xNpQMNE+VmgeC3qSXal9nIR0TdYl6sQJGwXz1DR5jmbBaGLI3Ovc
 HbI83GCK2ZvKj5RnPwnBpRyYpIX/5+6PuKGJ+8zepCC/XM7qXGXOW0kopW6Eeh6B/8gcX3e/KWD
 gWh3y7WCAGB0ZrfdHB0YngyCmbtSO9uPDL0vM2p71bpncKvcT3zPvPXLVCX4Mtnl8XsA3VXTgls
 yT5RZ/PhBY9kfXqUbvQ1lOsScQmph2Pvt9abILswNMQRMSADOv1A1AbELXUI8BNaeteMbeFztVL
 Ipi2WPWd3zjbFev+FfdIfoF76A8Ozm6qWtO3MQDsThAv2q//msAucXPP4WGj5Pg5PZjy36sV/hX
 skYkmcnazOXJxJnTwILp1SIJ277JMSUGdJ/5cNocV6aLefk+RL/6ICwUmPT1rXMlYP9GQSpa
X-Proofpoint-GUID: 2nQCdatEFbyePhqHO_QO4GIyi-qr0a6F
X-Authority-Analysis: v=2.4 cv=LpeSymdc c=1 sm=1 tr=0 ts=68188339 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=WlFH9gXdXrC4dCi8yUwA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 2nQCdatEFbyePhqHO_QO4GIyi-qr0a6F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_04,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 clxscore=1015 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050088

On 4/26/2025 3:42 PM, Konrad Dybcio wrote:
> On 4/24/25 8:24 AM, Ayushi Makhija wrote:
>> Add anx7625 DSI to DP bridge device nodes.
>>
>> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
>> ---
>>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 181 +++++++++++++++++++++
>>  1 file changed, 181 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
>> index 175f8b1e3b2d..b8851faec271 100644
>> --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
>> @@ -28,6 +28,13 @@ chosen {
>>  		stdout-path = "serial0:115200n8";
>>  	};
>>  
>> +	vph_pwr: vph-pwr-regulator {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "vph_pwr";
> 
> Please provide a reference voltage for this one

Hi Konard,

Thanks, for the review.

Please ignore the previous comment, will update the below reference voltage in next patchset.

+ regulator-min-microvolt = <12000000>;
+ regulator-max-microvolt = <12000000>;

Thanks,
Ayushi

> otherwise
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad


