Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 870C25788FD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Jul 2022 19:57:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234425AbiGRR5C (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Jul 2022 13:57:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234130AbiGRR5B (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Jul 2022 13:57:01 -0400
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F07C02E6A4;
        Mon, 18 Jul 2022 10:57:00 -0700 (PDT)
Received: by mail-il1-f174.google.com with SMTP id v1so2779784ilg.4;
        Mon, 18 Jul 2022 10:57:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KadwfvKsdB6hFJzC3V746o2nQAVvLcHZ3Qu965v46xc=;
        b=TQpVkmdaizXY2Ynb9eBqIUXrBIcrUMF0/UgPHX3APyhomG7QX//BfpTEUc/W28TXPY
         FWEF7m12DizNiS0coIGuOTvG0Wm+pQHNLGJXeQeQmmG5lT2/fiw+1E4Av6hzw6+9QF8k
         VI4buyYIWb1ehYQ08/kr8h25XU5EkdBSaLu2ZM3rk8OGywMVIFm111iLxxqSd/yGibgm
         qlb+97JxqbAj3qJDKo/YHOXO4NkF1CK4OJX6ETWQbTMtPYgAXbQDqfqQaLC6ZHQ2qhzz
         W5UlZai7893jaTfePiId0PHnaAnibvr4WW9m5XIrbOX5brxSZ9wRNtjrxY7N7KsB0STK
         1Myg==
X-Gm-Message-State: AJIora9Or5t8jRZiKpi9KiAOCtM8AQSbKJOdLxOYlZtFQxQL1HKdd2rJ
        YGEN5nPVXCx1bMM1cRAPmg==
X-Google-Smtp-Source: AGRyM1tGJNgLKOPiRqIltb6HhK6tAFREhGMK29FLZF8aSdU4gCDfuv2MMNQ6cx+conSm8HF0qIvd9w==
X-Received: by 2002:a05:6e02:1645:b0:2da:e6be:3dfc with SMTP id v5-20020a056e02164500b002dae6be3dfcmr14893733ilu.116.1658167020199;
        Mon, 18 Jul 2022 10:57:00 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id p187-20020a0229c4000000b0034161ed8fadsm2811944jap.150.2022.07.18.10.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 10:56:59 -0700 (PDT)
Received: (nullmailer pid 3249739 invoked by uid 1000);
        Mon, 18 Jul 2022 17:56:58 -0000
Date:   Mon, 18 Jul 2022 11:56:58 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     dri-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
        Daniel Vetter <daniel@ffwll.ch>, devicetree@vger.kernel.org,
        David Airlie <airlied@linux.ie>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH v2 07/11] dt-bindings: display/msm: move qcom,sc7280-mdss
 schema to mdss.yaml
Message-ID: <20220718175658.GA3249683-robh@kernel.org>
References: <20220710090040.35193-1-dmitry.baryshkov@linaro.org>
 <20220710090040.35193-8-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220710090040.35193-8-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 10 Jul 2022 12:00:36 +0300, Dmitry Baryshkov wrote:
> Move schema for qcom,sc7280-mdss from dpu-sc7280.yaml to mdss.yaml so
> that the dpu file describes only the DPU schema.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/dpu-sc7280.yaml      | 148 +++++-------------
>  .../devicetree/bindings/display/msm/mdss.yaml |  19 +++
>  2 files changed, 57 insertions(+), 110 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
