Return-Path: <linux-arm-msm+bounces-54858-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A69CA95176
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Apr 2025 15:18:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B454716E113
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Apr 2025 13:18:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4734221019C;
	Mon, 21 Apr 2025 13:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FvqrRbTa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA021E487;
	Mon, 21 Apr 2025 13:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745241489; cv=none; b=iXLwGD0JBWmDcxwo51cSYf4TAUYYvPQaEE663TKgGo5H3la1SjBLXYKU0aLdlozPiR7uuoNUfIHx0ROf1WeEvEmO2G5eNf/p/FTMmRpCEwLEG/dwDPQrAqaC+Ff6I8+2hHiYRXpT+3EcdB6vBh8vm1zxPDRQfIjnjSn8tkbcQiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745241489; c=relaxed/simple;
	bh=jZ8c3hUZgYGoR3mALoG3pOa9rH1a5dhcYvYC3yF/luA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lbomobalKUr0nJBHrDvLfFlEJ8pFJk2b1iYgPQ6Wxb/h9hdOqizpa66ie4ywqxF8rQqUs1CvjnvlRVC1VG7v/0pAdiNYy/OvT0j3pdF2jm67HkUQTDLe8Q+Db8ut34F0iozR2NQJsV5R9pRbSeoKMGMSoejAgb5uFJ/EPu477vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FvqrRbTa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 305D0C4CEE4;
	Mon, 21 Apr 2025 13:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745241488;
	bh=jZ8c3hUZgYGoR3mALoG3pOa9rH1a5dhcYvYC3yF/luA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FvqrRbTasjKcywJZ3l+k2Xh2V3Y6tLWaNMA76W1oWWMcD07TdlVF9jwFVjL9kXKqs
	 Sejv/dduX9Q0XzIHO6fyosZ6th4jPuJpo7uIez6dTMZYCHoga/b2Ec3tH4frqPn/ob
	 yT84VLlKhEG2C2ubB/HzLE7IK3K5c7wHtF24f7JU7Hh2XAAiYVLTc9Qe1YuAp4vI69
	 g/jzQEqEMT3EFYHUh0HSgRBJGYbki/cFlk5VSD1M0lfO7kgZwSLeNkoIULPuD8sbTX
	 bGEov6xvxmNhbNGUCkXJp9OelhJuT03eDeK0lNoxRUR5ey5qlNaiBZYPnMbN7R4Iiz
	 8OPFzDwGXhrLA==
Date: Mon, 21 Apr 2025 18:47:58 +0530
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
Subject: Re: [PATCH v3 03/11] tee: add TEE_IOCTL_PARAM_ATTR_TYPE_UBUF
Message-ID: <aAZFhlLv9GzHqUZc@sumit-X1>
References: <20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-0-7f457073282d@oss.qualcomm.com>
 <20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-3-7f457073282d@oss.qualcomm.com>
 <CAHUa44GRBiRr6CsFWxJhyzf1cRSEP66m5K7uFntOv3oYWTHWgQ@mail.gmail.com>
 <5de2a378-77cf-4373-b3ae-faeebb931e2d@oss.qualcomm.com>
 <CAHUa44F-t29Hu0o3+0vFLjtrnA8ZGycPFcUTXEOmms9B=cZ6XA@mail.gmail.com>
 <db3e8182-99ae-4a63-96ca-5d7ebeeb170f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <db3e8182-99ae-4a63-96ca-5d7ebeeb170f@oss.qualcomm.com>

