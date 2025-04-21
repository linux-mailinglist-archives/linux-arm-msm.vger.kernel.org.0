Return-Path: <linux-arm-msm+bounces-54849-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F0714A94F75
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Apr 2025 12:42:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ABC807A2365
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Apr 2025 10:41:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82E0C2561AC;
	Mon, 21 Apr 2025 10:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="of5unEST"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4742DBA53;
	Mon, 21 Apr 2025 10:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745232148; cv=none; b=oPkMNtDChFPNEQGaVjV5jE2Ljw+op955bAnz46nTOniguDtzxCx+fRt1kkLOiaQCWaC5hW/yeuXOG696ejKwdfjmdaVg9ebCemlstOgIjczcehSs6jJYbZ3mJPUo91w3oju7CVcLoooKvIno+aAcmiCYNAgfrwxe1OeqBzavEko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745232148; c=relaxed/simple;
	bh=xT7PnaTlh1xLrB/kDiy/+78LloWAc27/D5zrJIW/rYA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I4lTiYgjGKTwIWdC0h1TEma/SNGqbHFbwQElHr5Cdqrj7jZOqVeTU41DXTCiUQgPu91dFpJfweAJyx1yYx8vcFMMkaTUnt6mShZVwELYr+abtVrpBs+LSs5OBr5tLN6PzPoqnxBu6jpaETUtGXe1sDYtcmlqthca+8owE6t6FR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=of5unEST; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57A79C4CEE4;
	Mon, 21 Apr 2025 10:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745232147;
	bh=xT7PnaTlh1xLrB/kDiy/+78LloWAc27/D5zrJIW/rYA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=of5unESTI9fOzX515uJlYR8s2BP1S8AaCCuikOMQuoXHcmARe+XJjVCUaapvH/8W8
	 EVTBEUubD0ZG/L8ICdd71XchxAuqy7AsYfITuLteyLgWFKZ4WwTa+/bR7CEtRV9lZk
	 aTBW6LQU2C0l/nFacyOQJApGdknoamfRBHcbRhq65NmSixegRE10bOX9Jojc3jGs+u
	 fwXgec7D1lJSqNKLdTBseKqUCUGiBSI21sPC9knPTZ3mrYcJFJVxNOoL0gVTPWO7rh
	 r+qoeDf+rkF2jJZUCvWuUuDWNRDqxBp90UfVqMwgBypJgEaNQN2iXBuqwtS1giDunh
	 G8JiznRgBG+0g==
Date: Mon, 21 Apr 2025 16:12:18 +0530
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
Subject: Re: [PATCH v3 02/11] tee: add close_context to TEE driver operation
Message-ID: <aAYhCg6XOeZm7jqq@sumit-X1>
References: <20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-0-7f457073282d@oss.qualcomm.com>
 <20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-2-7f457073282d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-2-7f457073282d@oss.qualcomm.com>

On Thu, Mar 27, 2025 at 07:47:24PM -0700, Amirreza Zarrabi wrote:
> The tee_context can be used to manage TEE user resources, including
> those allocated by the driver for the TEE on behalf of the user.
> The release() callback is invoked only when all resources, such as
> tee_shm, are released and there are no references to the tee_context.
> 
> When a user closes the device file, the driver should notify the
> TEE to release any resources it may hold and drop the context
> references. To achieve this, a close_context() callback is
> introduced to initiate resource release in the TEE driver when
> the device file is closed.

Can you ellaborate more as to whether the TEE driver will release
resources corresponding to a particular user or all the users?

> 
> Relocate teedev_ctx_get, teedev_ctx_put, tee_device_get, and
> tee_device_get functions to tee_drv.h to make them accessible
> outside the TEE subsystem.

These should rather be relocated to tee_core.h as tee_drv.h is rather
meant for kernel TEE client drivers.

