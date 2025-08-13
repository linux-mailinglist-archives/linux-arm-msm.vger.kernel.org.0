Return-Path: <linux-arm-msm+bounces-69007-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FF8B24F8A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 18:24:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F16595C498F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 16:11:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA32328643E;
	Wed, 13 Aug 2025 16:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HciJ1eXc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9FC627F011;
	Wed, 13 Aug 2025 16:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755100935; cv=none; b=PaPdjHqqCnFJr/wWBWtq9omE6UXOjxZDSBWfxR+aAvKoXCWTmSgHOy5KipiC/L8PWvAIJqEQAyhaCkLi/BsA9FVIWVV7NE4a8wsriH4u1K/Vi2Gka5jBht2S43ByslbWH01ogHmZwAizZ09TwMlUq5NGUIwEXFyeSURgNTAPs8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755100935; c=relaxed/simple;
	bh=/IInu1GSbHtzTPZpYgApvUKxtuzp3AMbxp5bRS+CSKs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=DLy0Z9e/W35dk8UUBOU4zWFoX8OrAHxDmvvookorLHn09kUwuPySZmZhiieBGSfGySR7OlX46TUTyV1NJ/qobxAi3Inmk5sm0g4kpOMqLGaAuQnHT3/TjP0vK95G5ZhOHbpc2xfOcL1ftLXr2v38KufUACchtz40CO4etUkWsU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HciJ1eXc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DBLtgL012998;
	Wed, 13 Aug 2025 16:02:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tOU6SdsJCLYdXKqlaVp+vUFgj1ZmLPafp6bUHKPnOgU=; b=HciJ1eXc4aRksPmt
	Jc8vdM9ipLuQKYcy8P5hkSZIQ6xc7XLvYxIMpbeom658YqF0sFIrFfTqXimTyR/S
	LDrexqLzVKGiv6eALosS1VA4ndUFrjIs9EGkbPRWS4pjvNErhKuabX1zq/XiS/TS
	cu477Sz40q3gta1tShS8ADvzr25+9tP8/IqbDDkBJx6sWWPHSZexg4MTMYqNNw4F
	NIuSwBt4QIX4OglJnOVCDEpN+nbOUTSt5v2DQd2FVN8WTPSSB6AFOAjHTHPiNpI2
	0tlKLvrtHq/CseoJvPJbl01T/oVEbzTrrvUxBQH/VOT5GYX3AY2T/3fqmnHLep4S
	dugjJA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48eqhxagtf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 16:02:04 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57DG23tN012748
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 16:02:03 GMT
Received: from [10.216.60.81] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 13 Aug
 2025 09:02:00 -0700
Message-ID: <4c70139e-2026-4221-88d8-b64f675ad78e@quicinc.com>
Date: Wed, 13 Aug 2025 21:31:57 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] ufs: ufs-qcom: Align programming sequence of Shared
 ICE for UFS controller v5
To: Manivannan Sadhasivam <mani@kernel.org>
CC: <James.Bottomley@hansenpartnership.com>, <martin.petersen@oracle.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_nitirawa@quicinc.com>
References: <20250812091714.774868-1-quic_pkambar@quicinc.com>
 <x5pkfdxwnpqv66d4y3bucpd6vpxbsahdt2mdj6mdlb43emfkxn@dktn4wpuosgr>
Content-Language: en-US
From: Palash Kambar <quic_pkambar@quicinc.com>
In-Reply-To: <x5pkfdxwnpqv66d4y3bucpd6vpxbsahdt2mdj6mdlb43emfkxn@dktn4wpuosgr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEwMDA1NyBTYWx0ZWRfX25yngnbUoLE1
 IYj5Ds1okxAwSVEX1P0ZDB+8g8kmXVuPrmahmBREVwk2K6TPLMaut+eDKD82IAjxP0PNHtIGKRN
 eENLp/wLxofNyKcPgHyAaR76Vc7ATMwZj58xpy/Qy7oyegkXuUtJNB8rlVdZX/iZQ9sgPBkouHY
 0rwajmcLXoIPDKTCdBWMBWyhvKDoGzOOhgRQliNr2Kb+/WctkIN6Y9m+DjH/172iJMCNYfS+lWb
 YS5DDDbPZ4yJpXfV1s+2KDWPc4PdvFjsn+qDMr62YUWeE1Eng3mXusW9RSdNDStykF+1Ms9k3Cm
 iDwE5A9/HU5xaaaPZ1qrzoin/tpxshEXsYyKfTv0SwrNtT7zRy59D31uJZAmNhHaAafp9CfOOMo
 GZegczhy
