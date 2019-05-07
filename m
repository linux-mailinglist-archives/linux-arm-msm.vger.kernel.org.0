Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E03BE16D03
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2019 23:18:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728557AbfEGVSc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 May 2019 17:18:32 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:39954 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727137AbfEGVSb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 May 2019 17:18:31 -0400
Received: by mail-qt1-f193.google.com with SMTP id k24so3646870qtq.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 May 2019 14:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zPjGRWUhyFVfuJKiRiDu7uhpyaOVKSPaf9PdN9YPgKk=;
        b=f+LEgFgYOiieMfsbGByYCCTeCgWoXPTR0eUf32D6l2At1DvrXmB4nvpstnQJ3gTvyp
         4r6eErOK2MrbXhtVG2/ERi/nHvZlQI0JSC/gO7tUQPP+OLn491WDXBuvSWIFxUU4Cq83
         9nlBD5bFAc+Zqktq6lD03sBxRLT9K5Bre/NRD5nc/SDG+/Bh8BksNnxIksJHjQYgXnGu
         O0NND4FWS6rIuvJcPvULa/XXiQmobGPUVnbjgZ/ySYm8psWnL12dSIuqf6HYTjx1Ct3C
         GFmOuCmdHRLAAw8ooJMrKyJvXtXnzNcvKL0H5xrNaid9NGykIkwLws1LVDa0KymagjvT
         4XvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zPjGRWUhyFVfuJKiRiDu7uhpyaOVKSPaf9PdN9YPgKk=;
        b=Nv6LRH6alTUh8XDOTJnmqDNJCV22LUXDxvNuBBCy/xt0c4j7zw0jkLqPDC1DdRRC3m
         QOflZyBni8aClnYYHKt+daRhOo5JOlI6IohwBHvKDR6v/eGJ7CV/5UlfvtC6zrEI0dsp
         SE4wSqN/5lP/6wJd9XLp+j9JzvVQV1DB01nCWAfz6dMIByw5GpSgKxmEO+iEl+oYEBjZ
         ITmJc+3TmDX032aWK2TZt8QbjeSnUnqqHUxm+NqtyT7hni405JLbjZbmoH2w8I9ctYix
         FbdAfCdBivtw5NBnfHREfq3dkyv5NR/gQmo/NLImHCaPerm6N5u1Kf9kVob0R0lXI5AY
         p9bw==
X-Gm-Message-State: APjAAAU+7hqq+AGEYqqS8js+VnOaTOo9eMY3zRKzH2a/Fvxm3EXQ8zvO
        DUGQIdZu4ahhYVCZp1NoasljYkq9fJKTJK0+mNePbKJw
X-Google-Smtp-Source: APXvYqy8Gjt4HaeOekGLbcHO1+1LKXMhZLfr9s4mSVKBMh3OOVSvm8jdCuKHH3BuKMiw3/0LBvtdCwvob1AHwBT8Oa8=
X-Received: by 2002:aed:2471:: with SMTP id s46mr8156157qtc.144.1557263910761;
 Tue, 07 May 2019 14:18:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190506193115.20909-1-niklas.cassel@linaro.org>
In-Reply-To: <20190506193115.20909-1-niklas.cassel@linaro.org>
From:   Amit Kucheria <amit.kucheria@linaro.org>
Date:   Wed, 8 May 2019 02:48:19 +0530
Message-ID: <CAP245DXLHqU3tv5cii=Z1G4J5m=Emy7yiHP=zSTpY6GX02NKcg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: qcs404: Add PSCI cpuidle support
To:     Niklas Cassel <niklas.cassel@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        Lina Iyer <lina.iyer@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, May 7, 2019 at 1:01 AM Niklas Cassel <niklas.cassel@linaro.org> wrote:
>
> Add device bindings for CPUs to suspend using PSCI as the enable-method.
>
> Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/qcs404.dtsi | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> index ffedf9640af7..f9db9f3ee10c 100644
> --- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> @@ -31,6 +31,7 @@
>                         reg = <0x100>;
>                         enable-method = "psci";
>                         next-level-cache = <&L2_0>;
> +                       cpu-idle-states = <&CPU_PC>;
>                 };
>
>                 CPU1: cpu@101 {
> @@ -39,6 +40,7 @@
>                         reg = <0x101>;
>                         enable-method = "psci";
>                         next-level-cache = <&L2_0>;
> +                       cpu-idle-states = <&CPU_PC>;
>                 };
>
>                 CPU2: cpu@102 {
> @@ -47,6 +49,7 @@
>                         reg = <0x102>;
>                         enable-method = "psci";
>                         next-level-cache = <&L2_0>;
> +                       cpu-idle-states = <&CPU_PC>;
>                 };
>
>                 CPU3: cpu@103 {
> @@ -55,12 +58,24 @@
>                         reg = <0x103>;
>                         enable-method = "psci";
>                         next-level-cache = <&L2_0>;
> +                       cpu-idle-states = <&CPU_PC>;
>                 };
>
>                 L2_0: l2-cache {
>                         compatible = "cache";
>                         cache-level = <2>;
>                 };
> +
> +               idle-states {

entry-method="psci" property goes here. I have a patch fixing it for 410c ;-)

I don't think the psci_cpuidle_ops will even get called without this.
Did you see any changes in consumption with this patch? I was trying
to measure that before sending this out.

> +                       CPU_PC: pc {
> +                               compatible = "arm,idle-state";
> +                               arm,psci-suspend-param = <0x40000003>;
> +                               entry-latency-us = <125>;
> +                               exit-latency-us = <180>;
> +                               min-residency-us = <595>;
> +                               local-timer-stop;
> +                       };
> +               };
>         };
>
>         firmware {
> --
> 2.21.0
>
