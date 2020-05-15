Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B59681D4DF1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2020 14:43:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726179AbgEOMn1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 May 2020 08:43:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726162AbgEOMn1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 May 2020 08:43:27 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E1E7C05BD0A
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2020 05:43:27 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id p127so2033292oia.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2020 05:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9kyKQJ2homgfOAGe2E1L8oQbfswl7dsX3WsAr4pTpyU=;
        b=Oo9OGukz5vUHYyRByCYNK/z6d0nJShT6FToPuhH7CdqfE/KavEedAAbKnns+xOYN+J
         Z08K+t8JrWFGeQnTCBt7JFjpEIT4vJAJ5KicPopY2h0ZOFoQndYWT9gZTi30+JnRA+Fr
         qtwrAgrSOOlza4w2ABgZTQ5Y19H55pKEVIuFjSqBY9xAScqvbE7+d1/+moUUQfquKqfB
         CYrYHRjwMcciZWRcPjYi77FbyrI3Cfpv5UzUlYIqGYmEwPwGjETl641wvrQiLG/De5wm
         5saCZMJ8cYzU7sQCcMrZpsIbY3VuUOaMcLJVgsABUZITVEPALqEH9/3Pra47q507KVD5
         j+tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9kyKQJ2homgfOAGe2E1L8oQbfswl7dsX3WsAr4pTpyU=;
        b=L0byOTOlQFawbZxP0ToWBA6UWNrkKsqsTaBw6LhvobIuzgygLs26qevLuodocwD3QV
         9YyGOVBusJCw10toH30GBh7l3yZgeULTCweZdR/LM0ZrrH2xfJ2QFldkbo+JD8+Xpkm/
         0tyexNgvjX0skPZsFbIwMt0TYFqCGMnpqL+hh/BCMpH2LnjDwCCpH/Qx0Lji9gqkoeqz
         wEYICigMrHuN/krWI6flxeWHHQBKxErS3wXGvYcTnHQqip4QDtFd68QbOeifyOQe8m4L
         HokWWYW8dOiLVHj+UoNmHo6s8IBMgrlj287913dgrUy0y0v/hHwxvudE1FGqCvT5AQw4
         vhuA==
X-Gm-Message-State: AOAM530P027tChCZDPampsFr3THJukHFrxz+mFgoIselD8RgQZt7m3A1
        l7qH/hqRfOUeZuD4Lk2H8csLdBJiVmtqjyfTIdIx1g==
X-Google-Smtp-Source: ABdhPJy+1AdH+F1A47Jf7bOpVkDcWVzgX3aG8AI4XCFKUwvfwJRnwkqCm8z/w434pIjAqu5A/i+DJskOoy/UVbu+yS4=
X-Received: by 2002:aca:1812:: with SMTP id h18mr1815141oih.133.1589546606362;
 Fri, 15 May 2020 05:43:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200515090820.1744353-1-robert.foss@linaro.org>
In-Reply-To: <20200515090820.1744353-1-robert.foss@linaro.org>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Fri, 15 May 2020 14:43:14 +0200
Message-ID: <CAG3jFyuz4PRQvTKPTz9u4fo43=Te=uVyQbSs95vZntLce+2pVw@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: apq8016-sbc-d3: Add Qualcomm APQ8016
 SBC + D3Camera mezzanine
To:     Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        devicetree <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Nicolas Dechesne <nicolas.dechesne@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 15 May 2020 at 11:08, Robert Foss <robert.foss@linaro.org> wrote:
>
> Add device treee support for the Qualcomm APQ8016 SBC, otherwise known as
> the Dragonboard 410c with the D3Camera mezzanine expansion board.
>
> The D3Camera mezzanine ships in a kit with a OmniVision 5640 sensor module,
> which is what this DT targets.
>
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
>
> Changes since v1:
>  - Vinod: Changed license to GPL+BSD
>  - Vinod: Changed copyright year to 2020
>  - Nico: Changed name of mezzanine to d3camera
>
>  arch/arm64/boot/dts/qcom/Makefile             |  1 +
>  .../boot/dts/qcom/apq8016-sbc-d3camera.dts    | 45 +++++++++++++++++++
>  2 files changed, 46 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/apq8016-sbc-d3camera.dts
>
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index cc103f7020fd..3f95b522694e 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -1,5 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>  dtb-$(CONFIG_ARCH_QCOM)        += apq8016-sbc.dtb
> +dtb-$(CONFIG_ARCH_QCOM)        += apq8016-sbc-d3camera.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        += apq8096-db820c.dtb
>  dtb-$(CONFIG_ARCH_QCOM) += apq8096-ifc6640.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        += ipq6018-cp01-c1.dtb
> diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc-d3camera.dts b/arch/arm64/boot/dts/qcom/apq8016-sbc-d3camera.dts
> new file mode 100644
> index 000000000000..752e5ec47499
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/apq8016-sbc-d3camera.dts
> @@ -0,0 +1,45 @@
> +// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
> +/*
> + * Copyright (c) 2020, The Linux Foundation. All rights reserved.

This copyright is incorrect, and should instead assigned to Linaro.
I'll spin a new version with this change.

> + */
> +
> +/dts-v1/;
> +
> +#include "apq8016-sbc.dtsi"
> +
> +/ {
> +       model = "Qualcomm Technologies, Inc. APQ 8016 SBC w/ D3Camera Mezzanine";
> +       compatible = "qcom,apq8016-sbc", "qcom,apq8016", "qcom,sbc";
> +};
> +
> +&cci_i2c0 {
> +       /delete-node/ camera_rear@3b;
> +
> +       camera_rear@76 {
> +               compatible = "ovti,ov5640";
> +               reg = <0x76>;
> +
> +               enable-gpios = <&msmgpio 34 GPIO_ACTIVE_HIGH>;
> +               reset-gpios = <&msmgpio 35 GPIO_ACTIVE_LOW>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&camera_rear_default>;
> +
> +               clocks = <&gcc GCC_CAMSS_MCLK0_CLK>;
> +               clock-names = "xclk";
> +               clock-frequency = <23880000>;
> +
> +               vdddo-supply = <&camera_vdddo_1v8>;
> +               vdda-supply = <&camera_vdda_2v8>;
> +               vddd-supply = <&camera_vddd_1v5>;
> +
> +               status = "ok";
> +
> +               port {
> +                       ov5640_ep: endpoint {
> +                               clock-lanes = <1>;
> +                               data-lanes = <0 2>;
> +                               remote-endpoint = <&csiphy0_ep>;
> +                       };
> +               };
> +       };
> +};
> --
> 2.25.1
>
