Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECDE42693C3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Sep 2020 19:42:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726039AbgINRm0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Sep 2020 13:42:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726046AbgINRmQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Sep 2020 13:42:16 -0400
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com [IPv6:2607:f8b0:4864:20::e43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85FE2C06178A
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2020 10:42:13 -0700 (PDT)
Received: by mail-vs1-xe43.google.com with SMTP id x203so342690vsc.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2020 10:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Fb/McKaDkFAZSYX0bopUHJOoejLg0ldN7v4K0XdQEYY=;
        b=oY2WCrgE4fWxetdc9oq993bEa+Hm8Bv+Ma5CqNoU3n1nD5t4vGohZ6q4lEVmyDaDHr
         OUDwBDXCHE31NKBvkcZ1AUj3qb5jhy6MdjhBrlTXxKPdgixLgYyQOWrDsyRw6RGSW1FO
         9TjTj3as5OvTs1ZtpMR+7P7i9mE+o26X9I8qo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Fb/McKaDkFAZSYX0bopUHJOoejLg0ldN7v4K0XdQEYY=;
        b=q7Q7yHDj2IzKI2xBCeZA1beRCk9uiQ4STzZfTsNnB0B2NS/nBarr2haUZhIpu2nnN0
         me6g/cdRXHtsVJJumuxpx5MCe5v630HnDcpaU7n9CxlAnxjUouXyA/R+LjAH8/NYeda4
         9klIJN/l3dEKaacR3rC3cXrbCua+Ki0uPpJiZd2GatdQmWQGGYZdi7aXckIIfY/0yqVN
         zKcnN6m7xxU7bmc5NybTgq9A4wlAzhjZiuvag2UcAD2uXOvKDjyty9xRnVQO6zDq+3S0
         LVYVRc9qCLyPfACAR5C+MdLWp2CC3IHL3+9BSrNUBZAOZKQd85K3bycvFhca4GXSxMDk
         v5FA==
X-Gm-Message-State: AOAM532QLWMR+P5+d45Ff59LyFZj4ZJKJANE3d3Rgu2/fRQZa5OurvVP
        UXIJHGxUJ5piTVj2UNOSgBfKhyWT/9g5wg==
X-Google-Smtp-Source: ABdhPJyRY1ynPttXM60gbyk3cy5dGVYHQEmqiAMYb5kuRTokEqvyWlUzFqkDpVuFToce/psHVxEMoA==
X-Received: by 2002:a67:e190:: with SMTP id e16mr8616144vsl.5.1600105332070;
        Mon, 14 Sep 2020 10:42:12 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id k4sm1894575vkk.12.2020.09.14.10.42.11
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2020 10:42:11 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id e2so356760vsr.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2020 10:42:11 -0700 (PDT)
X-Received: by 2002:a05:6102:10c2:: with SMTP id t2mr7966339vsr.10.1600105330813;
 Mon, 14 Sep 2020 10:42:10 -0700 (PDT)
MIME-Version: 1.0
References: <1599019441-29308-1-git-send-email-srivasam@codeaurora.org>
In-Reply-To: <1599019441-29308-1-git-send-email-srivasam@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 14 Sep 2020 10:41:58 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U1k7T6z=dZHYWFpnAw1bTptPjKXd7z9YuOQOsOFrXp-A@mail.gmail.com>
Message-ID: <CAD=FV=U1k7T6z=dZHYWFpnAw1bTptPjKXd7z9YuOQOsOFrXp-A@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: sc7180: Add lpass cpu node for I2S driver
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Rohit kumar <rohitkr@codeaurora.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Ajit Pandey <ajitp@codeaurora.org>,
        Cheng-Yi Chiang <cychiang@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Sep 1, 2020 at 9:04 PM Srinivasa Rao Mandadapu
<srivasam@codeaurora.org> wrote:
>
> From: Ajit Pandey <ajitp@codeaurora.org>
>
> Add the I2S controller node to sc7180 dtsi.
> Add pinmux for primary and secondary I2S.
>
> Signed-off-by: Ajit Pandey <ajitp@codeaurora.org>
> Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> ---
>
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 69 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 69 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index d46b383..db60ca5 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -676,6 +676,36 @@
>                         };
>                 };
>
> +               lpass_cpu: lpass@62f00000 {
> +                       compatible = "qcom,sc7180-lpass-cpu";
> +
> +                       reg = <0 0x62f00000 0 0x29000>;
> +                       reg-names = "lpass-lpaif";
> +
> +                       iommus = <&apps_smmu 0x1020 0>;
> +
> +                       power-domains = <&lpass_hm LPASS_CORE_HM_GDSCR>;
> +
> +                       clocks = <&gcc GCC_LPASS_CFG_NOC_SWAY_CLK>,
> +                                <&lpasscc LPASS_AUDIO_CORE_CORE_CLK>,
> +                                <&lpasscc LPASS_AUDIO_CORE_EXT_MCLK0_CLK>,
> +                                <&lpasscc LPASS_AUDIO_CORE_SYSNOC_MPORT_CORE_CLK>,
> +                                <&lpasscc LPASS_AUDIO_CORE_LPAIF_PRI_IBIT_CLK>,
> +                                <&lpasscc LPASS_AUDIO_CORE_LPAIF_SEC_IBIT_CLK>;
> +
> +                       clock-names = "pcnoc-sway-clk", "audio-core",
> +                                       "mclk0", "pcnoc-mport-clk",
> +                                       "mi2s-bit-clk0", "mi2s-bit-clk1";
> +
> +
> +                       #sound-dai-cells = <1>;
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +
> +                       interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-names = "lpass-irq-lpaif";
> +               };
> +
>                 sdhc_1: sdhci@7c4000 {

Your node is still sorted incorrectly.  Nodes with unit addresses
should be sorted numerically.

The number 0x62f00000 is greater than the number 0x7c4000.  Thus your
node should not be placed above "sdhci@7c4000".  It should be placed
somewhere further down in the file.


>                         compatible = "qcom,sc7180-sdhci", "qcom,sdhci-msm-v5";
>                         reg = <0 0x7c4000 0 0x1000>,
> @@ -1721,6 +1751,45 @@
>                                 };
>                         };
>
> +                       sec_mi2s_active: sec-mi2s-active {
> +                               pinmux {
> +                                       pins = "gpio49", "gpio50", "gpio51";
> +                                       function = "mi2s_1";
> +                               };
> +
> +                               pinconf {
> +                                       pins = "gpio49", "gpio50", "gpio51";;

nit: double-semi-colon.
