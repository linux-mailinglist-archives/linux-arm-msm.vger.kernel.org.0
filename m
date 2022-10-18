Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D438E603276
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Oct 2022 20:29:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229926AbiJRS3n (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Oct 2022 14:29:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229918AbiJRS3h (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Oct 2022 14:29:37 -0400
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25F011B7A7;
        Tue, 18 Oct 2022 11:29:31 -0700 (PDT)
Date:   Tue, 18 Oct 2022 18:29:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1666117769; x=1666376969;
        bh=39j/N8FEDTlg592aMy449d8TbNb26ue3BrX+9fClMEM=;
        h=Date:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID;
        b=Qpcad0zWnJwbQrjv1rdxAt5LKpcayscF7lm64ACGbl5l7l/uQayJSBgXpzh6Zc6vi
         520RxBhqtNNxC/RgCVhxYGnaSVaPqdl4vA9CsehNB/ULSbWdSsAwkt8hH8QmkLpB+X
         4hB2Wv+ASQsbEBztvIzLrPcTGiRC90f9SngAovCk=
From:   Caleb Connolly <caleb@connolly.tech>
Cc:     krzysztof.kozlowski@linaro.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        devicetree@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jeff LaBundy <jeff@labundy.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Rob Herring <robh+dt@kernel.org>, Tom Rix <trix@redhat.com>
Subject: Re: [PATCH v7 1/2] dt-bindings: input: document Qualcomm PMI8998 haptics driver
Message-ID: <e588abdb-6817-25cf-dd9e-be23044e1e94@connolly.tech>
In-Reply-To: <20221015172915.1436236-2-caleb@connolly.tech>
References: <20221015172915.1436236-1-caleb@connolly.tech> <20221015172915.1436236-2-caleb@connolly.tech>
Feedback-ID: 10753939:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MISSING_HEADERS,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 15/10/2022 18:30, Caleb Connolly wrote:
> Add bindings for qcom PMIC PMI8998 haptics driver.
>
> Signed-off-by: Caleb Connolly <caleb@connolly.tech>
> ---
>   .../bindings/input/qcom,pmi8998-haptics.yaml  | 73 +++++++++++++++++++
>   1 file changed, 73 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/input/qcom,pmi8998=
-haptics.yaml
>
> diff --git a/Documentation/devicetree/bindings/input/qcom,pmi8998-haptics=
.yaml b/Documentation/devicetree/bindings/input/qcom,pmi8998-haptics.yaml
> new file mode 100644
> index 000000000000..d43324cceb89
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/qcom,pmi8998-haptics.yaml
> @@ -0,0 +1,73 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright 2020 Unisoc Inc.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/qcom,pmi8998-haptics.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm PMI8998/PM660 Haptics
> +
> +maintainers:
> +  - Caleb Connolly <caleb@connolly.tech>
> +
> +description: |
> +  Qualcomm SPMI haptics is a peripheral on some QTI PMICs. It supports l=
inear resonant
> +  actuators and eccentric rotating mass type haptics commonly found in m=
obile devices.
> +  It supports multiple sources of wave data such as an internal buffer, =
direct play
> +  (from kernel or userspace) as well as an audio output mode.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - qcom,pmi8998-haptics
> +          - qcom,pm660-charger

I've just noticed this typo! Will respin and fix...

> +          - qcom,pmi8996-haptics
> +          - qcom,pmi8941-haptics
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 2
> +
> +  interrupt-names:
> +    items:
> +      - const: short
> +      - const: play
> +
> +  qcom,wave-play-duration-us:
> +    description: |
> +      Wave sample duration in microseconds, 1/f where f
> +      is the resonant frequency of the actuator.
> +      This property is named qcom,wave-play-rate-us in
> +      downstream kernels.
> +    minimum: 0
> +    maximum: 20475
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - qcom,wave-play-rate-us
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    spmi {
> +      #address-cells =3D <1>;
> +      #size-cells =3D <0>;
> +      pmi8998_haptics: haptics@c000 {
> +        compatible =3D "qcom,pmi8998-haptics";
> +        reg =3D <0xc000>;
> +
> +        interrupts =3D <0x3 0xc0 0x0 IRQ_TYPE_EDGE_BOTH>,
> +                     <0x3 0xc0 0x1 IRQ_TYPE_EDGE_BOTH>;
> +        interrupt-names =3D "short", "play";
> +
> +        qcom,wave-play-rate-us =3D <4255>;
> +      };
> +    };
> --
> 2.38.0
>

--
Kind Regards,
Caleb

