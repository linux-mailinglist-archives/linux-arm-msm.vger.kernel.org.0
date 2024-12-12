Return-Path: <linux-arm-msm+bounces-41607-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DC39EDC6A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 01:19:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 74B36283132
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 00:19:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7620C5684;
	Thu, 12 Dec 2024 00:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mNq6JrRq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E9C1DFFD;
	Thu, 12 Dec 2024 00:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733962792; cv=none; b=DWw0n86/OSRi/2TXCi5llEENnGldyk6Ql8sxVeaGSTSHoZ+DL0v/Jvx0ltDVst2QcWNFxuGrkVlO1XK0rqd4Rp9QxRwMK43VgaFxFPJsfHu3QonL2DZ+oPeYbYM95A4McZ/XpuE2Zp485bZfgzq178m9sAa8qcz7kNBZHJKnZpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733962792; c=relaxed/simple;
	bh=qyK4VJ3E3GdBPOf+rl4Le973E5s8yeXWdjr7tMI/SF8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Tw+Q5qXl9b0OwmKCkDOP70Y1+KH/cC/x1pTBEWrfi2ErkmmjF6FVfAIvl3FUUpdVg0lGlYOVrzSKf9QTv5UDM69vIsKfrh7SJ9X+P8HwE++JXySjJr01ru0hSKBxUtW4vOEFoLIVdbgMghLWMxnZYRc9PSbRuPEBhaEvh/1XzqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mNq6JrRq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BBHDIoM015261;
	Thu, 12 Dec 2024 00:19:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y6cZaIRscbJnFlOFVpzjsz7l1EwRnqmS4xDm30iztF4=; b=mNq6JrRqbVsKcDvp
	NbHn+nva4jmNycGwPaImLqqh6G1IVPnpMm3wz/qf+OEbUGJ+gRoPfhg1oGIYHbNG
	i+4s4+jdNf4VNWT6ZFMFdFgXdc+qjt4S/zDD9ESbk6oGfBB8zdpa6I2QCdajZwKm
	sd1wlTJwU/mjKkeiUcHWyL1SoJxFeNDLpKT6zE0mow96qjJ9s9dZeHbYSfhVhoyg
	OzZCQVXNfOa33mBxABHjbUqbyOM1WLGg0ClflgKD1449ubJghrlCaKEtX/NsR+Tn
	pAfDUuXnft6/d/THEXyjmNGZtBaHyFl3ViV/bSMoH7WZ2u1r0WPge4VeHNXXA8aU
	pwCj0g==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43f7dpje7u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 00:19:43 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BC0Jgqw030209
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 00:19:42 GMT
Received: from [10.4.85.7] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 11 Dec
 2024 16:19:39 -0800
Message-ID: <65f730f4-5733-46ef-9f32-d557b842f5c0@quicinc.com>
Date: Thu, 12 Dec 2024 11:19:37 +1100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/10] tee: add Qualcomm TEE driver
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Sumit Garg <sumit.garg@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <op-tee@lists.trustedfirmware.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-doc@vger.kernel.org>
References: <20241202-qcom-tee-using-tee-ss-without-mem-obj-v1-0-f502ef01e016@quicinc.com>
 <20241202-qcom-tee-using-tee-ss-without-mem-obj-v1-8-f502ef01e016@quicinc.com>
 <CAHUa44GqyaouPquw+DE1ASRwVOBw5xDstcpaNpmLmQbXmp6CuQ@mail.gmail.com>
 <62f80fb7-ea13-4ae1-a438-8d6b2d5a2f15@quicinc.com>
 <20241211140459.GA471738@rayden>
Content-Language: en-US
From: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
In-Reply-To: <20241211140459.GA471738@rayden>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 4MIDos4AS0OG9kk-WHIsZh3vpID23xFP
X-Proofpoint-ORIG-GUID: 4MIDos4AS0OG9kk-WHIsZh3vpID23xFP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 clxscore=1015
 mlxlogscore=999 mlxscore=0 adultscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120000

Hi Jens,

