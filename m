Return-Path: <linux-arm-msm+bounces-60703-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 796F5AD2AEE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 02:34:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2C1267A5EE7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 00:33:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54AC386323;
	Tue, 10 Jun 2025 00:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SfLE5qNE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0FDB28F3
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 00:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749515667; cv=none; b=tYxus4SbEbOUIPwcH+OpiN0SKLl31oD9+8CTDerJraWAvf453VC6RTGCZoTkUpcxtqFSNwmOD2BHI8VbnDQVogcVGx4CUPc+7PtHcXby0R1ixwgCgdqcAbW8qb+5ethrPcG1rcpXC5pPb8btJZZMvd+JTOOuYD1A40o9odL6QtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749515667; c=relaxed/simple;
	bh=pAvXuv0PbcklzkWSk8aVr21VDYCwOprq4gRJaWgcu3w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RoJG6fWyJBswiulNZmwW2hC5xExXvE6fE5m2CejVeU9TVM4DeKRRY0sg7Hm3Lgxu38CwK1Yvj6P/fnVNUoT+Qm6kQLEOQu9JcC7YxFvb+yVYNqpTRe2irOsvbIzEnjwISs0YljGbvRPb691+j8Yyuo2b5TgbmidbTXkRIVGkVwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SfLE5qNE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 559MixnI003643
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 00:34:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jKXHPlovAe18pXN4Gv6r56FvRQixUbyObENb7DCEoVY=; b=SfLE5qNEkggJYc6D
	IIgdkhOux4NnJwiTaduVwTR3oux3/Pfh7MrMhMyntNctArWm0Wg0UeujfrH7fjpC
	PxsTMr7SB5NeNrBPrullAfIVHy8KLNzaa0en08SP2QtX5JYi5U/+fUqMb/6UsI4N
	uFnOvzIUtcKfwKQFe5+AWnPU/eJFbQiYl93vj6KUoMnHY5V7advirb415ONoxKlm
	KsC+bAFCjz2D0V/MkZIrHkOZM1eu3udyEfHIlF7syffannvKZkixx4R5ZilaTUeE
	VeVLUQQu7tmfGmCJNviYcPHl4QuHXxQ+0nWPTEnsoA8EyldgDN45izWIKiPpeCKY
	CRrpPQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dn67j1t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 00:34:23 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-235f77f86f6so31996275ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jun 2025 17:34:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749515663; x=1750120463;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jKXHPlovAe18pXN4Gv6r56FvRQixUbyObENb7DCEoVY=;
        b=Qij+ImM3HV4HZA/2dlcdOebha1tS13bciwwbfWg3FY6riNpRbX/H6fIlyjTIML2k+B
         FHt7KJAxhu9LbFQS3GOqpx/jdp8lPxKtqaGw+abo6Wf6GNgJujS19tZPCK41xQXos3RH
         ck7S/ye9SV+l9nU8ZL+eVC7qfiiJyviMzdxkcDhL/+NW5x6Gbe7N+zxYcVXaNS266nn+
         QgA8rnZVFpLV87ADfAN9+6Ea0HztIUwjebIsTBwxBWOdVgOWOqiIOXDTnMVaeoVpNYxH
         168F04G8oyrbDuKhr/DqyQdMmyBR+PxsdoRe5QFvQcWKlaHn6njJ0nqRqMBvSfmGZdEM
         7BFw==
X-Forwarded-Encrypted: i=1; AJvYcCX3Zc1JHHTPq49wld9Dj9xcraDEW/SsyYFaezk8v5l/kCJVZRCowQe+B1/N5byqZk3IWgKxQsK3vcrQxqH0@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg7LHMnX5ZOmM7MYema/RJ2yn2G1ZuvOHS6Xyuud7gqdQs/R2T
	m8T6kQFwXRgZ2ac65I5XIm+/P3HrSBjoF2fsd6vftLpimx73fB3nyPtmdUSzTwWeRTjMHn1651O
	IBc/4l2PTixucfnXCBFSEZhVZ0FLJxvCknPjRGtIRzF4enOec9vUS99z9YMjCy72HaEI=
