Return-Path: <linux-arm-msm+bounces-65532-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 113F8B0922C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 18:49:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 502804A1A15
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 16:49:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEBCD2FD58C;
	Thu, 17 Jul 2025 16:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HESFgrYk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059C72BCF75;
	Thu, 17 Jul 2025 16:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752770950; cv=none; b=dj4OvNhh4G8I6k2Vv7SlSLFdV+z3DzNhPmZfCRWo0U+kVmExywmhVSuFiVKq6RqlkvL3fMwJJBBmRMcj75EMxCVImL950UhOtAh3soUEW+c5qrCO2I80s1uJ9EErLbXhV4lar1gFf0Y4TQkCW2NCD+G5rgdIhE+KCDmIdbbIaTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752770950; c=relaxed/simple;
	bh=G+81jnB2n+52pQH8N0arE+zlRSHXLPxg43X+u8Imltc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=P7JVR1wgfdFI/OIitfWTxJD2Lu1PQTPFJ7wTzMUTbn+ubah3I79Vq2FUPnQKoufQjV+aOjgD27x3wpswE8fepMoWy97rom67TuWLbIUmEnEmNOXgk+n9a86hXjhhlZQN/YOG4KlT0iS8qRzx7YyTFC/dq3I0ycFIQJx0Q1XQL2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HESFgrYk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HC3bXX008498;
	Thu, 17 Jul 2025 16:49:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5DRlh3V7K77Jb7SrH7bBVIXhRB79rkamE4stYnCWsiU=; b=HESFgrYkTGdVeE5/
	Sl2RfQ6nzLgJD048f0mKWI0I5R9a9dWD/8lrGE9RiBWGIBRzP2m1k0hR8G2vLCQ/
	ZYz2roX11PVbxwLEDr+jR6NwhfAz6tPWWoJdPwcZJS+ZNox7Vb97s04ENQ66nhLX
	Bqu1yvcGP/rrp6ZmCsSjhIA4flAmb/f0xhI9I2rRhKg5kWCm8oRwMqbAY0zkKBFu
	9h4jL07CmPNRalaN8GuXXvnA0VQ0BJIj3hGiTsa1EV1vwTVwEEC7J7vYNhQhu4ed
	RXYauH0ZUhb16UyIEo4fr9sEKTd+Bmjm8GF4VNE5THxpiiAMTmpnZYOY0x5Vcbqz
	gMyndA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufxb8ghk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Jul 2025 16:49:04 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56HGn3Pc012911
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Jul 2025 16:49:03 GMT
Received: from [10.216.52.220] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 17 Jul
 2025 09:48:58 -0700
Message-ID: <7c833565-0e7b-4004-b691-37bd07ce6abe@quicinc.com>
Date: Thu, 17 Jul 2025 22:18:54 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: mhi: ep: Fix chained transfer handling in read path
To: Manivannan Sadhasivam <mani@kernel.org>,
        Sumit Kumar
	<quic_sumk@quicinc.com>
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
Content-Language: en-US
From: Akhil Vinod <quic_akhvin@quicinc.com>
In-Reply-To: <5aqtqicbtlkrqbiw2ba7kkgwrmsuqx2kjukh2tavfihm5hq5ry@gdeqegayfh77>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: P0JFgXsPYGiT6mtH670UUCDd6tSn2TGf
X-Proofpoint-ORIG-GUID: P0JFgXsPYGiT6mtH670UUCDd6tSn2TGf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDE0NyBTYWx0ZWRfXwkL/WjtJAAQk
 C2sKbP0nTFsinfYSm7m6fp0IkeeCxovyqhBbU9MvyN9UwFN4uxaFFDKTtHGf0EesSsed+p175as
 CaEdgkQ8ycqpNKbR3YVWorL8PJhQ5O1ipVbKLkOuk7huetfUDBGZUnFFOUWRmP2OrdENK0qdEXC
 dm5t9U16uT18ZRYdNH/ruVr8TWbaaYxnJyxtbLZZFCngTqBj1p8JrwEBBTRbyTr73fs9LVrcvyu
 wrAi+N7T+rW4i5TU0W4fsX/m6O+Dya7RHi8U6QdNDINaAxjRvOiu6Xcv3knHNtooBiqnfQJvKCg
 0gkneBwBNPTSpWg85uylD3UcsChQoyQFXZ2bKB88s9n2daL1XCpaVcDFRiZTjGdkw5SYdq58W/D
 lTAztHPsmKfO/T3apeljobZLd7ETiXrkTo2U2nJq3Oy9dKq83PnGLg4KphIOIk1yoBBzuGCy
X-Authority-Analysis: v=2.4 cv=Xc2JzJ55 c=1 sm=1 tr=0 ts=68792980 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=y20B5S6K_hySBQgFZUYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_02,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 priorityscore=1501 adultscore=0 mlxlogscore=776
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507170147


On 7/16/2025 12:10 PM, Manivannan Sadhasivam wrote:
> On Wed, Jul 09, 2025 at 04:03:17PM GMT, Sumit Kumar wrote:
>> From: Sumit Kumar <sumk@qti.qualcomm.com>
>>
>> The current implementation of mhi_ep_read_channel, in case of chained
>> transactions, assumes the End of Transfer(EOT) bit is received with the
>> doorbell. As a result, it may incorrectly advance mhi_chan->rd_offset
>> beyond wr_offset during host-to-device transfers when EOT has not yet
>> arrived. This can lead to access of unmapped host memory, causing
>> IOMMU faults and processing of stale TREs.
>>
>> This change modifies the loop condition to ensure rd_offset remains behind
>> wr_offset, allowing the function to process only valid TREs up to the
>> current write pointer. This prevents premature reads and ensures safe
>> traversal of chained TREs.
>>
>> Fixes: 5301258899773 ("bus: mhi: ep: Add support for reading from the host")
>> Cc: stable@vger.kernel.org
>> Co-developed-by: Akhil Vinod <akhvin@qti.qualcomm.com>
>> Signed-off-by: Akhil Vinod <akhvin@qti.qualcomm.com>
>> Signed-off-by: Sumit Kumar <sumk@qti.qualcomm.com>
>> ---
>>   drivers/bus/mhi/ep/main.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
>> index b3eafcf2a2c50d95e3efd3afb27038ecf55552a5..2e134f44952d1070c62c24aeca9effc7fd325860 100644
>> --- a/drivers/bus/mhi/ep/main.c
>> +++ b/drivers/bus/mhi/ep/main.c
>> @@ -468,7 +468,7 @@ static int mhi_ep_read_channel(struct mhi_ep_cntrl *mhi_cntrl,
>>   
>>   			mhi_chan->rd_offset = (mhi_chan->rd_offset + 1) % ring->ring_size;
>>   		}
>> -	} while (buf_left && !tr_done);
>> +	} while (buf_left && !tr_done && mhi_chan->rd_offset != ring->wr_offset);
> You should use mhi_ep_queue_is_empty() for checking the available elements to
> process. And with this check in place, the existing check in
> mhi_ep_process_ch_ring() becomes redundant.
>
> - Mani

Yes, agreed that the check can be replaced with the mhi_ep_queue_is_empty, but the existing
check in mhi_ep_process_ch_ring() is still necessary because there can be a case where
there are multiple chained transactions in the ring.

Example: The ring at the time mhi_ep_read_channel is executing may look like:
chained | chained |  EOT#1 | chained | chained | EOT#2
  
If we remove the check from mhi_ep_process_ch_ring, we bail out of the first transaction itself
and the remaining packets won't be processed. mhi_ep_read_channel in its current form is designed
for a single MHI packet only.

- Akhil


