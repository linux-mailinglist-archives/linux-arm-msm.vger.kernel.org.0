Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E8EB288C2B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Oct 2020 17:05:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389191AbgJIPFZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Oct 2020 11:05:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388819AbgJIPFZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Oct 2020 11:05:25 -0400
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com [IPv6:2607:f8b0:4864:20::e44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9B49C0613D2
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2020 08:05:24 -0700 (PDT)
Received: by mail-vs1-xe44.google.com with SMTP id r1so4104883vsi.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2020 08:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=M5jmyRhySind9c0afwtQ0KGtByGsUKvjJEoZbk8E1rg=;
        b=Joaf6MfmCGF25mUhtUk8dw/KXhE9rOyy9cTfuhkZlrJrF5/AOOW+PGSTxiaz7deqDa
         J7icjzTVlWIo0zqGLDB6KJhXPIsrcv6jdY7k1u/VGev5bdPaZJN//YsjneEDCJWWCTCY
         KCh7oNHZcnOKkCwkzJEVqtmjUFyaavX+BdV8c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M5jmyRhySind9c0afwtQ0KGtByGsUKvjJEoZbk8E1rg=;
        b=Qjp+5gj/Hs1xHJqjg4UXRsWuWruwqB2/SqB4iuMlPxHhBl/jwQnoLmE0h6DZ8HoHtw
         2EuuCDA5Gd6L+4Ub4YBoMjhbTXtcstIdLtcjPAQF/Cn6uOMS5zC1WSeE9h0gCQG67e+L
         jY+ZWwbo50OlBgF1C8VZtm4gspeMbfII1NuxJ1sOs5aA+AWf1yBf7f0fW7O7SDtvm65p
         cymclpZh5cQCLfQBgaD/xgJ7wtzEOnrxkpvprUthGzu7TC4fxrI9mbxb7wxqbAIIG95C
         qp/bXTWMx8okzCkN+XL+yFJ4lENxL4HWztcE8DFvJRnjBtKhQYpGNIYvK7ASQDwkvocH
         fUwA==
X-Gm-Message-State: AOAM533bPRzqy9i1JyS9eaENIlB96wL6cxEQ+yoZtKMUps1rk1LQSEmE
        5SSkovoyjZtSLtjxbjfsVQ/RiiyJgnHh7g==
X-Google-Smtp-Source: ABdhPJxFiG2yip5x9ya6K8geBJXSckEAbm/ruHYSov7Dj9e2hQCt6bcEI4l20fvydPqEfubNNJ0jsQ==
X-Received: by 2002:a67:efd8:: with SMTP id s24mr7713844vsp.54.1602255923150;
        Fri, 09 Oct 2020 08:05:23 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id q64sm981597vkb.30.2020.10.09.08.05.22
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2020 08:05:22 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id v23so2555797vsp.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2020 08:05:22 -0700 (PDT)
X-Received: by 2002:a67:bc0d:: with SMTP id t13mr8045062vsn.4.1602255921448;
 Fri, 09 Oct 2020 08:05:21 -0700 (PDT)
MIME-Version: 1.0
References: <1602176947-17385-1-git-send-email-akhilpo@codeaurora.org>
In-Reply-To: <1602176947-17385-1-git-send-email-akhilpo@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 9 Oct 2020 08:05:10 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WjWv040TyBaqU8ZAuxGi-YpJ2tsVcUbOV4Htv=_-n8fA@mail.gmail.com>
Message-ID: <CAD=FV=WjWv040TyBaqU8ZAuxGi-YpJ2tsVcUbOV4Htv=_-n8fA@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sc7180: Add gpu cooling support
To:     Akhil P Oommen <akhilpo@codeaurora.org>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        Rob Herring <robh@kernel.org>, Rob Clark <robdclark@gmail.com>,
        dri-devel@freedesktop.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Oct 8, 2020 at 10:10 AM Akhil P Oommen <akhilpo@codeaurora.org> wrote:
>
> Add cooling-cells property and the cooling maps for the gpu tzones
> to support GPU cooling.
>
> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 29 ++++++++++++++++++++++-------
>  1 file changed, 22 insertions(+), 7 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index d46b383..40d6a28 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -2,7 +2,7 @@
>  /*
>   * SC7180 SoC device tree source
>   *
> - * Copyright (c) 2019, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2019-20, The Linux Foundation. All rights reserved.
>   */
>
>  #include <dt-bindings/clock/qcom,dispcc-sc7180.h>
> @@ -1885,6 +1885,7 @@
>                         iommus = <&adreno_smmu 0>;
>                         operating-points-v2 = <&gpu_opp_table>;
>                         qcom,gmu = <&gmu>;
> +                       #cooling-cells = <2>;

Presumably we should add this to the devicetree bindings, too?


>                         interconnects = <&gem_noc MASTER_GFX3D &mc_virt SLAVE_EBI1>;
>                         interconnect-names = "gfx-mem";
> @@ -3825,16 +3826,16 @@
>                 };
>
>                 gpuss0-thermal {
> -                       polling-delay-passive = <0>;
> +                       polling-delay-passive = <100>;

Why did you make this change?  I'm pretty sure that we _don't_ want
this since we're using interrupts for the thermal sensor.  See commit
22337b91022d ("arm64: dts: qcom: sc7180: Changed polling mode in
Thermal-zones node").


>                         polling-delay = <0>;
>
>                         thermal-sensors = <&tsens0 13>;
>
>                         trips {
>                                 gpuss0_alert0: trip-point0 {
> -                                       temperature = <90000>;
> +                                       temperature = <95000>;
>                                         hysteresis = <2000>;
> -                                       type = "hot";
> +                                       type = "passive";

Matthias probably knows better, but I wonder if we should be making
two passive trip levels like we do with CPU.  IIRC this is important
if someone wants to be able to use this with IPA.
