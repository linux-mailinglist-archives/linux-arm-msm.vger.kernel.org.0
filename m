Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F5CC1A93D4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2020 09:06:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393651AbgDOHGj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Apr 2020 03:06:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390574AbgDOHGh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Apr 2020 03:06:37 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 058C1C061A0E
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2020 00:06:35 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id y25so1121629pfn.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2020 00:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=gB44+UKmPj76z1NnBeNC/neb/wrLk3JtJ7qsM1U7HOo=;
        b=bv2uDX/wYmyaJRdNHZFQQZu1/xQ1jmFZPrcbg6gnQwnqZSvbs6nnsOyArJhjM/Y7gH
         jw08VROk9uuYZnSN9yC8WHydWZYCGMl1xzZoAlCN3gYiGpmiP5U4G/uVJt50OH/mWkbY
         SzCeq49IxgkOhR1rq2RX3CRF+M+B4HcdFzyTQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=gB44+UKmPj76z1NnBeNC/neb/wrLk3JtJ7qsM1U7HOo=;
        b=jan0fp5Zk7CXqZw3pJjewbNCTqksQpyKSA6BbhMQ3Ku4lk4BS2VHNTcu3b/HcT+DM5
         zU981Pg77omDwD3oRniU6BMZEEL4aO4PcQWtLOhzEAngI4TeXwLs7PMYlkxvqUM0/BuG
         RLF3nLWqRv7cbPxN39LBFOMAAp5rs4vwHsSoac7iyGb0LGLYIf0jf3cZPvSj6+Uy8dya
         +Mk0ndybzxHdEzK9j4apioMiKibQbLq9rYodQMFPCuD6Ofur8VLMx9dTX1BM/7nDts1s
         h4sDs+6s7bAbzd4zALi0aLNMjrIelGmP3Qi5ohzas26qyp+GvvRacN/Cyql5HpzcW55V
         D4IA==
X-Gm-Message-State: AGi0PuYIWzZPHvNlsgU+2Ds1L3lRZu+je/VoyDSSp49agl02XMjPpZJx
        pq4NkNHqMU36ccLClaQaOjT24w==
X-Google-Smtp-Source: APiQypLD1gz2pRrZgJsDuTIFnJu127jJZKw1RN/gdgSCN2IicZ2Bw01LaGz7MXEESFuqe5wOWrAXDw==
X-Received: by 2002:a63:2c07:: with SMTP id s7mr24739126pgs.230.1586934395227;
        Wed, 15 Apr 2020 00:06:35 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id i9sm13150593pfd.148.2020.04.15.00.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 00:06:34 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200414102312.1.I295cb72bc5334a2af80313cbe97cb5c9dcb1442c@changeid>
References: <20200414102312.1.I295cb72bc5334a2af80313cbe97cb5c9dcb1442c@changeid>
Subject: Re: [PATCH] soc: qcom: rpmh-rsc: Remove the pm_lock
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     mkshah@codeaurora.org, mka@chromium.org, evgreen@chromium.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>
Date:   Wed, 15 Apr 2020 00:06:32 -0700
Message-ID: <158693439287.105027.14163532309100663169@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2020-04-14 10:23:26)
> diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
> index 732316bb67dc..4e45a8ac6cde 100644
> --- a/drivers/soc/qcom/rpmh-rsc.c
> +++ b/drivers/soc/qcom/rpmh-rsc.c
> @@ -791,36 +790,36 @@ static int rpmh_rsc_cpu_pm_callback(struct notifier=
_block *nfb,
>  {
>         struct rsc_drv *drv =3D container_of(nfb, struct rsc_drv, rsc_pm);
>         int ret =3D NOTIFY_OK;
> -
> -       spin_lock(&drv->pm_lock);
> +       int cpus_in_pm;
> =20
>         switch (action) {
>         case CPU_PM_ENTER:
> -               cpumask_set_cpu(smp_processor_id(), &drv->cpus_entered_pm=
);
> -
> -               if (!cpumask_equal(&drv->cpus_entered_pm, cpu_online_mask=
))
> -                       goto exit;
> +               cpus_in_pm =3D atomic_inc_return(&drv->cpus_in_pm);
> +               if (cpus_in_pm < num_online_cpus())

Might be worth adding a comment here explaining that num_online_cpus()
is stable because this is called from the cpu PM notifier path and a CPU
can't go offline or come online without stopping the world.

> +                       return NOTIFY_OK;
>                 break;
>         case CPU_PM_ENTER_FAILED:
>         case CPU_PM_EXIT:
> -               cpumask_clear_cpu(smp_processor_id(), &drv->cpus_entered_=
pm);
> -               goto exit;
> -       }
> -
> -       ret =3D rpmh_rsc_ctrlr_is_busy(drv);
> -       if (ret) {
> -               ret =3D NOTIFY_BAD;
> -               goto exit;
> +               atomic_dec(&drv->cpus_in_pm);

We should also handle the cluster PM enums. I'm actually confused the
compiler didn't complain about that already. Presumably we want to just
ignore the cluster PM notifications because the counter handles it
already. Looks like other code uses NOTIFY_DONE for the default case.

> +               return NOTIFY_OK;
>         }
> =20
> -       ret =3D rpmh_flush(&drv->client);
> -       if (ret)
> +       /*
> +        * It's likely we're on the last CPU. Grab the drv->lock and write
> +        * out the sleep/wake commands to RPMH hardware. Grabbing the lock
> +        * means that if we race with another CPU coming up we are still
> +        * guaranteed to be safe. If another CPU came up just after we ch=
ecked
> +        * and has already started an active transfer then we'll notice w=
e're
> +        * busy and abort. If another CPU comes up after we start flushin=
g it
> +        * will be blocked from starting an active transfer until we're d=
one
> +        * flushing. If another CPU starts an active transfer after we re=
lease
> +        * the lock we're still OK because we're no longer the last CPU.
> +        */
> +       spin_lock(&drv->lock);

This should probably be a raw spinlock given that this is called from
the idle path and sleeping there is not very nice for RT. That can come
later of course.

> +       if (rpmh_rsc_ctrlr_is_busy(drv) || !rpmh_flush(&drv->client))

It almost feels like rpmh_rsc_ctrlr_is_busy() shold be rolled straight
into rpmh_flush() so that rpmh_flush() fails if there are active
requests in flight.

>                 ret =3D NOTIFY_BAD;
> -       else
> -               ret =3D NOTIFY_OK;
> +       spin_unlock(&drv->lock);

I'm looking at the latest linux-next code that I think has all the
patches on the list for rpmh (latest commit is 1d3c6f86fd3f ("soc: qcom:
rpmh: Allow RPMH driver to be loaded as a module")). I see that
tcs->lock is taken first, and then drv->lock is taken next in
tcs_write(). But then this takes drv->lock first and then calls
rpmh_flush() (which goes to a different file.. yay!) and that calls
flush_batch() which calls rpmh_rsc_write_ctrl_data() (back to this
file... yay again!) which then locks tcs->lock. Isn't that an ABBA
deadlock?

> =20
> -exit:
> -       spin_unlock(&drv->pm_lock);
>         return ret;
