Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE49E67239F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 17:40:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229798AbjARQkP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 11:40:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231153AbjARQjw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 11:39:52 -0500
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABDFA2683;
        Wed, 18 Jan 2023 08:39:51 -0800 (PST)
Received: by mail-oi1-f171.google.com with SMTP id p185so7982610oif.2;
        Wed, 18 Jan 2023 08:39:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g+ZXSb+wuKJy9CsgvNawGGP2ozeH0Fnjcyrwu9MbaGQ=;
        b=Cr2k7aJMm2F51X7Cd6bWXuQjCTYzC+xxFS3WV16DpMgcsdvYGAtz7/rep83Ekpvox6
         TaFPpzsqEX94mgueStqIBwrCIH/eXAZpkz2TIvAQ+o0MJLKlso3LCDtCcXDz8M+dh69c
         XoofznQ2Enap9q++Xf5FhuPCJ2GNeNjDJNf84jaSpSZQm45H7gBDqWFL/Z+C4RIjaiAo
         cRVJY7Q8UtFHdiFCFsFw1olyXhtEFLDZJTAEnsWKFPw4qMqvI5zczeeXM/Ss848NqgFH
         H2408Fk/rgErMxckUmjMO4JEBAryPcYxFW6vmGPULWy7VGZvrxFVQwtX9ADzEgs9kctH
         gBmA==
X-Gm-Message-State: AFqh2kqjJSaKJNv/58NJbxgxPia/I2zliGTJIQ0NrhzmT0kPlfXYi1Z0
        4UmywbWKxEZSt0dkPI5zNg==
X-Google-Smtp-Source: AMrXdXtYo14PQwXXS67mJEPz08IMq4NM0IJ4JHsdbSGD2YgudqyJ/HYiI52TTqPoAS2TL0siCnxGWw==
X-Received: by 2002:aca:3d8b:0:b0:36a:7668:9e8b with SMTP id k133-20020aca3d8b000000b0036a76689e8bmr2109914oia.40.1674059990982;
        Wed, 18 Jan 2023 08:39:50 -0800 (PST)
Received: from robh_at_kernel.org ([4.31.143.193])
        by smtp.gmail.com with ESMTPSA id u23-20020a056830119700b0066ca61230casm1216089otq.8.2023.01.18.08.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 08:39:50 -0800 (PST)
Received: (nullmailer pid 135922 invoked by uid 1000);
        Wed, 18 Jan 2023 16:39:49 -0000
Date:   Wed, 18 Jan 2023 10:39:49 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>, devicetree@vger.kernel.org,
        Daniel Vetter <daniel@ffwll.ch>,
        Andy Gross <agross@kernel.org>,
        freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Rob Herring <robh+dt@kernel.org>,
        Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: display/msm: dsi-controller-main:
 account for apq8064
Message-ID: <167405998945.135868.8993372876832448793.robh@kernel.org>
References: <20230118032432.1716616-1-dmitry.baryshkov@linaro.org>
 <20230118032432.1716616-3-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230118032432.1716616-3-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Wed, 18 Jan 2023 05:24:30 +0200, Dmitry Baryshkov wrote:
> APQ8064 requires listing four clocks in the assigned-clocks /
> assigned-clock-parents properties. Account for that.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/dsi-controller-main.yaml         | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
