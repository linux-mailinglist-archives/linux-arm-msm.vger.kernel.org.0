Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00EC9785A86
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Aug 2023 16:30:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236430AbjHWOa3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Aug 2023 10:30:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236170AbjHWOa3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Aug 2023 10:30:29 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 495B9E54;
        Wed, 23 Aug 2023 07:30:27 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C54D5623B8;
        Wed, 23 Aug 2023 14:30:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17A3BC433CA;
        Wed, 23 Aug 2023 14:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692801026;
        bh=seuJE57LmhgQBWgzP3CeadKkcVuZvCWfGmGjgJPDezg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=W32BKWeSr3EGW33OhQ2Xxt4KpnHflBCUxH1geEiuw97fncJBQ55GIDdrKPd1v0ORz
         kuqVCGdBUBQ+5CZPutg+HwDEKyIw4nAeF13ilSbRWd6fd0eujkKXaPKA5UPK1lS7Xt
         LmihvGWuaHOSNmMup0hUHyMe8lGD+YBHmJFMIWx3sB0SkZTVNjOrKv5WxHNlmlvXU5
         zsuFq3Ip8KyI9ISZmEePHkJyQ518Y3tUSjOtkp4PZCNLBdtsMi2gpVCZZ+LLfoO278
         rnTg1KM7RmZt948geZoEWuhDx2F+DClxA6kNKJh5EGPAh7iAQVWm5Bqc1cDI0pmhod
         IoRagCzUq5Nzg==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2bcc14ea414so46826951fa.0;
        Wed, 23 Aug 2023 07:30:25 -0700 (PDT)
X-Gm-Message-State: AOJu0YyInqdgRkfD1W16j4QqGnlu0xvR2w4I04NdvlgvK48snWPTWMNx
        hxpof7tdGbVuIGrGg9OdIK8YygGE7Z+W/MyBLQ==
X-Google-Smtp-Source: AGHT+IEvGaENg3uACQxm+suhhVlW+4Dvym9Q/B9Lg+QsxLVwHRA5mq1wMFk6JB9BORBMxFdz/Ds+A7ovWwakA6xH09k=
X-Received: by 2002:a2e:3817:0:b0:2ba:18e5:1069 with SMTP id
 f23-20020a2e3817000000b002ba18e51069mr9308770lja.4.1692801023905; Wed, 23 Aug
 2023 07:30:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230820142035.89903-1-dmitry.baryshkov@linaro.org> <20230820142035.89903-2-dmitry.baryshkov@linaro.org>
