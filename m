Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E98F578912
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Jul 2022 19:58:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234658AbiGRR6f (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Jul 2022 13:58:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234870AbiGRR63 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Jul 2022 13:58:29 -0400
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 719AB2ED4B;
        Mon, 18 Jul 2022 10:58:27 -0700 (PDT)
Received: by mail-il1-f169.google.com with SMTP id l11so4271266ilf.11;
        Mon, 18 Jul 2022 10:58:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8LULo19hUFHmhHSaHd6yHFXBHNeiLMybwtS5/MObIek=;
        b=W7uQcbU0W9IQwa/TOtqhFW6FP4tc2K6yWrRLH/j/GF+/yZBPgyFiZYMskVep7uOakC
         4c3QxfIeixt0dGaO0XdU8y80ZQFQWGX+ISSHVglRku/e7Rhb2qs9s2Hpmif+3ZB8QO7h
         6wO+ZTu/M9gdT8TsStJAcn96PaxKJU5N/+VLjVaXJ/8QngPrK/vFJzL8m67hH6g3orqe
         riLjw9z2/xWCv7QLvwHrT76g02/JpnFTchER6zReHJ0ZV/wy7+CaFBihr6dnEPobs4SI
         R+rM/nBrey0QNNEAeGQgyjcyMu/UGi+mDl0E7KdgNVX8TraT3nXo5Y1gCJrlUvMWcsQN
         MkMg==
X-Gm-Message-State: AJIora/hi76DPZuS3pRJNkNqF3JfGprSRe2nGuSBICxiHHoiQ5QroQ/J
        yVyP65xI0TZ0xRA6qiQeBA==
X-Google-Smtp-Source: AGRyM1u5X1SGwuiqB2p5EVblsYNeo7rdYRw4UiHvXjBcEPO2IEJO0Bi/juR+tn25c8JSxj+HtoMATg==
X-Received: by 2002:a05:6e02:11ae:b0:2dc:d9db:585c with SMTP id 14-20020a056e0211ae00b002dcd9db585cmr5304133ilj.236.1658167106722;
        Mon, 18 Jul 2022 10:58:26 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id v11-20020a92c6cb000000b002dc911570f1sm4986389ilm.71.2022.07.18.10.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 10:58:26 -0700 (PDT)
Received: (nullmailer pid 3252391 invoked by uid 1000);
        Mon, 18 Jul 2022 17:58:25 -0000
Date:   Mon, 18 Jul 2022 11:58:25 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Rob Clark <robdclark@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
Subject: Re: [PATCH v2 10/11] dt-bindings: display/mdm: add gcc-bus clock to
 dpu-smd845
Message-ID: <20220718175825.GA3252359-robh@kernel.org>
References: <20220710090040.35193-1-dmitry.baryshkov@linaro.org>
 <20220710090040.35193-11-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220710090040.35193-11-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 10 Jul 2022 12:00:39 +0300, Dmitry Baryshkov wrote:
> Add gcc-bus clock required for the SDM845 DPU device tree node. This
> change was made in the commit 111c52854102 ("arm64: dts: qcom: sdm845:
> move bus clock to mdp node for sdm845 target"), but was not reflected in
> the schema.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/dpu-sdm845.yaml        | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
