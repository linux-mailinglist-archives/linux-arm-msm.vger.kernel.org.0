Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EF005EFE6C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Sep 2022 22:09:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229558AbiI2UJO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Sep 2022 16:09:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229536AbiI2UJN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Sep 2022 16:09:13 -0400
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5A407B1C4;
        Thu, 29 Sep 2022 13:09:11 -0700 (PDT)
Received: by mail-oo1-f54.google.com with SMTP id k10-20020a4ad10a000000b004756ab911f8so867015oor.2;
        Thu, 29 Sep 2022 13:09:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=GZZiagUs3HUfpeMwbywCyzsEBVOVMqD641TL2LDqp7c=;
        b=VUn3mpaLpwAmjGKDt2cVfzUhXrK5fYHTGPBReAv7DWc4809uo8Bf0OMv3XLWWc/sPC
         dJyWYKHOkSMTrdEK2EAJ7+UW9mIv8LEewPVOiLNMw2L5ApuIdfhG59wUnXKsgl76L6JY
         yFb4yhcZAuptufhC4s7UfubmpgvcNHIj/Q0DDfX9g7AyAKDPPEe16DrBT9jFqRqPtwXA
         g4HChblrkTX/+1GtWtiWzBVOnw8fiCQrgTOtfFvnkUwxske532AwbTQ5fge0ztx36PsC
         1XiOD+jnGuOwU+U111DvdTZ/OoTLOUmn3k6LGW5C/5zWhsanpfUfvc16iV3WE50wv88E
         xqqQ==
X-Gm-Message-State: ACrzQf3d4EMv3y712wrS7XIwIJicK1XRjey0tH6G0b6r5IWw1A3P/Txf
        G3e3unFx+OfhWx5tHvUmng==
X-Google-Smtp-Source: AMsMyM5cV8SitoPg7y58nU1devSHpI02JFb0pExeyBbLcIVHfK4FQ7OAAFPslz4V6wx4F4ys7pwgPw==
X-Received: by 2002:a4a:645:0:b0:475:e496:78f9 with SMTP id 66-20020a4a0645000000b00475e49678f9mr2055524ooj.13.1664482151091;
        Thu, 29 Sep 2022 13:09:11 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id s17-20020a0568301e1100b00659ba9f2872sm138276otr.77.2022.09.29.13.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 13:09:10 -0700 (PDT)
Received: (nullmailer pid 2658309 invoked by uid 1000);
        Thu, 29 Sep 2022 20:09:09 -0000
Date:   Thu, 29 Sep 2022 15:09:09 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Bjorn Andersson <andersson@kernel.org>,
        freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        Stephen Boyd <swboyd@chromium.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH v8 12/12] dt-bindings: display/msm: add support for the
 display on SM8250
Message-ID: <166448214908.2658264.16651014631872750746.robh@kernel.org>
References: <20220924123611.225520-1-dmitry.baryshkov@linaro.org>
 <20220924123611.225520-13-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220924123611.225520-13-dmitry.baryshkov@linaro.org>
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

On Sat, 24 Sep 2022 15:36:11 +0300, Dmitry Baryshkov wrote:
> Add DPU and MDSS schemas to describe MDSS and DPU blocks on the Qualcomm
> SM8250 platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/mdss-common.yaml     |   4 +-
>  .../bindings/display/msm/qcom,sm8250-dpu.yaml |  92 +++++
>  .../display/msm/qcom,sm8250-mdss.yaml         | 330 ++++++++++++++++++
>  3 files changed, 424 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm8250-dpu.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
