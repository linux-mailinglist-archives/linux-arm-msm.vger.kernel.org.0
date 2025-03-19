Return-Path: <linux-arm-msm+bounces-51893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF13A68502
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 07:21:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4FC5A7AAA00
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 06:20:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF11C1E5200;
	Wed, 19 Mar 2025 06:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="a4kwOa7s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0516145355;
	Wed, 19 Mar 2025 06:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742365281; cv=none; b=jlv5GO50eOIICPXqLzZyHaxb0YZpcXXVVUB0OqTtQ90vAPUpLf5tYGLrAi0SLJas5bE6VPM5Wr3wfiAL4jgCy5DapRY+ODwa+bLUiXdzjIv2N0U0C46klZIlwdWI2xATjD3/eZXr05w3RK2rJk+XrbFue5dIxlnBkp6O2UqnQp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742365281; c=relaxed/simple;
	bh=OLFn3laY9iREJRgu5TUvkljr0srEfgKR0OPFCNV7E7E=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=chLK3YLsNtNPi2b26uZoNK6h+QiblN6W3Jd2XYBLOV8ex9G4ghoPyFc+dXelV1bz/0z23a4aiUA6XfUYg8NfUK9U/5xyRqBiaxMqUVYfWGcKp8CK/KX+nkRBCL68MkzLlvIWZk1n9h6ZwMeQEwH1bHl+iBqM1B85I6/JrHCK1ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=a4kwOa7s; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52J4lf7A013111;
	Wed, 19 Mar 2025 06:21:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2qdRp8Hu86FxYH11C7ZUjmNQrBeU5Mc8bnFsHDfI1LU=; b=a4kwOa7sZpVqV95O
	ltt7HEI2B3gL5p/Ws+8LIcYxyyZ3DUkJRMNrqUMr4xm9JXzlvmCYQVWdAjbr3AAF
	iQgrii5tSGWuBVB1qr+wBfJWgOMH+wSzYaSHFZCPZmlWXIC3M5oUGktLjh5EX6hJ
	s1tUT5A5M7t9UylmQi0cx9Og2Os6S+t1ZELi74ixk6sAtyICUDTbGFy3hEinEIIi
	/VrYMhV4i42CxAI4uQqSp20zpWwSGVd2wApS/OQ6RUHR5GeilhE6GABFM0MbaE9i
	kEhs+qKv6MpCIWpM/iYf2x6UVkpuUtSEyY+OM+qXd3pqz93NATptMrXbX2RxpAvs
	50c7LQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45exwtmcmm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Mar 2025 06:21:14 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52J6LEJg024824
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Mar 2025 06:21:14 GMT
Received: from [10.216.47.186] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 18 Mar
 2025 23:21:10 -0700
Message-ID: <12753be6-c69b-448d-a258-79221f4dbc7c@quicinc.com>
Date: Wed, 19 Mar 2025 11:51:07 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 2/3] scsi: ufs-qcom: Add support for dumping MCQ
 registers
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K.
 Petersen" <martin.petersen@oracle.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_nitirawa@quicinc.com>,
        <quic_cang@quicinc.com>, <quic_nguyenb@quicinc.com>
References: <20250313051635.22073-1-quic_mapa@quicinc.com>
 <20250313051635.22073-3-quic_mapa@quicinc.com>
 <20250318064421.bvlv2xz7libxikk5@thinkpad>
Content-Language: en-US
From: MANISH PANDEY <quic_mapa@quicinc.com>
In-Reply-To: <20250318064421.bvlv2xz7libxikk5@thinkpad>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: BgMpNWG2ieulSgn4SmGOwttExQCdI6jW
X-Proofpoint-ORIG-GUID: BgMpNWG2ieulSgn4SmGOwttExQCdI6jW
X-Authority-Analysis: v=2.4 cv=UoJjN/wB c=1 sm=1 tr=0 ts=67da625a cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=-TfpAPsFSdCQXjtAxxAA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_02,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=774
 phishscore=0 adultscore=0 clxscore=1015 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503190042



On 3/18/2025 12:14 PM, Manivannan Sadhasivam wrote:
> On Thu, Mar 13, 2025 at 10:46:34AM +0530, Manish Pandey wrote:
>> This patch adds functionality to dump MCQ registers.
>> This will help in diagnosing issues related to MCQ
>> operations by providing detailed register dumps.
>>
> 
> Same comment as previous patch. Also, make use of 75 column width.
> 
will Update in next patch set.>> Signed-off-by: Manish Pandey 
<quic_mapa@quicinc.com>
>> ---
>>
>> Changes in v3:
>> - Addressed Bart's review comments by adding explanations for the
>>    in_task() and usleep_range() calls.
>> Changes in v2:
>> - Rebased patchsets.
>> - Link to v1: https://lore.kernel.org/linux-arm-msm/20241025055054.23170-1-quic_mapa@quicinc.com/
>> ---
>>   drivers/ufs/host/ufs-qcom.c | 60 +++++++++++++++++++++++++++++++++++++
>>   drivers/ufs/host/ufs-qcom.h |  2 ++
>>   2 files changed, 62 insertions(+)
>>
>> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
>> index f5181773c0e5..fb9da04c0d35 100644
>> --- a/drivers/ufs/host/ufs-qcom.c
>> +++ b/drivers/ufs/host/ufs-qcom.c
>> @@ -1566,6 +1566,54 @@ int ufs_qcom_testbus_config(struct ufs_qcom_host *host)
>>   	return 0;
>>   }
>>   
>> +static void ufs_qcom_dump_mcq_hci_regs(struct ufs_hba *hba)
>> +{
>> +	/* sleep intermittently to prevent CPU hog during data dumps. */
>> +	/* RES_MCQ_1 */
>> +	ufshcd_dump_regs(hba, 0x0, 256 * 4, "MCQ HCI 1da0000-1da03f0 ");
>> +	usleep_range(1000, 1100);
> 
> If your motivation is just to not hog the CPU, use cond_resched().
> 
> - Mani
> 
The intention here is to introduce a specific delay between each dump. 
Therefore, i would like to use usleep_range() instead of cond_resched(). 
Please let me know if i am getting it wrong..


