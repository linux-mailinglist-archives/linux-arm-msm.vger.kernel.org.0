Return-Path: <linux-arm-msm+bounces-41659-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 091849EDFF7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 08:08:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C1EE1167F49
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 07:07:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4657207A31;
	Thu, 12 Dec 2024 07:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oPc+bUea"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C6720967D
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 07:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733987266; cv=none; b=RZ90Jf3itrMShQ+bqae6igjBk2NYaU15wZxdsDGN284p9fwMZH8IIdYFPFUSghrwY0ha6EgzpLhc5ZPX3W3S8w0Di+DdZvRPPtMg7YhXHDq6XYd/C72cHuENfDOLW5oowwYr4ZB99Bi1GcyhXJOWvLcoR2noPCfltNkrP1VGrgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733987266; c=relaxed/simple;
	bh=d9yunnnq7NauEQUK2R0qOv7E4isu1CKuQtDE+BzEeYU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JJb4wcosE7BEOHyO5Lvti67EdZ1WUlmtdtbbw0siW32kj0xLl/A10kRdmhRU6N/jMUi5mUpMI0a4QT0IG5QHPEvK/JNP7WUZ6ILnAVOia66Z566jjRRciSpbxqljMIe+SYr/c9D/kp2uJhoNtkEMNuLqdlEX7bEXpBWOY7wr0m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oPc+bUea; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-2a0206590a7so92127fac.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 23:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733987264; x=1734592064; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DxVllyzuIqpBksMArY+NNhScFHVCCBgCU4bZ0PpTIZg=;
        b=oPc+bUeaZoWkTwGYWZoEXrczB1n06LODXoZIoi/8MfIvL2BBueUbFUnRR9BEVZb6Qr
         tfkCzNIe4MDDNaA3DtwHKgH7EJIO6pQJKqricC3QLCcRnWNkxITTPDaBECSR3hdUIPWW
         N2aJ4r+F1kjGbuMMboq8PDaYLWAec8/iDbcyVozRCZ7xhDA6FGkPwpKPizl8pyumrury
         j3aWmNtJRcqcu0HAiONg7mjGSo/+WSAyOK2ir6v7fGQr/CNph5uWbqb7EiAnLUaM+Dit
         eKZpkUmG0+2GoHYmm8+0BINulBP08du4AeAFlmeH9nWk4NHFgsC7Ne0Io/qVdQkrE9uR
         bLPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733987264; x=1734592064;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DxVllyzuIqpBksMArY+NNhScFHVCCBgCU4bZ0PpTIZg=;
        b=ShvAHCFaDaCrEHYT1v6WJVQBw5uEV68Pe+H9BrjNi1w0Dh7tZaZip2zE2VhyKysN7L
         i0MR2kBei72aHJYI066/hsAp8DVscCC5bCTacTxue046DNSXPA2h9lrqMkvVwaFiksAU
         YOykBjVcz4Fu+JQ2rgP3z6PGcn3JOgyLPNWzAYlXrV+UEPzwI07MkTdkeU+JsxtVfegS
         dyobsfLSkfQuHswxxG/z9s+dZe+VxMj4hA0RVA+zruQBN863FKK2HlZ9G1N5XJmRSdaj
         fdDwqcJpb0IgDXHwrlHwOw0qNOcOaWbmq4Euso+S1ZENYS1t4G3OOHuYj6p/V3MZ/BIz
         qArA==
X-Forwarded-Encrypted: i=1; AJvYcCX6JbKMcbIbcAN34K0om/eAZ4tWso8n5j7/ywE/AJxNhf4huFRvpt88mr5qIG9juDxKYHMw6UUXF4O4LvsM@vger.kernel.org
X-Gm-Message-State: AOJu0YzkMi0LT81xQcvumJUWsmqKoCx9hWJo2XYHE6md+sI8MuUIdf1X
	bFPrOM8J/nvGHCexHEO8XOKa5DNl5/f2YvrN6q+ByX6zvY1XnurD6LXnhf9SfXdnR/7Qe4u9ild
	oZzrb7lrRK5an5PejSYxZgnPJxMbnfWNI8UB9sg==
