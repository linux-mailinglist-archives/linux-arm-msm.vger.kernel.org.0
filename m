Return-Path: <linux-arm-msm+bounces-89272-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F070D2883E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 21:47:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7BB1B301274F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 20:47:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89FB824468C;
	Thu, 15 Jan 2026 20:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MDP7SMiG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LF69P9dz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2873D2222C5
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 20:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768510071; cv=none; b=sqn3An7rya7jNTL/3rSD46Gg/V1cDELqIsxaKithhEjClCIRwS5k5Yo491vARqJaTR8kypkh8YsFqWVlabW6ExvNsouFv3Fr0a6SJxkkAfYqnWtswvA8jdXKiCk99Ok0SMFqEtdvNHMkJ0Yiqcvr35qZk8voHamjtgo0RiBS2Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768510071; c=relaxed/simple;
	bh=AXesnjd6dmmjqUmtdhU7ofPhA+ddMhmXIXoWIyLoM1I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o1IaRgS+kXAZeYyuUF2DGmHj3GjGV1/2ktVTMDK0FH/wSSwzyRHP+H4IFu1EYtNnAdMTmGwvnQMFdItBsffVBYGV2f+mckHYA7m4Tpmofn4gfUhsCLIqX6CLx3k0/n7JGI7L02NdS3ZN7GE8MvaNT0RJRKRdopSIVPShyDX+EHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MDP7SMiG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LF69P9dz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FFY4nj2174348
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 20:47:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cbiiDqRxX13mvXK+93g6nKvB
	vyrNQWBszX0XaVYe+gM=; b=MDP7SMiGdnmMHf9qdutEg9VSjD2sH7usblrHpm/R
	2Tew8iGBLqmrPf7Hetb4ZMWm+zLn+DzWJ5TUxFY9Hw2Y7B7PagC1RcL0SR8Bg+ky
	aCf/uWSYUx0gpOHXLTw+FCaENq/V9Sqa6NlwgDKwclDXF1ipJ2uZaNxfRlR4rCYy
	YJz6wDbZcq8wasWSsYDhuE/M5CPJ4ofmrm2TJ2jp73U0AxhUlKhdbaNeNXCUlPUK
	MFasCba3SgZdyif8tp1PXQoK6xd787ijDt0p8rbhs1FBm8cULjKK2rtXMJ18BN9Q
	+IVBY+av/TheAEJWLFZaDQPO3JBSemE8h21vdcO0gCyhkw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq1xh966h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 20:47:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c538971a16so330395485a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 12:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768510068; x=1769114868; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cbiiDqRxX13mvXK+93g6nKvBvyrNQWBszX0XaVYe+gM=;
        b=LF69P9dz1bW2mzksKtsZu2OA63Cr7WxRq8Sn+82Kne3ibIAeB7F+7OjnHXpBgt188x
         /JQGLO9iBr4Qvg13gAoJzdu0VOjaq2n0UsAKBlwQn+Th35s94mhQjlt4cMO9vNsKHt31
         9z4vvv8BPcVMS7IYpDGxCyEhwqDKhz0FqI+uO3nZ43so5tyyRMv5Av2QdpL7X5rsgcwf
         W/tTwCPDymvivuyCl5wIYYUvikPR+wgIgqASYS/25P68LsgaqqghhiBOlJYuGFBWrZKV
         /GV6dwqqMOTwl8rr8LP8uhtCdMMY8IN7NV00qzZAkcX6CLYltl+vrqN0lrBgJAnJFPbj
         XwBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768510068; x=1769114868;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cbiiDqRxX13mvXK+93g6nKvBvyrNQWBszX0XaVYe+gM=;
        b=eHFHy2idvQNYLroeEXrf2QOSglJnFrDkjAkFp0i9r+eO7cT64OGDN6gsoJp1RXixO8
         S0xxHLn5d275p7RhaW1dpqggfgNcyoi/m8YL8mFr1AAu25lYRBFSImTrnV5buI9ep45S
         An4JDKNFy/yxfpBsAn2ChpL8gsk+82LJVY1BblISq9BS+iUG/x3pOC0bGM6jY5vhwJiB
         IuvGhaWRqwChFkpIYsxNIkPx5lNsvRxXJlIV2GcfD7mV3fAz0JsonNvtkZBKuV/YQL28
         n9H/3hAdjyn25vv4D/IBQ9LwRDWRvCW6jEX6ct5YRp9eA8QK5nwcWeKQV5Yv7W70b11e
         fQhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIMA1DdXeAvZAqzd8GfDa54o0a15PJIvdHZPVrBnYaIvf78lvICCMnlfYnxYoZBXZFEZY+qzoRQ8OIBZRM@vger.kernel.org
