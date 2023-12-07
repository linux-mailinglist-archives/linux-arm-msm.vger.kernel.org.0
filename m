Return-Path: <linux-arm-msm+bounces-3608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D93E808024
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 06:27:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 292CE28179E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 05:27:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7782D33C4;
	Thu,  7 Dec 2023 05:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PCdcqISz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09BADD44;
	Wed,  6 Dec 2023 21:27:18 -0800 (PST)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B74VJdx006324;
	Thu, 7 Dec 2023 05:27:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=sJtq/mf3IaDcHrZEnV/Gxwe8zGF+t6C09xMyyojnKQs=;
 b=PCdcqISz+1ZdhIslnfuyA/zxzGgA3fNrYl6nnZnJ0D1+G+NOpuTa3SODZmODoLbgFqp6
 ZcvhagraZqtBE9eDJU4x9LMT9miYeHGne8SlSg2vVHG7opkNjFxpIjkUy8YNqZKT/nJo
 G3OyTYKjWH97Os+6OjVdxG7p38bXksaAyFQbr1xxxEfXubxJaO3/iZ+HIDrenIcNuJot
 dWpc/As+0P4NIJIiy9dwHsLmV6T8Ani5W0v0OV7zHAPAmG9A1lywMg76g823VMDUqAEk
 gaYB58J+2GZDMiIsMFdSndNAF9TtfuA2IhI181lEBFfoCprO/7JJzT20iOv/hLzVcLul +g== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uu2p88jye-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Dec 2023 05:27:11 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B75RAGK011917
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 7 Dec 2023 05:27:10 GMT
Received: from [10.253.35.241] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 6 Dec
 2023 21:25:25 -0800
Message-ID: <d72ce764-41ee-4a6b-994c-7a6507dcb032@quicinc.com>
Date: Thu, 7 Dec 2023 13:25:23 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] bus: mhi: host: Drop chan lock before queuing
 buffers
Content-Language: en-US
To: Manivannan Sadhasivam <mani@kernel.org>
CC: <quic_jhugo@quicinc.com>, <mhi@lists.linux.dev>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_cang@quicinc.com>, <quic_mrana@quicinc.com>
References: <1699939661-7385-1-git-send-email-quic_qianyu@quicinc.com>
 <1699939661-7385-3-git-send-email-quic_qianyu@quicinc.com>
 <20231124100403.GA4536@thinkpad>
 <639d6008-bdfa-4b6e-b622-e916003ec908@quicinc.com>
 <20231128133252.GX3088@thinkpad>
 <5eb0a521-0b72-4d15-9a65-429c4c123833@quicinc.com>
 <20231130053157.GB3043@thinkpad>
 <9873ee7b-7ef1-4327-8e22-49e1cd3872f1@quicinc.com>
 <20231206134848.GG12802@thinkpad>
From: Qiang Yu <quic_qianyu@quicinc.com>
In-Reply-To: <20231206134848.GG12802@thinkpad>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: v4W9o8s88LPsw8WWVMjZ_K60gCrzS_9F
X-Proofpoint-ORIG-GUID: v4W9o8s88LPsw8WWVMjZ_K60gCrzS_9F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-07_03,2023-12-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 suspectscore=0 mlxlogscore=733 mlxscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2312070039


