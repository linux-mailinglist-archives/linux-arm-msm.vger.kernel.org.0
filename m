Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1C4D4B1AA5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Feb 2022 01:44:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346492AbiBKAnw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Feb 2022 19:43:52 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:37400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244965AbiBKAnv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Feb 2022 19:43:51 -0500
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com [IPv6:2607:f8b0:4864:20::c2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 489F05F93
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Feb 2022 16:43:51 -0800 (PST)
Received: by mail-oo1-xc2b.google.com with SMTP id c7-20020a4ad207000000b002e7ab4185d2so8484541oos.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Feb 2022 16:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=peIv1RFotlCgbTarhFLi0yleT6U74UOU0UlSRN43yHs=;
        b=sgQGKQAWGA48N63ZFsHjuJMQge4WD3VzF3QcEOfMBQlnVQl93uLyEJcqouoqhe0VvZ
         lwJXuQg9so3eOc0kKP/zoRvBj3tOMygTO/P/HxCsL29Z3aN0QIdyCo9qARxBlpHhbFdt
         lqbSF/ofPqsTi5hnAiQZCH3SH0cGcX8p36Ca9RBE10MTdECRSHfiwvHGahYTJoQJwnOX
         r5+qzDgAz0uyODssAnktdXUj8hNBXdVBpdUtLiJDbmG78rYzsl5SFoGz3dRrZQcn2plH
         S6hpeFPDk/Vi51/d+M7bkbfs9W5UE86rIKkbNzFOVCooOCVcDmj6GWdvujmjm0qLJ6pz
         fVxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=peIv1RFotlCgbTarhFLi0yleT6U74UOU0UlSRN43yHs=;
        b=QwgDXMf8kLcwufTErdJRLmT+XcTYSv+KBgcUxR8mJo0zQ8DrwYk41jWwp/D1+yIBv2
         0nv0GwX7ExEfgScuFEH/oCQoBHy9Ps3rIj57yRlIj/b0/e6SDca4bSFb9/T8TqcMhfJy
         plBcQKIt5JKFDSO2FTjpw+kMAvcHlnflk4r3Jqf4CHuTLraVrpUFnYQmpT87ErP/9Wmk
         H2xIn9cKOwd6KdbWq5iY4EOKlaoEiLjMuNtWVFi7ROEdM3glmBAmUv5l6J6B4n/Q7Y7k
         7wXUHbCveF8zPmGDwGv9x3F1xl609Fo6sw9LA1m0vMtTkkhv3P95emq3KymuvPJxxHIL
         CTqA==
X-Gm-Message-State: AOAM530aRJSBx2BqqiAYBdSkV3GfuWXVRBkB7qwDtr0DN8N5iiYO6T2Y
        7IyCRJmuu21zRH5qFDemM2zn3w==
X-Google-Smtp-Source: ABdhPJye74c/DJOt1K0YAT2tbR4IdgDDxYX8XW4nFCogk+IMn+j8gnTxxW0JFF4y1ybzr4mm0UP2Rw==
X-Received: by 2002:a4a:8f14:: with SMTP id e20mr3673292ool.0.1644540230638;
        Thu, 10 Feb 2022 16:43:50 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id x17sm8572223oop.1.2022.02.10.16.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Feb 2022 16:43:50 -0800 (PST)
Date:   Thu, 10 Feb 2022 18:43:48 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Satya Priya <quic_c_skakit@quicinc.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Das Srinagesh <gurus@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, swboyd@chromium.org,
        quic_collinsd@quicinc.com, quic_subbaram@quicinc.com,
        quic_jprakash@quicinc.com
Subject: Re: [PATCH V5 1/6] dt-bindings: regulator: Add pm8008 regulator
 bindings
Message-ID: <YgWxRDeo7vuTBeAo@builder.lan>
References: <1644331940-18986-1-git-send-email-quic_c_skakit@quicinc.com>
 <1644331940-18986-2-git-send-email-quic_c_skakit@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1644331940-18986-2-git-send-email-quic_c_skakit@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 08 Feb 08:52 CST 2022, Satya Priya wrote:

> Add bindings for pm8008 pmic regulators.
> 
> Signed-off-by: Satya Priya <quic_c_skakit@quicinc.com>
> ---
> Changes in V2:
>  - Moved this patch before "mfd: pm8008: Add pm8008 regulator node" to
>    resolve dtschema errors. Removed regulator-min-microvolt and 
>    regulator-max-microvolt properties.
> 
> Changes in V3:
>  - As per Rob's comments added standard unit suffix for mindropout property,
>    added blank lines where required and added description for reg property.
> 
> Changes in V4:
>  - Changed compatible string to "com,pm8008-regulators"
>  - Moved "regulator-min-dropout-voltage-microvolt" to regulator.yaml as
>    separate patch.
> 
> Changes in V5:
>  - Removed the separate compatible for pm8008 regulator driver.
>  - Moved the supply nodes to chip level.
>  - Removed min-dropout property.
> 
>  .../bindings/regulator/qcom,pm8008-regulator.yaml  | 31 ++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/qcom,pm8008-regulator.yaml
> 
> diff --git a/Documentation/devicetree/bindings/regulator/qcom,pm8008-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,pm8008-regulator.yaml
> new file mode 100644
> index 0000000..0098845
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/qcom,pm8008-regulator.yaml
> @@ -0,0 +1,31 @@
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
> +patternProperties:
> +  "^LDO[1-7]$":

Please make this lower case, to match all other regulator bindings.

> +    type: object
> +    $ref: "regulator.yaml#"
> +    description: PM8008 regulator peripherals of PM8008 regulator device
> +
> +    properties:
> +      regulator-name: true
> +
> +    required:
> +      - regulator-name

Why is regulator-name a (and the only) required property?

Regards,
Bjorn

> +
> +    unevaluatedProperties: false
> +
> +additionalProperties: false
> +...
> -- 
> 2.7.4
> 