X-Proofpoint-GUID: ZAK3Cs5ebEjQLy8SDZYd8uuD6eL4VohX
X-Authority-Analysis: v=2.4 cv=aYNhnQot c=1 sm=1 tr=0 ts=689cb6fc cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=bFtwN0H5KFSSgKAYKl4A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: ZAK3Cs5ebEjQLy8SDZYd8uuD6eL4VohX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_01,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508100057



On 8/13/2025 3:25 PM, Manivannan Sadhasivam wrote:
> On Tue, Aug 12, 2025 at 02:47:14PM GMT, Palash Kambar wrote:
>> Disable of AES core in Shared ICE is not supported during power
>> collapse for UFS Host Controller V5.0.
>>
> 
> Could you please add more info on the issue observed?

Sure Mani.

> 
>> Hence follow below steps to reset the ICE upon exiting power collapse
>> and align with Hw programming guide.
>>
>> a. Write 0x18 to UFS_MEM_ICE_CFG
>> b. Write 0x0 to UFS_MEM_ICE_CFG
>>
> 
> Please be explicit about the fields you are writing to.
> 
>> Signed-off-by: Palash Kambar <quic_pkambar@quicinc.com>
>>
>> ---
>> changes from V1:
>> 1) Incorporated feedback from Konrad and Manivannan by adding a delay
>>    between ICE reset assertion and deassertion.
>> 2) Removed magic numbers and replaced them with meaningful constants.
>>
>> changes from V2:
>> 1) Addressed Manivannan's comment and moved change to ufs_qcom_resume.
>> ---
>>  drivers/ufs/host/ufs-qcom.c | 14 ++++++++++++++
>>  drivers/ufs/host/ufs-qcom.h |  2 +-
>>  2 files changed, 15 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
>> index 444a09265ded..60bf5e60b747 100644
>> --- a/drivers/ufs/host/ufs-qcom.c
>> +++ b/drivers/ufs/host/ufs-qcom.c
>> @@ -38,6 +38,9 @@
>>  #define DEEMPHASIS_3_5_dB	0x04
>>  #define NO_DEEMPHASIS		0x0
>>  
>> +#define UFS_ICE_RESET_ASSERT_VALUE	0x18
>> +#define UFS_ICE_RESET_DEASSERT_VALUE	0x00
> 
> Please define the actual bits as per the documentation, not the value you are
> writing. Here, you are changing two fields:
> 
> ICE_SYNC_RST_SEL BIT(3)
> ICE_SYNC_RST_SW BIT(4)

ok Mani.

>> +
>>  enum {
>>  	TSTBUS_UAWM,
>>  	TSTBUS_UARM,
>> @@ -756,6 +759,17 @@ static int ufs_qcom_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>>  	if (err)
>>  		return err;
>>  
>> +	if ((!ufs_qcom_is_link_active(hba)) &&
>> +	    host->hw_ver.major == 5 &&
>> +	    host->hw_ver.minor == 0 &&
>> +	    host->hw_ver.step == 0) {
>> +		ufshcd_writel(hba, UFS_ICE_RESET_ASSERT_VALUE, UFS_MEM_ICE);
>> +		ufshcd_readl(hba, UFS_MEM_ICE);
>> +		usleep_range(50, 100);
> 
> Please add a comment above the delay to make it clear that the delay is not as
> per the doc:

Sure.

> 		/*
> 		 * HW documentation doesn't recommend any delay between the
> 		 * reset set and clear. But we are enforcing an arbitrary delay
> 		 * to give flops enough time to settle in.
> 		 */
> 
>> +		ufshcd_writel(hba, UFS_ICE_RESET_DEASSERT_VALUE, UFS_MEM_ICE);
>> +		ufshcd_readl(hba, UFS_MEM_ICE);
>> +	}
>> +
>>  	return ufs_qcom_ice_resume(host);
>>  }
>>  
>> diff --git a/drivers/ufs/host/ufs-qcom.h b/drivers/ufs/host/ufs-qcom.h
>> index 6840b7526cf5..cc1324ce05c7 100644
>> --- a/drivers/ufs/host/ufs-qcom.h
>> +++ b/drivers/ufs/host/ufs-qcom.h
>> @@ -60,7 +60,7 @@ enum {
>>  	UFS_AH8_CFG				= 0xFC,
>>  
>>  	UFS_RD_REG_MCQ				= 0xD00,
>> -
>> +	UFS_MEM_ICE				= 0x2600,
> 
> As the internal doc, this register is called UFS_MEM_ICE_CFG.

Ok will update the register name.


> - Mani
> 


