Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0A054539D8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Nov 2021 20:06:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239560AbhKPTJI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Nov 2021 14:09:08 -0500
Received: from mail-oi1-f170.google.com ([209.85.167.170]:44668 "EHLO
        mail-oi1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239519AbhKPTJH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Nov 2021 14:09:07 -0500
Received: by mail-oi1-f170.google.com with SMTP id be32so600329oib.11;
        Tue, 16 Nov 2021 11:06:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b97lnIo7l9dscemuWNWaZ11+qmGpj4P8mDyidolcjwc=;
        b=TMo5hptKDllBjDIBwiZJqY364zcxX7TW6e7Uq/3KR0tqD53wU0Rboj9dBR0FZJql/H
         123DgwKaKMmNH+B05dLZPbC/kB73fhzvGdJodK890hmwm+ALnP8MofOIdYGk+OVVk4qR
         UdPbO/DWRT/7r+f8HmbN4sbU7Ko9/YD/9puNEYDMrNWSba3J3MYPvl0f0/9li4vQ30x3
         Lu22YRIQRyTU7nqt11uGRzbseTcgh3+b/DtQsBkNw1qWNpHF73McYAZtlEnPaCMx5akA
         L2fyJlbhGG/9sDn9cPrD/zVtijV9KwaZ6NxmcTjJNSZ92D7JLBfQzgltDIJSGGRouKMm
         dThQ==
X-Gm-Message-State: AOAM533f2H90YNsrwyJsyBskIUAXqlqwaTE1TZKRwlz3R8MhN+zhFE0m
        6wPzdOBN+ockCaGl0Wxl4ycQnpqQxti1kC0k8xA=
X-Google-Smtp-Source: ABdhPJyozLbc3vIApJTMuDo4WIf+a5LG05VNDbN52nIfaopuGylGH1TZXNSCfxuoyP4G9Jdb0o3NmfhTK2Y6sDoHnHg=
X-Received: by 2002:a05:6808:14c2:: with SMTP id f2mr8530897oiw.154.1637089570259;
 Tue, 16 Nov 2021 11:06:10 -0800 (PST)
MIME-Version: 1.0
References: <20211115201010.68567-1-thara.gopinath@linaro.org>
In-Reply-To: <20211115201010.68567-1-thara.gopinath@linaro.org>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Tue, 16 Nov 2021 20:05:59 +0100
Message-ID: <CAJZ5v0gezoJZVH69Y7fDwa-uLhE0PaqFrzM=0bequxpE_749zg@mail.gmail.com>
Subject: Re: [PATCH] base: arch_topology: Use policy->max to calculate freq_factor
To:     Thara Gopinath <thara.gopinath@linaro.org>
Cc:     Sudeep Holla <sudeep.holla@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Nov 15, 2021 at 9:10 PM Thara Gopinath
<thara.gopinath@linaro.org> wrote:
>
> cpuinfo.max_freq can reflect boost frequency if enabled during boot.  Since
> we don't consider boost frequencies while calculating cpu capacities, use
> policy->max to populate the freq_factor during boot up.

I'm not sure about this.  schedutil uses cpuinfo.max_freq as the max frequency.

> Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
> ---
>  drivers/base/arch_topology.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
> index 43407665918f..df818b439bc3 100644
> --- a/drivers/base/arch_topology.c
> +++ b/drivers/base/arch_topology.c
> @@ -334,7 +334,7 @@ init_cpu_capacity_callback(struct notifier_block *nb,
>         cpumask_andnot(cpus_to_visit, cpus_to_visit, policy->related_cpus);
>
>         for_each_cpu(cpu, policy->related_cpus)
> -               per_cpu(freq_factor, cpu) = policy->cpuinfo.max_freq / 1000;
> +               per_cpu(freq_factor, cpu) = policy->max / 1000;
>
>         if (cpumask_empty(cpus_to_visit)) {
>                 topology_normalize_cpu_scale();
> --
> 2.25.1
>
