Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C7365EFE56
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Sep 2022 22:05:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229665AbiI2UFP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Sep 2022 16:05:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229495AbiI2UFO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Sep 2022 16:05:14 -0400
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42959647FD;
        Thu, 29 Sep 2022 13:05:11 -0700 (PDT)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-131886d366cso3094634fac.10;
        Thu, 29 Sep 2022 13:05:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=MAZaPmhMH81ZFK3hzfo7ftSkq3A3dLtmuscZb9eXXXw=;
        b=YPAeS8Rg9SnQ+t3Hv6uUuB/U5JWR8HV2dBVMcjJvO6fDEouaCF6GQggKo2TFXeJt9w
         dHC5EJzTL11KVesDmsAgmWjllALS/PrT0ZPYhVqQGa2WC5y/putcJV8gq5HwpaztYAzW
         LVQGGDNUVfhx/huvbRSDvhIJZdyu738d1yW7jXA0anYUtOUzMH2KtXoGCbJrJ5BvJnZB
         ftgLKZ/GHJtj6hYMqD431YvHPOBZ+PIC39tmZZ/+SPhxAfjtboUW953Z3QsqrxRjCUeL
         6YAzKs9o8RHu2UbIB7813WAp7kVUSl6+KePq2sAs69DwsIXt1yPqmCguInS/LJrwUc6G
         7XYA==
X-Gm-Message-State: ACrzQf1s+PE90F+9NRUfaWI4T25h8iL4yL9tAdoPlrIDcLdYW4zKeK4o
        EXQagmr0y4WyUkwLI/VF2g==
X-Google-Smtp-Source: AMsMyM7ho8pAJLMKCwavOlMmQbKr829I1Gk6tRHVNP7Tgz9uYQFVSsWoz9ak8WTgYikUcKSIsHdRQg==
X-Received: by 2002:a05:6870:ecaa:b0:131:e816:b6a5 with SMTP id eo42-20020a056870ecaa00b00131e816b6a5mr811258oab.229.1664481910457;
        Thu, 29 Sep 2022 13:05:10 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id v4-20020a4a9744000000b00448a3ecdc9dsm93498ooi.22.2022.09.29.13.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 13:05:10 -0700 (PDT)
Received: (nullmailer pid 2653492 invoked by uid 1000);
        Thu, 29 Sep 2022 20:05:09 -0000
Date:   Thu, 29 Sep 2022 15:05:09 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Sean Paul <sean@poorly.run>, Rob Herring <robh+dt@kernel.org>,
        freedreno@lists.freedesktop.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>,
        David Airlie <airlied@linux.ie>
Subject: Re: [PATCH v8 09/12] dt-bindings: display/msm: split dpu-msm8998
 into DPU and MDSS parts
Message-ID: <166448190871.2653447.5106481921859395809.robh@kernel.org>
References: <20220924123611.225520-1-dmitry.baryshkov@linaro.org>
 <20220924123611.225520-10-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220924123611.225520-10-dmitry.baryshkov@linaro.org>
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

On Sat, 24 Sep 2022 15:36:08 +0300, Dmitry Baryshkov wrote:
> In order to make the schema more readable, split dpu-msm8998 into the DPU
> and MDSS parts, each one describing just a single device binding.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../display/msm/qcom,msm8998-dpu.yaml         | 95 +++++++++++++++++++
>  ...pu-msm8998.yaml => qcom,msm8998-mdss.yaml} | 47 ++-------
>  2 files changed, 101 insertions(+), 41 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,msm8998-dpu.yaml
>  rename Documentation/devicetree/bindings/display/msm/{dpu-msm8998.yaml => qcom,msm8998-mdss.yaml} (69%)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