X-Gm-Gg: ASbGnctnoBRKOFsgXCqjOB2PYNFEmKLtbjcHJOG9490oNhtjT47IwS4lbNKF5NRafzT
	c8RmXAUQgJScHeEW0t5d48GQ4z1n6OTLOf2o5i98=
X-Google-Smtp-Source: AGHT+IHu9WQQkg4jiY/bMy4Tg2xfTaSZJ/GixFguxakacj+CHD04SOOPrmnkaerjGIzLPSyg8u6r5/M3FQfA3TLpcAw=
X-Received: by 2002:a05:6870:5d89:b0:29e:460d:f74a with SMTP id
 586e51a60fabf-2a012bb5103mr3292676fac.3.1733987263511; Wed, 11 Dec 2024
 23:07:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241202-qcom-tee-using-tee-ss-without-mem-obj-v1-0-f502ef01e016@quicinc.com>
 <20241202-qcom-tee-using-tee-ss-without-mem-obj-v1-8-f502ef01e016@quicinc.com>
 <CAHUa44GqyaouPquw+DE1ASRwVOBw5xDstcpaNpmLmQbXmp6CuQ@mail.gmail.com>
 <62f80fb7-ea13-4ae1-a438-8d6b2d5a2f15@quicinc.com> <20241211140459.GA471738@rayden>
 <65f730f4-5733-46ef-9f32-d557b842f5c0@quicinc.com>
In-Reply-To: <65f730f4-5733-46ef-9f32-d557b842f5c0@quicinc.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 12 Dec 2024 08:07:32 +0100
Message-ID: <CAHUa44FU+MuBqriNwM3Fa7k5kJC9cCF9WfpWMDFbFFaw5TShiA@mail.gmail.com>
Subject: Re: [PATCH 08/10] tee: add Qualcomm TEE driver
To: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
Cc: Sumit Garg <sumit.garg@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-arm-msm@vger.kernel.org, 
	op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Armirreza,

On Thu, Dec 12, 2024 at 1:19=E2=80=AFAM Amirreza Zarrabi
<quic_azarrabi@quicinc.com> wrote:
>
> Hi Jens,
>
> On 12/12/2024 1:04 AM, Jens Wiklander wrote:
> > Hi Amirreza,
> >
> > On Wed, Dec 11, 2024 at 01:30:22PM +1100, Amirreza Zarrabi wrote:
> > [snip]
> >>>> +/**
> >>>> + * struct qcom_tee_context - Clients or supplicants context.
> >>>> + * @tee_context: TEE context.
> >>>> + * @qtee_objects_idr: QTEE objects in this context.
> >>>> + * @reqs_idr: Requests currently being processed.
> >>>> + * @lock: mutex for @reqs_idr and @qtee_objects_idr.
> >>>> + * @req_srcu: srcu for exclusive access to requests.
> >>>> + * @req_c: completion used when supplicant is waiting for requests.
> >>>> + * @released: state of this context.
> >>>> + * @ref_cnt: ref count.
> >>>> + */
> >>>> +struct qcom_tee_context {
> >>>
> >>> Other drivers call their conterpart of this struct *_context_data.
> >>> Using the same pattern here makes it easier to recognize the struct i=
n
> >>> the rest of the code.
> >>>
> >>
> >> Ack.
> >>
> >>>> +       struct tee_context *tee_context;
> >>>> +
> >>>> +       struct idr qtee_objects_idr;
> >>>> +       struct idr reqs_idr;
> >>>> +       /* Synchronize access to @reqs_idr, @qtee_objects_idr and up=
dating requests state. */
> >>>> +       struct mutex lock;
> >>>> +       struct srcu_struct req_srcu;
> >>>
> >>> Why do you use this synchronization primitive? I don't know enough
> >>> about this primitive to tell if you use it for the right purpose so
> >>> perhaps you can help me understand which properties you need.
> >>>
> >>
> >> Sure, let me explain it bellow in the qcom_tee_user_object_dispatch,
> >> where it is acually used.
> >>
> >>>> +       struct completion req_c;
> >>>> +
> >>>> +       int released;
> >>>> +
> >>>> +       struct kref ref_cnt;
> >>>
> >>> Why does this struct need a different lifetime than struct tee_contex=
t?
> >>>
> >>
> >> This is a side effect of how QTEE objects and callback objects are rel=
eased:
> >>
> >>   - When a tee_context is closed, we release all QTEE objects in that =
context.
> >>     QTEE specifies that object releases are asynchronous. So, we queue=
 the
> >>     releases in a workqueue and immediately return from the release ca=
llback,
> >>     allowing the TEE subsystem to continue.
> >>
> >>   - When the workqueue sends a release for a QTEE object, QTEE may res=
pond
> >>     by requesting the release of a callback object or an operation on =
a callback
> >>     object. This requires a valid struct qcom_tee_context. That's why =
we keep this
> >>     until all callback objects are gone.
> >>
> >> The alternative is to keep a list of callback objects in this context =
and
> >> flag them as orphans. The refcount seems easier :).
> >
> > It would be even easier if it was already dealt with by the TEE
> > subsystem. :-)
> >
> > It looks like we have the same problem as with the tee_shm objects when
> > the tee_context should go away. Would it work to add another callback,
> > close_contex(), to tee_driver_ops to be called from
> > teedev_close_context()? The release() callback would still be called as
> > usual when the last reference is gone, but the backend TEE driver would
> > get a notification earlier with core_contex() that it's time to start
> > releasing resources.
> >
>
> Yes, it works.
>
> This proposal is similar to our original discussion about adding a
> shutdown() callback along with release(). With this change, we can also d=
rop [1].
>
> It seems like the easiest solution. I'll add close_context().
>
> [1] https://lore.kernel.org/all/20241120-fix-tee_shm-refcount-upstream-v1=
-0-5da97f584fcd@quicinc.com/

