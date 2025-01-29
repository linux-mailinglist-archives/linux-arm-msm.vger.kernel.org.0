Return-Path: <linux-arm-msm+bounces-46466-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43563A21774
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 06:42:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 373E9166103
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 05:42:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C65318E050;
	Wed, 29 Jan 2025 05:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eb413bs8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D4C149C4A;
	Wed, 29 Jan 2025 05:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738129350; cv=none; b=QZeF0hHsPCz+1dl5xWp8l5wM2nG4zCa/uLBuFf24QNfGonWcIyRcWIbfCHZJLF0tuWg8HG8TtuSJmzHmX7au6tVk6W90ZIkIxiVmbpk76hgqf6eyvIH+LAm8oR0pqMVLgtgW7jsa2q5x2MrV3eKtCzBQmq9ULYRW3itY7zfrJ1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738129350; c=relaxed/simple;
	bh=RYbE4uvusRKmXfHGHJHcdIDGuN0RjnuUPcOUT8pN4HE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=UWly3IMLWOxk/0hPqxSMwuItWVoPMuLy1SiFOqOnAePgLYLO61AYER5oYpMSO6/SfDFaoag7zmAHraZ2aDLJdTeLr2SKe0j3l992957U2fR9Dz46MmzYYDGQqa0Mui+h9wrZcurWDU9K0d4+PU+75nWXn8phacUSmggSTLdEOCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eb413bs8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50T3e31T002648;
	Wed, 29 Jan 2025 05:42:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/XVTvAicF95qV58n4vDmiTCf6+ZtX5GishoGsIaB3Ic=; b=eb413bs8GeJ+H9Cu
	uCg6bHPCIT2mHjfD1M2/0H511l91YJUEJtAlipflGfhhPtXrNERoKrlumAPhJobg
	yaV1EcecgmJm6XIQ/ST01f7NQJqNfhuMNlaE5+f+nY9jwwbXXaxjjX8/bT7HDyWq
	70uqARN+/ueqFeh3iQbeYecAhC5WxFa1Qr2KP1GDL8hI/ZA95vGcwhX0IauHwhvX
	7SUKkmV20M2cMRjbYC6g2qroSrCeYv9QuuAb0epqg9BQ5eCtOlwd951wUzZ18qc9
	MYEDUm1iHCZ8GyT5ag72MYkNe5+TnH6HgZnVjYW93VSVCY1xbgV25UDup9bkcajb
	Towagw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44f97q0f51-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Jan 2025 05:42:23 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50T5gMIh012623
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Jan 2025 05:42:22 GMT
Received: from [10.204.65.49] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 28 Jan
 2025 21:42:19 -0800
Message-ID: <49295da9-82d4-45a0-a2a4-fdaa6600c70d@quicinc.com>
Date: Wed, 29 Jan 2025 11:12:16 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] misc: fastrpc: Add polling mode support for
 fastRPC driver
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
        <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
        <dri-devel@lists.freedesktop.org>, <arnd@arndb.de>
References: <20250127044239.578540-1-quic_ekangupt@quicinc.com>
 <20250127044239.578540-5-quic_ekangupt@quicinc.com>
 <hgox77a7e6zzriltwhzzciau6u2pmil4y3rl5o2l6zkp4fmlmp@q2dai5fxcvtq>
Content-Language: en-US
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
In-Reply-To: <hgox77a7e6zzriltwhzzciau6u2pmil4y3rl5o2l6zkp4fmlmp@q2dai5fxcvtq>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 1QghBzHwNJR6Q7d-Hv5tNw1FytAsQag-
X-Proofpoint-ORIG-GUID: 1QghBzHwNJR6Q7d-Hv5tNw1FytAsQag-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 clxscore=1015 mlxscore=0 mlxlogscore=999 suspectscore=0
 bulkscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501290045




