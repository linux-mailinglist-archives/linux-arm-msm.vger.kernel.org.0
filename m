Return-Path: <linux-arm-msm+bounces-403-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBEC7E7832
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Nov 2023 04:43:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4B2CAB20E1A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Nov 2023 03:43:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05DD01841;
	Fri, 10 Nov 2023 03:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Kx9hdP2x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993B917F8
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Nov 2023 03:43:03 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C8634687;
	Thu,  9 Nov 2023 19:43:03 -0800 (PST)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AA39MGe008932;
	Fri, 10 Nov 2023 03:42:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=GA1k1EoHAjRIkDRMPTj7Sehuf5ZQHogrwImmPswx02w=;
 b=Kx9hdP2xROE+38yF1+tJNvOICwb0uWeaF1dg5/cPOReR102ixDySR60TkLFstLEu2EYy
 U/5bS6xjQQ7PBsHIJ2YKTI8hUoUBIUxobiwcJRXAbRXAJ/2JR3DIW8zUvY85Hj1IayOg
 s9VIciPEceIuf8a+5Fp9Ng5ULBbsi752C9siB6cM6ltu3KinxKNjREs/HVtkHChqRde2
 h5l6J9wFot75GNCDkCZCVmWymzYvhEyt70+KtfXWh8f2e55NflnuRrKLaRG+GpcvnaD/
 Rrl6WomW4n6+VGvYQV7m8zpIFi+Iv7VjlBs3Afli50yI5dxCdEZowOEnZUXxzuaNKQ1x Kg== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u93tq93fx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Nov 2023 03:42:57 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AA3gvXw020776
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Nov 2023 03:42:57 GMT
Received: from [10.253.38.123] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Thu, 9 Nov
 2023 19:42:54 -0800
Message-ID: <28bae567-23ae-4b06-b77b-946cf46aa74e@quicinc.com>
Date: Fri, 10 Nov 2023 11:42:52 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] bus: mhi: host: Take irqsave lock after TRE is
 generated
Content-Language: en-US
To: Manivannan Sadhasivam <mani@kernel.org>
CC: <quic_jhugo@quicinc.com>, <mhi@lists.linux.dev>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_cang@quicinc.com>, <quic_mrana@quicinc.com>,
        Hemant Kumar
	<quic_hemantk@quicinc.com>,
        Lazarus Motha <quic_lmotha@quicinc.com>
References: <1699341365-47737-1-git-send-email-quic_qianyu@quicinc.com>
 <1699341365-47737-5-git-send-email-quic_qianyu@quicinc.com>
 <20231109162933.GK3752@thinkpad>
From: Qiang Yu <quic_qianyu@quicinc.com>
In-Reply-To: <20231109162933.GK3752@thinkpad>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: cAB7eTfDVLoZyfuO4RN088p8e95o-FBw
X-Proofpoint-ORIG-GUID: cAB7eTfDVLoZyfuO4RN088p8e95o-FBw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-09_17,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 mlxlogscore=879
 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311100030


On 11/10/2023 12:29 AM, Manivannan Sadhasivam wrote:
> On Tue, Nov 07, 2023 at 03:16:05PM +0800, Qiang Yu wrote:
>> From: Hemant Kumar <quic_hemantk@quicinc.com>
>>
>> Take irqsave lock after TRE is generated to avoid deadlock due to core
>> getting interrupts enabled as local_bh_enable must not be called with
>> irqs disabled based on upstream patch.
>>
> You still didn't address any of the comments provided by Jeff in v2.
>
> - Mani

Hi Mani, thanks for review. Sorry, missing this part. Will change to 
following commit message.

If CONFIG_TRACE_IRQFLAGS is enabled, irq will be enabled once 
__local_bh_enable_ip
is called as part of write_unlock_bh. Hence, let's take irqsave lock 
after TRE is
generated to avoid running write_unlock_bh when irqsave lock is held.

>> Signed-off-by: Hemant Kumar <quic_hemantk@quicinc.com>
>> Signed-off-by: Lazarus Motha <quic_lmotha@quicinc.com>
>> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
>> ---
>>   drivers/bus/mhi/host/main.c | 13 +++++--------
>>   1 file changed, 5 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
>> index b137d54..93b5110 100644
>> --- a/drivers/bus/mhi/host/main.c
>> +++ b/drivers/bus/mhi/host/main.c
>> @@ -1129,17 +1129,15 @@ static int mhi_queue(struct mhi_device *mhi_dev, struct mhi_buf_info *buf_info,
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
>> @@ -1159,7 +1157,6 @@ static int mhi_queue(struct mhi_device *mhi_dev, struct mhi_buf_info *buf_info,
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