Good.

>
> > [snip]
> >>>> +/**
> >>>> + * qcom_tee_supp_pop_entry() - Pop the next request in a context.
> >>>
> >>> When you pop something you'd expect it to be removed also.
> >>>
> >>
> >> I'll rename it to more apporpriate name.
> >>
> >>>> + * @ctx: context from which to pop a request.
> >>>> + * @ubuf_size: size of available buffer for MEMBUF parameters.
> >>>> + * @num_params: number of entries for TEE parameter array.
> >>>> + *
> >>>> + * It does not remove the request from &qcom_tee_context.reqs_idr.
> >>>> + * It checks if @num_params is large enough to fit the next request=
 arguments.
> >>>> + * It checks if @ubuf_size is large enough to fit IB buffer argumen=
ts from QTEE.
> >>>> + * It updates request state to %QCOM_TEE_REQ_PROCESSING state.
> >>>> + *
> >>>> + * Return: On success return a request or NULL and ERR_PTR on failu=
re.
> >>>> + */
> >>>> +static struct qcom_tee_user_req *qcom_tee_supp_pop_entry(struct qco=
m_tee_context *ctx,
> >>>> +                                                        size_t ubuf=
_size, int num_params)
> >>>> +{
> >>>> +       struct qcom_tee_user_req *ureq;
> >>>> +       struct qcom_tee_arg *u;
> >>>> +       int i, id;
> >>>> +
> >>>> +       guard(mutex)(&ctx->lock);
> >>>> +
> >>>> +       /* Find the a QUEUED request. */
> >>>
> >>> Is it _a_ or _the_?
> >>>
> >>>> +       idr_for_each_entry(&ctx->reqs_idr, ureq, id)
> >>>> +               if (ureq->state =3D=3D QCOM_TEE_REQ_QUEUED)
> >>>> +                       break;
> >>>
> >>> Will this always result in a FIFO processing?
> >>>
> >>
> >> It not a FIFO. I understand your concerns.
> >> I'll replace it with a list.
> >>
> >>>> +
> >>>> +       if (!ureq)
> >>>> +               return NULL;
> >>>> +
> >>>> +       u =3D ureq->args;
> >>>> +       /* (1) Is there enough TEE parameters? */
> >>>> +       if (num_params < qcom_tee_args_len(u))
> >>>> +               return ERR_PTR(-EINVAL);
> >>>> +
> >>>> +       /* (2) Is there enough space to pass input buffers? */
> >>>> +       qcom_tee_arg_for_each_input_buffer(i, u) {
> >>>> +               ubuf_size =3D size_sub(ubuf_size, u[i].b.size);
> >>>> +               if (ubuf_size =3D=3D SIZE_MAX)
> >>>> +                       return ERR_PTR(-EINVAL);
> >>>> +
> >>>> +               ubuf_size =3D round_down(ubuf_size, 8);
> >>>> +       }
> >>>> +
> >>>> +       /* Ready to process request 'QUEUED -> PROCESSING'. */
> >>>> +       ureq->state =3D QCOM_TEE_REQ_PROCESSING;
> >>>> +
> >>>> +       return ureq;
> >>>> +}
> >>>> +
> >>>> +/* User object dispatcher. */
> >>>> +static int qcom_tee_user_object_dispatch(struct qcom_tee_object_inv=
oke_ctx *oic,
> >>>> +                                        struct qcom_tee_object *obj=
ect, u32 op,
> >>>> +                                        struct qcom_tee_arg *args)
> >>>> +{
> >>>> +       struct qcom_tee_user_object *uo =3D to_qcom_tee_user_object(=
object);
> >>>> +       struct qcom_tee_user_req *ureq __free(kfree);
> >>>> +       struct qcom_tee_context *ctx =3D uo->ctx;
> >>>> +       int errno;
> >>>> +
> >>>> +       ureq =3D kzalloc(sizeof(*ureq), GFP_KERNEL);
> >>>> +       if (!ureq)
> >>>> +               return -ENOMEM;
> >>>> +
> >>>> +       init_completion(&ureq->c);
> >>>> +       ureq->object_id =3D uo->object_id;
> >>>> +       ureq->op =3D op;
> >>>> +       ureq->args =3D args;
> >>>> +
> >>>> +       /* Queue the request. */
> >>>> +       if (qcom_tee_request_enqueue(ureq, ctx))
> >>>> +               return -ENODEV;
> >>>> +
> >>>> +       /* Wakeup supplicant to process it. */
> >>>> +       complete(&ctx->req_c);
> >>>> +
> >>>> +       /* Wait for supplicant to process the request. */
> >>>> +       /* Supplicant is expected to process request in a timely man=
ner. We wait as KILLABLE,
> >>>
> >>> requests
> >>>
> >>>> +        * in case supplicant and invoke thread both running from a =
same user process, otherwise
> >>>
> >>> the same
> >>>
> >>>> +        * the process stuck on fatal signal.
> >>>
> >>> might get stuck on a fatal signal?
> >>>
> >>>> +        */
> >>>
> >>> Please combine into one comment.
> >>>
> >>
> >> Ack.
> >>
> >>>> +       if (!wait_for_completion_state(&ureq->c, TASK_KILLABLE | TAS=
K_FREEZABLE)) {
> >>>> +               errno =3D ureq->errno;
> >>>> +               /* On SUCCESS, end_cb_notify frees the request. */
> >>>> +               if (!errno)
> >>>> +                       oic->data =3D no_free_ptr(ureq);
> >>>> +       } else {
> >>>> +               enum qcom_tee_req_state prev_state;
> >>>> +
> >>>> +               errno =3D -ENODEV;
> >>>> +
> >>>> +               scoped_guard(mutex, &ctx->lock) {
> >>>> +                       prev_state =3D ureq->state;
> >>>> +                       /* Replace ureq with '__empty_ureq' to keep =
req_id reserved. */
> >>>> +                       if (prev_state =3D=3D QCOM_TEE_REQ_PROCESSIN=
G)
> >>>> +                               idr_replace(&ctx->reqs_idr, &__empty=
_ureq, ureq->req_id);
> >>>> +                       /* Remove ureq as supplicant has never seen =
this request. */
> >>>> +                       else if (prev_state =3D=3D QCOM_TEE_REQ_QUEU=
ED)
> >>>> +                               idr_remove(&ctx->reqs_idr, ureq->req=
_id);
> >>>> +               }
> >>>> +
> >>>> +               /* Wait for exclusive access to ureq. */
> >>>> +               synchronize_srcu(&ctx->req_srcu);
> >>>
> >>> I'm sorry, I don't follow.
> >>>
> >>
> >> I'll try to compare it to the optee.
> >>
> >> In optee, clients and the supplicant run in two different contexts. If=
 the
> >> supplicant is available, the client will wait for it to finish process=
ing
> >> the queued request. The supplicant is guaranteed to be timely and resp=
onsive.
> >
> > Yeah, or at least trusted to be timely and responsive.
> >
> >>
> >> In QCOMTEE:
> >>
> >>   1. There are multiple supplicants. Any process that implements a cal=
lback
> >>      object is considered a supplicant. The general assumption of time=
liness
> >>      or responsiveness may not apply. We allow the client to at least =
receive fatal
> >>      signals (this design can be extended later if a timeout is requir=
ed).
> >>
> >>   2. A client can implement a callback object and act as both a client=
 and
> >>      a supplicant simultaneously. To terminate such a process, we need=
 to be
> >>      able to accept fatal signals.
> >
> > We accept tee-supplicant to be killed so this is similar.
> >
>
> True, the tee-supplicant can be terminated, but the client cannot be if i=
t's
> waiting for a trusted supplicant response. That's reasonable.
>
> However, in qcomtee, both the client and supplicant can be threads within
> a single process. If the process is killed, the supplicant thread can
> go away, leaving the client stuck waiting. Therefore, in qcomtee, the
> client also needs to be killable.

Got it, thanks.

>
> >>
> >> srcu is specifically used to protect the args array. After returning f=
rom
> >> qcom_tee_user_object_dispatch, the args array might not be valid. We n=
eed to
> >> ensure no one is accessing the args array before the retun, hence sync=
hronize_srcu.
> >> Whenever we read the contents of args, we do it within an srcu read lo=
ck.
> >>
> >> For example, qcomtee_user_object_pop, which picks a request for the su=
pplicant
> >> to process, will hold the srcu read lock when marshaling the args arra=
y
> >> to the TEE subsystem's params array.
> >>
> >> An alternative to the srcu would be to use "context lock" ctx->lock an=
d
> >> hold it throughout the qcomtee_user_object_pop function, even when mar=
shaling
> >> the args array to the TEE subsystem's params array.
> >>
> >> Using ctx->lock is easier to follow, but since it's shared by everyone=
 in
> >> a context and marshaling can be heavy depending on the type of objects=
,
> >> I thought srcu would be more performant.
> >>
> >> In other words, srcu just moves the marshaling of objects outside of c=
tx->lock.
> >> What do you think about keeping srcu or replacing it with ctx->lock?
> >
> > Let's continue the comparison with OP-TEE where struct optee_supp_req
> > plays the role of struct qcom_tee_user_req in QCOMTEE. You can say that
> > access rights to the optee_supp_req follows with the owner. The
> > supp->mutex is in principle only held while changing owner. Couldn't th=
e
> > ctx->lock be used in a similar way, avoiding it while marshalling
> > objects?
> >
>
> True, but there's a corner case due to the TASK_KILLABLE flag.
>
> In optee, when a request is placed in the "supplicant queue" supp->reqs
> (passing the access right to the supplicant), the client won't touch the =
request
> until notified by the supplicant.
>
> In qcomtee, besides the notification from the supplicant, we also accept
> fatal signals. This causes the client to access the request without any
> notification from supplicant, violating the exclusive access assumption.
>
>
> > I'm open to be persuaded if you think that srcu is a better choice.
> >
>
> The use of the srcu was not for correctness, and purely for the sake of
> performance. Most of our internal tests are micro tests for the API at
> the moment, so I do not have any number to support the argument :(.
>
> I can stick to the ctx->lock and add srcu later if necessary when e2e
> tests are active and I can collect some numbers? What do you think?

That's a good approach. :-)

Cheers,
Jens

>
> Best Regards,
> Amir
>
> > Cheers,
> > Jens

