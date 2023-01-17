Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB9A666E631
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jan 2023 19:38:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230392AbjAQShh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 13:37:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232575AbjAQSbu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 13:31:50 -0500
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E3344392B;
        Tue, 17 Jan 2023 10:03:42 -0800 (PST)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-15b9c93848dso24538503fac.1;
        Tue, 17 Jan 2023 10:03:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DOYPnyAt2J4Uh+rVJ+ehIUCeXiRFMPFo5jZlhneDgR4=;
        b=j1CwvGMSGTkfCDAwf7YeTFOdMR/4mYqdZbgGnYyDjs7FUUZw+17XwCN5wmvMgS7Bc3
         oozT2hDUYqAhCfn3+279xvnlrByxOQLzqvN0V4EIOTrSEHzsqHxmqU/hPDBDiU4yUFoC
         5QwUf6bn0aGMslyPRBrchMwSvzxqwfq8aOn9y/DafgIIE5FvL/MJfLGNhttJTkxmmqha
         dasKi6CVYdAcDynITWbuCyJpTW3qAp4Jz8Gg2dECKHO+yb26LDmI16hHJK8xUdhoYd4w
         zHxQeXe9chOdfUTt1IkFT/eLAGDqUelpw4Skf0l0p7xAWO+/EMTiJLEFOHRV8bELFlj0
         kZlw==
X-Gm-Message-State: AFqh2kojTcQEAwminQbHbZaAq88lcEwtLJl0bKQvYSBvNGurAbHhoe4J
        j/DukCZXeXus78wUjCDifw==
X-Google-Smtp-Source: AMrXdXtXdEGZRX21HSHeHAgDRpQrycVFovajB2ZoPABGZ88wt1c/v3xzwZs6+aRiC5KlzuBvMMu+lw==
X-Received: by 2002:a05:6870:fd99:b0:15f:ed7:c02d with SMTP id ma25-20020a056870fd9900b0015f0ed7c02dmr2433421oab.55.1673978610488;
        Tue, 17 Jan 2023 10:03:30 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id c6-20020a056870c08600b0014be94a12d0sm16837537oad.44.2023.01.17.10.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 10:03:29 -0800 (PST)
Received: (nullmailer pid 3323388 invoked by uid 1000);
        Tue, 17 Jan 2023 18:03:29 -0000
Date:   Tue, 17 Jan 2023 12:03:29 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        David Airlie <airlied@gmail.com>,
        linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Sean Paul <sean@poorly.run>, Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v6 01/11] dt-bindings: display/msm: convert MDP5 schema
 to YAML format
Message-ID: <167397860857.3323332.1645036328845035692.robh@kernel.org>
References: <20230113083720.39224-1-dmitry.baryshkov@linaro.org>
 <20230113083720.39224-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230113083720.39224-2-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
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

Reviewed-by: Rob Herring <robh@kernel.org>
