Return-Path: <linux-arm-msm+bounces-82454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id F311DC6D88A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 09:56:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sto.lore.kernel.org (Postfix) with ESMTPS id 66DF629427
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 08:56:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A484431ED95;
	Wed, 19 Nov 2025 08:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fxGuLlcQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CP8umDZ7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05ED6308F36
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 08:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763542588; cv=none; b=oIJU2xb7MEwXBmv0hhalD+jGuMYvoVtRUg/LKoFxSrSCrggpVZHQ744py8Wh6NS7PLXzuXLf/UmDHdGohir8Wyg3K/AGNjFPi8bEnhyvWR5sKZD5A3Om+7UrVUGcCjGFfU3hS4YB7ccleA5pM/p+fP8T3hSFfl9wguD1Z9qIgUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763542588; c=relaxed/simple;
	bh=mKbSLns2z0DhooeE9qvkL0Y7NTAShT8WoJC74dAIOC4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZGLUqWV9ywqF8z8jWUjo0kscgvvJgaG6jla7Gy90r8qU7XGEfeE7S9CaSnlLyPKjFHxb8544CasQHZ1p6Vu9nwqTahj+B/5WNLpZHbNj7cig19a3d+Gb5urFgDzwqXpXiXP77/IDzVgkAw299BlleBBc1PS8oczhthx1L8PW4II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fxGuLlcQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CP8umDZ7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJ4XZZs884823
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 08:56:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DTqOh/Qva983pAVRw29UEm5X
	bNriMqu2kQ2XaR5snak=; b=fxGuLlcQlYLUbo4fqqYTm+MBjWwz33wRIPDGTjoL
	IxPAtJ4WqMDfnbukd44VlTTCAvOaELtMh6Rase5NPzdTuzuPR4EReBWYLIx6BuBc
	K+pwctAR3Qte1TYw2sguoA45sPrFNs+yaZypWh2D+aIQTlhHXd27Wn4hSjKAqrHQ
	39RsVJ61MAB9LLEWxJrWlcpMgcP3++cdW2TLK0Mumy1yJ2YwtdKcs4XE2PTsGmkP
	LkYdKJPilLQvpGSOc2qcQSL8wGqDK6QNvGTuP58uBT+e8loF3UMWC0w1uMPuhTw/
	3Acc0WM1y3Mcv/VEKWsfTBG430T5gnr1I671GefG2J/snA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ah6yq8q3v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 08:56:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2de6600c0so1114848785a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 00:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763542584; x=1764147384; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DTqOh/Qva983pAVRw29UEm5XbNriMqu2kQ2XaR5snak=;
        b=CP8umDZ7dkcsoYXdkQP02fCg/x4awUox45vFZVZfHd2WjggWVWO3aHQD0p+KmCMEzQ
         XRT9CGlPG4IqQtIT5NyB/cakxEg1vVVfawQQrrn4BWQbm6VgGBv3deTvjRcc3wRyyxNn
         4QFF9Aik4ROSuo3yAJkK04MbNpeQ8Ohyn2IHQsnylaCGFDxxKNSuNt0xL2kbhI/FDIog
         0sF9Xfz2OqZtCxrMmf3wRxCHUXv0JGyF/t+jV4STUqCee+uRFyN4TwfrbbICPDGtebcu
         HIqn5XKnC9ZP+Q06rPpxo/FMxBKsgSsxIyTwl7FK9iJF2NG2d4Mra9ALKg4etKFMQxLh
         vRlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763542584; x=1764147384;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DTqOh/Qva983pAVRw29UEm5XbNriMqu2kQ2XaR5snak=;
        b=hNf6okbqw/v+jlpCyOizLEiuPXun408sUPnErvyoDxSrFL8xnAqpLuVh4liqtcLKYo
         3dFeDm9W+bSMI03tk2h2DQQPUO5zArm9p8QjsJbPm55v21zNx6rHdMsfHvleK0s84rY/
         Gl37KA3ahnWUDdw39TJ8m+JyPuUIsTucjfru2YK7lhckaaSSr0WFWp+jHi2USUyOi9pt
         +EBEfI+Nzfm0T00/mxhwpBKvfr5Hh8ilmsSugXhQwQRNop+RL7d/jXGSCKRrdQ1Td7PH
         0j4J7USLRRTaO8RC2wWxBtaqhZC1Mla4YUVYuUsBMYwzDAfoQY6afTV2fLhy76hhHLp1
         /zJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUivuuBCYxRQt+/jSUI2bhcQfutEBGSIuq20h9/x5vm2aCpdODpEq8ZdVxUaxsxjjqhXMlnvYQM42JdvmsX@vger.kernel.org
