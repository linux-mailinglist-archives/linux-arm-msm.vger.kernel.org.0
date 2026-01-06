Return-Path: <linux-arm-msm+bounces-87613-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7053DCF68A9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 04:00:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 699E8304F887
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 02:59:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1DAD226165;
	Tue,  6 Jan 2026 02:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dwblO1A0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j6pmCpQa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0ED23DEB6
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 02:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767668391; cv=none; b=Pg83ZjLYn4QOSUETJcUUVxupObxjg+eAT2Kz1omT0wNvtk6opJQ7VdWvF3KRd9rAXkWWqnM2v4dD89qfLqKboQGchL6VOvyuLR1mu2atO0V24C64pbXyft039ySOSaZ6iHJRctePQNI875GO0bKLbcw/pBoxC+7SRYqGS8I3t/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767668391; c=relaxed/simple;
	bh=v4Vy7Cq/ETLa3cmBm6DiW3Q5PtoyAc/OzRqEwJ9ZsQI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o0SwAPpn9Y5Iah0HTprMMRuIcdZXqXilqFgb1kkRPSLvWpcZT9EktaZnsqkBvWiKi1OKbKRCoH/52wVJW5Bm/vaBTHZRSq5ijtycaThERSRtmSSGmDZXM62n2JKj9ioFFS8rwQwhjLHYi16KwjI4noHTawRgulziOhbmSlc7AHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dwblO1A0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j6pmCpQa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6060oXXd2107273
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Jan 2026 02:59:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6wQM1q7i8j3cMNDcv8+eaFpi
	lrF4P/GzhO2hy2hNxZo=; b=dwblO1A0DzZ6VuyQC0zAtybUf8PgmeFym0YTytQD
	OO3yGiQJqz87hn1oDbzwZcktZeAIfi4IkiLaBCg2sqtG4KDrLGVRrGwp+RwU25uQ
	rG/rZnvKiHCAude2LgU0iblceglu4LAmBDri/6lPjp0ZlG1y9Vq4OMOOwwVPZlW5
	SSnATu9sJxJywSE8ntMtAnibaz40Prdt7Cpxf1Z3MgW7aPp3x9aAOO0NII1IH+AA
	SybuHsU2T0pwWDpLI97sCOlX61GNT39j9OAeYKpOfFG95Y5CyJGroZhuud6yBAWZ
	vL+uh2RakkWEJimOIzSV1H41PBy3ktxPdv/YGZh+7ScUzA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgr7389cc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 02:59:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b19a112b75so136161985a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 18:59:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767668385; x=1768273185; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6wQM1q7i8j3cMNDcv8+eaFpilrF4P/GzhO2hy2hNxZo=;
        b=j6pmCpQacx708CAc4/dfXSs0kdXR0MzP0z4HtpvqBD6g21Jkbw1qXnYQ61bEh7YmbK
         21rOAC/c7zWS1FSZWvymCooBE/SxCqitbwauEiUTMkNZ+rtmxIgrZnbNzidiTw6PsEaQ
         Zw1IgycEbLha5ufWewJGGH+1IQL1AITD/rsnm3ajy6c6bg2nGoLwc0Cez6nuW6MeJfV6
         fEE6mKRbyBMgmn+u1AV6hwG0xDH+V8N41rnFUN6QU3kiZ/9CT98yb2IJ1I205lsfQ3E6
         4mtld1HzUhpJLdtGW5CKNIwc5L2QSfQZfbrfro+1+zPtnlB0YL2spbHv99iiE7VDzRRc
         5mLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767668385; x=1768273185;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6wQM1q7i8j3cMNDcv8+eaFpilrF4P/GzhO2hy2hNxZo=;
        b=n1KjJ7g9O/WKiM0uBW7D3+Asixz4TLQDN5UJh/nb59x6ViJv9iHtBuEyrYMznAEOE6
         rhi1W0ruK0TjfZq50TYKmKsUFUdt2CfUlEvTAHpM+4o+E1CdUsh5cYSSUqqmrtlTjXZJ
         ZttCk+GCEfa7c+Z5cUS6oDnT2CDxYydPd0Z8jJ4tC586xRMbOEk/Zmiw+H/LAJfYH5ZO
         OKaLp9jDwmm8qwZhQPFON9NTuoEqNZwx7bcyiGLoxRZWUvzxT2FNzkV5BQXXN/7qmnKn
         kQI0kmKH+MhgUzJrHbGDGaqbGzaIgVelrNae8PrVf1TfEe/2Eh6vrkUdxPXxO+YUbWW3
         eLRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlCM92POUsnOg5djvD5Lx6Pbh7IemPQihPUYCCmhPIG27qNJ5aHvMw+Yb+5jhRBogtxSuo4bHWkyUPvumw@vger.kernel.org
