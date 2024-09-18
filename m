Return-Path: <linux-arm-msm+bounces-31955-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4920397BB70
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Sep 2024 13:16:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D5026B2BE43
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Sep 2024 11:16:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6F3D188A26;
	Wed, 18 Sep 2024 11:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YmnGBwzw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AFE21487F1;
	Wed, 18 Sep 2024 11:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726658171; cv=none; b=Q6T/UqCLkG/u/aCnqP0ISw74mn75J1JMGGsHSu3ninQtaGKAYXoEsU8l59JmJs/k1Sie9XmKc0wqTmvgcJkUkrVcQEA7MeMgx5ZHPghKoozXAFKFjYYm4Z/cFIWN+HkrI2MfyPq3m2M9jH7PYOcaHKkPSbhmRjwq7ifPdA64OOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726658171; c=relaxed/simple;
	bh=5ns7ITLPh/fqSmIw80MmxRuwVniGnlyuggKfxA/njgU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Vyew9xdgMtDR0/bUOSCzlDImJwbGh44QI2Iw6iK+lEdrbuD0tuju28co42TvGep+8Ic0bU3QMM+upsgq5I5jU+TZbQIWYooYVfl2wpcAewheTvI01bwilqu/YRXlj0riSv8PvLD+NhohTE6fDheh96uUT8112hWLjiCQSKX7hz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YmnGBwzw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48I8ns7u022162;
	Wed, 18 Sep 2024 11:16:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gX6ZWdOJtc8Z/9bJvUFqnKX6Aot+3ajVUy+mrwll0tE=; b=YmnGBwzw1hgcKeac
	/Ep2K5r/ZNDSr+ir61qkrYe9COd+EjyJFzV6istfa0Bb07uccdtj0AuocJzFaHIz
	oSun6BcwwavE3Nh3uYy/tzwl8dvXODsMX9BaKEXt5X5Lej9wp/6oRmeXmqdBCRms
	wPxNX4hbahAV1Zt2B/rDbFWuN47a5U6CKQ4o8ilBqq7h7748pji01OoXYI4pgfqI
	jN802nsD4dxlpGX0o6jvl6JBvDz7wAfgskLNC1V/3/V+btkVMZ8E3bA+MTK9OB1N
	S2oO181Y2b1JRwktcIjxL/Yk/ndQNS+lEHgOTpf426U8hzNb/bMcVOHiWrrsMMiq
	rqm8Fg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4hfhrer-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Sep 2024 11:16:03 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48IBG2RV022735
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Sep 2024 11:16:02 GMT
Received: from [10.206.111.70] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 18 Sep
 2024 04:15:59 -0700
Message-ID: <f7780c8e-2908-43af-8c2b-71f445cfab44@quicinc.com>
Date: Wed, 18 Sep 2024 16:45:56 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcs6460-rb3gen2: enable venus node
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20240917-venus_rb3_gen2-v1-1-8fea70733592@quicinc.com>
 <D498M9YSOTE8.2LB8FJBSBBLT2@fairphone.com>
Content-Language: en-US
From: Vedang Nagar <quic_vnagar@quicinc.com>
In-Reply-To: <D498M9YSOTE8.2LB8FJBSBBLT2@fairphone.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 6F1Ony4TxKQR-iuTC6OHu9k7fKjPJ76p
X-Proofpoint-ORIG-GUID: 6F1Ony4TxKQR-iuTC6OHu9k7fKjPJ76p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 phishscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 impostorscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409180072

Hi Luca,

On 9/18/2024 1:08 PM, Luca Weiss wrote:
> Hi Vedang!
> 
> On Tue Sep 17, 2024 at 11:24 AM CEST, Vedang Nagar via B4 Relay wrote:
>> From: Vedang Nagar <quic_vnagar@quicinc.com>
>>
>> Enable the venus node on Qualcomm Rb3gen2 so that the
>> video decoder will start working.
>>
>> Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
>> ---
>>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> index 0d45662b8028bff475024cff37c33e01d2ee251b..d52a7e0a35bf941c66ccaa00425147781976b359 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> @@ -790,6 +790,10 @@ &ufs_mem_phy {
>>  	status = "okay";
>>  };
>>  
>> +&venus {
>> +	status = "okay";
> 
> Don't you want to set firmware-name property here?
No, we don't need to set firmware-name property here, it will pick the default path from:
https://elixir.bootlin.com/linux/v6.11/source/drivers/media/platform/qcom/venus/core.c#L932

Regards,
Vedang Nagar
> 
> Regards
> Luca
> 
>> +};
>> +
>>  &wifi {
>>  	memory-region = <&wlan_fw_mem>;
>>  };
>>
>> ---
>> base-commit: 3f52e32445a1f63b788bc8969b7dc2386a80a24d
>> change-id: 20240917-venus_rb3_gen2-502e672d0e20
>> prerequisite-change-id: 20240913-qcm6490-clock-configs-0239f30babb5:v1
>> prerequisite-patch-id: faac726ebdf08240ab0913132beb2c620e52a98a
>>
>> Best regards,
> 

