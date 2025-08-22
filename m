Return-Path: <linux-arm-msm+bounces-70280-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6989EB31246
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 10:52:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 215F83B3D40
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 08:50:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41D22224AF3;
	Fri, 22 Aug 2025 08:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KHrd90ur"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A6113A3F7;
	Fri, 22 Aug 2025 08:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755852643; cv=none; b=Jnf5lfz5jQPxT1gm9djYCis/KvCednyvzcXa7zoUX+mJhNRbhso6lTDCwd8n06NBIwO7lHk9VDBAcM9C8KGZXGaGC9Oxy0OkDOlQTrviuVFGZapc8y443BAjcYh5j94/kxEGaHY5rcuNkMqMrnKAkMl2I459oQcqCDj7DX79C84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755852643; c=relaxed/simple;
	bh=b5ccvCydC8SrFxL41zZ/M1GO0yJFBCuulJVpITMfi4g=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=dGKko8aVYUiLz4qZg4TL9brrviGRjkFlf/vqaEdq4qgAqteYwZZmRaMv9H/GYv3ZjI5G3z9mIUxEJw7PPnDnRfxKZBfzxSWStRvLHRr7afgi29DDQ2lHnKxVeLyFvdI1iX7VuZ1gxrIBzq7ewRbftyaHcW3bHwdVzYVdT+XTOAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KHrd90ur; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8UOqn024194;
	Fri, 22 Aug 2025 08:50:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lnhEY7d/zCtl8cH0fWDktRTg/owKEwjWlej0lOJloRA=; b=KHrd90urIqdk6djZ
	ipCqf7tQoR3OgTSOJCwqVkysCHKNqHaE1FiHUIHyMOoi0Tr/KE8EvyvErXU+h7IB
	amzh85v1Yc5vV+oE4fVq+hu3JQu6x5xiamSlpabTc/LdS36OW/tS3HelLyJgshDY
	S9jPv5LD1FfmYhAv55MeDLRZo3NpRs6Yj4w79HGtC5cmQG7P7Ru3liwliDJ1Tmyf
	BLAvM29Am7a8eWd77m5ZNxrXIcorR4oeYZwRz8ykB47hMWCGoC9UoX/HG5NUinPp
	bDTo3v6g5tAGn6lB0+pyt5y/gJ/fICWY1pts6uEE8bggcOtJhc1X29ldg3+uxXyj
	aOI+XA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52agmg7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Aug 2025 08:50:37 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57M8obme027664
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Aug 2025 08:50:37 GMT
Received: from [10.217.219.124] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 22 Aug
 2025 01:50:32 -0700
Message-ID: <ffc65cc4-61d1-49d0-a0b9-9e0101fe029c@quicinc.com>
Date: Fri, 22 Aug 2025 14:20:29 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: mhi: ep: Fix chained transfer handling in read path
To: Manivannan Sadhasivam <mani@kernel.org>,
        Akhil Vinod
	<quic_akhvin@quicinc.com>
CC: Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_krichai@quicinc.com>,
        <quic_skananth@quicinc.com>, <quic_vbadigan@quicinc.com>,
        Sumit Kumar <sumk@qti.qualcomm.com>, <stable@vger.kernel.org>,
        Akhil Vinod <akhvin@qti.qualcomm.com>
References: <20250709-chained_transfer-v1-1-2326a4605c9c@quicinc.com>
 <5aqtqicbtlkrqbiw2ba7kkgwrmsuqx2kjukh2tavfihm5hq5ry@gdeqegayfh77>
 <7c833565-0e7b-4004-b691-37bd07ce6abe@quicinc.com>
 <5ij32zdni7pei3xfpxsq6fvaghb3pdfs2fznickutqjysip3k4@kldf7h6e3qc4>
Content-Language: en-US
From: Sumit Kumar <quic_sumk@quicinc.com>
In-Reply-To: <5ij32zdni7pei3xfpxsq6fvaghb3pdfs2fznickutqjysip3k4@kldf7h6e3qc4>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Lz4Frjurt7JaMbndiyvMorWU7mGRTv0B
X-Authority-Analysis: v=2.4 cv=B83gEOtM c=1 sm=1 tr=0 ts=68a82f5d cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=5_CZODyF7LIRseyXUXAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: Lz4Frjurt7JaMbndiyvMorWU7mGRTv0B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXzBgR4FerhUXD
 r2GytHevWh4WhpV686b9QnotyKPD5Ul87ZQyeRyi4VLwtb4UWUs1/Kzb3iVqLFziRxUp/rG5/N2
 wthxBtqjRaG9cE4w2Y/lJoEhH7ae1O+MARZLRDnOHR3ljqfj5UcFGf1PtxTOUqSLYfB5OSWd9Qz
 bFG0HVjncJ+fsO5KE6xNX2ETVA+qqx1vXVg57NK8mpeI2c2Yv2k3DBqTX8Tv3mU1QgDylpe/rcl
 DudE8z5bqp7G7UI+jiNAy0j5cTspYLvb91dNxqAbAM1Tc+z3TU0WcNTuF9f3OHJEJVIZyApPnQu
 BsoHjTRPxrq262Oo15Q+p5SgaH+1BTcLZP7pbpTxnQRje29iLMLu183v6Ub+5Uz73y2tktwTDoa
 +sabz0e5KCBwNgawi+YBSPUlFtErDA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013



