Return-Path: <linux-arm-msm+bounces-54859-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E94CEA951C0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Apr 2025 15:38:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1DD351716B8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Apr 2025 13:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C5E426461D;
	Mon, 21 Apr 2025 13:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MylvfHXm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C79B640;
	Mon, 21 Apr 2025 13:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745242701; cv=none; b=fJF6YNMbNtevXdK3G5ErKSrTk9a0+WvoyJOnOg6pqnfzfKOy12WQUKmBdewp0FqWcPnziZGFZ84izTH0SdrRc2/ZI9O/5ors0X7WvzF2FyJ1qgbG4DF2cB/qKYwBTWCL91G8bVdVDwqO4BYdmp7kIgbA7Af/AacCTA7ATgdjGeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745242701; c=relaxed/simple;
	bh=iy6v3UJxGVGSp/+T9rww+LKY+DpQXyKrdeUZJQA27us=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MFL13S1a1Vo4wBbWcWHwCBBge+WbCkU2cOfZRhvII+zG/zXaVEBxKUv8IGYHnf2zXBiauraHuM7jFCbTA1xxxMl2kqn0ckR5F0SDyibvOkKMAQM690zN0S/ipPfD+yy+nnFQHv8nzuJAKTPGyoGMJBwYoQdXAzcV99pw2Cj67HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MylvfHXm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C3B8C4CEE4;
	Mon, 21 Apr 2025 13:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745242699;
	bh=iy6v3UJxGVGSp/+T9rww+LKY+DpQXyKrdeUZJQA27us=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MylvfHXmXlfa4cuan1wrlQhNZf9l9ETa7o1uLAEWSZ/OhItOC0spYNmNEnkIzeu/A
	 hGEBYJjKEffMgJci/jczUwi1fWQCT29+RxRfwS/A+U3Sc/TV3TAGqGBOIjbIddpLYX
	 OpgyVxrpS69o7iBBd93jtNX5BtBLZ6bwXyEWDQQfGxjz1pCxWJoM4HzVeWf1CajpXH
	 WmvSaPiAkqs6Otfz507GlMg161hMFK8CCpzTqjR03LNn8+Kj5AqsaCh6cszksyXXEQ
	 7/5TpyGlIbRayqLYZJ/glmIi2QCulbF9RjWhV8f4qgg95SBxYzrUDfM/Qbgk9iHTca
	 ni3qddfBfjn4g==
Date: Mon, 21 Apr 2025 19:08:11 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Apurupa Pattapu <quic_apurupa@quicinc.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 04/11] tee: add TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF
Message-ID: <aAZKQyslOSs-A3Jv@sumit-X1>
References: <20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-0-7f457073282d@oss.qualcomm.com>
 <20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-4-7f457073282d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-4-7f457073282d@oss.qualcomm.com>

On Thu, Mar 27, 2025 at 07:47:26PM -0700, Amirreza Zarrabi wrote:
> The TEE subsystem allows session-based access to trusted services,
> requiring a session to be established to receive a service. This
> is not suitable for an environment that represents services as objects.
> An object supports various operations that a client can invoke,
> potentially generating a result or a new object that can be invoked
> independently of the original object.
> 
> Add TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT/OUTPUT/INOUT to represent an
> object. Objects may reside in either TEE or userspace. To invoke an
> object in TEE, introduce a new ioctl. Use the existing SUPPL_RECV and
> SUPPL_SEND to invoke an object in userspace.
> 
> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> ---
>  drivers/tee/tee_core.c   | 85 ++++++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/tee_core.h |  4 +++
>  include/linux/tee_drv.h  |  6 ++++
>  include/uapi/linux/tee.h | 41 +++++++++++++++++++----
>  4 files changed, 130 insertions(+), 6 deletions(-)

Minor nits from me below, otherwise this looks reasonable new IOCTL
interface to me. FWIW:

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

