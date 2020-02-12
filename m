Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95DD815B19F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2020 21:16:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728098AbgBLUQg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Feb 2020 15:16:36 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:38151 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727600AbgBLUQg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Feb 2020 15:16:36 -0500
Received: by mail-pg1-f196.google.com with SMTP id d6so1787889pgn.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2020 12:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4cuXzzmmpPcLczy0qmJk/Rn4HY2/+QU6mo8lxNbiZT4=;
        b=IDjXvk3CUYXG9mtaCYefq9509kGq2mr2Nphq+QyeEay9hJK+wwO0uFqR+n1G0vNwLd
         k6ZNxgWaltfWzksSdSIw/KJQ+hJ7REPlF/myQCInKojiDc/+aVOj2SjHvWEgPGZm6PS3
         CmzLpQKY0k1hF4BWDkmqoHgvs5Ulib7KZbreQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4cuXzzmmpPcLczy0qmJk/Rn4HY2/+QU6mo8lxNbiZT4=;
        b=Wpbhjok4R+MOVD2osh3TZHdb34hZxjcFMHTUbVbwJY2FdvShhLkN7guY8/3+0Z74hi
         F1fQ/RJCi1vc4/2HuztraM+FIKqlWFV5F7S+/IFqadRxtwcYk7UxN/KUtgAhZWizFIyv
         FAJPwZNvrrRLwJKKkv/Y3ndSpgDwyk57QznSqjOkw033xB8ISHLesSV7bC7hiUcJJytt
         wyCKw2M8GgpMCeIPZ55UWjZZnEfiqf9axYReukkvFhEWwN6zrNg+ARY6dB+GxhZxTCyu
         vnHXei93rDPh7ocn/iKqxZb0dSfndezRVOfAI6l/yEKWt/4lR2XAvY1ZP3qPdkYUKXYD
         mqDw==
X-Gm-Message-State: APjAAAUQMXqwAiOoJ04CxpbucFL7z+05v0lC38wwizF8rKM1pHr51Bc0
        t+FufmtPeAxwCmM/CJZjSbxL8A==
X-Google-Smtp-Source: APXvYqy9/lSIxZTxrSAoNKdWNEvaWgClcoOpfpuXtcZ2mTH3lRa8Ax5wU98mkoXfsMblDMJycUQjNA==
X-Received: by 2002:a63:7c4d:: with SMTP id l13mr14282223pgn.275.1581538595417;
        Wed, 12 Feb 2020 12:16:35 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id i64sm1401950pgc.51.2020.02.12.12.16.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2020 12:16:34 -0800 (PST)
Date:   Wed, 12 Feb 2020 12:16:33 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>
Subject: Re: [PATCH v3 1/4] dt-bindings: phy: qcom,qmp: Convert QMP phy
 bindings to yaml
Message-ID: <20200212201633.GB50449@google.com>
References: <1581506488-26881-1-git-send-email-sanm@codeaurora.org>
 <1581506488-26881-2-git-send-email-sanm@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1581506488-26881-2-git-send-email-sanm@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Sandeep,

On Wed, Feb 12, 2020 at 04:51:25PM +0530, Sandeep Maheswaram wrote:
> Convert QMP phy  bindings to DT schema format using json-schema.

nit: s/phy  bindings/PHY bindings/

> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---
>  .../devicetree/bindings/phy/qcom,qmp-phy.yaml      | 283 +++++++++++++++++++++
>  .../devicetree/bindings/phy/qcom-qmp-phy.txt       | 227 -----------------
>  2 files changed, 283 insertions(+), 227 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
>  delete mode 100644 Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
> new file mode 100644
> index 0000000..b39a594
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
> @@ -0,0 +1,283 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/phy/qcom,qmp-phy.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Qualcomm QMP PHY controller
> +
> +maintainers:
> +  - Manu Gautam <mgautam@codeaurora.org>
> +
> +description:
> +  QMP phy controller supports physical layer functionality for a number of
> +  controllers on Qualcomm chipsets, such as, PCIe, UFS, and USB.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,ipq8074-qmp-pcie-phy
> +      - qcom,msm8996-qmp-pcie-phy
> +      - qcom,msm8996-qmp-usb3-phy
> +      - qcom,msm8998-qmp-usb3-phy
> +      - qcom,msm8998-qmp-ufs-phy
> +      - qcom,msm8998-qmp-pcie-phy
> +      - qcom,sdm845-qmp-usb3-phy
> +      - qcom,sdm845-qmp-usb3-uni-phy
> +      - qcom,sdm845-qmp-ufs-phy
> +      - qcom,sm8150-qmp-ufs-phy

nit: sort in alphabetical order (i.e. -pcie, -ufs, -usb3)?