On Wed, Apr 09, 2025 at 05:20:08PM +1000, Amirreza Zarrabi wrote:
> 
> 
> On 4/9/2025 4:41 PM, Jens Wiklander wrote:
> > Hi Amirreza,
> > 
> > On Wed, Apr 9, 2025 at 2:28 AM Amirreza Zarrabi
> > <amirreza.zarrabi@oss.qualcomm.com> wrote:
> >>
> >> Hi jens,
> >>
> >> On 4/8/2025 10:19 PM, Jens Wiklander wrote:
> >>
> >> Hi Amirreza,
> >>
> >> On Fri, Mar 28, 2025 at 3:48 AM Amirreza Zarrabi
> >> <amirreza.zarrabi@oss.qualcomm.com> wrote:
> >>
> >> For drivers that can transfer data to the TEE without using shared
> >> memory from client, it is necessary to receive the user address
> >> directly, bypassing any processing by the TEE subsystem. Introduce
> >> TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT/OUTPUT/INOUT to represent
> >> userspace buffers.
> >>
> >> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> >> ---
> >>  drivers/tee/tee_core.c   | 33 +++++++++++++++++++++++++++++++++
> >>  include/linux/tee_drv.h  |  6 ++++++
> >>  include/uapi/linux/tee.h | 22 ++++++++++++++++------
> >>  3 files changed, 55 insertions(+), 6 deletions(-)
> >>
> >> Is this patch needed now that the QCOMTEE driver supports shared
> >> memory? I prefer keeping changes to the ABI to a minimum.
> >>
> >> Cheers,
> >> Jens
> >>
> >> Unfortunately, this is still required. QTEE supports two types of data transfer:
> >> (1) using UBUF and (2) memory objects. Even with memory object support, some APIs still
> >> expect to receive data using UBUF. For instance, to load a TA, QTEE offers two interfaces:
> >> one where the TA binary is in UBUF and another where the TA binary is in a memory object.
> > 
> > Is this a limitation in the QTEE backend driver or on the secure side?
> > Can it be fixed? I don't ask for changes in the ABI to the secure
> > world since I assume you haven't made such changes while this patch
> > set has evolved.
> > 
> > Cheers,
> > Jens
> 
> The secure-side ABI supports passing data using memcpy to the same
> buffer that contains the message for QTEE, rather than using a memory
> object. Some services tend to use this approach for small data instead
> of allocating a memory object. I have no choice but to expose this support.

Okay, I can see how QTEE supports embedding user buffers in fixed size
shared memory buffers allocated by the driver with maximum size limits.

OP-TEE also have support for temporary shared memory where the user
space client directly passes the buffer to share with OP-TEE. Then the
libteec [1] handles the underneath copy to and from the shared memory
allocation automatically.

So is there a limitation for QCOMTEE user space library [2] to do the
same? This way we will be able to retain the user-space ABI as well as
simplicify the kernel driver.

[1] https://github.com/OP-TEE/optee_client/blob/master/libteec/src/tee_client_api.c#L365
[2] https://github.com/quic/quic-teec

-Sumit

