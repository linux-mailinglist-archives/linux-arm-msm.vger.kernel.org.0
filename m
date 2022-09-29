Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DB525EFE4C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Sep 2022 22:04:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229671AbiI2UE0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Sep 2022 16:04:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229669AbiI2UEZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Sep 2022 16:04:25 -0400
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 345EF1FCCBE;
        Thu, 29 Sep 2022 13:04:23 -0700 (PDT)
Received: by mail-oi1-f180.google.com with SMTP id g130so2678937oia.13;
        Thu, 29 Sep 2022 13:04:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=nZeIRLfu17llTKpdbsCCjUY7kgNnNST8HF+Cjh84iZc=;
        b=65CR2G8eVKMuAKnT9asedakrlRHsq6IbOazHh6uacz1oshQ63G5A3nU13a+LQ+hGx+
         omiX/pvxYU4B08fZ9jw/UiPqHHNmEZEAmCLLtXN1+wNpFdl/syhCjno72zBnjfIdv/LX
         CFyyk4B2uah85tDZOTuQp/v7suQFm+AbY+RZ/9bSub/iMbKO1pMuC6GXKIocGJZxsoUw
         y+tvH7Fy8D/7p22nQcrpsCIx0hlMUUmwn7rC9I5JzCAVIJWa7zpTfqQj5L/kZe8p59oy
         LDYzZ/FBx3OsqExhrRkgAU7zS90lZmi1CtIbHp52HJjFG9Vd+FtdRyECcRA12BlrovJY
         S2Iw==
X-Gm-Message-State: ACrzQf2zkX81GW1mg6wQWvYUkhbzuNpyJFYMzZpbuXa5Cd7+7RcldTio
        opNnNbG8bPGbGfzWQAmotA==
X-Google-Smtp-Source: AMsMyM4zEXYymY6EliE8ri9ZHKGmgtQjgS/Yc/qDM/kYQrvqd/7NUYMcmv+/RXt1Juqb5bO2Uc1GlQ==
X-Received: by 2002:a05:6808:198e:b0:34f:f114:8921 with SMTP id bj14-20020a056808198e00b0034ff1148921mr2386076oib.1.1664481862255;
        Thu, 29 Sep 2022 13:04:22 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id cy22-20020a056870b69600b0012c4bff351asm157221oab.43.2022.09.29.13.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 13:04:21 -0700 (PDT)
Received: (nullmailer pid 2652359 invoked by uid 1000);
        Thu, 29 Sep 2022 20:04:21 -0000
Date:   Thu, 29 Sep 2022 15:04:21 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
        Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        David Airlie <airlied@linux.ie>,
        freedreno@lists.freedesktop.org,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v8 07/12] dt-bindings: display/msm: split dpu-sc7280 into
 DPU and MDSS parts
Message-ID: <166448185987.2652299.15874860633759045019.robh@kernel.org>
References: <20220924123611.225520-1-dmitry.baryshkov@linaro.org>
 <20220924123611.225520-8-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220924123611.225520-8-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 24 Sep 2022 15:36:06 +0300, Dmitry Baryshkov wrote:
> In order to make the schema more readable, split dpu-sc7280 into the DPU
> and MDSS parts, each one describing just a single device binding.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/dpu-sc7280.yaml      | 162 ------------------
>  .../bindings/display/msm/qcom,sc7280-dpu.yaml |  98 +++++++++++
>  .../display/msm/qcom,sc7280-mdss.yaml         | 130 ++++++++++++++
>  3 files changed, 228 insertions(+), 162 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
