Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FB9D668650
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jan 2023 23:04:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239644AbjALWEo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Jan 2023 17:04:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230178AbjALWEN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Jan 2023 17:04:13 -0500
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4E791A042;
        Thu, 12 Jan 2023 13:53:09 -0800 (PST)
Received: by mail-oo1-f51.google.com with SMTP id d2-20020a4ab202000000b004ae3035538bso5137781ooo.12;
        Thu, 12 Jan 2023 13:53:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pocd7oPe80m3B5bK7WHq/GJVxDYkLdBzBVnfgMx2yo8=;
        b=gz27R0c3ydLjM7bVcikYrCRLKLkG6nRsFJdeJm5e1Cu5WUBoC5PQEVdx9JiGlfOf5t
         puo/g01af+qbSI7xwoab+cF8XK1UH15KsEn1U2GpjrwV1S5BnrD7Y7VWH9DL0VOhppfS
         hCmniPZMeeI970fzpg5zaeKOlzPH5CTE0j6gtcyAJkM8eegIhE2goiTRXRlJfIYxAQ6z
         4wKTO9WGDmFd3QqroooBGDpyHpXqdEYsQ6z0SKZYPzb8Co3nHGlhkMoZLyjUmn14iKF0
         X0aB6QL2dAoXcJG8Mv3CIeLUH21MeCUjJNd/x8GRNdn8KHNM+KmxQwEtA53dIF6T0ZLS
         2JEQ==
X-Gm-Message-State: AFqh2koe8Jr+ssB5cmbBDoU4JjgZmgFWnD0y5YD4SaT26VFIKVyHPDzl
        xdo2DMz1TtBPaiAoN29fvw==
X-Google-Smtp-Source: AMrXdXuUxmFMe5f8pEIH/6rzb8K6cObPqDQgkF6n1oTIbC3iMUMSim9U1gouK8fOzAeh7+xNp7/TDQ==
X-Received: by 2002:a4a:8c32:0:b0:4f2:6891:7f76 with SMTP id u47-20020a4a8c32000000b004f268917f76mr1861329ooj.4.1673560327099;
        Thu, 12 Jan 2023 13:52:07 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id d144-20020a4a5296000000b004f269f9b8f3sm1349426oob.25.2023.01.12.13.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jan 2023 13:52:03 -0800 (PST)
Received: (nullmailer pid 283232 invoked by uid 1000);
        Thu, 12 Jan 2023 21:52:02 -0000
Date:   Thu, 12 Jan 2023 15:52:02 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH v5 2/4] dt-bindings: display/msm: add SoC-specific
 compats to qcom,mdp5.yaml
Message-ID: <20230112215202.GA281635-robh@kernel.org>
References: <20230109050152.316606-1-dmitry.baryshkov@linaro.org>
 <20230109050152.316606-3-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230109050152.316606-3-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jan 09, 2023 at 07:01:50AM +0200, Dmitry Baryshkov wrote:
> Add platform-specific compatible entries to the qcom,mdp5.yaml to allow
> distinguishing between various platforms. For msm8998 list
> qcom,msm8998-dpu rather than -mdp5 to allow this binding to be handled
> by either of the drivers.

8998 is where?

> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/qcom,mdp5.yaml         | 17 ++++++++++++++++-
>  .../bindings/display/msm/qcom,mdss.yaml         |  6 +++++-
>  2 files changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
> index cbcbe8b47e9b..681d6ac48d33 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
> @@ -16,7 +16,22 @@ maintainers:
>  
>  properties:
>    compatible:
> -    const: qcom,mdp5
> +    oneOf:
> +      - const: qcom,mdp5
> +        deprecated: true
> +      - items:
> +          - enum:
> +              - qcom,apq8084-mdp5
> +              - qcom,msm8916-mdp5
> +              - qcom,msm8917-mdp5
> +              - qcom,msm8953-mdp5
> +              - qcom,msm8974-mdp5
> +              - qcom,msm8976-mdp5
> +              - qcom,msm8994-mdp5
> +              - qcom,msm8996-mdp5
> +              - qcom,sdm630-mdp5
> +              - qcom,sdm660-mdp5
> +          - const: qcom,mdp5
>  
>    reg:
>      maxItems: 1
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
> index 7479cd96fdec..7a81a10c0a9b 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
> @@ -88,7 +88,11 @@ patternProperties:
>      type: object
>      properties:
>        compatible:
> -        const: qcom,mdp5
> +        oneOf:
> +          - const: qcom,mdp5
> +          - items:
> +              - {}
> +              - const: qcom,mdp5
>  
>    "^dsi@[1-9a-f][0-9a-f]*$":
>      type: object
> -- 
> 2.39.0
> 
