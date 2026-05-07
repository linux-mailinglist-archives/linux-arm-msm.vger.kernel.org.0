Return-Path: <linux-arm-msm+bounces-106324-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6E2kLxZe/Gm7OwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106324-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 11:40:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6290A4E61F2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 11:40:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 14F4C30A8AAE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 09:34:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66B953C552E;
	Thu,  7 May 2026 09:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r2ERV3XS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41DBD3C4548;
	Thu,  7 May 2026 09:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778146465; cv=none; b=lRnDgRQXI0Yp3G48wQTmIS0M094nYSpPU3pYCcFC3zqDbSDCzr0kZkqPC09gcJNmHSHlp3Yon9WYKo+xnEuqi3cMH5yMp2xH8vwVdkY/Nd6TAkhS5qII9j9kSrQC6sQ+SLfLsKrzFcDvJ1YM50ioH7aDHHNoabuJv58BSh7YBqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778146465; c=relaxed/simple;
	bh=mdh3zUclVbfCNHfZBnC35q4OGRDg1RcFOGlBrC9iSbI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CWTJAGDxIZngUDj/2Tl8ikbL3rFJNS1I7KbbRTZ7/IviU6SnyInaIuMRrswFR3nskexoAegqXEWJbv4RUAf2n306e9sfAwpbKiIVOJsJgIpGLLe31ARnwnyffZvYb+/ypb448H68UyDZKME/3SPxvuGDVl17lcVvdGq8xIvlvyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r2ERV3XS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 916BCC2BCB2;
	Thu,  7 May 2026 09:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778146464;
	bh=mdh3zUclVbfCNHfZBnC35q4OGRDg1RcFOGlBrC9iSbI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=r2ERV3XSjWnmQcxxP8Hcx8z7Ck/NnxhiKCTa4vuIv/Ll2Za+sefHQAZxOJW3D6WMG
	 Je5CRThmnsp/hY8j6/5tcheHSvvbfSMRtTlZ6rmx6rw6oL7/3G7CNJmUOKU16/AqBO
	 mTvV/aqYRFaftlyCo0LBbNKy6cvJAYhKeQG83Md5JISNVqFDN4n5ghDNgsh1wWQrH6
	 okiYumb+LQzgqoaJnTi30RTOPolYqnSvO2wg8OkHjFAV3g6GOaw0nI2o1E9Q+NNKCl
	 9Ea2889VDjW9+D/0MwQKPgah9fInTYXj1DvCDPeOax36Zjv4/WvEI78mBM+b8iId3U
	 Yl6U3a8yyTBSQ==
Message-ID: <26a85b0e-6077-4b77-b0e5-d04b2b3e11d1@kernel.org>
Date: Thu, 7 May 2026 09:34:21 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 4/4] misc: fastrpc: Add polling mode support for
 fastRPC driver
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, srini@kernel.org,
 linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de,
 dmitry.baryshkov@oss.qualcomm.com, ltuikov89@gmail.com,
 konrad.dybcio@oss.qualcomm.com, andersson@kernel.org
References: <20260424095903.1622565-1-ekansh.gupta@oss.qualcomm.com>
 <20260424095903.1622565-5-ekansh.gupta@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <20260424095903.1622565-5-ekansh.gupta@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 6290A4E61F2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106324-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,quicinc.com,vger.kernel.org,lists.freedesktop.org,arndb.de,oss.qualcomm.com,gmail.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srini@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action