> +
> +  reg:
> +    minItems: 1
> +    items:
> +      - description: Address and length of PHY's common serdes block.
> +      - description: Address and length of the DP_COM control block.
> +
> +  reg-names:
> +    items:
> +      - const: reg-base
> +      - const: dp_com
> +
> +  "#clock-cells":
> +     enum: [ 1, 2 ]
> +
> +  "#address-cells":
> +    enum: [ 1, 2 ]
> +
> +  "#size-cells":
> +    enum: [ 1, 2 ]
> +
> +  clocks:
> +    maxItems: 4
> +    minItems: 1

nit: minItems before maxItems, which is the order humans expect, also
it is the prevalent order in other .yaml bindings.

Do we actually need min/maxItems? I would expect the below rules for each
compatible string to take care of it, however I'm not a schema expert.

> +
> +  clock-names:
> +    maxItems: 4
> +    minItems: 1
> +  resets:
> +    maxItems: 3
> +    minItems: 1
> +
> +  reset-names:
> +    maxItems: 3
> +    minItems: 1
> +
> +  vdda-phy-supply:
> +    description:
> +        Phandle to a regulator supply to PHY core block.
> +
> +  vdda-pll-supply:
> +    description:
> +        Phandle to 1.8V regulator supply to PHY refclk pll block.
> +
> +  vddp-ref-clk-supply:
> +    description:
> +        Phandle to a regulator supply to any specific refclk
> +        pll block.
> +
> +#Required nodes:
> +patternProperties:
> +  "^lanes@[0-9a-f]+$":
> +    type: object
> +    description:
> +      Each device node of QMP phy is required to have as many child nodes as
> +      the number of lanes the PHY has.
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#clock-cells"
> +  - "#address-cells"
> +  - "#size-cells"
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +  - vdda-phy-supply
> +  - vdda-pll-supply
> +
> +additionalProperties: false
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +             enum:

fix indentation (2 blanks, not 3)

> +               - qcom,sdm845-qmp-usb3-phy
> +               - qcom,sdm845-qmp-usb3-uni-phy
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: Phy aux clock.
> +            - description: Phy config clock.
> +            - description: 19.2 MHz ref clk.
> +            - description: Phy common block aux clock.
> +        clock-names:
> +          items:
> +            - const: aux
> +            - const: cfg_ahb
> +            - const: ref
> +            - const: com_aux
> +        resets:
> +          items:
> +            - description: reset of phy block.
> +            - description: phy common block reset.
> +        reset-names:
> +          items:
> +             - const: phy
> +             - const: common

fix indentation (3 -> 2)

> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +             enum:

fix indentation (3 -> 2)

> +               - qcom,msm8996-qmp-pcie-phy
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: Phy aux clock.
> +            - description: Phy config clock.
> +            - description: 19.2 MHz ref clk.
> +

nit: remove empty line or add it everywhere.

> +        clock-names:
> +          items:
> +            - const: aux
> +            - const: cfg_ahb
> +            - const: ref
> +        resets:
> +          items:
> +            - description: reset of phy block.
> +            - description: phy common block reset.
> +            - description: phy's ahb cfg block reset.
> +        reset-names:
> +          items:
> +             - const: phy
> +             - const: common
> +             - const: cfg

fix indentation (3 -> 2)

> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +             enum:

fix indentation (3 -> 2)

> +               - qcom,msm8996-qmp-pcie-phy
> +               - qcom,msm8996-qmp-usb3-phy
> +               - qcom,msm8998-qmp-pcie-phy
> +               - qcom,msm8998-qmp-usb3-phy
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: Phy aux clock.
> +            - description: Phy config clock.
> +            - description: 19.2 MHz ref clk.
> +        clock-names:
> +          items:
> +            - const: aux
> +            - const: cfg_ahb
> +            - const: ref
> +        resets:
> +          items:
> +            - description: reset of phy block.
> +            - description: phy common block reset.
> +        reset-names:
> +          items:
> +             - const: phy
> +             - const: common

According to the .txt binding this is not correct for
'qcom,msm8996-qmp-pcie-phy':

  For "qcom,msm8996-qmp-pcie-phy" must contain:
			"phy", "common", "cfg".

This also matches the actual use in arch/arm64/boot/dts/qcom/msm8996.dtsi

Also the indentation needs to be fixed (3 -> 2)

> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +             enum:

fix indentation (3 -> 2)

> +               - qcom,msm8998-qmp-ufs-phy
> +               - qcom,sdm845-qmp-ufs-phy
> +               - qcom,sm8150-qmp-ufs-phy
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: 19.2 MHz ref clk.
> +            - description: Phy reference aux clock.
> +        clock-names:
> +          items:
> +            - const: ref
> +            - const: ref_aux
> +        resets:
> +          items:
> +            - description: PHY reset in the UFS controller.
> +        reset-names:
> +          items:
> +            - const: ufsphy
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +             enum:

fix indentation (3 -> 2)

Thanks

Matthias
