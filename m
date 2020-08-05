Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F60123D3AB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Aug 2020 23:47:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726027AbgHEVrk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Aug 2020 17:47:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725969AbgHEVrj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Aug 2020 17:47:39 -0400
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98A75C061575
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 Aug 2020 14:47:38 -0700 (PDT)
Received: by mail-oi1-x243.google.com with SMTP id j7so24610800oij.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Aug 2020 14:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=iS1HIzC2VQtRzbEvLhI4Xg8Nj2mavELVrx/H/VkP64k=;
        b=I5SvK1ozfyQMTOos6/OHD9zLqGGZTErZKvjtYOxfeUWvVKhkj3s8uesaPhZeQi1s7t
         R2B1ccRmYfRdEGnpD8aPB5KNFlt9ZkRA/RPIPt94h9kv9Uz8fOz6hQsLAP2oFMjwvayx
         SmtjMLrhVXxrX+Y+wCwl4YAavbjzBXMLXIELo7p/Fdy3g7Qzw1w6u7Yhr4FT2ro46TS2
         jqzfOxUOImlDLNcjQ+GaQMz7Hy0ufGg9E7qVYDH/TA6MYoaj1nlixYl2a5SpnsFZCtZC
         6bO4mXkwFrDryDduRDBXg4jyp138x9bhWGSG6nu4cC3O7esBdNHPBxzAg2dUhYQIk0D2
         5Xxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=iS1HIzC2VQtRzbEvLhI4Xg8Nj2mavELVrx/H/VkP64k=;
        b=cRf1QS1Syr5BKyHQSovK08cHxqi+rONOOFEArmFMfVVTXqWabogQBqci3W7at+e+WJ
         CxpBNGwpjXvocOeOQz3h1Yob/8xiLnK3X3L4PgErjzLnHRj9Fv8Oxy8NA67xgD8qjElX
         gXs5kGIONwLhqquoaSbvQzTaVx34/xdKta0gr0IK4VES4aykUtzDFpw/1ubz2+tp54sV
         gIkxOx/Y451mNl8lSZoSoYLHV0F09Li1WlQb4rcmLa+0+0USFN2HsZM1+QlI9gLjoqDb
         Ys0iKmBXL/XxApMGY42saWWGaln8HdITDEWZ6UoKtl8dmvnHwD+yv2YF3kAkNVOFuhSN
         KpDQ==
X-Gm-Message-State: AOAM532B/kOTYnYjJnkHjZQFYwI2AnST3jAkMl+DthN61oLCTUbpOI3O
        rVdf/7FKcQrA/Nai8p6wSscBWQ==
X-Google-Smtp-Source: ABdhPJzwG1Nuz0e+TG+qiJWstZZqXx4zRnncD8qI2Md0QHQfWUH0wUB/FqqLOT6Chto/xq+frey9aQ==
X-Received: by 2002:aca:6c6:: with SMTP id 189mr4314977oig.134.1596664058026;
        Wed, 05 Aug 2020 14:47:38 -0700 (PDT)
Received: from Steevs-MBP.hackershack.net (cpe-173-175-113-3.satx.res.rr.com. [173.175.113.3])
        by smtp.gmail.com with ESMTPSA id 90sm666015oty.9.2020.08.05.14.47.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2020 14:47:37 -0700 (PDT)
Subject: Re: [PATCH v3 2/4] irqchip/qcom-pdc: Switch to using
 IRQCHIP_PLATFORM_DRIVER helper macros
From:   Steev Klimaszewski <steev@kali.org>
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
 <f314b687-11a9-5a5e-e79e-c46dd2f16c6f@kali.org>
Message-ID: <78ad0914-6173-f753-9eba-b7cbfbb51fd6@kali.org>
Date:   Wed, 5 Aug 2020 16:47:35 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <f314b687-11a9-5a5e-e79e-c46dd2f16c6f@kali.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 8/5/20 4:16 PM, Steev Klimaszewski wrote:
> On 8/5/20 3:19 PM, Saravana Kannan wrote:
>> On Wed, Aug 5, 2020 at 12:44 AM John Stultz <john.stultz@linaro.org> wrote:
>>> <sigh>
>>> So this is where I bashfully admit I didn't get a chance to try this
>>> patch series out, as I had success with a much older version of
>>> Saravana's macro magic.
>>>
>>> But unfortunately, now that this has landed in mainline, I'm seeing
>>> boot regressions on db845c. :( This is in the non-modular case,
>>> building the driver in.
>> Does that mean the modular version is working? Or you haven't tried
>> that yet? I'll wait for your reply before I try to fix it. I don't
>> have the hardware, but it should be easy to guess this issue looking
>> at the code delta.
> For what it's worth, I saw this too on the Lenovo C630 (started on -next
> around 20200727, but I didn't track it down as, well, there's less way
> to get debug output on the C630.
>
> In my testing, module or built-in doesn't matter, but reverting does
> allow me to boot again.
>
Actually - I spoke too soon - QCOM_PDC built-in with the commit reverted
boots, however, module (on the c630 at least) doesn't boot whether it's
a module or built-in.


>> The only significant change from what your probe function is doing is
>> this snippet. But it'd be surprising if this only affects the builtin
>> case.
>>
>> + if (par_np == np)
>> +         par_np = NULL;
>> +
>> + /*
>> + * If there's a parent interrupt controller and  none of the parent irq
>> + * domains have been registered, that means the parent interrupt
>> + * controller has not been initialized yet.  it's not time for this
>> + * interrupt controller to initialize. So, defer probe of this
>> + * interrupt controller. The actual initialization callback of this
>> + * interrupt controller can check for specific domains as necessary.
>> + */
>> + if (par_np && !irq_find_matching_host(np, DOMAIN_BUS_ANY))
>> +         return -EPROBE_DEFER;
>>
>>> I managed to bisect it down to this patch, and reverting it avoids the
>>> issue. I don't see what is wrong right off, but I really need to get
>>> to bed, so I'll dig further tomorrow.
>>>
>>> Saravana: Apologies for not getting around to testing this beforehand!
>> No worries. Apologies for breaking it accidentally.
>>
>> -Saravana
