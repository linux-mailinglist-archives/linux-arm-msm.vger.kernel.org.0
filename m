Return-Path: <linux-arm-msm+bounces-78776-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 18279C08C46
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Oct 2025 08:43:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C0D884E127A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Oct 2025 06:43:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 508F42D97BF;
	Sat, 25 Oct 2025 06:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AdMc8W8V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED7022689C
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Oct 2025 06:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761374632; cv=none; b=XpthtCM6ftKMdwmCt0J8opAhr7Ge48OUh7p0sUxQg0sZtkS48mHNxyum0sy1BVTJTMZLoqCIkfeylZtMLJ+0WZhPB7eF9XhPQ97HP+gS6QWNfZfhy4K3hK/LQOHbohbOaykF8neYguXCoJB9EUOvinyhQR33X+5v8qDYLxPjnII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761374632; c=relaxed/simple;
	bh=o3qOxNAAdDT2JO8f8mlj7edKglafDirmleaNbu3efTs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ARpeFxKmTQjIPAO06lI1SPpX584GbfeZWKke7ep968dzP96pF1W6sYAWnAY7sSQUVUA8dfW+RHkkTG3X7XSCinsWm6YQeOVeagxPjv8fWA3DkrLaOvyTxZpdnodSqw0HY/3oMjGRICjmtCjK+kA4ltMnFIkpYVGpKmSY3EmJLpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AdMc8W8V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59P2FAH5052786
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Oct 2025 06:43:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rW95KCIXYm77lQT5s/H08ZE72Q09AtuFEA2lEzgUNd0=; b=AdMc8W8Vzh/h+BH2
	QCh9ZzSpqtijYB9dfBZJplUC/0CXQZZ1Ffo3FM5fNZx8pAQZeDntan0BmHnRpN0+
	FkmPdO/kYjNJYZkoQnHIFXHYr9qOAk7a9+NO6UkNbWB0CbS+tjugMhB4iCTP5nfM
	qvLqv8pkRrz1okCsiF+pyKrD9QupRUkhZ11UNpN+FTSYx1Ff8C387/17Yc9eYX5b
	z5rFfa6g8L+mIRPwzorU3mfLsA+woL4eAoyuqJ/V3F+CK4WJjkIrJ2BGE/ljYWgT
	8eBGIqDYkW9HJR+AnqzhMGT1XGICJkpr4Up5jnsLSD/BLvJKyLXT3bHKD3PBmN/0
	2UYgpQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a0nkagay9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Oct 2025 06:43:48 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7a2885329beso950258b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 23:43:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761374627; x=1761979427;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rW95KCIXYm77lQT5s/H08ZE72Q09AtuFEA2lEzgUNd0=;
        b=LQorMTSwLtbdsah/Fo336qKnnpJBCfS9hq1+7Widy3qm1cc2w975lkpj4GiqPQWpNn
         j0Hiz3OpQs0qzw7oB/73eCcfI04nn8Vk6qDqZIDpaUpSEzb/Osrc+du0gglcEgNHqdDY
         V3Y2AEqJYPfXCm9vLMKl2ViSKtkTpZI+oqbwwK6QOHIQK9a+FsEPWj45iDud/Rx5mOxt
         bDXLkmKQUrmBKtPXpSELb8l5UwndK0m6TY28Cp3wA5iKR+Ue8Pn8qjjy7gdsF7RqRn0M
         ZGDLb+T2DHWn4+afxm8UKIdKRXrEtKg66EkryU0ZiePsnECaQaDBG4kxKlW+QKSmzj4e
         tOHw==
X-Forwarded-Encrypted: i=1; AJvYcCU/DfSHXY5lZ7EM8AMdEqUyI/Jsu/GzOc9f4exekW7/YNda6/Je96/QBD/r6zf/fgIxGSkszHjFh/B1AkBV@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4vv4R0Esm/CnJ5RQV5TEU6z8TYL4N/wA7WeSv2qnaLIzTsVdF
	TA6/Go3goBnMmXtXihjRSsRadPNsaNyJXr3Njg6UOOByKDYkiWxps04J6I0rLNq7U1Qp628W7lR
	muT9mPIMslf8iGDGWkWuYEdlULLrB0FBZ43jKUrL1Efa1NAE/H7YHYoYrkVJ1PVXErLD5
