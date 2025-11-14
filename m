Return-Path: <linux-arm-msm+bounces-81868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 631A2C5D393
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 14:04:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 61BA5357AE7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 13:02:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EC9F248896;
	Fri, 14 Nov 2025 13:02:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out198-6.us.a.mail.aliyun.com (out198-6.us.a.mail.aliyun.com [47.90.198.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D030730DD2E;
	Fri, 14 Nov 2025 13:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=47.90.198.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763125337; cv=none; b=m9JO/Rln88xjTqcP8pbe0PsjxL13GTwt4yPoG/FYQsffAGLgFfQcxH3hg2oEXeFyUFzwlvOiRImrHO7HIHB4DT+zHi4u7LWqsXeCtbC5Y/n9J7dh/oh0vjjHXMxjlyhdP0NP4HF7jOY7RvrJpaFE2MGW+67gLyRfwDihsl5x0gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763125337; c=relaxed/simple;
	bh=NNmNkeRMQLQnnaqEGJlolAA3EPiAfqf1lhD1zLM3Z6E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QyA0qJ3Uw4cIetYsQzqv1VjbrYAVaPzYqsxx0SJTh46G9Qumc9XiDEIV1T4vf2w9xw9gYTYcrY2jmTeOY6Cbk4bYMHehOaWmzgYQn6oPDr00qzeHNxW+bpvU11XCX9Y2W92U35oqy4FH960OMo6YG/IL2GRNRjnUs4+nmWZ9OcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=allwinnertech.com; spf=pass smtp.mailfrom=allwinnertech.com; arc=none smtp.client-ip=47.90.198.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=allwinnertech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=allwinnertech.com
Received: from 192.168.220.121(mailfrom:michael@allwinnertech.com fp:SMTPD_---.fMY0NFS_1763124967 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 14 Nov 2025 20:56:26 +0800
Message-ID: <292653ba-3836-00f1-acd4-a28b1c54388c@allwinnertech.com>
Date: Fri, 14 Nov 2025 20:56:05 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2] tee: optee: prevent use-after-free when the client
 exits before the supplicant
Content-Language: en-US
To: Jens Wiklander <jens.wiklander@linaro.org>,
 Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: Sumit Garg <sumit.garg@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
 linux-kernel@vger.kernel.org, "tkjos@google.com" <tkjos@google.com>,
 Aran Dalton <arda@allwinnertech.com>,
 liuyu <liuyu@allwinnertech.corp-partner.google.com>
References: <20250617-fix-use-after-free-v2-1-1fbfafec5917@oss.qualcomm.com>
 <CAHUa44Ew0nhw4xW_K==x-9RU9VU1YzEkOghVreae11b1H4_aGQ@mail.gmail.com>
From: Michael Wu <michael@allwinnertech.com>
In-Reply-To: <CAHUa44Ew0nhw4xW_K==x-9RU9VU1YzEkOghVreae11b1H4_aGQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,
The issue Amirreza found also occurred in our platform (ARM64, linux-6.6 
and linux-5.15):

[   67.197723]  panic+0x1b8/0x4b4
[   67.201914]  die+0x5a0/0x67c
[   67.205911]  __do_kernel_fault+0x2bc/0x310
[   67.211267]  do_bad_area+0x48/0x184
[   67.215943]  do_translation_fault+0x50/0x64
[   67.221396]  do_mem_abort+0x68/0x148
[   67.226168]  el1_abort+0x40/0x64
[   67.230553]  el1h_64_sync_handler+0x64/0xb4
[   67.236006]  el1h_64_sync+0x7c/0x80
[   67.240680]  complete+0xa4/0x170
[   67.245055]  optee_supp_send+0x190/0x198 [optee]
[   67.251026]  tee_ioctl_supp_send+0x30c/0x3f0 [tee]
[   67.257229]  tee_ioctl+0x2bc/0x9a8 [tee]
[   67.262455]  __arm64_sys_ioctl+0x184/0x20c
[   67.267813]  invoke_syscall+0x60/0x150
[   67.272780]  el0_svc_common+0xb8/0xf8
[   67.277650]  do_el0_svc+0x28/0x98
[   67.282130]  el0_svc+0x24/0x84
[   67.286321]  el0t_64_sync_handler+0x88/0xec
[   67.291774]  el0t_64_sync+0x1b8/0x1bc

Further more, we found a new issue: optee_supp_release() may run 
concurrently with optee_supp_thrd_req(), leading to the same use-after-free:

[   48.833495] Call trace:
[   48.833849]  queued_spin_lock_slowpath+0x2e8/0x488
[   48.834477]  _raw_spin_lock_irqsave+0x78/0x80
[   48.835043]  complete+0x24/0xb8
[   48.835488]  optee_supp_release+0x64/0x144 [optee 
f5ecf23907d7dbc7cb4f1540a0a71f874b10cf18]
[   48.836566]  optee_release_supp+0xcc/0xec [optee 
f5ecf23907d7dbc7cb4f1540a0a71f874b10cf18]
[   48.837590]  teedev_ctx_put+0x6c/0xc4 [tee 
1e1aeec96c1c03b65e45180ac47e5d4fde951a46]
[   48.838585]  tee_shm_put+0x190/0x228 [tee 
1e1aeec96c1c03b65e45180ac47e5d4fde951a46]
[   48.839544]  tee_shm_fop_release+0x14/0x28 [tee 
1e1aeec96c1c03b65e45180ac47e5d4fde951a46]
[   48.840575]  __fput+0x98/0x2b8
[   48.841012]  ____fput+0x10/0x20
[   48.841444]  task_work_run+0xc4/0xec
[   48.841933]  do_exit+0x2f4/0xa68
[   48.842382]  trace_android_vh_do_group_exit+0x0/0x90
[   48.843017]  get_signal+0x7bc/0x8d4
[   48.843481]  do_notify_resume+0x114/0x1da0
[   48.844026]  el0_svc+0x6c/0x94
[   48.844459]  el0t_64_sync_handler+0x68/0xbc
[   48.845004]  el0t_64_sync+0x1a8/0x1ac

Based on your work, the following patch may be needed:

@@ -46,6 +50,11 @@ void optee_supp_release(struct optee_supp *supp)
  	/* Abort all request retrieved by supplicant */
  	idr_for_each_entry(&supp->idr, req, id) {
  		idr_remove(&supp->idr, id);
+
+		/* Skip if request was already marked invalid by client */
+		if (IS_ERR(req))
+			continue;
+
  		req->ret = TEEC_ERROR_COMMUNICATION;
  		complete(&req->c);
  	}


On 6/19/2025 10:07 PM, Jens Wiklander wrote:
> Hi Amir,
> 
> On Wed, Jun 18, 2025 at 6:26 AM Amirreza Zarrabi
> <amirreza.zarrabi@oss.qualcomm.com> wrote:
>>
>> Commit 70b0d6b0a199 ("tee: optee: Fix supplicant wait loop") made the
>> client wait as killable so it can be interrupted during shutdown or
>> after a supplicant crash. This changes the original lifetime expectations:
>> the client task can now terminate while the supplicant is still processing
>> its request.
>>
>> If the client exits first it removes the request from its queue and
>> kfree()s it, while the request ID remains in supp->idr. A subsequent
>> lookup on the supplicant path then dereferences freed memory, leading to
>> a use-after-free.
>>
>> Serialise access to the request with supp->mutex:
>>
>>    * Hold supp->mutex in optee_supp_recv() and optee_supp_send() while
>>      looking up and touching the request.
>>    * Let optee_supp_thrd_req() notice that the client has terminated and
>>      signal optee_supp_send() accordingly.
>>
>> With these changes the request cannot be freed while the supplicant still
>> has a reference, eliminating the race.
>>
>> Fixes: 70b0d6b0a199 ("tee: optee: Fix supplicant wait loop")
>> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>> ---
>> Changes in v2:
>> - Replace the static variable with a sentinel value.
>> - Fix the issue with returning the popped request to the supplicant.
>> - Link to v1: https://lore.kernel.org/r/20250605-fix-use-after-free-v1-1-a70d23bff248@oss.qualcomm.com
>> ---
>>   drivers/tee/optee/supp.c | 110 ++++++++++++++++++++++++++++++++---------------
>>   1 file changed, 75 insertions(+), 35 deletions(-)
>>
>> diff --git a/drivers/tee/optee/supp.c b/drivers/tee/optee/supp.c
>> index d0f397c90242..fa39f5f226aa 100644
>> --- a/drivers/tee/optee/supp.c
>> +++ b/drivers/tee/optee/supp.c
>> @@ -9,6 +9,7 @@
>>
>>   struct optee_supp_req {
>>          struct list_head link;
>> +       int id;
>>
>>          bool in_queue;
>>          u32 func;
>> @@ -19,6 +20,9 @@ struct optee_supp_req {
>>          struct completion c;
>>   };
>>
>> +/* It is temporary request used for invalid pending request in supp->idr. */
>> +#define INVALID_REQ_PTR ((struct optee_supp_req *)ERR_PTR(-ENOENT))
>> +
>>   void optee_supp_init(struct optee_supp *supp)
>>   {
>>          memset(supp, 0, sizeof(*supp));
>> @@ -102,6 +106,7 @@ u32 optee_supp_thrd_req(struct tee_context *ctx, u32 func, size_t num_params,
>>          mutex_lock(&supp->mutex);
>>          list_add_tail(&req->link, &supp->reqs);
>>          req->in_queue = true;
>> +       req->id = -1;
>>          mutex_unlock(&supp->mutex);
>>
>>          /* Tell an eventual waiter there's a new request */
>> @@ -117,21 +122,40 @@ u32 optee_supp_thrd_req(struct tee_context *ctx, u32 func, size_t num_params,
>>          if (wait_for_completion_killable(&req->c)) {
>>                  mutex_lock(&supp->mutex);
>>                  if (req->in_queue) {
>> +                       /* Supplicant has not seen this request yet. */
>>                          list_del(&req->link);
>>                          req->in_queue = false;
>> +
>> +                       ret = TEEC_ERROR_COMMUNICATION;
>> +               } else if (req->id  == -1) {
>> +                       /*
>> +                        * Supplicant has processed this request. Ignore the
>> +                        * kill signal for now and submit the result.
>> +                        */
>> +                       ret = req->ret;
>> +               } else {
>> +                       /*
>> +                        * Supplicant is in the middle of processing this
>> +                        * request. Replace req with INVALID_REQ_PTR so that
>> +                        * the ID remains busy, causing optee_supp_send() to
>> +                        * fail on the next call to supp_pop_req() with this ID.
>> +                        */
>> +                       idr_replace(&supp->idr, INVALID_REQ_PTR, req->id);
>> +                       ret = TEEC_ERROR_COMMUNICATION;
>>                  }
>> +
>>                  mutex_unlock(&supp->mutex);
>> -               req->ret = TEEC_ERROR_COMMUNICATION;
>> +       } else {
>> +               ret = req->ret;
>>          }
>>
>> -       ret = req->ret;
>>          kfree(req);
>>
>>          return ret;
>>   }
>>
>>   static struct optee_supp_req  *supp_pop_entry(struct optee_supp *supp,
>> -                                             int num_params, int *id)
>> +                                             int num_params)
>>   {
>>          struct optee_supp_req *req;
>>
>> @@ -153,8 +177,8 @@ static struct optee_supp_req  *supp_pop_entry(struct optee_supp *supp,
>>                  return ERR_PTR(-EINVAL);
>>          }
>>
>> -       *id = idr_alloc(&supp->idr, req, 1, 0, GFP_KERNEL);
>> -       if (*id < 0)
>> +       req->id = idr_alloc(&supp->idr, req, 1, 0, GFP_KERNEL);
> 
> I'd prefer only assigning positive values to req->id. Even if
> idr_alloc() might never return -1 it's still a bit messy.
> 
> Cheers,
> Jens
> 
>> +       if (req->id < 0)
>>                  return ERR_PTR(-ENOMEM);
>>
>>          list_del(&req->link);
>> @@ -214,7 +238,6 @@ int optee_supp_recv(struct tee_context *ctx, u32 *func, u32 *num_params,
>>          struct optee *optee = tee_get_drvdata(teedev);
>>          struct optee_supp *supp = &optee->supp;
>>          struct optee_supp_req *req = NULL;
>> -       int id;
>>          size_t num_meta;
>>          int rc;
>>
>> @@ -223,16 +246,47 @@ int optee_supp_recv(struct tee_context *ctx, u32 *func, u32 *num_params,
>>                  return rc;
>>
>>          while (true) {
>> -               mutex_lock(&supp->mutex);
>> -               req = supp_pop_entry(supp, *num_params - num_meta, &id);
>> -               mutex_unlock(&supp->mutex);
>> +               scoped_guard(mutex, &supp->mutex) {
>> +                       req = supp_pop_entry(supp, *num_params - num_meta);
>> +                       if (!req)
>> +                               goto wait_for_request;
>>
>> -               if (req) {
>>                          if (IS_ERR(req))
>>                                  return PTR_ERR(req);
>> -                       break;
>> +
>> +                       /*
>> +                        * Process the request while holding the lock,
>> +                        * so that optee_supp_thrd_req() doesn't pull the
>> +                        * request out from under us.
>> +                        */
>> +
>> +                       if (num_meta) {
>> +                               /*
>> +                                * tee-supplicant support meta parameters ->
>> +                                * requests can be processed asynchronously.
>> +                                */
>> +                               param->attr =
>> +                                       TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT |
>> +                                       TEE_IOCTL_PARAM_ATTR_META;
>> +                               param->u.value.a = req->id;
>> +                               param->u.value.b = 0;
>> +                               param->u.value.c = 0;
>> +                       } else {
>> +                               supp->req_id = req->id;
>> +                       }
>> +
>> +                       *func = req->func;
>> +                       *num_params = req->num_params + num_meta;
>> +                       memcpy(param + num_meta, req->param,
>> +                              sizeof(struct tee_param) * req->num_params);
>> +
>> +                       return 0;
>>                  }
>>
>> +               /* Check for the next request in the queue. */
>> +               continue;
>> +
>> +wait_for_request:
>>                  /*
>>                   * If we didn't get a request we'll block in
>>                   * wait_for_completion() to avoid needless spinning.
>> @@ -245,27 +299,6 @@ int optee_supp_recv(struct tee_context *ctx, u32 *func, u32 *num_params,
>>                          return -ERESTARTSYS;
>>          }
>>
>> -       if (num_meta) {
>> -               /*
>> -                * tee-supplicant support meta parameters -> requsts can be
>> -                * processed asynchronously.
>> -                */
>> -               param->attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT |
>> -                             TEE_IOCTL_PARAM_ATTR_META;
>> -               param->u.value.a = id;
>> -               param->u.value.b = 0;
>> -               param->u.value.c = 0;
>> -       } else {
>> -               mutex_lock(&supp->mutex);
>> -               supp->req_id = id;
>> -               mutex_unlock(&supp->mutex);
>> -       }
>> -
>> -       *func = req->func;
>> -       *num_params = req->num_params + num_meta;
>> -       memcpy(param + num_meta, req->param,
>> -              sizeof(struct tee_param) * req->num_params);
>> -
>>          return 0;
>>   }
>>
>> @@ -297,12 +330,19 @@ static struct optee_supp_req *supp_pop_req(struct optee_supp *supp,
>>          if (!req)
>>                  return ERR_PTR(-ENOENT);
>>
>> +       /* optee_supp_thrd_req() already returned to optee. */
>> +       if (IS_ERR(req))
>> +               goto failed_req;
>> +
>>          if ((num_params - nm) != req->num_params)
>>                  return ERR_PTR(-EINVAL);
>>
>> +       req->id = -1;
>> +       *num_meta = nm;
>> +failed_req:
>>          idr_remove(&supp->idr, id);
>>          supp->req_id = -1;
>> -       *num_meta = nm;
>> +
>>
>>          return req;
>>   }
>> @@ -328,9 +368,8 @@ int optee_supp_send(struct tee_context *ctx, u32 ret, u32 num_params,
>>
>>          mutex_lock(&supp->mutex);
>>          req = supp_pop_req(supp, num_params, param, &num_meta);
>> -       mutex_unlock(&supp->mutex);
>> -
>>          if (IS_ERR(req)) {
>> +               mutex_unlock(&supp->mutex);
>>                  /* Something is wrong, let supplicant restart. */
>>                  return PTR_ERR(req);
>>          }
>> @@ -358,6 +397,7 @@ int optee_supp_send(struct tee_context *ctx, u32 ret, u32 num_params,
>>
>>          /* Let the requesting thread continue */
>>          complete(&req->c);
>> +       mutex_unlock(&supp->mutex);
>>
>>          return 0;
>>   }
>>
>> ---
>> base-commit: 3be1a7a31fbda82f3604b6c31e4f390110de1b46
>> change-id: 20250604-fix-use-after-free-8ff1b5d5d774
>>
>> Best regards,
>> --
>> Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>>


-- 
Regards,
Michael Wu

