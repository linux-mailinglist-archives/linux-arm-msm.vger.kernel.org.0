Return-Path: <linux-arm-msm+bounces-63157-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 900F5AEF15A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 10:38:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B29EA1BC6578
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 08:38:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12742265298;
	Tue,  1 Jul 2025 08:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EmYWP3c0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D11C1E515;
	Tue,  1 Jul 2025 08:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751359116; cv=none; b=s+h5hpC0xJIHg3Mb2Bn1dQ1WRI6sQGqqgAhn0frPLMCgWvf0W7YMuCPXUf8XG+rVHunmdj2cYBdI+ccfuxvp9FcOZBee9jBabGRtqasX1Gv9Mo8HXbwcLhtsCL1JhPCI0X3wgOZ2WzWhMSgNv3ATbP+i2Biu3PaVI/JM+mmhZ8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751359116; c=relaxed/simple;
	bh=JDUNap3GHFKuWRWyBdvTiLwReRa/kNcyF2eZUEuoTFM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=IEEZ8knpH+wOywrmlzZ3aHGqIP4fA/jSHPv/BpIKyzM96u+HOS79jpKYa36VX2/EH8Y0SCBufevG6kvBkmhz3FJNniT6KVY5aqUYdCJhry21hU4NF85TS/OfkuidAzItv2b6xA2bRdzQDwNlT5V9MLFMCjAAbz98zqf9oEGY1Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EmYWP3c0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5613W3QD029344;
	Tue, 1 Jul 2025 08:38:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sQK6jGek7VHu0q3g0+xBlO8ZxvXBA8trensas9hggfU=; b=EmYWP3c0zdlI3zHo
	knvCfaBMywvwnx5nEdCGNyK/H2PKIZqAkXccIml7j9BUk3EwEqlODsw3t3Ddmd3f
	kJCkmGrEQY+wCMaFKT14U9gPGsS6DOUys/LOBv2hx1XoumMER8H4w6IDehDB60r8
	dGO+vV5xWSEvLtkJUchCoLO1Df4WYV5EcTjSK9bc+x90Yv/gXOxYesUAWGAV+L1Z
	yeLAWO2TJGg7G5+o7kyS7IOfKmeT9eoL4c0aLK6IwRumRBVE7YKh4kEFYZaKtsBI
	IMy3+vGaKVJAX1zox575jGxyH6FWtyvD/6zBdAWT4ofiSg0r2wjsKADXmlXLvOXF
	Xqg0Rw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j95hyr20-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Jul 2025 08:38:31 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5618cUPb005646
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 1 Jul 2025 08:38:30 GMT
Received: from [10.217.217.109] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 1 Jul 2025
 01:38:27 -0700
Message-ID: <ec4e017e-ace8-4975-b8f0-a95c11fdb07d@quicinc.com>
Date: Tue, 1 Jul 2025 14:08:24 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: qcs615: Add CPU scaling clock
 node
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ajit Pandey
	<quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        "Jagadeesh Kona" <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250625-qcs615-mm-cpu-dt-v4-v4-0-9ca880c53560@quicinc.com>
 <20250625-qcs615-mm-cpu-dt-v4-v4-2-9ca880c53560@quicinc.com>
 <xkvn3r7yphlccurdqzncz5qegs7xc254xc2ou2dzuilatk5f5j@eq5ynce4aepg>
 <2b29ae78-e4a0-4d25-a694-abb10883086d@quicinc.com>
 <66c71817-442c-4a7b-8d10-48e6751c8e2f@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <66c71817-442c-4a7b-8d10-48e6751c8e2f@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA0OSBTYWx0ZWRfX9gWuux2DCY+L
 EKmnsfrT+pDnDGURl+ND9pcKB3OZjYxYDiCoJae/FSEzUu9WZHty81HdFZHu0OoxthYn2Oe3EDn
 HdrFVe9HtbVI4ollgK6Z1bBplylS6znaQSGJzXFXbAekmCOtVV2gU5lIv4DNzn4vUxi2/G1WAPC
 0R0Fu4zmAhkXhNokJUwCmD5uLZ1hUf1lbrNkSR3Veyq6UScY6T27TO2NHq4h1P8VfYu+EPr56Zb
 z7zKw+Uj9JIUwM/YV71Dp15AO9H0U4MI3/mps1LIUSI28qV9S1u3VWzNSbdUF6/uN/cY8wvhtFL
 FuXjLsji02wc9Dc7JAV128TPyZdlY/YMGO2w3WMmi4FPpw15xTDYgVEtAfxULc/wtlUDL1akTkH
 duzsuyDxMKUiIUX4mGSidZIm1Q6rKKUaFaA1BpKUi0USyGnxtZpB3bMiZIs3Q92/+rjPEuNC
X-Proofpoint-ORIG-GUID: UZcPiZ8t0JDNjJHSFiA-rcA_mGSc4uLe
X-Authority-Analysis: v=2.4 cv=EuHSrTcA c=1 sm=1 tr=0 ts=68639e87 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=4nQvkLI_yURXtyyxFtUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: UZcPiZ8t0JDNjJHSFiA-rcA_mGSc4uLe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=853 malwarescore=0 mlxscore=0 phishscore=0
 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507010049



On 6/27/2025 6:05 PM, Dmitry Baryshkov wrote:
> On 27/06/2025 06:52, Taniya Das wrote:
>>
>>
>> On 6/25/2025 5:06 PM, Dmitry Baryshkov wrote:
>>> On Wed, Jun 25, 2025 at 04:44:01PM +0530, Taniya Das wrote:
>>>> Add cpufreq-hw node to support CPU frequency scaling.
>>>>
>>>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>>>> ---
>>>>   arch/arm64/boot/dts/qcom/qcs615.dtsi | 29 ++++++++++++++++++++++++
>>>> +++++
>>>>   1 file changed, 29 insertions(+)
>>>>
>>>> @@ -3891,6 +3907,19 @@ glink_edge: glink-edge {
>>>>                   qcom,remote-pid = <2>;
>>>>               };
>>>>           };
>>>> +
>>>> +        cpufreq_hw: cpufreq@18323000 {
>>>> +            compatible = "qcom,sc7180-cpufreq-hw", "qcom,cpufreq-hw";
>>>
>>> Why? Other platforms use a true SoC as the first entry.
>>>
>> Dmitry, from cpufreq-hw perspective SC7180 is a exact match for QCS615
>> and that was the reason to use the same.
> 
> Please look around. A quick `git grep` would show that every SoC uses
> SoC-specific compatible (although some of them are definitely
> compatible). The reason is pretty simple: each platform might have SoC-
> specific tunings and quirks.
> 

Sure Dmitry, I will update to use "qcom,qcs615-cpufreq-hw"