On 12/12/2024 1:04 AM, Jens Wiklander wrote:
> Hi Amirreza,
> 
> On Wed, Dec 11, 2024 at 01:30:22PM +1100, Amirreza Zarrabi wrote:
> [snip]
>>>> +/**
>>>> + * struct qcom_tee_context - Clients or supplicants context.
>>>> + * @tee_context: TEE context.
>>>> + * @qtee_objects_idr: QTEE objects in this context.
>>>> + * @reqs_idr: Requests currently being processed.
>>>> + * @lock: mutex for @reqs_idr and @qtee_objects_idr.
>>>> + * @req_srcu: srcu for exclusive access to requests.
>>>> + * @req_c: completion used when supplicant is waiting for requests.
>>>> + * @released: state of this context.
>>>> + * @ref_cnt: ref count.
>>>> + */
>>>> +struct qcom_tee_context {
>>>
>>> Other drivers call their conterpart of this struct *_context_data.
>>> Using the same pattern here makes it easier to recognize the struct in
>>> the rest of the code.
>>>
>>
>> Ack.
>>
>>>> +       struct tee_context *tee_context;
>>>> +
>>>> +       struct idr qtee_objects_idr;
>>>> +       struct idr reqs_idr;
>>>> +       /* Synchronize access to @reqs_idr, @qtee_objects_idr and updating requests state. */
>>>> +       struct mutex lock;
>>>> +       struct srcu_struct req_srcu;
>>>
>>> Why do you use this synchronization primitive? I don't know enough
>>> about this primitive to tell if you use it for the right purpose so
>>> perhaps you can help me understand which properties you need.
>>>
>>
>> Sure, let me explain it bellow in the qcom_tee_user_object_dispatch,
>> where it is acually used.
>>
>>>> +       struct completion req_c;
>>>> +
>>>> +       int released;
>>>> +
>>>> +       struct kref ref_cnt;
>>>
>>> Why does this struct need a different lifetime than struct tee_context?
>>>
>>
>> This is a side effect of how QTEE objects and callback objects are released:
>>
>>   - When a tee_context is closed, we release all QTEE objects in that context.
>>     QTEE specifies that object releases are asynchronous. So, we queue the
>>     releases in a workqueue and immediately return from the release callback,
>>     allowing the TEE subsystem to continue.
>>
>>   - When the workqueue sends a release for a QTEE object, QTEE may respond
>>     by requesting the release of a callback object or an operation on a callback
>>     object. This requires a valid struct qcom_tee_context. That's why we keep this
>>     until all callback objects are gone.
>>
>> The alternative is to keep a list of callback objects in this context and
>> flag them as orphans. The refcount seems easier :).
> 
> It would be even easier if it was already dealt with by the TEE
> subsystem. :-)
> 
> It looks like we have the same problem as with the tee_shm objects when
> the tee_context should go away. Would it work to add another callback,
> close_contex(), to tee_driver_ops to be called from
> teedev_close_context()? The release() callback would still be called as
> usual when the last reference is gone, but the backend TEE driver would
> get a notification earlier with core_contex() that it's time to start
> releasing resources.
> 

Yes, it works.

This proposal is similar to our original discussion about adding a
shutdown() callback along with release(). With this change, we can also drop [1].

It seems like the easiest solution. I'll add close_context().

[1] https://lore.kernel.org/all/20241120-fix-tee_shm-refcount-upstream-v1-0-5da97f584fcd@quicinc.com/

