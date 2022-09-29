Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EC375EFE4F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Sep 2022 22:04:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229548AbiI2UEz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Sep 2022 16:04:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbiI2UEx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Sep 2022 16:04:53 -0400
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD7D0BE1B;
        Thu, 29 Sep 2022 13:04:50 -0700 (PDT)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-127dca21a7dso3077900fac.12;
        Thu, 29 Sep 2022 13:04:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=UOb2OpT+RmVgYvUl1vJinRQ2SLSghdo0bfKmgz0QTUg=;
        b=dw+jek3hONX/KZiV27X4ZbqMKN5sVCfwr+GJEsGBNYIYqezST7nxlqudVM0YNEF7hK
         sCxyq8/SzAY4v56VFg3O52Z+0QRsNAGw8yHaY7wGW+5rPwyD0FektTVA1enfLKrJK3sx
         KmKkNxyCC8YVUIb4rEm5W8ZaS4zhENAsboSEbhqkuKva8V80tkoKV8kV5f2z85qqhwox
         nCmXI0YZpW+X4lMaoLG9iiHQw41z6NOM8lYRip3QgXzeJkjaE1m2BrRQnnwiIDjK0S61
         UQtb5d+BYwmPoxn2f877QrYJIJ8cDwE7HnEiNrBXpc9iPb2fkGNydP/rsXsXpnbMQEG/
         QGVw==
X-Gm-Message-State: ACrzQf1uqhQrZF31tIg+f75EC473gysG1UW7mFSceXcFYb3d2qhoix3X
        o9i/6L/bfY/ISJyyV6QUJw==
X-Google-Smtp-Source: AMsMyM6iOD6lOvLB454gWm8TA6RsYfA8tIZxlW9vJiH96267EzqdfWPIM9JMoRmq/zzfNkOr/SFFBA==
X-Received: by 2002:a05:6870:c59b:b0:131:8d2e:e808 with SMTP id ba27-20020a056870c59b00b001318d2ee808mr8047505oab.280.1664481890061;
        Thu, 29 Sep 2022 13:04:50 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id 30-20020a9d04a1000000b0063b2875246dsm141051otm.49.2022.09.29.13.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 13:04:49 -0700 (PDT)
Received: (nullmailer pid 2653001 invoked by uid 1000);
        Thu, 29 Sep 2022 20:04:48 -0000
Date:   Thu, 29 Sep 2022 15:04:48 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Clark <robdclark@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, David Airlie <airlied@linux.ie>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        Stephen Boyd <swboyd@chromium.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
        Rob Herring <robh+dt@kernel.org>,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH v8 08/12] dt-bindings: display/msm: split dpu-sdm845 into
 DPU and MDSS parts
Message-ID: <166448188823.2652936.7167488373212756986.robh@kernel.org>
References: <20220924123611.225520-1-dmitry.baryshkov@linaro.org>
 <20220924123611.225520-9-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220924123611.225520-9-dmitry.baryshkov@linaro.org>
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

On Sat, 24 Sep 2022 15:36:07 +0300, Dmitry Baryshkov wrote:
> In order to make the schema more readable, split dpu-sdm845 into the DPU
> and MDSS parts, each one describing just a single device binding.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/dpu-sdm845.yaml      | 148 ------------------
>  .../bindings/display/msm/qcom,sdm845-dpu.yaml |  90 +++++++++++
>  .../display/msm/qcom,sdm845-mdss.yaml         | 117 ++++++++++++++
>  3 files changed, 207 insertions(+), 148 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sdm845-dpu.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
