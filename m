Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9FBC36BAF3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Apr 2021 23:04:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235559AbhDZVFf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Apr 2021 17:05:35 -0400
Received: from mail-ot1-f50.google.com ([209.85.210.50]:44679 "EHLO
        mail-ot1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234864AbhDZVFd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Apr 2021 17:05:33 -0400
Received: by mail-ot1-f50.google.com with SMTP id 5-20020a9d09050000b029029432d8d8c5so27494256otp.11;
        Mon, 26 Apr 2021 14:04:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=FtessfYc03DQoBjcPd5WEoNTx1OLhmyQDLewwAyEq9U=;
        b=fOvfjjRMOJT08zCr+7pFWJ94sZTAbX9kDsDOnltCFWRRI8bcIcuMGfEr3k6ava1QTn
         YUTlMkJFKiGPpdRouQozloDooqlwBe1E+PM9vlPSfcdCWOBwkQLVXBvNozPYP/Mzx5zq
         QqMsNfy786SN/58rGvJ1TgtSQ0wMHoXdiDzcyoxySIVbX4kt5GiOuXCt+iOc/Xga5l/Y
         6jUqQ9GO7V53WXiiP7k/frfDADNBz7f0AaIGr3D0wNkyMcZJifl26ETsPIKBUPzcoF0D
         ceQhJ10leTgt1kTjYSPxSFyE00U3mKgK2NyEZ2T52x7MF3E1hbZ6Rcw8qULuHymGUTgt
         PIwg==
X-Gm-Message-State: AOAM531yMEtYpGcnkp1piln5nqX5asNl+A61ta4NxrmI+VebdvfwmVGh
        m+fPjfrsxRPdK967oPIm4g==
X-Google-Smtp-Source: ABdhPJw5X6mCCavwmflSJT6wORKTWRo8U51+i55x/mCtqix8PbgJRK7qMb4PnugHMVV8ohgxOuGkcg==
X-Received: by 2002:a9d:6b0a:: with SMTP id g10mr6202782otp.87.1619471089543;
        Mon, 26 Apr 2021 14:04:49 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id a21sm226709oop.20.2021.04.26.14.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Apr 2021 14:04:48 -0700 (PDT)
Received: (nullmailer pid 4086060 invoked by uid 1000);
        Mon, 26 Apr 2021 21:04:43 -0000
From:   Rob Herring <robh@kernel.org>
To:     Dikshita Agarwal <dikshita@codeaurora.org>
Cc:     andy.gross@linaro.org, vgarodia@codeaurora.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, stanimir.varbanov@linaro.org,
        robh+dt@kernel.org, mark.rutland@arm.com, david.brown@linaro.org
In-Reply-To: <1619432515-9060-1-git-send-email-dikshita@codeaurora.org>
References: <1619432515-9060-1-git-send-email-dikshita@codeaurora.org>
Subject: Re: [PATCH] dt-bindings: media: venus: Add sc7280 dt schema
Date:   Mon, 26 Apr 2021 16:04:43 -0500
Message-Id: <1619471083.458228.4086059.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 26 Apr 2021 15:51:55 +0530, Dikshita Agarwal wrote:
> Add a schema description for the venus video encoder/decoder on the sc7280.
> 
> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
> ---
>  .../bindings/media/qcom,sc7280-venus.yaml          | 158 +++++++++++++++++++++
>  1 file changed, 158 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/media/qcom,sc7280-venus.example.dts:19:18: fatal error: dt-bindings/clock/qcom,videocc-sc7280.h: No such file or directory
   19 |         #include <dt-bindings/clock/qcom,videocc-sc7280.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:377: Documentation/devicetree/bindings/media/qcom,sc7280-venus.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1414: dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1470241

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

