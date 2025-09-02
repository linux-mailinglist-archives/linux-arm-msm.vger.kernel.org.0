Return-Path: <linux-arm-msm+bounces-71523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DA6B3FA17
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 11:21:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 17C64164F28
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 09:21:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8637C261B78;
	Tue,  2 Sep 2025 09:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BJ0VWmAH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B6626A0D5
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 09:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756804886; cv=none; b=jKdJ8Sh9HO0jdI22cUd6NuVH/AenrErC1zY+7uLZMJnSg8zx2otsuIE8wQWBe1SFootUYRUSS6KZOVnbNl7FyuN0DvC0qcjjd4JMjB45jbEIwKSEB4IQCuZgWl3fq4pMZWMzCR6mrgfhWnq0C0gRCCVEu967tptHrMMO/WM4+iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756804886; c=relaxed/simple;
	bh=zjyGTex6MPuU0m129ci7YyB0Bqn6t6CNNf1Wj8bX4RI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sxquWOwrEatjSnxJJwnGNnYNg7MgMpnhV4MSRxDLhX5+R7XrGtTadkTo/gqyj5PvojaMPogYJ4Xy9trIt16Ivl4x+PnfeRchutGjnh++U0eO/IVDP+Q9rE7wC7sgSKie6AHq97jQga32DJMFvJ/JUQP52eoSHzhluJATvCXrWiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BJ0VWmAH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822RuN7017486
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Sep 2025 09:21:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=c7HfgZitoM7gN1hKYZrNPb5e
	K6Mggu3Yh+vY076Vgao=; b=BJ0VWmAHrIfcOhZsOFvRaHnIYrlN+1THXYb2gXcz
	zVmvmRco1vMvCFwMUkKb4P1aeOYdO0obeif0C18kkQp3+N7wsINNVdosAFYu7uQR
	MaD7NvscDW2masjL9NuCyfXkVf6JVzrSIH9tqd044uxelBnAeMFQaEUKffWFNwNk
	JF1nyNNLLHFi+ZgTcVHH2HiLfI/S/yo9pn4hDx1PxS47QV0aRA9kuSfb5ga8JYvx
	usJvSECzvu3mRXoJHtSNd1JseTsa3xA4dS0BYihkCLOz3xd4ZvBbvvnsh/eCW6uI
	vz7CPq5tj11FSluEQPHykSpfGuYxUmdnstaKc1qc70G85w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48utk8y2qw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 09:21:24 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b345aff439so14757311cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 02:21:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756804883; x=1757409683;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c7HfgZitoM7gN1hKYZrNPb5eK6Mggu3Yh+vY076Vgao=;
        b=SoxcVXxbvDaLrE/dWHpCxl4SEfXWcsLGtRZcj19PapFJunHAbp0wtiJ8O/z21s/nd5
         xPyVBgFg2yiGlgUQzzkOk47LvmAEQQp0pDv4meTRKW/1HxPWthfl/QJr41Cmc77iT7EB
         DTCR5YbkJMMHgNvVoZtSdSdV2Ad+EJKLv84U0Ynli77sDzu8PlkD5bULc2dpcqrgTcBJ
         KbsCWMOYwsmH08ThgIlHQvzFSk/rc2tZzUtsWiefzUnl/eks5IzBV4Hn5gzDHkMY0loM
         AtPYM4ehjy0oKC+OhB7UzhqDE8m1GairdVhrgQVtAuO28+SFZOVPHUuaOGxmHBfosq8H
         Lfug==
X-Forwarded-Encrypted: i=1; AJvYcCVZw3AFCVaVj1p/i9UjJLIHWNlfvX2qQWwOO+JH9E2FBrJXZneOzUB5/dwieyNwcZzIqu9tSppWsiMCwcNS@vger.kernel.org
X-Gm-Message-State: AOJu0YwD62OF90eCAtMNQDkYajVaPxBrHNTbbK2Unvd33/NtYp2Theq7
	R4ny8X/4gbv/klQeFanDhOna8Io+tUMT0B3uj0+lHn673EkJLk+C7HdP16YIvlPehGD9nPrJQ1T
	2UoeuUWv5Ea80Guh+3lAhyc/wsSFLoZw0xsMn9/4u5KkoUOu+pFZoflB8R7WfoCoodiTS
