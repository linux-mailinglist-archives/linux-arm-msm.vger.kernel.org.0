Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3326339C2B7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jun 2021 23:41:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230052AbhFDVnc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Jun 2021 17:43:32 -0400
Received: from mail-ot1-f49.google.com ([209.85.210.49]:39557 "EHLO
        mail-ot1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230075AbhFDVnb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Jun 2021 17:43:31 -0400
Received: by mail-ot1-f49.google.com with SMTP id 5-20020a9d01050000b02903c700c45721so9396356otu.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jun 2021 14:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=BpMcjydtHCRL730GVRWjY//UbSmPvtwxP7/K1Agu+es=;
        b=UxKRPxOAnoysgy7It+V1V2RJRi777Ms5P8JtBDsykQRSfMlkL94+Am4b2Wi7wnGkbT
         skxXt4KIsARqkX8dVSp/LrvnbDOfVUrWcbwIR8+yDnC5s0S5qmaJgUNMwegjjXLO1isR
         XTqTRAsAdZitbd6GkHMBT37ZbIfixWzCHhtqg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=BpMcjydtHCRL730GVRWjY//UbSmPvtwxP7/K1Agu+es=;
        b=GiHMbqMJhcHP77a4PzvociPAOOmPaIbzNazVBkTmwlOQV8DmfEl1wlLZ6bGLBkXP2R
         mgBFrKVOHmtGDk9rzUMN1DK5jsQXNveVTTF2B93VBISAROCmiQpQ65Q8UKO1wUj1gILO
         FgUAOQdyC/nOJl4xBW7bjLuALZEkbq8znUzjgu8ATmlKIjYFuhGT5sR5gVh2w9/6Bhjk
         4CGRzfpGlbTXJk0cCcifrzXKQhzsfCuWNW4pwd57Q+5CCcQA2MppZzBOeVWxa1zyEPP4
         w3gOZ4U8rZXLwKyE05+vBKSfLudkOrrkAT1TyN/9hXPx8E0tFg2FhJt61oddhx3IwuRs
         cKmA==
X-Gm-Message-State: AOAM531i9+58A6gQnEMhw4C7oR6aPsGGKmSz0DlKnIdcwEJ8XsXxugY4
        tXFklHsRA10732ibLVKlQBahfbCPsPgUITFa0PrDkQ==
X-Google-Smtp-Source: ABdhPJxoE4JA5ILCRd7HRVnYqwxGrlvLKLv96Ivb5McvBbqSIznJP5Cl3i+9rnvbOKiRr7OD+jsQ0AhuqFlu/Gzkii0=
X-Received: by 2002:a05:6830:3154:: with SMTP id c20mr5408138ots.233.1622842831621;
 Fri, 04 Jun 2021 14:40:31 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 4 Jun 2021 21:40:31 +0000
MIME-Version: 1.0
In-Reply-To: <1622804618-18480-2-git-send-email-sanm@codeaurora.org>
References: <1622804618-18480-1-git-send-email-sanm@codeaurora.org> <1622804618-18480-2-git-send-email-sanm@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Fri, 4 Jun 2021 21:40:31 +0000
Message-ID: <CAE-0n52CK3wk+xtaB8yaVV3kJiL=dgi2z9TsxQ7_2t_tdjuBBA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] arm64: dts: qcom: sc7280: Add USB related nodes
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Doug Anderson <dianders@chromium.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sandeep Maheswaram (2021-06-04 04:03:37)
> Add nodes for DWC3 USB controller, QMP and HS USB PHYs in sc7280 SOC.
>
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> ---
> changed usb3-phy to lanes in qmp phy node as it was causing probe failure.
>
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 149 +++++++++++++++++++++++++++++++++++
>  1 file changed, 149 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 0b6f119..d70d5fb 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -973,6 +973,110 @@
>                         };
>                 };
>
> +               usb_1_hsphy: phy@88e3000 {
> +                       compatible = "qcom,sc7280-usb-hs-phy",
> +                                    "qcom,usb-snps-hs-7nm-phy";
> +                       reg = <0 0x088e3000 0 0x400>;
> +                       status = "disabled";
> +                       #phy-cells = <0>;
> +
> +                       clocks = <&rpmhcc RPMH_CXO_CLK>;
> +                       clock-names = "ref";
> +
> +                       resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
> +               };
> +
> +               usb_2_hsphy: phy@88e4000 {
> +                       compatible = "qcom,sc7280-usb-hs-phy",
> +                                    "qcom,usb-snps-hs-7nm-phy";
> +                       reg = <0 0x088e4000 0 0x400>;
> +                       status = "disabled";
> +                       #phy-cells = <0>;
> +
> +                       clocks = <&rpmhcc RPMH_CXO_CLK>;
> +                       clock-names = "ref";
> +
> +                       resets = <&gcc GCC_QUSB2PHY_SEC_BCR>;
> +               };
> +
> +               usb_1_qmpphy: phy-wrapper@88e9000 {
> +                       compatible = "qcom,sm8250-qmp-usb3-phy";

Is this another combo usb/dp phy?

> +                       reg = <0 0x088e9000 0 0x200>,
> +                             <0 0x088e8000 0 0x20>;
> +                       reg-names = "reg-base", "dp_com";
> +                       status = "disabled";
> +                       #address-cells = <2>;
> +                       #size-cells = <2>;
> +                       ranges;
> +
> +                       clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
> +                                <&rpmhcc RPMH_CXO_CLK>,
> +                                <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>;
> +                       clock-names = "aux", "ref_clk_src", "com_aux";
> +
> +                       resets = <&gcc GCC_USB3_DP_PHY_PRIM_BCR>,

This makes me think yes. In which case, can we put the final node in
place instead of having to tack on DP phy at a later time?

> +                                <&gcc GCC_USB3_PHY_PRIM_BCR>;
> +                       reset-names = "phy", "common";
> +
> +                       usb_1_ssphy: lanes@88e9200 {

phy@88e9200?

> +                               reg = <0 0x088e9200 0 0x200>,
> +                                     <0 0x088e9400 0 0x200>,
> +                                     <0 0x088e9c00 0 0x400>,
> +                                     <0 0x088e9600 0 0x200>,
> +                                     <0 0x088e9800 0 0x200>,
> +                                     <0 0x088e9a00 0 0x100>;
> +                               #phy-cells = <0>;
> +                               #clock-cells = <1>;
> +                               clocks = <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
> +                               clock-names = "pipe0";
> +                               clock-output-names = "usb3_phy_pipe_clk_src";
> +                       };
> +               };
> +
