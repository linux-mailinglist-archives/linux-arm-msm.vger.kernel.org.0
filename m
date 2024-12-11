Return-Path: <linux-arm-msm+bounces-41493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2139ECDFC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 15:05:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DBB6A188D5EE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 14:05:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CCEC23691C;
	Wed, 11 Dec 2024 14:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s8eFhFY0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE062368FB
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 14:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733925909; cv=none; b=phfnp/nG5krXyy5w1nF/0A/zAah7jRKjhnNGSNGim5CO5V+tM0faXD+MKXhRWz+TSDOj/vw1toBgS8aeVZk5qS0UZMO/bAkpNYCdKJuseWgmId58n+Fn+ufgxm1Xm0U+P4aFaWOdSW/kdu4RAY1gmExbkrgJIPor8TnR6PS9kjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733925909; c=relaxed/simple;
	bh=8uxRDDa1ZrtEWRikgId2kWfLFhA3SOQppnPWVAk7eDY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ComejnrEYMZ33zjfDFMTEEWioAZyEeaAx12egEd+o1N8ZUdccyN4mpFRim4I/m2Rd0QXsgyg8cXcmNpxiKABEOVhLexWZfhxyL9ud/HJ9Hbo21/xQ4rGVqLZWMgVczvjeFr+C3DwCCien5E5VeVTRZfKv43v1H1Bi9UlUbWgDDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s8eFhFY0; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30227ccf803so29057261fa.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 06:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733925904; x=1734530704; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=il8+9vjQz+0CNwk2YpjhN7coIV5zrH9Hso1s2Wky8S0=;
        b=s8eFhFY06gE2wwFboJ9UdlEdhqKi6FHU7n3uW41JEgtF2pqOg3QIkZyOtYxzf0YhNe
         6i20Nb4jN3EFehDcAYb9/7LKtTVAfneJVOFaEVNhpPjm/Ka2UDOGvJzuQZVFr1jny6UQ
         a4jnKdrv6sa3E+S+yIHTmOWFwwpZlKMt+V+A2nsODtxrtcv/VC1n03EMflL33maXKf5+
         woeRv8H1h6s9v04jyYhLnc/Oi0Q9xEusKfTZPdvwnAw6NSPgntc3j13zZhvb73RI73iv
         xK5GlwOuMJYbtoX2icls0LlOBhOoJ5giEQ9YAGpeBQGveQHzNNcXXvvjWQO61OEKBt32
         /tIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733925904; x=1734530704;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=il8+9vjQz+0CNwk2YpjhN7coIV5zrH9Hso1s2Wky8S0=;
        b=R4pKfWvXYy+a6MiN3raGF4sHYfBt/VcrqsqjO2ntzJCCPvO99btkv7GDNoEpPAZWtk
         XEzpbT2ZQ/aF4nofWCWkzrslLNjENYV8Vn+0cCvyvF4+ImsSf6YZeMj9SkuMHy8eEzzO
         RBea/+oJdYR4N2GBnlr5o4oBZWxcU57KcDT42b1EWPOcG+Qxg2vx5mvn5O/ElOojIG1e
         nMH7bHeTfTdDtg6XIc2zjmSSJ7/hlUlyrE1b4MTdOiLis6P4M2jr4gHPByxYzVc7q1mK
         sI1nWeJTzZAKCRLWTnUKjuYSe5Q0H9Er91e9c4qKytsN9XtymVOmiKHeL/C8HRnfnPLB
         mNbw==
X-Forwarded-Encrypted: i=1; AJvYcCXW8avAfW0GSAOMZ99gVeekevbhPFUjXF+wYTtLXVnk3TQMn/OHdjFfscgEk9Mlk32JeDEfy4jCEESXKtHC@vger.kernel.org
X-Gm-Message-State: AOJu0YwrPGl/SeyNymaCf7EE0Dinqm6Nt+LHDw67cXRYQAHGXUS/GgZ0
	jPsVzsekIOHKMZAviHl/u2hR79qtREY9z5xB2h16IedxJzvRePgdJ+kshziUFPM=
