Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F0385788E1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Jul 2022 19:53:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233607AbiGRRxm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Jul 2022 13:53:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233552AbiGRRxm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Jul 2022 13:53:42 -0400
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8ACE2D1F5;
        Mon, 18 Jul 2022 10:53:40 -0700 (PDT)
Received: by mail-il1-f178.google.com with SMTP id l11so4263725ilf.11;
        Mon, 18 Jul 2022 10:53:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lQmLMSCkQ0ST4dExxhb7qEHg2NYQluOVHKi1mQiZUuM=;
        b=sWAKeaTyG+luA/eu3CTYEcci5gZ7P/Lm5EpZbnyaRGCleclAHc5LWPConjxY83CSN2
         vFF/SE99JBMMbVvFo0UpZ/p86d0xt69XavwSztPfPhC2T3wIvoz2GFmtCbsgjhiLVs0H
         sTywfWRq1PG65Qz3YuavmtTIPOugXbQ7KNAqbB8iuVQpB7zLnmKlTUuw0iy5dTpNr9vX
         rZ3hp0r16Iai7DnVj2ImtUjS/pYi8uiu9Wfp2fFqhllJDhayXbeKzL656uEreiLejxJ0
         hxSZ/9u/IH0qiV6maTTrz8wgfIoDqPDyYG55v6vXlz+oJ7alqp0sGUMBW0rj98ENB2r6
         dx6A==
X-Gm-Message-State: AJIora8Q1dvzRDVCmi88mX0lda+/Na3PZV2AVPbUwfUTnGOKszqUsK8D
        sr6NTlUSrLIhWjRjMuR/KqEez8vvUw==
X-Google-Smtp-Source: AGRyM1vSqLAowZJkSZ+cqSUI1FU1wlTg1E3QUAjAr/2girRrGXj9BFdQm0Pb/A1QWEvDZCk9KF7iSw==
X-Received: by 2002:a05:6e02:1605:b0:2dc:6f75:3c0a with SMTP id t5-20020a056e02160500b002dc6f753c0amr13589558ilu.257.1658166820013;
        Mon, 18 Jul 2022 10:53:40 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id d8-20020a0566022be800b0067bc7ab0d9esm5595633ioy.53.2022.07.18.10.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 10:53:39 -0700 (PDT)
Received: (nullmailer pid 3244030 invoked by uid 1000);
        Mon, 18 Jul 2022 17:53:38 -0000
Date:   Mon, 18 Jul 2022 11:53:38 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     freedreno@lists.freedesktop.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Sean Paul <sean@poorly.run>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 05/11] dt-bindings: display/msm: move qcom,sdm845-mdss
 schema to mdss.yaml
Message-ID: <20220718175338.GA3243949-robh@kernel.org>
References: <20220710090040.35193-1-dmitry.baryshkov@linaro.org>
 <20220710090040.35193-6-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220710090040.35193-6-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 10 Jul 2022 12:00:34 +0300, Dmitry Baryshkov wrote:
> Move schema for qcom,sdm845-mdss from dpu-sdm845.yaml to mdss.yaml so
> that the dpu file describes only the DPU schema.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/dpu-sdm845.yaml      | 135 ++++-----------
>  .../devicetree/bindings/display/msm/mdss.yaml | 156 ++++++++++++++----
>  2 files changed, 160 insertions(+), 131 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
