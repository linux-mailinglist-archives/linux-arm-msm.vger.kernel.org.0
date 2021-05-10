Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B3E7377E3E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 May 2021 10:31:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230160AbhEJIc5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 May 2021 04:32:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230213AbhEJIc4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 May 2021 04:32:56 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3435DC061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 May 2021 01:31:52 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id b15so2587889plh.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 May 2021 01:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gckp4CwIdREzc2XV63iEz0XEYATQJrhMFeE6Dl5feXY=;
        b=Me15DNcWLAPOAGCbTZQTwgdxPa2RW3B5nKy7JFkDKIJ5b6K3U//qtvqskBKA4/uLxK
         oG5pEED0n3F6IxPkHIEiuuKyJvQSnWnfnrPIfGPWHaOzLvdruiP9tFNmGkku89EO5Cu6
         ZBxtRnUD3bdJT0AYz9qh+4ZAYhRUzk342qpwM8F8jHNCTja5dYxg4cQaZbZd4KT9JNhL
         J/wWDm+38bXjBQ9BgqyNXrtB9zHT1UAHLIPP6zBgRtBCh6EC+fT9WTPabXRczkvZU05g
         ESHzzeApa0zQDz6lOujSqwnAj4t9x61mna27CsLSPYCtQQ8YF42snmyEwDTyDa4JkK6R
         OeWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gckp4CwIdREzc2XV63iEz0XEYATQJrhMFeE6Dl5feXY=;
        b=MnMyruyvUIerQvKeqoQ+gx+9c5IdQDk1KDzCBK/fzNOkG6gd/spMLzXDYdf+KVw2qZ
         OJg57TB1NIHxeo6sNwublL/20FVHsc2PoLXm7oigG2rmIKPiKktgNiM1nYJQ5AfEEDIV
         2PEWRtn5Y0WedQNC1t51r2n1MLUWfBPqcuQQ0QL7DUh1WF8eTWPT+UXe/A2dByowtouD
         NC1eVVoU2tpQ1P1xA9oF2zx8G/ym/uYPU9cFuePsCC3S0abXZ6CfgBT+oLP79OC8kgDO
         ukEtyjpZ5sJv219upwhnzUkSWU1pN5ytP2IgNogPCriyqwyo1ELlibmv+sQ0zyip7Fnz
         30fg==
X-Gm-Message-State: AOAM530aX/3D9bEeSexy9QXQbAXSvn85mIeyTYhWb928LYcN31dFNyDj
        QvUOmPJ/QA7escCTr5Od+XJ0L/Vsqtwrx68TFCsfFQ==
X-Google-Smtp-Source: ABdhPJy3CFE2Nxrn+MAqigTDlVhEEg4UuArMR3muy2dMVaeEg7fjiVJpWKLYRCS3ODPR8gLHMLs6GMGLOvLhcl9Q/4c=
X-Received: by 2002:a17:90a:7e8f:: with SMTP id j15mr27073962pjl.19.1620635511729;
 Mon, 10 May 2021 01:31:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210510070532.3838598-1-vkoul@kernel.org>
In-Reply-To: <20210510070532.3838598-1-vkoul@kernel.org>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Mon, 10 May 2021 10:31:40 +0200
Message-ID: <CAG3jFyukM7tYMdQC_0HWGUBLZtafYu21yvk2LDLS0Ha_jJKm8g@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sm8350: fix the node unit addresses
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey Vinod,

Thanks for catching this.

On Mon, 10 May 2021 at 09:05, Vinod Koul <vkoul@kernel.org> wrote:
>
> Some node unit addresses were put wrongly in the dts, resulting in
> below warning when run with W=1
>
> arch/arm64/boot/dts/qcom/sm8350.dtsi:693.34-702.5: Warning (simple_bus_reg): /soc@0/thermal-sensor@c222000: simple-bus unit address format error, expected "c263000"
> arch/arm64/boot/dts/qcom/sm8350.dtsi:704.34-713.5: Warning (simple_bus_reg): /soc@0/thermal-sensor@c223000: simple-bus unit address format error, expected "c265000"
> arch/arm64/boot/dts/qcom/sm8350.dtsi:1180.32-1185.5: Warning (simple_bus_reg): /soc@0/interconnect@90e0000: simple-bus unit address format error, expected "90c0000"
>
> Fix by correcting to the correct address as given in reg node
>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8350.dtsi | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> index a8cd224a2f31..d015a9ca95a5 100644
> --- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> @@ -6,6 +6,7 @@
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/clock/qcom,gcc-sm8350.h>
>  #include <dt-bindings/clock/qcom,rpmh.h>
> +#include <dt-bindings/interconnect/qcom,sm8350.h>
>  #include <dt-bindings/mailbox/qcom-ipcc.h>
>  #include <dt-bindings/power/qcom-aoss-qmp.h>
>  #include <dt-bindings/power/qcom-rpmpd.h>
> @@ -689,7 +690,7 @@ pdc: interrupt-controller@b220000 {
>                         interrupt-controller;
>                 };
>
> -               tsens0: thermal-sensor@c222000 {
> +               tsens0: thermal-sensor@c263000 {
>                         compatible = "qcom,sm8350-tsens", "qcom,tsens-v2";
>                         reg = <0 0x0c263000 0 0x1ff>, /* TM */
>                               <0 0x0c222000 0 0x8>; /* SROT */
> @@ -700,7 +701,7 @@ tsens0: thermal-sensor@c222000 {
>                         #thermal-sensor-cells = <1>;
>                 };
>
> -               tsens1: thermal-sensor@c223000 {
> +               tsens1: thermal-sensor@c265000 {
>                         compatible = "qcom,sm8350-tsens", "qcom,tsens-v2";
>                         reg = <0 0x0c265000 0 0x1ff>, /* TM */
>                               <0 0x0c223000 0 0x8>; /* SROT */
> @@ -1176,7 +1177,7 @@ usb_2_ssphy: phy@88ebe00 {
>                         };
>                 };
>
> -               dc_noc: interconnect@90e0000 {
> +               dc_noc: interconnect@90c0000 {
>                         compatible = "qcom,sm8350-dc-noc";
>                         reg = <0 0x090c0000 0 0x4200>;
>                         #interconnect-cells = <1>;

Reviewed-by: Robert Foss <robert.foss@linaro.org>
