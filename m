Return-Path: <linux-arm-msm+bounces-57376-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 79935AB0D13
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 10:23:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C94263A6E9F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 08:22:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 524132741CE;
	Fri,  9 May 2025 08:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Lxb8pcyl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A133C2741A2;
	Fri,  9 May 2025 08:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746778957; cv=none; b=UnIkkOxxp64EABzZX5C6f4P0gGplih4wVPhtMb5mFps5k5Ixd9VDJiBEu8UZQkshnd5aS+6mPWh8d1ZcOBg1pR0CA/AP023zSFLgltGXzqyr/LSthEmTNqYo1In/c4gHScBArlb8w+Gz2I5vhNA04QterR7wT7BMlhqRMckMDcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746778957; c=relaxed/simple;
	bh=ZgfpwXf47H0sjw/yTO/dwGcNRdm+QTm6jGT1IELMhCA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=NvqXIbBuRH4t7PEVe79SEeamzDO1AROZHGb40jx54LZc5kl2OrYZ9ig8ktnzcBX08rj4hSjh/xZZFTY4U6bR+kCQYZtd8D+k/6d2aKtCSB+u32IYMFOUg7RJkRBTZ+4dhu85Ptre/Of1YaXseSI5/0rx6wnHR9mINILGxDjiEKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Lxb8pcyl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5491uDDD010146;
	Fri, 9 May 2025 08:22:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hD3AhBSexN8dKcUfCMt/UQu8YlpNMmyvL115YoYW9xI=; b=Lxb8pcylzjbFhUiN
	wqmcNiz8FY1Qr2IxtzxTyxsWYNueOxeQZz0bu+vuz2rCqS5yzhIS1kaXXnuCPAhS
	lW7NewEwb+P/33vkfYun8Vyrk8P7FxITskWBUn94FrVSHnHNMlOZm4NaA0JR4l0j
	mEj1pnZm7X8nrfU+kKe7r+XA30IJL4ng2lk50TTaH2PiVsVDBaS3XTlnM50e8GXR
	MqldTuu3rEvSv1G72VDL2K9q+8PUlGYj2HFtwUOceuOMGl+0F/MLebK75UYH9xzv
	vhptjl/9d2RLbxL89acCTqmag/lLe90OVPk7+kiYqCCqHDylJo7IBEMEv4NYsK2k
	WEa67w==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp7c01u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 May 2025 08:22:30 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5498MUWe022086
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 9 May 2025 08:22:30 GMT
Received: from [10.239.132.205] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 9 May 2025
 01:22:24 -0700
Message-ID: <53dd6e80-b0d1-4b1e-9354-851fa2473191@quicinc.com>
Date: Fri, 9 May 2025 16:22:20 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] arm64: dts: qcom: qcs615: Add mproc node for
 SEMP2P
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Kyle Deng <quic_chunkaid@quicinc.com>
References: <20250507-add_qcs615_remoteproc_support-v2-0-52ac6cb43a39@quicinc.com>
 <20250507-add_qcs615_remoteproc_support-v2-3-52ac6cb43a39@quicinc.com>
 <a8a1aa0e-f53d-4a77-9199-958878563b9f@oss.qualcomm.com>
From: Lijuan Gao <quic_lijuang@quicinc.com>
In-Reply-To: <a8a1aa0e-f53d-4a77-9199-958878563b9f@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDA4MCBTYWx0ZWRfX58zFMaRItmjz
 9alu29I0M93JkywUjpjgBMmZJGxt7SL+0b+Z6Rr95ILxoPnswZLr0jvqbqj+ide7X/Ig6MlQG3e
 771vQU55xoyfdvWm++0nnittT/DvQd5Wz/1EbRU5CSLLTCxHwRMXguJaie/8MKhm5LMjwVcqnX+
 PewbAFhQ0VXY7KghCebGvyNrzKdD8Z0SHW96JJorBan843EyU0fAOxQJ+B9fwlv+Z6YWdTlcUso
 glrPyLInukZ5lBt/esGlRc0hT9+Qib0nAv1amNz0K2BUlB8s1vtIEc2/9AzLOx4RB/AYMY8bXqF
 gN8pdvXOw6/ijVUnHG8EaQp2r6xTDZmSgmCztNKgkkI52eqRk9aGHdMXag9SxJ9gM+Wyg9xkpqV
 eL+MXxlAflIcucJmydxUCMduthiEHCLmBm7wExPeRkKGxeiaTAK2ugdB7EohPyHfszxEV/BG
X-Proofpoint-GUID: RDBh5Unx_pGstZ2IhAcuE5e9-fpN5SoV
X-Authority-Analysis: v=2.4 cv=B/G50PtM c=1 sm=1 tr=0 ts=681dbb46 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=01Tm6292DNX8F8ESNB4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: RDBh5Unx_pGstZ2IhAcuE5e9-fpN5SoV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_03,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 mlxlogscore=999 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505090080



在 5/8/2025 10:40 PM, Konrad Dybcio 写道:
> On 5/7/25 12:26 PM, Lijuan Gao wrote:
>> From: Kyle Deng <quic_chunkaid@quicinc.com>
>>
>> The Shared Memory Point to Point (SMP2P) protocol facilitates
>> communication of a single 32-bit value between two processors.
>> Add these two nodes for remoteproc enablement on QCS615 SoC.
>>
>> Signed-off-by: Kyle Deng <quic_chunkaid@quicinc.com>
>> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/qcs615.dtsi | 43 ++++++++++++++++++++++++++++++++++++
>>   1 file changed, 43 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>> index 7c377f3402c1..53661e3a852e 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>> @@ -332,6 +332,49 @@ mc_virt: interconnect-2 {
>>   		qcom,bcm-voters = <&apps_bcm_voter>;
>>   	};
>>   
>> +	smp2p-adsp {
>> +		compatible = "qcom,smp2p";
>> +		qcom,smem = <443>, <429>;
>> +		interrupts = <GIC_SPI 172 IRQ_TYPE_EDGE_RISING>;
>> +		mboxes = <&apss_shared 26>;
> 
> 26 will poke at the SLPI instead

SLPI has not been enabled in QCS615, so the sensor will be in ADSP.  And 
26 is being used dowstream, so it should be correct.
> 
> Konrad

-- 
Thx and BRs
Lijuan Gao


