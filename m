Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 087CE5788F6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Jul 2022 19:56:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234387AbiGRR4J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Jul 2022 13:56:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233435AbiGRR4I (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Jul 2022 13:56:08 -0400
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A07327B31;
        Mon, 18 Jul 2022 10:56:07 -0700 (PDT)
Received: by mail-il1-f170.google.com with SMTP id o2so4982134ill.6;
        Mon, 18 Jul 2022 10:56:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=I/MwKhACUJLQ65w/8jKbJC5ad8kKFA2yw8hzpGalkIY=;
        b=yff6hEhbFvwnF2RHv78RELxqSXj3qnILOacdyvO9k118Qve5GJCCnnfNIN6HbJ2b4T
         Xr0TZKz2xhffLnNPEQh7poabhp/HADs2MFbJ8G174kb+rb4iDndSdqWzqfFFYVlGHeTx
         Xuu4MQyDJiLwzzD6Tn9+wKu1Iq7NGinexpKT/cqb2URMMx/9lwTdnmOkOuuyT8jU0Xqb
         UREbCu1iRGFQAU9lvOpvcxP3ZOMX8UNLb72xOQb8MOcMI8newXCocmgOSccHdzdBJuuG
         MDmNVN+m3hb3s5y18FgyU9yneDIWyuF2erh6JqsixW3iIJTZPXnL4jGckE7fPIi+AHZw
         gTow==
X-Gm-Message-State: AJIora9IzJGqmXtmzAfRAS1MAp6yx/2lFpLJUHlqbjsGTe0HgoDlcW+p
        /FxcE7Aze+8XkEYD37zvsckPiPLHqg==
X-Google-Smtp-Source: AGRyM1tJ+f0CvbcrUje9rTcnR7svY3bdB2y2kaIvrbLzEehGWhODRuZe/y+ZBNT7p6Y19UZcaPyAUA==
X-Received: by 2002:a92:b706:0:b0:2dc:c7e3:63fb with SMTP id k6-20020a92b706000000b002dcc7e363fbmr7913615ili.170.1658166966737;
        Mon, 18 Jul 2022 10:56:06 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id q204-20020a6b2ad5000000b0067b876ed5e2sm6254416ioq.23.2022.07.18.10.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 10:56:06 -0700 (PDT)
Received: (nullmailer pid 3248238 invoked by uid 1000);
        Mon, 18 Jul 2022 17:56:04 -0000
Date:   Mon, 18 Jul 2022 11:56:04 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v2 06/11] dt-bindings: display/msm: move qcom,sc7180-mdss
 schema to mdss.yaml
Message-ID: <20220718175604.GA3248180-robh@kernel.org>
References: <20220710090040.35193-1-dmitry.baryshkov@linaro.org>
 <20220710090040.35193-7-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220710090040.35193-7-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 10 Jul 2022 12:00:35 +0300, Dmitry Baryshkov wrote:
> Move schema for qcom,sc7180-mdss from dpu-sc7180.yaml to mdss.yaml so
> that the dpu file describes only the DPU schema.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/dpu-sc7180.yaml      | 149 +++++-------------
>  .../devicetree/bindings/display/msm/mdss.yaml |  45 +++++-
>  2 files changed, 80 insertions(+), 114 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
