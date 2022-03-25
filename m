Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 389814E7D79
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Mar 2022 01:22:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229544AbiCYT3M (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Mar 2022 15:29:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbiCYT24 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Mar 2022 15:28:56 -0400
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com [IPv6:2001:4860:4864:20::30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BD751ED077
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Mar 2022 12:02:45 -0700 (PDT)
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-d6e29fb3d7so9012799fac.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Mar 2022 12:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=eoT9yhQ39z80e3desr+nAYOd9xebaM0lxHgFNWM9EFM=;
        b=oQceHy2H3GJcBV+uCAA/iJuYyDBNgfuKq+avqcjMAgP9U51wlBJvFywimj1MQMJ/gR
         sTI0O3Kt6AcaA+ZVBJm/MGjExG/EA9hWngNV0wJbuRYr6hcMilVTdWaCA3XvLWzBlpMo
         cOg5S8yjVbV4QVFP5QHiiY/A7H48LZLctT43M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=eoT9yhQ39z80e3desr+nAYOd9xebaM0lxHgFNWM9EFM=;
        b=wy+rxJ13+6pQ/qPSfcQtj1ARRV5KnAzQj9PwTw2rzJdCt8FLTuHaQGr0j5ojXieKum
         XL/a0f3lG+qQWOs/n9Y+4YbTzFuj7ntEfH2JurH/NKhLojZOrE0A33dJx3nfwtNdDEUV
         mE8iPFvHoa1tDPtgK9JRZW2X5MewxNJ3UpzDvIIu5HfxegFhdBJJAPgLhnRXp9k/CsKZ
         HCn/bBU+S/fNdmbYbH2IxgKBjedUHpKLjhKXvPy2KTvGlR4l6nyp65BUbsq0r1h3svpA
         BNUkHl5gHAOFl3RrLyIu8c9uFIn72mhizhMd1j05+v4KbpKETtNZOA6xCZZQPHUyTPLq
         Ourw==
X-Gm-Message-State: AOAM533yMj9xMUp0yfdTplsldbNzO8FInwIjhOyrcdiUNd4UZunRrhlz
        RdduF6wEa6ahM3Ex9slmR9ABLrgnqT4aLVh+kmR0iaoLV0c=
X-Google-Smtp-Source: ABdhPJygezRHYIps4EzQ86hC/YMeXvTAECMZBpECdy1LrwbCwWKOiPrZf2+YfZ3O4yAyBqczHuf1ylmdoDFq0fjI1Bo=
X-Received: by 2002:aca:bd41:0:b0:2ec:ff42:814f with SMTP id
 n62-20020acabd41000000b002ecff42814fmr6027332oif.63.1648231683374; Fri, 25
 Mar 2022 11:08:03 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 25 Mar 2022 13:08:02 -0500
MIME-Version: 1.0
In-Reply-To: <1648209491-30165-3-git-send-email-quic_c_skakit@quicinc.com>
References: <1648209491-30165-1-git-send-email-quic_c_skakit@quicinc.com> <1648209491-30165-3-git-send-email-quic_c_skakit@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Fri, 25 Mar 2022 13:08:02 -0500
Message-ID: <CAE-0n53Zk1rXu5U6vEppZ=B8cJ0chmt+-aY03=W4mQedQq5Omg@mail.gmail.com>
Subject: Re: [PATCH V8 2/7] dt-bindings: mfd: pm8008: Add pm8008 regulator bindings
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Satya Priya <quic_c_skakit@quicinc.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Das Srinagesh <gurus@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_collinsd@quicinc.com,
        quic_subbaram@quicinc.com, quic_jprakash@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Satya Priya (2022-03-25 04:58:06)
> Add bindings for pm8008 regulators device.
>
> Signed-off-by: Satya Priya <quic_c_skakit@quicinc.com>
> ---
> Changes in V8:
>  - This is split from pm8008.yaml binding.
>
>  .../bindings/mfd/qcom,pm8008-regulators.yaml       | 87 ++++++++++++++++++++++
>  1 file changed, 87 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/qcom,pm8008-regulators.yaml
>
> diff --git a/Documentation/devicetree/bindings/mfd/qcom,pm8008-regulators.yaml b/Documentation/devicetree/bindings/mfd/qcom,pm8008-regulators.yaml
> new file mode 100644
> index 0000000..139fbf9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/qcom,pm8008-regulators.yaml
> @@ -0,0 +1,87 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/qcom,pm8008-regulators.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies, Inc. PM8008 Regulator bindings
> +
> +maintainers:
> +  - Satya Priya <quic_c_skakit@quicinc.com>
> +
> +description: |
> +  Qualcomm Technologies, Inc. PM8008 is an I2C controlled PMIC
> +  containing 7 LDO regulators. This binding specifies the PM8008
> +  regulator peripherals of PM8008 device.
> +
> +properties:
> +  compatible:
> +    const: qcom,pm8008-regulators
> +
> +  reg:
> +    description:
> +      I2C slave address.

Drop description? We know what it is.

> +
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 0
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
> +  "^ldo[1-7]$":
> +    type: object
> +    $ref: "../regulator/regulator.yaml#"
> +    description: PM8008 regulator peripherals of PM8008 regulator device
> +
> +required:
> +  - compatible
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/mfd/qcom-pm8008.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    qupv3_se13_i2c {

i2c

> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +      pm8008_regulators: pmic@9 {

Drop phandle please.

> +        compatible = "qcom,pm8008-regulators";
> +        reg = <0x9>;
> +        #address-cells = <0>;
> +        #size-cells = <0>;
> +
> +        vdd_l1_l2-supply = <&vreg_s8b_1p2>;
> +        vdd_l3_l4-supply = <&vreg_s1b_1p8>;
> +        vdd_l5-supply = <&vreg_bob>;
> +        vdd_l6-supply = <&vreg_bob>;
> +        vdd_l7-supply = <&vreg_bob>;
> +
> +        pm8008_l1: ldo1 {
> +          regulator-name = "pm8008_l1";
> +          regulator-min-microvolt = <950000>;
> +          regulator-max-microvolt = <1300000>;
> +        };
> +      };
> +    };
> +...
> --
> 2.7.4
>
