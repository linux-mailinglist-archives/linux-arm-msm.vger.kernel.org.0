Return-Path: <linux-arm-msm+bounces-53582-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0525AA813A6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 19:29:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B3B141BA7126
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 17:29:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4F0323BFBC;
	Tue,  8 Apr 2025 17:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MfkvRfuk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EEB922E3FD;
	Tue,  8 Apr 2025 17:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744133336; cv=none; b=CYrj5GAmdgwkoEaNtvZDhkZJ0vM5TkwHChCm+9r17TyHdlY+o89/nGfP6rxBFHBYd4fUWlxkdAPTVuvk4V5X6f7/MSvVZKzo3dULeRFNeewjZiLyxhiaUDtROKI5dy1koR1mE406PJ9ByI5MCNRVadk3ZZKkpY16uuSvDKxJB68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744133336; c=relaxed/simple;
	bh=Xxwbh7HQc+lWm479yiFz4cDq4HGpRn/FdgToxEUgxdI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Byx/96CCJqo4soPrBZ3ErKDXtdG7IqmUYzRSSQUHzb74NQ3WaUJP6g9VEeBG/NFA9MAWuhMBKwBiiwB0gu7tq/gHbsR7sQ2AiGE1vKHnbW+uifDHSbizVkAqoaxxngcg0IK2ehAZGZH2CyODtNT21um2m1WP36liCFjZi8HC0So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MfkvRfuk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538BIEr8019609;
	Tue, 8 Apr 2025 17:28:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mo7qjYNXfMP4RzF1Xz/BeTE7fn4l0CPVuE3R6s57wOw=; b=MfkvRfukXUbkFtZW
	VVfhYDPQ70Jn/cEPbfWGbCooHhS8+bsDINBuLZdrZQ1dv6XfhmoKKszgStvOmNGX
	Jui2Qu4P/GQ9/iiBZsmD0lYqwHdNav7kF2A4aaOKeE90AxKL5CgDQZEnDhlfKBGx
	aS9izGEeY24PNVkvjx47OkW3IAo0yGhgbeJWRqDgMjSaogwSpv1uwWashL/UdrIN
	nDc6+zinbOTy3H4jn45vgfyTs76aDCW2obCBEvSkxnfFPpjoAl4mEWXGQGF5JKCt
	xR3qGrPgqYB0MFqpAAoo+vHd1RDKoujNMMXCcSQYMyU7IVO1gSzlswoutd6SXN3y
	n/zc5Q==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twg3gncf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Apr 2025 17:28:30 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 538HSTJQ032667
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 8 Apr 2025 17:28:29 GMT
Received: from [10.216.60.96] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 8 Apr 2025
 10:28:24 -0700
Message-ID: <cf81fc11-f47b-422c-9c7d-860e6f93d930@quicinc.com>
Date: Tue, 8 Apr 2025 22:58:10 +0530
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
 <25d8a781-14ea-4b97-b6b4-f9d472c1b692@quicinc.com>
 <cwwf4z2lrdhyv3nsj7do6ycn4tmdaii3wsr37vehgqpvvkgkwv@iugp4vu5srdm>
Content-Language: en-US
From: MANISH PANDEY <quic_mapa@quicinc.com>
In-Reply-To: <cwwf4z2lrdhyv3nsj7do6ycn4tmdaii3wsr37vehgqpvvkgkwv@iugp4vu5srdm>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: gGuq3g2wZ6PAq7ZBgbHRu_klZzlNH-L7
X-Proofpoint-ORIG-GUID: gGuq3g2wZ6PAq7ZBgbHRu_klZzlNH-L7
X-Authority-Analysis: v=2.4 cv=I/9lRMgg c=1 sm=1 tr=0 ts=67f55cbe cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=N54-gffFAAAA:8 a=COk6AnOGAAAA:8
 a=sXzwHUtZ3gcm8ngJyxUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_07,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 spamscore=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080120



