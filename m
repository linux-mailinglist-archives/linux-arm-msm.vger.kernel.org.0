Return-Path: <linux-arm-msm+bounces-80534-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 958E5C3990C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 09:24:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EFADA3BE058
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 08:23:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B4B62D0636;
	Thu,  6 Nov 2025 08:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="aiFDdLkX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11711C1F02;
	Thu,  6 Nov 2025 08:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762417396; cv=none; b=MRjlXNt7W66PMPQLC+yI3uj98g6l3Lo0kQiA4ML/Ymaou1W310DgzfxSSSHuU2tAZFO5FXPbLO0StL/353trWhz+eIM3AaD5+3tFoDyZAPcz43sByVZ3B1DonK9lQthPwEvmuNjyBWXxAkx5Wk4KN3nLts+3q7n+rkr9HSyfWT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762417396; c=relaxed/simple;
	bh=ggYl4wROTMQhBWwNCz1HZZl2SXgT9BaNW3tVZd9kZ3k=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=EKo9cbzNRCBwTxDuDM3aO2BN65Ixk035v/gzkYEkXJnCI84dAsosAtMUOGVnSSkGFc9O/UJhigtyhiAOWcSVrwMeThqEQBvI7Af2iJ8u4dDIkOv9JtII80a2R7LhVeRL2Y4AZOBt9UKwXTWXUR+jKEbqS8Gpxq8Vr8xpz0nonLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=aiFDdLkX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A66OHrY1739040;
	Thu, 6 Nov 2025 08:23:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xbYonG8RpSbD0wjnOmT+jjxZamQ3fVtoDroJknOWGEE=; b=aiFDdLkXiIpOthBx
	yhmOm1WlO4uffmAZozBYNgiJp67tC6QTybu+pH1LhKf1bB7kCQpRH9E6MUjU8Gyb
	9vcFzCAlkWziYdjXj36mWbG51+QPJHQsDoR9esZQhvaMuc4E2F5y4yjzS86VEDj7
	cVxWYQUr5anubhzJ9rJHyxEAK3QAKeTxmlWJBJxWu9/WfEi0dR/SF5gHgHJkmg86
	Z8FxPxm8ResXwbvQjiDvTrRmXrBABsiqGWUcEMY21TV7LbolLaAvtcfwA3SEGU31
	wUv2BCtkvnUc+d/Soi43CoQA0a0GuFWbsHVvTIo7kR/qcrouqAjHqqz0kasbD6He
	VoB3Ow==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8an3tbu1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Nov 2025 08:23:11 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5A68NAE8024605
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Nov 2025 08:23:10 GMT
Received: from [10.204.78.32] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Thu, 6 Nov
 2025 00:23:07 -0800
Message-ID: <e00ebe76-ba73-42f5-8278-5cc3ee24709d@quicinc.com>
Date: Thu, 6 Nov 2025 13:53:04 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2: Use 'edp_hot' function
 for hpd gpio
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_riteshk@quicinc.com>,
        <quic_rajeevny@quicinc.com>, <quic_vproddut@quicinc.com>
References: <20251031085739.440153-1-quic_amitsi@quicinc.com>
 <1398b513-0948-4775-a71d-dd06ee2296f9@oss.qualcomm.com>
Content-Language: en-US
From: Amit Singh <quic_amitsi@quicinc.com>
In-Reply-To: <1398b513-0948-4775-a71d-dd06ee2296f9@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=W981lBWk c=1 sm=1 tr=0 ts=690c5aef cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=jnTCBMiWdBIKK8qhwyMA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: lRqrRCJAqi3-oMSxxjL7x7ctEo-NJ6fp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDA2NyBTYWx0ZWRfX40zHUSIOU4SF
 2NLDPhb8bR0vgTKv2fNVj2ekocjORYKSCjaFmYRxQcD7EzwDHfGI7nuHuipbIGfsjpinUHEByKk
 umj1E2cqEAhuF6d8NFJisWhW1i5WlOZuatSAbMbPJBlfBkDMm+Gc5Z8vsigqH0Dz3EzunVYQ+i0
 T1yKf2I6mH+e3d1NTNVsbqgAUmn9bREk6X/Un4z0M8//4S3T67TRHY8ZyLNr1ULk8jrLTtkzfgQ
 pha5nLPRoi2JVcMjw/eRDoEj7sHyWi0eEgBVZkvtIcUlVNRbxtwvSFdrTa7+bIEfsY0ymFQesUQ
 Mi23SV8OG+XLx/WKKBujPE3RARTdZlDvwSCKGEU4pS+R9xotih5sEE4W8eUhD/wKxN2gGexNL8R
 F2aLBg4ytUDUfmQnFEADgn0o1JLyAA==
X-Proofpoint-ORIG-GUID: lRqrRCJAqi3-oMSxxjL7x7ctEo-NJ6fp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_01,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 spamscore=0 impostorscore=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511060067



On 10/31/2025 2:37 PM, Konrad Dybcio wrote:
> On 10/31/25 9:57 AM, Amit Singh wrote:
>> Currently, hpd gpio is configured as a general-purpose gpio, which does
>> not support interrupt generation. This change removes the generic
>> hpd-gpios property and assigns the edp_hot function to the pin,
>> enabling proper irq support.
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
> 
> I think this change will take away DRM_BRIDGE_OP_DETECT which is very
> much desired to have.. (via display_connector_probe())
> 
> Konrad

Yes, this change will indeed remove DRM_BRIDGE_OP_DETECT.
We'll be relying on the internal HPD line (edp_hot) that's directly connected to the DP controller instead.

Do you foresee any specific issues with this approach?

> 
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


