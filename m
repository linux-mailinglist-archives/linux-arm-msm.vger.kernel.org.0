Return-Path: <linux-arm-msm+bounces-21525-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C06E8FA507
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 23:57:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 202751F222FC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 21:57:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3048F13C827;
	Mon,  3 Jun 2024 21:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kgRBbbf3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB793236;
	Mon,  3 Jun 2024 21:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717451869; cv=none; b=mMawfEbYUeRWdiq0yYtRWCAk+Z5fXmH0AJ8WBHqBt1EpwSUP2s5OkTQyp1V4L3gI9LGEvo+I9sWpJkr5bUi9QvkuVSqm7pyzFlxrhipGsHhh9zy+v64LDkI9GyuuccaI+Xa7UNPmuSbqEZ4wsPUnlTdJ92/KyF+jPYAgsTiLlBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717451869; c=relaxed/simple;
	bh=uGjlFGkxYZ4n2nf5+mWi19eRsaCZv5UkZwE+PGMYBB4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=TRTtm9Uv/ysrpfRWDl51gcgzyLV53L+V/wFCW5jPub/j+rENOUAndIPDnArygup8JJqJD/9TX/w2iVyvANfuiyNX3pKWjKeooLA9m38Iow6QNA+twYnkSdnIY3PhKXQBGJyWFvuahQ6xVzw4dopDmVadTUxzgTEgDd9hC/WjGGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kgRBbbf3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 453ASsNE015299;
	Mon, 3 Jun 2024 21:57:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+huiNJRLt44NCN/r6bDMvnL/tWOjvPnxr5JvMN59Ows=; b=kgRBbbf3F8N+RvZy
	v3h1WYFs24UFg3u4O6SWivJdpRvFEAWZra4YVi3/rqoD6CvzxRVQ3LNTV+5a3ixt
	xRmkfabk/5rjHWn8NFOWAAUuXmM4gKK6Sprsd/ffCJFbvX3cYxCqtPI9XHuU/qHO
	V/Q8GDyEiY4YkqkOcZAW8nQqnOdVWuYnzMYFV8G6YwkbkEQ9EFiOC8KL69Nf3T9z
	Udr10aRZek1P3ZyoghvW+8fdpSQkSjgr/vgCr1mBq6IZwXNTmr+ejZm94CcFeYUq
	HMcREi5ysrSj76TLAuuLRnCi9FXoFPcLVxXLiavKBlSaPpoivxO6g9hFJRc60aKW
	tIteyw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yfw5wn2fn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Jun 2024 21:57:45 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 453LviYm002952
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 3 Jun 2024 21:57:44 GMT
Received: from [10.110.69.141] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 3 Jun 2024
 14:57:43 -0700
Message-ID: <5f2ea1a4-17a9-4fdd-badc-386b9cc57183@quicinc.com>
Date: Mon, 3 Jun 2024 14:57:43 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: mhi: ep: Do not allocate memory for MHI objects from
 DMA zone
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        <mhi@lists.linux.dev>
CC: <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <stable@vger.kernel.org>
References: <20240603164354.79035-1-manivannan.sadhasivam@linaro.org>
Content-Language: en-US
From: Mayank Rana <quic_mrana@quicinc.com>
In-Reply-To: <20240603164354.79035-1-manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 7sqVywnf2gZBqIARLB72d1cYTxFVVZtx
X-Proofpoint-ORIG-GUID: 7sqVywnf2gZBqIARLB72d1cYTxFVVZtx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-03_17,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1011
 lowpriorityscore=0 mlxlogscore=999 bulkscore=0 spamscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406030178



