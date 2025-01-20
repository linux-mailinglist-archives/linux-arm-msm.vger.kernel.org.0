Return-Path: <linux-arm-msm+bounces-45584-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC612A16C08
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 13:07:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 240F6163731
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 12:07:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 289B81DF968;
	Mon, 20 Jan 2025 12:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VITWSDU7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6411B87EE;
	Mon, 20 Jan 2025 12:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737374863; cv=none; b=GkNMv7Sdmopzp4THqoCpG+LWaNi2Uzxmd1CAwRjKpgC0c2sILQmRogpS17DLY/oQgBBFbdogjVI659ZAjtwkfr/PNSqkEl4xl38vvFFi+dboMLOyv8zgq4q1I76RSB022FNSiMPO+CTsocC7cnX4Fkd68L9dCkBDBE4vdp0A/Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737374863; c=relaxed/simple;
	bh=LGtnzoz1nfYevv+qtqdb2Fqn5ev9430ObEQ0UL0Qspo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=DLwWJLJ4CMcdSys9x5DP06vOUltKchlO+0J4lsCQfBgRc4CLQb6INgIUCa6mxZLb7iAT0R7uEywPmq5MqaDCay2OVxh2nXh0M+2t3SWEqEuUAxJR1LOry8cTb/DzFj7BccKRWPcTtTFExt+5GC8qOpMiOJcpWJ1fIQvTOWq8nnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VITWSDU7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50K6guGr007139;
	Mon, 20 Jan 2025 12:07:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cn2MAyKsmUpTIpSZ5Lyv0Z1vmlbBXsWds0A8yDE0a3Q=; b=VITWSDU7dlAdoinb
	YOT5XJLRGYsT+7eTijvzAPAgjdCLdwTXrQ8bIMUncbsC//XInG9ZTowRcBzBaVCE
	TOJave14/PlAzoevRSifRBDCbQXPjB2aZajaRg7d355ZpB9s9v8AkyujfcThBySd
	vvYRimx7Kgh4laj6eYa3wMgLXFzFvclEXThFsMXUnAmmBSbz85fMexRMeryIphLu
	q/6tCOBInKPQQlnB1CnqZVvY7ooMus/2WZSt4tt6OCBasoeQzkD7uarBHL+WhtYi
	SklscVoH2DwhLPh5v55opsX+C/VNYsPziSyip+6WN4LbbFpRH2AILazTGQrJORn3
	V15mPQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 449hfb0s9w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jan 2025 12:07:15 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50KC7EIj010114
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jan 2025 12:07:14 GMT
Received: from [10.239.155.136] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 20 Jan
 2025 04:07:10 -0800
Message-ID: <e0207040-bebd-4e59-abd8-dee16edcc5b9@quicinc.com>
Date: Mon, 20 Jan 2025 20:07:07 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] scsi: ufs: qcom: Implement the freq_to_gear_speed()
 vops
To: Manivannan Sadhasivam <mani@kernel.org>
CC: <quic_cang@quicinc.com>, <bvanassche@acm.org>, <beanhuo@micron.com>,
        <avri.altman@wdc.com>, <junwoo80.lee@samsung.com>,
        <martin.petersen@oracle.com>, <quic_nguyenb@quicinc.com>,
        <quic_nitirawa@quicinc.com>, <quic_rampraka@quicinc.com>,
        <linux-scsi@vger.kernel.org>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>,
        "James E.J. Bottomley"
	<James.Bottomley@HansenPartnership.com>,
        "open list:ARM/QUALCOMM MAILING
 LIST" <linux-arm-msm@vger.kernel.org>,
        open list
	<linux-kernel@vger.kernel.org>
References: <20250116091150.1167739-1-quic_ziqichen@quicinc.com>
 <20250116091150.1167739-5-quic_ziqichen@quicinc.com>
 <20250119073056.houuz5xjyeen7nw5@thinkpad>
Content-Language: en-US
From: Ziqi Chen <quic_ziqichen@quicinc.com>
In-Reply-To: <20250119073056.houuz5xjyeen7nw5@thinkpad>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: kcxhcPaKg4JijBVaSKti3ctZf87qPZDZ
X-Proofpoint-ORIG-GUID: kcxhcPaKg4JijBVaSKti3ctZf87qPZDZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-20_02,2025-01-20_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 mlxscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 mlxlogscore=999 bulkscore=0 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501200101

Hi Mani，

Thanks for your comments~

On 1/19/2025 3:30 PM, Manivannan Sadhasivam wrote:
> On Thu, Jan 16, 2025 at 05:11:45PM +0800, Ziqi Chen wrote:
>> From: Can Guo <quic_cang@quicinc.com>
>>
>> Implement the freq_to_gear_speed() vops to map the unipro core clock
>> frequency to the corresponding maximum supported gear speed.
>>
>> Co-developed-by: Ziqi Chen <quic_ziqichen@quicinc.com>
>> Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
>> Signed-off-by: Can Guo <quic_cang@quicinc.com>
>> ---
>>   drivers/ufs/host/ufs-qcom.c | 32 ++++++++++++++++++++++++++++++++
>>   1 file changed, 32 insertions(+)
>>
>> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
>> index 1e8a23eb8c13..64263fa884f5 100644
>> --- a/drivers/ufs/host/ufs-qcom.c
>> +++ b/drivers/ufs/host/ufs-qcom.c
>> @@ -1803,6 +1803,37 @@ static int ufs_qcom_config_esi(struct ufs_hba *hba)
>>   	return ret;
>>   }
>>   
>> +static int ufs_qcom_freq_to_gear_speed(struct ufs_hba *hba, unsigned long freq, u32 *gear)
>> +{
>> +	int ret = 0 >
> Please do not initialize ret with 0. Return the actual value directly.
>

If we don't initialize ret here, for the cases of freq matched in the 
table, it will return an unknown ret value. It is not make sense, right?

Or you may want to say we don't need “ret” , just need to return gear 
value? But we need this "ret" to check whether the freq is invalid.

>> +
>> +	switch (freq) {
>> +	case 403000000:
>> +		*gear = UFS_HS_G5;
>> +		break;
>> +	case 300000000:
>> +		*gear = UFS_HS_G4;
>> +		break;
>> +	case 201500000:
>> +		*gear = UFS_HS_G3;
>> +		break;
>> +	case 150000000:
>> +	case 100000000:
>> +		*gear = UFS_HS_G2;
>> +		break;
>> +	case 75000000:
>> +	case 37500000:
>> +		*gear = UFS_HS_G1;
>> +		break;
>> +	default:
>> +		ret = -EINVAL;
>> +		dev_err(hba->dev, "Unsupported clock freq\n");
> 
> Print the freq.

Ok, thank for your suggestion, we can print freq with dev_dbg() in next 
version.

> 
> - Mani >

-Ziqi

>> +		break;
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>>   /*
>>    * struct ufs_hba_qcom_vops - UFS QCOM specific variant operations
>>    *
>> @@ -1833,6 +1864,7 @@ static const struct ufs_hba_variant_ops ufs_hba_qcom_vops = {
>>   	.op_runtime_config	= ufs_qcom_op_runtime_config,
>>   	.get_outstanding_cqs	= ufs_qcom_get_outstanding_cqs,
>>   	.config_esi		= ufs_qcom_config_esi,
>> +	.freq_to_gear_speed	= ufs_qcom_freq_to_gear_speed,
>>   };
>>   
>>   /**
>> -- 
>> 2.34.1
>>
> 

