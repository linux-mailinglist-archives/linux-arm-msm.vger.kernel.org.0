Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 245DF66E66B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jan 2023 19:50:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233984AbjAQSuY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 13:50:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235179AbjAQSkC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 13:40:02 -0500
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A0FF2A165;
        Tue, 17 Jan 2023 10:11:55 -0800 (PST)
Received: by mail-oi1-f181.google.com with SMTP id p185so5514329oif.2;
        Tue, 17 Jan 2023 10:11:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i9bR2toKRsd+a4vnzgdTNirWsngBZI9w5cbicVD+Etg=;
        b=Aa1A+qOBO6kbwXxBRJwPD7E6Wbwl01zOvEpkGq6S+cjUcAVgk88HC9FoGPSujCCZd0
         fsVs2rP9ldHzQciJziPvAbxhd0rJPjpfPjy6F1+nbTkS+DfVg0tyAUm93hIXQcZBjGQB
         2p90pEsI5J+lMtM5mYdqMn1/RRSR8ivDPePlnu4LMyzsIMI29bdR6/UVtHCo7SWKgtAh
         XE9sMlGiZmeCDL5mf2zumEettS7d37I9dNcmYlpgq1cNQ/fB+k4UxcRSmX3bxS/xyk0o
         BESREtX4gDoKWOUBMIRca4eXr0hwX+3WRmdhu/XQ3Umm/c8zZ66ADC3BdESf8AveyoGD
         +SHQ==
X-Gm-Message-State: AFqh2kqP+oP8CtvqSdQUA778IDv0/XndiFhF8CIgBZSlfJV0MWwgTdQP
        7AEEjcldoa9O9G6bB+CJIw==
X-Google-Smtp-Source: AMrXdXsu8gdmXHhUdvUZwiISvgeSQBVWS1KQ28ogMeBnmlUMQUB3NQkyYTfCvw5u9t5VG4hWgX1YjQ==
X-Received: by 2002:aca:5804:0:b0:35e:7dd2:aa96 with SMTP id m4-20020aca5804000000b0035e7dd2aa96mr1783317oib.21.1673979114515;
        Tue, 17 Jan 2023 10:11:54 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id e8-20020a544f08000000b0035aa617156bsm15101211oiy.17.2023.01.17.10.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 10:11:54 -0800 (PST)
Received: (nullmailer pid 3386962 invoked by uid 1000);
        Tue, 17 Jan 2023 18:11:53 -0000
Date:   Tue, 17 Jan 2023 12:11:53 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     dri-devel@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        David Airlie <airlied@gmail.com>, Sean Paul <sean@poorly.run>,
        Andy Gross <agross@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        freedreno@lists.freedesktop.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v6 05/11] dt-bindings: display/msm: rename mdp nodes to
 display-controller
Message-ID: <167397911283.3386904.11601634517098506944.robh@kernel.org>
References: <20230113083720.39224-1-dmitry.baryshkov@linaro.org>
 <20230113083720.39224-6-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230113083720.39224-6-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Fri, 13 Jan 2023 10:37:14 +0200, Dmitry Baryshkov wrote:
> Follow the 'generic names' rule and rename mdp nodes to
> display-controller.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/dpu-common.yaml       | 8 ++++++++
>  .../devicetree/bindings/display/msm/qcom,mdp5.yaml        | 3 +++
>  .../devicetree/bindings/display/msm/qcom,mdss.yaml        | 6 +++---
>  3 files changed, 14 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