> 
> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> ---
>  drivers/tee/tee_core.c    | 39 +++++++++++++++++++++++++++++++++++++++
>  drivers/tee/tee_private.h |  6 ------
>  include/linux/tee_core.h  | 11 +++++++++--
>  include/linux/tee_drv.h   | 40 ++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 88 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
> index 24edce4cdbaa..22cc7d624b0c 100644
> --- a/drivers/tee/tee_core.c
> +++ b/drivers/tee/tee_core.c
> @@ -72,6 +72,20 @@ struct tee_context *teedev_open(struct tee_device *teedev)
>  }
>  EXPORT_SYMBOL_GPL(teedev_open);
>  
> +/**
> + * teedev_ctx_get() - Increment the reference count of a context
> + *
> + * This function increases the refcount of the context, which is tied to
> + * resources shared by the same tee_device. During the unregistration process,
> + * the context may remain valid even after tee_device_unregister() has returned.
> + *
> + * Users should ensure that the context's refcount is properly decreased before
> + * calling tee_device_put(), typically within the context's release() function.
> + * Alternatively, users can call tee_device_get() and teedev_ctx_get() together
> + * and release them simultaneously (see shm_alloc_helper()).
> + *
> + * @ctx: Pointer to the context
> + */

Let's not duplicate the documentation here when it has already been
documented in the header file.

Same for other places below.

-Sumit

