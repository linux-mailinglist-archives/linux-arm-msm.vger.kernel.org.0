Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEA9749332A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jan 2022 03:55:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351099AbiASCzz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Jan 2022 21:55:55 -0500
Received: from mail-oi1-f173.google.com ([209.85.167.173]:40675 "EHLO
        mail-oi1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232983AbiASCzz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Jan 2022 21:55:55 -0500
Received: by mail-oi1-f173.google.com with SMTP id bx18so1966104oib.7;
        Tue, 18 Jan 2022 18:55:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=gWjvLvQKqG87eCtKAWR8mJd0SzTtFBqwrDZXd6cPHFM=;
        b=ZlcnFWD0obV4KHKdwryhk1IGgz4ONMi/Y5GELwoyytBQnFNghcZwO9tj6k9/iIHppE
         kugwQlluIBKSS1LW59C9HVTbkeo9F2dqQ/P96MmR8W4kK4XFoA0Y9/Z1Aps3blNLoI9a
         UTMKSbrOqcAQ4acCB5AKrkC9pZOEjIB7SxulLFfgQxabrP2kg2E0FE2JzsGQpy4dxo7w
         N74g0uHABPZ+fNl3X75IzVDfUne91P1enEaMDh1wzmlbGVUDYYKfY8wwzVNDUOmZq+RR
         45phkRpODhUmpgl7DevPtVvoTe9ZkNoiyZmFuiIPX5O3aEaAsqMV/W/KoeRAF5vAQgTc
         kNbQ==
X-Gm-Message-State: AOAM531vL0ideWlK/ybF82LNpVrKQ4LgJr09snENS9G35m3kjfkuF4C7
        WihdUkl/KhMinp24Qz/GMQ==
X-Google-Smtp-Source: ABdhPJzt0HX0H5IspL5Mwz1wTyXRAg5G67yYxFxUFYBiDAM3yMEWIBGL/me9onXebe2mYb6A0kLtrw==
X-Received: by 2002:a05:6808:b38:: with SMTP id t24mr1335742oij.25.1642560954835;
        Tue, 18 Jan 2022 18:55:54 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id b24sm7976693oti.68.2022.01.18.18.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jan 2022 18:55:54 -0800 (PST)
Received: (nullmailer pid 2537489 invoked by uid 1000);
        Wed, 19 Jan 2022 02:55:53 -0000
From:   Rob Herring <robh@kernel.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     bjorn.andersson@linaro.org, devicetree@vger.kernel.org,
        dmitry.baryshkov@linaro.org, dri-devel@lists.freedesktop.org,
        robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        robdclark@gmail.com, sean@poorly.run
In-Reply-To: <1642520854-32196-2-git-send-email-loic.poulain@linaro.org>
References: <1642520854-32196-1-git-send-email-loic.poulain@linaro.org> <1642520854-32196-2-git-send-email-loic.poulain@linaro.org>
Subject: Re: [PATCH 2/2] dt-bindings: msm: disp: add yaml schemas for QCM2290 DPU bindings
Date:   Tue, 18 Jan 2022 20:55:53 -0600
Message-Id: <1642560953.410200.2537488.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 18 Jan 2022 16:47:34 +0100, Loic Poulain wrote:
> QCM2290 MSM Mobile Display Subsystem (MDSS) encapsulates sub-blocks
> like DPU display controller, DSI etc. Add YAML schema for DPU device
> tree bindings
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
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
make[1]: *** [scripts/Makefile.lib:373: Documentation/devicetree/bindings/display/msm/dpu-qcm2290.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1413: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1581387

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

