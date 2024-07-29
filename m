Return-Path: <linux-arm-msm+bounces-27234-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EEADA93F303
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 12:42:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A40411F24507
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 10:42:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36768143C70;
	Mon, 29 Jul 2024 10:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cniBhTpR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C060728399;
	Mon, 29 Jul 2024 10:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722249753; cv=none; b=KqjC8vLBNTF5Tn7EigstmqaaxPuCcm/p5rbz7I6zB0eOZE1KZe2YZThd9ZcUkSAyFohGtDIrKmxzbh8i6uJRQJS+j+Q05WN/e/gL39ccKpF3Z/2wQ0bW6HSO0h76bpbHzm544yZNgWzyygEY3Kv86GJJr5BVHAuSldXuIBb5shw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722249753; c=relaxed/simple;
	bh=ub1Yg50JFq2NvU0SP9zoVeXxU57j9kAS131Hh5GxOdA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=P6igi8m7/lZO/alKgDFsoOX/ps8kZEH51FE6xeymhTxemme5Lp7ygO71rkzdG3Hm9TV65I/xt4qxUoV21pQEpmXq3AmyCZOIg9Lpnikpph88TCHI9wiOtmK3T9Ezh6f7N1l6lNoIKm9RhNIZQZZGTB0qmpOaXL/tD0uLqn+QLnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cniBhTpR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46TAL2Jm003937;
	Mon, 29 Jul 2024 10:42:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S4+tVbYQJ9/WcrhaBo8VTgIcQFifwH8ByYr5edpAI2U=; b=cniBhTpRcUIxatUA
	HEt3GTsz09yXcEIFTuc/TbnphujtPKEeDbWr4atc9ZZy2gSH60aD+wFs89n1/xBE
	Pj+FNYW6shnf/gtxD2z7Gky8qgdhMD/+k+G/077Iy9DQjoAy3CeW3uF4Ws03Y06Z
	g0qyxV5APAPOKlvVA3u+jUTQLuewGmeLhM5mvGJhtOIb4n5VTTlJdxfQ19eG6p/U
	1ChgSlKIC0cxz/F4xLgYLlCaGeAgMTueX7OmWILv3Pqwv6OfWnHpUkYvZ2LCd566
	dzx+sMVwTPF4wB8UeKjTE1Q3OzTin9pvLXG6mJ9L7TQB5nOV+AbROHusfzDYFtXE
	wbF8DQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40mt2kktyk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jul 2024 10:42:26 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46TAgPXx023504
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jul 2024 10:42:25 GMT
Received: from [10.239.132.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 29 Jul
 2024 03:42:21 -0700
Message-ID: <080b47dc-c8e0-4962-a358-aa4c39e5e868@quicinc.com>
Date: Mon, 29 Jul 2024 18:42:19 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/8] arm64: dts: qcom: Add support for multimedia clock
 controllers
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski
	<krzk@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_imrashai@quicinc.com>, <quic_jkona@quicinc.com>,
        Tingwei
	<quic_tingweiz@quicinc.com>,
        "Aiqun(Maria) Yu" <quic_aiquny@quicinc.com>
References: <20240715-sa8775p-mm-v3-v1-0-badaf35ed670@quicinc.com>
 <20240715-sa8775p-mm-v3-v1-7-badaf35ed670@quicinc.com>
 <d40d540c-a3b9-449d-8f34-cb2972ddc2ef@kernel.org>
 <12be3f5a-5bc6-40cc-a7af-7f098a7be04e@linaro.org>
From: Tengfei Fan <quic_tengfan@quicinc.com>
In-Reply-To: <12be3f5a-5bc6-40cc-a7af-7f098a7be04e@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: HM2PyIKl8NHnPBET8wbla8QAKSNMogQ7
X-Proofpoint-GUID: HM2PyIKl8NHnPBET8wbla8QAKSNMogQ7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-29_09,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 malwarescore=0 spamscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407290072



On 7/16/2024 8:09 PM, Konrad Dybcio wrote:
> On 16.07.2024 9:45 AM, Krzysztof Kozlowski wrote:
>> On 15/07/2024 10:23, Taniya Das wrote:
>>> Add support for video, camera, display0 and display1 clock
>>> controllers on SA8775P platform.
>>>
>>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/sa8775p.dtsi | 56 +++++++++++++++++++++++++++++++++++
>>>   1 file changed, 56 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>>> index 23f1b2e5e624..8fd68a8aa916 100644
>>> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>>> @@ -2911,6 +2911,47 @@ llcc: system-cache-controller@9200000 {
>>>   			interrupts = <GIC_SPI 580 IRQ_TYPE_LEVEL_HIGH>;
>>>   		};
>>>   
>>> +		videocc: clock-controller@abf0000 {
>>> +			compatible = "qcom,sa8775p-videocc";
>>> +			reg = <0x0 0x0abf0000 0x0 0x10000>;
>>> +			clocks = <&gcc GCC_VIDEO_AHB_CLK>,
>>> +				 <&rpmhcc RPMH_CXO_CLK>,
>>> +				 <&rpmhcc RPMH_CXO_CLK_A>,
>>> +				 <&sleep_clk>;
>>> +			power-domains = <&rpmhpd SA8775P_MMCX>;
>>
>> Not sure if these are correct. I had impression the clocks are going
>> away from sa8775p?
> 
> Right, the patches look mostly good, but are still going to be on hold
> until the 8775 situation is cleared out.. We recently had the gigantic
> patchset [1] that shifted things around, and seemingly there was rather
> little closure on that, so we're waiting for the dust to settle and
> people to agree on things..
> 
> Konrad
> 
> [1] https://lore.kernel.org/linux-arm-msm/20240703025850.2172008-1-quic_tengfan@quicinc.com/

After considering the feedback provided on the subject, We have decided
to keep current SA8775p compatible and ABI compatibility in drivers.
Therefore, this patch is still needed, please continue to review this
patch.
Thank you for your input.

-- 
Thx and BRs,
Tengfei Fan

