Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B20373F08C7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Aug 2021 18:14:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229531AbhHRQOv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Aug 2021 12:14:51 -0400
Received: from mail-ot1-f49.google.com ([209.85.210.49]:47062 "EHLO
        mail-ot1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229623AbhHRQOu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Aug 2021 12:14:50 -0400
Received: by mail-ot1-f49.google.com with SMTP id v33-20020a0568300921b0290517cd06302dso4675955ott.13;
        Wed, 18 Aug 2021 09:14:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=yauHXJCxHoVp5aXAAes27TDBGWrBr9jVMGaMrDiigz8=;
        b=ft3gWFnaA/Sa9bp8mAkTvUIW3Q4VQq3A6L8Ev4i2HwsyXmZRZI0ljgCnpr3o+drVMS
         /ny+WxTOZd04IFTP0LKhomrsFeEv28OZ8YvCngkRKsU06uh/b8Bc0PFz09OQTP3p+5qu
         eOOh5y0ZTAn8yajOccIyXO8UgVBSWi4HXcKR3DBjUWE52gMDJOEpouNqR2csoMRUYJYS
         DSNAgaw51GzXRwFDb777KCTKTN6EJhrjBM1j4IIMPozeb+s/Pgh8HgnWjXzov8BRhits
         2iEj9CGdJ+7cviJNgkEytJ6KKNRorZCRFoGynLwyFF3UiydmEBk7hZ4pwNHKqldJZLGc
         PHcA==
X-Gm-Message-State: AOAM532v0x3tUgU/JdJZ2L4WG25MnkOhbv8xAidRDc871hzFbwUe2f9Y
        KM1umi1xplXMj5ZxA+qvew==
X-Google-Smtp-Source: ABdhPJzzOuQIH8PiEiqnXaNNItIPBPXASTbgrSCmxUFvf7DxF43cogknZxmC20Q63vL+nLiIp/5AIg==
X-Received: by 2002:a05:6830:2807:: with SMTP id w7mr7528360otu.70.1629303254775;
        Wed, 18 Aug 2021 09:14:14 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 4sm97281oil.38.2021.08.18.09.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 09:14:14 -0700 (PDT)
Received: (nullmailer pid 2696510 invoked by uid 1000);
        Wed, 18 Aug 2021 16:14:13 -0000
From:   Rob Herring <robh@kernel.org>
To:     Krishna Manikandan <mkrishn@codeaurora.org>
Cc:     rajeevny@codeaurora.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, bjorn.andersson@linaro.org,
        kalyan_t@codeaurora.org, robh+dt@kernel.org,
        abhinavk@codeaurora.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        linux-arm-msm@vger.kernel.org, khsieh@codeaurora.org,
        swboyd@chromium.org, sbillaka@codeaurora.org
In-Reply-To: <1629282424-4070-1-git-send-email-mkrishn@codeaurora.org>
References: <1629282424-4070-1-git-send-email-mkrishn@codeaurora.org>
Subject: Re: [PATCH v1 1/4] dt-bindings: msm: add DT bindings for sc7280
Date:   Wed, 18 Aug 2021 11:14:13 -0500
Message-Id: <1629303253.016460.2696509.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 18 Aug 2021 15:57:01 +0530, Krishna Manikandan wrote:
> MSM Mobile Display Subsystem (MDSS) encapsulates sub-blocks
> like DPU display controller, DSI, EDP etc. Add required DPU
> device tree bindings for SC7280.
> 
> Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
> ---
>  .../bindings/display/msm/dpu-sc7280.yaml           | 228 +++++++++++++++++++++
>  1 file changed, 228 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/display/msm/dpu-sc7280.example.dts:19:18: fatal error: dt-bindings/clock/qcom,dispcc-sc7280.h: No such file or directory
   19 |         #include <dt-bindings/clock/qcom,dispcc-sc7280.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:380: Documentation/devicetree/bindings/display/msm/dpu-sc7280.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1419: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1517976

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

