Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06C3C66E640
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jan 2023 19:42:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231249AbjAQSlt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 13:41:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234277AbjAQShy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 13:37:54 -0500
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A53C38022;
        Tue, 17 Jan 2023 10:09:08 -0800 (PST)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-15b9c93848dso24557823fac.1;
        Tue, 17 Jan 2023 10:09:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gqw/5tUVUFWZUJ3ijOC+BanMFqqlxId5Bt34OdwKlMQ=;
        b=0vPEwPLbx3JgJBk11nNBP5e+88kJVgxzHKHWcTrZsGoasVGD+RBbUqa89tEW6xkTsB
         OhnvrnN24Fz/qayxQ3lve8wo3UpbOG23luig6dZYmGjOidxHWyeruNxx2cKgtfLcwBXo
         CtMPmYny5jz7d8/ijLLbd8+9k5BhLEg1foHEfwWBw7HCDE4hzoK1uUy83+iSlnj2kK90
         rSFmsVg8AjyvWSTR3vkMv7wnFWDSofFk+qxrtQ+WMBIyxbJIpCxpWNSVRld9zRv+oLhL
         D8Cg7zdSK63c1C9djpDhALRXCCRdLWE+Jj+qGKeES/Mtts1mkZ+hNJpQaSfVLfLGEFcu
         PzIQ==
X-Gm-Message-State: AFqh2kpPVUb3oK1HMGrEgtHO8P2HkpSqnShdrrf0sspNC6Z8LF07sh6c
        /2u2EA51XyTY7rvFBpN2Pg==
X-Google-Smtp-Source: AMrXdXuqGyaQl2dDRHMGbKH9ekCkyJwxw4SbKZJTVVpjrracMtDL8+Zi/hTfaSz0T6DO+ODf/DkwVg==
X-Received: by 2002:a05:6870:2f02:b0:155:a38f:70d1 with SMTP id qj2-20020a0568702f0200b00155a38f70d1mr2118087oab.18.1673978947062;
        Tue, 17 Jan 2023 10:09:07 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id q18-20020a056870329200b00155ffbdbaffsm16922521oac.18.2023.01.17.10.09.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 10:09:06 -0800 (PST)
Received: (nullmailer pid 3352727 invoked by uid 1000);
        Tue, 17 Jan 2023 18:09:05 -0000
Date:   Tue, 17 Jan 2023 12:09:05 -0600
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
Subject: Re: [PATCH v6 03/11] dt-bindings: display/msm: add core clock to the
 mdss bindings
Message-ID: <20230117180905.GA3329090-robh@kernel.org>
References: <20230113083720.39224-1-dmitry.baryshkov@linaro.org>
 <20230113083720.39224-4-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230113083720.39224-4-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jan 13, 2023 at 10:37:12AM +0200, Dmitry Baryshkov wrote:
> Add (optional) core clock to the mdss bindings to let the MDSS driver
> access harware registers before MDP driver probes.

typo

> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/qcom,mdss.yaml       | 34 ++++++++++++++-----
>  1 file changed, 26 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
> index dcde34ffc8d0..6948ae3ac7bc 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
> @@ -45,17 +45,11 @@ properties:
>  
>    clocks:
>      minItems: 1
> -    items:
> -      - description: Display abh clock
> -      - description: Display axi clock
> -      - description: Display vsync clock
> +    maxItems: 4
>  
>    clock-names:
>      minItems: 1
> -    items:
> -      - const: iface
> -      - const: bus
> -      - const: vsync
> +    maxItems: 4
>  
>    "#address-cells":
>      const: 1
> @@ -69,6 +63,30 @@ properties:
>      items:
>        - description: MDSS_CORE reset
>  
> +oneOf:

This is not based on compatible? If not rather than at the top level, 
you can do 'oneOf' under 'clocks' and 'clock-names'.

> +  - properties:
> +      clocks:
> +        minItems: 3
> +        maxItems: 4
> +
> +      clock-names:
> +        minItems: 3
> +        items:
> +          - const: iface
> +          - const: bus
> +          - const: vsync
> +          - const: core
> +  - properties:
> +      clocks:
> +        minItems: 1
> +        maxItems: 2
> +
> +      clock-names:
> +        minItems: 1
> +        items:
> +          - const: iface
> +          - const: core
> +
>  required:
>    - compatible
>    - reg
> -- 
> 2.39.0
> 
