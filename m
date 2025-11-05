Return-Path: <linux-arm-msm+bounces-80389-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF8AC33C39
	for <lists+linux-arm-msm@lfdr.de>; Wed, 05 Nov 2025 03:26:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DDC614635E2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Nov 2025 02:26:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E897F21FF48;
	Wed,  5 Nov 2025 02:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="p6085tZf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1008F212548;
	Wed,  5 Nov 2025 02:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762309613; cv=none; b=ox1t8N9lW3rlFwpH2AwrNa6Oo6yJpblEo15CgUVK6A46w/wgZhMn4jaSSQ+Sg1Tt9UbyQ+6DbRN1YJe6BHW3XLWL7DHRA2iMLubhgRHJ604/5ZE8Tc3K8IOmWTbKCaVOBBNh1+b7GXV4LvjyWp7wEetYPqZ5z1uODiJQnj0BpnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762309613; c=relaxed/simple;
	bh=cl329UhLvY1eUGySS9zOB0PA/vLb/1DVdgsoUdvcNMw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qXVT1xUMqi3XgrNJubFyKzuM1F2BXq1PGjG7YTvsGAzR7t05DFgXjl8ZtCIHmLvwBtTPAu9sx54cZ7d86wUGPKLaxRlsoR9T6akOr/rXe+x1KhlzJeSFNyHzbzzImK6T1S0/I7LH8j7NU32cyG7mPo3rhZxUEPMWBYwdWIqGRcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=p6085tZf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A4KfmEg2904307;
	Wed, 5 Nov 2025 02:26:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IEY0M6R23/BS8mR0Tg9Y8Wdg6If3RyMSXoF8BV/dzbI=; b=p6085tZf75yOTwhI
	4V++P+/mUvwomrZ8BdRjan5lqG+CyM839T/Gfe3GJFyliEUX9sumkIM+c/JLwwUX
	Y0FsEqzhvrqIvU1peyrIqYcWNiHA0nVcDfzh313lCX/fh2Pd/k95GmVK0I+yZSO4
	0VW4RH2JB1CLUBltL9D6WgyP9saWRo1TRxBPPI5Od1rqf6ixcjsdDzClRDGhyHFa
	dyvvEcx7uw3WL3HMj5f701IQmbmQ01eBmX4jEBTDVPUmuO+dpowUGpRTFAOzkRN/
	8nYp4uoj6wnVa9PlIlj/CuDpV81kwj35KIpZiJB0B+iVZa2azo1udRlbXqlXHbut
	f1IGVA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7mbbsrre-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Nov 2025 02:26:36 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5A52QZEV003415
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 5 Nov 2025 02:26:35 GMT
Received: from [10.253.38.19] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Tue, 4 Nov
 2025 18:26:32 -0800
Message-ID: <e9facb3e-1f35-46e4-a1d4-a377ecdb6d4a@quicinc.com>
Date: Wed, 5 Nov 2025 10:26:29 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] Bluetooth: hci_qca: Fix SSR unable to wake up bug
To: Paul Menzel <pmenzel@molgen.mpg.de>
CC: Bartosz Golaszewski <brgl@bgdev.pl>,
        Marcel Holtmann
	<marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-bluetooth@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>,
        <quic_chejiang@quicinc.com>, <quic_jiaymao@quicinc.com>,
        <quic_chezhou@quicinc.com>
References: <20251104112601.2670019-1-quic_shuaz@quicinc.com>
 <0c54ccc4-0526-4d7a-9ce3-42dde5539c7b@molgen.mpg.de>