On 12/6/2023 9:48 PM, Manivannan Sadhasivam wrote:
> On Wed, Dec 06, 2023 at 10:25:12AM +0800, Qiang Yu wrote:
>> On 11/30/2023 1:31 PM, Manivannan Sadhasivam wrote:
>>> On Wed, Nov 29, 2023 at 11:29:07AM +0800, Qiang Yu wrote:
>>>> On 11/28/2023 9:32 PM, Manivannan Sadhasivam wrote:
>>>>> On Mon, Nov 27, 2023 at 03:13:55PM +0800, Qiang Yu wrote:
>>>>>> On 11/24/2023 6:04 PM, Manivannan Sadhasivam wrote:
>>>>>>> On Tue, Nov 14, 2023 at 01:27:39PM +0800, Qiang Yu wrote:
>>>>>>>> Ensure read and write locks for the channel are not taken in succession by
>>>>>>>> dropping the read lock from parse_xfer_event() such that a callback given
>>>>>>>> to client can potentially queue buffers and acquire the write lock in that
>>>>>>>> process. Any queueing of buffers should be done without channel read lock
>>>>>>>> acquired as it can result in multiple locks and a soft lockup.
>>>>>>>>
>>>>>>> Is this patch trying to fix an existing issue in client drivers or a potential
>>>>>>> issue in the future drivers?
>>>>>>>
>>>>>>> Even if you take care of disabled channels, "mhi_event->lock" acquired during
>>>>>>> mhi_mark_stale_events() can cause deadlock, since event lock is already held by
>>>>>>> mhi_ev_task().
>>>>>>>
>>>>>>> I'd prefer not to open the window unless this patch is fixing a real issue.
>>>>>>>
>>>>>>> - Mani
>>>>>> In [PATCH v4 1/4] bus: mhi: host: Add spinlock to protect WP access when
>>>>>> queueing
>>>>>> TREs,  we add
>>>>>> write_lock_bh(&mhi_chan->lock)/write_unlock_bh(&mhi_chan->lock)
>>>>>> in mhi_gen_tre, which may be invoked as part of mhi_queue in client xfer
>>>>>> callback,
>>>>>> so we have to use read_unlock_bh(&mhi_chan->lock) here to avoid acquiring
>>>>>> mhi_chan->lock
>>>>>> twice.
>>>>>>
>>>>>> Sorry for confusing you. Do you think we need to sqush this two patch into
>>>>>> one?
>>>>> Well, if patch 1 is introducing a potential deadlock, then we should fix patch
>>>>> 1 itself and not introduce a follow up patch.
>>>>>
>>>>> But there is one more issue that I pointed out in my previous reply.
>>>> Sorry, I can not understand why "mhi_event->lock" acquired during
>>>> mhi_mark_stale_events() can cause deadlock. In mhi_ev_task(), we will
>>>> not invoke mhi_mark_stale_events(). Can you provide some interpretation?
>>> Going by your theory that if a channel gets disabled while processing the event,
>>> the process trying to disable the channel will try to acquire "mhi_event->lock"
>>> which is already held by the process processing the event.
>>>
>>> - Mani
>> OK, I get you. Thank you for kind explanation. Hopefully I didn't intrude
>> too much.
> Not at all. Btw, did you actually encounter any issue that this patch is trying
> to fix? Or just fixing based on code inspection.
>
> - Mani
Yes, we actually meet the race issue in downstream driver. But I can not 
find more details about the issue.
>>>>> Also, I'm planning to cleanup the locking mess within MHI in the coming days.
>>>>> Perhaps we can revisit this series at that point of time. Will that be OK for
>>>>> you?
>>>> Sure, that will be great.
>>>>> - Mani
>>>>>
>>>>>>>> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
>>>>>>>> ---
>>>>>>>>      drivers/bus/mhi/host/main.c | 4 ++++
>>>>>>>>      1 file changed, 4 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
>>>>>>>> index 6c6d253..c4215b0 100644
>>>>>>>> --- a/drivers/bus/mhi/host/main.c
>>>>>>>> +++ b/drivers/bus/mhi/host/main.c
>>>>>>>> @@ -642,6 +642,8 @@ static int parse_xfer_event(struct mhi_controller *mhi_cntrl,
>>>>>>>>      			mhi_del_ring_element(mhi_cntrl, tre_ring);
>>>>>>>>      			local_rp = tre_ring->rp;
>>>>>>>> +			read_unlock_bh(&mhi_chan->lock);
>>>>>>>> +
>>>>>>>>      			/* notify client */
>>>>>>>>      			mhi_chan->xfer_cb(mhi_chan->mhi_dev, &result);
>>>>>>>> @@ -667,6 +669,8 @@ static int parse_xfer_event(struct mhi_controller *mhi_cntrl,
>>>>>>>>      					kfree(buf_info->cb_buf);
>>>>>>>>      				}
>>>>>>>>      			}
>>>>>>>> +
>>>>>>>> +			read_lock_bh(&mhi_chan->lock);
>>>>>>>>      		}
>>>>>>>>      		break;
>>>>>>>>      	} /* CC_EOT */
>>>>>>>> -- 
>>>>>>>> 2.7.4
>>>>>>>>
>>>>>>>>

