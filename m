Return-Path: <linux-arm-msm+bounces-401-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A987E7828
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Nov 2023 04:39:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E06B61C20B41
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Nov 2023 03:39:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D19341841;
	Fri, 10 Nov 2023 03:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="M0MY7l75"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA7117F8
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Nov 2023 03:39:15 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAC3A4681;
	Thu,  9 Nov 2023 19:39:14 -0800 (PST)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AA2QepE028397;
	Fri, 10 Nov 2023 03:39:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=UFNPkU5RcOUlMNZKNlJJTvF2hAP+Gw6TIMJUjo7Cyts=;
 b=M0MY7l75Dn1Ew3cxRg7vsP+S6dcKSKzIxa0T1oC7egaggSknP5K7KCMBOUwOifaxt/Bl
 B/MsktPsEomZin7a7eHWOlnD6AMonOwovmtJMI1khsmxHLTddiRawq07KF4sOrFQvolB
 vP0jl8Rkte62jhbcw7s4YK8BInDuHBJuUoRTa7o2kKMuUQKe1ftZMfFGZNp+HKBAk6EE
 oACOztX6Wa/uqRTNYgvxYcJRcvRu3yTDZmDQY5BrO+FmI6B9rlhzLzHR+7Eabuqxggvw
 ILuRa3sQOHr2pKZo57T4nZ1HDeiqNeJLPkNtbLHY5cvAxMF4VbA0o6BLcVIB3U5wZCtJ /A== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u99e90b67-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Nov 2023 03:39:02 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AA3d1mN004691
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Nov 2023 03:39:01 GMT
Received: from [10.253.38.123] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Thu, 9 Nov
 2023 19:38:59 -0800
Message-ID: <808f8982-8c2c-40ed-9fb9-1c9932c8db28@quicinc.com>
Date: Fri, 10 Nov 2023 11:38:42 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] bus: mhi: host: Avoid processing buffer and event
 of a disable channel
To: Manivannan Sadhasivam <mani@kernel.org>
CC: <quic_jhugo@quicinc.com>, <mhi@lists.linux.dev>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_cang@quicinc.com>, <quic_mrana@quicinc.com>
References: <1699341365-47737-1-git-send-email-quic_qianyu@quicinc.com>
 <1699341365-47737-4-git-send-email-quic_qianyu@quicinc.com>
 <20231109163253.GL3752@thinkpad>
Content-Language: en-US
From: Qiang Yu <quic_qianyu@quicinc.com>
In-Reply-To: <20231109163253.GL3752@thinkpad>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: JO5oR0dYS5W6vdd0xyvRG2VVeITJUZZe
X-Proofpoint-ORIG-GUID: JO5oR0dYS5W6vdd0xyvRG2VVeITJUZZe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-09_17,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 adultscore=0 phishscore=0
 suspectscore=0 mlxlogscore=737 bulkscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2311100029


On 11/10/2023 12:32 AM, Manivannan Sadhasivam wrote:
> On Tue, Nov 07, 2023 at 03:16:04PM +0800, Qiang Yu wrote:
>> Ckeck mhi channel state after getting chan->lock to ensure that we only
>> queue buffer to an enabled channel and process event of an enabled channel.
>>
> This commit message doesn't give proper explanation on how the channel can go to
> disabled state in between parse_xfer_event() and mhi_gen_tre().
>
> - Mani

Hi Mani. How about following commit message

MHI channel state is protected by mhi_chan->lock. Hence, after core drops
mhi_chan->lock during processing xfer event, it can not prevent channel
state being changed if client closes channel or driver is removed at this
time. So let's check mhi channel state after getting chan->lock again to 
avoid
queuing buffer to a disabled channel in xfer callback and stop processing
event of the disabled channel.

>> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
>> ---
>>   drivers/bus/mhi/host/main.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
>> index a236dc2..b137d54 100644
>> --- a/drivers/bus/mhi/host/main.c
>> +++ b/drivers/bus/mhi/host/main.c
>> @@ -672,6 +672,8 @@ static int parse_xfer_event(struct mhi_controller *mhi_cntrl,
>>   			}
>>   
>>   			read_lock_bh(&mhi_chan->lock);
>> +			if (mhi_chan->ch_state != MHI_CH_STATE_ENABLED)
>> +				goto end_process_tx_event;
>>   		}
>>   		break;
>>   	} /* CC_EOT */
>> @@ -1211,6 +1213,8 @@ int mhi_gen_tre(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan,
>>   
>>   	/* Protect accesses for reading and incrementing WP */
>>   	write_lock_bh(&mhi_chan->lock);
>> +	if (mhi_chan->ch_state != MHI_CH_STATE_ENABLED)
>> +		return -EINVAL;
>>   
>>   	buf_ring = &mhi_chan->buf_ring;
>>   	tre_ring = &mhi_chan->tre_ring;
>> -- 
>> 2.7.4
>>
>>