X-Gm-Gg: ASbGnct+LTBfDaAXFp20EeUL6ZfyNRRqtoaywUOfec9Z5DiPF9YEL0V3gvHSQRdjUUD
	3Aq93FYXBnRjLZgydio3P4FFGfIM6Qpao3G2D9FYPBJCX2EYoniaKNVg5gPMY62Mbro2TxZqkPt
	N7jnRRYlk4q4dlHuudhjZ9/As2itN5u1qptyXcCze6VEnO4js6M2gjwCrKgQdi/WOTYJwOLUkMj
	wcftPacijcjGmLbbaSx5i+nD20eNbvik7cm81W5GRlD22i7e+k56g1duF+2LzVjGO+SBG1FTB2B
	HrrHRixIXlz7s4CsH3O9qiUgBTwgUbbtY5zMc5F3kh/66cspzIGKHl1KURJIrGOGaaaea2avAK4
	bzs4cMZm9fBQ+MsaB9S9WIee56+iA7lM8sdAUurQefyf+B32jY1hbmAV4fe/IdA7rGcmn1g==
X-Received: by 2002:a05:6a00:130f:b0:7a2:7c48:e34a with SMTP id d2e1a72fcca58-7a284df334fmr5617585b3a.13.1761374627431;
        Fri, 24 Oct 2025 23:43:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZXhT6VMXsGA0fysoTMea19bLbQ0XNApkgVNTxxLn7c0e0mqfhvK0ksJX0fTpMq8/a7jWdSg==
X-Received: by 2002:a05:6a00:130f:b0:7a2:7c48:e34a with SMTP id d2e1a72fcca58-7a284df334fmr5617564b3a.13.1761374626928;
        Fri, 24 Oct 2025 23:43:46 -0700 (PDT)
Received: from [10.133.33.201] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a414011acdsm1243730b3a.13.2025.10.24.23.43.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 23:43:46 -0700 (PDT)
Message-ID: <8c5e4101-721b-45f1-aa53-5eb35bb5f3b1@oss.qualcomm.com>
Date: Sat, 25 Oct 2025 14:43:39 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched: Recheck the rt task's on rq state after
 double_lock_balance()
To: Valentin Schneider <vschneid@redhat.com>, Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
        Mel Gorman <mgorman@suse.de>, linux-arm-msm@vger.kernel.org
Cc: kernel@oss.qualcomm.com, linux-kernel@vger.kernel.org
References: <20251009-recheck_rt_task_enqueue_state-v1-1-5f9c96d3c4fd@oss.qualcomm.com>
 <xhsmhqzuxlolh.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
Content-Language: en-US
From: Tengfei Fan <tengfei.fan@oss.qualcomm.com>
In-Reply-To: <xhsmhqzuxlolh.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AYW83nXG c=1 sm=1 tr=0 ts=68fc71a4 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=64Cc0HZtAAAA:8 a=EUspDBNiAAAA:8 a=pYh2eYpCFDsFtdU7aq0A:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: Vkb5j5WuPb0Odro75umGqp39YwuTf0sj
X-Proofpoint-GUID: Vkb5j5WuPb0Odro75umGqp39YwuTf0sj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI1MDA1OCBTYWx0ZWRfXyBGYC1qs2KM9
 wr0hIy8v8soo2HVvLoBlQjSOYPojgCRo5j61ihUNWQ1rXdsEULFZq7w2rCM2r2pRKZ1f8eQo4rx
 /daarFt+G4Cu0k4XGcrSenpERvCkeYPnEEBza/jXBsp9V7XwRBJjVrgTNGbA3eZcXLC71MM3Md7
 IqQ+GrIr/xHem6yy0trFIZwMtNE2xq7d7DF5MsdQDK0FUOnTGbmTVyL/QB7WNUNFp0/j1C7mk1Q
 rdMXodxFmivCClj1bwB71L2J5cTkIkBd7/jgdi95dm4F+Q0xDMDYmu9Ems7bJZ1BY3HEKe4olWz
 wMZiZQIAqD944fKp4+KAzOtrojGDqbl7d8KRHy2wv/bn1iW9Cs4uywPBX6R9bI13HcKBP06D87A
 yn4hnt+Yt8siQWGRIoLaB6SvwCExvQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-25_02,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510250058


