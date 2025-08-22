Return-Path: <linux-arm-msm+bounces-70301-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAD9B3133A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 11:33:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 077B23BF3CB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 09:28:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB6C62EC557;
	Fri, 22 Aug 2025 09:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RrYgcryB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288571DDC08;
	Fri, 22 Aug 2025 09:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755854845; cv=none; b=mIOF5y3fXVuAn5LlNg+uI8E+cvqnKkh6P2hoaOGvGmWwtLOPXceiVoEuLBme11KCQXEodoOJ8YCYedWUjvShMs5iZg6ghXTLm8ipnYjXRTxxpjvQbRuJm3Mr0xNdV/wpGn9Zw7BzJdGb7gE+j0s+hRlDV+l1K05cmBu6/6066fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755854845; c=relaxed/simple;
	bh=ffU7Jra2FYSdcW5dsy4J/IV/g2I533TmyZFGxSO9MgE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Aqfcw1C6k9pRwZ8C2hCAzxghLnOxXdUzs4/6Lagc7Vy8v2ahJ1gV2n5B0GZF1n2xEvgf6q+Cwm5erQnK+JuqpXRQbYm0Tl+ZFUwWMsCO0nN4cwwMt1JYr5gPAU8ubiwSKPxGFxOcLZwPg9SxSnZK28/CCS83H3pQCjxHakqyuS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RrYgcryB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8UK5O030513;
	Fri, 22 Aug 2025 09:27:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F7C43LdngdbYQcXlgkqyvxQt7FMCMKlcyPUzmO1c3Q4=; b=RrYgcryBkUU+rbVj
	rqRY3PmkBotCdfHm2hdgW2aN0rFykkw/eozpkSjBEBI6ajb5BKmeQsh70HAXfm5D
	zb2wLvSIG+0dbs6mEweNxKzxNvwE3kobxO0VF/XJ/HBvGhoQfUu5aLm2UQQ83gxk
	2mcBVnub2q/GvATT0eFQfHLsiXaZTjPfGDlBYsDQV2Bwf/V9EARofiJ9B9e1PrIj
	xucyTiNPsZKS9WJws31Y652ODMzXz7laCsIsKrq80S47sxpFMFhIV/OCuIZRWZN9
	BjTiVb/vhKHbqn8tSitIrabrmWayvFfVVRoFPxlG4RBxGLckfbwzRzLU5SiBqOU8
	ycRy6A==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ngtdphdf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Aug 2025 09:27:20 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57M9RKi8008056
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Aug 2025 09:27:20 GMT
Received: from [10.218.42.132] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 22 Aug
 2025 02:27:16 -0700
Message-ID: <ff418c34-0f06-46fe-adda-4d9d8e409b6e@quicinc.com>
Date: Fri, 22 Aug 2025 14:57:13 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] bus: mhi: ep: Fix chained transfer handling in read
 path
To: Sumit Kumar <quic_sumk@quicinc.com>,
        Manivannan Sadhasivam
	<mani@kernel.org>,
        Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_akhvin@quicinc.com>,
        <quic_skananth@quicinc.com>, <quic_vbadigan@quicinc.com>,
        Sumit Kumar
	<sumk@qti.qualcomm.com>, <stable@vger.kernel.org>,
        Akhil Vinod
	<akhvin@qti.qualcomm.com>
