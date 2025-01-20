Return-Path: <linux-arm-msm+bounces-45582-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCAEFA16BF3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 13:03:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F072F3A0285
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 12:03:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70C641DE3CE;
	Mon, 20 Jan 2025 12:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IZ2FNzsm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94001B87F4;
	Mon, 20 Jan 2025 12:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737374608; cv=none; b=p/7fe2w6efW5KpOwrnnt83Ynwzv/Edbtw1Va8XoX4irmgrm+N117jc1REQ2Yfe61PQh0tvI2vk4PsIA6oI9CYczz+vhneoylk49ILfbGyH8tbz3/QPlkyPLmOlk6regBv9VXmIefjfyH99UORxTsF8/nQUO6RyUpMdt+bUXpTcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737374608; c=relaxed/simple;
	bh=lEjAcaQ/IA367ykjPbgWMNqK5EUqKaQw09hUOBDrkmk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ezWiw3hZIWu5cOjuuDLDR8OEBBWwJueAAEv2Rnlvt69Ux4dQftVgWnr6VPmobFik80ZplIT2L7lMrAAZJMuagusqkJiVe6jG1wvrQekkzMYr7qRSklRTRFB/bpyrDdph+ktwT8IAoTekEcby3BHbG8jt4BBaHCpzgWk9tjXkxYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IZ2FNzsm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50KAKpEt009769;
	Mon, 20 Jan 2025 12:02:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F0LtLgNog6mkkg27XeRJzEW4BhIVnJvU21YzxoUd3s8=; b=IZ2FNzsmTAjPdcpf
	sD1TxlJkKThZCCiAG5ZV25NeTNC8huuZ6+3FgSK/tnNfZ/wPlCfrPB+gDeY2RSO4
	NLvhZYS5WzGrQOQ7mWFnlpq0xDpY2adNCLEBPEWcCHj3oj/C16s3m8FbpSjxSFn+
	9UKhTOXj0qOmLgpsgxr3pLoC0XSB3gTJi+okt/NHTjCB6Ufjfr41gpVHJE6bHIJG
	UqB+HcJnEDDzIwanvoRGvF555Tcxd7QcXU1g/d0QumD1yPJXudTptZ7+gS/7OwaR
	/A2hQbu2B25pNNSS8bITTh3BNRDMu7Z08QflGQS2Fep+rJcWX2ZNKBqUe4DenqlB
	Dyuf4g==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 449mng87jm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jan 2025 12:02:56 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50KC2tp8018733
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jan 2025 12:02:55 GMT
Received: from [10.239.155.136] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 20 Jan
 2025 04:02:52 -0800
Message-ID: <9910bc4a-2d60-43a8-a14e-05bbb30d0011@quicinc.com>
Date: Mon, 20 Jan 2025 20:02:49 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] scsi: ufs: qcom: Pass target_freq to clk scale pre
 and post change
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
        "open list:UNIVERSAL FLASH STORAGE
 HOST CONTROLLER DRIVER..." <linux-arm-msm@vger.kernel.org>,
        open list
	<linux-kernel@vger.kernel.org>
References: <20250116091150.1167739-1-quic_ziqichen@quicinc.com>
 <20250116091150.1167739-3-quic_ziqichen@quicinc.com>
 <20250119072204.6arlcagxzdgawb4n@thinkpad>
Content-Language: en-US
From: Ziqi Chen <quic_ziqichen@quicinc.com>
In-Reply-To: <20250119072204.6arlcagxzdgawb4n@thinkpad>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: wwRfGgS8tJAcjUjp52c6siYcCgmOt8NY
X-Proofpoint-GUID: wwRfGgS8tJAcjUjp52c6siYcCgmOt8NY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-20_02,2025-01-20_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 mlxscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 impostorscore=0 mlxlogscore=999 adultscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501200100

Hi Mani,

Thanks for you review~