On 4/24/26 9:59 AM, Ekansh Gupta wrote:
> For any remote call to DSP, after sending an invocation message,
> fastRPC driver waits for glink response and during this time the
> CPU can go into low power modes. This adds latency to overall fastrpc
> call as CPU wakeup and scheduling latencies are included. Add polling
> mode support with which fastRPC driver will poll continuously on a
> memory after sending a message to remote subsystem which will eliminate
> CPU wakeup and scheduling latencies and reduce fastRPC overhead. In case
> poll timeout happens, the call will fallback to normal RPC mode.  Poll
> mode can be enabled by user by using FASTRPC_IOCTL_SET_OPTION ioctl
> request with FASTRPC_POLL_MODE request id.
> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c      | 155 ++++++++++++++++++++++++++++++++++--
>  include/uapi/misc/fastrpc.h |  25 ++++++
>  2 files changed, 173 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index c4a3547a5c7f..b24845c7f016 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -24,6 +24,8 @@
>  #include <linux/of_reserved_mem.h>
>  #include <linux/bits.h>
>  #include <linux/bitops.h>
> +#include <linux/compiler.h>
> +#include <linux/iopoll.h>
>  
>  #define ADSP_DOMAIN_ID (0)
>  #define MDSP_DOMAIN_ID (1)
> @@ -38,6 +40,12 @@
>  #define FASTRPC_CTX_MAX (256)
>  #define FASTRPC_INIT_HANDLE	1
>  #define FASTRPC_DSP_UTILITIES_HANDLE	2
> +/*
> + * Maximum handle value for static handles.
> + * Static handles are pre-defined, fixed numeric values statically assigned
> + * in the IDL file or FastRPC framework.
> + */
> +#define FASTRPC_MAX_STATIC_HANDLE (20)
>  #define FASTRPC_CTXID_MASK GENMASK(15, 8)
>  #define INIT_FILELEN_MAX (2 * 1024 * 1024)
>  #define INIT_FILE_NAMELEN_MAX (128)
> @@ -106,6 +114,12 @@
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
>  	dma_addr_t addr;	/* dma address */
>  	u64 size;		/* size of contiguous region */
> @@ -236,8 +250,14 @@ struct fastrpc_invoke_ctx {
>  	u32 sc;
>  	u64 *fdlist;
>  	u32 *crc;
> +	/* Poll memory that DSP updates */
> +	u32 *poll_addr;
>  	u64 ctxid;
>  	u64 msg_sz;
> +	/* work done status flag */
> +	bool is_work_done;
> +	/* process updates poll memory instead of glink response */
> +	bool is_polled;
>  	struct kref refcount;
>  	struct list_head node; /* list of ctxs */
>  	struct completion work;
> @@ -263,6 +283,7 @@ struct fastrpc_soc_data {
>  	u32 sid_pos;
>  	u32 dma_addr_bits_cdsp;
>  	u32 dma_addr_bits_default;
> +	bool poll_mode_supported;
>  };
>  
>  struct fastrpc_channel_ctx {
> @@ -285,6 +306,7 @@ struct fastrpc_channel_ctx {
>  	struct list_head invoke_interrupted_mmaps;
>  	bool secure;
>  	bool unsigned_support;
> +	bool poll_mode_supported;
>  	u64 dma_mask;
>  	const struct fastrpc_soc_data *soc_data;
>  };
> @@ -308,6 +330,8 @@ struct fastrpc_user {
>  	int client_id;
>  	int pd;
>  	bool is_secure_dev;
> +	/* Flags poll mode state */
> +	bool poll_mode;
>  	/* Lock for lists */
>  	spinlock_t lock;
>  	/* lock for allocations */
> @@ -923,7 +947,8 @@ static int fastrpc_get_meta_size(struct fastrpc_invoke_ctx *ctx)
>  		sizeof(struct fastrpc_invoke_buf) +
>  		sizeof(struct fastrpc_phy_page)) * ctx->nscalars +
>  		sizeof(u64) * FASTRPC_MAX_FDLIST +
> -		sizeof(u32) * FASTRPC_MAX_CRCLIST;
> +		sizeof(u32) * FASTRPC_MAX_CRCLIST +
> +		sizeof(u32);
>  
>  	return size;
>  }
> @@ -1019,6 +1044,9 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
>  	list = fastrpc_invoke_buf_start(rpra, ctx->nscalars);
>  	pages = fastrpc_phy_page_start(list, ctx->nscalars);
>  	ctx->fdlist = (u64 *)(pages + ctx->nscalars);
> +	ctx->poll_addr = (u32 *)((uintptr_t)ctx->fdlist + sizeof(u64) * FASTRPC_MAX_FDLIST +
> +			     sizeof(u32) * FASTRPC_MAX_CRCLIST);
> +
>  	args = (uintptr_t)ctx->buf->virt + metalen;
>  	rlen = pkt_size - metalen;
>  	ctx->rpra = rpra;
> @@ -1188,6 +1216,61 @@ static int fastrpc_invoke_send(struct fastrpc_session_ctx *sctx,
>  
>  }
>  
> +static int poll_for_remote_response(struct fastrpc_invoke_ctx *ctx)
> +{
> +	u32 val;
> +	int ret;
> +
> +	/*
> +	 * Poll until DSP writes FASTRPC_POLL_RESPONSE into *ctx->poll_addr
> +	 * or until another path marks the work done.
> +	 */
> +	ret = readl_poll_timeout_atomic(ctx->poll_addr, val,
ctx->poll_addr is not an io address, how are you making sure that
compiler does not optimize this?

> +					(val == FASTRPC_POLL_RESPONSE) || ctx->is_work_done, 1,
> +					FASTRPC_POLL_MAX_TIMEOUT_US);
> +
> +	if (!ret && val == FASTRPC_POLL_RESPONSE) {
> +		ctx->is_work_done = true;

THis will race with dsp callback. Can we


> +		ctx->retval = 0;
Why are we forcing the retrun value here, does this mean DSP POLL
RESPONSE is success?

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
> +	if (ctx->is_polled) {
> +		err = poll_for_remote_response(ctx);
> +		if (!err)
> +			return 0;
> +		/* If polling timed out or failed, move to normal response mode */
> +		ctx->is_polled = false;
> +	}
> +
> +	return fastrpc_wait_for_response(ctx, kernel);
> +}
> +
>  static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
>  				   u32 handle, u32 sc,
>  				   struct fastrpc_invoke_args *args)
> @@ -1223,13 +1306,14 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
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
> +	if (handle > FASTRPC_MAX_STATIC_HANDLE && fl->pd == USER_PD && fl->poll_mode)
> +		ctx->is_polled = true;
>  
> +	err = fastrpc_wait_for_completion(ctx, kernel);
>  	if (err)
>  		goto bail;
>  
> @@ -1813,6 +1897,33 @@ static int fastrpc_get_info_from_kernel(struct fastrpc_ioctl_capability *cap,
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
> +	if (opt.request_id != FASTRPC_POLL_MODE)
> +		return -EINVAL;
> +
> +	if (opt.value) {
the possible values are either 0 or 1  here, so this does not match what
is in UAPI . Please define these values rather than wild card matching.


> +		if (!fl->cctx->poll_mode_supported)
> +			return -EOPNOTSUPP;
This should be the first check in this function.

> +		fl->poll_mode = true;
> +	} else {
> +		fl->poll_mode = false;
eventhough poll_mode_supported is not supported you are giving user
positive feedback of setting it to off, is this what you wanted here?

> +	}
> +
> +	return 0;
> +}
> +
>  static int fastrpc_get_dsp_info(struct fastrpc_user *fl, char __user *argp)
>  {
>  	struct fastrpc_ioctl_capability cap = {0};
> @@ -2168,6 +2279,9 @@ static long fastrpc_device_ioctl(struct file *file, unsigned int cmd,
>  	case FASTRPC_IOCTL_MEM_UNMAP:
>  		err = fastrpc_req_mem_unmap(fl, argp);
>  		break;
> +	case FASTRPC_IOCTL_SET_OPTION:
> +		err = fastrpc_set_option(fl, argp);
> +		break;
>  	case FASTRPC_IOCTL_GET_DSP_INFO:
>  		err = fastrpc_get_dsp_info(fl, argp);
>  		break;
> @@ -2323,6 +2437,7 @@ static const struct fastrpc_soc_data kaanapali_soc_data = {
>  	.sid_pos = 56,
>  	.dma_addr_bits_cdsp = 34,
>  	.dma_addr_bits_default = 32,
> +	.poll_mode_supported = true,
>  };
>  
>  static const struct fastrpc_soc_data default_soc_data = {
> @@ -2331,6 +2446,29 @@ static const struct fastrpc_soc_data default_soc_data = {
>  	.dma_addr_bits_default = 32,
>  };
>  
> +/*
> + * Exception list for older platforms that use default_soc_data but whose
> + * DSP firmware supports FastRPC polling mode.
> + *
> + * NOTE: This list is intentionally closed.
> + * Do NOT add new platforms here. New SoCs must advertise polling mode
> + * support via their soc_data.
> + */
> +
> +static const struct of_device_id fastrpc_poll_supported_machines[] __maybe_unused = {
> +	{ .compatible = "qcom,milos" },
> +	{ .compatible = "qcom,qcs8300" },
> +	{ .compatible = "qcom,sa8775p" },
> +	{ .compatible = "qcom,sar2130p" },
> +	{ .compatible = "qcom,sm8450" },
> +	{ .compatible = "qcom,sm8550" },
> +	{ .compatible = "qcom,sm8650" },
> +	{ .compatible = "qcom,sm8750" },
> +	{ .compatible = "qcom,x1e80100" },
> +	{ .compatible = "qcom,x1p42100" },
> +	{},
> +};
> +
>  static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  {
>  	struct device *rdev = &rpdev->dev;
> @@ -2397,6 +2535,8 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  	secure_dsp = !(of_property_read_bool(rdev->of_node, "qcom,non-secure-domain"));
>  	data->secure = secure_dsp;
>  	data->soc_data = soc_data;
> +	data->poll_mode_supported = soc_data->poll_mode_supported ||
> +		of_machine_get_match(fastrpc_poll_supported_machines);
>  
>  	switch (domain_id) {
>  	case ADSP_DOMAIN_ID:
> @@ -2521,6 +2661,7 @@ static int fastrpc_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
>  	}
>  
>  	ctx->retval = rsp->retval;
> +	ctx->is_work_done = true;
>  	complete(&ctx->work);
>  
>  	/*
> diff --git a/include/uapi/misc/fastrpc.h b/include/uapi/misc/fastrpc.h
> index c6e2925f47e6..63346e27d5e9 100644
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
> @@ -67,6 +68,24 @@ enum fastrpc_proc_attr {
>  /* Fastrpc attribute for memory protection of buffers */
>  #define FASTRPC_ATTR_SECUREMAP	(1)
>  
> +/**
> + * FASTRPC_POLL_MODE - Enable/disable poll mode for FastRPC invocations
> + *
> + * Poll mode is an optimization that allows the CPU to poll shared memory
> + * for completion instead of waiting for an interrupt-based response.
> + * This reduces latency for fast-completing operations.
> + *
> + * Restrictions:
> + * - Only supported for USER_PD (User Protection Domain)
> + * - Only applies to dynamic modules (handle > 20)
> + * - Static modules always use interrupt-based completion
> + *
> + * Values:
> + * - 0: Disable poll mode (use interrupt-based completion)
> + * - 1: Enable poll mode (poll shared memory for completion)
> + */
> +#define FASTRPC_POLL_MODE	(1)
> +
>  struct fastrpc_invoke_args {
>  	__u64 ptr;
>  	__u64 length;
> @@ -133,6 +152,12 @@ struct fastrpc_mem_unmap {
>  	__s32 reserved[5];
>  };
>  
> +struct fastrpc_ioctl_set_option {
> +	__u32 request_id;	/* Request type (e.g., FASTRPC_POLL_MODE) */
> +	__u32 value;	/* Request-specific value */
> +	__s32 reserved[6];
> +};
> +
>  struct fastrpc_ioctl_capability {
>  	__u32 unused; /* deprecated, ignored by the kernel */
>  	__u32 attribute_id;