X-Gm-Gg: ASbGnct9gGX5jcR54IBT/eG6JTEZnWFplhzZPF2sCVbiLYXCuzBLyWcaXa3qP5qDQ3f
	eWrLFhGShjLU3JYr+JdFcxsIRZkLao7JfCHaL9i1/V70ef5+Ww48xV2NiC7rdFr4SKyLm4QuiGf
	lNfRNzk1mWR8BDt6VlyV5KAH48YeaJBFt6O1czUAs9cLEWULnffRBZHTJ0rS4I6geZz7RsrT5gy
	ArzHSP4mnguHYo2ledVd26ME7zaayjP032UO9JLpTqFyQllR3cx5Ehz0vcCbSkyP/FVs3kyf3Zk
	5ULi+B9LkhNhPq21J01q
X-Google-Smtp-Source: AGHT+IFRBij+feIMREHq2gXiREyAd6JxtEPmcIQ8OM73icqJN5D6gRtYHPA7dg913pOv8z8zgawRZg==
X-Received: by 2002:a05:651c:154e:b0:300:160f:7c76 with SMTP id 38308e7fff4ca-30240d89514mr12681681fa.25.1733925903243;
        Wed, 11 Dec 2024 06:05:03 -0800 (PST)
Received: from rayden (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30041e2d03asm13756101fa.58.2024.12.11.06.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 06:05:02 -0800 (PST)
Date: Wed, 11 Dec 2024 15:04:59 +0100
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
Subject: Re: [PATCH 08/10] tee: add Qualcomm TEE driver
Message-ID: <20241211140459.GA471738@rayden>
References: <20241202-qcom-tee-using-tee-ss-without-mem-obj-v1-0-f502ef01e016@quicinc.com>
 <20241202-qcom-tee-using-tee-ss-without-mem-obj-v1-8-f502ef01e016@quicinc.com>
 <CAHUa44GqyaouPquw+DE1ASRwVOBw5xDstcpaNpmLmQbXmp6CuQ@mail.gmail.com>
 <62f80fb7-ea13-4ae1-a438-8d6b2d5a2f15@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <62f80fb7-ea13-4ae1-a438-8d6b2d5a2f15@quicinc.com>

Hi Amirreza,

On Wed, Dec 11, 2024 at 01:30:22PM +1100, Amirreza Zarrabi wrote:
[snip]
> >> +/**
> >> + * struct qcom_tee_context - Clients or supplicants context.
> >> + * @tee_context: TEE context.
> >> + * @qtee_objects_idr: QTEE objects in this context.
> >> + * @reqs_idr: Requests currently being processed.
> >> + * @lock: mutex for @reqs_idr and @qtee_objects_idr.
> >> + * @req_srcu: srcu for exclusive access to requests.
> >> + * @req_c: completion used when supplicant is waiting for requests.
> >> + * @released: state of this context.
> >> + * @ref_cnt: ref count.
> >> + */
> >> +struct qcom_tee_context {
> > 
> > Other drivers call their conterpart of this struct *_context_data.
> > Using the same pattern here makes it easier to recognize the struct in
> > the rest of the code.
> > 
> 
> Ack.
> 
> >> +       struct tee_context *tee_context;
> >> +
> >> +       struct idr qtee_objects_idr;
> >> +       struct idr reqs_idr;
> >> +       /* Synchronize access to @reqs_idr, @qtee_objects_idr and updating requests state. */
> >> +       struct mutex lock;
> >> +       struct srcu_struct req_srcu;
> > 
> > Why do you use this synchronization primitive? I don't know enough
> > about this primitive to tell if you use it for the right purpose so
> > perhaps you can help me understand which properties you need.
> > 
> 
> Sure, let me explain it bellow in the qcom_tee_user_object_dispatch,
> where it is acually used.
> 
> >> +       struct completion req_c;
> >> +
> >> +       int released;
> >> +
> >> +       struct kref ref_cnt;
> > 
> > Why does this struct need a different lifetime than struct tee_context?
> > 
> 
> This is a side effect of how QTEE objects and callback objects are released:
> 
>   - When a tee_context is closed, we release all QTEE objects in that context.
>     QTEE specifies that object releases are asynchronous. So, we queue the
>     releases in a workqueue and immediately return from the release callback,
>     allowing the TEE subsystem to continue.
> 
>   - When the workqueue sends a release for a QTEE object, QTEE may respond
>     by requesting the release of a callback object or an operation on a callback
>     object. This requires a valid struct qcom_tee_context. That's why we keep this
>     until all callback objects are gone.
> 
> The alternative is to keep a list of callback objects in this context and
> flag them as orphans. The refcount seems easier :).

It would be even easier if it was already dealt with by the TEE
subsystem. :-)

