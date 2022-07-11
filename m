Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A93C0570E1F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Jul 2022 01:18:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229925AbiGKXSF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Jul 2022 19:18:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229811AbiGKXSE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Jul 2022 19:18:04 -0400
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D559C87F70;
        Mon, 11 Jul 2022 16:18:03 -0700 (PDT)
Received: by mail-il1-f174.google.com with SMTP id n9so3896121ilq.12;
        Mon, 11 Jul 2022 16:18:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=f2XdMFBhc4NMn9EddNPRLfQF2c+R/KA29L/gSecYKXo=;
        b=ZGyGY3u4Beo3KRbTRCSsdHwLay/usOU/flH4QuC40iYKXqFKWKjzjU1nnk62+4qf0S
         e7ZiVe9UIOd3JLrX9Nh88+k/xMmk3bEwzBPzVh8hvL0TvtMn7KVri0L9V//Ciz3FbpeP
         /E7o1QgV88HGaiXsVZ0inPaqqYGAWc5bgEgGk2IlK22YpjROJu3bt0PLLFCuYt7sih0i
         fGgbD7qUh23XWXXH1G3J9QOM4Fj82E+EV1MRiVVXZ5Wa/kzGssSIYxZK3R4P0eojBeru
         NQrE0L8jxSs026dURpwVzxtfe+4kVWIlaHvfTJpPyElxieRWZnvd00Bf+Df1/G/CmBvL
         p0KQ==
X-Gm-Message-State: AJIora/ccr2zaxaJ9w5fFarPAkCiIky55JtxADQcvjt+AMvbKQTi1uj3
        oH3vvnf97NkBxdwu7+YFEA==
X-Google-Smtp-Source: AGRyM1vyZvWaglhF2DL7o6k5C8/S6j/KTfpHBn+DP8hkEMeq6ZO4RWF3/NwePI2b96seJBq9DrQ2Gw==
X-Received: by 2002:a05:6e02:188f:b0:2dc:7291:fd02 with SMTP id o15-20020a056e02188f00b002dc7291fd02mr6293244ilu.321.1657581483045;
        Mon, 11 Jul 2022 16:18:03 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id f12-20020a056638328c00b00339e6168237sm3344152jav.34.2022.07.11.16.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 16:18:02 -0700 (PDT)
Received: (nullmailer pid 454950 invoked by uid 1000);
        Mon, 11 Jul 2022 23:18:00 -0000
Date:   Mon, 11 Jul 2022 17:18:00 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     devicetree@vger.kernel.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
        linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        freedreno@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
        dri-devel@lists.freedesktop.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2 9/9] dt-bindings: msm/dp: handle DP vs eDP difference
Message-ID: <20220711231800.GA454897-robh@kernel.org>
References: <20220710084133.30976-1-dmitry.baryshkov@linaro.org>
 <20220710084133.30976-10-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220710084133.30976-10-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 10 Jul 2022 11:41:33 +0300, Dmitry Baryshkov wrote:
> The #sound-dai-cells property should be used only for DP controllers. It
> doesn't make sense for eDP, there is no support for audio output. The
> aux-bus should not be used for DP controllers. Also p1 MMIO region
> should be used only for DP controllers.
> 
> Take care of these differences.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/dp-controller.yaml   | 26 ++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
