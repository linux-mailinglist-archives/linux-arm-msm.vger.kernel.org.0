Return-Path: <linux-arm-msm+bounces-48192-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 82DADA3802A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 11:30:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 188D73B3483
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 10:28:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DD2C21767C;
	Mon, 17 Feb 2025 10:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dvFSH2wB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D54217652
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 10:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739788102; cv=none; b=jQRU7C7fZBMGHxgHBZRH3eyr4smIwdkophn4texPRMCOjdvxLNGD2654dsr+IpxqmzspLyDwp9ELXuu9GpCGLEpmvCNaS0dx05l/GjP2Hxpn/8t+rkDIi+Yt3i5bRct0aYMFy0TPK2+Dha6hQEqbN9MreuMsbDHr6uEi+zaxHFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739788102; c=relaxed/simple;
	bh=l/VNLWskysYtXV8CMrR63if9pa5Zk/FbgUL2cKr4nig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V9lXzHxvrGCF6rsuX6fSH9dxi6GzwytarIO2S3JgSgZx8S/dMrVzU3/Hzi7Z2mofGmS/Btm3Or4wYTL5oUvqK0yDBPfEpQa6FPySody1HhMEDwhRUuaWVUoVDm5CGiRB+qCnjnuvdUbF7OMmbBOfj2kRp6uQ0/4gzFLO9AMzMTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dvFSH2wB; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ab744d5e567so779987866b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 02:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739788098; x=1740392898; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8eyngJ7nkEPHmdDriI8ss9BNKTlQzJe9o6ktClmVBmM=;
        b=dvFSH2wB6DTom+bwwRFkJQsqygHE8hXB4bXCBSVw7SQusOd8fvLFHeV8ql8oACtFlY
         +b1OkaLAbatbz11XnImqxF/QgE1GOuolJmV2nsGx0U5mHoT9mZu2NTZmScr1SytbMrl2
         Eo0NXfj8aJ1zw4PHL5keb/ad43UoWkGp00dDUiI3TEPBVRZNl0DsoN+S4Wg6A09EM/8Y
         /5VrJ3QQ1kVnTUlARwJ1dzLonA45K9QmClFWt/0YdJqvMUOjdbBU1Y14+wb090rq37QX
         vjtDGZ+V/vyR3D8hMQ3v6Rn7SgVQHRwTC7tlETii+QlX7wR+cehnj4srOQitEehTT0Br
         Zl7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739788098; x=1740392898;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8eyngJ7nkEPHmdDriI8ss9BNKTlQzJe9o6ktClmVBmM=;
        b=BNxSqTBL4Itdm+O5eVrK60SdMTo0NO+ueeWzdQWuDYQ8KHtJd9Nf61sk7UEUR7ThgX
         /A86cFhlxdmbCDRf9yp9peRLbHs96qtG9cXx1oE91NM0d4HEcqFVZwOrTp5Df2L+QCuY
         To6KVwAvaU5stqhh6XuhpeBd2FBkBmgDWr1Hy5ZcEMkcudO72kKUcSLH9KI6QqrOjPBG
         zuvodQ3i1E8H1WVRCJqhcUNaYKPDfWmkS+RLapLuKziTdxFCaH4R1ZvV1x429726WOn4
         Dmi8L2MQ0n80p0UjibdjcCsnisJEzuAzKVjcSYBZO0Me/DrytQKfskNkOvKwPx2L64QX
         utcw==
X-Forwarded-Encrypted: i=1; AJvYcCVGXf+bTbx1ubQqrOmZidsJrjWwTU/Luj5bnCRj+r3Qx1O0py9rnXovMsjRCRIcnVkdYuB8Sz5gsF8Pvnww@vger.kernel.org
X-Gm-Message-State: AOJu0YyKsbYgZNeqmzWp0sYLx2vXLCaX0QCh8l8VpI8I5hpkLUwNtA8Y
	ObO3EGZaLT7dUzhdwcElukrOdrfPzsPSCx55gMsJZpcTIGmjIK+iEb2fnSRrAQg=
X-Gm-Gg: ASbGncsFeIZvgzBhF5A6+BVpP4HFF2xAWhsyGMffQhgNZyXZteyuC5I6hqXxSvbJKV+
	LdWTPEmWkFi9XXbqtKtwH49CAbDLcTH0Fkcpd3e+gqAJrMN/+fGq80PtB6d/xNkT9nrF6KzKW9P
	i6XWeT2KQPNngbZAruaFUPicWrGo4FHmlnr1mMzMo1gY28sWK3LHA9n/0OA55uuM+OVJUKCShQD
	q6XJfNmPQ/wwHykBouyz4zeY9noCNbZiFIeG8qpN6sbMNbZMfjaaZ6LqdXLXQs6CSMtq8xLYj1+
	uEwsBTrc54AAYyPR20n17+hEamjucfFGb4RF0qyKnphDPw4frP07jizyNg==
