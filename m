Return-Path: <linux-arm-msm+bounces-53468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B7482A7F70B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 09:50:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 600E742363E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 07:45:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F4A523F262;
	Tue,  8 Apr 2025 07:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ECEgXtqe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41B41FF5F7;
	Tue,  8 Apr 2025 07:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744098319; cv=none; b=HOZ7Potn1kM12STDtWqf5T09wu3YesdPIZbX0h2VRND0qg39AZziDj7RJOFPc9Z2xR/fmkqxy7/tXH3FdscOGH0g95TqarUOZDr9kl+HxK+dNkl9Zp07Ka+jTsTbgQ9+EpgRDkXWiWieXcfY6ZO0lUvTTWdxJa8F4iVsI63VLEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744098319; c=relaxed/simple;
	bh=Mizm5uEJO5H1qNNgLNdW5F3xHw77CVaEhFDifRlvlgA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=umRg9zg43gIGsI7cH2z65QVrIZ5vkQ7O56WsDDutlhejvMhQYnwZIDlM/2pQBhymHKGPhcnqrt8rT7hUkjsqYdCku97PbY3pwUxXPcp4Rndfgz4FXQ0rUo+8o+PqvvGc7wMr8m8NPe3qhsEP4o4x02Zco8vRRQvoJr3RhZkt9pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ECEgXtqe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5382GN4N032610;
	Tue, 8 Apr 2025 07:44:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FoXvxYlgeT51Ldmi420joSo5f8c07apE7nK99oXSsQU=; b=ECEgXtqeh8uhhY5e
	E+1uESUPlp4Jsj+Xvfg/fnT+GPLrAfUv1AkO7F5QVqkJeIFSl0qlNpcPEBB54wBN
	9KFhweGxagHG095/7e3vcLoPqnjDIoxJsNZhZutnlIVcT7tQZq9FaudheraJmTzB
	0nk8pcibF/5ly7aJzlIp135SU6FU+w7WCAKMw4LhnXtZ6j8CJVF9VLqfMfA5Zrg6
	ip10Zg6k5QhEV3BXMhax+n2p2Q7L5hkYUvkP6JKukHLGyiP6Ztq+yuDY0ORQ5cLh
	CeN/f7ORMyIAg77ILfQIjUYTF85PYTVNLyeVU/sBWCoulJltU31yxbASh7djfL4M
	6oCTtA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twfketp8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Apr 2025 07:44:57 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5387iu31001417
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 8 Apr 2025 07:44:56 GMT
Received: from [10.217.217.240] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 8 Apr 2025
 00:44:52 -0700
Message-ID: <25d8a781-14ea-4b97-b6b4-f9d472c1b692@quicinc.com>
Date: Tue, 8 Apr 2025 13:14:50 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/2] scsi: ufs: introduce quirk to extend
 PA_HIBERN8TIME for UFS devices
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K.
 Petersen" <martin.petersen@oracle.com>,
        Alim Akhtar
	<alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche
	<bvanassche@acm.org>, <linux-scsi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_nitirawa@quicinc.com>, <quic_bhaskarv@quicinc.com>,
        <quic_rampraka@quicinc.com>, <quic_cang@quicinc.com>,
        <quic_nguyenb@quicinc.com>
References: <20250404174539.28707-1-quic_mapa@quicinc.com>
 <20250404174539.28707-3-quic_mapa@quicinc.com>
 <hcguawgzuqgi2cyw3nf7uiilahjsvrm37f6zgfqlnfkck3jatv@xgaca3zgts2u>
 <d09641c7-c266-4f0a-a0e3-56f63d8c9ce3@quicinc.com>
 <l6xao2ubcvv3ho56dv6qfr3b62ve3olfbhvywg2is2xdhod27r@2nyjfwinrxzm>
Content-Language: en-US
From: MANISH PANDEY <quic_mapa@quicinc.com>
In-Reply-To: <l6xao2ubcvv3ho56dv6qfr3b62ve3olfbhvywg2is2xdhod27r@2nyjfwinrxzm>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: rY7H1816cawbAfHLhS5hb4L8SE4s1iw9
X-Proofpoint-ORIG-GUID: rY7H1816cawbAfHLhS5hb4L8SE4s1iw9
X-Authority-Analysis: v=2.4 cv=b7Oy4sGx c=1 sm=1 tr=0 ts=67f4d3f9 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=PcgxfyDzYYffGdZ7QdYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_02,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 mlxscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 mlxlogscore=999 bulkscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080054



