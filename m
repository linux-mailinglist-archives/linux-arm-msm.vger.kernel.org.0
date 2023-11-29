Return-Path: <linux-arm-msm+bounces-2355-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EBAFD7FCD7D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 04:29:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4CE0A1F207C2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 03:29:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 160194414;
	Wed, 29 Nov 2023 03:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TDCarUw2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C49491AD;
	Tue, 28 Nov 2023 19:29:19 -0800 (PST)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AT0dJBl004234;
	Wed, 29 Nov 2023 03:29:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=+boRo36HQaqSkzRXdCK64bpQqb4ilPayZOqyrR6e6H4=;
 b=TDCarUw2BcjyceRxg2VVTav/9LVa4DtuuffDOrT7QRqwlMni/ZgPyXDMyyMWVsUaEeXB
 VqLVkonNT7Y7A1jUqXjJRddoRPAOkvodFz58/Gb/ml+EbYARnGb1R4YWgttxpdc8xXCV
 ff8ImCJKanVcwywgVi3qv0C1xfm1orEcutY0ZFLq49l45K08xC3hxl1VD4XYa2fKbsPB
 1PFpKgKW4DOCh6ratZkTk35450n1DCrz0KLhCEOdH07HV5HltxgGqNr+QYfXbVvBt2cl
 fwwFSctu3ZNitrJSoz8uZlHPEirVIQW1Ya9gRkBe8sKbgtoVsceTh6tq+q7XeQ7RjD0g 1g== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3unhrpsqe2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Nov 2023 03:29:13 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AT3TCZE028581
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Nov 2023 03:29:12 GMT
Received: from [10.253.36.238] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 28 Nov
 2023 19:29:09 -0800
Message-ID: <5eb0a521-0b72-4d15-9a65-429c4c123833@quicinc.com>
Date: Wed, 29 Nov 2023 11:29:07 +0800
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
From: Qiang Yu <quic_qianyu@quicinc.com>
In-Reply-To: <20231128133252.GX3088@thinkpad>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: d7CXt-DTp8ER7QHhB7t0eHlK45p4PFy_
X-Proofpoint-ORIG-GUID: d7CXt-DTp8ER7QHhB7t0eHlK45p4PFy_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-28_27,2023-11-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 clxscore=1011 bulkscore=0 suspectscore=0 impostorscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=587 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311290024


On 11/28/2023 9:32 PM, Manivannan Sadhasivam wrote:
> On Mon, Nov 27, 2023 at 03:13:55PM +0800, Qiang Yu wrote:
>> On 11/24/2023 6:04 PM, Manivannan Sadhasivam wrote:
>>> On Tue, Nov 14, 2023 at 01:27:39PM +0800, Qiang Yu wrote:
>>>> Ensure read and write locks for the channel are not taken in succession by
>>>> dropping the read lock from parse_xfer_event() such that a callback given
>>>> to client can potentially queue buffers and acquire the write lock in that
>>>> process. Any queueing of buffers should be done without channel read lock
>>>> acquired as it can result in multiple locks and a soft lockup.
>>>>
>>> Is this patch trying to fix an existing issue in client drivers or a potential
>>> issue in the future drivers?
>>>
>>> Even if you take care of disabled channels, "mhi_event->lock" acquired during
>>> mhi_mark_stale_events() can cause deadlock, since event lock is already held by
>>> mhi_ev_task().
>>>
>>> I'd prefer not to open the window unless this patch is fixing a real issue.
>>>
>>> - Mani
>> In [PATCH v4 1/4] bus: mhi: host: Add spinlock to protect WP access when
>> queueing
>> TREs,  we add
>> write_lock_bh(&mhi_chan->lock)/write_unlock_bh(&mhi_chan->lock)
>> in mhi_gen_tre, which may be invoked as part of mhi_queue in client xfer
>> callback,
>> so we have to use read_unlock_bh(&mhi_chan->lock) here to avoid acquiring
>> mhi_chan->lock
>> twice.
>>
>> Sorry for confusing you. Do you think we need to sqush this two patch into
>> one?
> Well, if patch 1 is introducing a potential deadlock, then we should fix patch
> 1 itself and not introduce a follow up patch.
>
> But there is one more issue that I pointed out in my previous reply.
Sorry, I can not understand why "mhi_event->lock" acquired during
mhi_mark_stale_events() can cause deadlock. In mhi_ev_task(), we will
not invoke mhi_mark_stale_events(). Can you provide some interpretation?
>
> Also, I'm planning to cleanup the locking mess within MHI in the coming days.
> Perhaps we can revisit this series at that point of time. Will that be OK for
> you?
Sure, that will be great.
>
> - Mani
>
>>>> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
>>>> ---
>>>>    drivers/bus/mhi/host/main.c | 4 ++++
>>>>    1 file changed, 4 insertions(+)
>>>>
>>>> diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
>>>> index 6c6d253..c4215b0 100644
>>>> --- a/drivers/bus/mhi/host/main.c
>>>> +++ b/drivers/bus/mhi/host/main.c
>>>> @@ -642,6 +642,8 @@ static int parse_xfer_event(struct mhi_controller *mhi_cntrl,
>>>>    			mhi_del_ring_element(mhi_cntrl, tre_ring);
>>>>    			local_rp = tre_ring->rp;
>>>> +			read_unlock_bh(&mhi_chan->lock);
>>>> +
>>>>    			/* notify client */
>>>>    			mhi_chan->xfer_cb(mhi_chan->mhi_dev, &result);
>>>> @@ -667,6 +669,8 @@ static int parse_xfer_event(struct mhi_controller *mhi_cntrl,
>>>>    					kfree(buf_info->cb_buf);
>>>>    				}
>>>>    			}
>>>> +
>>>> +			read_lock_bh(&mhi_chan->lock);
>>>>    		}
>>>>    		break;
>>>>    	} /* CC_EOT */
>>>> -- 
>>>> 2.7.4
>>>>
>>>>

