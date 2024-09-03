Return-Path: <linux-arm-msm+bounces-30529-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 485FF969EE0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 15:18:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7BFF01C209B9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 13:18:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E832F1A7258;
	Tue,  3 Sep 2024 13:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KB5xIPVd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536781CA6B4;
	Tue,  3 Sep 2024 13:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725369529; cv=none; b=fxIyvHjVTjK6AdbUTVRnWJ8h87UC+sVOEDGjjKdYmJPEGWNclUEkBpu1pDQksNfhD2J8Y1Vt0kHNvDi2NX2e5PtFPIDhmYKmAjDPHoQvGgnR8XTQeAL1teYVKBcBLo7ZomSt805Mk8k98oMTV0o8gbjnNJtTWNcY7XjOPxjhVtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725369529; c=relaxed/simple;
	bh=05uQZ9lFcufsZB2jDBM9le+BXNggLQzu/TOKJuZKlAo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Tw61zDkesCB9UqUo2TP6yj4e4nuax6wZM8GqsA25nVssVk8/X5b1FjpVPdml6rQIhhF8nUJ70P5/bx7tF+drJsiyDJjCjuQe6qzj2Rgs0t9A3JYBDV2/QhjDZ/vgl6Ln5XTy2CQrFtdL+J3N/X6xTy58Iujxj2YW6ef2JuziB/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KB5xIPVd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 483Au6Ns031912;
	Tue, 3 Sep 2024 13:18:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VB3blTSOa31WGGm640/etbQTNY76M8eovXBGQBS+FTo=; b=KB5xIPVdlY+GOlCc
	0eLWQPGzjXlB+fgk9NCNTPhR1QV7uTfMchiMnC8OH6GcisTN+cziuZaZJIkp+w0Z
	p9r2adJOGDx7a95dTmg9NhystLNQ5sposkEhDATpxZfZsxbEr80JsjfuvOBI9GYh
	nLD1/+w17md2KmfrBw6fDeS7XClZqn3BAke1oYYdjbW0xdFzrbEXKFbLQjeFyHzR
	QhnwXbZzbQlapD6gWGj6qlLXDnX9ROmQ41JNGcwf4j+s7Pm5r8TYlWeSlzlb2Tdr
	UZljBg66+6Ky9tV64DGDDqFg2ncyEWMAXe6zyLB+WeVVlmLKEVnjirE7DdoVZtlw
	i59GBw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41bt66yedd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Sep 2024 13:18:44 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 483DIh5P019887
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Sep 2024 13:18:43 GMT
Received: from [10.216.16.10] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 3 Sep 2024
 06:18:38 -0700
Message-ID: <de730f33-b311-4a13-a56a-fa8643e02d2f@quicinc.com>
Date: Tue, 3 Sep 2024 18:48:34 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] scsi: ufs: ufs-qcom: add fixup_dev_quirks vops
Content-Language: en-US
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K.
 Petersen" <martin.petersen@oracle.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_nitirawa@quicinc.com>,
        <quic_bhaskarv@quicinc.com>, <quic_narepall@quicinc.com>,
        <quic_rampraka@quicinc.com>, <quic_cang@quicinc.com>,
        <quic_nguyenb@quicinc.com>
References: <20240828134032.10663-1-quic_mapa@quicinc.com>
 <20240828140805.zhvand7q3wbdmfrt@thinkpad>
From: MANISH PANDEY <quic_mapa@quicinc.com>
In-Reply-To: <20240828140805.zhvand7q3wbdmfrt@thinkpad>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: lapH2dUOajQn8JK0pJYizjdpfhm_S3U1
X-Proofpoint-GUID: lapH2dUOajQn8JK0pJYizjdpfhm_S3U1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-03_01,2024-09-03_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 bulkscore=0 mlxscore=0 impostorscore=0 suspectscore=0 phishscore=0
 mlxlogscore=999 lowpriorityscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409030107



