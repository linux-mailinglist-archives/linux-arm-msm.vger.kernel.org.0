Return-Path: <linux-arm-msm+bounces-46053-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 64786A1B2BE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 10:36:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34A0718842F9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 09:36:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADF89219A67;
	Fri, 24 Jan 2025 09:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="U0KRPfoJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8BC23A0;
	Fri, 24 Jan 2025 09:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737711381; cv=none; b=KtwtQr+4VX2JCbrzJlH1sL37M2vTCigeABUadSDCP9KXhLqNXN2SoAy3rGP1/fjQlL4DEM1dvl2UZxyeuImLZfkorlrnbIdIR/GbmFPHdlFvAXNH5LJJb/T65sV8lP7BYa/6gzyfT5OrdcWC+INcwDotXT5en9u2eXD7W56ZmMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737711381; c=relaxed/simple;
	bh=XUJ23gPHIiL+ZLwdPA4Ee1XKHpwW8xHBtCnDO7H9crg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ZdE6PMdKGtpLhA3Y0J5WwiRDctgaJKGz+8cOqvWq8+bXRmzZfCql8mB57PJ4HIgCNTjQHrhgh8E5b9TXFl61d/2jG03xCBzWxxS4svX2mZx/B7tah8/J5GMEKfvqlegJskNnNdFBvhp/LH5L+a8lWffoChK3zUh+m4G+bcb5tSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=U0KRPfoJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50O5NjFf029272;
	Fri, 24 Jan 2025 09:35:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LqHEfkxym8B9dTOwzL6PipoECZDL445ZY6ikV9g+504=; b=U0KRPfoJZ5XbOsw9
	cUuRxiIr7RfoNEkEu5JTWL5LbDvUCyrw2tHy5kAJb9DRnt6SzDb4SFB1VlD5Iq9h
	fwFWMFnx781wAWS/neSDOAhFs/CM5V52UXTGOGaFjKA4g7NM+BC1U93mYU5mqHJD
	n5nof+xY9YAjXHgdm+Y3ry4OpCHDCJVPeM5ymN/Pp4JhxxmKdG5xRCbxDVQTv7M+
	0vSqPUBbE69WECwFyiBx8rnTbv4SeVo6qQlsB+JU+WAuWn13hAQ0q41JLMYFJcGV
	/M1gzd/NvvbzZbIWDrlbZJEYUO3zudi2xree27SxqYlMjChWC8GuYuuhx8bM9FBD
	76XJww==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44c4p5gm4k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 09:35:06 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50O9Z5cH015386
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 09:35:05 GMT
Received: from [10.239.155.136] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 24 Jan
 2025 01:35:01 -0800
Message-ID: <da2fa545-5b4a-4113-85f5-6c2ffaf4e60e@quicinc.com>
Date: Fri, 24 Jan 2025 17:34:58 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] scsi: ufs: qcom: Implement the freq_to_gear_speed()
 vops
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: Manivannan Sadhasivam <mani@kernel.org>, <quic_cang@quicinc.com>,
        <bvanassche@acm.org>, <beanhuo@micron.com>, <avri.altman@wdc.com>,
        <junwoo80.lee@samsung.com>, <martin.petersen@oracle.com>,
        <quic_nguyenb@quicinc.com>, <quic_nitirawa@quicinc.com>,
        <quic_rampraka@quicinc.com>, <linux-scsi@vger.kernel.org>,
        "James E.J.
 Bottomley" <James.Bottomley@HansenPartnership.com>,
        "open list:ARM/QUALCOMM
 MAILING LIST" <linux-arm-msm@vger.kernel.org>,
        open list
	<linux-kernel@vger.kernel.org>
References: <20250116091150.1167739-1-quic_ziqichen@quicinc.com>
 <20250116091150.1167739-5-quic_ziqichen@quicinc.com>
 <20250119073056.houuz5xjyeen7nw5@thinkpad>
 <e0207040-bebd-4e59-abd8-dee16edcc5b9@quicinc.com>
 <20250120154135.xhrrmy37xdr6asmu@thinkpad>
 <12f4234b-91ca-48e2-8638-771acc15a7be@quicinc.com>
 <20250124053525.2sbefy4jitmzr6so@thinkpad>
Content-Language: en-US
From: Ziqi Chen <quic_ziqichen@quicinc.com>
In-Reply-To: <20250124053525.2sbefy4jitmzr6so@thinkpad>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: mNrugttpm7MkaH5o0-778hzefEIxI5ue
X-Proofpoint-ORIG-GUID: mNrugttpm7MkaH5o0-778hzefEIxI5ue
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-24_03,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 spamscore=0 mlxlogscore=999 impostorscore=0 bulkscore=0 malwarescore=0
 mlxscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501240069