X-Gm-Gg: ASbGnctYE2L9arh91Xlf3e0aQtXwOELVG7M8jH3VcVYgMd5r/UeMQc0VzoXEJmxN340
	zbdeqtxhqvVlaRBC6O0hw33zrxVKryGiX2RoBtVBerm4vBSeGWsJBc0VY8eWQiPGIwt9Ercu3tF
	BeJlWVAiMEugf1oOU+Iyz6gbinYQlEl2TtP69Hhfcw1oh9spvg/Q4JnvVvyDUuiZoeGKnfGfUUJ
	yHoxUzAM8KrvuM+1auNv2tvR9l8pOdfY5sb10kHYcDjNEmnB+RnACKv78GH0VIDXg6T/MscRxyH
	ztZvciWgORsddeyLc9uFtgU/BfTTtN61Qi1kDNv2gtQdA+XoI5f2O0CBOehRbwVrV96cyNMgLd0
	PtbP5TASCAwVwRM2060TQAe7TJgnbyVZS6jmYLePu3MJy+n0O5w/S
X-Received: by 2002:a05:622a:8c9:b0:4b3:e77:90ab with SMTP id d75a77b69052e-4b31dd5f362mr139211601cf.73.1756804882510;
        Tue, 02 Sep 2025 02:21:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQOjKCyF0PTGniEGS7XzhWjEDR5pXTxvrIUjdarmCqjdrVAR3t8O340qmLNTCT1OLhA5b5Mg==
X-Received: by 2002:a05:622a:8c9:b0:4b3:e77:90ab with SMTP id d75a77b69052e-4b31dd5f362mr139211311cf.73.1756804881966;
        Tue, 02 Sep 2025 02:21:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56084b0dd56sm207707e87.85.2025.09.02.02.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 02:21:21 -0700 (PDT)
Date: Tue, 2 Sep 2025 12:21:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srini@kernel.org, linux-arm-msm@vger.kernel.org,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v1 3/3] misc: fastrpc: Add polling mode support for
 fastRPC driver
Message-ID: <hqbazo62hdfwgxoevzkchfddvjpr2ttp7wltpkoooou5anongs@5ncpjec3egjh>
References: <20250901053336.3939595-1-ekansh.gupta@oss.qualcomm.com>
 <20250901053336.3939595-4-ekansh.gupta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250901053336.3939595-4-ekansh.gupta@oss.qualcomm.com>
X-Proofpoint-GUID: 4JG-c37kAY8dflaQxjOUvcMXnxcEV-WO
X-Proofpoint-ORIG-GUID: 4JG-c37kAY8dflaQxjOUvcMXnxcEV-WO
X-Authority-Analysis: v=2.4 cv=ccnSrmDM c=1 sm=1 tr=0 ts=68b6b714 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=oqQymis2muytsmd_M6sA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDA0MiBTYWx0ZWRfX2YspCEuQ0mcg
 sG5a2QSTW+tDJEbJw/QV5WHis22IqSv1iscVIdU+Z3DpL5Esw+Igf/ipyClSvjEg2AyP54qhqME
 0I8cTxzojRJY20u8pXcymSWC/m/zwvpKQsQENp0lY/NYCF9+dAqwEniTZOe79GWeIcEkZr2Z2BS
 0XVwypcRaGRji8wn/2kP0VpPMsA+j5amKhn7mN5kqKtiK+bESbmmFjKCV7uwQrXZnWzdmUvtRlP
 0Uc3ZEro1XNxmYF7Dx6LGywXiuc85VPH3UOWSnotfb3xID1Kjb0wS8L1MFABuK45sZAJ0Z27CVu
 s+6I5zD5UcyVd7zW9WGCenZBQ2V1VBoZOdSfhHtRoxXNoS25sXJOl/sbcf5ZOv4FkCqEz0z24Q5
 fuO2wPl1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300042

On Mon, Sep 01, 2025 at 11:03:36AM +0530, Ekansh Gupta wrote:
> For any remote call to DSP, after sending an invocation message,
> fastRPC driver waits for glink response and during this time the
> CPU can go into low power modes. This adds latency to overall fastrpc
> call as CPU wakeup and scheduling latencies are included.  Adding a

s/Adding/Add/, see Documentation/process/submitting-patches.rst

> polling mode support with which fastRPC driver will poll continuously
> on a memory after sending a message to remote subsystem which will
> eliminate CPU wakeup and scheduling latencies and reduce fastRPC
> overhead.

Describe your design decisions: when it is enabled, why, etc.

> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 121 ++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 114 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 57e118de6e4a..939a3e3d29e2 100644
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

What is this?

>  #define FASTRPC_CTXID_MASK (0xFF00)
>  #define INIT_FILELEN_MAX (2 * 1024 * 1024)
>  #define INIT_FILE_NAMELEN_MAX (128)
> @@ -105,6 +108,20 @@
>  
>  #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
>  
> +/* Poll response number from remote processor for call completion */
> +#define FASTRPC_POLL_RESPONSE (0xdecaf)
> +
> +/* Polling mode timeout limit */
> +#define FASTRPC_POLL_MAX_TIMEOUT_US (10000)
> +
> +/* Response types supported for RPC calls */
> +enum fastrpc_response_flags {
> +	/* normal job completion glink response */
> +	NORMAL_RESPONSE = 0,
> +	/* process updates poll memory instead of glink response */
> +	POLL_MODE = 1,
> +};