On 6/3/2024 9:43 AM, Manivannan Sadhasivam wrote:
> MHI endpoint stack accidentally started allocating memory for objects from
> DMA zone since commit 62210a26cd4f ("bus: mhi: ep: Use slab allocator
Going through mentioned commit it seems that it was intended purpose to 
use GFP_DMA/SLAB
> where applicable"). But there is no real need to allocate memory from this
> naturally limited DMA zone. This also causes the MHI endpoint stack to run
> out of memory while doing high bandwidth transfers.
> 
> So let's switch over to normal memory.
> 
> Cc: stable@vger.kernel.org # 6.8
> Fixes: 62210a26cd4f ("bus: mhi: ep: Use slab allocator where applicable")
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>   drivers/bus/mhi/ep/main.c | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
> index f8f674adf1d4..4acfac73ca9a 100644
> --- a/drivers/bus/mhi/ep/main.c
> +++ b/drivers/bus/mhi/ep/main.c
> @@ -90,7 +90,7 @@ static int mhi_ep_send_completion_event(struct mhi_ep_cntrl *mhi_cntrl, struct m
>   	struct mhi_ring_element *event;
>   	int ret;
>   
> -	event = kmem_cache_zalloc(mhi_cntrl->ev_ring_el_cache, GFP_KERNEL | GFP_DMA);
> +	event = kmem_cache_zalloc(mhi_cntrl->ev_ring_el_cache, GFP_KERNEL);
>   	if (!event)
>   		return -ENOMEM;
>   
> @@ -109,7 +109,7 @@ int mhi_ep_send_state_change_event(struct mhi_ep_cntrl *mhi_cntrl, enum mhi_stat
>   	struct mhi_ring_element *event;
>   	int ret;
>   
> -	event = kmem_cache_zalloc(mhi_cntrl->ev_ring_el_cache, GFP_KERNEL | GFP_DMA);
> +	event = kmem_cache_zalloc(mhi_cntrl->ev_ring_el_cache, GFP_KERNEL);
>   	if (!event)
>   		return -ENOMEM;
>   
> @@ -127,7 +127,7 @@ int mhi_ep_send_ee_event(struct mhi_ep_cntrl *mhi_cntrl, enum mhi_ee_type exec_e
>   	struct mhi_ring_element *event;
>   	int ret;
>   
> -	event = kmem_cache_zalloc(mhi_cntrl->ev_ring_el_cache, GFP_KERNEL | GFP_DMA);
> +	event = kmem_cache_zalloc(mhi_cntrl->ev_ring_el_cache, GFP_KERNEL);
>   	if (!event)
>   		return -ENOMEM;
>   
> @@ -146,7 +146,7 @@ static int mhi_ep_send_cmd_comp_event(struct mhi_ep_cntrl *mhi_cntrl, enum mhi_e
>   	struct mhi_ring_element *event;
>   	int ret;
>   
> -	event = kmem_cache_zalloc(mhi_cntrl->ev_ring_el_cache, GFP_KERNEL | GFP_DMA);
> +	event = kmem_cache_zalloc(mhi_cntrl->ev_ring_el_cache, GFP_KERNEL);
>   	if (!event)
>   		return -ENOMEM;
>   
> @@ -438,7 +438,7 @@ static int mhi_ep_read_channel(struct mhi_ep_cntrl *mhi_cntrl,
>   		read_offset = mhi_chan->tre_size - mhi_chan->tre_bytes_left;
>   		write_offset = len - buf_left;
>   
> -		buf_addr = kmem_cache_zalloc(mhi_cntrl->tre_buf_cache, GFP_KERNEL | GFP_DMA);
> +		buf_addr = kmem_cache_zalloc(mhi_cntrl->tre_buf_cache, GFP_KERNEL);
>   		if (!buf_addr)
>   			return -ENOMEM;
>   
> @@ -1481,14 +1481,14 @@ int mhi_ep_register_controller(struct mhi_ep_cntrl *mhi_cntrl,
>   
>   	mhi_cntrl->ev_ring_el_cache = kmem_cache_create("mhi_ep_event_ring_el",
>   							sizeof(struct mhi_ring_element), 0,
> -							SLAB_CACHE_DMA, NULL);
> +							0, NULL);
>   	if (!mhi_cntrl->ev_ring_el_cache) {
>   		ret = -ENOMEM;
>   		goto err_free_cmd;
>   	}
>   
>   	mhi_cntrl->tre_buf_cache = kmem_cache_create("mhi_ep_tre_buf", MHI_EP_DEFAULT_MTU, 0,
> -						      SLAB_CACHE_DMA, NULL);
> +						      0, NULL);
>   	if (!mhi_cntrl->tre_buf_cache) {
>   		ret = -ENOMEM;
>   		goto err_destroy_ev_ring_el_cache;
Reviewed-by: Mayank Rana <quic_mrana@quicinc.com>

