Return-Path: <linux-arm-msm+bounces-4724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7880A812CD1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 11:23:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E09B1C213D4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 10:23:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C95CB3BB22;
	Thu, 14 Dec 2023 10:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BFhyGsl/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D87CBAF;
	Thu, 14 Dec 2023 02:23:19 -0800 (PST)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BE8mErt009216;
	Thu, 14 Dec 2023 10:23:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=SWitZzAx3BEQ6/lWsAzh2+PnL1pOON7ercCfyknd650=; b=BF
	hyGsl/vQjc6ZyYA6stJYx9GsPGKSRABf3ijSoyX1FjHwMvMuSQ+BjbqassRruey+
	fx+QSKxtK6G607OxPmI/RB4dSLPSaHDeylF8kca1D6z5BAbacmDjKZCt5xLwyVif
	Jf3sHU9nMIeeiU2+TyS9Nuzx0F7nIF0Xf+HjkzREGFLjTS2MOL3UjgY75+GtdP6A
	h/RVr3GgwTZBn+rrJp1hxu6pbzXRoNS9/VghtIXY2uiHWS2jGNT4e6YCvHpBc5By
	qhMIv12FgSXQubWmy8sw7Q1Cbs16R5z4EdB2Hqelx+ImTVP3Vd+83eL+al7Qv31b
	i4HmtL6j5A4Tc5KwOpig==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uysrprs7u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Dec 2023 10:23:08 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BEAN7M2018879
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Dec 2023 10:23:07 GMT
Received: from [10.216.56.9] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 14 Dec
 2023 02:23:02 -0800
Message-ID: <2a064fde-0c90-4ef5-86bf-5dc9172149ab@quicinc.com>
Date: Thu, 14 Dec 2023 15:52:57 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/2] arm64: dts: qcom: sc7280: add QCrypto nodes
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: <neil.armstrong@linaro.org>, <konrad.dybcio@linaro.org>,
        <agross@kernel.org>, <andersson@kernel.org>, <conor+dt@kernel.org>,
        <davem@davemloft.net>, <devicetree@vger.kernel.org>,
        <herbert@gondor.apana.org.au>, <krzysztof.kozlowski+dt@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <marijn.suijten@somainline.org>,
        <robh+dt@kernel.org>, <vkoul@kernel.org>
References: <20231212133247.1366698-1-quic_omprsing@quicinc.com>
 <20231212133247.1366698-3-quic_omprsing@quicinc.com>
 <c848f874-3748-4d59-8e78-9ae044fb760a@linaro.org>
 <6b79c66d-7591-443b-92e5-beeff6c93ae4@quicinc.com>
 <5bc96a31-8869-483c-9427-1f4a90263874@linaro.org>
Content-Language: en-US
From: Om Prakash Singh <quic_omprsing@quicinc.com>
In-Reply-To: <5bc96a31-8869-483c-9427-1f4a90263874@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: uYClRH4f3QwEZwTxQljvKzMPbJHviuq4
X-Proofpoint-GUID: uYClRH4f3QwEZwTxQljvKzMPbJHviuq4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 mlxscore=0 bulkscore=0 mlxlogscore=832 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312140069



On 12/14/2023 12:52 PM, Krzysztof Kozlowski wrote:
> On 14/12/2023 06:41, Om Prakash Singh wrote:
>>
>>
>> On 12/12/2023 8:32 PM, Krzysztof Kozlowski wrote:
>>> On 12/12/2023 14:32, Om Prakash Singh wrote:
>>>> Add the QCE and Crypto BAM DMA nodes.
>>>>
>>>> Signed-off-by: Om Prakash Singh <quic_omprsing@quicinc.com>
>>>> ---
>>>>
>>>> Changes in V2:
>>>>     - Update DT node sequence as per register ascending order
>>>
>>> Hm, I don't see it...
>>>
>>>>     - Fix DT node properties as per convention
>>>>
>>>>    arch/arm64/boot/dts/qcom/sc7280.dtsi | 22 ++++++++++++++++++++++
>>>>    1 file changed, 22 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>>>> index 66f1eb83cca7..7b705df21f4e 100644
>>>> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>>>> @@ -2272,6 +2272,28 @@ ipa: ipa@1e40000 {
>>>>    			status = "disabled";
>>>>    		};
>>>>    
>>>> +		cryptobam: dma-controller@1dc4000 {
>>>
>>> It still looks like not correctly ordered by unit address against other
>>> nodes in the file.
>>>
>>
>> Hi Krzysztof,
>> Probably I am missing something basic here. I am trying to put entries
>> addresses that are sorted wrt their current adjacent.
>>
>> And it looks fine to me.
>>
>> 1c0e000 (current exist)
>> 1dc4000 (newly added)
>> 1dfa000	(newly added)
>> 1e40000	(current exist)
> 
> Then why the diff shows:
> @@ -2272,6 +2272,28 @@ ipa: ipa@1e40000 {
> above your changes?

my mistake! Local change was not added in updated patch.
Submitting V3

> 
> Best regards,
> Krzysztof
> 

