Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37E4133A0F6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Mar 2021 21:20:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234182AbhCMUTy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 13 Mar 2021 15:19:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234288AbhCMUTn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 13 Mar 2021 15:19:43 -0500
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C450AC061574
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Mar 2021 12:19:42 -0800 (PST)
Received: by mail-qv1-xf2f.google.com with SMTP id j17so5966896qvo.13
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Mar 2021 12:19:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MSmY0dGjg6ckfD228f58/2OlYEV6GbIngWFX+Phx3nk=;
        b=OSBeqE9YwVGWpDIfZXrwwGY4Ffk4unbVBYOESHO9YzOz490Zn6uEOFUwCGbjZ7oYhy
         /mwPrSpgdwJM4gLpO/IHhFNqBpzDiEL1fpP0jzYcf3s3tvjiAwcuv1pC9HC4OxbtFNcK
         7JVXE1izFbpUeZxo7T/UWfNMgqDIOCVw+wFjjxsV5kdj7I8o1GF/iXH4dHCYElPjtYFS
         Mmyhz5DkXvAjKWqVIbsqqBeKyq/wqwYy6BvD652Vv5QXgfx4n58CIBlH+UcskfOUMA6M
         nHR1k3iAUYg0u+hbh+CvYonvqYQ4TtWTHIGyCYKEyayTuvWfyrm7fVsscqPkjlyjxInF
         rPyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MSmY0dGjg6ckfD228f58/2OlYEV6GbIngWFX+Phx3nk=;
        b=V6cGoQEHNv7Agrth0kC+J1LFtgH2YdwTTw6yb1/GzcFdUpqDOBbyndYQu12R6ugoMf
         USHMARu0xE0bWfwX59Ki1vruH3pCuail+cBq/dYfjCNR6JKgOV9DYPgg3QBC32l6g4sV
         aLQQudSdrECRH5Ze6Yy9QXj3nXAbiBWl1Tsjiw4b7nErsrsDF/K1x750q7G1Z9u3K16n
         uTSk7uTwmYs1MISoOdDByyu8FAc/c9tGSscaFvCO4za4wDoF0PnWKSRCVp6IgNsN5Pwc
         UakqYQnbGEYKAcELax6sxeTAwI03jD/JWaVdfSvfekM/axLm7TmvzZJzFh2ubZU/9A+R
         hAPA==
X-Gm-Message-State: AOAM5323Itpc3q1UJhqNAAggkJDGwTwCQ46dz6w8WiocOMBR6rUHZgkW
        8kYLisdDiIBHHKnkrdWwQQHbW7MpeIizHFatf4Gktg==
X-Google-Smtp-Source: ABdhPJxGOXXwZBx3E1Mg6h2vM/+7M+pIiBTIJXLLWK6iUghzyea5b14Fe8F1zwsWKwz7UQoZZ3hBmv0vHdMoz9Qb4PU=
X-Received: by 2002:ad4:4e23:: with SMTP id dm3mr17935625qvb.4.1615666782002;
 Sat, 13 Mar 2021 12:19:42 -0800 (PST)
MIME-Version: 1.0
References: <20210210133458.1201066-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20210210133458.1201066-1-dmitry.baryshkov@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 13 Mar 2021 23:19:30 +0300
Message-ID: <CAA8EJpoOXE3duEdZO63zuczGb4BUXjmzmq3fLxh2LHJWt0G4xg@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] arm64: dts: qcom: qrb5165-rb5: use GPIO as SPI0 CS
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Doug Anderson <dianders@chromium.org>
Cc:     "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Colleagues,

On Wed, 10 Feb 2021 at 16:36, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> GENI SPI controller shows several issues if it manages the CS on its own
> (see 37dd4b777942 ("arm64: dts: qcom: sc7180: Provide pinconf for SPI to
> use GPIO for CS") for the details). Configure SPI0 CS pin as a GPIO.

Should I improve this patchset in any way or is it fine to go?

> Changes since v3:
>  - Rephrase qrb5165-rb5 commit
>  - Remove leftover  pinctrl-name entries for spi0
>  - Group pinctrl entries at the end of qrb5165-rb5.
>
> Changes since v2:
>  - Move pinctrl-names to the board file.
>  - Reorder CS/CS-gpio/data-clk nodes to follow alphabetical sort.
>
> Changes since v1:
>  - Split sm8250's spi pin config into mux/config parts, split away CS
>    handling from main SPI pinctrl nodes.
>
> ----------------------------------------------------------------
> Dmitry Baryshkov (4):
>       arm64: dts: qcom: sm8250: split spi pinctrl config
>       arm64: dts: qcom: sm8250: further split of spi pinctrl config
>       arm64: dts: qcom: sm8250: add pinctrl for SPI using GPIO as a CS
>       arm64: dts: qcom: qrb5165-rb5: switch into using GPIO for SPI0 CS
>
>  arch/arm64/boot/dts/qcom/qrb5165-rb5.dts |  14 +
>  arch/arm64/boot/dts/qcom/sm8250.dtsi     | 540 +++++++++++++++----------------
>  2 files changed, 274 insertions(+), 280 deletions(-)
>
>


-- 
With best wishes
Dmitry
