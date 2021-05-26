Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D64D39233A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 May 2021 01:30:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234874AbhEZXbq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 19:31:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234857AbhEZXbp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 19:31:45 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0346DC061760
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 May 2021 16:30:11 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id i23-20020a9d68d70000b02902dc19ed4c15so2717146oto.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 May 2021 16:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=5JNvthxICYCbwqncAfRO/N/6rcuLYC3MNXQ1kdeQYSc=;
        b=mzwzU4M9p1+BeCUQLUhRnPCqawrMRmPGXOcRz1F+Y1XnNTOtP9LXrGomQMffbfkHz6
         CzwxHElr0IfiHHtxbleHnJOdeXW5GBygnlj1mEHMJ2XjjvoeTB6/VLzISghtSPLUWiFo
         tUYVxzsqWJxDz1FeXwASAU8p5xqtM20ktfCzQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=5JNvthxICYCbwqncAfRO/N/6rcuLYC3MNXQ1kdeQYSc=;
        b=Zune89+EtNNgReQbWtFAl+xB49jVISoh3d9vc7ZL78zDWPN7L5NC8FXgDoyCdmzcTp
         8Hfw4AHC92Zvsx4HNs9a9hU9EkTLreIE4xjKl67S2bDUaGgx+a19rNsOsJfM4/Wcg9vx
         OE7DJxuaUiJUb8Q71WbMckLcJpIsQchxgD/cwIGjLQRLQQxKkefXT0fZzWdbHfE50/bC
         H2Ejzy487vjvKApVGKIHXdpj0QVIlPmpiTarN5B4TWtxVNAlfbxhUXK89huKcppTXYVa
         TLP5AN4g5CfeWqJT+dKjWLRf6nb//SJ0RyrcVSL030oiDEqno9+eXK3MH20vaVWcU/5z
         vHiw==
X-Gm-Message-State: AOAM53281mM8OsqqEFfW2yiThJU4m8jCAttqCSl7O1vdN+5gkg+u2xs4
        AorTWLhvvgoGZwtCVRemtoVH8Qj67e7a92pzq2Yd5A==
X-Google-Smtp-Source: ABdhPJy76CNAamDmxStCLV4d2vUuhc9BocdM3TpxDKQZCJPcKLABY1/C8quYbgWUUAexQB1BQGdzeVo1a3KQt1K18Sk=
X-Received: by 2002:a05:6830:3154:: with SMTP id c20mr550760ots.233.1622071810960;
 Wed, 26 May 2021 16:30:10 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 26 May 2021 19:30:10 -0400
MIME-Version: 1.0
In-Reply-To: <1621596371-26482-4-git-send-email-mkshah@codeaurora.org>
References: <1621596371-26482-1-git-send-email-mkshah@codeaurora.org> <1621596371-26482-4-git-send-email-mkshah@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 26 May 2021 19:30:10 -0400
Message-ID: <CAE-0n53ySKwDwzRYFYjnQnqVAujVrkik2U-PeCuS61xQU-hbWA@mail.gmail.com>
Subject: Re: [PATCH v8 3/5] arm64: dts: qcom: sc7180: Enable SoC sleep stats
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

Quoting Maulik Shah (2021-05-21 04:26:09)
> Add device node for SoC sleep stats driver which provides various
> low power mode stats.
>
> Also update the reg size of aoss_qmp device to 0x400.
>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 6228ba2..889d04d 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -3215,7 +3215,7 @@
>
>                 aoss_qmp: power-controller@c300000 {
>                         compatible = "qcom,sc7180-aoss-qmp";
> -                       reg = <0 0x0c300000 0 0x100000>;
> +                       reg = <0 0x0c300000 0 0x400>;
>                         interrupts = <GIC_SPI 389 IRQ_TYPE_EDGE_RISING>;
>                         mboxes = <&apss_shared 0>;
>
> @@ -3223,6 +3223,11 @@
>                         #power-domain-cells = <1>;
>                 };
>
> +               rpmh-sleep-stats@c3f0000 {
> +                       compatible = "qcom,rpmh-sleep-stats";
> +                       reg = <0 0x0c3f0000 0 0x400>;
> +               };
> +

Does this need to be in DT? Can the sc7180-aoss-qmp driver use the
aux-bus and stick the sleep stats device on there?

>                 spmi_bus: spmi@c440000 {
>                         compatible = "qcom,spmi-pmic-arb";
>                         reg = <0 0x0c440000 0 0x1100>,
