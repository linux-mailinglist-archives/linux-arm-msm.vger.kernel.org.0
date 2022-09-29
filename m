Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89E1E5EFE0F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Sep 2022 21:36:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229493AbiI2TgT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Sep 2022 15:36:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229805AbiI2TgL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Sep 2022 15:36:11 -0400
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE01E12C690;
        Thu, 29 Sep 2022 12:36:08 -0700 (PDT)
Received: by mail-oi1-f179.google.com with SMTP id w13so2641835oiw.8;
        Thu, 29 Sep 2022 12:36:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=R6Fx1GZLpV1QRnBBMILVQk0FCMQZPR9gcz/0eV1V+30=;
        b=yDmjNj0wmAE137w6dwBYjrkktTxsDIDROEiug4mIIhWp1kYQuW+Zxrf8g6XjN9UuvO
         J3tDpHkp8iWBEgEULsGhXX5EN5RU8PenLnkBQU+bgV9Je0d9N/0G6H7Q14SGD9WaOY0H
         loGWPW7ow4Z6lzi0JvmvEvxUWP/XsyhWUGX7VvXCp3/x9sFHjD5kqQX9VopClsUqdbai
         le3fA8UJBUACTDJ2JQP97KavKhKUDgkK0mX0iDKyPDMFHk6lXrsnNHW0NOqVbWNLRVa6
         +h0E3+C469CqfZrsr727szQLwxetmCb8SkTPjjxYaE8bwGzhKgcORmA/7u2XXnwbcjQZ
         YQsg==
X-Gm-Message-State: ACrzQf3Dk7daPfCVGlXNiA+S7qk1iaYLg4yzM/ResEyFhDvoBwMBGSlH
        fH+YKWO5dJ/3I7jYaJtwHg==
X-Google-Smtp-Source: AMsMyM7wumYHj5Di5UZXrYcudyqXxaGDmcrSg4h9U5d0fxPE1xPAm3edqGlszMTz+y14KJ3XhsIh1Q==
X-Received: by 2002:a05:6808:285:b0:34f:b12b:565e with SMTP id z5-20020a056808028500b0034fb12b565emr7911683oic.24.1664480167952;
        Thu, 29 Sep 2022 12:36:07 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id t15-20020a056870e74f00b0011f00b027bdsm146159oak.45.2022.09.29.12.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 12:36:07 -0700 (PDT)
Received: (nullmailer pid 2619055 invoked by uid 1000);
        Thu, 29 Sep 2022 19:36:06 -0000
Date:   Thu, 29 Sep 2022 14:36:06 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     David Airlie <airlied@linux.ie>, Andy Gross <agross@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v8 04/12] dt-bindings: display/msm: move common DPU
 properties to dpu-common.yaml
Message-ID: <166448016545.2618978.3839528347670225478.robh@kernel.org>
References: <20220924123611.225520-1-dmitry.baryshkov@linaro.org>
 <20220924123611.225520-5-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220924123611.225520-5-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 24 Sep 2022 15:36:03 +0300, Dmitry Baryshkov wrote:
> Move properties common to all DPU DT nodes to the dpu-common.yaml.
> 
> Note, this removes description of individual DPU port@ nodes. However
> such definitions add no additional value. The reg values do not
> correspond to hardware INTF indices. The driver discovers and binds
> these ports not paying any care for the order of these items. Thus just
> leave the reference to graph.yaml#/properties/ports and the description.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/dpu-common.yaml      | 52 +++++++++++++++++++
>  .../bindings/display/msm/dpu-msm8998.yaml     | 44 +---------------
>  .../bindings/display/msm/dpu-qcm2290.yaml     | 39 +-------------
>  .../bindings/display/msm/dpu-sc7180.yaml      | 43 +--------------
>  .../bindings/display/msm/dpu-sc7280.yaml      | 43 +--------------
>  .../bindings/display/msm/dpu-sdm845.yaml      | 44 +---------------
>  6 files changed, 62 insertions(+), 203 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-common.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
