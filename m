Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E4864B7D3C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Feb 2022 03:21:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343528AbiBPCE5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Feb 2022 21:04:57 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:34360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233356AbiBPCE4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Feb 2022 21:04:56 -0500
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2937DB876
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 18:04:44 -0800 (PST)
Received: by mail-ot1-x32b.google.com with SMTP id s6-20020a0568301e0600b0059ea5472c98so538059otr.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 18:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=/tBhDX/ITHqt+Xaf4QurjW8MT9jM8yc7lXHoiZOp3Cg=;
        b=atjUPY4PqUpqM6boTFlmuPpu2NqNp4C9u3GmxDDa11LaEJYX2FHloxmBBfGPVKLcY7
         bEoSxe/IISXfe25C/yvH7KSU6klOchVHmOfYuUxraJYv+hL6RXZVCapBEDNsHZgFd7bm
         AEwaPzeoXka7K++a0++nP7oL9kpy8r2Q1cENc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=/tBhDX/ITHqt+Xaf4QurjW8MT9jM8yc7lXHoiZOp3Cg=;
        b=Sy5xunHPTQFGxoW+2OvXtpQkis+O1VPttd7q1BXZDxkULMtFGBnI+vBsvWbasde+qq
         OWN8+cKqMkOqvmz1QDUsH0vUjJGCc2tsSOCmQ52k7T75sS//HkNt2gP/45m+nDf1IdRE
         QrBzCtyFb4Lqhg5aA1Ssw/dOQriNyYd9Dd7qx3fvLZgK04wngIK4HdVhl3Vd/Q4VB1Iv
         Ra1O8/R5AVb59MeBBF+Rfy0Mh1oXl/chgnHoOrs9KfEY2T05UDM0xhosSh0idilzdqxT
         4AsqAFjz1jBGVp+CFu+4vgnrp1be8+Uvytm/46mTqK1S52Am6LiMRMztHvH+ZtlbTeGz
         GqNw==
X-Gm-Message-State: AOAM532vZyeUJ8dsSQm6Uot3ZQLUD8udWEiw5w4B3vUp/jS8e/6vVExw
        g2AicVioh1i2OSK7V2E85WuLt9EZ3DEwIfxuQlgNrQ==
X-Google-Smtp-Source: ABdhPJx8NyXO2S+5pnQ4E+yS4HiS4D2K1ICpkfdi20xTaewG2/NvlGwgkLI68JBEZ3CJEex1hQ8pG0O2t3F13u0TYWY=
X-Received: by 2002:a9d:22e9:0:b0:5ac:1754:342c with SMTP id
 y96-20020a9d22e9000000b005ac1754342cmr151451ota.159.1644977082732; Tue, 15
 Feb 2022 18:04:42 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 15 Feb 2022 18:04:42 -0800
MIME-Version: 1.0
In-Reply-To: <1644915231-7308-3-git-send-email-quic_c_skakit@quicinc.com>
References: <1644915231-7308-1-git-send-email-quic_c_skakit@quicinc.com> <1644915231-7308-3-git-send-email-quic_c_skakit@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 15 Feb 2022 18:04:42 -0800
Message-ID: <CAE-0n53CLquafH2fOWa2rX1H=q+CvEU2qNwL3TAY+jWkk8q8sQ@mail.gmail.com>
Subject: Re: [PATCH V6 2/6] dt-bindings: mfd: pm8008: Add regulators node
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
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Satya Priya (2022-02-15 00:53:47)
> Add regulators node and their supply nodes. Add separate compatible
> "qcom,pm8008-regulators" to differentiate between pm8008 infra
> and pm8008 regulators mfd devices.
>
> Signed-off-by: Satya Priya <quic_c_skakit@quicinc.com>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Please remove my tag.

> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> Changes in V2:
>  - As per Rob's comments changed "pm8008[a-z]?-regulator" to
>    "^pm8008[a-z]?-regulators".
>
> Changes in V3:
>  - Fixed bot errors.
>  - As per stephen's comments, changed "^pm8008[a-z]?-regulators$" to
>    "regulators".
>
> Changes in V4:
>  - Changed compatible string to "qcom,pm8008-regulators"
>
> Changes in V5:
>  - Remove compatible for regulators node.
>  - Move supply nodes of the regulators to chip level.
>
> Changes in V6:
>  - No changes.
>
>  .../devicetree/bindings/mfd/qcom,pm8008.yaml       | 49 +++++++++++++++++++---
>  1 file changed, 44 insertions(+), 5 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
> index ec3138c..1ec43f7 100644
> --- a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
> +++ b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
> @@ -44,6 +46,25 @@ properties:
>    "#size-cells":
>      const: 0
>
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
> +  regulators:
> +    type: object
> +    $ref: "../regulator/qcom,pm8008-regulator.yaml#"
> +
>  patternProperties:
>    "^gpio@[0-9a-f]+$":
>      type: object
> @@ -88,10 +109,8 @@ patternProperties:
>  required:
>    - compatible
>    - reg
> -  - interrupts
>    - "#address-cells"
>    - "#size-cells"
> -  - "#interrupt-cells"

Shouldn't interrupts and interrupt-cells still be required for
qcom,pm8008? This binding seems like it is for two different nodes.

>
>  additionalProperties: false
>
> @@ -102,7 +121,7 @@ examples:
>      qupv3_se13_i2c {
>        #address-cells = <1>;
>        #size-cells = <0>;
> -      pm8008i@8 {
> +      pm8008_infra: pm8008@8 {
>          compatible = "qcom,pm8008";
>          reg = <0x8>;
>          #address-cells = <1>;
> @@ -123,6 +142,26 @@ examples:
>            #interrupt-cells = <2>;
>          };
>        };
> -    };
>
> +      pm8008_regulators: pm8008@9 {
> +        compatible = "qcom,pm8008";

Isn't this supposed to be "qcom,pm8008-regulators"?

> +        reg = <0x9>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        vdd_l1_l2-supply = <&vreg_s8b_1p2>;
> +        vdd_l3_l4-supply = <&vreg_s1b_1p8>;
> +        vdd_l5-supply = <&vreg_bob>;
> +        vdd_l6-supply = <&vreg_bob>;
> +        vdd_l7-supply = <&vreg_bob>;
> +
> +        regulators {

I still don't get the need for this extra container. Please remove it.

> +          pm8008_l1: ldo1 {
> +            regulator-name = "pm8008_l1";
> +            regulator-min-microvolt = <950000>;
> +            regulator-max-microvolt = <1300000>;
> +          };
> +        };
> +      };
> +    };
