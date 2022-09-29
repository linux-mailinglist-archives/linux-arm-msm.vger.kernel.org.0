Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7A765EFE41
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Sep 2022 22:02:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229436AbiI2UCk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Sep 2022 16:02:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbiI2UCj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Sep 2022 16:02:39 -0400
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F50A1FBCA7;
        Thu, 29 Sep 2022 13:02:38 -0700 (PDT)
Received: by mail-oi1-f180.google.com with SMTP id m130so2700242oif.6;
        Thu, 29 Sep 2022 13:02:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=FcSArAoOE9YNFJxfhSZSoEdEXfFa5H2DTIvc0TVFs54=;
        b=EOwYjqw+xcrEEi1FKCsOGyQF3mJsJXhJba/QRnamipaWADsaplEjRRXqlLN8jOVveZ
         Va2217rRumqNJsGLeZAYWRP0Z1ZGKBd6w6PDPRTF4vRIx4O6MfptH0zOZJgEFvOrdA0a
         fiLJUDKyQH9bFIburejqbGqgCGkFmmnsDpx+yrk3waxt5AdTb9oHFOIBamnHUad15NE5
         yx+/AbxEb62zgpTJE5w9Per78aUZwG5xmvLgrDdbZCNra7A0djPyKl891IT/HbX7OWO/
         ggSENjJCrfxqV5leL4ZPttg2ms1c5EnomSCYASvJBiL93AilYMKuBrI/FkzTTXG/bUYe
         gyKQ==
X-Gm-Message-State: ACrzQf2ohA0F4TJvBrdMZ6TH7r5Q0EOApOUp8y5PMPRRcKK2tdKgurtv
        KTk3u6B+v2uK0u0hbDF+Ug==
X-Google-Smtp-Source: AMsMyM4kf4KcfgLkzzZeT7aj3So10PyIDWgeVap50vF/VlsPJjb12Ryzh19twyN3Q4aCUZ8jKsqHQA==
X-Received: by 2002:a05:6808:2094:b0:350:53c6:c7e0 with SMTP id s20-20020a056808209400b0035053c6c7e0mr2487507oiw.67.1664481757853;
        Thu, 29 Sep 2022 13:02:37 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id b4-20020a056830104400b0065126423321sm130756otp.76.2022.09.29.13.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 13:02:37 -0700 (PDT)
Received: (nullmailer pid 2647540 invoked by uid 1000);
        Thu, 29 Sep 2022 20:02:36 -0000
Date:   Thu, 29 Sep 2022 15:02:36 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org, David Airlie <airlied@linux.ie>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
Subject: Re: [PATCH v8 05/12] dt-bindings: display/msm: move common MDSS
 properties to mdss-common.yaml
Message-ID: <166448175558.2647480.8054908621388589521.robh@kernel.org>
References: <20220924123611.225520-1-dmitry.baryshkov@linaro.org>
 <20220924123611.225520-6-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220924123611.225520-6-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 24 Sep 2022 15:36:04 +0300, Dmitry Baryshkov wrote:
> Move properties common to all MDSS DT nodes to the mdss-common.yaml.
> 
> This extends qcom,msm8998-mdss schema to allow interconnect nodes, which
> will be added later, once msm8998 gains interconnect support.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/dpu-msm8998.yaml     | 41 +--------
>  .../bindings/display/msm/dpu-qcm2290.yaml     | 51 ++----------
>  .../bindings/display/msm/dpu-sc7180.yaml      | 50 ++---------
>  .../bindings/display/msm/dpu-sc7280.yaml      | 50 ++---------
>  .../bindings/display/msm/dpu-sdm845.yaml      | 54 ++----------
>  .../bindings/display/msm/mdss-common.yaml     | 83 +++++++++++++++++++
>  6 files changed, 111 insertions(+), 218 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/mdss-common.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
