Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 214DD45671C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Nov 2021 01:57:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233798AbhKSBAF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Nov 2021 20:00:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232051AbhKSBAF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Nov 2021 20:00:05 -0500
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95064C06173E
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Nov 2021 16:57:04 -0800 (PST)
Received: by mail-oi1-x235.google.com with SMTP id t19so18385549oij.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Nov 2021 16:57:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=KpfGGX30VkOymO2yELzmREoKVTuEGknozCzxtmGgXBo=;
        b=J53NqHWmM3IMV4+uaSYMHnbPb0SMk7inTF6Geye35RsTg0t49VXMDK9krn4CshCQC1
         7nQX08EDBX/CCgFjdsIeYo/xz6Xg+dSuC6D53oRxSGSErNKGU0eGsoj7IqxohNCDD4ZA
         2gCa5FwStjupff+YzsTxWwh/O2RdN9ey7oZ/c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=KpfGGX30VkOymO2yELzmREoKVTuEGknozCzxtmGgXBo=;
        b=uqqQ8cxSgORFap3+Z02qads2uZICB+0W63tFHZKP2+LFK8X1LNRjh45s0FYOCkT64s
         twYcon7hyQ5PWWIDjSPXPTN7m0qAuSLubD9YbDYKQgpWd1S0W5r5rmbPuTAz+MDrSNF4
         YQsaPAKo3WtcBGSOsiWfpt1b8gKT2frInKLd6wGdHatiRSZtBOuFAkZc8BSwC2on25GE
         HXKgZFWplEsYLE1Io8K5Z2EkzecXIlCOkNOeI3C7On2Drf8gb55HJMt3z2AFFyVH85dI
         eN/txpuKV3sKUqJMA98fA2WIdtTPHynxtWFaiALN+HthTdatAKa3fjtrJqBmTYLpkaNR
         yMYA==
X-Gm-Message-State: AOAM530IrB8ST5O7pPRVOGg48M+uG2i+0tgofQlFfk0nzyuK/ZxKlunU
        Ri4KUiYLxmHQSPKMKCLcg6GoOxU0e3bbZ9se8NtzmQ==
X-Google-Smtp-Source: ABdhPJyWy/zVzZ2R/aGrJOuF4eXPMmZ1VTk0atdR827NmlfTH8hAe0aRuENheOz20oRhwOPpSUsI+sHx52PXmXrfS4E=
X-Received: by 2002:a54:4506:: with SMTP id l6mr1302928oil.32.1637283423970;
 Thu, 18 Nov 2021 16:57:03 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 19 Nov 2021 01:57:03 +0100
MIME-Version: 1.0
In-Reply-To: <f1038a3e-57fb-ec01-26a0-452a11dfcf3a@linaro.org>
References: <20211117020346.4088302-1-swboyd@chromium.org> <76b103ec-7034-e6c1-1ab4-174cf16f9fc8@linaro.org>
 <CAE-0n53HNSRTdADO1dbQTyLafyajUTatMq5tsLeNDLQ4g95YpA@mail.gmail.com> <f1038a3e-57fb-ec01-26a0-452a11dfcf3a@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Fri, 19 Nov 2021 01:57:03 +0100
Message-ID: <CAE-0n51TYW26W8+_A1Ar7eUGLeUoV2eE=8YAkD4N7d5EqoNNRg@mail.gmail.com>
Subject: Re: [PATCH] cpufreq: qcom-hw: Use optional irq API
To:     "Rafael J . Wysocki" <rafael@kernel.org>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Thara Gopinath (2021-11-18 06:08:04)
>
>
> On 11/17/21 11:32 PM, Stephen Boyd wrote:
> > Quoting Thara Gopinath (2021-11-17 18:55:17)
> >> Hello Stephen,
> >>
> >> Thanks for the patch
> >>
> >> On 11/16/21 9:03 PM, Stephen Boyd wrote:
> >>> Use platform_get_irq_optional() to avoid a noisy error message when the
> >>> irq isn't specified. The irq is definitely optional given that we only
> >>> care about errors that are -EPROBE_DEFER here.
> >>>
> >>> Cc: Thara Gopinath <thara.gopinath@linaro.org>
> >>> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> >>> ---
> >>>    drivers/cpufreq/qcom-cpufreq-hw.c | 8 +++++---
> >>>    1 file changed, 5 insertions(+), 3 deletions(-)
> >>>
> >>> diff --git a/drivers/cpufreq/qcom-cpufreq-hw.c b/drivers/cpufreq/qcom-cpufreq-hw.c
> >>> index a2be0df7e174..b442d4983a22 100644
> >>> --- a/drivers/cpufreq/qcom-cpufreq-hw.c
> >>> +++ b/drivers/cpufreq/qcom-cpufreq-hw.c
> >>> @@ -382,9 +382,11 @@ static int qcom_cpufreq_hw_lmh_init(struct cpufreq_policy *policy, int index)
> >>>         * Look for LMh interrupt. If no interrupt line is specified /
> >>>         * if there is an error, allow cpufreq to be enabled as usual.
> >>>         */
> >>> -     data->throttle_irq = platform_get_irq(pdev, index);
> >>> -     if (data->throttle_irq <= 0)
> >>> -             return data->throttle_irq == -EPROBE_DEFER ? -EPROBE_DEFER : 0;
> >>> +     data->throttle_irq = platform_get_irq_optional(pdev, index);
> >>> +     if (data->throttle_irq == -ENXIO)
> >>> +             return 0;
> >>> +     if (data->throttle_irq < 0)
> >>> +             return data->throttle_irq;
> >>
> >> Here the idea is to return only -EPROBE_DEFER error. Else return a 0 ,
> >> so that cpufreq is enabled even if lmh interrupt is inaccessible. The
> >> above check returns errors other than -EPROBE_DEFER as well. So I would
> >> say make irq optional and keep the below check
> >>
> >> if (data->throttle_irq <= 0)
> >>          return data->throttle_irq == -EPROBE_DEFER ? -EPROBE_DEFER : 0;
> >
> > I'd like to catch other errors, for example, DT has an irq specified
> > that is outside the range of irqs available. If the DT is correct, then
> > it will either have a valid irq and this will return a >= 0 value or
> > nothing will be specified and we'll get back -ENXIO now. Do you have
> > some scenario where my patch fails to work?
>
> Exactly. Like in the scenario you mentioned above, I do not want cpufreq
> to be disabled. This interrupt is a throttle notification interrupt. The
> action taken on basis of this is to send thermal pressure signal to
> scheduler so that scheduler places tasks better. Even if the dt has
> messed up this interrupt, I think cpufreq should still be enabled. May
> be we can print a warn and still return 0 to enable cpufreq.
>

If the DT is messed up then we have problems that we should fix instead
of silently ignore in this driver. Is there some bad DT out there that
you're worried about? I don't believe this patch breaks anything but if
you can point to something that it breaks I'd be glad to investigate.
