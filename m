Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB0324273AE
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Oct 2021 00:23:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243632AbhJHWZo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Oct 2021 18:25:44 -0400
Received: from mail-oi1-f171.google.com ([209.85.167.171]:43532 "EHLO
        mail-oi1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243643AbhJHWZj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Oct 2021 18:25:39 -0400
Received: by mail-oi1-f171.google.com with SMTP id o4so15529251oia.10;
        Fri, 08 Oct 2021 15:23:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QM5aQoLjMON9vUj5/950puKSpv86HsWUic3m5pIT+Q4=;
        b=L/SYXCKhboQiC6in7eCjvmUOFHWrYu1v0HzWGzEmWvaZklEL+wt1xN9FngGUKIqLRD
         knf0f2+BMnUtdGQkS5YWNxxyw+dH5wD6c7hCgQ247lsV4Hhn4/y6V37Vcm8JDN44tIvx
         LsGQQU4nBpiVKMVU/5HKI4DkP341CM00rezArGxSUOgbgRfbE2cVC0nVlELCT7fZmRuh
         L+22X5ywasXokodyyVsXz8j4SWMGKYpVro4MigJLZUDeErn5+0GbPi/3GVajvudA7qas
         VQpmBD2tUpPdzmwzuTQkYjr4kD53kc+GgIraDh4sQD+3ZBOO8cMa+c4jupI83fnHLsAZ
         wzpw==
X-Gm-Message-State: AOAM530QSKB+8U0gbcs7dgyjDPv7RWuTRhLvlb64qz4FjyFCKa+Wi1FI
        mdmEHc/e15G2FJvaUi75/g==
X-Google-Smtp-Source: ABdhPJwkgy/xy5obkA8eXwuJcSXnu6uvohGDw1jDVEACBLgns6g5AigK/d5AQ+oVoc2Lb3CwlHxwMw==
X-Received: by 2002:aca:4bc4:: with SMTP id y187mr6512011oia.174.1633731818563;
        Fri, 08 Oct 2021 15:23:38 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id e16sm207808oiw.2.2021.10.08.15.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 15:23:37 -0700 (PDT)
Received: (nullmailer pid 3424008 invoked by uid 1000);
        Fri, 08 Oct 2021 22:23:36 -0000
Date:   Fri, 8 Oct 2021 17:23:36 -0500
From:   Rob Herring <robh@kernel.org>
To:     Satya Priya <skakit@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Das Srinagesh <gurus@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        swboyd@chromium.org, collinsd@codeurora.org,
        subbaram@codeaurora.org, kgunda@codeaurora.org
Subject: Re: [PATCH V2 1/4] regulator: dt-bindings: Add pm8008 regulator
 bindings
Message-ID: <YWDE6Nu5Z3sAKGv4@robh.at.kernel.org>
References: <1633060859-22969-1-git-send-email-skakit@codeaurora.org>
 <1633060859-22969-2-git-send-email-skakit@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1633060859-22969-2-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Oct 01, 2021 at 09:30:56AM +0530, Satya Priya wrote:
> Add bindings for pm8008 pmic regulators.
> 
> Signed-off-by: Satya Priya <skakit@codeaurora.org>
> ---
> Changes in V2:
>  - Moved this patch before "mfd: pm8008: Add pm8008 regulator node" to
>    resolve dtschema errors. Removed regulator-min-microvolt and 
>    regulator-max-microvolt properties.
> 
>  .../bindings/regulator/qcom,pm8008-regulator.yaml  | 72 ++++++++++++++++++++++
>  1 file changed, 72 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/qcom,pm8008-regulator.yaml
> 
> diff --git a/Documentation/devicetree/bindings/regulator/qcom,pm8008-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,pm8008-regulator.yaml
> new file mode 100644
> index 0000000..31ac1eb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/qcom,pm8008-regulator.yaml
> @@ -0,0 +1,72 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/qcom,pm8008-regulator.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies, Inc. PM8008 Regulator bindings
> +
> +maintainers:
> +  - Satya Priya <skakit@codeaurora.org>
> +
> +description:
> +  Qualcomm Technologies, Inc. PM8008 is an I2C controlled PMIC
> +  containing 7 LDO regulators.
> +
> +properties:
> +  compatible:
> +    const: qcom,pm8008-regulator
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +  vdd_l1_l2-supply:
> +    description: Input supply phandle of ldo1 and ldo2 regulators.
> +
> +  vdd_l3_l4-supply:
> +    description: Input supply phandle of ldo3 and ldo4 regulators.
> +
> +  vdd_l5-supply:
> +    description: Input supply phandle of ldo5 regulator.
> +
> +  vdd_l6-supply:
> +    description: Input supply phandle of ldo6 regulator.
> +
> +  vdd_l7-supply:
> +    description: Input supply phandle of ldo7 regulator.
> +
> +patternProperties:
> +  "^regulator@[0-9a-f]+$":
> +    type: object
> +
> +    $ref: "regulator.yaml#"
> +
> +    description: PM8008 regulator peripherals of PM8008 regulator device
> +
> +    properties:
> +      reg:
> +        maxItems: 1

blank line here

What do the reg values represent here? You need to define that since it 
specific to this devices. Some constraints on the values would be nice 
too.

> +      regulator-name: true

blank line.

> +      qcom,min-dropout-voltage:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          Specifies the minimum voltage in microvolts that the parent

Use a standard unit suffix and you can drop the type ref.

> +          supply regulator must output, above the output of this
> +          regulator.
> +
> +    required:
> +      - reg
> +      - regulator-name
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +additionalProperties: false
> +...
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
> of Code Aurora Forum, hosted by The Linux Foundation
> 
> 