References: <20250822-chained_transfer-v2-1-7aeb5ac215b6@quicinc.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <quic_krichai@quicinc.com>
In-Reply-To: <20250822-chained_transfer-v2-1-7aeb5ac215b6@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=LexlKjfi c=1 sm=1 tr=0 ts=68a837f8 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=M4kYh_c735O1KADJ0OkA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: 8hNGEUj82K9cppp1HVTEM5-dYkNl6lxz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDEzNSBTYWx0ZWRfX/pcU32vb9qcO
 yN6Vt4BAwVjilUF4t6pkne16HFyS7CFkW0Nu2TTJgrGFzfhNknbmqTBwrqATVlULwyaof6Ok+l2
 Nto5yjGHj8SmvKYh7Cmsa8nEIDrCiS8UtnUs2FNm19smIcj3fSlaM34jMZN98+38DbMIa7C6dhR
 cKjyo6zNARDKoEY6ksbrrwNJrkOO7aHJMXiMMliHKyk6DTwoylkszEOs4M8YM5SJ7ZW9xfTM+pq
 t8KwlxxQPQOVFwfVOcryJ8COMw5J35W/IKtP6rYQWjswflo++Z5REz2lrhzXTIpXt47wv3qv984
 qBf64ME9Yqp9ySHMHxZq6+aJ2VUEPFUb7iAXBztvGRFPwd15cnvJRo7Ii/ya9v9lMXIIuBbNSOR
 0n6wwdSu9tODi1LM5QDVJnoq80LjLA==
X-Proofpoint-ORIG-GUID: 8hNGEUj82K9cppp1HVTEM5-dYkNl6lxz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200135