bool is_polled;

OR

unsigned long is_polled : 1;

> +
>  struct fastrpc_phy_page {
>  	u64 addr;		/* physical address */
>  	u64 size;		/* size of contiguous region */
> @@ -235,8 +252,14 @@ struct fastrpc_invoke_ctx {
>  	u32 sc;
>  	u64 *fdlist;
>  	u32 *crc;
> +	/* Poll memory that DSP updates */
> +	u32 *poll;
>  	u64 ctxid;
>  	u64 msg_sz;
> +	/* work done status flag */
> +	bool is_work_done;
> +	/* response flags from remote processor */
> +	enum fastrpc_response_flags rsp_flags;
>  	struct kref refcount;
>  	struct list_head node; /* list of ctxs */
>  	struct completion work;
> @@ -891,7 +914,8 @@ static int fastrpc_get_meta_size(struct fastrpc_invoke_ctx *ctx)
>  		sizeof(struct fastrpc_invoke_buf) +
>  		sizeof(struct fastrpc_phy_page)) * ctx->nscalars +
>  		sizeof(u64) * FASTRPC_MAX_FDLIST +
> -		sizeof(u32) * FASTRPC_MAX_CRCLIST;
> +		sizeof(u32) * FASTRPC_MAX_CRCLIST +
> +		sizeof(u32);
>  
>  	return size;
>  }
> @@ -987,6 +1011,8 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
>  	list = fastrpc_invoke_buf_start(rpra, ctx->nscalars);
>  	pages = fastrpc_phy_page_start(list, ctx->nscalars);
>  	ctx->fdlist = (u64 *)(pages + ctx->nscalars);
> +	ctx->crc = (u32 *)(ctx->fdlist + FASTRPC_MAX_FDLIST);

Why?

> +	ctx->poll = (u32 *)(ctx->crc + FASTRPC_MAX_CRCLIST);
>  	args = (uintptr_t)ctx->buf->virt + metalen;
>  	rlen = pkt_size - metalen;
>  	ctx->rpra = rpra;
> @@ -1155,6 +1181,83 @@ static int fastrpc_invoke_send(struct fastrpc_session_ctx *sctx,
>  
>  }
>  
> +static inline u32 fastrpc_poll_op(void *p)
> +{
> +	struct fastrpc_invoke_ctx *ctx = p;
> +
> +	dma_rmb();
> +	return READ_ONCE(*ctx->poll);

Is this enough? Is the write by the DSP side going to invalidate the
cache for this memory location? Think about older platforms which
usually don't have dma-coherent property in the DSP / FastRPC nodes.

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
> +		switch (ctx->rsp_flags) {
> +		case NORMAL_RESPONSE:
> +			err = fastrpc_wait_for_response(ctx, kernel);
> +			if (err || ctx->is_work_done)
> +				return err;
> +			break;
> +		case POLL_MODE:
> +			err = poll_for_remote_response(ctx);
> +			/* If polling timed out, move to normal response mode */
> +			if (err)
> +				ctx->rsp_flags = NORMAL_RESPONSE;
> +			break;
> +		default:

What kind of response type can it be? Have you had checked for the flag
being set, you wouldn't have a false possibility of having another
response type.

> +			err = -EBADR;
> +			dev_dbg(ctx->fl->sctx->dev,
> +				"unsupported response type:0x%x\n", ctx->rsp_flags);
> +			break;
> +		}
> +	} while (!ctx->is_work_done);
> +
> +	return err;
> +}
> +
>  static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
>  				   u32 handle, u32 sc,
>  				   struct fastrpc_invoke_args *args)
> @@ -1190,16 +1293,19 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
>  	if (err)
>  		goto bail;
>  
> -	if (kernel) {
> -		if (!wait_for_completion_timeout(&ctx->work, 10 * HZ))
> -			err = -ETIMEDOUT;
> -	} else {
> -		err = wait_for_completion_interruptible(&ctx->work);
> -	}
> +	if (handle > FASTRPC_MAX_STATIC_HANDLE && fl->pd == USER_PD)
> +		ctx->rsp_flags = POLL_MODE;

This definitely needs to be explained.

>  
> +	err = fastrpc_wait_for_completion(ctx, kernel);
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
> @@ -2462,6 +2568,7 @@ static int fastrpc_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
>  
>  	ctx->retval = rsp->retval;
>  	complete(&ctx->work);
> +	ctx->is_work_done = true;
>  
>  	/*
>  	 * The DMA buffer associated with the context cannot be freed in
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

