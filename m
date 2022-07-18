Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D20BD57890C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Jul 2022 19:58:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234621AbiGRR6X (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Jul 2022 13:58:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234714AbiGRR6U (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Jul 2022 13:58:20 -0400
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C78532E9E9;
        Mon, 18 Jul 2022 10:58:17 -0700 (PDT)
Received: by mail-io1-f47.google.com with SMTP id x64so1544329iof.1;
        Mon, 18 Jul 2022 10:58:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9/D5m5qV27tEBYYCCg0RQaXxh+5fqETc+p8ErLupmSk=;
        b=NoEGy2p7SYzBkgjsV6pPcOw9sogWEQc8bBWU5m+nlEqX6L4/TNWeaV4HWDV8uFzu9o
         ln1bmr+bXn5jsVzTym/DrdHkApzrSml3VCpYmo+taJL4xm5kmkiyfWsp1VOSOmWdqqsw
         ka1En036U+cysue3gjHvBrDOstkXMrtp7noqlqJ5Cx4AIyjtzR97AY2wQC7u9hDoxtjm
         sRpT+XPyT6WF1S0jqoaSkHj6S3oU8IGC7hYFFe2tdnv8L3bPtHlFSMjesg+14RyvAytP
         VEdz5RLdOMkU/SkICUEmoMiO5MZEdFrIPIFYdhDygzy3ZMagF56A6/M2SpcthjE9AriV
         QGZg==
X-Gm-Message-State: AJIora+H0/w1QIFRS3MWxNZIk6a2Q5H25w976IuLLLuFrp4WurCXKdZs
        mvtnJiM8X6H1KDJPtEZlABuoMd4J7w==
X-Google-Smtp-Source: AGRyM1t8UAFZ8KvRZgdmKJs3inUJsWWFU2EOvJWTvEAzbRMCp3mflj/YEPUf5RMcFwd/OoeWWKYJnw==
X-Received: by 2002:a05:6638:4513:b0:33f:680f:255 with SMTP id bs19-20020a056638451300b0033f680f0255mr15286746jab.232.1658167096857;
        Mon, 18 Jul 2022 10:58:16 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id f67-20020a0284c9000000b0033f22c2e5b3sm5750567jai.98.2022.07.18.10.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 10:58:16 -0700 (PDT)
Received: (nullmailer pid 3252001 invoked by uid 1000);
        Mon, 18 Jul 2022 17:58:15 -0000
Date:   Mon, 18 Jul 2022 11:58:15 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
        Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@linux.ie>,
        freedreno@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>
Subject: Re: [PATCH v2 09/11] dt-bindings: display/msm: move
 qcom,msm8998-mdss schema to mdss.yaml
Message-ID: <20220718175815.GA3251937-robh@kernel.org>
References: <20220710090040.35193-1-dmitry.baryshkov@linaro.org>
 <20220710090040.35193-10-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220710090040.35193-10-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 10 Jul 2022 12:00:38 +0300, Dmitry Baryshkov wrote:
> Move schema for qcom,msm8998-mdss from dpu-msm8998.yaml to mdss.yaml so
> that the dpu file describes only the DPU schema.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/dpu-msm8998.yaml     | 142 +++++-------------
>  .../devicetree/bindings/display/msm/mdss.yaml |  24 +++
>  2 files changed, 64 insertions(+), 102 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