X-Google-Smtp-Source: AGHT+IFGDFv3Q/fDJq96jJR3oBpkTYeZFfDo5uJ8GBvW5yBqf9KLhXWrMr5gc489cQ1N+znCBv4z7w==
X-Received: by 2002:a17:907:60d6:b0:ab6:ed8a:3c14 with SMTP id a640c23a62f3a-abb70c8e70emr869084366b.27.1739788098208;
        Mon, 17 Feb 2025 02:28:18 -0800 (PST)
Received: from rayden (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba533bf307sm871580966b.176.2025.02.17.02.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 02:28:17 -0800 (PST)
Date: Mon, 17 Feb 2025 11:28:15 +0100
From: Jens Wiklander <jens.wiklander@linaro.org>
To: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
Cc: Sumit Garg <sumit.garg@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 4/8] tee: add TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF
Message-ID: <20250217102815.GC2637163@rayden>
References: <20250202-qcom-tee-using-tee-ss-without-mem-obj-v2-0-297eacd0d34f@quicinc.com>
 <20250202-qcom-tee-using-tee-ss-without-mem-obj-v2-4-297eacd0d34f@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250202-qcom-tee-using-tee-ss-without-mem-obj-v2-4-297eacd0d34f@quicinc.com>

Hi,

On Sun, Feb 02, 2025 at 06:43:32PM -0800, Amirreza Zarrabi wrote:
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
> Signed-off-by: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
> ---
>  drivers/tee/tee_core.c   | 85 ++++++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/tee_core.h |  4 +++
>  include/linux/tee_drv.h  |  6 ++++
>  include/uapi/linux/tee.h | 41 +++++++++++++++++++----
>  4 files changed, 130 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
> index 9f4b9a995e16..fe435772688c 100644
> --- a/drivers/tee/tee_core.c
> +++ b/drivers/tee/tee_core.c
> @@ -379,6 +379,7 @@ static int params_from_user(struct tee_context *ctx, struct tee_param *params,
>  		switch (ip.attr & TEE_IOCTL_PARAM_ATTR_TYPE_MASK) {
>  		case TEE_IOCTL_PARAM_ATTR_TYPE_NONE:
>  		case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT:
> +		case TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_OUTPUT:
>  			break;
>  		case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT:
>  		case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT:
> @@ -396,6 +397,11 @@ static int params_from_user(struct tee_context *ctx, struct tee_param *params,
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
> @@ -469,6 +475,12 @@ static int params_to_user(struct tee_ioctl_param __user *uparams,
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
> @@ -621,6 +633,66 @@ static int tee_ioctl_invoke(struct tee_context *ctx,
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
> @@ -676,6 +748,12 @@ static int params_to_supp(struct tee_context *ctx,
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
> @@ -783,6 +861,11 @@ static int params_from_supp(struct tee_param *params, size_t num_params,
>  			p->u.ubuf.uaddr = u64_to_user_ptr(ip.a);
>  			p->u.ubuf.size = ip.b;
>  			break;
> +		case TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_OUTPUT:
> +		case TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INOUT:
> +			p->u.objref.id = ip.a;
> +			p->u.objref.flags = ip.b;
> +			break;
>  		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
>  		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
>  			/*
> @@ -863,6 +946,8 @@ static long tee_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>  		return tee_ioctl_open_session(ctx, uarg);
>  	case TEE_IOC_INVOKE:
>  		return tee_ioctl_invoke(ctx, uarg);
> +	case TEE_IOC_OBJECT_INVOKE:
> +		return tee_ioctl_object_invoke(ctx, uarg);
>  	case TEE_IOC_CANCEL:
>  		return tee_ioctl_cancel(ctx, uarg);
>  	case TEE_IOC_CLOSE_SESSION:
> diff --git a/include/linux/tee_core.h b/include/linux/tee_core.h
> index 8a4c9e30b652..ffb04c946c70 100644
> --- a/include/linux/tee_core.h
> +++ b/include/linux/tee_core.h
> @@ -72,6 +72,7 @@ struct tee_device {
>   * @close_session:	close a session
>   * @system_session:	declare session as a system session
>   * @invoke_func:	invoke a trusted function
> + * @object_invoke_func:	invoke an object

invoke a TEE object?

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
> index 130782d4d5f6..16dad7a21910 100644
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
> index 4a1dcfb4290e..0aef647d4a34 100644
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
>   *     else if a ubuf, address into the user buffer,
> - *     else a value parameter
> - * @b: if a memref or ubuf, size of the buffer, else a value parameter
> + *     else if an objref, object identifier, else a value parameter
> + * @b: if a memref or ubuf, size of the buffer,
> + *     else if objref, a flag for object, else a value parameter

flags for the object?

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
> + * struct tee_ioctl_invoke_func_arg - Invokes an object in a Trusted Application.

Please drop the terminating '.'.

Thanks,
Jens

> + * @object:	[in] Object id
> + * @op:		[in] Object operation, specific to the object
> + * @ret:	[out] return value
> + * @num_params	[in] number of parameters following this struct
> + */
> +struct tee_ioctl_object_invoke_arg {
> +	__u64 object;
> +	__u32 op;
> +	__u32 ret;
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

