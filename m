Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1644D2214CC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2020 21:02:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726715AbgGOTCO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Jul 2020 15:02:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726648AbgGOTCO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Jul 2020 15:02:14 -0400
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com [IPv6:2607:f8b0:4864:20::944])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 094B4C061755
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2020 12:02:14 -0700 (PDT)
Received: by mail-ua1-x944.google.com with SMTP id n4so973248uae.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2020 12:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PmtQ0FrsBiOsqRJiGiTNFNGrmIx+8RMusU8KDu9T4aY=;
        b=ASTb52Iah2njRL2ETx3AA40ICz/qZGc0YsZ4RTzCHytuyNKqdrkSTbsaUPy6zkttzt
         S0MEohrvEOeRRGxXFQp93vIfJK+w3YIv6+8lc3P+gfKEBlEbAj93X2DRVgyxa9eN6HIB
         Wn7Yifou3j68JRXTW7Fq30Bc0R2f+cTkHEa1U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PmtQ0FrsBiOsqRJiGiTNFNGrmIx+8RMusU8KDu9T4aY=;
        b=QcbqZBxFNjv6xIAT2ACzy/IFjk5Sv6tS2BwBCkyzNsuiv2+0dGxlBageyKikyfcucD
         UG1OE6XAjeMMSCm+mu52Ulzk8tb9Aav01YhW/SGAFDmEo1/6Lu9FwBN77YJ/Ueo0I/gN
         qdT6LybXrfAJ4LWMRayLjQjpxrEpwqL7ERzJItu2PoHyp6snjKgat1HioelTE9gCv9tv
         lKLZ0HLIbsQx/yXFAslbNK6Yiy4kiXe30Xk6aPqvmSSU/or6zL1XWb6BIAvBNp+RjtQX
         bKGn6v+NrSh3aQ5nShg5+YMcSz56N7sLQQ5NGfp0l+CsUcrjzGJHZBBiU41nvbfiCuJq
         nnWA==
X-Gm-Message-State: AOAM533Pdw0h8DJPTZuftybnpjQQBILztzYvX4wJf2IdkgGco0xUbrIE
        jdPA0k06+CoLUObCbQDT8hyZ+j8wJ6s=
X-Google-Smtp-Source: ABdhPJxytTCcEqcHmDHwAP+EsDqVqb5AhXtJl7SPE257iHtbumzjo6VrWWu8972TGaiQZwgHhpNwjw==
X-Received: by 2002:ab0:6489:: with SMTP id p9mr832132uam.46.1594839732770;
        Wed, 15 Jul 2020 12:02:12 -0700 (PDT)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id 188sm427192vkt.28.2020.07.15.12.02.11
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2020 12:02:12 -0700 (PDT)
Received: by mail-vk1-f169.google.com with SMTP id h1so728744vkn.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2020 12:02:11 -0700 (PDT)
X-Received: by 2002:a1f:3d4a:: with SMTP id k71mr443715vka.65.1594839731375;
 Wed, 15 Jul 2020 12:02:11 -0700 (PDT)
MIME-Version: 1.0
References: <1594615586-17055-1-git-send-email-pillair@codeaurora.org>
In-Reply-To: <1594615586-17055-1-git-send-email-pillair@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 15 Jul 2020 12:01:59 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XtBhM_CSQM63LCiVDR0oPAAyEr5bG_FRt1tdwpw5OPKQ@mail.gmail.com>
Message-ID: <CAD=FV=XtBhM_CSQM63LCiVDR0oPAAyEr5bG_FRt1tdwpw5OPKQ@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: sc7180: Add missing properties for
 Wifi node
To:     Rakesh Pillai <pillair@codeaurora.org>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Evan Green <evgreen@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Sun, Jul 12, 2020 at 9:46 PM Rakesh Pillai <pillair@codeaurora.org> wrote:
>
> The wlan firmware memory is statically mapped in
> the Trusted Firmware, hence the wlan driver does
> not need to map/unmap this region dynamically.
>
> Hence add the property to indicate the wlan driver
> to not map/unamp the firmware memory region
> dynamically.
>
> Also add the chain1 voltage supply for wlan.
>
> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> ---
> Changes from v1:
> - Add the wifi mac alias
>
> This patch is created on top of the change by
> Douglas Anderson.
> https://lkml.org/lkml/2020/6/25/817
>
> Also the dt-bindings for the chain1 voltage supply
> is added by the below patch series:
> https://patchwork.kernel.org/project/linux-wireless/list/?series=309137
> ---
>  arch/arm64/boot/dts/qcom/sc7180-idp.dts | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> index 472f7f4..c042d61 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> @@ -19,6 +19,7 @@
>
>         aliases {
>                 bluetooth0 = &bluetooth;
> +               wifi0 = &wifi;
>                 hsuart0 = &uart3;
>                 serial0 = &uart8;

Could you alphabetize?

>         };
> @@ -391,10 +392,12 @@
>
>  &wifi {
>         status = "okay";
> +       qcom,msa-fixed-perm;
>         vdd-0.8-cx-mx-supply = <&vreg_l9a_0p6>;
>         vdd-1.8-xo-supply = <&vreg_l1c_1p8>;
>         vdd-1.3-rfa-supply = <&vreg_l2c_1p3>;
>         vdd-3.3-ch0-supply = <&vreg_l10c_3p3>;
> +       vdd-3.3-ch1-supply = <&vreg_l11c_3p3>;
>         wifi-firmware {
>                 iommus = <&apps_smmu 0xc2 0x1>;
>         };

Other than the alphabetical order:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