On 1/24/2025 1:35 PM, Manivannan Sadhasivam wrote:
> On Tue, Jan 21, 2025 at 11:52:42AM +0800, Ziqi Chen wrote:
>>
>>
>> On 1/20/2025 11:41 PM, Manivannan Sadhasivam wrote:
>>> On Mon, Jan 20, 2025 at 08:07:07PM +0800, Ziqi Chen wrote:
>>>> Hi Mani，
>>>>
>>>> Thanks for your comments~
>>>>
>>>> On 1/19/2025 3:30 PM, Manivannan Sadhasivam wrote:
>>>>> On Thu, Jan 16, 2025 at 05:11:45PM +0800, Ziqi Chen wrote:
>>>>>> From: Can Guo <quic_cang@quicinc.com>
>>>>>>
>>>>>> Implement the freq_to_gear_speed() vops to map the unipro core clock
>>>>>> frequency to the corresponding maximum supported gear speed.
>>>>>>
>>>>>> Co-developed-by: Ziqi Chen <quic_ziqichen@quicinc.com>
>>>>>> Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
>>>>>> Signed-off-by: Can Guo <quic_cang@quicinc.com>
>>>>>> ---
>>>>>>     drivers/ufs/host/ufs-qcom.c | 32 ++++++++++++++++++++++++++++++++
>>>>>>     1 file changed, 32 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
>>>>>> index 1e8a23eb8c13..64263fa884f5 100644
>>>>>> --- a/drivers/ufs/host/ufs-qcom.c
>>>>>> +++ b/drivers/ufs/host/ufs-qcom.c
>>>>>> @@ -1803,6 +1803,37 @@ static int ufs_qcom_config_esi(struct ufs_hba *hba)
>>>>>>     	return ret;
>>>>>>     }
>>>>>> +static int ufs_qcom_freq_to_gear_speed(struct ufs_hba *hba, unsigned long freq, u32 *gear)
>>>>>> +{
>>>>>> +	int ret = 0 >
>>>>> Please do not initialize ret with 0. Return the actual value directly.
>>>>>
>>>>
>>>> If we don't initialize ret here, for the cases of freq matched in the table,
>>>> it will return an unknown ret value. It is not make sense, right?
>>>>
>>>> Or you may want to say we don't need “ret” , just need to return gear value?
>>>> But we need this "ret" to check whether the freq is invalid.
>>>>
>>>
>>> I meant to say that you can just return 0 directly in success case and -EINVAL
>>> in the case of error.
>>>
>> Hi Mani,
>>
>> If we don't print freq here , I think your suggestion is very good. If we
>> print freq in this function , using "ret" to indicate success case and
>> failure case and print freq an the end of this function is the way to avoid
>> code bloat.
>>
>> How do you think about it?
>>
> 
> I don't understand how code bloat comes into picture here. I'm just asking for
> this:
> 
> static int ufs_qcom_freq_to_gear_speed(struct ufs_hba *hba, unsigned long freq, u32 *gear)
> {
> 	switch (freq) {
> 	case 403000000:
> 		*gear = UFS_HS_G5;
> 		break;
> 	...
> 
> 	default:
> 		dev_err(hba->dev, "Unsupported clock freq: %ld\n", freq);
> 		return -EINVAL;
> 	}
> 	
> 	return 0;
> }
> 
>>>>>> +
>>>>>> +	switch (freq) {
>>>>>> +	case 403000000:
>>>>>> +		*gear = UFS_HS_G5;
>>>>>> +		break;
>>>>>> +	case 300000000:
>>>>>> +		*gear = UFS_HS_G4;
>>>>>> +		break;
>>>>>> +	case 201500000:
>>>>>> +		*gear = UFS_HS_G3;
>>>>>> +		break;
>>>>>> +	case 150000000:
>>>>>> +	case 100000000:
>>>>>> +		*gear = UFS_HS_G2;
>>>>>> +		break;
>>>>>> +	case 75000000:
>>>>>> +	case 37500000:
>>>>>> +		*gear = UFS_HS_G1;
>>>>>> +		break;
>>>>>> +	default:
>>>>>> +		ret = -EINVAL;
>>>>>> +		dev_err(hba->dev, "Unsupported clock freq\n");
>>>>>
>>>>> Print the freq.
>>>>
>>>> Ok, thank for your suggestion, we can print freq with dev_dbg() in next
>>>> version.
>>>>
>>>
>>> No, use dev_err() with the freq. >
>>> - Mani
>>>
>> I think use dev_err() here does not make sense:
>>
>> 1. This print is not an error message , just an information print. Using
>> dev_err() reduces the readability of this code.
> 
> Then why it was dev_err() in the first place?
> 
>> 2. This prints will be print very frequent, I afraid it will increase the
>> latency of clock scaling.
>>
> 
> First you need to decide whether this print should warn user or not. It is
> telling users that the OPP table supplied a frequency that doesn't match the
> gear speed. This can happen if there is a discrepancy between DT and the driver.
> In that case, the users *should* be warned to fix the driver/DT. If you bury it
> with dev_dbg(), no one will notice it.
> 
> If your concern is with the frequency of logs, then use dev_err_ratelimited().
> 
> - Mani
> 
I misunderstand your point Mani, I thought you want me to print freq for 
all cases...  if you mean that print failure case, I already added it in 
patch V2.

-Ziqi

