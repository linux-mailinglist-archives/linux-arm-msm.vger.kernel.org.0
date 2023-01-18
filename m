Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 648486723A1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 17:40:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229965AbjARQkS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 11:40:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230041AbjARQkO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 11:40:14 -0500
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C44D21CAF3;
        Wed, 18 Jan 2023 08:40:13 -0800 (PST)
Received: by mail-oi1-f170.google.com with SMTP id j130so29081397oif.4;
        Wed, 18 Jan 2023 08:40:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R6M2Mwc6fPv6SKz16Py9LsXw75++yU7U39bm0+dfDtI=;
        b=Rv1P+gC76rL/0tXapY52P9nDsK+oP03LTNNsGF/gPuGZ8g5NKnvBOefxvSoDKQuNH+
         JISJBMA5LA6JukXKqluArITneMT7v+5cgW8J/6vsHN5M9RLbbOhUcLF7TUdVh4Th8x+W
         WxkXvA7CSkhD0b1p2O8kPTZqqrnKzKfzQvb//6cNRK22HRkSI1KwRTPF8dpL1Ra9e0wN
         elKmn2CMaEHLHwPcznedN46rElM414G3O73br0qU/mvarz4iAw6UEP2Qg2jUQ1+hXjXo
         9BpVjANGs7fqXFxJmLCV72Vi6w3R4AmzQOwEDdPzumvRL3eHhxdebFjlHRLoudxVtwwp
         IYhA==
X-Gm-Message-State: AFqh2koH2cFXFDsiCN8QPor6T19XwRr7p3POdkWLHujg8Z4A/nJoV3bg
        aDZ6CyLMTy1w1AogD/EVkg==
X-Google-Smtp-Source: AMrXdXueCqm+gVomYaXrF8HFdNo0iBj4JW/IegKNLeGDcwbVobzf/QTGtZ1YgGVL82AvHisW9HgThw==
X-Received: by 2002:aca:d7c6:0:b0:363:ab67:ee35 with SMTP id o189-20020acad7c6000000b00363ab67ee35mr3324016oig.56.1674060013043;
        Wed, 18 Jan 2023 08:40:13 -0800 (PST)
Received: from robh_at_kernel.org ([4.31.143.193])
        by smtp.gmail.com with ESMTPSA id j21-20020aca1715000000b0036aa151bcd8sm2145156oii.16.2023.01.18.08.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 08:40:12 -0800 (PST)
Received: (nullmailer pid 136519 invoked by uid 1000);
        Wed, 18 Jan 2023 16:40:11 -0000
Date:   Wed, 18 Jan 2023 10:40:11 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     dri-devel@lists.freedesktop.org,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org,
        Stephen Boyd <swboyd@chromium.org>,
        Andy Gross <agross@kernel.org>, Sean Paul <sean@poorly.run>,
        Rob Herring <robh+dt@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@gmail.com>,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 3/4] dt-bindings: display/msm: dsi-controller-main: allow
 using fewer lanes
Message-ID: <167406001146.136465.11850514731563891195.robh@kernel.org>
References: <20230118032432.1716616-1-dmitry.baryshkov@linaro.org>
 <20230118032432.1716616-4-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230118032432.1716616-4-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Wed, 18 Jan 2023 05:24:31 +0200, Dmitry Baryshkov wrote:
> Some platforms might use less than full 4 lanes DSI interface. Allow
> using any amount of lanes starting from 1 up to 4.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/dsi-controller-main.yaml  | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
