Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21C9246DED9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Dec 2021 00:06:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241083AbhLHXKZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Dec 2021 18:10:25 -0500
Received: from mail-oi1-f179.google.com ([209.85.167.179]:33301 "EHLO
        mail-oi1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237479AbhLHXKX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Dec 2021 18:10:23 -0500
Received: by mail-oi1-f179.google.com with SMTP id q25so6325108oiw.0;
        Wed, 08 Dec 2021 15:06:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=ll0hgXB6QKSXcz3wvMWYKBUTCF61BHlIO4zVInsEN+A=;
        b=jFgePZXCy1ptrnT+bSG6HxhCHgX5wBsLRZ709PYCKyT+K45IQ7vQHg7uRLWnEVUgJU
         8quWNEJy7bZQVxWB/EKgpZQTwk/zPbOQxyF0utzU/ZRc7ooF6asLLkaQdas6hUCWm0cq
         U8C5DSfEYHpJB78EyCsnQMS3HF4XSFdo2BNKvVSr1bb/CeDY6fm35vrqJXixZ3IRbmnK
         E6iANigyPYKT3cOf+1JDphGeBMFFuB1FiwZwynbe+nub9ka4hAx+Aa/me+gqv9GkK+V/
         9bm5wn7ppEBG7hQhhgQXQc6pt0KrHOu+Yk0/CsHvcCfnVk8QiwFIidSF/9FE3BA7WP4Z
         1dsA==
X-Gm-Message-State: AOAM532gfWSMnYG7hkmqD50P62DCH9yEv1WNrV6NZUwm7qru+nFidknD
        yyg2FaYvN82col5G8PImFw==
X-Google-Smtp-Source: ABdhPJyKrXjVKkuOfhmRDVvFPcKq3T0vMckZHAdY/lgNGpD5c7GFTTsDFTsrYeAhUYH6UWHNCMt05A==
X-Received: by 2002:a05:6808:1389:: with SMTP id c9mr2380757oiw.55.1639004809800;
        Wed, 08 Dec 2021 15:06:49 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id g2sm835707oic.35.2021.12.08.15.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 15:06:49 -0800 (PST)
Received: (nullmailer pid 596181 invoked by uid 1000);
        Wed, 08 Dec 2021 23:06:46 -0000
From:   Rob Herring <robh@kernel.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     bjorn.andersson@linaro.org, shawn.guo@linaro.org,
        linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, agross@kernel.org
In-Reply-To: <1638983841-23773-2-git-send-email-loic.poulain@linaro.org>
References: <1638983841-23773-1-git-send-email-loic.poulain@linaro.org> <1638983841-23773-2-git-send-email-loic.poulain@linaro.org>
Subject: Re: [PATCH 2/2] dt-bindings: clock: Add qualcomm QCM2290 DISPCC bindings
Date:   Wed, 08 Dec 2021 17:06:46 -0600
Message-Id: <1639004806.181222.596180.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 08 Dec 2021 18:17:21 +0100, Loic Poulain wrote:
> Add device tree bindings for display clock controller on QCM2290 SoCs.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>  .../bindings/clock/qcom,qcm2290-dispcc.yaml        | 87 ++++++++++++++++++++++
>  1 file changed, 87 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.example.dts:19:18: fatal error: dt-bindings/clock/qcom,dispcc-qcm2290.h: No such file or directory
   19 |         #include <dt-bindings/clock/qcom,dispcc-qcm2290.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:373: Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1413: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):


See https://patchwork.ozlabs.org/patch/1565377

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