X-Gm-Message-State: AOJu0YzkXvGYq1ZKMwpfZ+O4WqTOtU7hvXhUMxf74kG3Eq4myLMM1Ro0
	OQBdDnq8AF6qIMFek28z3IDe7jxtI3Tk5uMSo5PO8P24K9fmLvihgP8QsMw4EbHR4srsxr/wVbY
	rr3pxpNBaZnZSsMci7DTvwYiaCizJ9zbqbM4Zq+71/v8yNY/iBfvsDMd3fiznBSmjrpyO
X-Gm-Gg: AY/fxX6vSt7aq6SdzUffUBuqNeVTVgmJ5fzWuHURhi6qSOLuRdyMZJRYzkT7dWwl5+L
	HPnTpPV8OvdVOprlIXFq7CWRNUKw3nzmOa5IJSicnGu1KClWjQ6+w5LRgphwwAPbsUptz7rlbib
	rX6VIK2qJDrlBB2qN0Sa4F9huVUnmJQuD/mVi1dTFdxB5HIWdu/c7DzeOjQuzGNMLvf6QnW610o
	n1g1iJwKnS5dbIjdx7X8CMIpXwWbtdYbKC1ayaSzR3g2n/BBhvImIE0e5trAe1/YFXP/kpWsQls
	y5EneK3+e10dMfbkQ7DfeSM7ohwf+cefuN8eeMHwxpwtFJ91+ff3kHsMQDxji7iTAOpK9P42Ol7
	ttSTk3maesKFZaRaAH+7VwudVOyrrJycXHQgiv8HXLPH13iL4P2D30Sr8XNlyQ5BYjLzR4w6fhK
	kXAniIePqAOQmu8kozzHC6FMQ=
X-Received: by 2002:a05:620a:318c:b0:8c5:2e1b:791d with SMTP id af79cd13be357-8c6a66f8e17mr114954785a.31.1768510068342;
        Thu, 15 Jan 2026 12:47:48 -0800 (PST)
X-Received: by 2002:a05:620a:318c:b0:8c5:2e1b:791d with SMTP id af79cd13be357-8c6a66f8e17mr114951285a.31.1768510067880;
        Thu, 15 Jan 2026 12:47:47 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf39c40esm139824e87.75.2026.01.15.12.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 12:47:47 -0800 (PST)
Date: Thu, 15 Jan 2026 22:47:45 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jianping Li <jianping.li@oss.qualcomm.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        thierry.escande@linaro.org, abelvesa@kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, stable@kernel.org
Subject: Re: [PATCH v2 3/4] misc: fastrpc: Remove buffer from list prior to
 unmap operation
Message-ID: <3p4quidza7rwxng74fxcfoflo62tgakl7hummwsqmisaqmkwwp@nae55u2ehza4>
References: <20260115082851.570-1-jianping.li@oss.qualcomm.com>
 <20260115082851.570-4-jianping.li@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115082851.570-4-jianping.li@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 4DsyLnJ_zSCJsSlu6J9GTQp_9DS96Mjm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE2MyBTYWx0ZWRfX1NZkXxwrN3hS
 H4p8zVra5vDyBHtbsS/LnfopUigPDumCO8oqwn6SNgdM2jh+LLjGpmCJLDrneWS4DgmsaKY20wK
 BveAH+L0GRA3SwYX9k0L8lnz2H8NAWkKAdQGLsb0K2uMzCjzmvSQl6I0DhABReC9QS9jxg+ky/0
 bVW+LEqQ7pYjhAYs5BnZiwL73RcIM87xeroMs0S37x+Z4DFHIDAgAjjyheKbl8iNfAU9Cpq8gOs
 fzI5Br74bKBJ5j2JhxasutMjHaAz5kd1+RW3LBds+EBiKFeqcabT1uGv14F0YtG8UjrULFeYIvo
 zdO5aH7q2nRJN+6CS95Wv5X+4Pea/dZpUjw2VXicR/QgkNsZLJQ12vdMH+NjOlHLWkzIVT5tVMP
 tWT6kjGgJ5AAHS4aRZcIjao/BJz6p1cNVBBEbpl1KDBJ4dTkcihLDC4WfA3DVYSaWnuxRsaPidP
 moVKn7em5lq4Sx3tRFQ==
