Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5398A103959
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2019 13:00:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729482AbfKTMAo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Nov 2019 07:00:44 -0500
Received: from mail-ua1-f66.google.com ([209.85.222.66]:46511 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729006AbfKTMAo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Nov 2019 07:00:44 -0500
Received: by mail-ua1-f66.google.com with SMTP id i31so7669365uae.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Nov 2019 04:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B0tsxj8KZGAT/o1qcGiW6HKsR+OIwQVXMM2ODuLvIpk=;
        b=EqVhZA3XS/izMBNsikllPUdPo/A4jO0CJ2WlCc6sonVPI2GnfaVvbdDuNlHdyVmBWs
         04nfUBbI06D35YPWUGTFpPWM+eHRl7KJqzvMQZ83STlGgvja0fblAtHeSfAFZaJtrKA1
         zmFiNtK3ttF7B1Fj4bDCbrnfA1x2DjrISFT4bYrf4bnivgaf2hWaN/7r/wMso4uvtHqe
         shcCcvg8GlTnd3B7NHCeEdi4N+JTWa5XVlWqJoGC8NG0l9O8cxzUQYX3uLaU9pld4Ptn
         uKq5VO98MpAoB+6hx23bKtwlM4Kx3cxqoTlHoH7OXOjuf6SVEg0kUKz7XdpkTWoKVgaL
         HNqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B0tsxj8KZGAT/o1qcGiW6HKsR+OIwQVXMM2ODuLvIpk=;
        b=ck5CktQDY2nS0QadQazvkuNd9Awfl3m13IzLfgemUcLNyUcA0hqQh4B8wU771zHZWS
         wADV8THL8Cpt0NfRYhTATfQrP6jT0HilcY2bpYYn8CHZ8hj1wOkzX6JoNS/X/5MpfkGs
         ++DheKHWQjO9Jg6mSCUXU5AgT4hwsAi7KCxCuOojVeIFEmBj5cyVDg+U/6LJWWA3q9hF
         L7vMdl8Bme2n1FprhlspfyHUGcpWCSfTCzhjWRrdTclfY/g9vp6bLnvSa7m1iU0qFdN6
         4FTuIKP2+Dn2D4eVLU+MhCn9PWzuE3xp7vTvIut7T8eBDt30uifm084a9+vDs4S7XVJF
         O66A==
X-Gm-Message-State: APjAAAXvE4uF6XM+vuA0NR1Bx/LZQ79Q72syd9KmnA6YBzWavLU4W9jX
        PfA4IS8kQ4wcRorbPoJixT4wS/Tf4K2yayfO/9JGiA==
X-Google-Smtp-Source: APXvYqyiLCF3MBQoSmzlqqxli2MvGV261pRD3zdGvysKb7s9Nit3G2b6p/dRiZmGs4K0UtVDM+P1vhy5Y89wBip3NWE=
X-Received: by 2002:ab0:74cd:: with SMTP id f13mr1351834uaq.104.1574251241748;
 Wed, 20 Nov 2019 04:00:41 -0800 (PST)
MIME-Version: 1.0
References: <20191119154621.55341-1-niklas.cassel@linaro.org>
In-Reply-To: <20191119154621.55341-1-niklas.cassel@linaro.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 20 Nov 2019 13:00:05 +0100
Message-ID: <CAPDyKFqjsJSRW7XvfUe2Ssewqxo5Xjk_3p_EywP_rTsvrdNDYQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/5] Add support for QCOM Core Power Reduction
To:     Niklas Cassel <niklas.cassel@linaro.org>
Cc:     Linux PM <linux-pm@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Amit Kucheria <amit.kucheria@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 19 Nov 2019 at 16:46, Niklas Cassel <niklas.cassel@linaro.org> wrote:
>
> This series adds support for Core Power Reduction (CPR), a form of
> Adaptive Voltage Scaling (AVS), found on certain Qualcomm SoCs.
>
> This series is based on top of the qcs404 cpufreq patch series that
> hasn't landed yet:
> https://patchwork.kernel.org/project/linux-arm-msm/list/?series=173423
> as well as that series' matching device tree changes:
> https://patchwork.kernel.org/project/linux-arm-msm/list/?series=165457
>
> For testing purposes, this patch series, including the dependencies
> listed above, is available on the following git tag:
> https://git.linaro.org/people/niklas.cassel/kernel.git/log/?h=cpr-v6
>
> CPR is a technology that reduces core power on a CPU or on other device.
> It reads voltage settings from efuses (that have been written in
> production), it uses these voltage settings as initial values, for each
> OPP.
>
> After moving to a certain OPP, CPR monitors dynamic factors such as
> temperature, etc. and adjusts the voltage for that frequency accordingly
> to save power and meet silicon characteristic requirements.
>
> This driver has been developed together with Jorge Ramirez-Ortiz, and
> is based on an RFC by Stephen Boyd[1], which in turn is based on work
> by others on codeaurora.org[2].
>
> [1] https://lkml.org/lkml/2015/9/18/833
> [2] https://source.codeaurora.org/quic/la/kernel/msm-4.14/tree/drivers/regulator/cpr-regulator.c?h=msm-4.14
>
> Changes since v5:
> -Removed pm_ops from platform_driver struct.
>  (This was embarrassingly not properly removed in previous patch revision.)
>
> Niklas Cassel (5):
>   dt-bindings: power: avs: Add support for CPR (Core Power Reduction)
>   power: avs: Add support for CPR (Core Power Reduction)
>   arm64: dts: qcom: qcs404: Add CPR and populate OPP table
>   arm64: defconfig: enable CONFIG_QCOM_CPR
>   arm64: defconfig: enable CONFIG_ARM_QCOM_CPUFREQ_NVMEM
>
>  .../bindings/power/avs/qcom,cpr.txt           |  130 ++
>  MAINTAINERS                                   |    8 +
>  arch/arm64/boot/dts/qcom/qcs404.dtsi          |  132 +-
>  arch/arm64/configs/defconfig                  |    2 +
>  drivers/power/avs/Kconfig                     |   15 +
>  drivers/power/avs/Makefile                    |    1 +
>  drivers/power/avs/qcom-cpr.c                  | 1754 +++++++++++++++++
>  7 files changed, 2034 insertions(+), 8 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/power/avs/qcom,cpr.txt
>  create mode 100644 drivers/power/avs/qcom-cpr.c
>
> --
> 2.23.0
>

For the series (except patch 2 that I provided some comment for), feel
free to add:

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe
