Return-Path: <linux-arm-msm+bounces-39365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8E59DAEBC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 22:03:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F062DB21DF3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 21:03:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49A881FCFCC;
	Wed, 27 Nov 2024 21:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pvPh+oe4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C848F140E38;
	Wed, 27 Nov 2024 21:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732741384; cv=none; b=U01aTGaNfsjRlNv0bjgvB+9bYWguAYvbWtOUgQ2wf1H1wBM9xxYQMfBRrb/YqNCH9B/4KR/KPI+QyjaoNZfgcGQkKHonZVIOLjJ3GTa6TFDD/N4ST45bkz2G4q0DcUpaVTXpcG7ed3iSbikib/5X94vlK8Q+dZxwZFd90FVXafM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732741384; c=relaxed/simple;
	bh=GvUdTHxJipZn+sEDJsCW/N36fFdUb9Qtw6jz3NDFIbo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JRgeD2YcpABHfwV26asMO/GVrNTIYZM7OLoATbKV+oKPoUKIRNxcGEwHjMt9hUomf6nELDrM39yxIsEGrYswI3EtiDB3PJkSx9qLK9JKSDynXKyDXa4Jms3W9WrqvWMUI6QtRJIrp4wm7VZwWrYu+4Aq6wEQ+1/Tr49YsqG2yrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pvPh+oe4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ARGR72b018786;
	Wed, 27 Nov 2024 21:02:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fH2NhLjPe633eV2t13H4zqeweWay6Z/UOwyNfHETk8k=; b=pvPh+oe4thrCE8SG
	JIycFLBWY4ZIjES6HpuazxERyLh/QiXPRXLVjUoX5s5Co4/vzVFWLOT74XEH1gQE
	huQLfY8zTHb/KuIk9KxAZKCCo0XMVIJsYvbXhbWh2+9O2vMOpiR6hfJPbbg26ZiK
	byTFbxzHEieh6NH6IVxIsZ4qZIwvOydSTsIbV8m4yUBt3dL/Vmmr0gOS0AEzo1KX
	T1v7fHs2BEqAbYdVknk9ofeTR1QWgJnuoHBBLD8FpvoIgAG9VvhIvukcuTohYvzE
	kqx4smBIdCN+Prl0Tle10mOXHEHSNt75mSO1Vg546vLcTZSC6MwC9d5gY4iPGPPw
	l7pBSg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4366y00hsx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Nov 2024 21:02:59 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ARL2wTD020266
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Nov 2024 21:02:58 GMT
Received: from [10.4.85.11] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 27 Nov
 2024 13:02:56 -0800
Message-ID: <f334ae8c-2f42-4177-9d18-5274d1ec91b1@quicinc.com>
Date: Thu, 28 Nov 2024 08:02:54 +1100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 3/3] tee: introduce orphan tee_shm and default context
Content-Language: en-US
To: Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg
	<sumit.garg@linaro.org>
CC: <op-tee@lists.trustedfirmware.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
References: <20241120-fix-tee_shm-refcount-upstream-v1-0-5da97f584fcd@quicinc.com>
 <20241120-fix-tee_shm-refcount-upstream-v1-3-5da97f584fcd@quicinc.com>
 <CAHUa44Eoxa+NfRF-XCuV-O5uVgtC3UMT0utCLrUZ4rCBREp=pQ@mail.gmail.com>
 <3ab115bf-7ac6-452f-b760-0d631b6e75dd@quicinc.com>
 <CAFA6WYNBsZ5V6N676yfDgTL4jMeXtEB0xGm5zSq3BFeeCpz9Nw@mail.gmail.com>
 <a4e474c2-80b7-45db-b1a0-37950168edf0@quicinc.com>
 <CAFA6WYOvMnvdhLvgOzLMyugRLPc62pHdJEGAhhwDJHRrVxCs1Q@mail.gmail.com>
 <CAHUa44HZbODOx7N4+WiNjQwrjwo7T=bQfZ5N-EjoMmXnfC4-Lg@mail.gmail.com>
 <CAFA6WYNbvxs-KRBkBxdD7M0Z=qLkT0ODDo-4_H5ZbZxqK4va7g@mail.gmail.com>
 <1a9269cb-204a-472d-b495-ac44f36cf131@quicinc.com>
 <CAHUa44EZ2r=QRcsWfFs-ZqnTYEOpB4Ou4qpk4Y49NEPh-TTCeg@mail.gmail.com>
 <CAFA6WYPUZN752aT7+ejoiYYoLs_XNV7w9wT7kBrE=vvEJO+8_g@mail.gmail.com>
 <CAHUa44F7_yGQFJq6BsoCv6AfB_TjuiGP84YaQ-kz=_e1ni+xyA@mail.gmail.com>
 <CAFA6WYORjTjfA-QTcyuvqpBOr9uoS+KVikA2mhyfdMmh5K0tiA@mail.gmail.com>
 <CAHUa44Gh3Y9a=ci7FPibiT=hFGbn+B7iaAY1n_Q6MDYoO6PJdA@mail.gmail.com>
