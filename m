Return-Path: <linux-arm-msm+bounces-38786-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFABD9D5A7E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 08:57:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E77C9281D9E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 07:57:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2FED175D37;
	Fri, 22 Nov 2024 07:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iiYZvGM1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C17166F26
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Nov 2024 07:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732262262; cv=none; b=fq/fTo1auu+EECqeqId5jo/ws/OSFpvzl5QxyUPl7I7PbmETuxj2Bmh90RF3wc1sNSDrDJwVECoUq0P9Xy2obxewvZrQ5rKvYYXNU81dUPN5oFoikgBFFrgxJZRf6CSEBu0uX1/gcaEsEoD4tZhjLak5fqAxaInk843cwL2pPVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732262262; c=relaxed/simple;
	bh=z/MfpcWDxZrrL91EWw9xPWAvqIBbS5pyZYW5skY0vvs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=scduHyqbhLrf63M9WT6wF7OaBA5WrUpVSldK676FDh7rZoK7DA8hVNVE79LCbnKOoyKWOi/mKYaOOy0tJeux+CkSLGFk7NpxQ2bhfG9J3WMXL4eVAp6TaxnkGN2TC96c5wmd3jzLxrEufO5mqgGJmvC4hrYf+bp21ns/7Kjtkuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iiYZvGM1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AM13VBA005030;
	Fri, 22 Nov 2024 07:57:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l4eawDMSpKtqBbb/yPF21LX3/Lu0ZmJ0+eJv7MwXo5c=; b=iiYZvGM1XJcgmuDc
	DVHsa+pFJLIPlfjQJjrJMzrpwQSeqZYyulJuO5KmJYIaZRW2Mel7cmuathe4Vnaq
	ON3A4HHEfLSieSmUBmhU09OXUL5L9HzLRpzpWTskCWfuNDpaek2j8/wvHWJJuJOv
	jdTN4/3vFPZMdmvRO5DZJiB0/qI36a1JS3VWvZLgOf230XA5OiJs3Wzsoac9ml8+
	PivWyjBDhHfo+TeBFpJWguzRR3GH8sWzZtHBizFsWEHq/ljt0/xFsCUd2oknAafY
	xguc2+isCvZlokzNo/RjEtH0juh2nl82XUlugq62BYy/iKp/rQTIEWBjbM4xgppy
	B1DZbQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 431ea766r6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 07:57:39 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AM7vdvv032587
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 07:57:39 GMT
Received: from [10.64.16.151] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 21 Nov
 2024 23:57:34 -0800
Message-ID: <a7242ce3-240b-43f0-b8c4-60574bf71d69@quicinc.com>
Date: Fri, 22 Nov 2024 15:57:32 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] arm64: defconfig: Enable SX150X
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <kernel@quicinc.com>, <quic_lliu6@quicinc.com>,
        <quic_xiangxuy@quicinc.com>, <linux-arm-msm@vger.kernel.org>
References: <20241014-add_display_support_for_qcs615-v1-0-4efa191dbdd4@quicinc.com>
 <20241014-add_display_support_for_qcs615-v1-1-4efa191dbdd4@quicinc.com>
 <pd2pnnnlw2mxaxtdw4aelnngr6kznungvzg452jco6c2anmb7n@xj3zci34aabs>
Content-Language: en-US
From: fange zhang <quic_fangez@quicinc.com>
In-Reply-To: <pd2pnnnlw2mxaxtdw4aelnngr6kznungvzg452jco6c2anmb7n@xj3zci34aabs>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: iLaj0b7N5z-aAW_7A7CaSvh1kCdMYAaD
X-Proofpoint-ORIG-GUID: iLaj0b7N5z-aAW_7A7CaSvh1kCdMYAaD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 mlxlogscore=449
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411220065



On 2024/10/14 18:37, Dmitry Baryshkov wrote:
> On Mon, Oct 14, 2024 at 05:47:27PM +0800, fangez via B4 Relay wrote:
>> From: lliu6 <quic_lliu6@quicinc.com>
>>
>> Enable SX150X pinctrl driver.
>>
>> Signed-off-by: lliu6 <quic_lliu6@quicinc.com>
> 
> Ok, even worse. fangez, you are not the author of the patches, so there
> is a missing S-o-B.
Got it, fixed in v2 for other patches, and will remove the defconfig patch

and I believe all items have been addressed. May I ask if we can start 
sending v3 now?
> 
>> ---
>>   arch/arm64/configs/defconfig | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>> index 76f3a6ee93e979e9e39cb0283699a2753b0dddf4..13ff005ebe0e9cfcf171b08add24465d0ab94f05 100644
>> --- a/arch/arm64/configs/defconfig
>> +++ b/arch/arm64/configs/defconfig
>> @@ -630,6 +630,7 @@ CONFIG_PINCTRL_SM8350=y
>>   CONFIG_PINCTRL_SM8450=y
>>   CONFIG_PINCTRL_SM8550=y
>>   CONFIG_PINCTRL_SM8650=y
>> +CONFIG_PINCTRL_SX150X=y
>>   CONFIG_PINCTRL_X1E80100=y
>>   CONFIG_PINCTRL_QCOM_SPMI_PMIC=y
>>   CONFIG_PINCTRL_LPASS_LPI=m
>>
>> -- 
>> 2.25.1
>>
>>
> 


