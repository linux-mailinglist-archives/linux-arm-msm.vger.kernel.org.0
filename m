Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB13A672393
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 17:40:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229723AbjARQkK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 11:40:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230475AbjARQjo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 11:39:44 -0500
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C0834393B;
        Wed, 18 Jan 2023 08:39:29 -0800 (PST)
Received: by mail-oi1-f177.google.com with SMTP id r9so18312066oie.13;
        Wed, 18 Jan 2023 08:39:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IEVtWKwmkzW9LdqES8Bi2ZC05uDEdMU5/2KSOeqSZP4=;
        b=WKXtpJ+EgWfCzG/qEmVcDvDFUGzqtGMLQlmcMhI5ToB1WNAutMO9Ip11HufDshVE2w
         /vBn6gGNTO6hOdLxiI7R9+IIyVFTM/Hp22sDkSzyyPZHQr2mncUy4sAsRYC6UbF6zgjH
         LTyodV8Ra4BTWV5p02J9yH5Gv7C3JKl34N2br9d/0RbfgVtX0/p9yeLoO1h4L5qdacZR
         yZSZhXZEqIDCnxxkuQPL3CSYSoGlMB5TzQ/LVk9l5gThQbgaOtrIutUVyn6zGcRBq5r2
         kAbN+KQtUXfVxh10u/HUntwX2rv7E5WzgRlpclwBUTAy2zLNz2XkZTEfZFQbF5rOzYSJ
         PaGw==
X-Gm-Message-State: AFqh2kp6SRPbiMAmV3MlV3RCnZk1t0ZdSps1ZCvV5Opp7HDlNjzGqw6K
        bdx0GWVYtvuId/3tGy5mLg==
X-Google-Smtp-Source: AMrXdXsZeF0y1QALz6H8wcZKbTQwL6oosAD2gIFs26uCmDUZqToflGqn1LL2oxzHS8/HGpGU4jFK9A==
X-Received: by 2002:a05:6808:f0e:b0:364:ace4:b499 with SMTP id m14-20020a0568080f0e00b00364ace4b499mr3450753oiw.56.1674059968370;
        Wed, 18 Jan 2023 08:39:28 -0800 (PST)
Received: from robh_at_kernel.org ([4.31.143.193])
        by smtp.gmail.com with ESMTPSA id e13-20020a056808148d00b0036a97066646sm2296768oiw.8.2023.01.18.08.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 08:39:28 -0800 (PST)
Received: (nullmailer pid 135326 invoked by uid 1000);
        Wed, 18 Jan 2023 16:39:27 -0000
Date:   Wed, 18 Jan 2023 10:39:27 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        David Airlie <airlied@gmail.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH 1/4] dt-bindings: display/msm: dsi-controller-main:
 remove #address/#size-cells
Message-ID: <167405996678.135293.4200911334846022588.robh@kernel.org>
References: <20230118032432.1716616-1-dmitry.baryshkov@linaro.org>
 <20230118032432.1716616-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230118032432.1716616-2-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Wed, 18 Jan 2023 05:24:29 +0200, Dmitry Baryshkov wrote:
> Stop mentioning #address-cells/#size-cells which are defined in
> display/dsi-controller.yaml. Use unevaluatedProperties instead of
> additionalProperties to allow skipping properties defined in other
> schema files.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/dsi-controller-main.yaml           | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
