Return-Path: <linux-arm-msm+bounces-41898-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B419F9F051F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 08:00:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2623D1889C53
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 07:00:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7019118E75A;
	Fri, 13 Dec 2024 07:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SRa9qMnj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA3117AE1C;
	Fri, 13 Dec 2024 06:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734073202; cv=none; b=RRTE5HG5N3pK61W53AGK7R4ma1hkQgSST4QIszo/pc1M17EveOFu/b474v0SZns44WlPwMyUsDMPrErKBWH3GFgbo23GAROgJc6oxCWHyUQC8qyf8R4vu/sg0V/mJoOtDOobrXBBRTInDVYtKZjG/zMZMNau0ifsFC0eiPyGaRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734073202; c=relaxed/simple;
	bh=relB7YyEyIf37d9inl0r0VNFoRygQ8XFfJbQSdbIUmY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=nSJxFZw92pCCelBTzwrn560kmvcSpHinBT5xEs35L5Y3zOvtyFvqJVBEF5TQQNs+q2259frXvxs2tgCeax08G0oIBO6HjUE+yqfYXxyYOFufCqt4UYV5MPcZQKIk4k+/cc4U68BKomF9RNDnTjmYiKef8h0TMIe9xn6alv/Kj3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SRa9qMnj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BD1Vqkx001463;
	Fri, 13 Dec 2024 06:59:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IKpn9IfbcV2+QnCiE+6i+BLqDUXR6T0iXZZBvyQXf/w=; b=SRa9qMnjmOOfNShE
	PTdqJm7lT88oy1OQsFKDHU8SQlU/0mLR/QOarpOamK6C46DnP/svDmp/JSSuXzQc
	6KUat4TVr/nwSJFAUAMFisO8t38oQ0SuNe2ukBqy76LTPxZeEA3C3Pr12EAP34yg
	p8+L7w2EofHDEVr+febQ5xP9e6/eZc6U95BjJEiN/UYhRsvakh3FsX4Ijn99kxPy
	uM1+fqThd9PwdLR6+wk0acMSBnP4NP3CVOjDvJevJWZ20/76Bn3JXvz7uFpPPfN9
	qK2peLcE19ky4+kZzd4EmHWgq9u2RCjVC30IvAFAFsp/Hz+PhrHRfmnUjKEt8I5t
	s/2Z+g==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fqes3v3c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 06:59:54 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BD6xrcc007790
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 06:59:53 GMT
Received: from [10.239.133.118] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 12 Dec
 2024 22:59:47 -0800
Message-ID: <4476bfe9-41fb-4ec3-b352-624fba75cf3f@quicinc.com>
Date: Fri, 13 Dec 2024 14:59:45 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: Enable secondary USB controller
 on QCS615 Ride
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        Krishna Kurapati
	<krishna.kurapati@oss.qualcomm.com>
References: <20241211-add_usb_host_mode_for_qcs615-v2-0-2c4abdf67635@quicinc.com>
 <20241211-add_usb_host_mode_for_qcs615-v2-2-2c4abdf67635@quicinc.com>
 <cc3edfc6-f53c-401b-b766-f8e560eb24b9@oss.qualcomm.com>
Content-Language: en-US
From: Song Xue <quic_songxue@quicinc.com>
In-Reply-To: <cc3edfc6-f53c-401b-b766-f8e560eb24b9@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: vWoFvXnAE8lWMsSN4fjbpKs2MoB_SKSM
X-Proofpoint-ORIG-GUID: vWoFvXnAE8lWMsSN4fjbpKs2MoB_SKSM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=989 priorityscore=1501 bulkscore=0 phishscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130049



On 12/13/2024 2:14 AM, Konrad Dybcio wrote:
> On 11.12.2024 9:26 AM, Song Xue wrote:
>> From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>>
>> Enable secondary USB controller on QCS615 Ride platform. The secondary
>> USB controller is made "host", as it is a Type-A port.
>>
>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>> Co-developed-by: Song Xue <quic_songxue@quicinc.com>
>> Signed-off-by: Song Xue <quic_songxue@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/qcs615-ride.dts | 28 ++++++++++++++++++++++++++++
>>   1 file changed, 28 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>> index f41319ff47b983d771da52775fa78b4385c4e532..26ce0496d13ccbfea392c6d50d9edcab85fbc653 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>> @@ -203,6 +203,15 @@ &gcc {
>>   		 <&sleep_clk>;
>>   };
>>   
>> +&pm8150_gpios {
>> +	usb2_en_state: usb2-en-state {
>> +		pins = "gpio10";
>> +		function = "normal";
>> +		output-high;
>> +		power-source = <0>;
>> +	};
> 
> Does this go to an enable pin of a vreg / switch?

Thanks for comment.
We go to enable the pin of PMIC chip. The pin of PMIC is connecting to 
host-enable pin of USB converter. Need pin of PMIC chip to be high 
level, when USB is as host mode.
> 
> I think we settled on describing such cases as fixed regulators
> (that are always-on for now) - would you remember, +Dmitry?
> 
> The rest looks good.
> 
> Konrad


