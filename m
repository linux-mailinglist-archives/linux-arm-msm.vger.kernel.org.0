Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0AEED1709E7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2020 21:40:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727446AbgBZUkk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Feb 2020 15:40:40 -0500
Received: from mail-vs1-f68.google.com ([209.85.217.68]:36178 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727434AbgBZUkj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Feb 2020 15:40:39 -0500
Received: by mail-vs1-f68.google.com with SMTP id a2so336300vso.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2020 12:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=X38dp+xI/8/bQebYRzfnOr8kxspwiuDhfXc+NQs++Fs=;
        b=UOGFjBTh5wpqU9crrLKX2C788sZCcOcl87LvIZspmck+EOvU07D2ISbpfvUCNzdHWi
         1stD0H0A8F7rx8IqDWd+/8UAVCJ5yAGOWoyk2smT6wGRiGUo/2SAnB+XTvn3sEcSsMZd
         oPs2f1h5a3+7nQxbgt7ZjU0L/ziLobpX/4WvI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X38dp+xI/8/bQebYRzfnOr8kxspwiuDhfXc+NQs++Fs=;
        b=h1ORAeHb30q1dmjShrvMsLWqU7XC4pbJsXRNZhpeWIAhaXrHOaDciSmPUIKLLMFTLR
         oaqIV6mSnBGAE3/nh3JVYdScADE7AFeDl67OelcN799NMZVXDTTL/Mt3T6y1zhPe5dL4
         ZVlnFaX6XBJXM3obULkGnl479/cgCuFQj5VFAYTVHqhdZru85WSTeOHcWswbS9ZsAYwc
         EWQLjZu/HTj/r2CSTjnJU/E2iebbLrSmRlwrn4FcXORINUTqUQ9RNd5EYwbeq3SFzeyu
         xspQZa/spH8xdY3sNbrY5/1LNj5j/N8naX7x+I4G6OcJlBfjxaS9lsDR0NguthUFHpzq
         Le4A==
X-Gm-Message-State: APjAAAUS0FgO5LPPk0X2hHAgKXvH0+DYqwrM3Zjon0Y3D2jSPBRMTtwu
        qTlwJOPzQn4hJ4Aext06ebcC6MPoA5c=
X-Google-Smtp-Source: APXvYqzJw5fqrgQS9EKgA64JBbhQ5aerxAgQ1gVU1SxdMQjrOxfUkR1C+Ctrrcm89ztfjHE5w3Jofw==
X-Received: by 2002:a67:f494:: with SMTP id o20mr577066vsn.228.1582749637150;
        Wed, 26 Feb 2020 12:40:37 -0800 (PST)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id o132sm1352452vkd.17.2020.02.26.12.40.36
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2020 12:40:36 -0800 (PST)
Received: by mail-vk1-f180.google.com with SMTP id u6so70594vkn.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2020 12:40:36 -0800 (PST)
X-Received: by 2002:ac5:c807:: with SMTP id y7mr667987vkl.92.1582749635551;
 Wed, 26 Feb 2020 12:40:35 -0800 (PST)
MIME-Version: 1.0
References: <20200226114017.1.I15e0f7eff0c67a2b49d4992f9d80fc1d2fdadf63@changeid>
In-Reply-To: <20200226114017.1.I15e0f7eff0c67a2b49d4992f9d80fc1d2fdadf63@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 26 Feb 2020 12:40:23 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UMptkb9ni0KFWp96BycU32kchYs9+uS-7H+Q9ounHy2g@mail.gmail.com>
Message-ID: <CAD=FV=UMptkb9ni0KFWp96BycU32kchYs9+uS-7H+Q9ounHy2g@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: sc7180: Move venus node to the correct position
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Feb 26, 2020 at 11:40 AM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> Per convention device nodes for SC7180 should be ordered by address.
> This is currently not the case for the venus node, move it to the
> correct position.
>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 52 ++++++++++++++--------------
>  1 file changed, 26 insertions(+), 26 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 253274d5f04c..5f97945e16a4 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -1332,6 +1332,32 @@ system-cache-controller@9200000 {
>                         interrupts = <GIC_SPI 582 IRQ_TYPE_LEVEL_HIGH>;
>                 };
>
> +               venus: video-codec@aa00000 {
> +                       compatible = "qcom,sc7180-venus";
> +                       reg = <0 0x0aa00000 0 0xff000>;
> +                       interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> +                       power-domains = <&videocc VENUS_GDSC>,
> +                                       <&videocc VCODEC0_GDSC>;
> +                       power-domain-names = "venus", "vcodec0";
> +                       clocks = <&videocc VIDEO_CC_VENUS_CTL_CORE_CLK>,
> +                                <&videocc VIDEO_CC_VENUS_AHB_CLK>,
> +                                <&videocc VIDEO_CC_VENUS_CTL_AXI_CLK>,
> +                                <&videocc VIDEO_CC_VCODEC0_CORE_CLK>,
> +                                <&videocc VIDEO_CC_VCODEC0_AXI_CLK>;
> +                       clock-names = "core", "iface", "bus",
> +                                     "vcodec0_core", "vcodec0_bus";
> +                       iommus = <&apps_smmu 0x0c00 0x60>;
> +                       memory-region = <&venus_mem>;
> +
> +                       video-decoder {
> +                               compatible = "venus-decoder";
> +                       };
> +
> +                       video-encoder {
> +                               compatible = "venus-encoder";
> +                       };
> +               };
> +
>                 usb_1: usb@a6f8800 {
>                         compatible = "qcom,sc7180-dwc3", "qcom,dwc3";
>                         reg = <0 0x0a6f8800 0 0x400>;

Maybe try one more time?

>>> print [hex(x) for x in sorted([0x0aa00000, 0x0a6f8800])]
['0xa6f8800', '0xaa00000']

...makes me convinced that the codec should come _after_ the USB node, no?

-Doug
