Return-Path: <linux-arm-msm+bounces-45640-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3D1A17667
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 04:53:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1935918830FB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 03:53:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1ED51714B3;
	Tue, 21 Jan 2025 03:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IiL4SvHc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0743148832;
	Tue, 21 Jan 2025 03:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737431593; cv=none; b=tofkZzavM9tJZNvH8RNExoDoTu6jQJ7QuOIuR5f4Y72dMsJz9Sncc45W2Acksmt9dYXfpzqyED1LNm01fz8CttOt/cTpWlpqgVII+z+RTT5dbt0RH6HGUJ2pJElmHg180h6M3TRKDV3w0/6Cmlg9LGhRvfLenxfUbA+XC+1rP1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737431593; c=relaxed/simple;
	bh=py00Jl0wUOtx/Ke0yrO8zjnKSnQa/oXBM8Jl78gCkCY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ezP5025tYo7zdbaylE/IZH5JbwB7+GiowP5hDMeTWGbEPsc3TbDXJnWBPxmdV39rfLRSMaVI79AOJN5VdYSHmzCdhZ5Sg/BxzzJKHsLEzCCjoy0TjlQs8Wsz9GvLKlpvAeuRQpMLLMxcQUgJCIdm6LYHqazb79wMZtlRUQ+b460=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IiL4SvHc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50KNlhem024304;
	Tue, 21 Jan 2025 03:52:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5Z9Fk7lyEM++4IIen9M7v/hxdHa0lcaOlEhOA1WFe7Q=; b=IiL4SvHcDq9I+uKu
	Ytl4uExbzA4JwIEu6s3UJ5L40POZDRDH2hWklRSE4COIbjoPrlnb0KVDWBa9lvRF
	15Zq/4B7A8Z3AfYa6OvTzeGqVfc40EFw1s3BxW5K/kEtxKkSTGGOCBDN+9bPbM10
	bAv2u6MF/g/f13bk+zBjh25j5Q/efRP/Kl3RJ/DjnAcrBMNnYW9saHjeIUtwVR/p
	qA/kT2GpcfcoJs7z7reFbaRiBAQNnLX4Gfvw/YSYhzlUTZ0dq2BlpRKbcH/VYGyT
	9YKnHFyvP8Z8VL1Clgp1IuGSxrcOo9/57z+wVJbiuyLXPV6sxSEeUus4Fj9I0LlS
	dAAiXg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 449whe8m70-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 03:52:49 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50L3qnNi015777
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 03:52:49 GMT
Received: from [10.239.155.136] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 20 Jan
 2025 19:52:45 -0800
Message-ID: <12f4234b-91ca-48e2-8638-771acc15a7be@quicinc.com>
Date: Tue, 21 Jan 2025 11:52:42 +0800
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
 <e0207040-bebd-4e59-abd8-dee16edcc5b9@quicinc.com>
 <20250120154135.xhrrmy37xdr6asmu@thinkpad>
Content-Language: en-US
From: Ziqi Chen <quic_ziqichen@quicinc.com>
In-Reply-To: <20250120154135.xhrrmy37xdr6asmu@thinkpad>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: nEU-Pn08-4t-AcO1LPwKqW9w3sCQPlSt
X-Proofpoint-GUID: nEU-Pn08-4t-AcO1LPwKqW9w3sCQPlSt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-21_02,2025-01-20_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 suspectscore=0 mlxscore=0 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 adultscore=0 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501210029



On 1/20/2025 11:41 PM, Manivannan Sadhasivam wrote:
> On Mon, Jan 20, 2025 at 08:07:07PM +0800, Ziqi Chen wrote:
>> Hi Mani，
>>
>> Thanks for your comments~
>>
>> On 1/19/2025 3:30 PM, Manivannan Sadhasivam wrote:
>>> On Thu, Jan 16, 2025 at 05:11:45PM +0800, Ziqi Chen wrote:
>>>> From: Can Guo <quic_cang@quicinc.com>
>>>>
>>>> Implement the freq_to_gear_speed() vops to map the unipro core clock
>>>> frequency to the corresponding maximum supported gear speed.
>>>>
>>>> Co-developed-by: Ziqi Chen <quic_ziqichen@quicinc.com>
>>>> Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
>>>> Signed-off-by: Can Guo <quic_cang@quicinc.com>
>>>> ---
>>>>    drivers/ufs/host/ufs-qcom.c | 32 ++++++++++++++++++++++++++++++++
>>>>    1 file changed, 32 insertions(+)
>>>>
>>>> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
>>>> index 1e8a23eb8c13..64263fa884f5 100644
>>>> --- a/drivers/ufs/host/ufs-qcom.c
>>>> +++ b/drivers/ufs/host/ufs-qcom.c
>>>> @@ -1803,6 +1803,37 @@ static int ufs_qcom_config_esi(struct ufs_hba *hba)
>>>>    	return ret;
>>>>    }
>>>> +static int ufs_qcom_freq_to_gear_speed(struct ufs_hba *hba, unsigned long freq, u32 *gear)
>>>> +{
>>>> +	int ret = 0 >
>>> Please do not initialize ret with 0. Return the actual value directly.
>>>
>>
>> If we don't initialize ret here, for the cases of freq matched in the table,
>> it will return an unknown ret value. It is not make sense, right?
>>
>> Or you may want to say we don't need “ret” , just need to return gear value?
>> But we need this "ret" to check whether the freq is invalid.
>>
> 
> I meant to say that you can just return 0 directly in success case and -EINVAL
> in the case of error.
> 
Hi Mani,

If we don't print freq here , I think your suggestion is very good. If 
we print freq in this function , using "ret" to indicate success case 
and failure case and print freq an the end of this function is the way 
to avoid code bloat.

How do you think about it?

>>>> +
>>>> +	switch (freq) {
>>>> +	case 403000000:
>>>> +		*gear = UFS_HS_G5;
>>>> +		break;
>>>> +	case 300000000:
>>>> +		*gear = UFS_HS_G4;
>>>> +		break;
>>>> +	case 201500000:
>>>> +		*gear = UFS_HS_G3;
>>>> +		break;
>>>> +	case 150000000:
>>>> +	case 100000000:
>>>> +		*gear = UFS_HS_G2;
>>>> +		break;
>>>> +	case 75000000:
>>>> +	case 37500000:
>>>> +		*gear = UFS_HS_G1;
>>>> +		break;
>>>> +	default:
>>>> +		ret = -EINVAL;
>>>> +		dev_err(hba->dev, "Unsupported clock freq\n");
>>>
>>> Print the freq.
>>
>> Ok, thank for your suggestion, we can print freq with dev_dbg() in next
>> version.
>>
> 
> No, use dev_err() with the freq. >
> - Mani
>
I think use dev_err() here does not make sense:

1. This print is not an error message , just an information print. Using 
dev_err() reduces the readability of this code.
2. This prints will be print very frequent, I afraid it will increase 
the latency of clock scaling.


How do you think ?

-Ziqi



