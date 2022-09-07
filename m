Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 391EE5B0D74
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Sep 2022 21:51:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229540AbiIGTvU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Sep 2022 15:51:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbiIGTvT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Sep 2022 15:51:19 -0400
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6D3D1116C;
        Wed,  7 Sep 2022 12:51:17 -0700 (PDT)
Received: by mail-ot1-f47.google.com with SMTP id m21-20020a9d6ad5000000b00638df677850so10977500otq.5;
        Wed, 07 Sep 2022 12:51:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=2tHJcPRMA/L2h1yHgmybl9yCk/t2j3caUqHniiiqs5g=;
        b=7QLHT4ovc+bkLkrMJB08j19jZ9XgXaYJHaLZNxKoZONJLTk/+jZgyGoS3gH9j8Uki1
         D/Wk7F0gQC9+unDnkCspqqAKB87mo92I7jDi58XUSnCsXndL9kyvKqnEjXfLWrJ59jOi
         q+TbHo0wm/CevRShMY/3lTf4wgzcFR8KCnwjk8BztetdCNL9ADbE7H4rO29tdEKrIDQW
         /QphP/QtYjgo72s1A6FVHNkkv/jXhdDUBySGrA6OQQZvGuC5VOiC8M+yDI+FN9LYzmj/
         MZmQw04I30VHek9Avu588DhpLgqMj/TyTd9S4ufInpz8MB0TFJm9meAiJzlkXha++svp
         yF3g==
X-Gm-Message-State: ACgBeo1OFluUzau97jUFHjtaHrqqxeP4OkGaalaibZvr8Pxqpf6HxLes
        9jRLNBvBlfQWiumG3H8Inw==
X-Google-Smtp-Source: AA6agR4B3Klfz1/Zi+H/2ENUSQEKObGDWqwgJE6mFKnC0VsBTUhSNMz2KGmwSJU3J2PLUUUTVL2hLA==
X-Received: by 2002:a9d:4814:0:b0:639:2e6c:d86e with SMTP id c20-20020a9d4814000000b006392e6cd86emr2184065otf.320.1662580277060;
        Wed, 07 Sep 2022 12:51:17 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id p66-20020aca4245000000b003451c927e0dsm6801928oia.38.2022.09.07.12.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 12:51:16 -0700 (PDT)
Received: (nullmailer pid 98144 invoked by uid 1000);
        Wed, 07 Sep 2022 19:51:15 -0000
Date:   Wed, 7 Sep 2022 14:51:15 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Loic Poulain <loic.poulain@linaro.org>
Subject: Re: [PATCH v6 03/12] dt-bindings: display/msm: add interconnects
 property to qcom,mdss-smd845
Message-ID: <20220907195115.GA96580-robh@kernel.org>
References: <20220901102312.2005553-1-dmitry.baryshkov@linaro.org>
 <20220901102312.2005553-4-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220901102312.2005553-4-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Sep 01, 2022 at 01:23:03PM +0300, Dmitry Baryshkov wrote:
> Add interconnects required for the SDM845 MDSS device tree node. This
> change was made in the commit c8c61c09e38b ("arm64: dts: qcom: sdm845:
> Add interconnects property for display"), but was not reflected in the
> schema.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/dpu-sdm845.yaml    | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
> index 3cb2ae336996..ff19555d04e2 100644
> --- a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
> @@ -57,6 +57,16 @@ properties:
>  
>    ranges: true
>  
> +  interconnects:
> +    items:
> +      - description: Interconnect path specifying the port ids for data bus
> +      - description: Interconnect path specifying the port ids for data bus

The same description twice is not useful.

> +
> +  interconnect-names:
> +    items:
> +      - const: mdp0-mem
> +      - const: mdp1-mem
> +
>    resets:
>      items:
>        - description: MDSS_CORE reset
> -- 
> 2.35.1
> 
> 