> 
> diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
> index bc862a11d437..d39205128b09 100644
> --- a/drivers/tee/tee_core.c
> +++ b/drivers/tee/tee_core.c
> @@ -397,6 +397,7 @@ static int params_from_user(struct tee_context *ctx, struct tee_param *params,
>  		switch (ip.attr & TEE_IOCTL_PARAM_ATTR_TYPE_MASK) {
>  		case TEE_IOCTL_PARAM_ATTR_TYPE_NONE:
>  		case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT:
> +		case TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_OUTPUT:
>  			break;
>  		case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT:
>  		case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT:
> @@ -415,6 +416,11 @@ static int params_from_user(struct tee_context *ctx, struct tee_param *params,
>  				return -EFAULT;
>  
>  			break;
> +		case TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT:
> +		case TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INOUT:
> +			params[n].u.objref.id = ip.a;
> +			params[n].u.objref.flags = ip.b;
> +			break;
>  		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
>  		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
>  		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
> @@ -488,6 +494,12 @@ static int params_to_user(struct tee_ioctl_param __user *uparams,
>  			if (put_user((u64)p->u.ubuf.size, &up->b))
>  				return -EFAULT;
>  			break;
> +		case TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_OUTPUT:
> +		case TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INOUT:
> +			if (put_user(p->u.objref.id, &up->a) ||
> +			    put_user(p->u.objref.flags, &up->b))
> +				return -EFAULT;
> +			break;
>  		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
>  		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
>  			if (put_user((u64)p->u.memref.size, &up->b))
> @@ -640,6 +652,66 @@ static int tee_ioctl_invoke(struct tee_context *ctx,
>  	return rc;
>  }
>  
> +static int tee_ioctl_object_invoke(struct tee_context *ctx,
> +				   struct tee_ioctl_buf_data __user *ubuf)
> +{
> +	int rc;
> +	size_t n;
> +	struct tee_ioctl_buf_data buf;
> +	struct tee_ioctl_object_invoke_arg __user *uarg;
> +	struct tee_ioctl_object_invoke_arg arg;
> +	struct tee_ioctl_param __user *uparams = NULL;
> +	struct tee_param *params = NULL;
> +
> +	if (!ctx->teedev->desc->ops->object_invoke_func)
> +		return -EINVAL;
> +
> +	if (copy_from_user(&buf, ubuf, sizeof(buf)))
> +		return -EFAULT;
> +
> +	if (buf.buf_len > TEE_MAX_ARG_SIZE ||
> +	    buf.buf_len < sizeof(struct tee_ioctl_object_invoke_arg))
> +		return -EINVAL;
> +
> +	uarg = u64_to_user_ptr(buf.buf_ptr);
> +	if (copy_from_user(&arg, uarg, sizeof(arg)))
> +		return -EFAULT;
> +
> +	if (sizeof(arg) + TEE_IOCTL_PARAM_SIZE(arg.num_params) != buf.buf_len)
> +		return -EINVAL;
> +
> +	if (arg.num_params) {
> +		params = kcalloc(arg.num_params, sizeof(struct tee_param),
> +				 GFP_KERNEL);
> +		if (!params)
> +			return -ENOMEM;
> +		uparams = uarg->params;
> +		rc = params_from_user(ctx, params, arg.num_params, uparams);
> +		if (rc)
> +			goto out;
> +	}
> +
> +	rc = ctx->teedev->desc->ops->object_invoke_func(ctx, &arg, params);
> +	if (rc)
> +		goto out;
> +
> +	if (put_user(arg.ret, &uarg->ret)) {
> +		rc = -EFAULT;
> +		goto out;
> +	}
> +	rc = params_to_user(uparams, arg.num_params, params);
> +out:
> +	if (params) {
> +		/* Decrease ref count for all valid shared memory pointers */
> +		for (n = 0; n < arg.num_params; n++)
> +			if (tee_param_is_memref(params + n) &&
> +			    params[n].u.memref.shm)
> +				tee_shm_put(params[n].u.memref.shm);
> +		kfree(params);
> +	}
> +	return rc;
> +}
> +
>  static int tee_ioctl_cancel(struct tee_context *ctx,
>  			    struct tee_ioctl_cancel_arg __user *uarg)
>  {
> @@ -695,6 +767,12 @@ static int params_to_supp(struct tee_context *ctx,
>  			ip.b = p->u.ubuf.size;
>  			ip.c = 0;
>  			break;
> +		case TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT:
> +		case TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INOUT:
> +			ip.a = p->u.objref.id;
> +			ip.b = p->u.objref.flags;
> +			ip.c = 0;
> +			break;
>  		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
>  		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
>  		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
> @@ -807,6 +885,11 @@ static int params_from_supp(struct tee_param *params, size_t num_params,
>  				return -EFAULT;
>  
>  			break;
> +		case TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_OUTPUT:
> +		case TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INOUT:
> +			p->u.objref.id = ip.a;
> +			p->u.objref.flags = ip.b;
> +			break;
>  		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
>  		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
>  			/*
> @@ -887,6 +970,8 @@ static long tee_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>  		return tee_ioctl_open_session(ctx, uarg);
>  	case TEE_IOC_INVOKE:
>  		return tee_ioctl_invoke(ctx, uarg);
> +	case TEE_IOC_OBJECT_INVOKE:
> +		return tee_ioctl_object_invoke(ctx, uarg);
>  	case TEE_IOC_CANCEL:
>  		return tee_ioctl_cancel(ctx, uarg);
>  	case TEE_IOC_CLOSE_SESSION:
> diff --git a/include/linux/tee_core.h b/include/linux/tee_core.h
> index 8a4c9e30b652..26b8795cb678 100644
> --- a/include/linux/tee_core.h
> +++ b/include/linux/tee_core.h
> @@ -72,6 +72,7 @@ struct tee_device {
>   * @close_session:	close a session
>   * @system_session:	declare session as a system session
>   * @invoke_func:	invoke a trusted function
> + * @object_invoke_func:	invoke a TEE object
>   * @cancel_req:		request cancel of an ongoing invoke or open
>   * @supp_recv:		called for supplicant to get a command
>   * @supp_send:		called for supplicant to send a response
> @@ -97,6 +98,9 @@ struct tee_driver_ops {
>  	int (*invoke_func)(struct tee_context *ctx,
>  			   struct tee_ioctl_invoke_arg *arg,
>  			   struct tee_param *param);
> +	int (*object_invoke_func)(struct tee_context *ctx,
> +				  struct tee_ioctl_object_invoke_arg *arg,
> +				  struct tee_param *param);
>  	int (*cancel_req)(struct tee_context *ctx, u32 cancel_id, u32 session);
>  	int (*supp_recv)(struct tee_context *ctx, u32 *func, u32 *num_params,
>  			 struct tee_param *param);
> diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
> index d773f91c6bdd..7cc57e84db95 100644
> --- a/include/linux/tee_drv.h
> +++ b/include/linux/tee_drv.h
> @@ -87,6 +87,11 @@ struct tee_param_ubuf {
>  	size_t size;
>  };
>  
> +struct tee_param_objref {
> +	u64 id;
> +	u64 flags;
> +};
> +
>  struct tee_param_value {
>  	u64 a;
>  	u64 b;
> @@ -97,6 +102,7 @@ struct tee_param {
>  	u64 attr;
>  	union {
>  		struct tee_param_memref memref;
> +		struct tee_param_objref objref;
>  		struct tee_param_ubuf ubuf;
>  		struct tee_param_value value;
>  	} u;
> diff --git a/include/uapi/linux/tee.h b/include/uapi/linux/tee.h
> index 3e9b1ec5dfde..8642ce7e4772 100644
> --- a/include/uapi/linux/tee.h
> +++ b/include/uapi/linux/tee.h
> @@ -48,8 +48,10 @@
>  #define TEE_GEN_CAP_PRIVILEGED	(1 << 1)/* Privileged device (for supplicant) */
>  #define TEE_GEN_CAP_REG_MEM	(1 << 2)/* Supports registering shared memory */
>  #define TEE_GEN_CAP_MEMREF_NULL	(1 << 3)/* NULL MemRef support */
> +#define TEE_GEN_CAP_OBJREF	(1 << 4)/* Supports generic object reference */
>  
> -#define TEE_MEMREF_NULL		(__u64)(-1) /* NULL MemRef Buffer */
> +#define TEE_MEMREF_NULL		((__u64)(-1)) /* NULL MemRef Buffer */
> +#define TEE_OBJREF_NULL		((__u64)(-1)) /* NULL ObjRef Object */
>  
>  /*
>   * TEE Implementation ID
> @@ -158,6 +160,13 @@ struct tee_ioctl_buf_data {
>  #define TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT	9
>  #define TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT	10	/* input and output */
>  
> +/*
> + * These defines object reference parameters.
> + */
> +#define TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT	11
> +#define TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_OUTPUT	12
> +#define TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INOUT	13
> +
>  /*
>   * Mask for the type part of the attribute, leaves room for more types
>   */
> @@ -195,15 +204,16 @@ struct tee_ioctl_buf_data {
>   * @attr: attributes
>   * @a: if a memref, offset into the shared memory object,
>   *     else if a ubuf, address of the user buffer,
> - *     else a value parameter
> - * @b: if a memref or ubuf, size of the buffer, else a value parameter
> + *     else if an objref, object identifier, else a value parameter
> + * @b: if a memref or ubuf, size of the buffer,
> + *     else if objref, flags for the object, else a value parameter
>   * @c: if a memref, shared memory identifier, else a value parameter
>   *
>   * @attr & TEE_PARAM_ATTR_TYPE_MASK indicates if memref, ubuf, or value is
>   * used in the union. TEE_PARAM_ATTR_TYPE_VALUE_* indicates value,
> - * TEE_PARAM_ATTR_TYPE_MEMREF_* indicates memref, and TEE_PARAM_ATTR_TYPE_UBUF_*
> - * indicates ubuf. TEE_PARAM_ATTR_TYPE_NONE indicates that none of the members
> - * are used.
> + * TEE_PARAM_ATTR_TYPE_MEMREF_* indicates memref, TEE_PARAM_ATTR_TYPE_UBUF_*
> + * indicates ubuf, and TEE_PARAM_ATTR_TYPE_OBJREF_* indicates objref.
> + * TEE_PARAM_ATTR_TYPE_NONE indicates that none of the members are used.
>   *
>   * Shared memory is allocated with TEE_IOC_SHM_ALLOC which returns an
>   * identifier representing the shared memory object. A memref can reference
> @@ -411,4 +421,23 @@ struct tee_ioctl_shm_register_data {
>   * munmap(): unmaps previously shared memory
>   */
>  
> +/**
> + * struct tee_ioctl_invoke_func_arg - Invokes an object in a Trusted Application
> + * @object:	[in] Object id
> + * @op:		[in] Object operation, specific to the object
> + * @ret:	[out] return value
> + * @num_params	[in] number of parameters following this struct
> + */
> +struct tee_ioctl_object_invoke_arg {
> +	__u64 object;

nit: I would rather rename it as: s/object/id/

> +	__u32 op;
> +	__u32 ret;

nit: do you think ret_origin will add value here? It is useful to know
from which stack layer the error originated from.

-Sumit

> +	__u32 num_params;
> +	/* num_params tells the actual number of element in params */
> +	struct tee_ioctl_param params[];
> +};
> +
> +#define TEE_IOC_OBJECT_INVOKE	_IOR(TEE_IOC_MAGIC, TEE_IOC_BASE + 10, \
> +				     struct tee_ioctl_buf_data)
> +
>  #endif /*__TEE_H*/
> 
> -- 
> 2.34.1
> 
> 

