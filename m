Return-Path: <linux-arm-msm+bounces-19285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C108BDA83
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 07:07:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB7E02822E8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 05:07:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FB966BB46;
	Tue,  7 May 2024 05:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XK5zWgCP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C556A8DB;
	Tue,  7 May 2024 05:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715058448; cv=none; b=Lv/mDESA4R0RPvuDxQBK6tW8wMTsGWTC7K2ZmgINdvCgMBDIHOnXhlGiCwDkHtFYbSc3d8RokospXfGxq7rFnwO0skD5LQ/kRgTuxhTHWtiYHYO2dv5hx/yC9+8MUQ7wkDw7bFH7h1XfK6o0icmj+auSmxY+ZlDgydygxa1Dr4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715058448; c=relaxed/simple;
	bh=H9Wroe0+MJ8cZwAFOmgq+GNEwQs5Lm9VS6mDszVFKAQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=lJBz1vwVZw7atJJeyyQyKsky8Iv3Kmiw8AOWtCzsNHfqaZM6WVyd+NGduMYZsBGFObZP2+8Fc9Vmty4/wiPLKi05qzQ6UV90r7RWi1x5zuCrVdfEUP0f7fmWHjmonO4G65bmuPJzmL2/PxDPmPdmasIZiyQ8vhQQ3MUNa+l7Fw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XK5zWgCP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4474l4gW021668;
	Tue, 7 May 2024 05:07:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=bI3pBZkYcsPCHQGgd/E01i4BuFAtOvg3ogKbyC5db1g=; b=XK
	5zWgCPPoLgmUOPPDrmr1EuZ7GpwDbioFc+5OUYUnLDtmjtgTBvpCOeBH3YHzXl6j
	T6KJeoxE2MH4232ZMRFCZJdnu5ijGxN2DqPsdwhERdxCsC1sj2Pqe0b3WL5gCTx6
	WwSxTpOPvYzm6tQ/UakjUY0bleN9jk373uidDSTfR0G8arA3PqtpjHwO6L7vEB0b
	fsFXjHoDZ4QFum/BmcxChYQWGpow7kuZWplhXlfLn9whZDMRj8ajOK3Np1UvmelH
	Amxrii/Uo1pkbkCbAxTACx2mYPd0FeGXwOkLhtGwgVDTbqtkFHyXqCCdNx76udhq
	Y6fO5x0ffvROewahW8Ow==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xxvv72370-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 May 2024 05:07:18 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44757H6D031707
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 7 May 2024 05:07:17 GMT
Received: from [10.216.28.196] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 6 May 2024
 22:07:09 -0700
Message-ID: <6ab2b8c5-a0a5-581a-6b3d-6af9ec763ced@quicinc.com>
Date: Tue, 7 May 2024 10:37:06 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: qcom: Update Devicetree
 identifiers
To: Caleb Connolly <caleb.connolly@linaro.org>, <robh@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <kernel@quicinc.com>,
        <peter.griffin@linaro.org>, <linux-riscv@lists.infradead.org>,
        <chrome-platform@lists.linux.dev>,
        <linux-mediatek@lists.infradead.org>
References: <1710418312-6559-1-git-send-email-quic_amrianan@quicinc.com>
 <1710418312-6559-2-git-send-email-quic_amrianan@quicinc.com>
 <9fdd04e8-cc7b-41e7-a099-055f39b3b462@linaro.org>
Content-Language: en-US
From: Amrit Anand <quic_amrianan@quicinc.com>
In-Reply-To: <9fdd04e8-cc7b-41e7-a099-055f39b3b462@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: fRBpH_utEobAeaEviHoaDXWmwgb-yF2Y
X-Proofpoint-ORIG-GUID: fRBpH_utEobAeaEviHoaDXWmwgb-yF2Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-07_02,2024-05-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1011 suspectscore=0
 spamscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=999 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2405070034


