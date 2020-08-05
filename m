Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFB6B23D385
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Aug 2020 23:16:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726660AbgHEVQm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Aug 2020 17:16:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726128AbgHEVQk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Aug 2020 17:16:40 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF1ABC06174A
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 Aug 2020 14:16:40 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id j7so24538391oij.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Aug 2020 14:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=Grm1cy93TykL2UQMLvitYfHftzNHr5WnvDxuij6JO+U=;
        b=hDRflfqSy7WcRWVgHidQaxalAI6pcrvC53q01AJTbJpMbWw0sNYAQ9P8vdMHgeRPzt
         pUMxybYMki+htTItPgxlEP+8j/xk9QLY3EMGVh9z6ID72rcfx2NsTFKdbZkn34p/DPpP
         sATeXwBCbvxxrxPCwOuI8ihYtOlfZ7xmHXT9/x8dv+2qc4DekekRa9QXqMEbg4nPpLoe
         mCp17blYYj28WG6NcfnvFnXtPSr1c/W8XUYmWMHx9vukbEXs2AwcAcUDWTuD7C8CDMIG
         55CsIkGcXeDMzVmXgFMgfXN+LBKjaHa4o7RvWYyAjaNKs5sVrbjm4uCVACRUrrNdkB6H
         aYeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=Grm1cy93TykL2UQMLvitYfHftzNHr5WnvDxuij6JO+U=;
        b=ENZa39cr7aNNE0OCwcSwbj6fnYLuy1UDuwElGg7ObsKJEEUpBaudQq2qMoH/0knt49
         rk5uRKblzAWjsrZfStuufscV6LrnlbKpGEMG9i5txC9+cXT7Jwxljc4G+3ckRREBpywr
         R55kMpq9izHZe/IHpRof5C5ydlIxz+G46tYQg/hdlFwH5pcyIwutzVukVHgkZmOkHQiA
         MsTylP2waLmQtX+N5oo7X8SJPJHb/1zfVVJOLmE0hRe1P2+GpuMYMRqaGjOfQaQOfPDW
         Zw7fGDO/txILjeNLXdwKgBAZROyWVEucth6eZeQNIeSsxN+9Wa6UBdDvUCJBJySeZ6Wh
         1hew==
X-Gm-Message-State: AOAM533C9Mt/RuWqN88VoWLgPZPzeE9IUb4+WDXEf4y2wsHCj6dpJmKz
        r4mIOttvo6e3GH9fvinLwu+/Dw==
X-Google-Smtp-Source: ABdhPJyq3up6BgBEF4JBbpDeMKpsNeJVYqW/Eie4xYc5kopvUzCGvKOxeLD5qDnmN0Ym3dFzcn5GIA==
X-Received: by 2002:aca:c5d6:: with SMTP id v205mr4539034oif.143.1596662200100;
        Wed, 05 Aug 2020 14:16:40 -0700 (PDT)
Received: from Steevs-MBP.hackershack.net (cpe-173-175-113-3.satx.res.rr.com. [173.175.113.3])
        by smtp.gmail.com with ESMTPSA id 33sm609369ots.12.2020.08.05.14.16.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2020 14:16:39 -0700 (PDT)
Subject: Re: [PATCH v3 2/4] irqchip/qcom-pdc: Switch to using
 IRQCHIP_PLATFORM_DRIVER helper macros
To:     Saravana Kannan <saravanak@google.com>,
        John Stultz <john.stultz@linaro.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Android Kernel Team <kernel-team@android.com>,
        lkml <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Hanks Chen <hanks.chen@mediatek.com>,
        CC Hwang <cc.hwang@mediatek.com>,
        Loda Chou <loda.chou@mediatek.com>
References: <20200718000637.3632841-1-saravanak@google.com>
 <20200718000637.3632841-3-saravanak@google.com>
 <CALAqxLVZ+rFE+hM9OtQ46NqpTHeLu6oKLNWKstLv1U5zbwyq7g@mail.gmail.com>
 <CAGETcx_rkK3-bKhDP_N4n_WyXLXFPoaUV9rbY_Y+H1Joj=dCyw@mail.gmail.com>
From:   Steev Klimaszewski <steev@kali.org>
Message-ID: <f314b687-11a9-5a5e-e79e-c46dd2f16c6f@kali.org>
Date:   Wed, 5 Aug 2020 16:16:37 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAGETcx_rkK3-bKhDP_N4n_WyXLXFPoaUV9rbY_Y+H1Joj=dCyw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 8/5/20 3:19 PM, Saravana Kannan wrote:
> On Wed, Aug 5, 2020 at 12:44 AM John Stultz <john.stultz@linaro.org> wrote:
>> <sigh>
>> So this is where I bashfully admit I didn't get a chance to try this
>> patch series out, as I had success with a much older version of
>> Saravana's macro magic.
>>
>> But unfortunately, now that this has landed in mainline, I'm seeing
>> boot regressions on db845c. :( This is in the non-modular case,
>> building the driver in.
> Does that mean the modular version is working? Or you haven't tried
> that yet? I'll wait for your reply before I try to fix it. I don't
> have the hardware, but it should be easy to guess this issue looking
> at the code delta.

For what it's worth, I saw this too on the Lenovo C630 (started on -next
around 20200727, but I didn't track it down as, well, there's less way
to get debug output on the C630.

In my testing, module or built-in doesn't matter, but reverting does
allow me to boot again.

> The only significant change from what your probe function is doing is
> this snippet. But it'd be surprising if this only affects the builtin
> case.
>
> + if (par_np == np)
> +         par_np = NULL;
> +
> + /*
> + * If there's a parent interrupt controller and  none of the parent irq
> + * domains have been registered, that means the parent interrupt
> + * controller has not been initialized yet.  it's not time for this
> + * interrupt controller to initialize. So, defer probe of this
> + * interrupt controller. The actual initialization callback of this
> + * interrupt controller can check for specific domains as necessary.
> + */
> + if (par_np && !irq_find_matching_host(np, DOMAIN_BUS_ANY))
> +         return -EPROBE_DEFER;
>
>> I managed to bisect it down to this patch, and reverting it avoids the
>> issue. I don't see what is wrong right off, but I really need to get
>> to bed, so I'll dig further tomorrow.
>>
>> Saravana: Apologies for not getting around to testing this beforehand!
> No worries. Apologies for breaking it accidentally.
>
> -Saravana