X-Gm-Gg: ASbGncta/cpObqhLMpiXkEc1mv7MLUivgWBi7StUO07y70SWMsQb5Ss6NyDBSK1uHpC
	iFzZzxMWaeF2IvkeusfK+vxLNgWl8SaTZGGE7A06pw3oXv6ZvlQr7b/D6/djoQ8I3e0ACvkBV04
	+tovhzg2PVmAI2CsrBRbi+FPUdEW0r5QDuT4wQIZH3JHnJ/ibjbzbmmycEjv5jkAfSvpDxxaf9Y
	Nmh0F72oyGBo8/ur1nsn4KJBl2yI4wGz+ShQHEcb7KHFii6QAxE1jFo+5G08Rar6/3tfd3LQ8HT
	nBl2+KoPLYGQKjM+Z2rD6K7YNbMnEhBiYJeGcIfRKKrbG524XdzI2v27W0J8EHER5ZCZZjqhbU0
	3724cLPQQk3NgUYS9S3Uj
X-Received: by 2002:a17:902:fc4b:b0:234:8c64:7875 with SMTP id d9443c01a7336-23601d96e8dmr245721505ad.38.1749515662809;
        Mon, 09 Jun 2025 17:34:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+4EiD9fyaogbUaMbdStFIwBRIn6968q0b03DmNNBp1CVezcKYxw6brYzabzVeVDmZmhU4lg==
X-Received: by 2002:a17:902:fc4b:b0:234:8c64:7875 with SMTP id d9443c01a7336-23601d96e8dmr245721035ad.38.1749515662328;
        Mon, 09 Jun 2025 17:34:22 -0700 (PDT)