On 8/28/2024 7:38 PM, Manivannan Sadhasivam wrote:
> On Wed, Aug 28, 2024 at 07:10:32PM +0530, Manish Pandey wrote:
>> Add fixup_dev_quirk vops in QCOM UFS platforms and provide an initial
>> vendor-specific device quirk table to add UFS device specific quirks
>> which are enabled only for specified UFS devices.
>>
> 
> Why the quirks are enabled only for Qcom platforms? If these are required by the
> UFS device, then they should be added to ufs_fixups[] in ufshcd.c.
> 
As of now, we are not sure if the same would be applicable to other 
vendors as well, so avoiding to add in ufs_fixups[].

>> Micron and Skhynix UFS device needs DELAY_BEFORE_LPM quirk to have a
>> delay before VCC is powered off.
>>
> 
> Micron fix is already part of ufs_fixups[].
Thanks for guidance, will take care in next patch set.
> 
>> Toshiba UFS devices require delay after VCC power rail is turned-off
>> in QCOM platforms. Hence add Toshiba vendor ID and DELAY_AFTER_LPM
>> quirk for Toshiba UFS devices in QCOM platforms.
>>
> 
> This sounds like the issue is specific to Qcom platforms only.
> 
Not sure, if for other vendors it is required. Hence adding for Qcom only.
>> Signed-off-by: Manish Pandey <quic_mapa@quicinc.com>
>> ---
> 
> Where is the changelog?
> 
> - Mani
> 
>>   drivers/ufs/host/ufs-qcom.c | 20 ++++++++++++++++++++
>>   1 file changed, 20 insertions(+)
>>
>> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
>> index 810e637047d0..9dbfbe643e5e 100644
>> --- a/drivers/ufs/host/ufs-qcom.c
>> +++ b/drivers/ufs/host/ufs-qcom.c
>> @@ -834,6 +834,25 @@ static int ufs_qcom_apply_dev_quirks(struct ufs_hba *hba)
>>   	return err;
>>   }
>>   
>> +/* UFS device-specific quirks */
>> +static struct ufs_dev_quirk ufs_qcom_dev_fixups[] = {
>> +	{ .wmanufacturerid = UFS_VENDOR_MICRON,
>> +	  .model = UFS_ANY_MODEL,
>> +	  .quirk = UFS_DEVICE_QUIRK_DELAY_BEFORE_LPM },
>> +	{ .wmanufacturerid = UFS_VENDOR_SKHYNIX,
>> +	  .model = UFS_ANY_MODEL,
>> +	  .quirk = UFS_DEVICE_QUIRK_DELAY_BEFORE_LPM },
>> +	{ .wmanufacturerid = UFS_VENDOR_TOSHIBA,
>> +	  .model = UFS_ANY_MODEL,
>> +	  .quirk = UFS_DEVICE_QUIRK_DELAY_AFTER_LPM },
>> +	{}
>> +};
>> +
>> +static void ufs_qcom_fixup_dev_quirks(struct ufs_hba *hba)
>> +{
>> +	ufshcd_fixup_dev_quirks(hba, ufs_qcom_dev_fixups);
>> +}
>> +
>>   static u32 ufs_qcom_get_ufs_hci_version(struct ufs_hba *hba)
>>   {
>>   	return ufshci_version(2, 0);
>> @@ -1798,6 +1817,7 @@ static const struct ufs_hba_variant_ops ufs_hba_qcom_vops = {
>>   	.link_startup_notify    = ufs_qcom_link_startup_notify,
>>   	.pwr_change_notify	= ufs_qcom_pwr_change_notify,
>>   	.apply_dev_quirks	= ufs_qcom_apply_dev_quirks,
>> +	.fixup_dev_quirks       = ufs_qcom_fixup_dev_quirks,
>>   	.suspend		= ufs_qcom_suspend,
>>   	.resume			= ufs_qcom_resume,
>>   	.dbg_register_dump	= ufs_qcom_dump_dbg_regs,
>> -- 
>> 2.17.1
>>
> 