On 7/17/2025 10:44 PM, Manivannan Sadhasivam wrote:
> On Thu, Jul 17, 2025 at 10:18:54PM GMT, Akhil Vinod wrote:
>>
>> On 7/16/2025 12:10 PM, Manivannan Sadhasivam wrote:
>>> On Wed, Jul 09, 2025 at 04:03:17PM GMT, Sumit Kumar wrote:
>>>> From: Sumit Kumar <sumk@qti.qualcomm.com>
>>>>
>>>> The current implementation of mhi_ep_read_channel, in case of chained
>>>> transactions, assumes the End of Transfer(EOT) bit is received with the
>>>> doorbell. As a result, it may incorrectly advance mhi_chan->rd_offset
>>>> beyond wr_offset during host-to-device transfers when EOT has not yet
>>>> arrived. This can lead to access of unmapped host memory, causing
>>>> IOMMU faults and processing of stale TREs.
>>>>
>>>> This change modifies the loop condition to ensure rd_offset remains behind
>>>> wr_offset, allowing the function to process only valid TREs up to the
>>>> current write pointer. This prevents premature reads and ensures safe
>>>> traversal of chained TREs.
>>>>
>>>> Fixes: 5301258899773 ("bus: mhi: ep: Add support for reading from the host")
>>>> Cc: stable@vger.kernel.org
>>>> Co-developed-by: Akhil Vinod <akhvin@qti.qualcomm.com>
>>>> Signed-off-by: Akhil Vinod <akhvin@qti.qualcomm.com>
>>>> Signed-off-by: Sumit Kumar <sumk@qti.qualcomm.com>
>>>> ---
>>>>    drivers/bus/mhi/ep/main.c | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
>>>> index b3eafcf2a2c50d95e3efd3afb27038ecf55552a5..2e134f44952d1070c62c24aeca9effc7fd325860 100644
>>>> --- a/drivers/bus/mhi/ep/main.c
>>>> +++ b/drivers/bus/mhi/ep/main.c
>>>> @@ -468,7 +468,7 @@ static int mhi_ep_read_channel(struct mhi_ep_cntrl *mhi_cntrl,
>>>>    			mhi_chan->rd_offset = (mhi_chan->rd_offset + 1) % ring->ring_size;
>>>>    		}
>>>> -	} while (buf_left && !tr_done);
>>>> +	} while (buf_left && !tr_done && mhi_chan->rd_offset != ring->wr_offset);
>>> You should use mhi_ep_queue_is_empty() for checking the available elements to
>>> process. And with this check in place, the existing check in
>>> mhi_ep_process_ch_ring() becomes redundant.
>>>
>>> - Mani
>>
>> Yes, agreed that the check can be replaced with the mhi_ep_queue_is_empty, but the existing
>> check in mhi_ep_process_ch_ring() is still necessary because there can be a case where
>> there are multiple chained transactions in the ring.
>>
>> Example: The ring at the time mhi_ep_read_channel is executing may look like:
>> chained | chained |  EOT#1 | chained | chained | EOT#2
>> If we remove the check from mhi_ep_process_ch_ring, we bail out of the first transaction itself
>> and the remaining packets won't be processed. mhi_ep_read_channel in its current form is designed
>> for a single MHI packet only.
>>
> 
> Then you should ignore the EOT flag by removing '!tr_done' check and just check
> for buf_left and mhi_ep_process_ch_ring(). Having the same check in caller and
> callee doesn't make sense.
> 
> - Mani
> 
Agreed, we can remove the tr_done check from the while loop, then all 
the elements of the ring will be processed in read_channel.
Additionally, the purpose of buf_left is to process a TRE if 
DEFAULT_MTU_SIZE of endpoint is less than host, but the buf_left will 
become 0 after processing a part of TRE and will not process the 
remaining data.

Therefore will remove the buf_left too from read_channel otherwise it 
will exit the loop after processing one TRE or just a part of it.

- Sumit

