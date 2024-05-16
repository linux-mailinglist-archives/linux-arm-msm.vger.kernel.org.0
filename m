Return-Path: <linux-arm-msm+bounces-19921-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C158C7151
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 May 2024 07:21:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 734711C2259E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 May 2024 05:21:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 690ED14AB4;
	Thu, 16 May 2024 05:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nkGoA0qD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21BE19BDC;
	Thu, 16 May 2024 05:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715836907; cv=none; b=gg+A/wjqIKFQ3kNeVDkq+FnvU4MD0v07KZCKtEhqq0fdrAQff7AgwXsUeEataieTUhyQRJgsB9MoJAixG3PEZwSMx3gnY3plI4VefJm8kl8RyxUe2byzj/Ai4um65dvjyEp/6SW0jzSbhdHOPuc0bGPA335hHYwiBpicwYqk78M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715836907; c=relaxed/simple;
	bh=cm+ncD9TzT2Ed1NJcnpO9JfgJn2k9hpkBCfu2LLb0A8=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=PEUbuD/Q/An6jgW1kPP+jZBJ4RffD9fU48laLjsX3OovZTxRbuSs0xgYPG5FV23kXCJdRWvszyshm8fSzfbjzluRg/s1wAhjxbtiKZ9pSLRgw85e1frll5ndw3O+RkizMqVtauqYy8nugDKdC5cvjE314cscF072DoWwGgLV81s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nkGoA0qD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44FHpuum003199;
	Thu, 16 May 2024 05:21:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	subject:to:cc:references:from:message-id:date:mime-version
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=0nwfSddRoIrKkrX40wnOEIroy2jpiYW8tb8aX6qBDbE=; b=nk
	GoA0qDMINYVBMiYvKjeoAqvKdRm5/1tkmsOj6it871isyHtueYfxgY8+DFowDZxA
	w27tjO9AmOQsthe/pe4cON9oSYp+/KyJ0UGDyLcJIp6WGKH9fB3uyjJ+l2YCBFnk
	4ZYshAS6l6St7w5Wd4sQwAQ3+WHmo+u3f7klplVsQvkiHh8j1EomBswynnXxG7AB
	HydVvgY8GoxvSYpJQ3JaLDb/0bRAySlxE0YVqCHaFCu3/iV9noivedYV9ZD242Bn
	qOsAqs20qBpzJaAHQ0F0EABK2Dzo9GxyuPaKr6KnNSSP8A9mrVugfiIf8TVdlKPT
	FxJhYpTlfwghzM1uZliQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y51tuh0h5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 05:21:42 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44G5LfJ5026334
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 05:21:41 GMT
Received: from [10.216.27.118] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 15 May
 2024 22:21:37 -0700
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sdx75-idp: add SDHCI for SD Card
To: Krzysztof Kozlowski <krzk@kernel.org>, <ulf.hansson@linaro.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <bhupesh.sharma@linaro.org>
CC: <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
References: <20240515120958.32032-1-quic_nainmeht@quicinc.com>
 <20240515120958.32032-4-quic_nainmeht@quicinc.com>
 <a5833628-65f3-493d-9de5-33ba87a18875@kernel.org>
From: Naina Mehta <quic_nainmeht@quicinc.com>
Message-ID: <2ed5326a-b2ea-220a-2a9b-0478df0c6f12@quicinc.com>
Date: Thu, 16 May 2024 10:51:22 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <a5833628-65f3-493d-9de5-33ba87a18875@kernel.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: yAceZD2qWHiq8oFcVrVCpD_lP2AUZ5cp
X-Proofpoint-GUID: yAceZD2qWHiq8oFcVrVCpD_lP2AUZ5cp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_02,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1011
 mlxscore=0 lowpriorityscore=0 mlxlogscore=932 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405160034



On 5/15/2024 7:53 PM, Krzysztof Kozlowski wrote:
> On 15/05/2024 14:09, Naina Mehta wrote:
>> Enable SDHCI on sdx75-idp to support SD card.
>> Also add the required regulators.
>>
>> Signed-off-by: Naina Mehta <quic_nainmeht@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/sdx75-idp.dts | 45 ++++++++++++++++++++++++++
>>   1 file changed, 45 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sdx75-idp.dts b/arch/arm64/boot/dts/qcom/sdx75-idp.dts
>> index f76e72fb2072..6f94278cf837 100644
>> --- a/arch/arm64/boot/dts/qcom/sdx75-idp.dts
>> +++ b/arch/arm64/boot/dts/qcom/sdx75-idp.dts
>> @@ -41,6 +41,29 @@
>>
>>   		vin-supply = <&vph_ext>;
>>   	};
>> +
>> +	vreg_sd_vccb: sd-vccb {
> 
> Please use name for all fixed regulators which matches current format
> recommendation: 'regulator-[0-9]+v[0-9]+'

Did you mean that vreg_sd_vdd should be updated according to the 
suggested format because vreg_sd_vccb is not a fixed regulator?

Thanks,
Naina

> 
> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git/commit/?id=b6d4b3500d57370f5b3abf0701c9166b384db976
> 
> 
> Best regards,
> Krzysztof
> 

