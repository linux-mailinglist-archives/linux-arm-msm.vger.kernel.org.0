Return-Path: <linux-arm-msm+bounces-20267-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7466F8CC7DD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 22:57:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C9154B21694
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 20:56:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02A6A55C3E;
	Wed, 22 May 2024 20:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="I592I46A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC847E0F1;
	Wed, 22 May 2024 20:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716411413; cv=none; b=ibPsVqiAIwriwhLO8ijkOtK4ekOGN8qCWtqG1eD7BwGD8cVtxaco4k1rRtvUKr1FvDz8ACW3KOeVxvhbR/wj8jqdqdJwhyKJz/pcnlKn7gsgsB0chf7pLHA4RoweOJRGcPRLRXV1gpa2p6jozzk9iR2sMxrO+Rwp8bY3rqvUAJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716411413; c=relaxed/simple;
	bh=CDru5RNCnrD435X8yZjpHnl2oifzzplfUwfJRcr7NLw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=H8sfGQ3HIAcY3RaDcZhERbDf1A6m8N115dMLgjFPrXUOe/uO5GqI8sgXQL+Wgt1/lyRStcmhCHOzPI0Rdzm3GYgCGsDwXbSjPSoUFwwGev7oPZ5af+WzxEQ2zpquHkqctcutycWRpyUZkgZcwJQfaMrEAKs8DWvtkHmRZAvHQYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=I592I46A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44MKAiJW008151;
	Wed, 22 May 2024 20:56:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=r/fw1P+sA7m/FDWZOd/GkBDRf+ShgMI5plIwfLbxwfA=; b=I5
	92I46AaMoJiTKNDwNAGEKN2L/5hDd8QTWmMd1pDS4HcTSH8CteLMjA7geT/4JZu4
	dftID2bYicANdxAjU3OrIrejDrKB1VlaDUyLGQ61fAvGZVB8cTJ+MWxDXJOYIEkp
	o1RQtdfGaZxdUO87MxVXyforXgsIkhCyaodNoQPdKsh/gB817AlFvcBua0bMy7sT
	IqLfCUbGQNlU0K8pGnMnoWLPVslq5UOUz+E5GTJX1aZtp7fHq9EC/uMlRkZdDRXW
	/RSaOeOERtBSJiQM/qlcjRd/McNvUa5awY2wPQ0APWzFpKu/GheKHm/yZzj6eXVz
	rin3nHtiTLDTazQ+JJug==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y6pqc9ryy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 20:56:32 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44MKuVMH028961
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 20:56:31 GMT
Received: from [192.168.143.77] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 22 May
 2024 13:56:30 -0700
Message-ID: <f9595b82-66f9-dce2-7fba-c42b1eacf962@quicinc.com>
Date: Wed, 22 May 2024 13:56:30 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v1 2/2] scsi: ufs: qcom: Update the UIC Command Timeout
Content-Language: en-US
To: Bart Van Assche <bvanassche@acm.org>, <quic_cang@quicinc.com>,
        <quic_nitirawa@quicinc.com>, <avri.altman@wdc.com>,
        <beanhuo@micron.com>, <adrian.hunter@intel.com>,
        <martin.petersen@oracle.com>
CC: <linux-scsi@vger.kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>,
        "James E.J. Bottomley"
	<jejb@linux.ibm.com>,
        "open list:ARM/QUALCOMM SUPPORT"
	<linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <cover.1716359578.git.quic_nguyenb@quicinc.com>
 <8e5593feaac75660ff132d67ee5d9130e628fefb.1716359578.git.quic_nguyenb@quicinc.com>
 <2ec8a7a6-c2cd-4861-9a43-8a4652e0f116@acm.org>
From: "Bao D. Nguyen" <quic_nguyenb@quicinc.com>
In-Reply-To: <2ec8a7a6-c2cd-4861-9a43-8a4652e0f116@acm.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: sIFRUJzm8_g5ah0xumuRXY5KkB1c4ukd
X-Proofpoint-GUID: sIFRUJzm8_g5ah0xumuRXY5KkB1c4ukd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-22_12,2024-05-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 mlxlogscore=999 impostorscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 suspectscore=0 mlxscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405220145

On 5/22/2024 11:18 AM, Bart Van Assche wrote:
> On 5/22/24 00:01, Bao D. Nguyen wrote:
>> Change the UIC command timeout to 2 seconds.
>> This extra time is to allow the uart occasionally print long
>> debug messages and logging from different modules during
>> product development. With the default hardcoded 500ms timeout,
>> the uart printing with interrupt disabled may cause the UIC command
>> interrupt get starved, resulting in a UIC command timeout and
>> eventually a watchdog timeout.
>> When a product development completes, the vendors may
>> select a different UIC command timeout as desired.
>>
>> Signed-off-by: Bao D. Nguyen <quic_nguyenb@quicinc.com>
>> ---
>>   drivers/ufs/host/ufs-qcom.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
>> index 79f8cb3..4649e0f 100644
>> --- a/drivers/ufs/host/ufs-qcom.c
>> +++ b/drivers/ufs/host/ufs-qcom.c
>> @@ -49,6 +49,7 @@ enum {
>>   #define QCOM_UFS_MAX_GEAR 4
>>   #define QCOM_UFS_MAX_LANE 2
>> +#define QCOM_UIC_CMD_TIMEOUT_MS 2000
>>   enum {
>>       MODE_MIN,
>> @@ -1111,6 +1112,8 @@ static int ufs_qcom_init(struct ufs_hba *hba)
>>           dev_warn(dev, "%s: failed to configure the testbus %d\n",
>>                   __func__, err);
>> +    hba->uic_cmd_timeout = QCOM_UIC_CMD_TIMEOUT_MS;
>> +
>>       return 0;
>>   out_variant_clear:
> 
> Given the description of patch 1, the addressed issue is not specific to
> a single vendor. Is that correct?

The issue we are trying to address is not specific to a single vendor.
Any vendor would have a freedom to choose the UIC command timeout. At 
different times during their product development, they can choose 
different UIC command timeout, or use the default 500ms. It's the 
flexibility we would like to give to vendors.

> 
> Since the described issue is only encountered during development, why to
> modify the UIC command timeout unconditionally?

The vendors can enjoy the default 500ms UIC timeout if they prefer.
As long as they don't write to hba->uic_cmd_timeout in the vendor's 
initialization routine, the default value of 500ms will be used.

Thanks,
Bao

> 
> Thanks,
> 
> Bart.