X-Gm-Message-State: AOJu0YzwQH+0hjJtlRzfVyq+h3UOsBdPPJdNYgo5M9BK7a/1hf8jFfgw
	G7ILbSYNBix3EdXLgftXbJf/4F7MYBon88D3U0iPIrfAzjLmY7XJs314pv61I8FmNiDP1/K9D58
	HEIMkhj9+sBDwnchsgUpQzyHppzEkH5085jCkhggOXxdvJaT0VCCa5BjWPrq6F7a+LC9Q
X-Gm-Gg: ASbGncvC4PYO2rnS+GU/NfRotlr/+TNT4ivEdhXrnypEe4mpuxuvs8epAOPh2cJZ6un
	T4TAqUTucp/fDc+tlhiZRtiLILvym6Ao9LkSnEPlOri+fLI/6eJ9pvlWWd3shqVrd0lURVqCd1+
	VltHqiaIHFvqUPFjF+omoVbVWJg9aBlgwxKZfSdmkAQX15KLcqQTcdiq7ZztIEmX78ZZTaMuJT1
	UiLTOtP06XTSNi10kjk6OfpH+fGul751WA2b3x08PvhwsaJ2ZmV9Vn0qm0/k5fZOZLXkjTikMYl
	Yd83TsKd10hZ+7dUmEjOcqr6fGIBQeihLudcfJcFcyLztKAkj/z2LRBpi7aIu4wwspwukHbVufj
	TgsZKVlocot/cGkRRprZRLGKUgMidnp4dk/1B5kOC/o1ybIRLg5mJ/RGf48C9X5QW2OP1BI3yHK
	8fjoycg9hy9V/jqwoZgA4j22A=
X-Received: by 2002:a05:620a:1a05:b0:8b1:498b:77fc with SMTP id af79cd13be357-8b317007e86mr271895385a.33.1763542584050;
        Wed, 19 Nov 2025 00:56:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGxhJzRDFSz8l2i1022fmebuORbWaeiHJ7zt2AjmKcudJVFlCjlWR2fE+TVsUMs7RB3i0jWHA==
X-Received: by 2002:a05:620a:1a05:b0:8b1:498b:77fc with SMTP id af79cd13be357-8b317007e86mr271892185a.33.1763542583417;
        Wed, 19 Nov 2025 00:56:23 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5959d9c52e0sm526972e87.11.2025.11.19.00.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 00:56:22 -0800 (PST)
Date: Wed, 19 Nov 2025 10:56:20 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srini@kernel.org, linux-arm-msm@vger.kernel.org,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v3 3/3] misc: fastrpc: Add polling mode support for
 fastRPC driver
Message-ID: <a4tz73rrghpsqpcwrdr4w63rki66ron35t4gi5thwkdbuefuhe@ocktiwt4u6qq>
References: <20251113064111.2426325-1-ekansh.gupta@oss.qualcomm.com>
 <20251113064111.2426325-4-ekansh.gupta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113064111.2426325-4-ekansh.gupta@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: epZfGAxOt07C_uS7l0M2QlQrbLYW0Wr8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDA2OSBTYWx0ZWRfX2Bsw8oXQSe9B
 G1rHe+bOj0N1q8HlN6H3LckyE16IUyT7u0uoEcj0vYwbe4I6iAHj/B5tigZRJ2Fgdiyzeu8lrQu
 aRK1qHw0Y8kUO4zmp1cg4qFo0QUhZj3nUdksCrKTMghrjCoUh++tYqPFW67liXT8Bnv0lrJ7vGB
 WZx6Q4qTR2zS4QcbgjjSDrjHSq4h9LeTQFjFIo8jel8NNEOTdKvJBq4VzKU/1g4AOCTyxjd01kL
 M1s3pP7cx1dwCJWmJkaCxkWXQI/LJM8Toei5e9DKo2eCtcN3vMXOjxHqcbUpIjaEISMioDkWXma
 385kXGn96FELH6Z31zNTcsOujAfUPUQQGNq6oJgqr//CdLtMHjfj67p0xBXDXb74//wv71aq1VH
 +kI1dcML7nPMCRJHovZUwqYEIsTn6A==
