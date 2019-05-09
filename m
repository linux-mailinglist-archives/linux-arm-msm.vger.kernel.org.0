Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 392DB19348
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2019 22:19:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726935AbfEIUT2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 May 2019 16:19:28 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:50573 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726765AbfEIUT2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 May 2019 16:19:28 -0400
Received: by mail-wm1-f66.google.com with SMTP id y17so3870979wmj.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 May 2019 13:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=GJZ5Q6jA4O7aJU9I1R7Mdcv4Tb9to2ZldjQmNYgzvPA=;
        b=IO+KoQF0XExQgYMUQurYWk908PrOrvDWgPkKvUFydb54+mGRvonFr1iT+FubWy3OBA
         QpyEdwU8/OJ4+G9+lxN1J9UzAAXIDbt6s41pTK12AlT2em+Ibb/YaLYfaKzygpMPJPJC
         P3ICeH3z4JYLoMXM7xdSW1PhUn+yUn4epbKK8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=GJZ5Q6jA4O7aJU9I1R7Mdcv4Tb9to2ZldjQmNYgzvPA=;
        b=N2yhPhQTfjYQNIMVBX1l5/R6tWWnReREeih+CLD+B0h0yzy6kEgTeoy9VbTmquhNCe
         e2mOSqT81ISjpvcMhrMWhqrNYJa6qwIRqwXdVw5MO0+xugUDH5ZyQiXhHJ/gUIalMAuB
         2hgDD7wfkFfcd6L4K/rZjJ+9Dp0+svzM96s0/x/aCy2XFsX9AxwwNVbd9mpvrLWzjrPl
         aCrARlOk2BZ3dwERRvOLGXoCDr/c3DdbyhaVyZAf+hh5nLygUlAjq8BwiLl2bW1OZhug
         ERVUZi2Bl0rDB2I4PBM8pmc4CaMDlzZMmDvSdS/4rF+7OkJoRHsgYw250/YhSh2Fjp0i
         oPEQ==
X-Gm-Message-State: APjAAAXtBHaBsQ3nxT8S5moKs0wfY9oqUL4dk3vyIuwEo8i1Tro48HTt
        fVcSnhQQemjvcYFjFdUkYrnkSQ==
X-Google-Smtp-Source: APXvYqzxxHBFuaNUV6bBo6nlGo/Tnntlk9agUnyauDkHld2lgHrK9FItg2MrJoRjimGw6vVaZIhwAg==
X-Received: by 2002:a1c:cb48:: with SMTP id b69mr4393573wmg.109.1557433165640;
        Thu, 09 May 2019 13:19:25 -0700 (PDT)
Received: from andrea ([91.252.228.170])
        by smtp.gmail.com with ESMTPSA id z74sm9649240wmc.2.2019.05.09.13.19.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 May 2019 13:19:24 -0700 (PDT)
Date:   Thu, 9 May 2019 22:19:15 +0200
From:   Andrea Parri <andrea.parri@amarulasolutions.com>
To:     linux-kernel@vger.kernel.org
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        "Paul E. McKenney" <paulmck@linux.ibm.com>,
        Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH 1/5] drm/msm: Fix improper uses of
 smp_mb__{before,after}_atomic()
Message-ID: <20190509201915.GA2931@andrea>
References: <1556568902-12464-1-git-send-email-andrea.parri@amarulasolutions.com>
 <1556568902-12464-2-git-send-email-andrea.parri@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1556568902-12464-2-git-send-email-andrea.parri@amarulasolutions.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Apr 29, 2019 at 10:14:57PM +0200, Andrea Parri wrote:
> These barriers only apply to the read-modify-write operations; in
> particular, they do not apply to the atomic_set() primitive.
> 
> Replace the barriers with smp_mb()s.
> 
> Fixes: b1fc2839d2f92 ("drm/msm: Implement preemption for A5XX targets")
> Cc: stable@vger.kernel.org
> Reported-by: "Paul E. McKenney" <paulmck@linux.ibm.com>
> Reported-by: Peter Zijlstra <peterz@infradead.org>
> Signed-off-by: Andrea Parri <andrea.parri@amarulasolutions.com>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Jordan Crouse <jcrouse@codeaurora.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org

Rob, Sean, Jordan: any suggestions to move this patch forward?

Thanx,
  Andrea


> ---
>  drivers/gpu/drm/msm/adreno/a5xx_preempt.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
> index 3d62310a535fb..ee0820ee0c664 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
> @@ -39,10 +39,10 @@ static inline void set_preempt_state(struct a5xx_gpu *gpu,
>  	 * preemption or in the interrupt handler so barriers are needed
>  	 * before...
>  	 */
> -	smp_mb__before_atomic();
> +	smp_mb();
>  	atomic_set(&gpu->preempt_state, new);
>  	/* ... and after*/
> -	smp_mb__after_atomic();
> +	smp_mb();
>  }
>  
>  /* Write the most recent wptr for the given ring into the hardware */
> -- 
> 2.7.4
> 
