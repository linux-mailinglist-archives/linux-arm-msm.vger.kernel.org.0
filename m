Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B200539C2C3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jun 2021 23:43:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230264AbhFDVpb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Jun 2021 17:45:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229755AbhFDVpb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Jun 2021 17:45:31 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87644C061767
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Jun 2021 14:43:44 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id 66-20020a9d02c80000b02903615edf7c1aso10425947otl.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jun 2021 14:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=UC2AwnCU4W7/DsYhuag8+yME3EH1r1RYHCOePL8HnE8=;
        b=gyixkUsX9X9cshP0+/da03kfPP1vDkY6E+1CRSM3XENnvzCQrcmZ+wqIEzNlyNmaih
         ulPMGWPfDkJzeTXMaFS8bZ23mWyGshXPpC6gJSuWjNybEjXUI1uffRVFUUoa3kC054Pn
         1p0cBrLoSxt/nH9tKKefz5YGdOtpD+kTmZU38=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=UC2AwnCU4W7/DsYhuag8+yME3EH1r1RYHCOePL8HnE8=;
        b=WyY3Nge4f0hX2S83Sv+nd5BjQV9xqaE3M4P2xgmyvox3nI4Nq6x0Hs2hY8dWqEDmc2
         BR1X+iCxZkbLDA00PPa/XkJchmn6X5ZKuI3WbKzf+2PraBrBdX3rvoJfEXqncZNiRY71
         b7KtvcdGLSp7rv9210Q+vCxCVMajVfqd2VZ/dfTuvbBVbOFA1kYJ1EU8OHHhFXoiU3Ao
         GqXiVNovHbURYlX3RKlNYWIPeoffbgvGalt8dNCOveoAOE3/04/NryeozMnotXw2GyUT
         G4L1FSX+vfvFlj/D77ESY728VyuZXqoFVly2GSgfATqGVyWq4mBFI7Lj98zXYdSxsB12
         85cA==
X-Gm-Message-State: AOAM532kpYuLdRMKnMD0sMo4DKceNaqoaYm0WIPw+S63UiSGM98GPbMN
        UD3Ck7XYYOK6tRRpdiS8bh66PczXLynegnblf3veVQ==
X-Google-Smtp-Source: ABdhPJwr2se1dNVn8fcmj+5C9VlOmdmIbF+cFdeprjZMsb0eOG/2oJZICzO8EqVw3ExXz/X0loWOlYLVrM+akoFuZxk=
X-Received: by 2002:a05:6830:3154:: with SMTP id c20mr5415860ots.233.1622843023585;
 Fri, 04 Jun 2021 14:43:43 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 4 Jun 2021 21:43:43 +0000
MIME-Version: 1.0
In-Reply-To: <3b3701bb1e23dec88f2231722872fc40@codeaurora.org>
References: <1620382648-17395-1-git-send-email-pmaliset@codeaurora.org>
 <1620382648-17395-3-git-send-email-pmaliset@codeaurora.org>
 <CAE-0n530bSPupOHVDzwpd_JVVN0tOfrAOm9dAt1ZGj7zaXOZ6A@mail.gmail.com> <3b3701bb1e23dec88f2231722872fc40@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Fri, 4 Jun 2021 21:43:43 +0000
Message-ID: <CAE-0n50k9z0ZFqP_pOmQjp0s3NCSKYHTmHvZ5rxLb3MzqgavrA@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sc7280: Add PCIe and PHY related nodes
To:     Prasad Malisetty <pmaliset@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        mgautam@codeaurora.org, dianders@chromium.org, mka@chromium.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Prasad Malisetty (2021-05-21 02:57:00)
> On 2021-05-08 01:36, Stephen Boyd wrote:
> > Quoting Prasad Malisetty (2021-05-07 03:17:27)
> >> Add PCIe controller and PHY nodes for sc7280 SOC.
> >>
> >> Signed-off-by: Prasad Malisetty <pmaliset@codeaurora.org>
> >> ---
> >>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 138
> >> +++++++++++++++++++++++++++++++++++
> >>  1 file changed, 138 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> >> b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> >> index 2cc4785..a9f25fc1 100644
> >> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> >> @@ -12,6 +12,7 @@
> >>  #include <dt-bindings/power/qcom-aoss-qmp.h>
> >>  #include <dt-bindings/power/qcom-rpmpd.h>
> >>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
> >> +#include <dt-bindings/gpio/gpio.h>
> >>
> >>  / {
> >>         interrupt-parent = <&intc>;
> >> @@ -316,6 +317,118 @@
> >>                         };
> >>                 };
> >>
> > [...]
> >> +
> >> +               pcie1_phy: phy@1c0e000 {
> >> +                       compatible =
> >> "qcom,sm8250-qmp-gen3x2-pcie-phy";
> >> +                       reg = <0 0x01c0e000 0 0x1c0>;
> >> +                       #address-cells = <2>;
> >> +                       #size-cells = <2>;
> >> +                       ranges;
> >> +                       clocks = <&gcc GCC_PCIE_1_AUX_CLK>,
> >> +                                <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
> >> +                                <&gcc GCC_PCIE_CLKREF_EN>,
> >> +                                <&gcc GCC_PCIE1_PHY_RCHNG_CLK>;
> >> +                       clock-names = "aux", "cfg_ahb", "ref",
> >> "refgen";
> >> +
> >> +                       resets = <&gcc GCC_PCIE_1_PHY_BCR>;
> >> +                       reset-names = "phy";
> >> +
> >> +                       assigned-clocks = <&gcc
> >> GCC_PCIE1_PHY_RCHNG_CLK>;
> >> +                       assigned-clock-rates = <100000000>;
> >> +
> >> +                       status = "disabled";
> >
> > I think the style is to put status disabled close to the compatible?
>
> Generally I have added status disabled in end as like many nodes. just
> curious to ask is there any specific reason to put close to compatible.

It's really up to qcom maintainers, which I am not.

> >> +                               };
> >> +
> >> +                               reset-n {
> >> +                                       pins = "gpio2";
> >> +                                       function = "gpio";
> >> +
> >> +                                       drive-strength = <16>;
> >> +                                       output-low;
> >> +                                       bias-disable;
> >> +                               };
> >> +
> >> +                               wake-n {
> >> +                                       pins = "gpio3";
> >> +                                       function = "gpio";
> >> +
> >> +                                       drive-strength = <2>;
> >> +                                       bias-pull-up;
> >> +                               };
> >
> > These last two nodes with the pull-up and drive-strength settings
> > should
> > be in the board files, like the idp one, instead of here in the SoC
> > file. That way board designers can take the SoC and connect the pcie to
> > an external device using these pins and set the configuration they want
> > on these pins, or choose not to connect them to the SoC at all and use
> > those pins for something else.
> >
> > In addition, it looks like the reset could be a reset-gpios property
> > instead of an output-low config.
> >
> we are using reset property as perst gpio in pcie node.

Ok, perst-gpios should be fine. Presumably perst-gpios should be in the
board and not in the SoC because of what I wrote up above.
