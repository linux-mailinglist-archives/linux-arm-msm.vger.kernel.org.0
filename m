Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16E0D354764
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Apr 2021 22:10:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240625AbhDEUKU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Apr 2021 16:10:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:45872 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240551AbhDEUKT (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Apr 2021 16:10:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BD45E613C6;
        Mon,  5 Apr 2021 20:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617653413;
        bh=rA9Zw09mciODJSeIM6nLu1weM/1jrMiqvN1zY0ZxHSg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=a2wZHdPHPxGrE89siTyA8zgo6TKoPjjIwMqsUhmkVbn6s4cXVFePs9xSw17+uqopn
         Fn5OFCNbk4uqQe7KurPl++k2gmNFrYCCfBeF0KwJRUE89mec3UPSn1r2pVDWninHls
         CnCkISCQSmFj6gLty+IrzlfDr/L3oDXpfZU2JL9Jn3aqTzcRSur9cifN99wpgLqcKC
         1QlIsDhIloODxgDQZFcmNY+AkkiQbdMHm/BIyh/3FUjK8MApqX7Ga4OqPabGvQ6xbN
         FYF7nOSzxPqv3uF73lBMMICzgOJUyX23iYqHeGwqQIKWQPOCkVQG5G+JSr9uH4+DRh
         RxZZv4aU8N1sg==
Received: by mail-lj1-f172.google.com with SMTP id s17so13921401ljc.5;
        Mon, 05 Apr 2021 13:10:12 -0700 (PDT)
X-Gm-Message-State: AOAM530foF3sIqK4Igu9V+X3kRT7Kee4AqOv+YroGGboR7/f9KQoATn6
        s3h8qo3qczwPxwN2GK/viT43yzobL6yHFEVGmAw=
X-Google-Smtp-Source: ABdhPJzLJMYoipMVG9xL5GkooeRMfaNFnIj44znyKkjoO9ZYjIYhgyAWmpvGtsOPDAiaxl/tDjhC9PG/mE4R9Eip2fU=
X-Received: by 2002:a2e:8919:: with SMTP id d25mr17398026lji.187.1617653411035;
 Mon, 05 Apr 2021 13:10:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210405200259.23525-1-petr.vorel@gmail.com>
In-Reply-To: <20210405200259.23525-1-petr.vorel@gmail.com>
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
Date:   Mon, 5 Apr 2021 22:09:54 +0200
X-Gmail-Original-Message-ID: <CAPybu_2_iCHO37PfQhu8+6WrSb_VMXgGzkiAhw7+B-wLOd7GRQ@mail.gmail.com>
Message-ID: <CAPybu_2_iCHO37PfQhu8+6WrSb_VMXgGzkiAhw7+B-wLOd7GRQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] arm64: dts: qcom: msm8994: Reserve gpio ranges
To:     Petr Vorel <petr.vorel@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Konrad Dybcio <konradybcio@gmail.com>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Petr

On Mon, Apr 5, 2021 at 10:03 PM Petr Vorel <petr.vorel@gmail.com> wrote:
>
> Reserve pins 0-3 and 85-88 as these aren't meant to be accessible
> from the application CPUs. Fix similar to 9134586715e3.
>
> Fixes: 3edfb7bd76bd ("gpiolib: Show correct direction from the beginning")

Why the Fixes?

Is the behaviour different if that patch is not applied?

>
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
> Hi,
>
> tested on latest qcom/for-next.
>
> Simple testing with /sys/class/gpio/export showed that 85-88.
> 3 disables UART. I expect 0-2 are also reserved as on other msm8998.
>
> for i in $(seq 0 146); do echo $i > /sys/class/gpio/export; done
>
> I expect it's just angler specific, thus I haven't added it to msm8994.dtsi
> (otherwise Konrad would have fixed it).
>
> Kind regards,
> Petr
>
>  arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts b/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
> index baa55643b40f..0dc94101d5de 100644
> --- a/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /* Copyright (c) 2015, Huawei Inc. All rights reserved.
>   * Copyright (c) 2016, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2021 Petr Vorel <petr.vorel@gmail.com>
>   */
>
>  /dts-v1/;
> @@ -32,3 +33,7 @@ serial@f991e000 {
>                 };
>         };
>  };
> +
> +&tlmm {
> +       gpio-reserved-ranges = <0 4>, <85 4>;
> +};
> --
> 2.30.2
>