On 3/14/2024 7:59 PM, Caleb Connolly wrote:
>
> On 14/03/2024 12:11, Amrit Anand wrote:
>> Update existing documentation for qcom,msm-id (interchangeably:
>> qcom,soc-id) and qcom,board-id. Add support for qcom,pmic-id, qcom,oem-id
>> to support multi-DTB selection on Qualcomm's boards.
>>
>> "qcom,soc-id", "qcom,board-id" and "qcom,pmic-id" are tuples of two 32-bit
>> values. The "qcom,oem-id" is a tuple of one 32-bit value.
>> Introduce macros to help generate SOC, board, PMIC and OEM identifiers.
>> QCOM_SOC_ID and QCOM_SOC_REVISION can be used to generate qcom,msm-id.
>> QCOM_BOARD_ID and QCOM_BOARD_SUBTYPE can be used to generate qcom,board-id.
>> QCOM_PMIC_SID and QCOM_PMIC_MODEL can be used to generate qcom,pmic-id.
>> QCOM_OEM_ID can be used to generate qcom,oem-id.
>>
>> Add entries for different types of SoC, boards, DDR type, Boot device
>> type which are currently used by Qualcomm based bootloader.
>>
>> Signed-off-by: Amrit Anand <quic_amrianan@quicinc.com>
>> ---
>>   include/dt-bindings/arm/qcom,ids.h | 86 ++++++++++++++++++++++++++++++++++----
>>   1 file changed, 77 insertions(+), 9 deletions(-)
>>
>> diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
>> index f724834..dc24151 100644
>> --- a/include/dt-bindings/arm/qcom,ids.h
>> +++ b/include/dt-bindings/arm/qcom,ids.h
>> @@ -8,9 +8,14 @@
>>   #define _DT_BINDINGS_ARM_QCOM_IDS_H
>>   
>>   /*
>> - * The MSM chipset and hardware revision used by Qualcomm bootloaders, DTS for
>> - * older chipsets (qcom,msm-id) and in socinfo driver:
>> + * The MSM chipset ID (soc-id) used by Qualcomm bootloaders,
>> + * and in socinfo driver:
>> + * where, "a" indicates Qualcomm supported chipsets, example MSM8260, MSM8660 etc
>>    */
>> +
>> +#define QCOM_SOC_ID(a)  ((QCOM_ID_##a) && 0xffff)
> How is QCOM_SOC_ID(SC7280) ever better than QCOM_ID_SC7280? What does
> this mask give you? It's going into a 32-bit field and not being OR'd
> with anything else...
Ok, understood. Seems better.
>> +
>> +
>>   #define QCOM_ID_MSM8260			70
>>   #define QCOM_ID_MSM8660			71
>>   #define QCOM_ID_APQ8060			86
>> @@ -266,16 +271,79 @@
>>   #define QCOM_ID_IPQ5302			595
>>   #define QCOM_ID_IPQ5300			624
>>   
>> + /* The SOC revision used by Qualcomm bootloaders (soc-revision) */
>> +
>> +#define QCOM_SOC_REVISION(a)		(a & 0xff)
>> +
>>   /*
>> - * The board type and revision information, used by Qualcomm bootloaders and
>> - * DTS for older chipsets (qcom,board-id):
>> + * The board type and revision information (board-id), used by Qualcomm bootloaders
>> + * where, "a" indicates board type which can be either MTP, QRD etc
>>    */
>> +
>>   #define QCOM_BOARD_ID(a, major, minor) \
>> -	(((major & 0xff) << 16) | ((minor & 0xff) << 8) | QCOM_BOARD_ID_##a)
>> +	(((major & 0xff) << 16) | ((minor & 0xff) << 8) | ((QCOM_BOARD_ID_##a) & 0xff))
>> +
>> +#define QCOM_BOARD_ID_MTP		0x8
>> +#define QCOM_BOARD_ID_LIQUID		0x9
>> +#define QCOM_BOARD_ID_DRAGONBOARD	0xA
>> +#define QCOM_BOARD_ID_QRD		0x11
> This replaces the previous definition of QCOM_BOARD_ID_QRD which was
> decimal 11, now you're defining it as hex 0x11? I'm guessing this was a
> typo.

Will correct it.

Thanks,
Amrit

>> +#define QCOM_BOARD_ID_ADP		0x19
>> +#define QCOM_BOARD_ID_HDK		0x1F
>> +#define QCOM_BOARD_ID_ATP		0x21
>> +#define QCOM_BOARD_ID_IDP		0x22
>> +#define QCOM_BOARD_ID_SBC		0x24
>> +#define QCOM_BOARD_ID_QXR		0x26
>> +#define QCOM_BOARD_ID_X100		0x26
>> +#define QCOM_BOARD_ID_CRD		0x28
>> +
>> +/*
>> + * The platform subtype is used by Qualcomm bootloaders and
>> + * DTS (board-subtype)
>> + * where, "a" indicates boot device type, it can be EMMC,
>> + * UFS, NAND or OTHER (which can be used for default).
>> + * "b" indicates DDR type which can be 128MB, 256MB,
>> + * 512MB, 1024MB, 2048MB, 3072MB, 4096MB or ANY
>> + * (which can be used for default).
>> + */
>> +#define QCOM_BOARD_SUBTYPE(a, b, SUBTYPE) \
>> +	(((QCOM_BOARD_BOOT_##a & 0xf) << 16) | ((QCOM_BOARD_DDRTYPE_##b & 0x7) << 8) | \
>> +	(SUBTYPE & 0xff))
>> +
>> +/* Board DDR Type where each value indicates higher limit */
>> +#define QCOM_BOARD_DDRTYPE_ANY		0x0
>> +#define QCOM_BOARD_DDRTYPE_128M		0x1
>> +#define QCOM_BOARD_DDRTYPE_256M		0x2
>> +#define QCOM_BOARD_DDRTYPE_512M		0x3
>> +#define QCOM_BOARD_DDRTYPE_1024M	0x4
>> +#define QCOM_BOARD_DDRTYPE_2048M	0x5
>> +#define QCOM_BOARD_DDRTYPE_3072M	0x6
>> +#define QCOM_BOARD_DDRTYPE_4096M	0x7
>>   
>> -#define QCOM_BOARD_ID_MTP			8
>> -#define QCOM_BOARD_ID_DRAGONBOARD		10
>> -#define QCOM_BOARD_ID_QRD			11
>> -#define QCOM_BOARD_ID_SBC			24
>> +/* Board Boot Device Type */
>> +#define QCOM_BOARD_BOOT_EMMC		0x0
>> +#define QCOM_BOARD_BOOT_UFS		0x1
>> +#define QCOM_BOARD_BOOT_NAND		0x2
>> +#define QCOM_BOARD_BOOT_OTHER		0x3
>> +
>> +/*
>> + * The PMIC slave id is used by Qualcomm bootloaders to
>> + * indicates which PMIC is attached (pmic-sid)
>> + */
>> +
>> +#define QCOM_PMIC_SID(a)		(a & 0xff)
>> +
>> +/*
>> + * The PMIC ID is used by Qualcomm bootloaders to describe the ID
>> + * of PMIC attached to bus described by SID (pmic-model)
>> + */
>> +
>> +#define QCOM_PMIC_MODEL(ID, major, minor) \
>> +	(((major & 0xff) << 16) | ((minor & 0xff) << 8) | (ID & 0xff))
>> +
>> +/*
>> + * The OEM ID consists of 32 bit value to support OEM boards where they
>> + * have slight differences on top of Qualcomm's standard boards
>> + */
>> +#define QCOM_OEM_ID(a)		(a & 0xffffffff)
>>   
>>   #endif /* _DT_BINDINGS_ARM_QCOM_IDS_H */

