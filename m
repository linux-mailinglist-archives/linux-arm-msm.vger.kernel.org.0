Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3357578903
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Jul 2022 19:57:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234403AbiGRR5p (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Jul 2022 13:57:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234213AbiGRR5o (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Jul 2022 13:57:44 -0400
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30D552E9D4;
        Mon, 18 Jul 2022 10:57:42 -0700 (PDT)
Received: by mail-io1-f45.google.com with SMTP id q14so9873333iod.3;
        Mon, 18 Jul 2022 10:57:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FTLdYpYJWh+u6rozMPL/HAUqbA9FZq915QJ3J6E3duU=;
        b=ufLCAMud5FF+ckIedus5ank0QmNxKrHJEbufEhW+Gj6PfulCrCcu5QQM2jy8SA5fX5
         aOCWyX8FdLmsEkLESHd4nyp715/38fHLMZtjhnZcLkPxB7wx8+xsDUyY21Ek/Jl9XaBM
         6pRLCyGAzrZ/5SupXHd3y/pKBWd/iUOIu5K+/qQBErym6DPBzryB2TPHBnu+TtxhMp0v
         v9LvMsuaIDxRO9jebnjbWvwoEzY3Mv4UeuRnb3w+tEczYSxjEPuVnCgWL/F7dNI4VLu8
         xf2dlO9WqxV4GE6PuADAG1QxWQFVvjtA7+JJwCrGj0jaMqzXoFXVSQRztgRzYcwFaUL1
         DLjg==
X-Gm-Message-State: AJIora/U40Pg6hes+U1OquHJhYsUK1toapl5OmopGpAnlXLBKhqgjt+U
        BQV1CHJM4wUKtrOKX7oRFQ==
X-Google-Smtp-Source: AGRyM1tx/b++jpg+Ol3oUV5moVTNvNP37K9Pksh1j5pWxwTeOClNEHTx6PVmpsHHDupr9+kClnQBJQ==
X-Received: by 2002:a05:6638:2404:b0:33f:7105:ed23 with SMTP id z4-20020a056638240400b0033f7105ed23mr14455411jat.50.1658167061508;
        Mon, 18 Jul 2022 10:57:41 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id z7-20020a92bf07000000b002dc10fd4b88sm5004376ilh.29.2022.07.18.10.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 10:57:41 -0700 (PDT)
Received: (nullmailer pid 3250964 invoked by uid 1000);
        Mon, 18 Jul 2022 17:57:39 -0000
Date:   Mon, 18 Jul 2022 11:57:39 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        freedreno@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        David Airlie <airlied@linux.ie>,
        Rob Clark <robdclark@gmail.com>,
        Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v2 08/11] dt-bindings: display/msm: move
 qcom,qcm2290-mdss schema to mdss.yaml
Message-ID: <20220718175739.GA3250907-robh@kernel.org>
References: <20220710090040.35193-1-dmitry.baryshkov@linaro.org>
 <20220710090040.35193-9-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220710090040.35193-9-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 10 Jul 2022 12:00:37 +0300, Dmitry Baryshkov wrote:
> Move schema for qcom,qcm2290-mdss from dpu-qcm2290.yaml to mdss.yaml so
> that the dpu file describes only the DPU schema.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/dpu-qcm2290.yaml     | 140 +++++-------------
>  .../devicetree/bindings/display/msm/mdss.yaml |  24 +++
>  2 files changed, 57 insertions(+), 107 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