X-Gm-Message-State: AOJu0YwbFSkH/rWSke9RNjPM5Gb+sYtMlKdu2U3NZd7AHnv54r84uQ9v
	w0Mqobf6Ok795ZKxAVBsienqaYtuibSR7FAAY8F/RMOs3KOuF5XroO+haSI85fDsDOk0Fqgm7N2
	hn0aiEmn+EfI29gX4wvA/HN4IPVNoHKKuI8TYtn5OrntagRkQWRpBF1qCTYpQSwXSo3V/AKjPj5
	iN
X-Gm-Gg: AY/fxX708Steh3pFde4pxfGfA+cKXKTXw27VLh8RluVfxGj5WauYvZoEdPTL7pE0qOg
	OtrThNYvmZQqSGP8RBuw7Q/dApSYeUlLHzm1/6pcvx0jOP+qOHUWqhecktLqbuNJsvImZ7p8X1e
	9a7gkp0sXUjPY5hOYhyr1o58zIpgaED7Jc25aKpzH5XtvQWNnr8+mfN0rQGTMwXHG5akjwxIqN/
	k4llYpqRELv5VtDcpjwW5HiO5KHejHxW2dwSmJBnFgQTj7lqlgulxsXLCkC1dXoB52MqoRzzNiQ
	6QwpD67Xz6K/GYRtXbH1+4kY2A/uNzYcoyue43XeJhQB1rkJVCwnpOUuu9WGXxO1rGv01p4GNLA
	Tr61xVbPpSvFqUyDjAR8hDeviDO862+a1H9CyED3K/3c8BoiQ0FoU4x9HwXCzjlZT4wC1oxRPNl
	HDm4rzDX/2IIUyUNybtCcWoYQ=
X-Received: by 2002:a05:622a:1805:b0:4f1:e8ee:a56d with SMTP id d75a77b69052e-4ffa77c0193mr21383391cf.38.1767668385383;
        Mon, 05 Jan 2026 18:59:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGRp94E5R7paew929d4nHSzzUNnTf9SmWDvD/s9/IvhXdHvg9ZYOelBsosOawoMIgsie6lkew==
X-Received: by 2002:a05:622a:1805:b0:4f1:e8ee:a56d with SMTP id d75a77b69052e-4ffa77c0193mr21383221cf.38.1767668384808;
        Mon, 05 Jan 2026 18:59:44 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382eb3beae7sm2203491fa.12.2026.01.05.18.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 18:59:41 -0800 (PST)
Date: Tue, 6 Jan 2026 04:59:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srini@kernel.org, linux-arm-msm@vger.kernel.org,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        konrad.dybcio@oss.qualcomm.com
Subject: Re: [PATCH v5 4/4] misc: fastrpc: Add polling mode support for
 fastRPC driver
Message-ID: <z6oyuqmts55um67wrthxcm3fc5n2r25d66r2kcgfiqsxwntlit@xaad7ek2hq4j>
References: <20251230062831.1195116-1-ekansh.gupta@oss.qualcomm.com>
 <20251230062831.1195116-5-ekansh.gupta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251230062831.1195116-5-ekansh.gupta@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=QrxTHFyd c=1 sm=1 tr=0 ts=695c7aa2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=E6ODJj0EQkZxiq7Ia20A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 97o-1qIRckjDfnCDZFEtykKwTd4eujwQ
X-Proofpoint-GUID: 97o-1qIRckjDfnCDZFEtykKwTd4eujwQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDAyNCBTYWx0ZWRfX4F0SlJLb93W2
 Xe1ehEAL4OxZ70fUq+88uMkOxKIQZhGWyxdkelKMdflDT8WR6eBJaoi5ptAtvY4F2qOH+Pv/h9Z
 47d7/7kkBW2+hOb6xyQyuRBY/WZ+hZisTwf6l/vih8++Qx81bA3yc8/Hzq9yYxY3Nm0Tp7CyIri
 HymTj+4WYONQ6I4TEEWVcNtxoJjQavmzDHQ3NPAv/bviaYNP0DyXa3NVZChZ68ZWxcQ7n039CwL
 aHrlchKBsTiPho5Vs9p7x0cXC2SZwHqtXnPtIF4G86d1fOMG/FySmaIgO43AD7Tsor3qazqhsTA
 qhw3R1SJ+42kSjqLIIxo9rymVCowKsEPn/LbmdGs8W4+kzgSzSEx4itLS5y2Pbr65HV8CG77SqH
 eu5+HRtyDGxVG89weyrg00UhKrutxr6uYSRPSDKcwryb8f/UBR3e9aAld/mNibUGjtd1rWjaK2b
 y963kl0M0oYySJ21kag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060024

