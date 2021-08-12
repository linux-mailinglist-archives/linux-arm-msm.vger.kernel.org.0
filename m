Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C63533EABD2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Aug 2021 22:33:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233391AbhHLUeH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Aug 2021 16:34:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237366AbhHLUeH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Aug 2021 16:34:07 -0400
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0438C061756
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Aug 2021 13:33:41 -0700 (PDT)
Received: by mail-il1-x12c.google.com with SMTP id u7so8427333ilk.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Aug 2021 13:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=A9UDRRG4q1idI206MNqvq77jJ/SQ1JDQ5Hwl3h3QBmc=;
        b=PG349MzRnm8flbAtjVx9mm08lRYtiHgnYq6jP5dFDvUEFvpq5tgupPqfvJPHXFS1rK
         zUx/LvMTF7WOkbgJwGpt5o/fiTDkHR0ShtOTm0y1X0eB5SLAm+EYKKpiHave3awT1bJV
         3yMoZ4MAtQtJdKuMxLsQbJLX8dey4A2oLUkM0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A9UDRRG4q1idI206MNqvq77jJ/SQ1JDQ5Hwl3h3QBmc=;
        b=SnDf0xKARHhOf4ezhlsFGIe22dUK8nEpblK57snFgJdSiuTbDN/fqwaz8eXMfaLLeS
         ZXvcCBNAEr/n3KkE2chbhfp5Z8zlCBttW7FepT3BcRH7cWq/QVXn29P8yPkgipyBnY2V
         jjHIYfCmRJwFABgOa0SOLGaxJIokI4grSITmOYUG75M5DDWur1GwcNdfrrOPWK0DamQP
         x9Na2kV8U2yVNqoTBN4MeYQehSvKO0LD63Q/L45uX+jRXZPztooCqRyKtUA4/W9VQiuP
         xSlCpiQoMOebmn2b5UbvvcHot/eyIVOm0BmoZrMUde+UhQbSeGoAZuXeBIDOhJbwIzwP
         ej0g==
X-Gm-Message-State: AOAM532uQeZYw2/AQSaaks/9PvqD0B5vpAMHR7NAgg7nQoeMXpW0pd5b
        +x8CzfSo2F+zPJWmMxj8i1OqDU3F3U5FbQ==
X-Google-Smtp-Source: ABdhPJy2nZz0tgAJN51kvDxLe6TOpnRsJc6OcfD0Yb3YmqHuoTR5ypOvhV9uIEnWOBc3Rkcl4aRAEQ==
X-Received: by 2002:a92:c24b:: with SMTP id k11mr308237ilo.78.1628800421048;
        Thu, 12 Aug 2021 13:33:41 -0700 (PDT)
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com. [209.85.166.175])
        by smtp.gmail.com with ESMTPSA id d9sm2189664ilu.9.2021.08.12.13.33.39
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Aug 2021 13:33:39 -0700 (PDT)
Received: by mail-il1-f175.google.com with SMTP id z2so8488433iln.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Aug 2021 13:33:39 -0700 (PDT)
X-Received: by 2002:a92:d304:: with SMTP id x4mr324759ila.82.1628800419387;
 Thu, 12 Aug 2021 13:33:39 -0700 (PDT)
MIME-Version: 1.0
References: <1628777955-7198-1-git-send-email-tdas@codeaurora.org>
In-Reply-To: <1628777955-7198-1-git-send-email-tdas@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 12 Aug 2021 13:33:26 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UF1MMKg9Y0HD3xpZ36BVZyuzr3xkwXzeSz__T1XD1r=w@mail.gmail.com>
Message-ID: <CAD=FV=UF1MMKg9Y0HD3xpZ36BVZyuzr3xkwXzeSz__T1XD1r=w@mail.gmail.com>
Subject: Re: [PATCH v2] cpufreq: qcom-hw: Set dvfs_possible_from_any_cpu
 cpufreq driver flag
To:     Taniya Das <tdas@codeaurora.org>
Cc:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Aug 12, 2021 at 7:19 AM Taniya Das <tdas@codeaurora.org> wrote:
>
> As remote cpufreq updates are supported on QCOM platforms, set
> dvfs_possible_from_any_cpu cpufreq driver flag.
>
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>
> [v2]
>   * update the dvfs_possible_from_any_cpu always.
>
>  drivers/cpufreq/qcom-cpufreq-hw.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/cpufreq/qcom-cpufreq-hw.c b/drivers/cpufreq/qcom-cpufreq-hw.c
> index f86859b..53d3898 100644
> --- a/drivers/cpufreq/qcom-cpufreq-hw.c
> +++ b/drivers/cpufreq/qcom-cpufreq-hw.c
> @@ -223,6 +223,8 @@ static int qcom_cpufreq_hw_read_lut(struct device *cpu_dev,
>
>         table[i].frequency = CPUFREQ_TABLE_END;
>         policy->freq_table = table;
> +       policy->dvfs_possible_from_any_cpu = true;
> +

Why is this in the qcom_cpufreq_hw_read_lut() function? Shouldn't it
be straight in qcom_cpufreq_hw_cpu_init()?

-Doug
