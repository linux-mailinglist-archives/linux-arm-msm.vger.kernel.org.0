Return-Path: <linux-arm-msm+bounces-2045-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B417F9AC2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 08:20:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 41E22B20881
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 07:20:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A6FAFBFF;
	Mon, 27 Nov 2023 07:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FwBnroai"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC260194;
	Sun, 26 Nov 2023 23:19:59 -0800 (PST)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AR4NCbL030290;
	Mon, 27 Nov 2023 07:19:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=1hpqxLPGQHcFOA/vwCwaxMDhUC/jaMpjm/9u+jSjuj0=;
 b=FwBnroaiAQMX5KHyz34wz5jxzffReqy4YaYWs3zFaULRk9e8LQM37JGQNtLI+jo+mPZi
 7eb0ldATfybzyOOtggab09Reg1MSPZdYufySWUt9sMlSSKHuY2epioh4u/bdYDOwWfTt
 1yiy+37xYeykQGjAbs8dB8bJwMc5S2i3kQ1LpeWXHdCm41FlDGt1OxBfE1IKshSjn5or
 1ldEHIABOkdir7+sK5IrI8z5o11HypyJwf5em+eYb/D9gqQaI4lAZYEHd/+UhHiVE5oZ
 KZYGGsRKAWOOpHTj0RcvfFrvE+2YvZeIiaBJIBj5VumScu/Ke/PBKEWTb7761SXJiKEB ew== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uka7gbcvj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Nov 2023 07:19:55 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AR7Js0k026034
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Nov 2023 07:19:54 GMT
Received: from [10.253.15.56] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Sun, 26 Nov
 2023 23:19:52 -0800
Message-ID: <ae1514d1-1cdf-42f8-ac8c-6e6c2005922f@quicinc.com>
Date: Mon, 27 Nov 2023 15:19:49 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] bus: mhi: host: Take irqsave lock after TRE is
 generated
Content-Language: en-US
To: Manivannan Sadhasivam <mani@kernel.org>
CC: <quic_jhugo@quicinc.com>, <mhi@lists.linux.dev>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_cang@quicinc.com>, <quic_mrana@quicinc.com>,
        Hemant Kumar
	<quic_hemantk@quicinc.com>,
        Lazarus Motha <quic_lmotha@quicinc.com>
References: <1699939661-7385-1-git-send-email-quic_qianyu@quicinc.com>
 <1699939661-7385-5-git-send-email-quic_qianyu@quicinc.com>
 <20231124100916.GB4536@thinkpad>
From: Qiang Yu <quic_qianyu@quicinc.com>
In-Reply-To: <20231124100916.GB4536@thinkpad>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: A1PJZd6F_qxR7CvWpkIsh6NliYQp5ltQ
X-Proofpoint-GUID: A1PJZd6F_qxR7CvWpkIsh6NliYQp5ltQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-27_05,2023-11-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 mlxscore=0
 bulkscore=0 mlxlogscore=910 adultscore=0 phishscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311270050


On 11/24/2023 6:09 PM, Manivannan Sadhasivam wrote:
> On Tue, Nov 14, 2023 at 01:27:41PM +0800, Qiang Yu wrote:
>> From: Hemant Kumar <quic_hemantk@quicinc.com>
>>
>> If CONFIG_TRACE_IRQFLAGS is enabled, irq will be enabled once __local_bh_
>> enable_ip is called as part of write_unlock_bh. Hence, let's take irqsave
> "__local_bh_enable_ip" is a function name, so you should not break it.
Thanks for let me know, will note this in following patch.
>
>> lock after TRE is generated to avoid running write_unlock_bh when irqsave
>> lock is held.
>>
> I still don't understand this commit message. Where is the write_unlock_bh()
> being called?
>
> - Mani
Write_unlock_bh() is invoked in mhi_gen_te()
The calling flow is like
mhi_queue
     read_lock_irqsave(&mhi_cntrl->pm_lock, flags)
     mhi_gen_tre
         write_lock_bh(&mhi_chan->lock)
         write_unlock_bh(&mhi_chan->lock)   // Will enable irq if 
CONFIG_TRACE_IRQFLAGS is enabled
     read_lock_irqsave(&mhi_cntrl->pm_lock, flags)

after adding this patch, the calling flow becomes

mhi_queue
     mhi_gen_tre
         write_lock_bh(&mhi_chan->lock)
         write_unlock_bh(&mhi_chan->lock)
     read_lock_irqsave(&mhi_cntrl->pm_lock, flags)
     read_lock_irqsave(&mhi_cntrl->pm_lock, flags)
>
>> Signed-off-by: Hemant Kumar <quic_hemantk@quicinc.com>
>> Signed-off-by: Lazarus Motha <quic_lmotha@quicinc.com>
>> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
>> ---
>>   drivers/bus/mhi/host/main.c | 13 +++++--------
>>   1 file changed, 5 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
>> index 33f27e2..d7abd0b 100644
>> --- a/drivers/bus/mhi/host/main.c
>> +++ b/drivers/bus/mhi/host/main.c
>> @@ -1128,17 +1128,15 @@ static int mhi_queue(struct mhi_device *mhi_dev, struct mhi_buf_info *buf_info,
>>   	if (unlikely(MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state)))
>>   		return -EIO;
>>   
>> -	read_lock_irqsave(&mhi_cntrl->pm_lock, flags);
>> -
>>   	ret = mhi_is_ring_full(mhi_cntrl, tre_ring);
>> -	if (unlikely(ret)) {
>> -		ret = -EAGAIN;
>> -		goto exit_unlock;
>> -	}
>> +	if (unlikely(ret))
>> +		return -EAGAIN;
>>   
>>   	ret = mhi_gen_tre(mhi_cntrl, mhi_chan, buf_info, mflags);
>>   	if (unlikely(ret))
>> -		goto exit_unlock;
>> +		return ret;
>> +
>> +	read_lock_irqsave(&mhi_cntrl->pm_lock, flags);
>>   
>>   	/* Packet is queued, take a usage ref to exit M3 if necessary
>>   	 * for host->device buffer, balanced put is done on buffer completion
>> @@ -1158,7 +1156,6 @@ static int mhi_queue(struct mhi_device *mhi_dev, struct mhi_buf_info *buf_info,
>>   	if (dir == DMA_FROM_DEVICE)
>>   		mhi_cntrl->runtime_put(mhi_cntrl);
>>   
>> -exit_unlock:
>>   	read_unlock_irqrestore(&mhi_cntrl->pm_lock, flags);
>>   
>>   	return ret;
>> -- 
>> 2.7.4
>>
>>