On Tue, Dec 30, 2025 at 11:58:31AM +0530, Ekansh Gupta wrote:
> For any remote call to DSP, after sending an invocation message,
> fastRPC driver waits for glink response and during this time the
> CPU can go into low power modes. This adds latency to overall fastrpc
> call as CPU wakeup and scheduling latencies are included. Add polling
> mode support with which fastRPC driver will poll continuously on a
> memory after sending a message to remote subsystem which will eliminate
> CPU wakeup and scheduling latencies and reduce fastRPC overhead. Poll
> mode can be enabled by user by using FASTRPC_IOCTL_SET_OPTION ioctl
> request with FASTRPC_POLL_MODE request id.
> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c      | 139 ++++++++++++++++++++++++++++++++++--
>  include/uapi/misc/fastrpc.h |   9 +++
>  2 files changed, 141 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 222ff15e04bd..d95d31d27b82 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -22,6 +22,8 @@
>  #include <linux/firmware/qcom/qcom_scm.h>
>  #include <uapi/misc/fastrpc.h>
>  #include <linux/of_reserved_mem.h>
> +#include <linux/compiler.h>
> +#include <linux/iopoll.h>
>  #include <linux/bitfield.h>
>  
>  #define ADSP_DOMAIN_ID (0)
> @@ -38,6 +40,7 @@
>  #define FASTRPC_CTX_MAX (256)
>  #define FASTRPC_INIT_HANDLE	1
>  #define FASTRPC_DSP_UTILITIES_HANDLE	2
> +#define FASTRPC_MAX_STATIC_HANDLE (20)
>  #define FASTRPC_CTXID_MASK GENMASK(15, 8)
>  #define INIT_FILELEN_MAX (2 * 1024 * 1024)
>  #define INIT_FILE_NAMELEN_MAX (128)
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

This doesn't seem to match the calculation few lines ago. fdlist is a
pointer. On 64-bit systems ctx->poll will point to (uintptr_t)ctx->fdlist +
sizeof(u64) * FASTRPC_MAX_FDLIST + (sizeof u64) * FASTRPC_MAX_CRCLIST,
while in fastrpc_get_meta_size it was ... + sizeof(u32) *
FASTRPC_MAX_CRCLIST.

Am I missing something?

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
> @@ -1780,6 +1877,30 @@ static int fastrpc_get_info_from_kernel(struct fastrpc_ioctl_capability *cap,
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
> +
> +	if (opt.req != FASTRPC_POLL_MODE)
> +		return -EINVAL;
> +
> +	if (opt.value)
> +		fl->poll_mode = true;
> +	else
> +		fl->poll_mode = false;

Is poll_mode supported on MSM8916?

> +
> +	return 0;
> +}
> +
>  static int fastrpc_get_dsp_info(struct fastrpc_user *fl, char __user *argp)
>  {
>  	struct fastrpc_ioctl_capability cap = {0};
> @@ -2134,6 +2255,9 @@ static long fastrpc_device_ioctl(struct file *file, unsigned int cmd,
>  	case FASTRPC_IOCTL_MEM_UNMAP:
>  		err = fastrpc_req_mem_unmap(fl, argp);
>  		break;
> +	case FASTRPC_IOCTL_SET_OPTION:
> +		err = fastrpc_set_option(fl, argp);
> +		break;
>  	case FASTRPC_IOCTL_GET_DSP_INFO:
>  		err = fastrpc_get_dsp_info(fl, argp);
>  		break;
> @@ -2465,6 +2589,7 @@ static int fastrpc_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
>  
>  	ctx->retval = rsp->retval;
>  	complete(&ctx->work);
> +	ctx->is_work_done = true;
>  
>  	/*
>  	 * The DMA buffer associated with the context cannot be freed in
> diff --git a/include/uapi/misc/fastrpc.h b/include/uapi/misc/fastrpc.h
> index c6e2925f47e6..3207c42fb318 100644
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

Is it related to FASTRPC_ATTR_SECUREMAP? Why is it a part of the same
visual block?

>  
>  struct fastrpc_invoke_args {
>  	__u64 ptr;
> @@ -133,6 +136,12 @@ struct fastrpc_mem_unmap {
>  	__s32 reserved[5];
>  };
>  
> +struct fastrpc_ioctl_set_option {
> +	__u32 req;	/* request id */
> +	__u32 value;	/* value */
> +	__s32 reserved[6];

What are you reserving it for?

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