Content-Language: en-US
From: Shuai Zhang <quic_shuaz@quicinc.com>
In-Reply-To: <0c54ccc4-0526-4d7a-9ce3-42dde5539c7b@molgen.mpg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Zk960QH5Zp8rsCGVjSXKMPswKoyO9AVG
X-Proofpoint-GUID: Zk960QH5Zp8rsCGVjSXKMPswKoyO9AVG
X-Authority-Analysis: v=2.4 cv=MK1tWcZl c=1 sm=1 tr=0 ts=690ab5dc cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=b0gxvoJzpcTEPALTQqYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDAxMyBTYWx0ZWRfXzWw4wTuVVJlF
 T3wHim4Z7bQaTuDTDJuEV8J9/guLy8aoR/ychn2995t/z+V24mI4+wyG2PgIJUsgM9jREQ/+PU8
 0l+B1+C8CYgLOZBPs2N/sXkri+790MTSBnks2c+OuJiN2vpQcmZBrH1rBYz7H30tLgkczmY/uHj
 Qj1V3Ky8yaMsy/P2WNqFr9/ifbfBtkHsdikHYX81R2sSPlbfrIgiR1UnkivZqK913/lrIWbf2gS
 /PQMJLCYQsa0y9d/mewsSpCE4sDUulbmLyV7EN7Ay0IrlN7xt1zn4aqCFFQMRd2Y5C2UD9dsmAD
 9XuBXjNGYKz2ajIMlNvpVGwFjuiFw0rTDXz9AqBfiPsj9t17L+3pVaFCfzEeSWysL724GP+Myws
 cMVMo6jHbncm7cFBCU7zeDgXorTQYQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_01,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511050013

Hi Paul

Thanks for the feedback!

On 11/4/2025 7:43 PM, Paul Menzel wrote:
> Dear Shuai,
> 
> 
> Thank you for your patch.
> 
> Am 04.11.25 um 12:26 schrieb Shuai Zhang:
>> During SSR data collection period, the processing of hw_error events
>> must wait until SSR data Collected or the timeout before it can proceed.
> 
> Collected → collected
> 
>> The wake_up_bit function has been added to address the issue
> 
> has been added → is added
> 
>> where hw_error events could only be processed after the timeout.
> 
> The problem is not totally clear to me. What is the current situation? Maybe start the commit message with that?
> 
>> The timeout unit has been changed from jiffies to milliseconds (ms).
> 
> Please give the numbers, and also document effect of this change. Is the timeout the same, or different?
> 
> Also, why not make that a separate commit?
> 
> Please document a test case.
> 

I’ll fix the grammar, add a commit message to describe the issue, 
include a test case, and use clear_and_wake_up_bit for atomicity.

Additionally, I will submit a new patch to explain the timeout unit issue.

>> Cc: stable@vger.kernel.org
>> Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
>> ---
>>   drivers/bluetooth/hci_qca.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
>> index 888176b0f..a2e3c97a8 100644
>> --- a/drivers/bluetooth/hci_qca.c
>> +++ b/drivers/bluetooth/hci_qca.c
>> @@ -1105,6 +1105,7 @@ static void qca_controller_memdump(struct work_struct *work)
>>                   cancel_delayed_work(&qca->ctrl_memdump_timeout);
>>                   clear_bit(QCA_MEMDUMP_COLLECTION, &qca->flags);
>>                   clear_bit(QCA_IBS_DISABLED, &qca->flags);
>> +                wake_up_bit(&qca->flags, QCA_MEMDUMP_COLLECTION);
>>                   mutex_unlock(&qca->hci_memdump_lock);
>>                   return;
>>               }
>> @@ -1182,6 +1183,7 @@ static void qca_controller_memdump(struct work_struct *work)
>>               qca->qca_memdump = NULL;
>>               qca->memdump_state = QCA_MEMDUMP_COLLECTED;
>>               clear_bit(QCA_MEMDUMP_COLLECTION, &qca->flags);
>> +            wake_up_bit(&qca->flags, QCA_MEMDUMP_COLLECTION);
> 
> `include/linux/wait_bit.h` also contains `clear_and_wake_up_bit()`.
> 
>>           }
>>             mutex_unlock(&qca->hci_memdump_lock);
>> @@ -1602,7 +1604,7 @@ static void qca_wait_for_dump_collection(struct hci_dev *hdev)
>>       struct qca_data *qca = hu->priv;
>>         wait_on_bit_timeout(&qca->flags, QCA_MEMDUMP_COLLECTION,
>> -                TASK_UNINTERRUPTIBLE, MEMDUMP_TIMEOUT_MS);
>> +                TASK_UNINTERRUPTIBLE, msecs_to_jiffies(MEMDUMP_TIMEOUT_MS));
>>         clear_bit(QCA_MEMDUMP_COLLECTION, &qca->flags);
>>   }
> 
> 
> Kind regards,
> 
> Paul

Kind regards,

Shuai



