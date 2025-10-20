Return-Path: <linux-arm-msm+bounces-78009-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DD9BF15D3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 14:55:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 490E33401D7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 12:55:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BDDF26657D;
	Mon, 20 Oct 2025 12:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TLajnoSD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A8A258CEF
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 12:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760964930; cv=none; b=tiiKVPcKUe+LmjJGhnQDoawmzusWiFwrzZRPFCxxSOW2z3XMZZnXT5h4lNKNDRUQtv8yJc7OHMmQAgDn9T9SE6iCOYPf5x9MhM9erQrdqOHSS7fSG9/AOa3OE/CCtD6CffgWpMvnj+fgcap/ly49wuSx/8IzbR24TG/yveFpWKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760964930; c=relaxed/simple;
	bh=QWslHHw3ooUL0ob80XUiTtNqA8+q6Mn8EA7SIZWCBB4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=XxCt1lacfHB6ZNbUDzits85uG7Ca7PEzYo0Zt9qdHtigaAQjhb5/+yyHnuKgODsPR+8MzOXpelCNLqBaagJncBKJFtF1+pUsLmrOLAQxGXmPjxrsTx4ar5hoUHdk5aZ8/0sBWJKmUhBalbNSrJMciQrR3jMGehie/L+ZowDeHyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TLajnoSD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760964927;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MpAcUrOw214uKU85d3sQtOE461IvZvLg1M+Z0gwzSR8=;
	b=TLajnoSD9Ua3dtEU+A6DMkNmfgHyy+yiYAN58ShCo4hLWjCKsKzFwtjlr1TSkbj1vRK9pI
	5//qPAV3sg6bYbGNjnam2OGiB/rPD59XIUax2lENHWY4yEbmKbytpIKWtSWatPb+YP9gV2
	o394ZVAo9jO+yoMw43aC8tRwoliHDIc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-214-Itrzt3VwOPeXT1moOTY-eQ-1; Mon, 20 Oct 2025 08:55:26 -0400
X-MC-Unique: Itrzt3VwOPeXT1moOTY-eQ-1
X-Mimecast-MFC-AGG-ID: Itrzt3VwOPeXT1moOTY-eQ_1760964925
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-426d4f59cbcso2871232f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 05:55:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760964925; x=1761569725;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MpAcUrOw214uKU85d3sQtOE461IvZvLg1M+Z0gwzSR8=;
        b=mv4YtcPFvlOZ6A8BhzPFTRCnknjZi19kV0BODbHGLWWIDyaXcqIOQxE1HmL81/fQY0
         LF0/NXXM2MHZKkEa2dNmze3PH5lWTdUL7/D6hVvj+A4O+CcaYVEo2ZvmNcmCm8JosATF
         UnjMQ6eThiP4fDsWxrA9DAW4kXvYrTtHr96Y/8NVymmyudQoUyZfd9mYeLdp16MS1l4Y
         D2u/JMzKfhUIX4hrDzdDllPs+BRLlWXwFvJUga5SS7idWaTtrqllpXxhGhbVkPATvWV9
         9P4NFq3SPybEy7Ak4FG4WmHHlB+C/+ZA/LS+Vx81luzar9SjuMg8H5IsZtVEXaW3r/kp
         kpHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXInN+Qt2KHRcdNxfOVyTP4CocmOvrejNu030NS8uqq2yqpHX81Cp4Nz9xIwT/bvAPKMT9Nr0JZzsZwOBZi@vger.kernel.org
X-Gm-Message-State: AOJu0Yza78perpNcklln39R9ObQSlGPYy430dQ1xWDrf4oExbLDGcHRQ
	8ZE5Bzwn4oapWs7za9qBQ2jMFgRGWZL1xcufEyFk63ciTwj5GAEWVOEI8VPDXAW0W06u9CF76gz
	ftvXjLxltpIEyXJEsVw9jb6YeIYDyOl5+3tGvQ+gQOCpW/n106KhIgoZqIikHytc5Krh+4LTqaH
	w=
X-Gm-Gg: ASbGnctxqDTNLXhX2pgWP4jyTnvE2NgpCh0ZgvcnNLJEPo9DhBZi/dlJTvit3bug6rI
	vgDbpEGGJ+6/KHXV9bbqpVtmrgbJzLsnx5PYn/bnfFQSUZ9xKAc5mC2DYmhOYWG6po5R+IKnHpA
	xQswhn3k6Fac32zLzjMNwqB7lrdqIQZJ6GIy987hzfaimeJJtYUxG56Ym7tfWGTZT3jedwl9eq0
	Bzx1Y5JlkMXwP2DX8+kHB5WECxJC/NxyULBBzE1Xq9HBfaco01Q8zFrLmIqjeQUoy30MqvTGf0y
	COVA7IbgpQ/0+WDk1EsHSVk8mvkrwc0X8MW0ClBFdvRO+btCGdjujoi074qa8fBwyiQoQN32Oau
	iZBSiAu5lYaa+ZrgGyAOGlE0YSYnyzLQpHQT1jgTQ5YBsr0AUuIz7X9bvdf02
X-Received: by 2002:a05:6000:2f83:b0:427:151:3da6 with SMTP id ffacd0b85a97d-42701514163mr10587338f8f.29.1760964924782;
        Mon, 20 Oct 2025 05:55:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGW4QT6B9QAckNTLEcThFFX2zX+LihKlhZMaBVmzKecwZvIPpPq9HRLslLYxVotWn59JjjW2A==
