Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40D2C5B0D71
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Sep 2022 21:50:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229506AbiIGTuA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Sep 2022 15:50:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbiIGTt7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Sep 2022 15:49:59 -0400
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BB1027DED;
        Wed,  7 Sep 2022 12:49:58 -0700 (PDT)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-1279948d93dso18853446fac.10;
        Wed, 07 Sep 2022 12:49:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=S2tqXAKzFdgTEY8hJUV312lMc/AuZ4H/XtQOwAe9qN4=;
        b=LnZWMJOecXz9BvDERWF7A5ysS825zVsk2NeN4dRS0zH5Vzdc6EfOrnUFwmAMMeL32w
         ZJAwFqd9pKP340HzfTgPsVte+902/q5NoeBzBZiNNWarQ+gtRBiKmvJLEu5OhquHM7NK
         USLPasIDzWsYXd/wu/wLIvtJN41QkAkgaRCe+6VQEYuoDBeTCQ2EILwtwyTyvvDman4C
         2SvvuD9ldtDpoPVOkMddlZlpsfZLPkLazDEf5PP7il6FIYJFj7Ynp1HMNmTiMf++L7XB
         bHxKZ38Ge3T4+BOW6XRQtX3UMTtBSto+OYQgyz/RMSZuJuQlffk6hVp066W3JbNM3rAe
         04dQ==
X-Gm-Message-State: ACgBeo2/qPE9giRit8xwAZZ8DZiQwWRWoehA3aMqdD3IM2EWBhlZ5JjP
        w5T41C2KN59ciU99AdRKmw==
X-Google-Smtp-Source: AA6agR6YpjdriR+gjYVcWaT10okvnkrPhM3k1OlGBC1XKHdRf109xn0Mfl2916PTKfRqXPpZjU6e9w==
X-Received: by 2002:a05:6808:2127:b0:343:ce6:18ff with SMTP id r39-20020a056808212700b003430ce618ffmr33755oiw.165.1662580197669;
        Wed, 07 Sep 2022 12:49:57 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id nw16-20020a056870bb1000b0010d4aba3339sm8544490oab.42.2022.09.07.12.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 12:49:57 -0700 (PDT)
Received: (nullmailer pid 95999 invoked by uid 1000);
        Wed, 07 Sep 2022 19:49:56 -0000
Date:   Wed, 7 Sep 2022 14:49:56 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Loic Poulain <loic.poulain@linaro.org>
Subject: Re: [PATCH v6 01/12] dt-bindings: display/msm: split qcom,mdss
 bindings
Message-ID: <20220907194956.GA89981-robh@kernel.org>
References: <20220901102312.2005553-1-dmitry.baryshkov@linaro.org>
 <20220901102312.2005553-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220901102312.2005553-2-dmitry.baryshkov@linaro.org>
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

On Thu, Sep 01, 2022 at 01:23:01PM +0300, Dmitry Baryshkov wrote:
> Split Mobile Display SubSystem (MDSS) root node bindings to the separate
> yaml file. Changes to the existing (txt) schema:
>  - Added optional "vbif_nrt_phys" region used by msm8996
>  - Made "bus" and "vsync" clocks optional (they are not used by some
>    platforms)
>  - Added (optional) "core" clock added recently to the mdss driver
>  - Added optional resets property referencing MDSS reset
>  - Defined child nodes pointing to corresponding reference schema.
>  - Dropped the "lut" clock. It was added to the schema by mistake (it is
>    a part of mdp4 schema, not the mdss).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/mdp5.txt  |  30 +---
>  .../devicetree/bindings/display/msm/mdss.yaml | 166 ++++++++++++++++++
>  2 files changed, 167 insertions(+), 29 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/mdss.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
