Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 508A8499CC6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jan 2022 23:13:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379581AbiAXWId (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Jan 2022 17:08:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379390AbiAXVtA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Jan 2022 16:49:00 -0500
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com [IPv6:2607:f8b0:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D243C088587
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jan 2022 12:33:20 -0800 (PST)
Received: by mail-il1-x12e.google.com with SMTP id w5so10738393ilo.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jan 2022 12:33:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hjJmpu3e2t2f13z2Lk1fKSYhhOY3XW/vJD/ViRHi/3w=;
        b=ML4ZhwzpblICBpcfdpi1zxRWLHKRxGys7HU2dk4xn5uAUMmwdlmU3jDdG1V5dJaCfy
         6RrkYOndJqDoAeQG5v4B1FGQSLnDS4+WuOb8qckjKx+JK/sG9ox2LwcT2eVQaY8pvgK8
         dn4GQWBto1pDWHU4Cyno/TKRYUJXJxawwrkoc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hjJmpu3e2t2f13z2Lk1fKSYhhOY3XW/vJD/ViRHi/3w=;
        b=LLnQAUgxN+K0FzAhgvjjvQ64Mo39kCRFKlyB+ZZVfDQJJXra9YoEmVftuPkrTca7ON
         DD8CD09kYf6HP7SxkYmxxOs1VIZOaRMzWNI7w7yJ3sImCIqixfZYlots/Q0GaLnk/L2T
         7TBPQ+gd4knRYVr6yG4MP1VyFFQpLq3Uii+MSOzE1kL+4vx4s+an5BXGSQ93WCqv92SP
         O0BVxsaYDKKIkqS9/hpL8SK7PGVUYHeAPnvEYu2j0q1S/CWclU7bk8HlnUGdgybB1Jj5
         Zz/QBg5HRK7SIKirWpHo6yfIt/1H7Q4b0aXDklFGM9zTQ4kRN35S52S0uEn5Vth8PCwI
         VAZg==
X-Gm-Message-State: AOAM533aybAeBrQj1ggIEGZj22k9f1MHvTvnyGKNt/ePVKhNWvpc1kmG
        H0a+tGAC9/kdlfZOAkraL1qPuLLYjap9Lg==
X-Google-Smtp-Source: ABdhPJwurJ6x+emLnHol/vMeWw2x2mwiaF+Ld1uUT5NxROTfH5ZpajVIHgPZTNMRX11+djH/zU8r+w==
X-Received: by 2002:a92:d2d1:: with SMTP id w17mr9574242ilg.170.1643056399448;
        Mon, 24 Jan 2022 12:33:19 -0800 (PST)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com. [209.85.166.179])
        by smtp.gmail.com with ESMTPSA id k13sm7901667ili.22.2022.01.24.12.33.18
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jan 2022 12:33:18 -0800 (PST)
Received: by mail-il1-f179.google.com with SMTP id i14so14946800ila.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jan 2022 12:33:18 -0800 (PST)
X-Received: by 2002:a92:6b10:: with SMTP id g16mr9053356ilc.165.1643056398198;
 Mon, 24 Jan 2022 12:33:18 -0800 (PST)
MIME-Version: 1.0
References: <20220124165745.16277-1-tdas@codeaurora.org>
In-Reply-To: <20220124165745.16277-1-tdas@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 24 Jan 2022 12:33:06 -0800
X-Gmail-Original-Message-ID: <CAD=FV=X3+MDOMEidLbdgvcHVSObO=_x3KSLe31hr-TP6B2jCEg@mail.gmail.com>
Message-ID: <CAD=FV=X3+MDOMEidLbdgvcHVSObO=_x3KSLe31hr-TP6B2jCEg@mail.gmail.com>
Subject: Re: [PATCH v1] arm64: dts: qcom: sc7280: Add lpasscore & lpassaudio
 clock controllers
To:     Taniya Das <tdas@codeaurora.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Andy Gross <agross@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Jan 24, 2022 at 8:58 AM Taniya Das <tdas@codeaurora.org> wrote:
>
> Add the low pass audio clock controller device nodes.
>
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
> Dependent onLPASS clock controller change: https://lkml.org/lkml/2022/1/24/772
>
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 43 ++++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 937c2e0e93eb..0aa834ce6b61 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -8,6 +8,8 @@
>  #include <dt-bindings/clock/qcom,dispcc-sc7280.h>
>  #include <dt-bindings/clock/qcom,gcc-sc7280.h>
>  #include <dt-bindings/clock/qcom,gpucc-sc7280.h>
> +#include <dt-bindings/clock/qcom,lpassaudiocc-sc7280.h>
> +#include <dt-bindings/clock/qcom,lpasscorecc-sc7280.h>

Presumably using these two include files means a dependency on things
landing in the clk tree [1]. Unless Stephen and Bjorn want to work
something out, I'd guess you'll need to re-post with just hardcoded
numbers for now?

[1] https://lore.kernel.org/r/20220124162442.29497-2-tdas@codeaurora.org/