On 4/8/2025 10:01 PM, Manivannan Sadhasivam wrote:
> On Tue, Apr 08, 2025 at 01:14:50PM +0530, MANISH PANDEY wrote:
>>
>>
>> On 4/8/2025 12:53 PM, Manivannan Sadhasivam wrote:
>>> On Tue, Apr 08, 2025 at 11:07:58AM +0530, MANISH PANDEY wrote:
>>>>
>>>>
>>>> On 4/7/2025 12:05 AM, Manivannan Sadhasivam wrote:
>>>>> On Fri, Apr 04, 2025 at 11:15:39PM +0530, Manish Pandey wrote:
>>>>>> Some UFS devices need additional time in hibern8 mode before exiting,
>>>>>> beyond the negotiated handshaking phase between the host and device.
>>>>>> Introduce a quirk to increase the PA_HIBERN8TIME parameter by 100 µs
>>>>>> to ensure proper hibernation process.
>>>>>>
>>>>>
>>>>> This commit message didn't mention the UFS device for which this quirk is being
>>>>> applied.
>>>>>
>>>> Since it's a quirk and may be applicable to other vendors also in future, so
>>>> i thought to keep it general.
>>>>
>>>
>>> You cannot make commit message generic. It should precisely describe the change.
>>>
>>>> Will update in next patch set if required.
>>>>    >> Signed-off-by: Manish Pandey <quic_mapa@quicinc.com>
>>>>>> ---
>>>>>>     drivers/ufs/core/ufshcd.c | 31 +++++++++++++++++++++++++++++++
>>>>>>     include/ufs/ufs_quirks.h  |  6 ++++++
>>>>>>     2 files changed, 37 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
>>>>>> index 464f13da259a..2b8203fe7b8c 100644
>>>>>> --- a/drivers/ufs/core/ufshcd.c
>>>>>> +++ b/drivers/ufs/core/ufshcd.c
>>>>>> @@ -278,6 +278,7 @@ static const struct ufs_dev_quirk ufs_fixups[] = {
>>>>>>     	  .model = UFS_ANY_MODEL,
>>>>>>     	  .quirk = UFS_DEVICE_QUIRK_DELAY_BEFORE_LPM |
>>>>>>     		   UFS_DEVICE_QUIRK_HOST_PA_TACTIVATE |
>>>>>> +		   UFS_DEVICE_QUIRK_PA_HIBER8TIME |
>>>>>>     		   UFS_DEVICE_QUIRK_RECOVERY_FROM_DL_NAC_ERRORS },
>>>>>>     	{ .wmanufacturerid = UFS_VENDOR_SKHYNIX,
>>>>>>     	  .model = UFS_ANY_MODEL,
>>>>>> @@ -8384,6 +8385,33 @@ static int ufshcd_quirk_tune_host_pa_tactivate(struct ufs_hba *hba)
>>>>>>     	return ret;
>>>>>>     }
>>>>>> +/**
>>>>>> + * ufshcd_quirk_override_pa_h8time - Ensures proper adjustment of PA_HIBERN8TIME.
>>>>>> + * @hba: per-adapter instance
>>>>>> + *
>>>>>> + * Some UFS devices require specific adjustments to the PA_HIBERN8TIME parameter
>>>>>> + * to ensure proper hibernation timing. This function retrieves the current
>>>>>> + * PA_HIBERN8TIME value and increments it by 100us.
>>>>>> + */
>>>>>> +static void ufshcd_quirk_override_pa_h8time(struct ufs_hba *hba)
>>>>>> +{
>>>>>> +	u32 pa_h8time = 0;
>>>>>
>>>>> Why do you need to initialize it?
>>>>>
>>>> Agree.. Not needed, will update.>> +	int ret;
>>>>>> +
>>>>>> +	ret = ufshcd_dme_get(hba, UIC_ARG_MIB(PA_HIBERN8TIME),
>>>>>> +			&pa_h8time);
>>>>>> +	if (ret) {
>>>>>> +		dev_err(hba->dev, "Failed to get PA_HIBERN8TIME: %d\n", ret);
>>>>>> +		return;
>>>>>> +	}
>>>>>> +
>>>>>> +	/* Increment by 1 to increase hibernation time by 100 µs */
>>>>>
>>>>>    From where the value of 100us adjustment is coming from?
>>>>>
>>>>> - Mani
>>>>>
>>>> These values are derived from experiments on Qualcomm SoCs.
>>>> However this is also matching with ufs-exynos.c
>>>>
>>>
>>> Okay. In that case, you should mention that the 100us value is derived from
>>> experiments on Qcom and Samsung SoCs. Otherwise, it gives an assumption that
>>> this value is universal.
>>>
>>> - Mani
>>>
>>   << Otherwise, it gives an assumption that this value is universal. >>
>> So with this, should i add this quirk for Qcom only, or should add in
>> ufshcd.c and make it common for all SoC vendors?
>>
> 
> You can add the quirk for both Qcom and Samsung. My comment was about clarifying
> it in the kernel doc comments.
> 
> - Mani
> 
Just for conclusion, why i moved this quirk from ufs-qcom to ufshcd.c is 
as per Bart's suggestion in patchset 
https://lore.kernel.org/lkml/c0691392-1523-4863-a722-d4f4640e4e28@acm.org/

<< Which of these quirks are required for all host controllers and which 
of these quirks are only required for Qualcomm host controllers?

 > Should we consider moving the QUIRK_PA_HIBER8TIME quirk to the ufshcd
 > driver? Please advise.

That would be appreciated. >>

Just to brief, QUIRK_PA_HIBER8TIME is required for Samsung UFS devices 
and may be applicable to all SoC vendors with Samsung ufs device.

If you suggest to move it to ufs-qcom.c, i don't have any concern.
BTW Samsung UFS driver already has this implemented in their driver,
So i need not have to add this quirk to Samsung driver (ufs-exynos.c).

Regards
Manish



