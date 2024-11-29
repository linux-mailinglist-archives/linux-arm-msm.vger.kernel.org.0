Return-Path: <linux-arm-msm+bounces-39510-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4569DBEA5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 03:19:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 45F37164CF5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 02:19:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3A38148857;
	Fri, 29 Nov 2024 02:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VBJB3YZ1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E02E42AA5;
	Fri, 29 Nov 2024 02:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732846739; cv=none; b=r2FR96o6PBIUvf4qBXFy7S02lXdJg1PSSnhgI1mx9TtYEX/Pm6g0km5OQ6vx5+ZEUax3sO9ZSjdvhKWqRCvDCicwE9zo7YcC4IVPFxuZww6u/GVPso2C4QIa+9F2gWC/Ti0NueDd47VPIaD+2+eISE5O63ImbeI/URnm/Zbpy48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732846739; c=relaxed/simple;
	bh=2Jt1Vj43plugUrL6MEJN2eo2gEiB3Zezh5hoaO7xl8M=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=oT6I3rdL35F4KXd0UR2HpWheE33Ti+4VjSuaBsqHs2Lb36ZQqB+i75tjMkEym5SsURHTrGNBAXHkn7scZXrhvz3jyf5c9vCNYXHEyh75AxKuk7mwJlBQTd0MYClsjiwIpq6Oz5AMGXW6vEGC/CzoIzirFACFSD8xJU8j6qi2Jl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VBJB3YZ1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ASLwLqN009729;
	Fri, 29 Nov 2024 02:18:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U8RPAMxvjdhamFIGEq/iOLK0jOpTxArEdvDzo1Xa+bo=; b=VBJB3YZ1J/wCimxK
	zzOvlZj37UJfAOL8Au4sgdCTVXo9F/NjI5f2o6pbj5Iefp3tt/4Ah+I+BrmXMJtR
	YK+ZkLhhyRzb265NLvbnK7jz+hsNgvleZEbxLYuR1L5sfKvbeZqa1x5YURurD9FT
	IvHc7y2HeGyIe2s9SLS5sqocCbgf0zB0cFXlWn7sBD8bxHoKLDrnbH1JyUczVesv
	dzbbkN+BrbjNwahLbLo50LdjO+EEO/+aQ7961ik5gaCizCSe/QKfglgFthMJjkuP
	NGlJhdCEgjF3dVAnK3U67tFbzJTbSC5zJY8s9a/PI1B/cSmoMtOc+7CRgjHH/Wq+
	P6xymg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 436h2mjvqc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Nov 2024 02:18:46 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AT2IjWa029271
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Nov 2024 02:18:45 GMT
Received: from [10.233.21.53] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 28 Nov
 2024 18:18:42 -0800
Message-ID: <48b27eeb-fe75-43c6-b5f2-930610cf4c0c@quicinc.com>
Date: Fri, 29 Nov 2024 10:18:40 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: add base QCS8300 RIDE board
To: Andrew Lunn <andrew@lunn.ch>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, <quic_tengfan@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20241128-qcs8300_initial_dtsi-v3-0-26aa8a164914@quicinc.com>
 <20241128-qcs8300_initial_dtsi-v3-4-26aa8a164914@quicinc.com>
 <fe332b12-d62e-442d-906b-7f3a72165b85@lunn.ch>
Content-Language: en-US
From: Jingyi Wang <quic_jingyw@quicinc.com>
In-Reply-To: <fe332b12-d62e-442d-906b-7f3a72165b85@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: KbSeqi9uINh8e8umFNdCr4qDzgtMHPfp
X-Proofpoint-ORIG-GUID: KbSeqi9uINh8e8umFNdCr4qDzgtMHPfp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2411290017



On 11/29/2024 12:49 AM, Andrew Lunn wrote:
> On Thu, Nov 28, 2024 at 04:44:46PM +0800, Jingyi Wang wrote:
>> Add initial support for Qualcomm QCS8300 RIDE board which enables DSPs,
>> UFS and booting to shell with uart console.
>>
>> Written with help from Tingguo Cheng (added rpmhpd nodes) and Xin Liu
>> (added ufs, adsp and gpdsp nodes).
>>
>> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
>> Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
>> ---
>>  arch/arm64/boot/dts/qcom/Makefile         |   2 +-
>>  arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 267 ++++++++++++++++++++++++++++++
>>  2 files changed, 268 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>> index 9bb8b191aeb5..d9545743606a 100644
>> --- a/arch/arm64/boot/dts/qcom/Makefile
>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>> @@ -114,7 +114,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcm6490-shift-otter.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-1000.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-4000.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2.dtb
>> -dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
>> +dtb-$(CONFIG_ARCH_QCOM)	+= qcs8300-ride.dtb
> 
> It would be good to add a comment to the commit message about why you
> are removing qcs8550-aim300-aiot.dtb from the Makefile.
> 
> 	Andrew
sorry it was a typo, will fix that

Thanks,
Jingyi