In-Reply-To: <20230820142035.89903-2-dmitry.baryshkov@linaro.org>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Wed, 23 Aug 2023 09:30:11 -0500
X-Gmail-Original-Message-ID: <CAL_JsqK_8ZiVmb1i4BVO-ZganxdaXtJBdi0riR+iXcOok0ZKcA@mail.gmail.com>
Message-ID: <CAL_JsqK_8ZiVmb1i4BVO-ZganxdaXtJBdi0riR+iXcOok0ZKcA@mail.gmail.com>
Subject: Re: [PATCH v3 01/18] dt-bindings: phy: migrate QMP PCIe PHY bindings
 to qcom,sc8280xp-qmp-pcie-phy.yaml
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Aug 20, 2023 at 9:20=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Migrate legacy bindings (described in qcom,ipq8074-qmp-pcie-phy.yaml)
> to qcom,sc8280xp-qmp-pcie-phy.yaml. This removes a need to declare
> the child PHY node or split resource regions.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../phy/qcom,ipq8074-qmp-pcie-phy.yaml        | 278 +++---------------
>  .../phy/qcom,msm8998-qmp-pcie-phy.yaml        |  97 ++++++
>  .../phy/qcom,sc8280xp-qmp-pcie-phy.yaml       |  32 +-
>  3 files changed, 161 insertions(+), 246 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/phy/qcom,msm8998-qm=
p-pcie-phy.yaml
>
> diff --git a/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-=
phy.yaml b/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.=
yaml
> index 3d42ee3901a1..5073007267ad 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yam=
l
> +++ b/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yam=
l
> @@ -13,287 +13,79 @@ description:
>    QMP PHY controller supports physical layer functionality for a number =
of
>    controllers on Qualcomm chipsets, such as, PCIe, UFS, and USB.
>
> -  Note that these bindings are for SoCs up to SC8180X. For newer SoCs, s=
ee
> -  qcom,sc8280xp-qmp-pcie-phy.yaml.
> -
>  properties:
>    compatible:
>      enum:
>        - qcom,ipq6018-qmp-pcie-phy
>        - qcom,ipq8074-qmp-gen3-pcie-phy
>        - qcom,ipq8074-qmp-pcie-phy
> -      - qcom,msm8998-qmp-pcie-phy
> -      - qcom,sc8180x-qmp-pcie-phy
> -      - qcom,sdm845-qhp-pcie-phy
> -      - qcom,sdm845-qmp-pcie-phy
> -      - qcom,sdx55-qmp-pcie-phy
> -      - qcom,sm8250-qmp-gen3x1-pcie-phy
> -      - qcom,sm8250-qmp-gen3x2-pcie-phy
> -      - qcom,sm8250-qmp-modem-pcie-phy
> -      - qcom,sm8450-qmp-gen3x1-pcie-phy
> -      - qcom,sm8450-qmp-gen4x2-pcie-phy
>
>    reg:
>      items:
>        - description: serdes
>
> -  "#address-cells":
> -    enum: [ 1, 2 ]
> -
> -  "#size-cells":
> -    enum: [ 1, 2 ]
> -
> -  ranges: true
> -
>    clocks:
> -    minItems: 2
> -    maxItems: 4
> +    maxItems: 3
>
>    clock-names:
> -    minItems: 2
> -    maxItems: 4
> +    items:
> +      - const: aux
> +      - const: cfg_ahb
> +      - const: pipe
>
>    resets:
> -    minItems: 1
>      maxItems: 2
>
>    reset-names:
> -    minItems: 1
> -    maxItems: 2
> -
> -  vdda-phy-supply: true
> -
> -  vdda-pll-supply: true
> -
> -  vddp-ref-clk-supply: true
> -
> -patternProperties:
> -  "^phy@[0-9a-f]+$":
> -    type: object
> -    description: single PHY-provider child node
> -    properties:
> -      reg:
> -        minItems: 3
> -        maxItems: 6
> -
> -      clocks:
> -        items:
> -          - description: PIPE clock
> -
> -      clock-names:
> -        deprecated: true
> -        items:
> -          - const: pipe0
> -
> -      "#clock-cells":
> -        const: 0
> -
> -      clock-output-names:
> -        maxItems: 1
> +    items:
> +      - const: phy
> +      - const: common
>
> -      "#phy-cells":
> -        const: 0
> +  "#clock-cells":
> +    const: 0
>
> -    required:
> -      - reg
> -      - clocks
> -      - "#clock-cells"
> -      - clock-output-names
> -      - "#phy-cells"
> +  clock-output-names:
> +    maxItems: 1
>
> -    additionalProperties: false
> +  "#phy-cells":
> +    const: 0
>
>  required:
>    - compatible
>    - reg
> -  - "#address-cells"
> -  - "#size-cells"
> -  - ranges
>    - clocks
>    - clock-names
>    - resets
>    - reset-names
> +  - "#clock-cells"
> +  - clock-output-names
> +  - "#phy-cells"
>
>  additionalProperties: false
>
> -allOf:
> -  - if:
> -      properties:
> -        compatible:
> -          contains:
> -            enum:
> -              - qcom,msm8998-qmp-pcie-phy
> -    then:
> -      properties:
> -        clocks:
> -          maxItems: 3
> -        clock-names:
> -          items:
> -            - const: aux
> -            - const: cfg_ahb
> -            - const: ref
> -        resets:
> -          maxItems: 2
> -        reset-names:
> -          items:
> -            - const: phy
> -            - const: common
> -      required:
> -        - vdda-phy-supply
> -        - vdda-pll-supply
> -
> -  - if:
> -      properties:
> -        compatible:
> -          contains:
> -            enum:
> -              - qcom,ipq6018-qmp-pcie-phy
> -              - qcom,ipq8074-qmp-gen3-pcie-phy
> -              - qcom,ipq8074-qmp-pcie-phy
> -    then:
> -      properties:
> -        clocks:
> -          maxItems: 2
> -        clock-names:
> -          items:
> -            - const: aux
> -            - const: cfg_ahb
> -        resets:
> -          maxItems: 2
> -        reset-names:
> -          items:
> -            - const: phy
> -            - const: common
> -
> -  - if:
> -      properties:
> -        compatible:
> -          contains:
> -            enum:
> -              - qcom,sc8180x-qmp-pcie-phy
> -              - qcom,sdm845-qhp-pcie-phy
> -              - qcom,sdm845-qmp-pcie-phy
> -              - qcom,sdx55-qmp-pcie-phy
> -              - qcom,sm8250-qmp-gen3x1-pcie-phy
> -              - qcom,sm8250-qmp-gen3x2-pcie-phy
> -              - qcom,sm8250-qmp-modem-pcie-phy
> -              - qcom,sm8450-qmp-gen3x1-pcie-phy
> -              - qcom,sm8450-qmp-gen4x2-pcie-phy
> -    then:
> -      properties:
> -        clocks:
> -          maxItems: 4
> -        clock-names:
> -          items:
> -            - const: aux
> -            - const: cfg_ahb
> -            - const: ref
> -            - const: refgen
> -        resets:
> -          maxItems: 1
> -        reset-names:
> -          items:
> -            - const: phy
> -      required:
> -        - vdda-phy-supply
> -        - vdda-pll-supply
> -
> -  - if:
> -      properties:
> -        compatible:
> -          contains:
> -            enum:
> -              - qcom,sc8180x-qmp-pcie-phy
> -              - qcom,sm8250-qmp-gen3x2-pcie-phy
> -              - qcom,sm8250-qmp-modem-pcie-phy
> -              - qcom,sm8450-qmp-gen4x2-pcie-phy
> -    then:
> -      patternProperties:
> -        "^phy@[0-9a-f]+$":
> -          properties:
> -            reg:
> -              items:
> -                - description: TX lane 1
> -                - description: RX lane 1
> -                - description: PCS
> -                - description: TX lane 2
> -                - description: RX lane 2
> -                - description: PCS_MISC
> -
> -  - if:
> -      properties:
> -        compatible:
> -          contains:
> -            enum:
> -              - qcom,sdm845-qmp-pcie-phy
> -              - qcom,sdx55-qmp-pcie-phy
> -              - qcom,sm8250-qmp-gen3x1-pcie-phy
> -              - qcom,sm8450-qmp-gen3x1-pcie-phy
> -    then:
> -      patternProperties:
> -        "^phy@[0-9a-f]+$":
> -          properties:
> -            reg:
> -              items:
> -                - description: TX
> -                - description: RX
> -                - description: PCS
> -                - description: PCS_MISC
> -
> -  - if:
> -      properties:
> -        compatible:
> -          contains:
> -            enum:
> -              - qcom,ipq6018-qmp-pcie-phy
> -              - qcom,ipq8074-qmp-pcie-phy
> -              - qcom,msm8998-qmp-pcie-phy
> -              - qcom,sdm845-qhp-pcie-phy
> -    then:
> -      patternProperties:
> -        "^phy@[0-9a-f]+$":
> -          properties:
> -            reg:
> -              items:
> -                - description: TX
> -                - description: RX
> -                - description: PCS
> -
>  examples:
>    - |
> -    #include <dt-bindings/clock/qcom,gcc-sm8250.h>
> -    phy-wrapper@1c0e000 {
> -        compatible =3D "qcom,sm8250-qmp-gen3x2-pcie-phy";
> -        reg =3D <0x01c0e000 0x1c0>;
> -        #address-cells =3D <1>;
> -        #size-cells =3D <1>;
> -        ranges =3D <0x0 0x01c0e000 0x1000>;
> -
> -        clocks =3D <&gcc GCC_PCIE_PHY_AUX_CLK>,
> -                 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
> -                 <&gcc GCC_PCIE_WIGIG_CLKREF_EN>,
> -                 <&gcc GCC_PCIE1_PHY_REFGEN_CLK>;
> -        clock-names =3D "aux", "cfg_ahb", "ref", "refgen";
> -
> -        resets =3D <&gcc GCC_PCIE_1_PHY_BCR>;
> -        reset-names =3D "phy";
> +    #include <dt-bindings/clock/qcom,gcc-ipq6018.h>
> +    #include <dt-bindings/reset/qcom,gcc-ipq6018.h>
>
> -        vdda-phy-supply =3D <&vreg_l10c_0p88>;
> -        vdda-pll-supply =3D <&vreg_l6b_1p2>;
> +    phy@84000 {
> +        compatible =3D "qcom,ipq6018-qmp-pcie-phy";
> +        reg =3D <0x0 0x00084000 0x0 0x1000>;

Now a warning in linux-next:

/builds/robherring/linux-dt/Documentation/devicetree/bindings/phy/qcom,ipq8=
074-qmp-pcie-phy.example.dtb:
phy@84000: reg: [[0, 540672], [0, 4096]] is too long
        from schema $id:
http://devicetree.org/schemas/phy/qcom,ipq8074-qmp-pcie-phy.yaml#

The default cell sizes are 1.

Rob
