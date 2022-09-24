Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 682D55E8EE3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Sep 2022 19:23:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233785AbiIXRXt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Sep 2022 13:23:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230111AbiIXRXs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Sep 2022 13:23:48 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10CA63E751
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 10:23:44 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id q17so3240983lji.11
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 10:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=sslfC90ZklIf6wLnIhiCKVZK6GJGnQV2ng9fxAHP2yo=;
        b=PTAqd7crGxlL3Jt90Y0i9CPEnGUp9IKfpvAzbV7aEhFinW8Ah02LoOM+2L9CUF5t1W
         iDqJjgUYJiXivgwUwZ0CaNwE2bZ7WfEq5Kj6mQIk/ZRT8kgCHDAYofRTr2hNbDmB+bUs
         ujXM11D7UtxuwMGfabOWvI6jBmjoLB9TC5G/qVvCLQkL0Rqn7wr/3N17TzseCtd3FUP1
         8DtZsyDNkd1NDJLqjrRBzNYUY2MLsQmyLqUwsQpEFapaTb9MR/pq9ossiwmN5DKf3/oa
         1el6LxugZKGXQwYHYNCKlTX2eRDBM6ZQ3oqcUyqXIoBSuOiFAntQwUarXxH72RkTz4ST
         fs+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=sslfC90ZklIf6wLnIhiCKVZK6GJGnQV2ng9fxAHP2yo=;
        b=DwiF9WOAlr3DvrsWuHa1WHIjM9vw5xY2tkj4eDyGGNzJGxZ9kBYFqXh6peqsESARzG
         plbHbkwLjwyvXrtaxRwPu23ex75PNeooFZGSVKMsZfdZmF2dln+vU5EadxU4wc0EUy3R
         P6W+jWXIMeoj/WRHrZ7RBnkS3ijaU5U/f7tR+/ta0GN+ZIVIdUw4GqDzqLsXV9n7lA+1
         u4GOTG4CpKK4myRETWN/yLyMRQTk+rpHTKb3SZcqN6L+rC8Me7xf9b5NRBToVNWS//vO
         irXGqu/ID37FkWhhipVj8JS1u8v0QOzeCbXrXNYjWUUvpqg0cBbX+jpWjA4bIdkKK0KL
         gleQ==
X-Gm-Message-State: ACrzQf3e+zgrNcybKwhm1/nUetbZhWN7+gJnqSLmLL3WB47seS6JvvI5
        LLFgckaLEtfZIsEGlrtHfn+B/w==
X-Google-Smtp-Source: AMsMyM5ShCjydTQrfsrfhVOekorNsO14U4Ib+bJE7obr3yzLOM5vn9k/q7IIeT/kdYXHtzXBPUHgUw==
X-Received: by 2002:a2e:b016:0:b0:26b:f00b:a8cf with SMTP id y22-20020a2eb016000000b0026bf00ba8cfmr4719440ljk.24.1664040222285;
        Sat, 24 Sep 2022 10:23:42 -0700 (PDT)
Received: from krzk-bin (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id t3-20020a056512208300b00492e16b7ab3sm1955935lfr.94.2022.09.24.10.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Sep 2022 10:23:41 -0700 (PDT)
Date:   Sat, 24 Sep 2022 19:23:39 +0200
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        dri-devel@lists.freedesktop.org,
        Bjorn Andersson <andersson@kernel.org>,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Sean Paul <sean@poorly.run>, Rob Herring <robh@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Rob Clark <robdclark@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>
Subject: Re: [PATCH v8 01/12] dt-bindings: display/msm: split qcom,mdss
 bindings
Message-ID: <20220924172339.bebekrawee4ubogv@krzk-bin>
References: <20220924123611.225520-1-dmitry.baryshkov@linaro.org>
 <20220924123611.225520-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220924123611.225520-2-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 24 Sep 2022 15:36:00 +0300, Dmitry Baryshkov wrote:
> Split Mobile Display SubSystem (MDSS) root node bindings to the separate
> yaml file. Changes to the existing (txt) schema:
>  - Added optional "vbif_nrt_phys" region used by msm8996
>  - Made "bus" and "vsync" clocks optional (they are not used by some
>    platforms)
>  - Added optional resets property referencing MDSS reset
>  - Defined child nodes pointing to corresponding reference schema.
>  - Dropped the "lut" clock. It was added to the schema by mistake (it is
>    a part of mdp4 schema, not the mdss).
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/mdp5.txt  |  30 +-
>  .../bindings/display/msm/qcom,mdss.yaml       | 264 ++++++++++++++++++
>  2 files changed, 265 insertions(+), 29 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,mdss.example.dtb: dsi@1a98000: clock-names:0: 'byte' was expected
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,mdss.example.dtb: dsi@1a98000: clock-names:1: 'byte_intf' was expected
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,mdss.example.dtb: dsi@1a98000: clock-names:2: 'pixel' was expected
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,mdss.example.dtb: dsi@1a98000: clock-names:3: 'core' was expected
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,mdss.example.dtb: dsi@1a98000: clock-names:4: 'iface' was expected
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,mdss.example.dtb: dsi@1a98000: clock-names:5: 'bus' was expected
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,mdss.example.dtb: dsi@1a98000: phy-names:0: 'dsi' was expected
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,mdss.example.dtb: dsi@1a98000: 'power-domains' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,mdss.example.dtb: dsi@1a98000: 'operating-points-v2' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1681881

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.
