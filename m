Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D19015B0E04
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Sep 2022 22:20:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229699AbiIGUTt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Sep 2022 16:19:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230096AbiIGUTZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Sep 2022 16:19:25 -0400
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABBCAB6A;
        Wed,  7 Sep 2022 13:19:23 -0700 (PDT)
Received: by mail-ot1-f43.google.com with SMTP id h9-20020a9d5549000000b0063727299bb4so11007933oti.9;
        Wed, 07 Sep 2022 13:19:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=sDfHYqJNdpt4s6mbrazgo41Cj9IhFISlCIaxBIkFjDk=;
        b=XHM0ADvosUFN3qd0WOHXnmMJWxMSukvSEcG3hvha2JMKIyGLrtHzvS3/VvkSdKD+/w
         eZq+/LyY0oQemH/RolOuBXQA0Toei4BrZFCGSDIFd6LpBF6cW4QzYeUBRF3tzWdBVrij
         XuEBIsXmB0wioVGh8Nv2uVArFkM0B6txYRlRORlj0JKEcFEsazUw/E/3c9ImZp6Tc+ad
         cee1ASfwmajbQ2W/c1p05Wymqpa/+KPnP4Pfi1mbgO1rcac5L+tl2bPcjBp8F1nbpDbU
         KgAvkFhXuGqRuTRFj+odgBi4/01kaOikcwRSZ+00aIv4XhVd2tdZDXg3EQJfJa5Cy4js
         AlDQ==
X-Gm-Message-State: ACgBeo0XpVsGQn0boaG3XH/eEsPckqYOjo69jyA0cAWB0JfJX2jUuknH
        m8QOMWlvRi687QGnSgMNAA==
X-Google-Smtp-Source: AA6agR4quhswC9Vja62b/KnMIP5TL7CvGOyOyG4Br7RtGdY4gtHBkPmnDDKIwklqA1A4rmgKRhWztw==
X-Received: by 2002:a05:6830:4d2:b0:63b:2434:cbd5 with SMTP id s18-20020a05683004d200b0063b2434cbd5mr2212865otd.79.1662581962948;
        Wed, 07 Sep 2022 13:19:22 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id v2-20020a056830140200b006391bdbb361sm7257933otp.31.2022.09.07.13.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 13:19:22 -0700 (PDT)
Received: (nullmailer pid 216153 invoked by uid 1000);
        Wed, 07 Sep 2022 20:19:21 -0000
Date:   Wed, 7 Sep 2022 15:19:21 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v6 11/12] dt-bindings: display/msm: add missing device
 nodes to mdss-* schemas
Message-ID: <20220907201921.GA216074-robh@kernel.org>
References: <20220901102312.2005553-1-dmitry.baryshkov@linaro.org>
 <20220901102312.2005553-12-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220901102312.2005553-12-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 01 Sep 2022 13:23:11 +0300, Dmitry Baryshkov wrote:
> Add missing device nodes (DSI, PHYs, DP/eDP) to the existing MDSS
> schemas.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/mdss-msm8998.yaml    | 12 +++++++++
>  .../bindings/display/msm/mdss-qcm2290.yaml    |  6 +++++
>  .../bindings/display/msm/mdss-sc7180.yaml     | 18 +++++++++++++
>  .../bindings/display/msm/mdss-sc7280.yaml     | 26 +++++++++++++++++++
>  .../bindings/display/msm/mdss-sdm845.yaml     | 12 +++++++++
>  5 files changed, 74 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
