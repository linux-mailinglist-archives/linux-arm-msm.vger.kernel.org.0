Return-Path: <linux-arm-msm+bounces-39513-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DED9DBEC0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 03:47:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B690281A90
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 02:47:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4E426026A;
	Fri, 29 Nov 2024 02:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eMB9XMO2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B4C8F5A;
	Fri, 29 Nov 2024 02:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732848435; cv=none; b=LC/6uNxCkK3oJduB/D+VOkByU5yTyG4lKzp2SJmjuMe1OhX+wtRIDXMVX3j4RvleFX2MoI6XBRyDkyEE/IK4fV6XDRh32fKibu3Q4l5vG+dMQ03nlGvJtW2UAItuLcSscD1RJ+bNRdN3Cjvlwz5xQbZ5P+7mrJw6r1MKeHMQzHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732848435; c=relaxed/simple;
	bh=Jfnse/E7ivYvRB3Hs0F7MJpfOkXbMTzOWOL0KTcfotU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=XR78lrXWKzOchCPMbeovTOJoEPNxD+dzCfdAxpqWwmIIsNNp8ZIwl0AoW/yx0iLQsKGb0L9S0BXlhmnaTkHNKp0A+Uc+hA1/oNcWR2kiM8un5F6DO7pvjlaXsEcMZRlK4oZ+7QFPhCnfoF4VmBSwm74Mn8kik6HMPKVCy95TIFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eMB9XMO2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ASLYsCo031477;
	Fri, 29 Nov 2024 02:47:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fuSetdXFcy+pj6kZa/ngSUhlbKD/UHxR3gyV4PPX/3c=; b=eMB9XMO2TBCPOt5c
	ZLueTc/tLDs7k1pgULAMHj+EYqY6pk5xqJTjt40r+lSJVC7H+Uy7EPX1wV3OZ526
	jeTqixvZ0G8XUgHUPCOSdh+bdWvqB9DntVdqxxEchs/cse6r9iR5cAKhas+JX6IM
	hgVobw9GmVSgOxYN8s9QLFGYBGbtDEVaTNt3F4qewzXtwVQr7xI+llwq5U2BYE0Q
	LkK8CzZu0eOHajM5f4EmjqkRjrs0b50wn0O8ApB3+M2AbvkdlD94ulzop4DRu7Ic
	GHq1nTgm7wkBzcaD9bTEKVbehI7l8CGrr6ETNVIc2/l+2D/WQYv16jw9T/oW5rhx
	rC0+/Q==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43671ec4yr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Nov 2024 02:47:08 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AT2l7Zf032149
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Nov 2024 02:47:07 GMT
Received: from [10.239.28.11] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 28 Nov
 2024 18:47:02 -0800
Message-ID: <a6ac4e53-7137-42fa-9cef-d3f4a5816960@quicinc.com>
Date: Fri, 29 Nov 2024 10:47:00 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] arm64: dts: qcom: sa8775p-ride: Change the BT node
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Marcel Holtmann
	<marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad Dybcio" <konradybcio@kernel.org>,
        Balakrishna Godavarthi
	<quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>
CC: <linux-bluetooth@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_zijuhu@quicinc.com>, <quic_jiaymao@quicinc.com>,
        <quic_mohamull@quicinc.com>
References: <20241128120922.3518582-1-quic_chejiang@quicinc.com>
 <20241128120922.3518582-2-quic_chejiang@quicinc.com>
 <08c19ae1-b781-475a-8059-18bf9b708dfd@kernel.org>
Content-Language: en-US
From: "Cheng Jiang (IOE)" <quic_chejiang@quicinc.com>
In-Reply-To: <08c19ae1-b781-475a-8059-18bf9b708dfd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 00NGTvecs9tja8cOwbJzRBfaSHm_llUv
X-Proofpoint-GUID: 00NGTvecs9tja8cOwbJzRBfaSHm_llUv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 impostorscore=0 mlxscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2411290021

Hi Krzysztof,

On 11/28/2024 10:39 PM, Krzysztof Kozlowski wrote:
> On 28/11/2024 13:09, Cheng Jiang wrote:
>> The SA8775P-Ride uses the QCA6698 chipset, which shares the same IP core
>> as the WCN6855. However, it has different RF components and RAM sizes,
>> so new firmware is needed.  This change allows driver to distinguish it
>> from the WCN6855 and load the specific firmware.
>>
>> Signed-off-by: Cheng Jiang <quic_chejiang@quicinc.com>
>> ---
>>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
>> index 3fc62e123..f95e709bd 100644
>> --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
>> @@ -856,7 +856,7 @@ &uart17 {
>>  	status = "okay";
>>  
>>  	bluetooth {
>> -		compatible = "qcom,wcn6855-bt";
>> +		compatible = "qcom,qca6698-bt";
> 
> This breaks users without mentioning it, without really justifying the
> impact. Also it is not clear for me whether devices are or are not
> compatible.
QCA6698 can use the wcn6855 firmware, but the performance is not good as expect. 
To avoid breaking existing projects, we plan to upstream a new firmware for this
chip. 
If use the 'firmware-name' to specify the firmware, we can keep the compatible
here unchanged. Is it OK?
> 
> Best regards,
> Krzysztof


