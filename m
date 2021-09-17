Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2150410007
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Sep 2021 21:50:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344136AbhIQTvs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Sep 2021 15:51:48 -0400
Received: from mail-ot1-f49.google.com ([209.85.210.49]:41881 "EHLO
        mail-ot1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242890AbhIQTu3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Sep 2021 15:50:29 -0400
Received: by mail-ot1-f49.google.com with SMTP id 97-20020a9d006a000000b00545420bff9eso7428659ota.8;
        Fri, 17 Sep 2021 12:49:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=KHJy0wyI5/PftepKbXIy/ND2txN1bzjwZ//2NkNF8as=;
        b=Urb2zU+laX5MsL52B+5fybb1NCSnOQxN0zjVmUr0+4LtyVdIk15IA+Q7Fnz19ZHa8R
         KcY1n8pMEP0Gu96QCq9czjpH3CDysMu+CLMCNR4EBsWTBbE4F49UCkB19VawUDcdcZ8n
         /XI/+i7oYGNOS8n+JpsK8onkkanD1iIa5sFFECIufefpnHMGu76QBewQXdPiL7EC39/w
         vIgJCATr8ZkrjqnZDScnK6WYswrytOm8Q0QrhHYx1h8tH8pmUcJ30CYhvfx3pdOwY6oB
         2OkqqZgP9DrOG8GUsY7l7uQrLTLyq8lTKWsdBzw0U/gVB1jy8ZUGnHB5h9fvIgB+63li
         VJsA==
X-Gm-Message-State: AOAM533fK2yt0oriFm6rEQSIueJRjruqW6Z8OCYVOdXfC1rghz+n0kS5
        N9EJ3vhgMqRiEuuj/UFOXw==
X-Google-Smtp-Source: ABdhPJyDp8E5mLGTTfIiPrq9hWgLnaB2yZfLw8qh2u/XbNMZt+UkKdVsDZutihOWDACtese2v7ySQA==
X-Received: by 2002:a9d:36d:: with SMTP id 100mr10941757otv.237.1631908146826;
        Fri, 17 Sep 2021 12:49:06 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id i1sm1759831oiy.25.2021.09.17.12.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Sep 2021 12:49:05 -0700 (PDT)
Received: (nullmailer pid 2025333 invoked by uid 1000);
        Fri, 17 Sep 2021 19:48:54 -0000
From:   Rob Herring <robh@kernel.org>
To:     Satya Priya <skakit@codeaurora.org>
Cc:     swboyd@chromium.org, Andy Gross <agross@kernel.org>,
        Das Srinagesh <gurus@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org, kgunda@codeaurora.org,
        devicetree@vger.kernel.org, mka@chromium.org,
        David Collins <collinsd@codeaurora.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        Lee Jones <lee.jones@linaro.org>,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
In-Reply-To: <1631875538-22473-2-git-send-email-skakit@codeaurora.org>
References: <1631875538-22473-1-git-send-email-skakit@codeaurora.org> <1631875538-22473-2-git-send-email-skakit@codeaurora.org>
Subject: Re: [PATCH 1/4] dt-bindings: mfd: pm8008: Add pm8008 regulator node
Date:   Fri, 17 Sep 2021 14:48:54 -0500
Message-Id: <1631908134.331615.2025332.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 17 Sep 2021 16:15:35 +0530, Satya Priya wrote:
> Add pm8008-regulator node and example.
> 
> Signed-off-by: Satya Priya <skakit@codeaurora.org>
> ---
>  .../devicetree/bindings/mfd/qcom,pm8008.yaml       | 24 ++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Unknown file referenced: [Errno 2] No such file or directory: '/usr/local/lib/python3.8/dist-packages/dtschema/schemas/regulator/qcom,pm8008-regulator.yaml'
xargs: dt-doc-validate: exited with status 255; aborting
make[1]: *** Deleting file 'Documentation/devicetree/bindings/mfd/qcom,pm8008.example.dt.yaml'
Unknown file referenced: [Errno 2] No such file or directory: '/usr/local/lib/python3.8/dist-packages/dtschema/schemas/regulator/qcom,pm8008-regulator.yaml'
make[1]: *** [scripts/Makefile.lib:385: Documentation/devicetree/bindings/mfd/qcom,pm8008.example.dt.yaml] Error 255
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1441: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1529335

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