> [snip]
>>>> +/**
>>>> + * qcom_tee_supp_pop_entry() - Pop the next request in a context.
>>>
>>> When you pop something you'd expect it to be removed also.
>>>
>>
>> I'll rename it to more apporpriate name.
>>
>>>> + * @ctx: context from which to pop a request.
>>>> + * @ubuf_size: size of available buffer for MEMBUF parameters.
>>>> + * @num_params: number of entries for TEE parameter array.
>>>> + *
>>>> + * It does not remove the request from &qcom_tee_context.reqs_idr.
>>>> + * It checks if @num_params is large enough to fit the next request arguments.
>>>> + * It checks if @ubuf_size is large enough to fit IB buffer arguments from QTEE.
>>>> + * It updates request state to %QCOM_TEE_REQ_PROCESSING state.
>>>> + *
>>>> + * Return: On success return a request or NULL and ERR_PTR on failure.
>>>> + */
>>>> +static struct qcom_tee_user_req *qcom_tee_supp_pop_entry(struct qcom_tee_context *ctx,
>>>> +                                                        size_t ubuf_size, int num_params)
>>>> +{
>>>> +       struct qcom_tee_user_req *ureq;
>>>> +       struct qcom_tee_arg *u;
>>>> +       int i, id;
>>>> +
>>>> +       guard(mutex)(&ctx->lock);
>>>> +
>>>> +       /* Find the a QUEUED request. */
>>>
>>> Is it _a_ or _the_?
>>>
>>>> +       idr_for_each_entry(&ctx->reqs_idr, ureq, id)
>>>> +               if (ureq->state == QCOM_TEE_REQ_QUEUED)
>>>> +                       break;
>>>
>>> Will this always result in a FIFO processing?
>>>
>>
>> It not a FIFO. I understand your concerns.
>> I'll replace it with a list.
>>
>>>> +
>>>> +       if (!ureq)
>>>> +               return NULL;
>>>> +
>>>> +       u = ureq->args;
>>>> +       /* (1) Is there enough TEE parameters? */
>>>> +       if (num_params < qcom_tee_args_len(u))
>>>> +               return ERR_PTR(-EINVAL);
>>>> +
>>>> +       /* (2) Is there enough space to pass input buffers? */
>>>> +       qcom_tee_arg_for_each_input_buffer(i, u) {
>>>> +               ubuf_size = size_sub(ubuf_size, u[i].b.size);
>>>> +               if (ubuf_size == SIZE_MAX)
>>>> +                       return ERR_PTR(-EINVAL);
>>>> +
>>>> +               ubuf_size = round_down(ubuf_size, 8);
>>>> +       }
>>>> +
>>>> +       /* Ready to process request 'QUEUED -> PROCESSING'. */
>>>> +       ureq->state = QCOM_TEE_REQ_PROCESSING;
>>>> +
>>>> +       return ureq;
>>>> +}
>>>> +
>>>> +/* User object dispatcher. */
>>>> +static int qcom_tee_user_object_dispatch(struct qcom_tee_object_invoke_ctx *oic,
>>>> +                                        struct qcom_tee_object *object, u32 op,
>>>> +                                        struct qcom_tee_arg *args)
>>>> +{
>>>> +       struct qcom_tee_user_object *uo = to_qcom_tee_user_object(object);
>>>> +       struct qcom_tee_user_req *ureq __free(kfree);
>>>> +       struct qcom_tee_context *ctx = uo->ctx;
>>>> +       int errno;
>>>> +
>>>> +       ureq = kzalloc(sizeof(*ureq), GFP_KERNEL);
>>>> +       if (!ureq)
>>>> +               return -ENOMEM;
>>>> +
>>>> +       init_completion(&ureq->c);
>>>> +       ureq->object_id = uo->object_id;
>>>> +       ureq->op = op;
>>>> +       ureq->args = args;
>>>> +
>>>> +       /* Queue the request. */
>>>> +       if (qcom_tee_request_enqueue(ureq, ctx))
>>>> +               return -ENODEV;
>>>> +
>>>> +       /* Wakeup supplicant to process it. */
>>>> +       complete(&ctx->req_c);
>>>> +
>>>> +       /* Wait for supplicant to process the request. */
>>>> +       /* Supplicant is expected to process request in a timely manner. We wait as KILLABLE,
>>>
>>> requests
>>>
>>>> +        * in case supplicant and invoke thread both running from a same user process, otherwise
>>>
>>> the same
>>>
>>>> +        * the process stuck on fatal signal.
>>>
>>> might get stuck on a fatal signal?
>>>
>>>> +        */
>>>
>>> Please combine into one comment.
>>>
>>
>> Ack.
>>
>>>> +       if (!wait_for_completion_state(&ureq->c, TASK_KILLABLE | TASK_FREEZABLE)) {
>>>> +               errno = ureq->errno;
>>>> +               /* On SUCCESS, end_cb_notify frees the request. */
>>>> +               if (!errno)
>>>> +                       oic->data = no_free_ptr(ureq);
>>>> +       } else {
>>>> +               enum qcom_tee_req_state prev_state;
>>>> +
>>>> +               errno = -ENODEV;
>>>> +
>>>> +               scoped_guard(mutex, &ctx->lock) {
>>>> +                       prev_state = ureq->state;
>>>> +                       /* Replace ureq with '__empty_ureq' to keep req_id reserved. */
>>>> +                       if (prev_state == QCOM_TEE_REQ_PROCESSING)
>>>> +                               idr_replace(&ctx->reqs_idr, &__empty_ureq, ureq->req_id);
>>>> +                       /* Remove ureq as supplicant has never seen this request. */
>>>> +                       else if (prev_state == QCOM_TEE_REQ_QUEUED)
>>>> +                               idr_remove(&ctx->reqs_idr, ureq->req_id);
>>>> +               }
>>>> +
>>>> +               /* Wait for exclusive access to ureq. */
>>>> +               synchronize_srcu(&ctx->req_srcu);
>>>
>>> I'm sorry, I don't follow.
>>>
>>
>> I'll try to compare it to the optee.
>>
>> In optee, clients and the supplicant run in two different contexts. If the
>> supplicant is available, the client will wait for it to finish processing
>> the queued request. The supplicant is guaranteed to be timely and responsive.
> 
> Yeah, or at least trusted to be timely and responsive.
> 
>>
>> In QCOMTEE:
>>
>>   1. There are multiple supplicants. Any process that implements a callback
>>      object is considered a supplicant. The general assumption of timeliness
>>      or responsiveness may not apply. We allow the client to at least receive fatal
>>      signals (this design can be extended later if a timeout is required).
>>
>>   2. A client can implement a callback object and act as both a client and
>>      a supplicant simultaneously. To terminate such a process, we need to be
>>      able to accept fatal signals.
> 
> We accept tee-supplicant to be killed so this is similar.
> 

True, the tee-supplicant can be terminated, but the client cannot be if it's
waiting for a trusted supplicant response. That's reasonable.

However, in qcomtee, both the client and supplicant can be threads within
a single process. If the process is killed, the supplicant thread can
go away, leaving the client stuck waiting. Therefore, in qcomtee, the
client also needs to be killable.

>>
>> srcu is specifically used to protect the args array. After returning from
>> qcom_tee_user_object_dispatch, the args array might not be valid. We need to
>> ensure no one is accessing the args array before the retun, hence synchronize_srcu.
>> Whenever we read the contents of args, we do it within an srcu read lock.
>>
>> For example, qcomtee_user_object_pop, which picks a request for the supplicant
>> to process, will hold the srcu read lock when marshaling the args array
>> to the TEE subsystem's params array.
>>
>> An alternative to the srcu would be to use "context lock" ctx->lock and
>> hold it throughout the qcomtee_user_object_pop function, even when marshaling
>> the args array to the TEE subsystem's params array.
>>
>> Using ctx->lock is easier to follow, but since it's shared by everyone in
>> a context and marshaling can be heavy depending on the type of objects,
>> I thought srcu would be more performant.
>>
>> In other words, srcu just moves the marshaling of objects outside of ctx->lock.
>> What do you think about keeping srcu or replacing it with ctx->lock?
> 
> Let's continue the comparison with OP-TEE where struct optee_supp_req
> plays the role of struct qcom_tee_user_req in QCOMTEE. You can say that
> access rights to the optee_supp_req follows with the owner. The
> supp->mutex is in principle only held while changing owner. Couldn't the
> ctx->lock be used in a similar way, avoiding it while marshalling
> objects?
> 

True, but there's a corner case due to the TASK_KILLABLE flag.

In optee, when a request is placed in the "supplicant queue" supp->reqs
(passing the access right to the supplicant), the client won't touch the request
until notified by the supplicant.

In qcomtee, besides the notification from the supplicant, we also accept
fatal signals. This causes the client to access the request without any
notification from supplicant, violating the exclusive access assumption.


> I'm open to be persuaded if you think that srcu is a better choice.
> 

The use of the srcu was not for correctness, and purely for the sake of
performance. Most of our internal tests are micro tests for the API at
the moment, so I do not have any number to support the argument :(.

I can stick to the ctx->lock and add srcu later if necessary when e2e
tests are active and I can collect some numbers? What do you think?

Best Regards,
Amir

> Cheers,
> Jens