Received: from [192.168.0.74] (n1-41-240-65.bla22.nsw.optusnet.com.au. [1.41.240.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603504f09sm60227715ad.223.2025.06.09.17.34.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 17:34:21 -0700 (PDT)
Message-ID: <8a6dbce8-a4ac-4871-aed0-8d3ae56f8c0a@oss.qualcomm.com>
Date: Tue, 10 Jun 2025 10:34:17 +1000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tee: optee: prevent use-after-free when the client exits
 before the supplicant
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: Sumit Garg <sumit.garg@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org
References: <20250605-fix-use-after-free-v1-1-a70d23bff248@oss.qualcomm.com>
 <CAHUa44EyGXswbYLgdrfH_cMSyadgVUAJDGAMdsPXQVN7V7Nhsw@mail.gmail.com>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <CAHUa44EyGXswbYLgdrfH_cMSyadgVUAJDGAMdsPXQVN7V7Nhsw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDAwMiBTYWx0ZWRfX+Ng49dEMKWxX
 nSYinUXnW/BJzv2CawW2UEIrLM0aHIBvB5yRKsM0e8BEmKd66lryq40XktO2nOeeStUCnRFtYI4
 zYEbaW5I9nyNvknXzTRWBtu/vdjkVX7of6PXQ2ZTF/JKYvvyfdc3A545hugG9pC+YwmcRQw5UEt
 vI9cAHr6JYIvxxbU4YkduL52h7hQ4VbtH8vN88DpZanVa5c+yM0F2y1f26fkSv0d12i9dqebYcP
 xjBK4YUf69KMjxg2nnIbK6XV8hBMB2O1m8Mf37KgPIn2/wzJvDsvRU6dATNdeefXAcjwkJh3AUR
 7qhJIH92wEfMe/RUL6Fq6J4zmGVDgywtDNvCuqNSU6WlUEjBZRUpXxn3drRE9rKZpetXxhkFosM
 xSZsJ7Sn+DulCXpWzViWA8YqKDz5T3MoCmsEnyt3lFMpe1736embeLgrfwuMlg4eCckAJ6wb
X-Proofpoint-GUID: mMq0V_-7szLVTkFHTczqnzvR2hqZjoSS
X-Authority-Analysis: v=2.4 cv=FaQ3xI+6 c=1 sm=1 tr=0 ts=68477d8f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=hi51d+lTLNy/RbqRqnOomQ==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=hWFDaL5eoG7oPyYckLUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: mMq0V_-7szLVTkFHTczqnzvR2hqZjoSS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_10,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100002

Hi Jens,

On 6/9/2025 11:00 PM, Jens Wiklander wrote:
> Hi Amir,
> 
> On Fri, Jun 6, 2025 at 4:01 AM Amirreza Zarrabi
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
>>   * Hold supp->mutex in optee_supp_recv() and optee_supp_send() while
>>     looking up and touching the request.
>>   * Let optee_supp_thrd_req() notice that the client has terminated and
>>     signal optee_supp_send() accordingly.
>>
>> With these changes the request cannot be freed while the supplicant still
>> has a reference, eliminating the race.
>>
>> Fixes: 70b0d6b0a199 ("tee: optee: Fix supplicant wait loop")
>> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>> ---
>>  drivers/tee/optee/supp.c | 114 ++++++++++++++++++++++++++++++++---------------
>>  1 file changed, 77 insertions(+), 37 deletions(-)
>>
>> diff --git a/drivers/tee/optee/supp.c b/drivers/tee/optee/supp.c
>> index d0f397c90242..62c9c75f48a6 100644
>> --- a/drivers/tee/optee/supp.c
>> +++ b/drivers/tee/optee/supp.c
>> @@ -9,6 +9,7 @@
>>
>>  struct optee_supp_req {
>>         struct list_head link;
>> +       int id;
>>
>>         bool in_queue;
>>         u32 func;
>> @@ -19,6 +20,9 @@ struct optee_supp_req {
>>         struct completion c;
>>  };
>>
>> +/* It is temporary request used for invalid pending request in supp->idr. */
>> +static struct optee_supp_req invalid_req;
> 
> Prefer avoiding global variables where possible.
> 

Ack.

>> +
>>  void optee_supp_init(struct optee_supp *supp)
>>  {
>>         memset(supp, 0, sizeof(*supp));
>> @@ -102,6 +106,7 @@ u32 optee_supp_thrd_req(struct tee_context *ctx, u32 func, size_t num_params,
>>         mutex_lock(&supp->mutex);
>>         list_add_tail(&req->link, &supp->reqs);
>>         req->in_queue = true;
>> +       req->id = -1;
>>         mutex_unlock(&supp->mutex);
>>
>>         /* Tell an eventual waiter there's a new request */
>> @@ -117,21 +122,40 @@ u32 optee_supp_thrd_req(struct tee_context *ctx, u32 func, size_t num_params,
>>         if (wait_for_completion_killable(&req->c)) {
>>                 mutex_lock(&supp->mutex);
>>                 if (req->in_queue) {
>> +                       /* Supplicant has not seen this request yet. */
>>                         list_del(&req->link);
>>                         req->in_queue = false;
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
>> +                        * request. Replace req with invalid_req so that the ID
>> +                        * remains busy, causing optee_supp_send() to fail on
>> +                        * the next call to supp_pop_req() with this ID.
>> +                        */
>> +                       idr_replace(&supp->idr, &invalid_req, req->id);
>> +                       ret = TEEC_ERROR_COMMUNICATION;
>>                 }
>> +
>> +               kfree(req);
>>                 mutex_unlock(&supp->mutex);
>> -               req->ret = TEEC_ERROR_COMMUNICATION;
>> +       } else {
>> +               ret = req->ret;
>> +               kfree(req);
>>         }
>>
>> -       ret = req->ret;
>> -       kfree(req);
>> -
>>         return ret;
>>  }
>>
>>  static struct optee_supp_req  *supp_pop_entry(struct optee_supp *supp,
>> -                                             int num_params, int *id)
>> +                                             int num_params)
>>  {
>>         struct optee_supp_req *req;
>>
>> @@ -153,8 +177,8 @@ static struct optee_supp_req  *supp_pop_entry(struct optee_supp *supp,
>>                 return ERR_PTR(-EINVAL);
>>         }
>>
>> -       *id = idr_alloc(&supp->idr, req, 1, 0, GFP_KERNEL);
>> -       if (*id < 0)
>> +       req->id = idr_alloc(&supp->idr, req, 1, 0, GFP_KERNEL);
>> +       if (req->id < 0)
>>                 return ERR_PTR(-ENOMEM);
>>
>>         list_del(&req->link);
>> @@ -214,7 +238,6 @@ int optee_supp_recv(struct tee_context *ctx, u32 *func, u32 *num_params,
>>         struct optee *optee = tee_get_drvdata(teedev);
>>         struct optee_supp *supp = &optee->supp;
>>         struct optee_supp_req *req = NULL;
>> -       int id;
>>         size_t num_meta;
>>         int rc;
>>
>> @@ -223,16 +246,45 @@ int optee_supp_recv(struct tee_context *ctx, u32 *func, u32 *num_params,
>>                 return rc;
>>
>>         while (true) {
>> -               mutex_lock(&supp->mutex);
>> -               req = supp_pop_entry(supp, *num_params - num_meta, &id);
>> -               mutex_unlock(&supp->mutex);
>> +               scoped_guard(mutex, &supp->mutex) {
>> +                       req = supp_pop_entry(supp, *num_params - num_meta);
>> +                       if (!req)
>> +                               goto wait_for_request;
>>
>> -               if (req) {
>>                         if (IS_ERR(req))
>>                                 return PTR_ERR(req);
>> -                       break;
>> +
>> +                       /*
>> +                        * Popped a request: process it while holding the lock,
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
> 
> This is the point at which this function must break out of the loop
> and return the request, or it will be lost.
> 
> Cheers,
> Jens
> 

Right. I'll update.

Regards,
Amir

>>                 }
>>
>> +               /* Check for the next request in the queue. */
>> +               continue;
>> +
>> +wait_for_request:
>>                 /*
>>                  * If we didn't get a request we'll block in
>>                  * wait_for_completion() to avoid needless spinning.
>> @@ -245,27 +297,6 @@ int optee_supp_recv(struct tee_context *ctx, u32 *func, u32 *num_params,
>>                         return -ERESTARTSYS;
>>         }
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
>>         return 0;
>>  }
>>
>> @@ -297,12 +328,21 @@ static struct optee_supp_req *supp_pop_req(struct optee_supp *supp,
>>         if (!req)
>>                 return ERR_PTR(-ENOENT);
>>
>> +       /* optee_supp_thrd_req() already returned to optee. */
>> +       if (req == &invalid_req) {
>> +               req = ERR_PTR(-ENOENT);
>> +               goto failed_req;
>> +       }
>> +
>>         if ((num_params - nm) != req->num_params)
>>                 return ERR_PTR(-EINVAL);
>>
>> +       req->id = -1;
>> +       *num_meta = nm;
>> +failed_req:
>>         idr_remove(&supp->idr, id);
>>         supp->req_id = -1;
>> -       *num_meta = nm;
>> +
>>
>>         return req;
>>  }
>> @@ -328,9 +368,8 @@ int optee_supp_send(struct tee_context *ctx, u32 ret, u32 num_params,
>>
>>         mutex_lock(&supp->mutex);
>>         req = supp_pop_req(supp, num_params, param, &num_meta);
>> -       mutex_unlock(&supp->mutex);
>> -
>>         if (IS_ERR(req)) {
>> +               mutex_unlock(&supp->mutex);
>>                 /* Something is wrong, let supplicant restart. */
>>                 return PTR_ERR(req);
>>         }
>> @@ -358,6 +397,7 @@ int optee_supp_send(struct tee_context *ctx, u32 ret, u32 num_params,
>>
>>         /* Let the requesting thread continue */
>>         complete(&req->c);
>> +       mutex_unlock(&supp->mutex);
>>
>>         return 0;
>>  }
>>
>> ---
>> base-commit: 3be1a7a31fbda82f3604b6c31e4f390110de1b46
>> change-id: 20250604-fix-use-after-free-8ff1b5d5d774
>>
>> Best regards,
>> --
>> Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>>


