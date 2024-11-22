Return-Path: <linux-arm-msm+bounces-38785-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E5B9D5A63
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 08:52:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E4C9C1F21B46
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 07:52:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 758A51865FD;
	Fri, 22 Nov 2024 07:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nXW76GW3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE8E178CF6
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Nov 2024 07:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732261889; cv=none; b=XOBg3lYHnDt8mmxF/jGpW2aiAG3y7E4RKLL8eIJJWeb1Zjtrwuma7PyNTyP/6QZTidIzR4uJhC/aL9RAGSgk7c4TzDKiSkrccFEAztuKNbevBp4QatNJkHknX9HeKgwrevDXgzM9YuXWZVNH3AyM8GfcgZZUdtywZc9zlPC8tBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732261889; c=relaxed/simple;
	bh=naaqnYTkX+RkZoiH90lM3LFvL/lrssDyOU9Xb1i3x80=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=J1+yexfCIh+VhZQMzWS7oP6ZdZWsF3VsbYRVsrNi0d5TgXfNIHzD/s3HZRVcOPwlpqmwt3/f7qSZPVsGLwI1CnrD1UR/8FcXMzEuTtiX7BjXSUgbB13Ve7C9K+OJ8OJsLFeEOzLzjIHximpQHQID8sTkb5ml6u8F2L//PuzG2Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nXW76GW3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ALJPckJ019239;
	Fri, 22 Nov 2024 07:51:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	68+RTSUroK2YvKLQeeV8i34KzcI/Wi/vbFXeg2R2+yg=; b=nXW76GW3bxgadoDc
	oUI+TUjSQGPDhhfafCdCOvX7KLnIYnSKLyUq69N1Q8Jf2BiIhXwXIjpNTiULVqvE
	7s0UA6E26p8LgATkrSdwGMWT7xyzsVwIlYoR4Sr0djVlrHfbtpzSgpPzrisMbuvt
	swpWoBR9AIlFOlylIzVIbn+aNF2rQJEx4MVK416XT9cKCezTSi78B1lj7bIkNe3c
	H06/0//jd/96WIDDiCaw8aV3xKqOgXD2mSOy7skIToyHFGT3fLGEaTC0ML9bC3iG
	uTAKxHOOgzoR+E9NaV+gEvVMIGUB0Mn2GUIsnoOzGe9h1sNLX/KiwxmItfIIYTDT
	xw+8lA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 431c7hpnyn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 07:51:26 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AM7pPbU014969
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 07:51:25 GMT
Received: from [10.64.16.151] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 21 Nov
 2024 23:51:21 -0800
Message-ID: <e0208d5d-fd39-4d59-8eb0-0360d744ee0b@quicinc.com>
Date: Fri, 22 Nov 2024 15:51:18 +0800
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
 <it2yaebzazylkebwmouet3eccqa4kpxqeu6cosqlf47qjiqhjy@34s4ch2xidao>
Content-Language: en-US
From: fange zhang <quic_fangez@quicinc.com>
In-Reply-To: <it2yaebzazylkebwmouet3eccqa4kpxqeu6cosqlf47qjiqhjy@34s4ch2xidao>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: _67W5GpNPXFsm6HudqFa8KfUHquVlHCR
X-Proofpoint-GUID: _67W5GpNPXFsm6HudqFa8KfUHquVlHCR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0
 mlxscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 mlxlogscore=519 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411220065



On 2024/10/14 18:12, Dmitry Baryshkov wrote:
> On Mon, Oct 14, 2024 at 05:47:27PM +0800, fangez via B4 Relay wrote:
>> From: lliu6 <quic_lliu6@quicinc.com>
> 
> This is not the name
sorry for the mistake.
fixed in v2
> 
>>
>> Enable SX150X pinctrl driver.
> 
> ... which is used for the abcdef board.
will remove this patch in v3
> 
>>
>> Signed-off-by: lliu6 <quic_lliu6@quicinc.com>
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


