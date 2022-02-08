Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3D144AE372
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Feb 2022 23:23:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1387298AbiBHWV6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Feb 2022 17:21:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386438AbiBHUdj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Feb 2022 15:33:39 -0500
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0716C0613CB;
        Tue,  8 Feb 2022 12:33:36 -0800 (PST)
Received: by mail-oo1-f51.google.com with SMTP id c7-20020a4ad207000000b002e7ab4185d2so37502oos.6;
        Tue, 08 Feb 2022 12:33:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=49stGcYfM5JJEymvDEXu1XITJl6PH59fHc/3Un78U7s=;
        b=b/VVoYjomHFK/XCxbA/PZwmiLcHIQ6QpsXTdKB8WkD+XujrPVQUJnkw3tptjhhyxQF
         5lff2FVnZWue6dopbFp+DsecLxlDesNymJFBJu7MOBbOXHAllkpHTU1LklWR1ElospXh
         HOz16D+FYWfVyZ7t0UXXS17r3shmZXlXpDWP3kfbYPXu1W4VIsCA1a5ZXvb0iKFaLb5z
         rL+PfAuGrb+UA/HKbXVSRHKWc26KFnov0/5Cfcp5Frdh5rmwhD2Hcd7Ke1de9ZhHhDEf
         huWF9qcyJ6RzKX4EIDhqUtGlqcYFT4bvjq+0SBQl/IRquVUXKfrp9D633csYE9n6JJ2U
         CHcw==
X-Gm-Message-State: AOAM533LxQP78P74BDsT9GGKbJ4Sj6Mos0j9vJQMEw4YrnVgAZdjJWVH
        4inRwEvYu4vsfNXDwCjXMXzsmacuQg==
X-Google-Smtp-Source: ABdhPJwOfjv+z5i+6w85Q4rlyDh5g77FKuWYApoxsHccLbOUHyrYVhtmtcMn+/VZ7uEl0eOtEEwyeg==
X-Received: by 2002:a05:6870:4415:: with SMTP id u21mr1023457oah.234.1644352416086;
        Tue, 08 Feb 2022 12:33:36 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id d2sm5784622ook.33.2022.02.08.12.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 12:33:35 -0800 (PST)
Received: (nullmailer pid 2969148 invoked by uid 1000);
        Tue, 08 Feb 2022 20:33:32 -0000
From:   Rob Herring <robh@kernel.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     bjorn.andersson@linaro.org, sean@poorly.run, robdclark@gmail.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, dmitry.baryshkov@linaro.org
In-Reply-To: <1644338552-14426-2-git-send-email-loic.poulain@linaro.org>
References: <1644338552-14426-1-git-send-email-loic.poulain@linaro.org> <1644338552-14426-2-git-send-email-loic.poulain@linaro.org>
Subject: Re: [PATCH v2 2/2] dt-bindings: msm: disp: add yaml schemas for QCM2290 DPU bindings
Date:   Tue, 08 Feb 2022 14:33:32 -0600
Message-Id: <1644352412.089743.2969147.nullmailer@robh.at.kernel.org>
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

On Tue, 08 Feb 2022 17:42:32 +0100, Loic Poulain wrote:
> QCM2290 MSM Mobile Display Subsystem (MDSS) encapsulates sub-blocks
> like DPU display controller, DSI etc. Add YAML schema for DPU device
> tree bindings
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>  v2: no change
> 
>  .../bindings/display/msm/dpu-qcm2290.yaml          | 214 +++++++++++++++++++++
>  1 file changed, 214 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/display/msm/dpu-qcm2290.example.dts:19:18: fatal error: dt-bindings/clock/qcom,dispcc-qcm2290.h: No such file or directory
   19 |         #include <dt-bindings/clock/qcom,dispcc-qcm2290.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:378: Documentation/devicetree/bindings/display/msm/dpu-qcm2290.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1398: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1589984

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