> 
> Throughout the patchset, I have not made any change to the ABI but
> tried to provide support for the memory object in a separate,
> independent commit, distinct from the UBUF.
> 
> Best regards,
> Amir
> 
> > 
> >>
> >> Best Regards,
> >> Amir
> >>
> >> diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
> >> index 22cc7d624b0c..bc862a11d437 100644
> >> --- a/drivers/tee/tee_core.c
> >> +++ b/drivers/tee/tee_core.c
> >> @@ -404,6 +404,17 @@ static int params_from_user(struct tee_context *ctx, struct tee_param *params,
> >>                         params[n].u.value.b = ip.b;
> >>                         params[n].u.value.c = ip.c;
> >>                         break;
> >> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT:
> >> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
> >> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
> >> +                       params[n].u.ubuf.uaddr = u64_to_user_ptr(ip.a);
> >> +                       params[n].u.ubuf.size = ip.b;
> >> +
> >> +                       if (!access_ok(params[n].u.ubuf.uaddr,
> >> +                                      params[n].u.ubuf.size))
> >> +                               return -EFAULT;
> >> +
> >> +                       break;
> >>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
> >>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
> >>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
> >> @@ -472,6 +483,11 @@ static int params_to_user(struct tee_ioctl_param __user *uparams,
> >>                             put_user(p->u.value.c, &up->c))
> >>                                 return -EFAULT;
> >>                         break;
> >> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
> >> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
> >> +                       if (put_user((u64)p->u.ubuf.size, &up->b))
> >> +                               return -EFAULT;
> >> +                       break;
> >>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
> >>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
> >>                         if (put_user((u64)p->u.memref.size, &up->b))
> >> @@ -672,6 +688,13 @@ static int params_to_supp(struct tee_context *ctx,
> >>                         ip.b = p->u.value.b;
> >>                         ip.c = p->u.value.c;
> >>                         break;
> >> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT:
> >> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
> >> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
> >> +                       ip.a = (u64)p->u.ubuf.uaddr;
> >> +                       ip.b = p->u.ubuf.size;
> >> +                       ip.c = 0;
> >> +                       break;
> >>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
> >>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
> >>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
> >> @@ -774,6 +797,16 @@ static int params_from_supp(struct tee_param *params, size_t num_params,
> >>                         p->u.value.b = ip.b;
> >>                         p->u.value.c = ip.c;
> >>                         break;
> >> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
> >> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
> >> +                       p->u.ubuf.uaddr = u64_to_user_ptr(ip.a);
> >> +                       p->u.ubuf.size = ip.b;
> >> +
> >> +                       if (!access_ok(params[n].u.ubuf.uaddr,
> >> +                                      params[n].u.ubuf.size))
> >> +                               return -EFAULT;
> >> +
> >> +                       break;
> >>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
> >>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
> >>                         /*
> >> diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
> >> index ce23fd42c5d4..d773f91c6bdd 100644
> >> --- a/include/linux/tee_drv.h
> >> +++ b/include/linux/tee_drv.h
> >> @@ -82,6 +82,11 @@ struct tee_param_memref {
> >>         struct tee_shm *shm;
> >>  };
> >>
> >> +struct tee_param_ubuf {
> >> +       void * __user uaddr;
> >> +       size_t size;
> >> +};
> >> +
> >>  struct tee_param_value {
> >>         u64 a;
> >>         u64 b;
> >> @@ -92,6 +97,7 @@ struct tee_param {
> >>         u64 attr;
> >>         union {
> >>                 struct tee_param_memref memref;
> >> +               struct tee_param_ubuf ubuf;
> >>                 struct tee_param_value value;
> >>         } u;
> >>  };
> >> diff --git a/include/uapi/linux/tee.h b/include/uapi/linux/tee.h
> >> index d0430bee8292..3e9b1ec5dfde 100644
> >> --- a/include/uapi/linux/tee.h
> >> +++ b/include/uapi/linux/tee.h
> >> @@ -151,6 +151,13 @@ struct tee_ioctl_buf_data {
> >>  #define TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT        6
> >>  #define TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT 7       /* input and output */
> >>
> >> +/*
> >> + * These defines userspace buffer parameters.
> >> + */
> >> +#define TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT   8
> >> +#define TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT  9
> >> +#define TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT   10      /* input and output */
> >> +
> >>  /*
> >>   * Mask for the type part of the attribute, leaves room for more types
> >>   */
> >> @@ -186,14 +193,17 @@ struct tee_ioctl_buf_data {
> >>  /**
> >>   * struct tee_ioctl_param - parameter
> >>   * @attr: attributes
> >> - * @a: if a memref, offset into the shared memory object, else a value parameter
> >> - * @b: if a memref, size of the buffer, else a value parameter
> >> + * @a: if a memref, offset into the shared memory object,
> >> + *     else if a ubuf, address of the user buffer,
> >> + *     else a value parameter
> >> + * @b: if a memref or ubuf, size of the buffer, else a value parameter
> >>   * @c: if a memref, shared memory identifier, else a value parameter
> >>   *
> >> - * @attr & TEE_PARAM_ATTR_TYPE_MASK indicates if memref or value is used in
> >> - * the union. TEE_PARAM_ATTR_TYPE_VALUE_* indicates value and
> >> - * TEE_PARAM_ATTR_TYPE_MEMREF_* indicates memref. TEE_PARAM_ATTR_TYPE_NONE
> >> - * indicates that none of the members are used.
> >> + * @attr & TEE_PARAM_ATTR_TYPE_MASK indicates if memref, ubuf, or value is
> >> + * used in the union. TEE_PARAM_ATTR_TYPE_VALUE_* indicates value,
> >> + * TEE_PARAM_ATTR_TYPE_MEMREF_* indicates memref, and TEE_PARAM_ATTR_TYPE_UBUF_*
> >> + * indicates ubuf. TEE_PARAM_ATTR_TYPE_NONE indicates that none of the members
> >> + * are used.
> >>   *
> >>   * Shared memory is allocated with TEE_IOC_SHM_ALLOC which returns an
> >>   * identifier representing the shared memory object. A memref can reference
> >>
> >> --
> >> 2.34.1
> >>
> 
> 