It looks like we have the same problem as with the tee_shm objects when
the tee_context should go away. Would it work to add another callback,
close_contex(), to tee_driver_ops to be called from
teedev_close_context()? The release() callback would still be called as
usual when the last reference is gone, but the backend TEE driver would
get a notification earlier with core_contex() that it's time to start
releasing resources.

[snip]
> >> +/**
> >> + * qcom_tee_supp_pop_entry() - Pop the next request in a context.
> > 
> > When you pop something you'd expect it to be removed also.
> >
> 
> I'll rename it to more apporpriate name.
> 
> >> + * @ctx: context from which to pop a request.
> >> + * @ubuf_size: size of available buffer for MEMBUF parameters.
> >> + * @num_params: number of entries for TEE parameter array.
> >> + *
> >> + * It does not remove the request from &qcom_tee_context.reqs_idr.
> >> + * It checks if @num_params is large enough to fit the next request arguments.
> >> + * It checks if @ubuf_size is large enough to fit IB buffer arguments from QTEE.
> >> + * It updates request state to %QCOM_TEE_REQ_PROCESSING state.
> >> + *
> >> + * Return: On success return a request or NULL and ERR_PTR on failure.
> >> + */
> >> +static struct qcom_tee_user_req *qcom_tee_supp_pop_entry(struct qcom_tee_context *ctx,
> >> +                                                        size_t ubuf_size, int num_params)
> >> +{
> >> +       struct qcom_tee_user_req *ureq;
> >> +       struct qcom_tee_arg *u;
> >> +       int i, id;
> >> +
> >> +       guard(mutex)(&ctx->lock);
> >> +
> >> +       /* Find the a QUEUED request. */
> > 
> > Is it _a_ or _the_?
> > 
> >> +       idr_for_each_entry(&ctx->reqs_idr, ureq, id)
> >> +               if (ureq->state == QCOM_TEE_REQ_QUEUED)
> >> +                       break;
> > 
> > Will this always result in a FIFO processing?
> > 
> 
> It not a FIFO. I understand your concerns.
> I'll replace it with a list.
> 
> >> +
> >> +       if (!ureq)
> >> +               return NULL;
> >> +
> >> +       u = ureq->args;
> >> +       /* (1) Is there enough TEE parameters? */
> >> +       if (num_params < qcom_tee_args_len(u))
> >> +               return ERR_PTR(-EINVAL);
> >> +
> >> +       /* (2) Is there enough space to pass input buffers? */
> >> +       qcom_tee_arg_for_each_input_buffer(i, u) {
> >> +               ubuf_size = size_sub(ubuf_size, u[i].b.size);
> >> +               if (ubuf_size == SIZE_MAX)
> >> +                       return ERR_PTR(-EINVAL);
> >> +
> >> +               ubuf_size = round_down(ubuf_size, 8);
> >> +       }
> >> +
> >> +       /* Ready to process request 'QUEUED -> PROCESSING'. */
> >> +       ureq->state = QCOM_TEE_REQ_PROCESSING;
> >> +
> >> +       return ureq;
> >> +}
> >> +
> >> +/* User object dispatcher. */
> >> +static int qcom_tee_user_object_dispatch(struct qcom_tee_object_invoke_ctx *oic,
> >> +                                        struct qcom_tee_object *object, u32 op,
> >> +                                        struct qcom_tee_arg *args)
> >> +{
> >> +       struct qcom_tee_user_object *uo = to_qcom_tee_user_object(object);
> >> +       struct qcom_tee_user_req *ureq __free(kfree);
> >> +       struct qcom_tee_context *ctx = uo->ctx;
> >> +       int errno;
> >> +
> >> +       ureq = kzalloc(sizeof(*ureq), GFP_KERNEL);
> >> +       if (!ureq)
> >> +               return -ENOMEM;
> >> +
> >> +       init_completion(&ureq->c);
> >> +       ureq->object_id = uo->object_id;
> >> +       ureq->op = op;
> >> +       ureq->args = args;
> >> +
> >> +       /* Queue the request. */
> >> +       if (qcom_tee_request_enqueue(ureq, ctx))
> >> +               return -ENODEV;
> >> +
> >> +       /* Wakeup supplicant to process it. */
> >> +       complete(&ctx->req_c);
> >> +
> >> +       /* Wait for supplicant to process the request. */
> >> +       /* Supplicant is expected to process request in a timely manner. We wait as KILLABLE,
> > 
> > requests
> > 
> >> +        * in case supplicant and invoke thread both running from a same user process, otherwise
> > 
> > the same
> > 
> >> +        * the process stuck on fatal signal.
> > 
> > might get stuck on a fatal signal?
> > 
> >> +        */
> > 
> > Please combine into one comment.
> > 
> 
> Ack.
> 
> >> +       if (!wait_for_completion_state(&ureq->c, TASK_KILLABLE | TASK_FREEZABLE)) {
> >> +               errno = ureq->errno;
> >> +               /* On SUCCESS, end_cb_notify frees the request. */
> >> +               if (!errno)
> >> +                       oic->data = no_free_ptr(ureq);
> >> +       } else {
> >> +               enum qcom_tee_req_state prev_state;
> >> +
> >> +               errno = -ENODEV;
> >> +
> >> +               scoped_guard(mutex, &ctx->lock) {
> >> +                       prev_state = ureq->state;
> >> +                       /* Replace ureq with '__empty_ureq' to keep req_id reserved. */
> >> +                       if (prev_state == QCOM_TEE_REQ_PROCESSING)
> >> +                               idr_replace(&ctx->reqs_idr, &__empty_ureq, ureq->req_id);
> >> +                       /* Remove ureq as supplicant has never seen this request. */
> >> +                       else if (prev_state == QCOM_TEE_REQ_QUEUED)
> >> +                               idr_remove(&ctx->reqs_idr, ureq->req_id);
> >> +               }
> >> +
> >> +               /* Wait for exclusive access to ureq. */
> >> +               synchronize_srcu(&ctx->req_srcu);
> > 
> > I'm sorry, I don't follow.
> >
> 
> I'll try to compare it to the optee.
> 
> In optee, clients and the supplicant run in two different contexts. If the
> supplicant is available, the client will wait for it to finish processing
> the queued request. The supplicant is guaranteed to be timely and responsive.

Yeah, or at least trusted to be timely and responsive.

> 
> In QCOMTEE:
> 
>   1. There are multiple supplicants. Any process that implements a callback
>      object is considered a supplicant. The general assumption of timeliness
>      or responsiveness may not apply. We allow the client to at least receive fatal
>      signals (this design can be extended later if a timeout is required).
> 
>   2. A client can implement a callback object and act as both a client and
>      a supplicant simultaneously. To terminate such a process, we need to be
>      able to accept fatal signals.

We accept tee-supplicant to be killed so this is similar.

> 
> srcu is specifically used to protect the args array. After returning from
> qcom_tee_user_object_dispatch, the args array might not be valid. We need to
> ensure no one is accessing the args array before the retun, hence synchronize_srcu.
> Whenever we read the contents of args, we do it within an srcu read lock.
> 
> For example, qcomtee_user_object_pop, which picks a request for the supplicant
> to process, will hold the srcu read lock when marshaling the args array
> to the TEE subsystem's params array.
> 
> An alternative to the srcu would be to use "context lock" ctx->lock and
> hold it throughout the qcomtee_user_object_pop function, even when marshaling
> the args array to the TEE subsystem's params array.
> 
> Using ctx->lock is easier to follow, but since it's shared by everyone in
> a context and marshaling can be heavy depending on the type of objects,
> I thought srcu would be more performant.
> 
> In other words, srcu just moves the marshaling of objects outside of ctx->lock.
> What do you think about keeping srcu or replacing it with ctx->lock?

Let's continue the comparison with OP-TEE where struct optee_supp_req
plays the role of struct qcom_tee_user_req in QCOMTEE. You can say that
access rights to the optee_supp_req follows with the owner. The
supp->mutex is in principle only held while changing owner. Couldn't the
ctx->lock be used in a similar way, avoiding it while marshalling
objects?

I'm open to be persuaded if you think that srcu is a better choice.

Cheers,
Jens