X-Authority-Analysis: v=2.4 cv=Ut1u9uwB c=1 sm=1 tr=0 ts=691d8638 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=E6ODJj0EQkZxiq7Ia20A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: epZfGAxOt07C_uS7l0M2QlQrbLYW0Wr8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 malwarescore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190069

On Thu, Nov 13, 2025 at 12:11:11PM +0530, Ekansh Gupta wrote:
> For any remote call to DSP, after sending an invocation message,
> fastRPC driver waits for glink response and during this time the
> CPU can go into low power modes. This adds latency to overall fastrpc
> call as CPU wakeup and scheduling latencies are included. Add polling
> mode support with which fastRPC driver will poll continuously on a
> memory after sending a message to remote subsystem which will eliminate
> CPU wakeup and scheduling latencies and reduce fastRPC overhead. Poll
> mode can be enabled by user by making a remote_handle64_control request.

Which request?? I thought it's enabled by making an IOCTL.

> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c      | 138 ++++++++++++++++++++++++++++++++++--
>  include/uapi/misc/fastrpc.h |   9 +++
>  2 files changed, 140 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index ccba3b6dfdfa..60de9dcb9815 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -22,6 +22,8 @@
>  #include <linux/firmware/qcom/qcom_scm.h>
>  #include <uapi/misc/fastrpc.h>
>  #include <linux/of_reserved_mem.h>
> +#include <linux/compiler.h>
> +#include <linux/iopoll.h>
>  
>  #define ADSP_DOMAIN_ID (0)
>  #define MDSP_DOMAIN_ID (1)
> @@ -37,6 +39,7 @@
>  #define FASTRPC_CTX_MAX (256)
>  #define FASTRPC_INIT_HANDLE	1
>  #define FASTRPC_DSP_UTILITIES_HANDLE	2
> +#define FASTRPC_MAX_STATIC_HANDLE (20)
>  #define FASTRPC_CTXID_MASK (0xFF00)
>  #define FASTRPC_CTXID_POS (8)
>  #define INIT_FILELEN_MAX (2 * 1024 * 1024)
> @@ -106,6 +109,12 @@
>  
>  #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
>  
> +/* Poll response number from remote processor for call completion */
> +#define FASTRPC_POLL_RESPONSE (0xdecaf)
> +
> +/* Polling mode timeout limit */
> +#define FASTRPC_POLL_MAX_TIMEOUT_US (10000)
> +
>  struct fastrpc_phy_page {
>  	u64 addr;		/* physical address */
>  	u64 size;		/* size of contiguous region */
> @@ -236,8 +245,14 @@ struct fastrpc_invoke_ctx {
>  	u32 sc;
>  	u64 *fdlist;
>  	u32 *crc;
> +	/* Poll memory that DSP updates */
> +	u32 *poll;
>  	u64 ctxid;
>  	u64 msg_sz;
> +	/* work done status flag */
> +	bool is_work_done;
> +	/* process updates poll memory instead of glink response */
> +	bool is_polled;
>  	struct kref refcount;
>  	struct list_head node; /* list of ctxs */
>  	struct completion work;
> @@ -301,6 +316,8 @@ struct fastrpc_user {
>  	int client_id;
>  	int pd;
>  	bool is_secure_dev;
> +	/* Flags poll mode state */
> +	bool poll_mode;
>  	/* Lock for lists */
>  	spinlock_t lock;
>  	/* lock for allocations */
> @@ -894,7 +911,8 @@ static int fastrpc_get_meta_size(struct fastrpc_invoke_ctx *ctx)
>  		sizeof(struct fastrpc_invoke_buf) +
>  		sizeof(struct fastrpc_phy_page)) * ctx->nscalars +
>  		sizeof(u64) * FASTRPC_MAX_FDLIST +
> -		sizeof(u32) * FASTRPC_MAX_CRCLIST;
> +		sizeof(u32) * FASTRPC_MAX_CRCLIST +
> +		sizeof(u32);
>  
>  	return size;
>  }
> @@ -990,6 +1008,7 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
>  	list = fastrpc_invoke_buf_start(rpra, ctx->nscalars);
>  	pages = fastrpc_phy_page_start(list, ctx->nscalars);
>  	ctx->fdlist = (u64 *)(pages + ctx->nscalars);
> +	ctx->poll = (u32 *)(ctx->fdlist + FASTRPC_MAX_FDLIST + FASTRPC_MAX_CRCLIST);
>  	args = (uintptr_t)ctx->buf->virt + metalen;
>  	rlen = pkt_size - metalen;
>  	ctx->rpra = rpra;
> @@ -1158,6 +1177,75 @@ static int fastrpc_invoke_send(struct fastrpc_session_ctx *sctx,
>  
>  }
>  
> +static inline u32 fastrpc_poll_op(void *p)
> +{
> +	struct fastrpc_invoke_ctx *ctx = p;
> +
> +	dma_rmb();
> +	return READ_ONCE(*ctx->poll);

How does this work with caches? Does it require dma-coherent fastrpc
devices?

> +}
> +
> +static int poll_for_remote_response(struct fastrpc_invoke_ctx *ctx)
> +{
> +	u32 val;
> +	int ret;
> +
> +	/*
> +	 * Poll until DSP writes FASTRPC_POLL_RESPONSE into *ctx->poll
> +	 * or until another path marks the work done.
> +	 */
> +	ret = read_poll_timeout_atomic(fastrpc_poll_op, val,
> +				       (val == FASTRPC_POLL_RESPONSE) ||
> +				       ctx->is_work_done, 1,
> +				       FASTRPC_POLL_MAX_TIMEOUT_US, false, ctx);
> +
> +	if (!ret && val == FASTRPC_POLL_RESPONSE) {
> +		ctx->is_work_done = true;
> +		ctx->retval = 0;
> +	}
> +
> +	if (ret == -ETIMEDOUT)
> +		ret = -EIO;
> +
> +	return ret;
> +}
> +
> +static inline int fastrpc_wait_for_response(struct fastrpc_invoke_ctx *ctx,
> +					    u32 kernel)
> +{
> +	int err = 0;
> +
> +	if (kernel) {
> +		if (!wait_for_completion_timeout(&ctx->work, 10 * HZ))
> +			err = -ETIMEDOUT;
> +	} else {
> +		err = wait_for_completion_interruptible(&ctx->work);
> +	}
> +
> +	return err;
> +}
> +
> +static int fastrpc_wait_for_completion(struct fastrpc_invoke_ctx *ctx,
> +				       u32 kernel)
> +{
> +	int err;
> +
> +	do {
> +		if (ctx->is_polled) {
> +			err = poll_for_remote_response(ctx);
> +			/* If polling timed out, move to normal response mode */
> +			if (err)
> +				ctx->is_polled = false;
> +		} else {
> +			err = fastrpc_wait_for_response(ctx, kernel);
> +			if (err)
> +				return err;
> +		}
> +	} while (!ctx->is_work_done);
> +
> +	return err;
> +}
> +
>  static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
>  				   u32 handle, u32 sc,
>  				   struct fastrpc_invoke_args *args)
> @@ -1193,16 +1281,25 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
>  	if (err)
>  		goto bail;
>  
> -	if (kernel) {
> -		if (!wait_for_completion_timeout(&ctx->work, 10 * HZ))
> -			err = -ETIMEDOUT;
> -	} else {
> -		err = wait_for_completion_interruptible(&ctx->work);
> -	}
> +	/*
> +	 * Set message context as polled if the call is for a user PD
> +	 * dynamic module and user has enabled poll mode.
> +	 */
> +	if (handle > FASTRPC_MAX_STATIC_HANDLE && fl->pd == USER_PD &&
> +	    fl->poll_mode)
> +		ctx->is_polled = true;
> +
> +	err = fastrpc_wait_for_completion(ctx, kernel);
>  
>  	if (err)
>  		goto bail;
>  
> +	if (!ctx->is_work_done) {
> +		err = -ETIMEDOUT;
> +		dev_dbg(fl->sctx->dev, "Invalid workdone state for handle 0x%x, sc 0x%x\n",
> +			handle, sc);
> +		goto bail;
> +	}
>  	/* make sure that all memory writes by DSP are seen by CPU */
>  	dma_rmb();
>  	/* populate all the output buffers with results */
> @@ -1780,6 +1877,29 @@ static int fastrpc_get_info_from_kernel(struct fastrpc_ioctl_capability *cap,
>  	return 0;
>  }
>  
> +static int fastrpc_set_option(struct fastrpc_user *fl, char __user *argp)
> +{
> +	struct fastrpc_ioctl_set_option opt = {0};
> +	int i;
> +
> +	if (copy_from_user(&opt, argp, sizeof(opt)))
> +		return -EFAULT;
> +
> +	for (i = 0; i < ARRAY_SIZE(opt.reserved); i++) {
> +		if (opt.reserved[i] != 0)
> +			return -EINVAL;
> +	}

Empty line.

> +	if (opt.req != FASTRPC_POLL_MODE)
> +		return -EINVAL;
> +
> +	if (opt.enable)
> +		fl->poll_mode = true;
> +	else
> +		fl->poll_mode = false;
> +
> +	return 0;
> +}
> +
>  static int fastrpc_get_dsp_info(struct fastrpc_user *fl, char __user *argp)
>  {
>  	struct fastrpc_ioctl_capability cap = {0};
> @@ -2134,6 +2254,9 @@ static long fastrpc_device_ioctl(struct file *file, unsigned int cmd,
>  	case FASTRPC_IOCTL_MEM_UNMAP:
>  		err = fastrpc_req_mem_unmap(fl, argp);
>  		break;
> +	case FASTRPC_IOCTL_SET_OPTION:
> +		err = fastrpc_set_option(fl, argp);
> +		break;
>  	case FASTRPC_IOCTL_GET_DSP_INFO:
>  		err = fastrpc_get_dsp_info(fl, argp);
>  		break;
> @@ -2465,6 +2588,7 @@ static int fastrpc_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
>  
>  	ctx->retval = rsp->retval;
>  	complete(&ctx->work);
> +	ctx->is_work_done = true;
>  
>  	/*
>  	 * The DMA buffer associated with the context cannot be freed in
> diff --git a/include/uapi/misc/fastrpc.h b/include/uapi/misc/fastrpc.h
> index c6e2925f47e6..6c1375ba0042 100644
> --- a/include/uapi/misc/fastrpc.h
> +++ b/include/uapi/misc/fastrpc.h
> @@ -16,6 +16,7 @@
>  #define FASTRPC_IOCTL_INIT_CREATE_STATIC _IOWR('R', 9, struct fastrpc_init_create_static)
>  #define FASTRPC_IOCTL_MEM_MAP		_IOWR('R', 10, struct fastrpc_mem_map)
>  #define FASTRPC_IOCTL_MEM_UNMAP		_IOWR('R', 11, struct fastrpc_mem_unmap)
> +#define FASTRPC_IOCTL_SET_OPTION	_IOWR('R', 12, struct fastrpc_ioctl_set_option)
>  #define FASTRPC_IOCTL_GET_DSP_INFO	_IOWR('R', 13, struct fastrpc_ioctl_capability)
>  
>  /**
> @@ -66,6 +67,8 @@ enum fastrpc_proc_attr {
>  
>  /* Fastrpc attribute for memory protection of buffers */
>  #define FASTRPC_ATTR_SECUREMAP	(1)
> +/* Set option request ID to enable poll mode */
> +#define FASTRPC_POLL_MODE	(1)
>  
>  struct fastrpc_invoke_args {
>  	__u64 ptr;
> @@ -133,6 +136,12 @@ struct fastrpc_mem_unmap {
>  	__s32 reserved[5];
>  };
>  
> +struct fastrpc_ioctl_set_option {
> +	__u32 req;		/* request id */
> +	__u32 enable;	/* enable flag */

s/enable/value/ ?

> +	__s32 reserved[6];

I think you got feedback from Greg regarding handling of reserved fields
few months ago. Please drop them.

> +};
> +
>  struct fastrpc_ioctl_capability {
>  	__u32 unused; /* deprecated, ignored by the kernel */
>  	__u32 attribute_id;
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

