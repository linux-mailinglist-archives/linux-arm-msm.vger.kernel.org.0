Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C2F24A001B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jan 2022 19:30:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348071AbiA1Sa0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Jan 2022 13:30:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243237AbiA1SaZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Jan 2022 13:30:25 -0500
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F36B0C06173B
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jan 2022 10:30:24 -0800 (PST)
Received: by mail-oi1-x22c.google.com with SMTP id y23so13835621oia.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jan 2022 10:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=255BVw7+Ht0b8sdVHt7ws2Ve8e5tAHnc/nipGjdYGp0=;
        b=EEJpZtCHAcUPBVHDEt8/8j6Y06vhmk5k14Knz6haNa+/3HpxiSqJBPz46ecBlEdFWD
         +Axw3MHdAC35prQcjEwCZj914HYtKUhRfdd8ZUBcyA9MhYCKgEntbaWmC5xmurfMMn1G
         ass2HtUTa2wzYB6TOLbHG84Th8SSWeT/h2eOF/UoskJmoQD4WLBjzxLtFPiqY+LL8Yy3
         zVRBXghfCdStwW9b4O4X7ScE1FgwmDgF6JJaqNJJhco8FyoIur76yEr5PyxyJW+52sym
         2gBXcVAItfbioHCR4g628wY4QQj10oyFAIZA72JH2wZP5hhBq1W8HWiRGnmt7csEp62g
         fXOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=255BVw7+Ht0b8sdVHt7ws2Ve8e5tAHnc/nipGjdYGp0=;
        b=lkO7oHlCCRTZoFk1iPug4Iw6Zxt66oS5/kuGNKxmleD80uUP1eCvn+9M/0y71MfUiV
         HlxNjkSBzr2Y1g7VB4pGhiQPBRlHckKW1aekr9K/IlfPHpo12rCvlzSIsmzjrCljHQMx
         hcwy0nE11qghppMSLNcwpHpkhtMjN8LXIOCoH/s9nz1cznVO+kfEm811H9MD7S5gQ0Oh
         Pv+8/PXmnTPdxgqqeEuBe2Zgc3FUsXf4ALhIfLJSEpNdK3x//m4YdnxZGOeBVKwotFoz
         C/5c1zyJaEFYBsUEee/DSV2y+qw9CcJ9IbgM6cb4TMlXL3IvbeZstfjPeRYr72Src/Q3
         1P9Q==
X-Gm-Message-State: AOAM5306RSBBptyHHvJXiVI7gVpbKYavoAZrvNDnIUedTTRhBzstblev
        ni4coeNKtVguL/WzmZwdhkWDbjoZwimuyQ==
X-Google-Smtp-Source: ABdhPJw3fgunIiMqXvsJlYsQB6YNJPusV5AEIDPjrkMWBztd7tGWvDrzSr4LAkUaCP1vZjbS3zX6HQ==
X-Received: by 2002:a05:6808:2214:: with SMTP id bd20mr8376062oib.159.1643394624296;
        Fri, 28 Jan 2022 10:30:24 -0800 (PST)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id s3sm8272427otg.67.2022.01.28.10.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jan 2022 10:30:23 -0800 (PST)
Date:   Fri, 28 Jan 2022 10:30:48 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Lukasz Luba <lukasz.luba@arm.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-pm@vger.kernel.org,
        "Rafael J. Wysocki" <rafael@kernel.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v2 2/2] cpufreq: qcom-hw: Delay enabling throttle_irq
Message-ID: <YfQ2WEiqV30PGNrt@ripper>
References: <20220128032554.155132-1-bjorn.andersson@linaro.org>
 <20220128032554.155132-2-bjorn.andersson@linaro.org>
 <5433250b-ee51-06e0-3ef8-ab287a112611@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5433250b-ee51-06e0-3ef8-ab287a112611@arm.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 28 Jan 02:39 PST 2022, Lukasz Luba wrote:

> 
> 
> On 1/28/22 3:25 AM, Bjorn Andersson wrote:
> > In the event that the SoC is under thermal pressure while booting it's
> > possible for the dcvs notification to happen inbetween the cpufreq
> > framework calling init and it actually updating the policy's
> > related_cpus cpumask.
> > 
> > Prior to the introduction of the thermal pressure update helper an empty
> > cpumask would simply result in the thermal pressure of no cpus being
> > updated, but the new code will attempt to dereference an invalid per_cpu
> > variable.
> 
> Just to confirm, is that per-cpu var the 'policy->related_cpus' in this
> driver?
> 

Correct, we boot under thermal pressure, so the interrupt fires before
we return from "init", which means that related_cpus is still 0.

> > 
> > Avoid this problem by using the newly reintroduced "ready" callback, to
> > postpone enabling the IRQ until the related_cpus cpumask is filled in.
> > 
> > Fixes: 0258cb19c77d ("cpufreq: qcom-cpufreq-hw: Use new thermal pressure update function")
> 
> You have 'Fixes' tagging here, which might be picked by the stable tree.
> The code uses the reverted callback .ready(), which might be missing
> there (since patch 1/2 doesn't have tagging). This patch looks like a
> proper fix for the root cause.
> 

Yes, the pair would need to be picked up.

> Anyway, I'm going to send a patch, which adds a check for null cpumask
> in the topology_update_thermal_pressure()
> It was removed after the review comments:
> https://lore.kernel.org/linux-pm/20211028054459.dve6s2my2tq7odem@vireshk-i7/
> 

I attempted that in v1:
https://lore.kernel.org/all/20220118185612.2067031-2-bjorn.andersson@linaro.org/

And while patch 1 is broken, I think Greg and Sudeep made it clear that
they didn't want a condition to guard against the caller passing cpus of
0.

That's why I in v2 reverted to postpone the thermal pressure IRQ until
cpufreq is "ready".

Regards,
Bjorn

> I'll also push that change for the stable tree.
> 
> Regards,
> Lukasz