>  void teedev_ctx_get(struct tee_context *ctx)
>  {
>  	if (ctx->releasing)
> @@ -79,6 +93,7 @@ void teedev_ctx_get(struct tee_context *ctx)
>  
>  	kref_get(&ctx->refcount);
>  }
> +EXPORT_SYMBOL_GPL(teedev_ctx_get);
>  
>  static void teedev_ctx_release(struct kref *ref)
>  {
> @@ -89,6 +104,10 @@ static void teedev_ctx_release(struct kref *ref)
>  	kfree(ctx);
>  }
>  
> +/**
> + * teedev_ctx_put() - Decrease reference count on a context
> + * @ctx: pointer to the context
> + */
>  void teedev_ctx_put(struct tee_context *ctx)
>  {
>  	if (ctx->releasing)
> @@ -96,11 +115,15 @@ void teedev_ctx_put(struct tee_context *ctx)
>  
>  	kref_put(&ctx->refcount, teedev_ctx_release);
>  }
> +EXPORT_SYMBOL_GPL(teedev_ctx_put);
>  
>  void teedev_close_context(struct tee_context *ctx)
>  {
>  	struct tee_device *teedev = ctx->teedev;
>  
> +	if (teedev->desc->ops->close_context)
> +		teedev->desc->ops->close_context(ctx);
> +
>  	teedev_ctx_put(ctx);
>  	tee_device_put(teedev);
>  }
> @@ -1024,6 +1047,10 @@ int tee_device_register(struct tee_device *teedev)
>  }
>  EXPORT_SYMBOL_GPL(tee_device_register);
>  
> +/**
> + * tee_device_put() - Decrease the user count for a tee_device
> + * @teedev: pointer to the tee_device
> + */
>  void tee_device_put(struct tee_device *teedev)
>  {
>  	mutex_lock(&teedev->mutex);
> @@ -1037,7 +1064,18 @@ void tee_device_put(struct tee_device *teedev)
>  	}
>  	mutex_unlock(&teedev->mutex);
>  }
> +EXPORT_SYMBOL_GPL(tee_device_put);
>  
> +/**
> + * tee_device_get() - Increment the user count for a tee_device
> + * @teedev: Pointer to the tee_device
> + *
> + * If tee_device_unregister() has been called and the final user of @teedev
> + * has already released the device, this function will fail to prevent new users
> + * from accessing the device during the unregistration process.
> + *
> + * Returns: true if @teedev remains valid, otherwise false
> + */
>  bool tee_device_get(struct tee_device *teedev)
>  {
>  	mutex_lock(&teedev->mutex);
> @@ -1049,6 +1087,7 @@ bool tee_device_get(struct tee_device *teedev)
>  	mutex_unlock(&teedev->mutex);
>  	return true;
>  }
> +EXPORT_SYMBOL_GPL(tee_device_get);
>  
>  /**
>   * tee_device_unregister() - Removes a TEE device
> diff --git a/drivers/tee/tee_private.h b/drivers/tee/tee_private.h
> index 9bc50605227c..d3f40a03de36 100644
> --- a/drivers/tee/tee_private.h
> +++ b/drivers/tee/tee_private.h
> @@ -14,12 +14,6 @@
>  
>  int tee_shm_get_fd(struct tee_shm *shm);
>  
> -bool tee_device_get(struct tee_device *teedev);
> -void tee_device_put(struct tee_device *teedev);
> -
> -void teedev_ctx_get(struct tee_context *ctx);
> -void teedev_ctx_put(struct tee_context *ctx);
> -
>  struct tee_shm *tee_shm_alloc_user_buf(struct tee_context *ctx, size_t size);
>  struct tee_shm *tee_shm_register_user_buf(struct tee_context *ctx,
>  					  unsigned long addr, size_t length);
> diff --git a/include/linux/tee_core.h b/include/linux/tee_core.h
> index a38494d6b5f4..8a4c9e30b652 100644
> --- a/include/linux/tee_core.h
> +++ b/include/linux/tee_core.h
> @@ -65,8 +65,9 @@ struct tee_device {
>  /**
>   * struct tee_driver_ops - driver operations vtable
>   * @get_version:	returns version of driver
> - * @open:		called when the device file is opened
> - * @release:		release this open file
> + * @open:		called for a context when the device file is opened
> + * @close_context:	called when the device file is closed
> + * @release:		called to release the context
>   * @open_session:	open a new session
>   * @close_session:	close a session
>   * @system_session:	declare session as a system session
> @@ -76,11 +77,17 @@ struct tee_device {
>   * @supp_send:		called for supplicant to send a response
>   * @shm_register:	register shared memory buffer in TEE
>   * @shm_unregister:	unregister shared memory buffer in TEE
> + *
> + * The context given to @open might last longer than the device file if it is
> + * tied to other resources in the TEE driver. @close_context is called when the
> + * client closes the device file, even if there are existing references to the
> + * context. The TEE driver can use @close_context to start cleaning up.
>   */
>  struct tee_driver_ops {
>  	void (*get_version)(struct tee_device *teedev,
>  			    struct tee_ioctl_version_data *vers);
>  	int (*open)(struct tee_context *ctx);
> +	void (*close_context)(struct tee_context *ctx);
>  	void (*release)(struct tee_context *ctx);
>  	int (*open_session)(struct tee_context *ctx,
>  			    struct tee_ioctl_open_session_arg *arg,
> diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
> index a54c203000ed..ce23fd42c5d4 100644
> --- a/include/linux/tee_drv.h
> +++ b/include/linux/tee_drv.h
> @@ -96,6 +96,46 @@ struct tee_param {
>  	} u;
>  };
>  
> +/**
> + * tee_device_get() - Increment the user count for a tee_device
> + * @teedev: Pointer to the tee_device
> + *
> + * If tee_device_unregister() has been called and the final user of @teedev
> + * has already released the device, this function will fail to prevent new users
> + * from accessing the device during the unregistration process.
> + *
> + * Returns: true if @teedev remains valid, otherwise false
> + */
> +bool tee_device_get(struct tee_device *teedev);
> +
> +/**
> + * tee_device_put() - Decrease the user count for a tee_device
> + * @teedev: pointer to the tee_device
> + */
> +void tee_device_put(struct tee_device *teedev);
> +
> +/**
> + * teedev_ctx_get() - Increment the reference count of a context
> + *
> + * This function increases the refcount of the context, which is tied to
> + * resources shared by the same tee_device. During the unregistration process,
> + * the context may remain valid even after tee_device_unregister() has returned.
> + *
> + * Users should ensure that the context's refcount is properly decreased before
> + * calling tee_device_put(), typically within the context's release() function.
> + * Alternatively, users can call tee_device_get() and teedev_ctx_get() together
> + * and release them simultaneously (see shm_alloc_helper()).
> + *
> + * @ctx: Pointer to the context
> + */
> +void teedev_ctx_get(struct tee_context *ctx);
> +
> +/**
> + * teedev_ctx_put() - Decrease reference count on a context
> + * @ctx: pointer to the context
> + */
> +void teedev_ctx_put(struct tee_context *ctx);
> +
>  /**
>   * tee_shm_alloc_kernel_buf() - Allocate kernel shared memory for a
>   *                              particular TEE client driver
> 
> -- 
> 2.34.1
> 
> 

