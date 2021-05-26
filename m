Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7211392340
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 May 2021 01:30:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234905AbhEZXcP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 19:32:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234832AbhEZXcP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 19:32:15 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27752C06175F
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 May 2021 16:30:43 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id t10-20020a05683022eab0290304ed8bc759so2655416otc.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 May 2021 16:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=f5inNoG6a1gTVFSlqHBbHpaamu/nM0OCFBdJlQ1D2b4=;
        b=XDHTBKkDEJnhJrFGseooYsd4kQeneJs4gHZDUzntBQK2nX6BR0r8RRK/jXNZWJW+yk
         udmeLGKlob/OFeevQOnF6CU7EhfozmZckYdxCtTP+DXOACzlXL5aTmXAV3BF7ukwf9Dk
         84BXoMjH5IAWQZYBbtS7ydMQbPoU+NIMEN+JQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=f5inNoG6a1gTVFSlqHBbHpaamu/nM0OCFBdJlQ1D2b4=;
        b=AFa1wlG8yEtmn2Wkp4i3LEA2xMA1ltewwT7DsCHhv4bOWj0AGsL8cZtyUcJvaaUWVQ
         wo4DcexI+DaukiWP9T9Gg9bcAt5KnK0Szczz1DkMQwFEYF0KT9K0X4VTAfCuLruV8AVT
         usZn3LvM5tFCW81u7OKRNDXX8/8K5qGTViBy51l/A6sNNiuB+FWLS07wecaJtyOCRDdD
         dDgS/aBaehUB1MHZd6Flm9DTNhqImRBZv9Ly91nb4xk72F5wtccX36yBYCrY5kuzzLpq
         6nuB3baLUO0hrDYmEVke/Z1EgsBLOMmANE7grYpdu/3TlVpQiT5UpExOg5TGI5OxTgbf
         qC+A==
X-Gm-Message-State: AOAM533bp/BIS6PwpOxiTxKlJ1R8raDjX2mf+bLYsZCLn96W/tLxLnHI
        eybyvL1zTMjvVd/ke1qXbb+pHU+BIc7lvcb4P7n63g==
X-Google-Smtp-Source: ABdhPJxUxK7okjBvGfnVz8YwxgspwwpdkerGy69t5hvFu8M6YbAcJcqhes4w84JyUA3Qjzurg3kZlbcmXZenHnLSHts=
X-Received: by 2002:a05:6830:1556:: with SMTP id l22mr563949otp.34.1622071842580;
 Wed, 26 May 2021 16:30:42 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 26 May 2021 19:30:42 -0400
MIME-Version: 1.0
In-Reply-To: <1621596371-26482-6-git-send-email-mkshah@codeaurora.org>
References: <1621596371-26482-1-git-send-email-mkshah@codeaurora.org> <1621596371-26482-6-git-send-email-mkshah@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 26 May 2021 19:30:42 -0400
Message-ID: <CAE-0n53-4sLWh9LAX9eqUutc206vq8mnUTPfQKmvvsRPiCiDew@mail.gmail.com>
Subject: Re: [PATCH v8 5/5] arm64: dts: qcom: sc7280: Enable SoC sleep stats
To:     Maulik Shah <mkshah@codeaurora.org>, bjorn.andersson@linaro.org,
        evgreen@chromium.org, mka@chromium.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        agross@kernel.org, dianders@chromium.org, linux@roeck-us.net,
        rnayak@codeaurora.org, lsrao@codeaurora.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Maulik Shah (2021-05-21 04:26:11)
> Add device node for SoC sleep stats driver which provides various
> low power mode stats.
>
> Also update the reg size of aoss_qmp device to 0x400.
>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

Same question as in sc7180.

>
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 2cc4785..47afca8 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -827,7 +827,7 @@
>
>                 aoss_qmp: power-controller@c300000 {
>                         compatible = "qcom,sc7280-aoss-qmp";
> -                       reg = <0 0x0c300000 0 0x100000>;
> +                       reg = <0 0x0c300000 0 0x400>;
>                         interrupts-extended = <&ipcc IPCC_CLIENT_AOP
>                                                      IPCC_MPROC_SIGNAL_GLINK_QMP
>                                                      IRQ_TYPE_EDGE_RISING>;
> @@ -838,6 +838,11 @@
>                         #power-domain-cells = <1>;
>                 };
>
> +               rpmh-sleep-stats@c3f0000 {
> +                       compatible = "qcom,rpmh-sleep-stats";
> +                       reg = <0 0x0c3f0000 0 0x400>;
> +               };
> +
>                 spmi_bus: spmi@c440000 {
>                         compatible = "qcom,spmi-pmic-arb";
>                         reg = <0 0x0c440000 0 0x1100>,
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
>