On 8/22/2025 2:54 PM, Sumit Kumar wrote:
> From: Sumit Kumar <sumk@qti.qualcomm.com>
> 
> The current implementation of mhi_ep_read_channel, in case of chained
> transactions, assumes the End of Transfer(EOT) bit is received with the
> doorbell. As a result, it may incorrectly advance mhi_chan->rd_offset
> beyond wr_offset during host-to-device transfers when EOT has not yet
> arrived. This can lead to access of unmapped host memory, causing
> IOMMU faults and processing of stale TREs.
> 
> This change modifies the loop condition to ensure mhi_queue is not empty,
> allowing the function to process only valid TREs up to the current write
> pointer. This prevents premature reads and ensures safe traversal of
> chained TREs.
> 
> Removed buf_left from the while loop condition to avoid exiting prematurely
> before reading the ring completely.
> 
> Removed write_offset since it will always be zero because the new cache
> buffer is allocated everytime.
> 
> Fixes: 5301258899773 ("bus: mhi: ep: Add support for reading from the host")
> Cc: stable@vger.kernel.org
> Co-developed-by: Akhil Vinod <akhvin@qti.qualcomm.com>
> Signed-off-by: Akhil Vinod <akhvin@qti.qualcomm.com>
> Signed-off-by: Sumit Kumar <sumk@qti.qualcomm.com>
Reviewed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
> Changes in v2:
> - Use mhi_ep_queue_is_empty in while loop (Mani).
> - Remove do while loop in mhi_ep_process_ch_ring (Mani).
> - Remove buf_left, wr_offset, tr_done.
> - Haven't added Reviewed-by as there is change in logic.
> - Link to v1: https://lore.kernel.org/r/20250709-chained_transfer-v1-1-2326a4605c9c@quicinc.com
> ---
>   drivers/bus/mhi/ep/main.c | 37 ++++++++++++-------------------------
>   1 file changed, 12 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
> index b3eafcf2a2c50d95e3efd3afb27038ecf55552a5..cdea24e9291959ae0a92487c1b9698dc8164d2f1 100644
> --- a/drivers/bus/mhi/ep/main.c
> +++ b/drivers/bus/mhi/ep/main.c
> @@ -403,17 +403,13 @@ static int mhi_ep_read_channel(struct mhi_ep_cntrl *mhi_cntrl,
>   {
>   	struct mhi_ep_chan *mhi_chan = &mhi_cntrl->mhi_chan[ring->ch_id];
>   	struct device *dev = &mhi_cntrl->mhi_dev->dev;
> -	size_t tr_len, read_offset, write_offset;
> +	size_t tr_len, read_offset;
>   	struct mhi_ep_buf_info buf_info = {};
>   	u32 len = MHI_EP_DEFAULT_MTU;
>   	struct mhi_ring_element *el;
> -	bool tr_done = false;
>   	void *buf_addr;
> -	u32 buf_left;
>   	int ret;
>   
> -	buf_left = len;
> -
>   	do {
>   		/* Don't process the transfer ring if the channel is not in RUNNING state */
>   		if (mhi_chan->state != MHI_CH_STATE_RUNNING) {
> @@ -426,24 +422,23 @@ static int mhi_ep_read_channel(struct mhi_ep_cntrl *mhi_cntrl,
>   		/* Check if there is data pending to be read from previous read operation */
>   		if (mhi_chan->tre_bytes_left) {
>   			dev_dbg(dev, "TRE bytes remaining: %u\n", mhi_chan->tre_bytes_left);
> -			tr_len = min(buf_left, mhi_chan->tre_bytes_left);
> +			tr_len = min(len, mhi_chan->tre_bytes_left);
>   		} else {
>   			mhi_chan->tre_loc = MHI_TRE_DATA_GET_PTR(el);
>   			mhi_chan->tre_size = MHI_TRE_DATA_GET_LEN(el);
>   			mhi_chan->tre_bytes_left = mhi_chan->tre_size;
>   
> -			tr_len = min(buf_left, mhi_chan->tre_size);
> +			tr_len = min(len, mhi_chan->tre_size);
>   		}
>   
>   		read_offset = mhi_chan->tre_size - mhi_chan->tre_bytes_left;
> -		write_offset = len - buf_left;
>   
>   		buf_addr = kmem_cache_zalloc(mhi_cntrl->tre_buf_cache, GFP_KERNEL);
>   		if (!buf_addr)
>   			return -ENOMEM;
>   
>   		buf_info.host_addr = mhi_chan->tre_loc + read_offset;
> -		buf_info.dev_addr = buf_addr + write_offset;
> +		buf_info.dev_addr = buf_addr;
>   		buf_info.size = tr_len;
>   		buf_info.cb = mhi_ep_read_completion;
>   		buf_info.cb_buf = buf_addr;
> @@ -459,16 +454,12 @@ static int mhi_ep_read_channel(struct mhi_ep_cntrl *mhi_cntrl,
>   			goto err_free_buf_addr;
>   		}
>   
> -		buf_left -= tr_len;
>   		mhi_chan->tre_bytes_left -= tr_len;
>   
> -		if (!mhi_chan->tre_bytes_left) {
> -			if (MHI_TRE_DATA_GET_IEOT(el))
> -				tr_done = true;
> -
> +		if (!mhi_chan->tre_bytes_left)
>   			mhi_chan->rd_offset = (mhi_chan->rd_offset + 1) % ring->ring_size;
> -		}
> -	} while (buf_left && !tr_done);
> +	/* Read until the some buffer is left or the ring becomes not empty */
> +	} while (!mhi_ep_queue_is_empty(mhi_chan->mhi_dev, DMA_TO_DEVICE));
>   
>   	return 0;
>   
> @@ -502,15 +493,11 @@ static int mhi_ep_process_ch_ring(struct mhi_ep_ring *ring)
>   		mhi_chan->xfer_cb(mhi_chan->mhi_dev, &result);
>   	} else {
>   		/* UL channel */
> -		do {
> -			ret = mhi_ep_read_channel(mhi_cntrl, ring);
> -			if (ret < 0) {
> -				dev_err(&mhi_chan->mhi_dev->dev, "Failed to read channel\n");
> -				return ret;
> -			}
> -
> -			/* Read until the ring becomes empty */
> -		} while (!mhi_ep_queue_is_empty(mhi_chan->mhi_dev, DMA_TO_DEVICE));
> +		ret = mhi_ep_read_channel(mhi_cntrl, ring);
> +		if (ret < 0) {
> +			dev_err(&mhi_chan->mhi_dev->dev, "Failed to read channel\n");
> +			return ret;
> +		}
>   	}
>   
>   	return 0;
> 
> ---
> base-commit: 4c06e63b92038fadb566b652ec3ec04e228931e8
> change-id: 20250709-chained_transfer-0b95f8afa487
> 
> Best regards,