From: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
In-Reply-To: <CAHUa44Gh3Y9a=ci7FPibiT=hFGbn+B7iaAY1n_Q6MDYoO6PJdA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: R3ALAKcvlso29Qq3jMSfXF9srXyw-fPn
X-Proofpoint-GUID: R3ALAKcvlso29Qq3jMSfXF9srXyw-fPn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 adultscore=0 suspectscore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2411270163



On 11/27/2024 6:22 PM, Jens Wiklander wrote:
> On Wed, Nov 27, 2024 at 7:02 AM Sumit Garg <sumit.garg@linaro.org> wrote:
>>
>> On Tue, 26 Nov 2024 at 20:52, Jens Wiklander <jens.wiklander@linaro.org> wrote:
>>>
>>> On Tue, Nov 26, 2024 at 1:27 PM Sumit Garg <sumit.garg@linaro.org> wrote:
>>>>
>>>> On Tue, 26 Nov 2024 at 14:03, Jens Wiklander <jens.wiklander@linaro.org> wrote:
>>>>>
>>>>> On Mon, Nov 25, 2024 at 9:55 PM Amirreza Zarrabi
>>>>> <quic_azarrabi@quicinc.com> wrote:
>>>>>>
>>>>>>
>>>>>>
>>>>>> On 11/25/2024 6:51 PM, Sumit Garg wrote:
>>>>>>> On Mon, 25 Nov 2024 at 12:53, Jens Wiklander <jens.wiklander@linaro.org> wrote:
>>>>>>>>
>>>>>>>> On Mon, Nov 25, 2024 at 7:14 AM Sumit Garg <sumit.garg@linaro.org> wrote:
>>>>>>>>>
>>>>>>>>> On Mon, 25 Nov 2024 at 03:00, Amirreza Zarrabi
>>>>>>>>> <quic_azarrabi@quicinc.com> wrote:
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> Hi Sumit,
>>>>>>>>>>
>>>>>>>>>> Thank you so much for the comemnts :).
>>>>>>>>>>
>>>>>>>>>> On 11/23/2024 9:32 PM, Sumit Garg wrote:
>>>>>>>>>>> Hi Amirreza,
>>>>>>>>>>>
>>>>>>>>>>> Thanks for proposing this.
>>>>>>>>>>>
>>>>>>>>>>> On Fri, 22 Nov 2024 at 06:38, Amirreza Zarrabi
>>>>>>>>>>> <quic_azarrabi@quicinc.com> wrote:
>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>> On 11/21/2024 11:08 PM, Jens Wiklander wrote:
>>>>>>>>>>>>
>>>>>>>>>>>> Hi Jens,
>>>>>>>>>>>>
>>>>>>>>>>>>> Hi Amirreza,
>>>>>>>>>>>>>
>>>>>>>>>>>>> On Thu, Nov 21, 2024 at 2:37 AM Amirreza Zarrabi
>>>>>>>>>>>>> <quic_azarrabi@quicinc.com> wrote:
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> The default context has a lifespan similar to the tee_device.
>>>>>>>>>>>
>>>>>>>>>>> Since it's associated with tee_device context, let's call it obvious
>>>>>>>>>>> via renaming it as device context instead (s/def_ctx/dev_ctx/ in this
>>>>>>>>>>> patch).
>>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> Make sense, I'll rename it.
>>>>>>>>>>
>>>>>>>>>>>>>> It is used as a context for shared memory if the context to which the
>>>>>>>>>>>>>> shared memory belongs is released, making the tee_shm an orphan.
>>>>>>>>>>>>>> This allows the driver implementing shm_unregister to safely make
>>>>>>>>>>>>>> subsequent calls, such as to a supplicant if needed.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> It also enables users to free the shared memory while the driver is
>>>>>>>>>>>>>> blocked on unregister_tee_device safely.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Preferably, this should be used for all driver internal uses, using
>>>>>>>>>>>>>> teedev_get_def_context rather than calling teedev_open.
>>>>>>>>>>>
>>>>>>>>>>> Makes sense to me.
>>>>>>>>>>>
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Signed-off-by: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
>>>>>>>>>>>>>> ---
>>>>>>>>>>>>>>  drivers/tee/optee/core.c    |  2 +-
>>>>>>>>>>>>>>  drivers/tee/optee/ffa_abi.c |  2 +-
>>>>>>>>>>>>>>  drivers/tee/optee/smc_abi.c |  2 +-
>>>>>>>>>>>>>>  drivers/tee/tee_core.c      | 83 +++++++++++++++++++++++++++++----------------
>>>>>>>>>>>>>>  drivers/tee/tee_private.h   |  3 --
>>>>>>>>>>>>>>  drivers/tee/tee_shm.c       | 18 ++--------
>>>>>>>>>>>>>>  include/linux/tee_core.h    | 15 ++++++++
>>>>>>>>>>>>>>  include/linux/tee_drv.h     |  7 ----
>>>>>>>>>>>>>>  8 files changed, 73 insertions(+), 59 deletions(-)
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> diff --git a/drivers/tee/optee/core.c b/drivers/tee/optee/core.c
>>>>>>>>>>>>>> index c75fddc83576..78d43d0c8014 100644
>>>>>>>>>>>>>> --- a/drivers/tee/optee/core.c
>>>>>>>>>>>>>> +++ b/drivers/tee/optee/core.c
>>>>>>>>>>>>>> @@ -173,7 +173,7 @@ void optee_remove_common(struct optee *optee)
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>         optee_notif_uninit(optee);
>>>>>>>>>>>>>>         optee_shm_arg_cache_uninit(optee);
>>>>>>>>>>>>>> -       teedev_close_context(optee->ctx);
>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>         /*
>>>>>>>>>>>>>>          * The two devices have to be unregistered before we can free the
>>>>>>>>>>>>>>          * other resources.
>>>>>>>>>>>>>> diff --git a/drivers/tee/optee/ffa_abi.c b/drivers/tee/optee/ffa_abi.c
>>>>>>>>>>>>>> index f3af5666bb11..6ad94f0788ad 100644
>>>>>>>>>>>>>> --- a/drivers/tee/optee/ffa_abi.c
>>>>>>>>>>>>>> +++ b/drivers/tee/optee/ffa_abi.c
>>>>>>>>>>>>>> @@ -949,7 +949,7 @@ static int optee_ffa_probe(struct ffa_device *ffa_dev)
>>>>>>>>>>>>>>         optee_shm_arg_cache_init(optee, arg_cache_flags);
>>>>>>>>>>>>>>         mutex_init(&optee->rpmb_dev_mutex);
>>>>>>>>>>>>>>         ffa_dev_set_drvdata(ffa_dev, optee);
>>>>>>>>>>>>>> -       ctx = teedev_open(optee->teedev);
>>>>>>>>>>>>>> +       ctx = teedev_get_def_context(optee->teedev);
>>>>>>>>>>>>>>         if (IS_ERR(ctx)) {
>>>>>>>>>>>>>>                 rc = PTR_ERR(ctx);
>>>>>>>>>>>>>>                 goto err_rhashtable_free;
>>>>>>>>>>>>>> diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.c
>>>>>>>>>>>>>> index e9456e3e74cc..c77a3e631d04 100644
>>>>>>>>>>>>>> --- a/drivers/tee/optee/smc_abi.c
>>>>>>>>>>>>>> +++ b/drivers/tee/optee/smc_abi.c
>>>>>>>>>>>>>> @@ -1722,7 +1722,7 @@ static int optee_probe(struct platform_device *pdev)
>>>>>>>>>>>>>>         mutex_init(&optee->rpmb_dev_mutex);
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>         platform_set_drvdata(pdev, optee);
>>>>>>>>>>>>>> -       ctx = teedev_open(optee->teedev);
>>>>>>>>>>>>>> +       ctx = teedev_get_def_context(optee->teedev);
>>>>>>>>>>>>>>         if (IS_ERR(ctx)) {
>>>>>>>>>>>>>>                 rc = PTR_ERR(ctx);
>>>>>>>>>>>>>>                 goto err_supp_uninit;
>>>>>>>>>>>>>> diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
>>>>>>>>>>>>>> index 93f3b330aec8..805e1336089d 100644
>>>>>>>>>>>>>> --- a/drivers/tee/tee_core.c
>>>>>>>>>>>>>> +++ b/drivers/tee/tee_core.c
>>>>>>>>>>>>>> @@ -57,7 +57,6 @@ struct tee_context *teedev_open(struct tee_device *teedev)
>>>>>>>>>>>>>>                 goto err;
>>>>>>>>>>>>>>         }
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> -       kref_init(&ctx->refcount);
>>>>>>>>>>>>>>         ctx->teedev = teedev;
>>>>>>>>>>>>>>         INIT_LIST_HEAD(&ctx->list_shm);
>>>>>>>>>>>>>>         rc = teedev->desc->ops->open(ctx);
>>>>>>>>>>>>>> @@ -73,36 +72,43 @@ struct tee_context *teedev_open(struct tee_device *teedev)
>>>>>>>>>>>>>>  }
>>>>>>>>>>>>>>  EXPORT_SYMBOL_GPL(teedev_open);
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> -void teedev_ctx_get(struct tee_context *ctx)
>>>>>>>>>>>>>> +struct tee_context *teedev_get_def_context(struct tee_device *teedev)
>>>>>>>>>>>>>>  {
>>>>>>>>>>>>>> -       if (ctx->releasing)
>>>>>>>>>>>>>> -               return;
>>>>>>>>>>>>>> +       int rc;
>>>>>>>>>>>>>> +       struct tee_context *ctx = &teedev->def_ctx;
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> -       kref_get(&ctx->refcount);
>>>>>>>>>>>>>> -}
>>>>>>>>>>>>>> +       ctx->teedev = teedev;
>>>>>>>>>>>>>> +       INIT_LIST_HEAD(&ctx->list_shm);
>>>>>>>>>>>>>> +       rc = teedev->desc->ops->open(ctx);
>>>>>>>>>>>>>> +       if (rc)
>>>>>>>>>>>>>> +               return ERR_PTR(rc);
>>>>>>>>>>>>>
>>>>>>>>>>>>> I think ctx->teedev and ctx->list_shm must always be initialized or
>>>>>>>>>>>>> &teedev->def_ctx can't be used in teedev_close_context().
>>>>>>>>>>>>
>>>>>>>>>>>> True, but &teedev->def_ctx is never used in teedev_close_context().
>>>>>>>>>>>> The closing of the &teedev->def_ctx simply ignored. So once opened,
>>>>>>>>>>>> &teedev->def_ctx will always remain open until the tee_device is alive.
>>>>>>>>>>>>
>>>>>>>>>>>>> We could initialize teedev->def_ctx on the first call to teedev_open()
>>>>>>>>>>>>> on that tee_device. We need a way to tell the
>>>>>>>>>>>>> teedev->desc->ops->open() to the backed driver that it's initializing
>>>>>>>>>>>>> the default context though, or optee_open() can't handle the
>>>>>>>>>>>>> tee-supplicant case properly.
>>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>> That's a good point. This way, it is guaranteed that there is one def_ctx
>>>>>>>>>>>> per teedev. There should be a way to tell the open() callback that it is
>>>>>>>>>>>> a def_ctx, so it is not registered as a supplicant context.
>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>>> Should we allow this function to be called more than once for each teedev?
>>>>>>>>>>>>
>>>>>>>>>>>> Yes, moving to teedev_open() will fix the issue.
>>>>>>>>>>>>
>>>>>>>>>>>>> Do we need serialization in this function if it's called after the
>>>>>>>>>>>>> driver is probed?
>>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>> True. I'll make sure there is no race.
>>>>>>>>>>>>
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> -static void teedev_ctx_release(struct kref *ref)
>>>>>>>>>>>>>> -{
>>>>>>>>>>>>>> -       struct tee_context *ctx = container_of(ref, struct tee_context,
>>>>>>>>>>>>>> -                                              refcount);
>>>>>>>>>>>>>> -       ctx->releasing = true;
>>>>>>>>>>>>>> -       ctx->teedev->desc->ops->release(ctx);
>>>>>>>>>>>>>> -       kfree(ctx);
>>>>>>>>>>>>>> +       return ctx;
>>>>>>>>>>>>>>  }
>>>>>>>>>>>>>> +EXPORT_SYMBOL_GPL(teedev_get_def_context);
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> -void teedev_ctx_put(struct tee_context *ctx)
>>>>>>>>>>>>>> +void teedev_close_context(struct tee_context *ctx)
>>>>>>>>>>>>>>  {
>>>>>>>>>>>>>> -       if (ctx->releasing)
>>>>>>>>>>>>>> +       struct tee_device *teedev = ctx->teedev;
>>>>>>>>>>>>>> +       struct tee_shm *shm;
>>>>>>>>>>>>>> +
>>>>>>>>>>>>>> +       if (ctx == &teedev->def_ctx)
>>>>>>>>>>>>>>                 return;
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> -       kref_put(&ctx->refcount, teedev_ctx_release);
>>>>>>>>>>>>>> -}
>>>>>>>>>>>>>> +       teedev->desc->ops->release(ctx);
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> -void teedev_close_context(struct tee_context *ctx)
>>>>>>>>>>>>>> -{
>>>>>>>>>>>>>> -       struct tee_device *teedev = ctx->teedev;
>>>>>>>>>>>>>> +       mutex_lock(&teedev->mutex);
>>>>>>>>>>>>>> +       list_for_each_entry(shm, &ctx->list_shm, link) {
>>>>>>>>>>>>>> +               /* Context released. However, shm still holding a teedev reference.
>>>>>>>>>>>>>> +                * Replace shm->ctx with the default context so that tee_shm_get_from_id()
>>>>>>>>>>>>>> +                * fails (i.e. it is not accessible from userspace) but shm still
>>>>>>>>>>>>>> +                * holds a valid context for further clean up, e.g. shm_unregister().
>>>>>>>>>>>>>> +                */
>>>>>>>>>>>>>
>>>>>>>>>>>>> /*
>>>>>>>>>>>>>  * Please format
>>>>>>>>>>>>>  * multiline comments
>>>>>>>>>>>>>  * like this. Please
>>>>>>>>>>>>>  * keep the lines at
>>>>>>>>>>>>>  * max 80 columns
>>>>>>>>>>>>>  * here and at other
>>>>>>>>>>>>>  * places in the patch-
>>>>>>>>>>>>>  * set.
>>>>>>>>>>>>>  */
>>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>> Ack.
>>>>>>>>>>>>
>>>>>>>>>>>>>> +               shm->ctx = &teedev->def_ctx;
>>>>>>>>>>>>>
>>>>>>>>>>>>> shm->ctx will always point to a valid context, even if it is the
>>>>>>>>>>>>> default context. It seems that we can always get hold of the correct
>>>>>>>>>>>>> teedev via shm->ctx->teedev. Do we need "tee: revert removal of
>>>>>>>>>>>>> redundant teedev in struct tee_shm"?
>>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>> It was there in case we wanted to use NULL, but with def_ctx, it is not
>>>>>>>>>>>> necessary. I am withdrawing that commit. :).
>>>>>>>>>>>>
>>>>>>>>>>>>> Shouldn't the shm be removed from the ctx->list_shm and be moved to
>>>>>>>>>>>>> teedev->def_ctx.list_shm?
>>>>>>>>>>>
>>>>>>>>>>> +1
>>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> Ack.
>>>>>>>>>>
>>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>> Not really. If we put shm in the teedev->def_ctx.list_shm, by the time
>>>>>>>>>>>> we are closing the def_ctx, the list is guaranteed to be empty.
>>>>>>>>>>>>
>>>>>>>>>>>> However, I understand it is cleaner and more consistent to do that rather
>>>>>>>>>>>> than making changes to tee_shm_put().
>>>>>>>>>>>>
>>>>>>>>>>>> I'll do it.
>>>>>>>>>>>>
>>>>>>>>>>>>>> +       }
>>>>>>>>>>>>>> +       mutex_unlock(&teedev->mutex);
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> -       teedev_ctx_put(ctx);
>>>>>>>>>>>>>> +       kfree(ctx);
>>>>>>>>>>>>>>         tee_device_put(teedev);
>>>>>>>>>>>>>>  }
>>>>>>>>>>>>>>  EXPORT_SYMBOL_GPL(teedev_close_context);
>>>>>>>>>>>>>> @@ -946,6 +952,8 @@ struct tee_device *tee_device_alloc(const struct tee_desc *teedesc,
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>         teedev->desc = teedesc;
>>>>>>>>>>>>>>         teedev->pool = pool;
>>>>>>>>>>>>>> +       /* Only open default context when teedev_get_def_context() called. */
>>>>>>>>>>>>>> +       teedev->def_ctx.teedev = NULL;
>>>>>>>>>>>
>>>>>>>>>>> Why don't you open the device context here only? This will associate
>>>>>>>>>>> it automatically with teedev lifespan and then
>>>>>>>>>>> teedev_get_def_context() will just return a reference to that.
>>>>>>>>>>>
>>>>>>>>>>> -Sumit
>>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> So my assumption is that the tee_devic_alloc() is called as part of
>>>>>>>>>> the driver initialization; there is no guarantee that at this time the
>>>>>>>>>> driver is actually ready to accept any open() callback.
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> The drivers should be able to handle open() callback since we already
>>>>>>>>> check for !teedesc->ops->open in the beginning of tee_devic_alloc().
>>>>>>>>> Also, we need to open a device context for !TEE_DESC_PRIVILEGED such
>>>>>>>>> that we don't open a supplicant device context there.
>>>>>>>>
>>>>>>>> It would be nice to have the device context fully initialized when the
>>>>>>>> probe function returns. How about adding a "bool is_dev_ctx" to struct
>>>>>>>> tee_context so the open() callback can tell that this is a special
>>>>>>>> tee_contex?
>>>>>>>
>>>>>>> Sure, that will be useful to distinguish the device context from
>>>>>>> normal client context.
>>>>>>>
>>>>>>> -Sumit
>>>>>>>
>>>>>>
>>>>>> So, as far as the open() callback, I do not believe checking if it is not null
>>>>>> is reasonable for calling it here. Most drivers allocate resources and then
>>>>>> initialize them. So, assume these steps for a TEE driver:
>>>>>>  (1) allocate internal data structures,
>>>>>>  (2) allocate the device,
>>>>>>  (3) initialize the internal data structurse and then
>>>>>>  (4) register the device.
>>>>>>
>>>>>> Having these steps for a backend driver means that if you call open() at
>>>>>> step (2), the internal data structures are not ready.
>>>>
>>>> As part of tee_device_alloc(), every driver has to pass "const struct
>>>> tee_desc *teedesc" fully initialized. Which internal data structures
>>>> are you referring too? Is there any upstream example?
>>>
>>> It's reasonable to wait with the open() callback until step 4 above,
>>> which should correspond with the tee_device_register() call. Data
>>> written only once doesn't need serialized access if the fields are
>>> only accessed after they have been fully initialized.
>>
>> Fair enough, I can live with the device context opened after registering it.
>>
>>>
>>>>
>>>>>>
>>>>>> I was originally thinking of going with Jens' suggestion to open dev_ctx in
>>>>>> the teedev_open(), and use a flag to distinguish the type of context for
>>>>>> the open() callback
>>>>>>
>>>>>> What about this:
>>>>>> Open the dev_ctx in the tee_device_register(), at the last step before
>>>>>> setting the TEE_DEVICE_FLAG_REGISTERED flag. Then the open() callback can
>>>>>> check for this flag to determine if it is a normal context or dev_ctx.
>>>>>> If the open() is called while the device has not been registered, it should
>>>>>> handle it differently
>>>>>
>>>>> That makes sense, the driver should be prepared to handle open() calls
>>>>> after tee_device_register() anyway.
>>>>> However, there is no serialization of the flags field in struct
>>>>> tee_device. Hmm, would it be too hacky for the open() callback to
>>>>> check if &ctx->teedev.dev_ctx == ctx? We could add a helper function
>>>>> to wrap that check.
>>>>>
>>>>
>>>> Your suggested change requires every driver to update open() callback
>>>> and later other callbacks may have to support it too. IMHO, only
>>>> teedev_get_dev_ctx() should be able to return a reference to device
>>>> context for usage within the TEE and the implementation driver.
>>>
>>> Yes, but it's only the OP-TEE driver that needs anything special. It
>>> looks like the others can be left unchanged.
>>
>> I suppose it's most likely the upcoming QTEE driver requiring it.
>>
>>>
>>>>
>>>> I am still not able to understand why the following won't work with a
>>>> clear lifetime for the device context?
>>>>
>>>> tee_device_alloc()
>>>>   -> if (!(teedesc->flags & TEE_DESC_PRIVILEGED))
>>>> desc->ops->open(&teedev->dev_ctx);
>>>
>>> We must also have a fully initialized dev_ctx for the supplicant
>>> device.
>>
>> Currently I only see following for OP-TEE driver:
>>
>> ctx = teedev_open(optee->teedev);
>>
>> And I can't see anything like below:
>>
>> ctx = teedev_open(optee->supp_teedev);
>>
>> Where do you think that the dev_ctx is required for a supplicant
>> device? AFAICS, currently opening a context with the supplicant device
>> means that the supplicant daemon is available to handle RPCs which
>> won't be possible during OP-TEE driver probe. Am I missing something?
> 
> One reason for initializing dev_ctx for all tee_devices is in
> teedev_close_context(), where the tee_shms still active are
> transferred to dev_ctx. The teedev member was re-introduced in this
> patch set, but it can be removed again if we can depend on the dev_ctx
> to always be available in teedev_close_context(). Even the
> tee-supplicant may close its tee_context with active tee_shms at some
> point. It might be possible to use half-baked dev_ctx, but then we'd
> be burdened with keeping track of which dev_ctx can be used for what.
> We want as few special cases as possible.
> 

Additionally, Jens suggested checking something like (&ctx->teedev.dev_ctx == ctx)
in the open() callback to ensure that dev_ctx is not accidentally registered as
a supplicant context. This helps avoid the issue you're referring to.

Regards,
Amir

>>
>>> I'd rather delay the open() callback until
>>> tee_device_register() since the dev_ctx is guaranteed not to be needed
>>> before that.
>>
>> Okay, the updated call chain can look like:
>>
>> tee_device_register()
>>   -> if (!(teedev->desc->flags & TEE_DESC_PRIVILEGED))
>>          desc->ops->open(&teedev->dev_ctx);
>>>
>>>>
>>>> tee_device_put()
>>>>   -> if (teedev->dev_ctx) desc->ops->release(&teedev->dev_ctx);
>>>
>>> teedev->dev_ctx is supposed to be embedded in struct tee_device, so
>>> the if isn't needed.
>>
>> I added "if" to cover the case when dev_ctx is not initialized for the
>> supplicant device.
> 
> OK.
> 
> Cheers,
> Jens
> 
>>
>> -Sumit
>>
>>>
>>> Cheers,
>>> Jens
>>>
>>>>
>>>> -Sumit
>>>>
>>>>> Cheers,
>>>>> Jens
>>>>>
>>>>>>
>>>>>> - Amir
>>>>>>
>>>>>>>>
>>>>>>>> Cheers,
>>>>>>>> Jens
>>>>>>>>
>>>>>>>>>
>>>>>>>>> -Sumit

