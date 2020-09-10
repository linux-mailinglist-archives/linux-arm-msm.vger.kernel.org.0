Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C63BE264878
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Sep 2020 16:55:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730261AbgIJOzR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Sep 2020 10:55:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730920AbgIJOwg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Sep 2020 10:52:36 -0400
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com [IPv6:2607:f8b0:4864:20::943])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCB04C06179F
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2020 07:42:45 -0700 (PDT)
Received: by mail-ua1-x943.google.com with SMTP id v24so2059494uaj.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2020 07:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Xn2z91UfCtrgcaftSJI2dNlH0TFk/vXw21rz//Drd/M=;
        b=UVSPAVfNwE3+6oK7YYZjhiud+K7lnkgA2zgaHh02Rowe50M2AyiZS9odTByUXmtVxF
         Di08SfgpXs/tjHW3UcuczZMqEczt1J/Rek8K66sVerDDfqDSau4pvge+N0mcHDWOLNBL
         nHy3s4N6+sgOwEX3D20NKo0xUVYSDGqfM97OU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Xn2z91UfCtrgcaftSJI2dNlH0TFk/vXw21rz//Drd/M=;
        b=SMLFG+3J8JXq6/kp2u+1cOCYEQ6hlveNktxvnB9HtQr5Y3elP0U5eqSZ0NrqIo4SEg
         XJjiRcgQ63Ycwd+1+dmndQqdGpj+W6RoPfhTfCYBUFyMZgOpFQgtDCLuzm3dZ/R+PZa1
         IbGu41QuzrDxr74s6BZ2kdP7dtCaUUE0wJlSabO+wxn/IAXi2gQnapC05SBQWevn5rlg
         FZwN3kZCtEhQJd22iRqHyShHVOy2qiwE1DMqeA3grk7xTEAOoXi51FvV1WbL536CmL69
         FQ2QZ/5qIWQ+B/4sHv3W6NhhL60RVhonUqjogA9RuDvOEk/I4KJpPdhVAnWINAsJ5T3S
         +H5g==
X-Gm-Message-State: AOAM531zBku2CC+wm0YxH5xZ5IKUCsAPRKR3hVzYmEdAeIOtDPfmFeph
        sUg+TZ6LLg+79QgtR8ZTntyooVT5r6Mt7Q==
X-Google-Smtp-Source: ABdhPJzooKFCK0Tzn/LfzRJ2njNgTMOYwKW+Fa/64q2GKN3pXZgtUEjPl7WUwZ2ErdQAoK8bmN+sgA==
X-Received: by 2002:a9f:24d4:: with SMTP id 78mr3981041uar.47.1599748963024;
        Thu, 10 Sep 2020 07:42:43 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id l65sm947668vkh.33.2020.09.10.07.42.42
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2020 07:42:42 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id j6so2588795vsg.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2020 07:42:42 -0700 (PDT)
X-Received: by 2002:a67:d907:: with SMTP id t7mr4555810vsj.8.1599748961645;
 Thu, 10 Sep 2020 07:42:41 -0700 (PDT)
MIME-Version: 1.0
References: <1599742438-16811-1-git-send-email-skakit@codeaurora.org> <1599742438-16811-4-git-send-email-skakit@codeaurora.org>
In-Reply-To: <1599742438-16811-4-git-send-email-skakit@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 10 Sep 2020 07:42:30 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wxo6ggLN39UMtMNwd6GOQwnEjA1MCxHjB6cmE9RTRMPA@mail.gmail.com>
Message-ID: <CAD=FV=Wxo6ggLN39UMtMNwd6GOQwnEjA1MCxHjB6cmE9RTRMPA@mail.gmail.com>
Subject: Re: [PATCH V5 3/4] arm64: dts: qcom: sc7180-trogdor: Add pinctrl and
 interrupt config for BT UART
To:     satya priya <skakit@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Akash Asthana <akashast@codeaurora.org>,
        Roja Rani Yarubandi <rojay@codeaurora.org>,
        msavaliy@qti.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Sep 10, 2020 at 5:55 AM satya priya <skakit@codeaurora.org> wrote:
>
> Add a suitable sleep configuration for uart3 to support Bluetooth wakeup.
>
> If QUP function is selected in sleep state, UART RTS/RFR is pulled high
> during suspend and BT SoC not able to send wakeup bytes. So, configure
> GPIO mode in sleep state to keep it low during suspend.
>
> Signed-off-by: satya priya <skakit@codeaurora.org>
> ---
> Changes in V5:
>  - Newly added in V5. This patch adds wakeup support for trogdor board files.
>
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 48 ++++++++++++++++++++++++++++
>  1 file changed, 48 insertions(+)

Note: I can't find this email on any of the mailing lists.  Can you
check your config?  I tried:

http://lore.kernel.org/r/1599742438-16811-4-git-send-email-skakit@codeaurora.org

...and also checked patchwork servers.  I only see patch 1 and 2.  I
think Bjorn usually applies from patchwork so this'll likely be a
problem...


> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> index a6b9beb..96b5331 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> @@ -792,6 +792,11 @@ ap_spi_fp: &spi10 {
>  #include <arm/cros-ec-sbs.dtsi>
>
>  &uart3 {
> +       pinctrl-names = "default", "sleep";
> +       pinctrl-1 = <&qup_uart3_sleep>;
> +       interrupts-extended = <&intc GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>,
> +                               <&tlmm 41 IRQ_TYPE_EDGE_FALLING>;
> +
>         status = "okay";

Same comments here as for patch #2.


>         bluetooth: bluetooth {
> @@ -1345,4 +1350,47 @@ ap_spi_fp: &spi10 {
>                         drive-strength = <2>;
>                 };
>         };
> +
> +       qup_uart3_sleep: qup-uart3-sleep {

I believe things in this section are supposed to be sorted
alphabetically.  Thus "qup..." should be sorted before "trackpad..."
