Return-Path: <linux-arm-msm+bounces-4650-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F2829812703
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 06:41:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9CD531F21A56
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 05:41:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50C026AA0;
	Thu, 14 Dec 2023 05:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OVgZWnyy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE52FAC;
	Wed, 13 Dec 2023 21:41:29 -0800 (PST)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BE2hRcI016504;
	Thu, 14 Dec 2023 05:41:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=WnR2V1HDkmW5PBc0e7CWYokozIJgAwQp5DJQVrfapxQ=; b=OV
	gZWnyyHXm5GmwGpA/L4d5qgQiCm/lPMr5AtUjd8rfQcZkzO+zkHzAs5MSGqsdZyV
	P4sq4bFhui+rXkRD03Af8JYTq1Jwr5vrVumWfvyO9DrcNt8jmCkREAWU7PINs6N4
	B1ish8aA4j3CvUFxS2m+MIWJBjlgrQ8Ltt3dEPc3X03fjRSt7bz3M2Q29Isl0FST
	Sn28bDDG+Waj6Ajdrt7X7WoPGvdsgCIyHHaQX6K2YM3y2qw+0OPzRr4JRzfmgVfn
	jmojX77HH1IBTsHSRguzrBZjRkEbjN6ndfPSMl4NFeRuleUEcgInwAkB4zArOP08
	WcMV2bszjY5Op4BX1dzw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uyq2trh02-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Dec 2023 05:41:17 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BE5fGlL005831
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Dec 2023 05:41:16 GMT
Received: from [10.216.56.9] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 13 Dec
 2023 21:41:11 -0800
Message-ID: <6b79c66d-7591-443b-92e5-beeff6c93ae4@quicinc.com>
Date: Thu, 14 Dec 2023 11:11:07 +0530
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
Content-Language: en-US
From: Om Prakash Singh <quic_omprsing@quicinc.com>
In-Reply-To: <c848f874-3748-4d59-8e78-9ae044fb760a@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Wi5nIYlPga3ktMlviCFTYu4wTZDV_8Xu
X-Proofpoint-ORIG-GUID: Wi5nIYlPga3ktMlviCFTYu4wTZDV_8Xu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 phishscore=0 clxscore=1015 mlxlogscore=921 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312140033



On 12/12/2023 8:32 PM, Krzysztof Kozlowski wrote:
> On 12/12/2023 14:32, Om Prakash Singh wrote:
>> Add the QCE and Crypto BAM DMA nodes.
>>
>> Signed-off-by: Om Prakash Singh <quic_omprsing@quicinc.com>
>> ---
>>
>> Changes in V2:
>>    - Update DT node sequence as per register ascending order
> 
> Hm, I don't see it...
> 
>>    - Fix DT node properties as per convention
>>
>>   arch/arm64/boot/dts/qcom/sc7280.dtsi | 22 ++++++++++++++++++++++
>>   1 file changed, 22 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> index 66f1eb83cca7..7b705df21f4e 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> @@ -2272,6 +2272,28 @@ ipa: ipa@1e40000 {
>>   			status = "disabled";
>>   		};
>>   
>> +		cryptobam: dma-controller@1dc4000 {
> 
> It still looks like not correctly ordered by unit address against other
> nodes in the file.
> 

Hi Krzysztof,
Probably I am missing something basic here. I am trying to put entries 
addresses that are sorted wrt their current adjacent.

And it looks fine to me.

1c0e000 (current exist)
1dc4000 (newly added)
1dfa000	(newly added)
1e40000	(current exist)

> 
> 
> 
> Best regards,
> Krzysztof
> 