On 4/8/2025 12:53 PM, Manivannan Sadhasivam wrote:
> On Tue, Apr 08, 2025 at 11:07:58AM +0530, MANISH PANDEY wrote:
>>
>>
>> On 4/7/2025 12:05 AM, Manivannan Sadhasivam wrote:
>>> On Fri, Apr 04, 2025 at 11:15:39PM +0530, Manish Pandey wrote:
>>>> Some UFS devices need additional time in hibern8 mode before exiting,
>>>> beyond the negotiated handshaking phase between the host and device.
>>>> Introduce a quirk to increase the PA_HIBERN8TIME parameter by 100 µs
>>>> to ensure proper hibernation process.
>>>>
>>>
>>> This commit message didn't mention the UFS device for which this quirk is being
>>> applied.
>>>
>> Since it's a quirk and may be applicable to other vendors also in future, so
>> i thought to keep it general.
>>
> 
> You cannot make commit message generic. It should precisely describe the change.
> 
>> Will update in next patch set if required.
>>   >> Signed-off-by: Manish Pandey <quic_mapa@quicinc.com>
>>>> ---
>>>>    drivers/ufs/core/ufshcd.c | 31 +++++++++++++++++++++++++++++++
>>>>    include/ufs/ufs_quirks.h  |  6 ++++++
>>>>    2 files changed, 37 insertions(+)
>>>>
>>>> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
>>>> index 464f13da259a..2b8203fe7b8c 100644
>>>> --- a/drivers/ufs/core/ufshcd.c
>>>> +++ b/drivers/ufs/core/ufshcd.c
>>>> @@ -278,6 +278,7 @@ static const struct ufs_dev_quirk ufs_fixups[] = {
>>>>    	  .model = UFS_ANY_MODEL,
>>>>    	  .quirk = UFS_DEVICE_QUIRK_DELAY_BEFORE_LPM |
>>>>    		   UFS_DEVICE_QUIRK_HOST_PA_TACTIVATE |
>>>> +		   UFS_DEVICE_QUIRK_PA_HIBER8TIME |
>>>>    		   UFS_DEVICE_QUIRK_RECOVERY_FROM_DL_NAC_ERRORS },
>>>>    	{ .wmanufacturerid = UFS_VENDOR_SKHYNIX,
>>>>    	  .model = UFS_ANY_MODEL,
>>>> @@ -8384,6 +8385,33 @@ static int ufshcd_quirk_tune_host_pa_tactivate(struct ufs_hba *hba)
>>>>    	return ret;
>>>>    }
>>>> +/**
>>>> + * ufshcd_quirk_override_pa_h8time - Ensures proper adjustment of PA_HIBERN8TIME.
>>>> + * @hba: per-adapter instance
>>>> + *
>>>> + * Some UFS devices require specific adjustments to the PA_HIBERN8TIME parameter
>>>> + * to ensure proper hibernation timing. This function retrieves the current
>>>> + * PA_HIBERN8TIME value and increments it by 100us.
>>>> + */
>>>> +static void ufshcd_quirk_override_pa_h8time(struct ufs_hba *hba)
>>>> +{
>>>> +	u32 pa_h8time = 0;
>>>
>>> Why do you need to initialize it?
>>>
>> Agree.. Not needed, will update.>> +	int ret;
>>>> +
>>>> +	ret = ufshcd_dme_get(hba, UIC_ARG_MIB(PA_HIBERN8TIME),
>>>> +			&pa_h8time);
>>>> +	if (ret) {
>>>> +		dev_err(hba->dev, "Failed to get PA_HIBERN8TIME: %d\n", ret);
>>>> +		return;
>>>> +	}
>>>> +
>>>> +	/* Increment by 1 to increase hibernation time by 100 µs */
>>>
>>>   From where the value of 100us adjustment is coming from?
>>>
>>> - Mani
>>>
>> These values are derived from experiments on Qualcomm SoCs.
>> However this is also matching with ufs-exynos.c
>>
> 
> Okay. In that case, you should mention that the 100us value is derived from
> experiments on Qcom and Samsung SoCs. Otherwise, it gives an assumption that
> this value is universal.
> 
> - Mani
> 
  << Otherwise, it gives an assumption that this value is universal. >>
So with this, should i add this quirk for Qcom only, or should add in 
ufshcd.c and make it common for all SoC vendors?

Regards
Manish