On 10/20/2025 8:55 PM, 'Valentin Schneider' via kernel wrote:
> On 09/10/25 00:23, Tengfei Fan wrote:
>> Recheck whether next_task is still in the runqueue of this_rq after
>> locking this_rq and lowest_rq via double_lock_balance() in
>> push_rt_task(). This is necessary because double_lock_balance() first
>> releases this_rq->lock and then attempts to acquire both this_rq->lock
>> and lowest_rq->lock, during which next_task may have already been
>> removed from this_rq's runqueue, leading to a double dequeue issue.
>>
>> The double dequeue issue can occur in the following scenario:
>> 1. Core0 call stack:
>>          autoremove_wake_function
>>          default_wake_function
>>          try_to_wake_up
>>          ttwu_do_activate
>>          task_woken_rt
>>          push_rt_task
>>          move_queued_task_locked
>>          dequeue_task
>>          __wake_up
>>
>> 2. Execution flow on Core0, Core1 and Core2(Core0, Core1 and Core2 are
>>     contending for Core1's rq->lock):
>>     - Core1: enqueue next_task on Core1
>>     - Core0: lock Core1's rq->lock
>>              next_task = pick_next_pushable_task()
>>              unlock Core1's rq->lock via double_lock_balance()
>>     - Core1: lock Core1's rq->lock
>>              next_task = pick_next_task()
>>              unlock Core1's rq->lock
>>     - Core2: lock Core1's rq->lock in migration thread
>>     - Core1: running next_task
>>     - Core2: unlock Core1's rq->lock
>>     - Core1: lock Core1's rq->lock
>>              switches out and dequeue next_task
>>              unlock Core1's rq->lock
>>     - Core0: relock Core1's rq->lock from double_lock_balance()
>>              try to relock Core1's rq->lock from double_lock_balance()
>>              but next_task has been dequeued from Core1, causing the issue
>>
>> Signed-off-by: Tengfei Fan <tengfei.fan@oss.qualcomm.com>
>> ---
>>   kernel/sched/rt.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
>> index 7936d4333731..b4e44317a5de 100644
>> --- a/kernel/sched/rt.c
>> +++ b/kernel/sched/rt.c
>> @@ -2037,6 +2037,14 @@ static int push_rt_task(struct rq *rq, bool pull)
>>   		goto retry;
>>   	}
>>   
>> +	/* Within find_lock_lowest_rq(), it's possible to first unlock the
>> +	 * rq->lock of the runqueue containing next_task, and the re->lock
>> +	 * it. During this window, the state of next_task might have change.
>> +	 */
>> +	if (unlikely(rq != task_rq(next_task) ||
>> +		     !task_on_rq_queued(next_task)))
>> +		goto out;
>> +
> Isn't this already covered by find_lock_lowest_rq()?

Yes, this logic is already included in find_lock_lowest_rq(). 
Previously, we were missing the following patch.

https://lore.kernel.org/r/20250225180553.167995-1-harshit@nutanix.com

We will recheck whether our case has already been resolved by this patch.


>
> if @next_task migrates during the double_lock_balance(), we'll see that
> it's no longer the next highest priority pushable task of its original rq
> (it won't be in that pushable list at all actually):
>
>    static struct rq *find_lock_lowest_rq(struct task_struct *task, struct rq *rq)
>    {
>            [...]
>            if (double_lock_balance(rq, lowest_rq)) {
>                    if (unlikely(is_migration_disabled(task) ||
>                                 !cpumask_test_cpu(lowest_rq->cpu, &task->cpus_mask) ||
>                                 task != pick_next_pushable_task(rq))) {
>
>                            double_unlock_balance(rq, lowest_rq);
>                            lowest_rq = NULL;
>                            break;
>                    }
>            }
>    }
>
> Plus:
>
>    static int push_rt_task(struct rq *rq, bool pull)
>    {
>            [...]
>            if (!lowest_rq) {
>                    struct task_struct *task;
>                    task = pick_next_pushable_task(rq);
>                    [...]
>                    put_task_struct(next_task);
>                    next_task = task;
>                    goto retry;
>            }
>    }
>
> AFAICT in the scenario you described, we'd just retry with another next
> pushable task.
I think this is just a different handling approach. At the time, our 
concern was that retrying might introduce an infinite loop.
>
>>   	move_queued_task_locked(rq, lowest_rq, next_task);
>>   	resched_curr(lowest_rq);
>>   	ret = 1;
>>
>> ---
>> base-commit: 7c3ba4249a3604477ea9c077e10089ba7ddcaa03
>> change-id: 20251008-recheck_rt_task_enqueue_state-e159aa6a2749
>>
>> Best regards,
>> -- 
>> Tengfei Fan <tengfei.fan@oss.qualcomm.com>

-- 
Thx and BRs,
Tengfei Fan