On 1/19/2025 3:22 PM, Manivannan Sadhasivam wrote:
> On Thu, Jan 16, 2025 at 05:11:43PM +0800, Ziqi Chen wrote:
>> From: Can Guo <quic_cang@quicinc.com>
>>
>> If OPP V2 is used, devfreq clock scaling may scale clock amongst more than
>> two freqs.
> 
> Same comment as previous patch.
> 

please see my response in previous patch.

>> In the case of scaling up, the devfreq may decide to scale the
>> clock to an intermidiate freq base on load, but the clock scale up pre
>> change operation uses settings for the max clock freq unconditionally. Fix
>> it by passing the target_freq to clock scale up pre change so that the
>> correct settings for the target_freq can be used.
>>
>> In the case of scaling down, the clock scale down post change operation
>> is doing fine, because it reads the actual clock rate to tell freq, but to
>> keep symmetry with clock scale up pre change operation, just use the
>> target_freq instead of reading clock rate.
>>
>> Co-developed-by: Ziqi Chen <quic_ziqichen@quicinc.com>
>> Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
>> Signed-off-by: Can Guo <quic_cang@quicinc.com>
>> ---
>>   drivers/ufs/host/ufs-qcom.c | 23 ++++++++++++-----------
>>   1 file changed, 12 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
>> index b6eef975dc46..1e8a23eb8c13 100644
>> --- a/drivers/ufs/host/ufs-qcom.c
>> +++ b/drivers/ufs/host/ufs-qcom.c
>> @@ -97,7 +97,7 @@ static const struct __ufs_qcom_bw_table {
>>   };
>>   
>>   static void ufs_qcom_get_default_testbus_cfg(struct ufs_qcom_host *host);
>> -static int ufs_qcom_set_core_clk_ctrl(struct ufs_hba *hba, bool is_scale_up);
>> +static int ufs_qcom_set_core_clk_ctrl(struct ufs_hba *hba, unsigned long freq);
>>   
>>   static struct ufs_qcom_host *rcdev_to_ufs_host(struct reset_controller_dev *rcd)
>>   {
>> @@ -524,7 +524,7 @@ static int ufs_qcom_link_startup_notify(struct ufs_hba *hba,
>>   			return -EINVAL;
>>   		}
>>   
>> -		err = ufs_qcom_set_core_clk_ctrl(hba, true);
>> +		err = ufs_qcom_set_core_clk_ctrl(hba, ULONG_MAX);
>>   		if (err)
>>   			dev_err(hba->dev, "cfg core clk ctrl failed\n");
>>   		/*
>> @@ -1231,7 +1231,7 @@ static int ufs_qcom_set_clk_40ns_cycles(struct ufs_hba *hba,
>>   	return ufshcd_dme_set(hba, UIC_ARG_MIB(PA_VS_CORE_CLK_40NS_CYCLES), reg);
>>   }
>>   
>> -static int ufs_qcom_set_core_clk_ctrl(struct ufs_hba *hba, bool is_scale_up)
>> +static int ufs_qcom_set_core_clk_ctrl(struct ufs_hba *hba, unsigned long freq)
>>   {
>>   	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
>>   	struct list_head *head = &hba->clk_list_head;
>> @@ -1245,10 +1245,11 @@ static int ufs_qcom_set_core_clk_ctrl(struct ufs_hba *hba, bool is_scale_up)
>>   		    !strcmp(clki->name, "core_clk_unipro")) {
>>   			if (!clki->max_freq)
>>   				cycles_in_1us = 150; /* default for backwards compatibility */
>> -			else if (is_scale_up)
>> +			else if (freq == ULONG_MAX)
>>   				cycles_in_1us = ceil(clki->max_freq, (1000 * 1000));
>>   			else
>> -				cycles_in_1us = ceil(clk_get_rate(clki->clk), (1000 * 1000));
>> +				cycles_in_1us = ceil(freq, (1000 * 1000));
> 
> Consider switching to HZ_PER_MHZ in a separate patch later
Sure, Thanks for suggestion,  will update in next version.

> 
> - Mani

-Ziqi

> 

