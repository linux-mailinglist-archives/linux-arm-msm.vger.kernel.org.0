Return-Path: <linux-arm-msm+bounces-80537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C940C3995D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 09:29:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 478564E1414
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 08:29:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA9A5302154;
	Thu,  6 Nov 2025 08:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dR1kJ7Qs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E168D302174;
	Thu,  6 Nov 2025 08:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762417754; cv=none; b=d+/i1H8RL4o4l2YJL30ojH5xbhj4fQnL2Y6kjuxwfX7HW56hSAqtR11Yd9xMVOqGmQYjE1l9vdP6Z0TWms5sRLQpHRACwSw4xafR0i/hDA38QF0Wda4xryV4iDv2QHCuucnv8BsQaOHSumOn8mfSiXeAonVlKjEz6uoFFAb8V4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762417754; c=relaxed/simple;
	bh=wzbpmt9DYjDnOYsbKZsscaSDP3dQXL8FPtmzZlZYQ54=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=fggoKAJ6C7N2OlLQ6cUnRIS5g/xFhuKAMdqPHXG4KaMbazo/FNtLu0zw/4KQQL1WelWP4slY0yXDhUNpVc1OLI75N3TPGA2aCC3n58rNsg/GPEHNWEyyNkWg/ObKAWnO710U2xhb3kWiBppedCrlryTaPI/zst/v2TcDyRqvUMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dR1kJ7Qs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A66RXmI1938890;
	Thu, 6 Nov 2025 08:29:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ftdAUJ1zoIYS6ZwSplDb8Q4d/5w7ZpnVJCEZRLJ60xY=; b=dR1kJ7QskziBRs+j
	vTxdNn8yHcE6FSGAWiD7GxvXRPol3+8SGy07W4mdFhY/jaJ68VWAXoJBxjOTDmhf
	pgR/QwArMmExgK84pjJZ+Bgm79DDZLc+hg2M0z5FcrrHArGtV4aaamFFonN7rDeP
	+BGrXn+oWeIpvglIPXAXqVfU+454s54YCtWWotlDhQ/fJxiq9filghCWKhMUpRHe
	P2u7kHCmnH8ESsG1CkMNFkYAg/FjlwlV3aKvaDItflx4uhFt2jXhWOiPwf6LI6W+
	DwsCiOl8y848EkF0ecZpiIf5XvAmqNFWyAzzjJ1yxhTgn/RPNhdWGmyty9sVrpNd
	eX41WQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8apgtbsu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Nov 2025 08:29:09 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5A68T8mD022667
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Nov 2025 08:29:08 GMT
Received: from [10.204.78.32] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Thu, 6 Nov
 2025 00:29:04 -0800
Message-ID: <3ddb78d0-5afd-4ba7-a0a2-bfd5ae3696c4@quicinc.com>
Date: Thu, 6 Nov 2025 13:59:01 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2: Use 'edp_hot' function
 for hpd gpio
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_riteshk@quicinc.com>,
        <quic_rajeevny@quicinc.com>, <quic_vproddut@quicinc.com>
References: <20251031085739.440153-1-quic_amitsi@quicinc.com>
 <a6fbpfulyhbnfoy2d6wf7hl6de3z34gxcu6f4lby7ncsyu3f2g@q6qcvdid7bko>
Content-Language: en-US
From: Amit Singh <quic_amitsi@quicinc.com>
In-Reply-To: <a6fbpfulyhbnfoy2d6wf7hl6de3z34gxcu6f4lby7ncsyu3f2g@q6qcvdid7bko>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDA2OCBTYWx0ZWRfX/KnLMD9fo9j7
 1MIVKhBPcGqPEBLQPbPBpQkx3+gyAq8vcSPjA/4d3QASVfAbwg9BBCjzccdh4N1ASXbf3NM2xR8
 Yd86MP41f3lTLOnWzH2gQ1oOwneHLSXrzVE1TrqmVloPvtt4/F+ixDdgmK+JfBGCsAEiy9r4BSH
 yNYgqjBF9bVU49MJZwiQZkkq6D4at9COUNTG0AP7Kzf1ifGMR9hMUR5H+NOVNJM2i4XLwBoIxeN
 gJMmpQu9WmWbpXHqf80ZrcWdoNU+PmScVBVkcqjIjVk0/a1H4ExbCdMj6c+5NRCSrnkEkW7fAUD
 BU2uc4DQSwVmlHSwWnNsunVjaiNellNciqN+2XHtQ3b0X1LjHkNdDEBKsNfo+CnfYVmK32/JAT7
 Rk5bksEfi+25/PUJNBhRzKlkzS7mIw==
X-Authority-Analysis: v=2.4 cv=LoCfC3dc c=1 sm=1 tr=0 ts=690c5c55 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=02aoYn3nmM_QT12xQSUA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: xKLl7KWg8PVDPyz-YzkWZXtHBKZ5XPRE
X-Proofpoint-ORIG-GUID: xKLl7KWg8PVDPyz-YzkWZXtHBKZ5XPRE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_01,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511060068



On 11/1/2025 2:48 PM, Dmitry Baryshkov wrote:
> On Fri, Oct 31, 2025 at 02:27:39PM +0530, Amit Singh wrote:
>> Currently, hpd gpio is configured as a general-purpose gpio, which does
> 
> HPD, GPIO

Sure, will update in next version.

> 
>> not support interrupt generation.
> 
> This is not true. GPIOs support interrupt generation.

Will update the commit message.

> 
>> This change removes the generic
> 
> Documentation/process/submitting-patches.rst, see the paragraph around
> "This patch" words.

Sure, will follow the guidelines. 

> 
>> hpd-gpios property and assigns the edp_hot function to the pin,
>> enabling proper irq support.
> 
> What for?

I'll update more details in the commit message.

> 
>>
>> Fixes: 756efb7cb7293 ("arm64: dts: qcom: qcs6490-rb3gen2: Add DP output")
>> Signed-off-by: Amit Singh <quic_amitsi@quicinc.com>
>> ---
>>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 3 ---
>>  1 file changed, 3 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> index c146161e4bb4..caa0b6784df3 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> @@ -49,8 +49,6 @@ dp-connector {
>>  		label = "DP";
>>  		type = "mini";
>>  
>> -		hpd-gpios = <&tlmm 60 GPIO_ACTIVE_HIGH>;
>> -
>>  		port {
>>  			dp_connector_in: endpoint {
>>  				remote-endpoint = <&mdss_edp_out>;
>> @@ -1420,7 +1418,6 @@ &wifi {
>>  /* PINCTRL - ADDITIONS TO NODES IN PARENT DEVICE TREE FILES */
>>  
>>  &edp_hot_plug_det {
>> -	function = "gpio";
>>  	bias-disable;
>>  };
>>  
>> -- 
>> 2.34.1
>>
> 