X-Authority-Analysis: v=2.4 cv=TdWbdBQh c=1 sm=1 tr=0 ts=69695274 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=UJ1zFB7r74I_tpvr3eIA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 4DsyLnJ_zSCJsSlu6J9GTQp_9DS96Mjm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150163

On Thu, Jan 15, 2026 at 04:28:50PM +0800, Jianping Li wrote:
> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> 
> fastrpc_req_munmap_impl() is called to unmap any buffer. The buffer is
> getting removed from the list after it is unmapped from DSP. This can
> create potential race conditions if any other thread removes the entry
> from list while unmap operation is ongoing. Remove the entry before
> calling unmap operation.
> 
> Fixes: 2419e55e532de ("misc: fastrpc: add mmap/unmap support")
> Cc: stable@kernel.org
> Co-developed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 28 ++++++++++++++++++++--------
>  1 file changed, 20 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 4f12fa5a05aa..833c265add5e 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -202,6 +202,8 @@ struct fastrpc_buf {
>  	/* mmap support */
>  	struct list_head node; /* list of user requested mmaps */
>  	uintptr_t raddr;
> +	/* Lock for buf->node */
> +	spinlock_t *list_lock;

Why do you need to lock this? Isn't fl->lock enough?

>  };
>  
>  struct fastrpc_dma_buf_attachment {
> @@ -441,6 +443,7 @@ static int __fastrpc_buf_alloc(struct fastrpc_user *fl, struct device *dev,
>  	buf->size = size;
>  	buf->dev = dev;
>  	buf->raddr = 0;
> +	buf->list_lock = &fl->lock;
>  
>  	buf->virt = dma_alloc_coherent(dev, buf->size, &buf->dma_addr,
>  				       GFP_KERNEL);
> @@ -1865,9 +1868,6 @@ static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *
>  				      &args[0]);
>  	if (!err) {
>  		dev_dbg(dev, "unmmap\tpt 0x%09lx OK\n", buf->raddr);
> -		spin_lock(&fl->lock);
> -		list_del(&buf->node);
> -		spin_unlock(&fl->lock);
>  		fastrpc_buf_free(buf);
>  	} else {
>  		dev_err(dev, "unmmap\tpt 0x%09lx ERROR\n", buf->raddr);
> @@ -1881,6 +1881,7 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
>  	struct fastrpc_buf *buf = NULL, *iter, *b;
>  	struct fastrpc_req_munmap req;
>  	struct device *dev = fl->sctx->dev;
> +	int err;
>  
>  	if (copy_from_user(&req, argp, sizeof(req)))
>  		return -EFAULT;
> @@ -1888,6 +1889,7 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
>  	spin_lock(&fl->lock);
>  	list_for_each_entry_safe(iter, b, &fl->mmaps, node) {
>  		if ((iter->raddr == req.vaddrout) && (iter->size == req.size)) {
> +			list_del(&iter->node);
>  			buf = iter;
>  			break;
>  		}
> @@ -1900,7 +1902,14 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
>  		return -EINVAL;
>  	}
>  
> -	return fastrpc_req_munmap_impl(fl, buf);
> +	err = fastrpc_req_munmap_impl(fl, buf);
> +	if (err) {
> +		spin_lock(buf->list_lock);
> +		list_add_tail(&buf->node, &fl->mmaps);
> +		spin_unlock(buf->list_lock);
> +	}
> +
> +	return err;
>  }
>  
>  static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
> @@ -1985,20 +1994,23 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
>  		}
>  	}
>  
> -	spin_lock(&fl->lock);
> +	spin_lock(buf->list_lock);
>  	list_add_tail(&buf->node, &fl->mmaps);
> -	spin_unlock(&fl->lock);
> +	spin_unlock(buf->list_lock);
>  
>  	if (copy_to_user((void __user *)argp, &req, sizeof(req))) {
>  		err = -EFAULT;
> -		goto err_assign;
> +		goto err_copy;
>  	}
>  
>  	dev_dbg(dev, "mmap\t\tpt 0x%09lx OK [len 0x%08llx]\n",
>  		buf->raddr, buf->size);
>  
>  	return 0;
> -
> +err_copy:
> +	spin_lock(buf->list_lock);
> +	list_del(&buf->node);
> +	spin_unlock(buf->list_lock);
>  err_assign:
>  	fastrpc_req_munmap_impl(fl, buf);
>  
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

