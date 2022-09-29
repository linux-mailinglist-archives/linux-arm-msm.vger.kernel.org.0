Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E5C25EFE68
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Sep 2022 22:08:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229673AbiI2UId (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Sep 2022 16:08:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229558AbiI2UIc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Sep 2022 16:08:32 -0400
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 410A2111DF8;
        Thu, 29 Sep 2022 13:08:32 -0700 (PDT)
Received: by mail-oi1-f182.google.com with SMTP id l5so2720190oif.7;
        Thu, 29 Sep 2022 13:08:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=FeAK8O6bqdJ+JMd0u2xwGexvPcIhwzOT6tPtlE/f2/U=;
        b=XWaMifbbQycFOCYcUQHTHCotHCxx523LdLxyE9bOlaQt0FL2TSA1YjS3Iw8uCV1wQz
         SxHfta31Yzm193Xq18IwQgFzON5oCF5rf9806+TjvOBLeUnVH2De9UVXNRxvxowryE/m
         ZQi4+SYiae1SRP1yKHxcKVHk/NtLo4wV4h+OTrCqtRZetnxcgT/KwycCWZxSggADKDUS
         DJR0wQnJBpB1DIPVxLlzu8V0dL6BBiizXQBXbeTGdI6q/QrN7wMtAkKjbb5wLG2P8MbB
         PUzWo30JTARB+9fUTbdqSS5sNtZiA/rInKLoDKvoFaIonoYzCsN0KZIsYloapq00hq/P
         P+Wg==
X-Gm-Message-State: ACrzQf3BOWyCCRJomy5GUa7Dh28keSzo7e/t2pyrZplSijfQjnnhA0bq
        3/EEI4gBD3cGmpR555NtWg==
X-Google-Smtp-Source: AMsMyM4pqWlOVyn2dmYyt9u3BqiuXJDjqF7bZ/S33RxWu6sAhGTxYOlQiMwkEGNVxwXxxCi5jae26g==
X-Received: by 2002:a05:6808:ec8:b0:34d:9031:1043 with SMTP id q8-20020a0568080ec800b0034d90311043mr7674399oiv.212.1664482110186;
        Thu, 29 Sep 2022 13:08:30 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id j8-20020a4adf48000000b00475dc6c6f31sm85439oou.45.2022.09.29.13.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 13:08:29 -0700 (PDT)
Received: (nullmailer pid 2657443 invoked by uid 1000);
        Thu, 29 Sep 2022 20:08:28 -0000
Date:   Thu, 29 Sep 2022 15:08:28 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     devicetree@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Sean Paul <sean@poorly.run>, Daniel Vetter <daniel@ffwll.ch>,
        freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v8 11/12] dt-bindings: display/msm: add missing device
 nodes to mdss-* schemas
Message-ID: <166448210790.2657381.13173905656918205784.robh@kernel.org>
References: <20220924123611.225520-1-dmitry.baryshkov@linaro.org>
 <20220924123611.225520-12-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220924123611.225520-12-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 24 Sep 2022 15:36:10 +0300, Dmitry Baryshkov wrote:
> Add missing device nodes (DSI, PHYs, DP/eDP) to the existing MDSS
> schemas.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../display/msm/qcom,msm8998-mdss.yaml        | 153 +++++++++
>  .../display/msm/qcom,qcm2290-mdss.yaml        |  81 +++++
>  .../display/msm/qcom,sc7180-mdss.yaml         | 179 +++++++++++
>  .../display/msm/qcom,sc7280-mdss.yaml         | 292 ++++++++++++++++++
>  .../display/msm/qcom,sdm845-mdss.yaml         | 153 +++++++++
>  5 files changed, 858 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
