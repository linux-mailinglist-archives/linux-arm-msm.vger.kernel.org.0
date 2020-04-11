Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96EFB1A4D69
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2020 04:13:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726701AbgDKCNJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Apr 2020 22:13:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:45816 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726678AbgDKCNI (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Apr 2020 22:13:08 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A02A92078E;
        Sat, 11 Apr 2020 02:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586571188;
        bh=YgaDIcJ5xzL8CSiHnhaJpN1YTHxXZE4mV6g69AnHIx0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=vj0F8V1OiL4EYeKy/c6xUGDiz2Aeipk/uYW1PLLcfJWzOlLdSzg47sxjhJlvgXvz0
         tOQIg04fzd2zupngGMFTLULKjV7SfVMkhLheQMYTZZSpDfzrQdzoRd5a3z/mGAmdCg
         wbjfzN4OL6rEVD37s/VeW1qbfNCuHjV31sHqTRcc=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1586298209-4589-2-git-send-email-wcheng@codeaurora.org>
References: <1586298209-4589-1-git-send-email-wcheng@codeaurora.org> <1586298209-4589-2-git-send-email-wcheng@codeaurora.org>
Subject: Re: [PATCH v3 1/4] dt-bindings: phy: Add binding for qcom,usb-hs-7nm
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        vinod.koul@linaro.org, Wesley Cheng <wcheng@codeaurora.org>
To:     Wesley Cheng <wcheng@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, mark.rutland@arm.com,
        mturquette@baylibre.com, robh+dt@kernel.org
Date:   Fri, 10 Apr 2020 19:13:07 -0700
Message-ID: <158657118788.199533.6157625397469536329@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Wesley Cheng (2020-04-07 15:23:26)
> diff --git a/Documentation/devicetree/bindings/phy/qcom,usb-hs-7nm.yaml b=
/Documentation/devicetree/bindings/phy/qcom,usb-hs-7nm.yaml
> new file mode 100644
> index 0000000..7292e27
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,usb-hs-7nm.yaml
> @@ -0,0 +1,76 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/phy/qcom,usb-hs-7nm.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Qualcomm Synopsys 7nm High-Speed USB PHY
> +
> +maintainers:
> +  - Wesley Cheng <wcheng@codeaurora.org>
> +
> +description: |
> +  Qualcomm Hi-Speed 7nm USB PHY

High?

> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,usb-snps-hs-7nm-phy
> +      - qcom,sm8150-usb-hs-phy
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#phy-cells":
> +    const: 0
> +
> +  clocks:
> +    items:
> +      - description: rpmhcc ref clock
> +
> +  clock-names:
> +    items:
> +      - const: ref
> +
> +  resets:
> +    items:
> +      - description: PHY core reset
> +
> +  vdda-pll-supply:
> +    description: phandle to the regulator VDD supply node.
> +
> +  vdda18-supply:
> +    description: phandle to the regulator 1.8V supply node.
> +
> +  vdda33-supply:
> +    description: phandle to the regulator 3.3V supply node.
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#phy-cells"
> +  - clocks
> +  - clock-names
> +  - resets
> +  - vdda-pll-supply
> +  - vdda18-supply
> +  - vdda33-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,rpmh.h>
> +    #include <dt-bindings/clock/qcom,gcc-sm8150.h>
> +    usb_1_hsphy: phy@88e2000 {

Is the label necessary? Best to drop it if not.

> +        compatible =3D "qcom,sm8150-usb-hs-phy";
> +        reg =3D <0 0x088e2000 0 0x400>;
> +        status =3D "disabled";

I think we can leave out status in examples.

> +        #phy-cells =3D <0>;
> +
> +        clocks =3D <&rpmhcc RPMH_CXO_CLK>;
> +        clock-names =3D "ref";
> +
> +        resets =3D <&gcc GCC_QUSB2PHY_PRIM_BCR>;
> +    };
> +...
> \ No newline at end of file

Why no newline at end of file?

> --=20
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