On 1/29/2025 4:59 AM, Dmitry Baryshkov wrote:
> On Mon, Jan 27, 2025 at 10:12:38AM +0530, Ekansh Gupta wrote:
>> For any remote call to DSP, after sending an invocation message,
>> fastRPC driver waits for glink response and during this time the
>> CPU can go into low power modes. Adding a polling mode support
>> with which fastRPC driver will poll continuously on a memory
>> after sending a message to remote subsystem which will eliminate
>> CPU wakeup and scheduling latencies and reduce fastRPC overhead.
>> With this change, DSP always sends a glink response which will
>> get ignored if polling mode didn't time out.
> Is there a chance to implement actual async I/O protocol with the help
> of the poll() call instead of hiding the polling / wait inside the
> invoke2?

This design is based on the implementation on DSP firmware as of today:
Call flow: https://github.com/quic-ekangupt/fastrpc/blob/invokev2/Docs/invoke_v2.md#5-polling-mode

Can you please give some reference to the async I/O protocol that you've
suggested? I can check if it can be implemented here.

--ekansh

>
>> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
>> ---
>>  drivers/misc/fastrpc.c      | 122 +++++++++++++++++++++++++++++++++---
>>  include/uapi/misc/fastrpc.h |   3 +-
>>  2 files changed, 114 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index cfacee0dded5..257a741af115 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -19,6 +19,7 @@
>>  #include <linux/rpmsg.h>
>>  #include <linux/scatterlist.h>
>>  #include <linux/slab.h>
>> +#include <linux/delay.h>
>>  #include <linux/firmware/qcom/qcom_scm.h>
>>  #include <uapi/misc/fastrpc.h>
>>  #include <linux/of_reserved_mem.h>
>> @@ -38,6 +39,7 @@
>>  #define FASTRPC_CTX_MAX (256)
>>  #define FASTRPC_INIT_HANDLE	1
>>  #define FASTRPC_DSP_UTILITIES_HANDLE	2
>> +#define FASTRPC_MAX_STATIC_HANDLE (20)
>>  #define FASTRPC_CTXID_MASK (0xFF0)
>>  #define INIT_FILELEN_MAX (2 * 1024 * 1024)
>>  #define INIT_FILE_NAMELEN_MAX (128)
>> @@ -106,6 +108,19 @@
>>  
>>  #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
>>  
>> +/* Poll response number from remote processor for call completion */
>> +#define FASTRPC_POLL_RESPONSE (0xdecaf)
>> +/* timeout in us for polling until memory barrier */
>> +#define FASTRPC_POLL_TIME_MEM_UPDATE (500)
>> +
>> +/* Response types supported for RPC calls */
>> +enum fastrpc_response_flags {
>> +	/* normal job completion glink response */
>> +	NORMAL_RESPONSE = 0,
>> +	/* process updates poll memory instead of glink response */
>> +	POLL_MODE = 1,
>> +};
>> +
>>  static const char *domains[FASTRPC_DEV_MAX] = { "adsp", "mdsp",
>>  						"sdsp", "cdsp", "cdsp1" };
>>  struct fastrpc_phy_page {
>> @@ -238,9 +253,16 @@ struct fastrpc_invoke_ctx {
>>  	u32 sc;
>>  	u64 *fdlist;
>>  	u32 *crclist;
>> +	u32 *poll;
>>  	void __user *crc;
>>  	u64 ctxid;
>>  	u64 msg_sz;
>> +	/* Threads poll for specified timeout and fall back to glink wait */
>> +	u64 poll_timeout;
>> +	/* work done status flag */
>> +	bool is_work_done;
>> +	/* response flags from remote processor */
>> +	enum fastrpc_response_flags rsp_flags;
>>  	struct kref refcount;
>>  	struct list_head node; /* list of ctxs */
>>  	struct completion work;
>> @@ -258,6 +280,7 @@ struct fastrpc_invoke_ctx {
>>  struct fastrpc_ctx_args {
>>  	struct fastrpc_invoke_args *args;
>>  	void __user *crc;
>> +	u64 poll_timeout;
>>  };
>>  
>>  struct fastrpc_session_ctx {
>> @@ -619,11 +642,14 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
>>  	fastrpc_channel_ctx_get(cctx);
>>  
>>  	ctx->crc = cargs->crc;
>> +	ctx->poll_timeout = cargs->poll_timeout;
>>  	ctx->sc = sc;
>>  	ctx->retval = -1;
>>  	ctx->pid = current->pid;
>>  	ctx->client_id = user->client_id;
>>  	ctx->cctx = cctx;
>> +	ctx->rsp_flags = NORMAL_RESPONSE;
>> +	ctx->is_work_done = false;
>>  	init_completion(&ctx->work);
>>  	INIT_WORK(&ctx->put_work, fastrpc_context_put_wq);
>>  
>> @@ -882,7 +908,8 @@ static int fastrpc_get_meta_size(struct fastrpc_invoke_ctx *ctx)
>>  		sizeof(struct fastrpc_invoke_buf) +
>>  		sizeof(struct fastrpc_phy_page)) * ctx->nscalars +
>>  		sizeof(u64) * FASTRPC_MAX_FDLIST +
>> -		sizeof(u32) * FASTRPC_MAX_CRCLIST;
>> +		sizeof(u32) * FASTRPC_MAX_CRCLIST +
>> +		sizeof(u32);
>>  
>>  	return size;
>>  }
>> @@ -975,6 +1002,8 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
>>  	pages = fastrpc_phy_page_start(list, ctx->nscalars);
>>  	ctx->fdlist = (u64 *)(pages + ctx->nscalars);
>>  	ctx->crclist = (u32 *)(ctx->fdlist + FASTRPC_MAX_FDLIST);
>> +	ctx->poll = (u32 *)(ctx->crclist + FASTRPC_MAX_CRCLIST);
>> +
>>  	args = (uintptr_t)ctx->buf->virt + metalen;
>>  	rlen = pkt_size - metalen;
>>  	ctx->rpra = rpra;
>> @@ -1145,6 +1174,72 @@ static int fastrpc_invoke_send(struct fastrpc_session_ctx *sctx,
>>  
>>  }
>>  
>> +static int poll_for_remote_response(struct fastrpc_invoke_ctx *ctx, u64 timeout)
>> +{
>> +	int err = -EIO, i, j;
>> +
>> +	/* poll on memory for DSP response. Return failure on timeout */
>> +	for (i = 0, j = 0; i < timeout; i++, j++) {
>> +		if (*ctx->poll == FASTRPC_POLL_RESPONSE) {
>> +			err = 0;
>> +			ctx->is_work_done = true;
>> +			ctx->retval = 0;
>> +			break;
>> +		}
>> +		if (j == FASTRPC_POLL_TIME_MEM_UPDATE) {
>> +			/* make sure that all poll memory writes by DSP are seen by CPU */
>> +			dma_rmb();
>> +			j = 0;
>> +		}
>> +		udelay(1);
>> +	}
>> +	return err;
>> +}
>> +
>> +static inline int fastrpc_wait_for_response(struct fastrpc_invoke_ctx *ctx,
>> +						u32 kernel)
>> +{
>> +	int err = 0;
>> +
>> +	if (kernel) {
>> +		if (!wait_for_completion_timeout(&ctx->work, 10 * HZ))
>> +			err = -ETIMEDOUT;
>> +	} else {
>> +		err = wait_for_completion_interruptible(&ctx->work);
>> +	}
>> +
>> +	return err;
>> +}
>> +
>> +static int fastrpc_wait_for_completion(struct fastrpc_invoke_ctx *ctx,
>> +					u32 kernel)
>> +{
>> +	int err;
>> +
>> +	do {
>> +		switch (ctx->rsp_flags) {
>> +		case NORMAL_RESPONSE:
>> +			err = fastrpc_wait_for_response(ctx, kernel);
>> +			if (err || ctx->is_work_done)
>> +				return err;
>> +			break;
>> +		case POLL_MODE:
>> +			err = poll_for_remote_response(ctx, ctx->poll_timeout);
>> +			/* If polling timed out, move to normal response mode */
>> +			if (err)
>> +				ctx->rsp_flags = NORMAL_RESPONSE;
>> +			break;
>> +		default:
>> +			err = -EBADR;
>> +			dev_dbg(ctx->fl->sctx->dev,
>> +				"unsupported response type:0x%x\n", ctx->rsp_flags);
>> +			break;
>> +		}
>> +	} while (!ctx->is_work_done);
>> +
>> +	return err;
>> +}
>> +
>>  static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
>>  				   u32 handle, u32 sc,
>>  				   struct fastrpc_ctx_args *cargs)
>> @@ -1180,16 +1275,20 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
>>  	if (err)
>>  		goto bail;
>>  
>> -	if (kernel) {
>> -		if (!wait_for_completion_timeout(&ctx->work, 10 * HZ))
>> -			err = -ETIMEDOUT;
>> -	} else {
>> -		err = wait_for_completion_interruptible(&ctx->work);
>> -	}
>> +	if (ctx->poll_timeout != 0 && handle > FASTRPC_MAX_STATIC_HANDLE
>> +	    && fl->pd == USER_PD)
>> +		ctx->rsp_flags = POLL_MODE;
>>  
>> +	err = fastrpc_wait_for_completion(ctx, kernel);
>>  	if (err)
>>  		goto bail;
>>  
>> +	if (!ctx->is_work_done) {
>> +		err = -ETIMEDOUT;
>> +		dev_dbg(fl->sctx->dev, "Invalid workdone state for handle 0x%x, sc 0x%x\n",
>> +			handle, sc);
>> +		goto bail;
>> +	}
>>  	/* make sure that all memory writes by DSP are seen by CPU */
>>  	dma_rmb();
>>  	/* populate all the output buffers with results */
>> @@ -1769,7 +1868,7 @@ static int fastrpc_invokev2(struct fastrpc_user *fl, char __user *argp)
>>  		return -EFAULT;
>>  
>>  	/* Check if all reserved fields are zero */
>> -	for (i = 0; i < 16; i++) {
>> +	for (i = 0; i < 14; i++) {
>>  		if (inv2.reserved[i] != 0)
>>  			return -EINVAL;
>>  	}
>> @@ -1779,6 +1878,7 @@ static int fastrpc_invokev2(struct fastrpc_user *fl, char __user *argp)
>>  		return -ENOMEM;
>>  
>>  	cargs->crc = (void __user *)(uintptr_t)inv2.crc;
>> +	cargs->poll_timeout = inv2.poll_timeout;
>>  
>>  	err = fastrpc_remote_invoke(fl, &inv2.inv, cargs);
>>  	kfree(cargs);
>> @@ -2581,12 +2681,14 @@ static int fastrpc_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
>>  	ctx = idr_find(&cctx->ctx_idr, ctxid);
>>  	spin_unlock_irqrestore(&cctx->lock, flags);
>>  
>> +	/* Ignore this failure as context returned will be NULL for polling mode */
>>  	if (!ctx) {
>> -		dev_err(&rpdev->dev, "No context ID matches response\n");
>> -		return -ENOENT;
>> +		dev_dbg(&rpdev->dev, "No context ID matches response\n");
>> +		return 0;
>>  	}
>>  
>>  	ctx->retval = rsp->retval;
>> +	ctx->is_work_done = true;
>>  	complete(&ctx->work);
>>  
>>  	/*
>> diff --git a/include/uapi/misc/fastrpc.h b/include/uapi/misc/fastrpc.h
>> index 406b80555d41..1920c537bbbf 100644
>> --- a/include/uapi/misc/fastrpc.h
>> +++ b/include/uapi/misc/fastrpc.h
>> @@ -84,7 +84,8 @@ struct fastrpc_invoke {
>>  struct fastrpc_invoke_v2 {
>>  	struct fastrpc_invoke inv;
>>  	__u64 crc;
>> -	__u32 reserved[16];
>> +	__u64 poll_timeout;
>> +	__u32 reserved[14];
>>  };
>>  
>>  struct fastrpc_init_create {
>> -- 
>> 2.34.1
>>


