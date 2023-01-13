Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 908B7669C71
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 16:33:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229946AbjAMPds (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Jan 2023 10:33:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230263AbjAMPd0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Jan 2023 10:33:26 -0500
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D61BC974B5;
        Fri, 13 Jan 2023 07:26:57 -0800 (PST)
Received: by mail-oi1-f174.google.com with SMTP id s124so1139962oif.1;
        Fri, 13 Jan 2023 07:26:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w3iFRccbSDkEugBccIou+2bALCJO5axdL5vy8psmKe8=;
        b=22LWLyyzcwh25msT8TSUwytbqOlNmi3k/XKZ7xnB64XLTOj3jplMg0muNk5u/BO5Vo
         N5uHpMTzL4wsUPeNqAgPOfCATabgcBx27OvDchp/JBB4QVQWMLe9DrgEy91lt7xtcprz
         uu87Na78s0Ymn+75n0LLDCumi9ZmmeHA6h6rweEWaWZUy66ined7wurUzYccvCDp1HUj
         xDeXRewR2C0n5vH0cWBmXc+8W2JDpBJCdxZoCt/2tmSwAOABhPgAyAA7X7FgetEpr5Qy
         gYQuP+KnYn3AEneoXSgN2KhabsYMvnVVs5958+ElT1P7EJ3oWj5SC/0dqQDhJGTquVNq
         bCFg==
X-Gm-Message-State: AFqh2kos/QhwSjwO6bcR/9EeLTaMJQDKax8oDETQR7xLR1wMYgoOakqi
        6iMoZCvQwusaRtoIysfBzA==
X-Google-Smtp-Source: AMrXdXtU5Q+EcHwM8fGnUFflgtn0JMNu0tQGWDvrXpPdN6wJh85fEDrBO+B8rxDkKl45atQuth7UAg==
X-Received: by 2002:a05:6808:18a8:b0:364:adbc:609b with SMTP id bi40-20020a05680818a800b00364adbc609bmr1610560oib.19.1673623617083;
        Fri, 13 Jan 2023 07:26:57 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id be16-20020a056808219000b00359ad661d3csm9234840oib.30.2023.01.13.07.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 07:26:56 -0800 (PST)
Received: (nullmailer pid 2224506 invoked by uid 1000);
        Fri, 13 Jan 2023 15:26:52 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        dri-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        David Airlie <airlied@gmail.com>, devicetree@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230113083720.39224-2-dmitry.baryshkov@linaro.org>
References: <20230113083720.39224-1-dmitry.baryshkov@linaro.org>
 <20230113083720.39224-2-dmitry.baryshkov@linaro.org>
Message-Id: <167362343145.2212490.16180994187587985655.robh@kernel.org>
Subject: Re: [PATCH v6 01/11] dt-bindings: display/msm: convert MDP5 schema to
 YAML format
Date:   Fri, 13 Jan 2023 09:26:52 -0600
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Fri, 13 Jan 2023 10:37:10 +0200, Dmitry Baryshkov wrote:
> Convert the mdp5.txt into the yaml format. Changes to the existing (txt) schema:
>  - MSM8996 has additional "iommu" clock, define it separately
>  - Add new properties used on some of platforms:
>    - interconnects, interconnect-names
>    - iommus
>    - power-domains
>    - operating-points-v2, opp-table
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/mdp5.txt  | 132 -----------------
>  .../bindings/display/msm/qcom,mdp5.yaml       | 138 ++++++++++++++++++
>  2 files changed, 138 insertions(+), 132 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/msm/mdp5.txt
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230113083720.39224-2-dmitry.baryshkov@linaro.org


mdp@1a01000: compatible:0: 'qcom,mdp5' was expected
	arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dtb

mdp@1a01000: compatible: ['qcom,msm8953-mdp5', 'qcom,mdp5'] is too long
	arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dtb

