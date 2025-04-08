Return-Path: <linux-arm-msm+bounces-53460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E7241A7F439
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 07:39:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DEB043B32DA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 05:38:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD7CE216396;
	Tue,  8 Apr 2025 05:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LdZSueD3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADCD9215782;
	Tue,  8 Apr 2025 05:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744090744; cv=none; b=r7KT7eHaOkGgyOdlMnBLaB8E2DAxylWV7GOFw2PLRP7nw2plLKkK6/k9zOsaoLmfkdy5l7JjDv2OBUx8uHvM9skbob+bpcvcMHfFoP2OtbPbe9jhkb0CAALROu/hX3HiweQni51Lkzf1vwaiYy6ds5xt84w/ejrEmOw68BZ7LxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744090744; c=relaxed/simple;
	bh=oWaA2H6BcrLZcleZ8oSxypJ20x+11KKhnPxk9s+HpCw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=d5ZqZSYJni3LL5tyoR3vVcFqGAP6ae507Mo5P2HwoCxX/hLqr0y+tyeMTJe5nKKNUfnrpFnf209OphwyoM2YoqTc+Ja4UdWnDrZHcKopbGydVJ/qoKOjJtB+4wUD+ZRhvaegqhQ63pSfxy8vzFnS7mPGQ51lQs2QMuAjWKZ+ip4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LdZSueD3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5382HcwS023850;
	Tue, 8 Apr 2025 05:38:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W04bo2gjFy9d2YdweaHf66J+BDIRb38cQgx3cFMMsn4=; b=LdZSueD3a6EOUCka
	sX8FyBl9GQUv3KffWK2C5MC3m0pxh0ht4xgOQCNV+M5E4gASodlvwZmhROwmPXoJ
	v4NqzrXTi0kLZ+Q97d69RYLxmIBsjCMPNybDhszBBlzIQPcdk/R3lVHLaXGYPFss
	T/a0JCm+D1NZFemx/KGxC8csylD5oQdIU9dzMOYa7rrfZ1PtlS0Pls6fGQND92kn
	l12/fphn5vHLMOCGZ797jwUotArSVQC8wX1FC6mob0AZ2pkK1Ef8mcyQyXLNRMoZ
	PTpFA6w1aJevpJkfbzYj9QGt05jbXdNf+1WbSxOQKjFeWLmpiPC1Jc6v/qLZBbFD
	57I48A==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twftehmp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Apr 2025 05:38:09 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5385c9cY030548
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 8 Apr 2025 05:38:09 GMT
Received: from [10.217.217.240] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 7 Apr 2025
 22:38:05 -0700
Message-ID: <d09641c7-c266-4f0a-a0e3-56f63d8c9ce3@quicinc.com>
Date: Tue, 8 Apr 2025 11:07:58 +0530
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
Content-Language: en-US
From: MANISH PANDEY <quic_mapa@quicinc.com>
In-Reply-To: <hcguawgzuqgi2cyw3nf7uiilahjsvrm37f6zgfqlnfkck3jatv@xgaca3zgts2u>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=B5+50PtM c=1 sm=1 tr=0 ts=67f4b641 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=C3wUGYcifkSLtJB_Z24A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: eoztKyiyFp5nqaVSt1ZwT0ZLfSVVnkpU
X-Proofpoint-ORIG-GUID: eoztKyiyFp5nqaVSt1ZwT0ZLfSVVnkpU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_01,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080039



On 4/7/2025 12:05 AM, Manivannan Sadhasivam wrote:
> On Fri, Apr 04, 2025 at 11:15:39PM +0530, Manish Pandey wrote:
>> Some UFS devices need additional time in hibern8 mode before exiting,
>> beyond the negotiated handshaking phase between the host and device.
>> Introduce a quirk to increase the PA_HIBERN8TIME parameter by 100 µs
>> to ensure proper hibernation process.
>>
> 
> This commit message didn't mention the UFS device for which this quirk is being
> applied.
> 
Since it's a quirk and may be applicable to other vendors also in 
future, so i thought to keep it general.

Will update in next patch set if required.
  >> Signed-off-by: Manish Pandey <quic_mapa@quicinc.com>
>> ---
>>   drivers/ufs/core/ufshcd.c | 31 +++++++++++++++++++++++++++++++
>>   include/ufs/ufs_quirks.h  |  6 ++++++
>>   2 files changed, 37 insertions(+)
>>
>> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
>> index 464f13da259a..2b8203fe7b8c 100644
>> --- a/drivers/ufs/core/ufshcd.c
>> +++ b/drivers/ufs/core/ufshcd.c
>> @@ -278,6 +278,7 @@ static const struct ufs_dev_quirk ufs_fixups[] = {
>>   	  .model = UFS_ANY_MODEL,
>>   	  .quirk = UFS_DEVICE_QUIRK_DELAY_BEFORE_LPM |
>>   		   UFS_DEVICE_QUIRK_HOST_PA_TACTIVATE |
>> +		   UFS_DEVICE_QUIRK_PA_HIBER8TIME |
>>   		   UFS_DEVICE_QUIRK_RECOVERY_FROM_DL_NAC_ERRORS },
>>   	{ .wmanufacturerid = UFS_VENDOR_SKHYNIX,
>>   	  .model = UFS_ANY_MODEL,
>> @@ -8384,6 +8385,33 @@ static int ufshcd_quirk_tune_host_pa_tactivate(struct ufs_hba *hba)
>>   	return ret;
>>   }
>>   
>> +/**
>> + * ufshcd_quirk_override_pa_h8time - Ensures proper adjustment of PA_HIBERN8TIME.
>> + * @hba: per-adapter instance
>> + *
>> + * Some UFS devices require specific adjustments to the PA_HIBERN8TIME parameter
>> + * to ensure proper hibernation timing. This function retrieves the current
>> + * PA_HIBERN8TIME value and increments it by 100us.
>> + */
>> +static void ufshcd_quirk_override_pa_h8time(struct ufs_hba *hba)
>> +{
>> +	u32 pa_h8time = 0;
> 
> Why do you need to initialize it?
> 
Agree.. Not needed, will update.>> +	int ret;
>> +
>> +	ret = ufshcd_dme_get(hba, UIC_ARG_MIB(PA_HIBERN8TIME),
>> +			&pa_h8time);
>> +	if (ret) {
>> +		dev_err(hba->dev, "Failed to get PA_HIBERN8TIME: %d\n", ret);
>> +		return;
>> +	}
>> +
>> +	/* Increment by 1 to increase hibernation time by 100 µs */
> 
>  From where the value of 100us adjustment is coming from?
> 
> - Mani
> 
These values are derived from experiments on Qualcomm SoCs.
However this is also matching with ufs-exynos.c

fsd_ufs_post_link() {
     ufshcd_dme_get(hba,UIC_ARG_MIB(PA_HIBERN8TIME),  		 
&max_rx_hibern8_time_cap);
     .......
     ufshcd_dme_set(hba, UIC_ARG_MIB(PA_HIBERN8TIME), 	 
max_rx_hibern8_time_cap + 1);
     ...
}

Thanks
Manish

