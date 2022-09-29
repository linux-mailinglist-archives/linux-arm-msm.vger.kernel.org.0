Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C4D85EFE45
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Sep 2022 22:03:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229585AbiI2UDt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Sep 2022 16:03:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbiI2UDs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Sep 2022 16:03:48 -0400
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 138901FCCAF;
        Thu, 29 Sep 2022 13:03:48 -0700 (PDT)
Received: by mail-oi1-f180.google.com with SMTP id m81so2731714oia.1;
        Thu, 29 Sep 2022 13:03:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=JirSIK3cnM81kdhd4iuCrHBGYWBMiXarjyhxxJXgyFE=;
        b=Vkjy1VOb+I6sEnAU5C/NOmrL7NEw4rvNJ8G3DMru5VKxbC+WSZwXqHJzzTLkyEke06
         Su0hOeS8yrN67jqyeQ2qHvvOoltXb7LjQofJNwvKefqd5tAAOgPq1VShRsa5LVp2O3sP
         nmdBEPRqb1P4Cqcle45cEdVdb//4GmqBQDYe66GYmMnHRmg83DarC0yiA8LPMH5B+djZ
         mEmHPAdEmx2DS2Xvpj1W+oo4GFIx1zEGI/m7rGhp8DxDCEAf1800qvOaJhspK4P0CCeu
         jV8LvP0cfqEsCFt21n8LW9yiiSxUte7Lx/i8Q8fmy4vmYPy0iJewYwUlgexuT6T4aZ0o
         073w==
X-Gm-Message-State: ACrzQf3XoOJEjnpQ2u0KeGhAEoW+U3bc/MQYhiOaH/4skb3BIY70piEp
        0AuCdC103VQ7JmzaItu4sA==
X-Google-Smtp-Source: AMsMyM6Rhfu+Dl+uHmwLPrEXwtu853A135Qmf3eg0wxxhT6qjZb3t8ym5JhBC1/s5igGju1hXiNT0w==
X-Received: by 2002:a05:6808:188f:b0:34f:e3da:49d0 with SMTP id bi15-20020a056808188f00b0034fe3da49d0mr7888497oib.162.1664481827358;
        Thu, 29 Sep 2022 13:03:47 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id y18-20020a4ae712000000b00475db5c28f9sm98050oou.10.2022.09.29.13.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 13:03:47 -0700 (PDT)
Received: (nullmailer pid 2649869 invoked by uid 1000);
        Thu, 29 Sep 2022 20:03:45 -0000
Date:   Thu, 29 Sep 2022 15:03:45 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
        devicetree@vger.kernel.org, freedreno@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>
Subject: Re: [PATCH v8 06/12] dt-bindings: display/msm: split dpu-sc7180 into
 DPU and MDSS parts
Message-ID: <166448182507.2649595.5777318884355818199.robh@kernel.org>
References: <20220924123611.225520-1-dmitry.baryshkov@linaro.org>
 <20220924123611.225520-7-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220924123611.225520-7-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 24 Sep 2022 15:36:05 +0300, Dmitry Baryshkov wrote:
> In order to make the schema more readable, split dpu-sc7180 into the DPU
> and MDSS parts, each one describing just a single device binding.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/dpu-sc7180.yaml      | 158 ------------------
>  .../bindings/display/msm/qcom,sc7180-dpu.yaml |  95 +++++++++++
>  .../display/msm/qcom,sc7180-mdss.yaml         | 125 ++++++++++++++
>  3 files changed, 220 insertions(+), 158 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