X-Received: by 2002:a05:6000:2f83:b0:427:151:3da6 with SMTP id ffacd0b85a97d-42701514163mr10587314f8f.29.1760964924261;
        Mon, 20 Oct 2025 05:55:24 -0700 (PDT)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-135-146.abo.bbox.fr. [213.44.135.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4715e4e267fsm62292715e9.12.2025.10.20.05.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 05:55:23 -0700 (PDT)
From: Valentin Schneider <vschneid@redhat.com>
To: Tengfei Fan <tengfei.fan@oss.qualcomm.com>, Ingo Molnar
 <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Juri Lelli
 <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt
 <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman
 <mgorman@suse.de>, linux-arm-msm@vger.kernel.org
Cc: kernel@oss.qualcomm.com, linux-kernel@vger.kernel.org, Tengfei Fan
 <tengfei.fan@oss.qualcomm.com>
Subject: Re: [PATCH] sched: Recheck the rt task's on rq state after
 double_lock_balance()
In-Reply-To: <20251009-recheck_rt_task_enqueue_state-v1-1-5f9c96d3c4fd@oss.qualcomm.com>
References: <20251009-recheck_rt_task_enqueue_state-v1-1-5f9c96d3c4fd@oss.qualcomm.com>
Date: Mon, 20 Oct 2025 14:55:22 +0200
Message-ID: <xhsmhqzuxlolh.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On 09/10/25 00:23, Tengfei Fan wrote:
> Recheck whether next_task is still in the runqueue of this_rq after
> locking this_rq and lowest_rq via double_lock_balance() in
> push_rt_task(). This is necessary because double_lock_balance() first
> releases this_rq->lock and then attempts to acquire both this_rq->lock
> and lowest_rq->lock, during which next_task may have already been
> removed from this_rq's runqueue, leading to a double dequeue issue.
>
> The double dequeue issue can occur in the following scenario:
> 1. Core0 call stack:
>         autoremove_wake_function
>         default_wake_function
>         try_to_wake_up
>         ttwu_do_activate
>         task_woken_rt
>         push_rt_task
>         move_queued_task_locked
>         dequeue_task
>         __wake_up
>
> 2. Execution flow on Core0, Core1 and Core2(Core0, Core1 and Core2 are
>    contending for Core1's rq->lock):
>    - Core1: enqueue next_task on Core1
>    - Core0: lock Core1's rq->lock
>             next_task = pick_next_pushable_task()
>             unlock Core1's rq->lock via double_lock_balance()
>    - Core1: lock Core1's rq->lock
>             next_task = pick_next_task()
>             unlock Core1's rq->lock
>    - Core2: lock Core1's rq->lock in migration thread
>    - Core1: running next_task
>    - Core2: unlock Core1's rq->lock
>    - Core1: lock Core1's rq->lock
>             switches out and dequeue next_task
>             unlock Core1's rq->lock
>    - Core0: relock Core1's rq->lock from double_lock_balance()
>             try to relock Core1's rq->lock from double_lock_balance()
>             but next_task has been dequeued from Core1, causing the issue
>
> Signed-off-by: Tengfei Fan <tengfei.fan@oss.qualcomm.com>
> ---
>  kernel/sched/rt.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
> index 7936d4333731..b4e44317a5de 100644
> --- a/kernel/sched/rt.c
> +++ b/kernel/sched/rt.c
> @@ -2037,6 +2037,14 @@ static int push_rt_task(struct rq *rq, bool pull)
>  		goto retry;
>  	}
>  
> +	/* Within find_lock_lowest_rq(), it's possible to first unlock the
> +	 * rq->lock of the runqueue containing next_task, and the re->lock
> +	 * it. During this window, the state of next_task might have change.
> +	 */
> +	if (unlikely(rq != task_rq(next_task) ||
> +		     !task_on_rq_queued(next_task)))
> +		goto out;
> +

Isn't this already covered by find_lock_lowest_rq()?

if @next_task migrates during the double_lock_balance(), we'll see that
it's no longer the next highest priority pushable task of its original rq
(it won't be in that pushable list at all actually):

  static struct rq *find_lock_lowest_rq(struct task_struct *task, struct rq *rq)
  {
          [...]
          if (double_lock_balance(rq, lowest_rq)) {
                  if (unlikely(is_migration_disabled(task) ||
                               !cpumask_test_cpu(lowest_rq->cpu, &task->cpus_mask) ||
                               task != pick_next_pushable_task(rq))) {

                          double_unlock_balance(rq, lowest_rq);
                          lowest_rq = NULL;
                          break;
                  }
          }
  }                

Plus:

  static int push_rt_task(struct rq *rq, bool pull)
  {
          [...]
          if (!lowest_rq) {
                  struct task_struct *task;
                  task = pick_next_pushable_task(rq);
                  [...]
                  put_task_struct(next_task);
                  next_task = task;
                  goto retry;
          }
  }        

AFAICT in the scenario you described, we'd just retry with another next
pushable task.

>  	move_queued_task_locked(rq, lowest_rq, next_task);
>  	resched_curr(lowest_rq);
>  	ret = 1;
>
> ---
> base-commit: 7c3ba4249a3604477ea9c077e10089ba7ddcaa03
> change-id: 20251008-recheck_rt_task_enqueue_state-e159aa6a2749
>
> Best regards,
> -- 
> Tengfei Fan <tengfei.fan@oss.qualcomm.com>


