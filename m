Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A92A25EFE5E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Sep 2022 22:05:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229669AbiI2UFn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Sep 2022 16:05:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229691AbiI2UFm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Sep 2022 16:05:42 -0400
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA08AE62FC;
        Thu, 29 Sep 2022 13:05:38 -0700 (PDT)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-131886d366cso3096053fac.10;
        Thu, 29 Sep 2022 13:05:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=sA27QbckL8YX/4PuWUZpxGzCM4ZqQIfIZ0bwz0dvdwk=;
        b=nWvHMiynNLhVsQKn9TeDpaEpqskVJRA2FPS9aMexEYkZck6ohNYSojshLVsS3Aa0MX
         8x7WVdld39TskRsEf1X5p+zhLC9YVhZ+6UFhNn0ljmfm9sY6VihOYV3iXpjBqni6fjoa
         WhFkxqr54MQwu6l1rtaE3jdZWbsy1qaIEKUszTwRDqya7Jzas8rEdq+opeEcJe8lgAAT
         dp/eVgvHHljf2uDA8dSggx8zix1KBdiPdfnydJ+8w+Ii9HXKXSW53tOzsSywiKKbqPdI
         owERMvglxMKFa4RAn41dj3CNhzviJF2iaLC9i6SeCTq4DpDy/Ui/1pHe6x2ZkoOFfirM
         VIDg==
X-Gm-Message-State: ACrzQf0IicqCNekP0/cdvHN0xXWVUHN25sG19dfnYhqoH+ySE0Ta9Env
        nQOTEQVRCLxUoA+MtFrUZg==
X-Google-Smtp-Source: AMsMyM7gfDWPTI/ADhk9VSHSTmoYtLAHstSEuuh4NRIutqRnF379aU0zv17NFs1IMg/+FC4o13VjYQ==
X-Received: by 2002:a05:6871:5c9:b0:12b:b4fc:471c with SMTP id v9-20020a05687105c900b0012bb4fc471cmr9142113oan.104.1664481937939;
        Thu, 29 Sep 2022 13:05:37 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id z9-20020a056870738900b000f5e89a9c60sm191770oam.3.2022.09.29.13.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 13:05:37 -0700 (PDT)
Received: (nullmailer pid 2654126 invoked by uid 1000);
        Thu, 29 Sep 2022 20:05:36 -0000
Date:   Thu, 29 Sep 2022 15:05:36 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>, Sean Paul <sean@poorly.run>,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v8 10/12] dt-bindings: display/msm: split dpu-qcm2290
 into DPU and MDSS parts
Message-ID: <166448193581.2654066.15728350591102767785.robh@kernel.org>
References: <20220924123611.225520-1-dmitry.baryshkov@linaro.org>
 <20220924123611.225520-11-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220924123611.225520-11-dmitry.baryshkov@linaro.org>
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

On Sat, 24 Sep 2022 15:36:09 +0300, Dmitry Baryshkov wrote:
> In order to make the schema more readable, split dpu-qcm2290 into the DPU
> and MDSS parts, each one describing just a single device binding.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/dpu-qcm2290.yaml     | 148 ------------------
>  .../display/msm/qcom,qcm2290-dpu.yaml         |  84 ++++++++++
>  .../display/msm/qcom,qcm2290-mdss.yaml        | 117 ++++++++++++++
>  3 files changed, 201 insertions(+), 148 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
