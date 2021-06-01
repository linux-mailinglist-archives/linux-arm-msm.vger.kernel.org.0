Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5108397445
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jun 2021 15:32:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233925AbhFANd5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Jun 2021 09:33:57 -0400
Received: from mail-oi1-f176.google.com ([209.85.167.176]:33294 "EHLO
        mail-oi1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234041AbhFANd4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Jun 2021 09:33:56 -0400
Received: by mail-oi1-f176.google.com with SMTP id b25so15523730oic.0;
        Tue, 01 Jun 2021 06:32:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=sUvFSbu0LjfUEV8j0+FO3g9Nw0MVO+tbGa4afn92YVM=;
        b=l4aJDF2f84s6OwTDg7ekXNVatCHWbL+QdFuV2ZPqnF5Bl6CMNyNrqA7UtrwyXwgsWS
         VXnZ+Jdj39FFKQWMNl4fcqaq2s0dEjSaMMiNm/8+4e5k6FWwV2h6yfTWXb8T66dNYvUs
         tSKxOXwIe1oW/IzyGovM2GoJ/Q4Yxllw/Pp+7NVN7YyfiY4th2EuPPyZy8bMeO0jUbwQ
         uAfpN4BuZgWcC//RdkstyVgHglfW1TQNs6nRc4Tw/igrTYpKfDPBtDkBdpFUq2uXyDY1
         IBz18iHSR6FazTkr+XoypwcD249A31B4ltrF1QPBkguLRY5j6kkFWgijX7Q6/2phMFua
         JAOQ==
X-Gm-Message-State: AOAM5316wMSJ1tgvTYAEXBxzaRQ9XnGTaL1KSNvsKA2li8GUNSazdwL7
        aAtlKFri2IAYyRJCEUQDcg==
X-Google-Smtp-Source: ABdhPJxIQ4UNHJiSMIQurjA4OqwlMFcM1ZeS8iht1dzB0oheLg8yrxOc5sZ0cAHYtcMx3as29NSRpA==
X-Received: by 2002:a05:6808:4cf:: with SMTP id a15mr3193906oie.78.1622554334167;
        Tue, 01 Jun 2021 06:32:14 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id m66sm3438918oia.28.2021.06.01.06.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 06:32:13 -0700 (PDT)
Received: (nullmailer pid 242371 invoked by uid 1000);
        Tue, 01 Jun 2021 13:32:10 -0000
From:   Rob Herring <robh@kernel.org>
To:     Rajeev Nandan <rajeevny@codeaurora.org>
Cc:     robh+dt@kernel.org, mkrishn@codeaurora.org,
        kalyan_t@codeaurora.org, linux-kernel@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        abhinavk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        jonathan@marek.ca, dri-devel@lists.freedesktop.org,
        robdclark@gmail.com, sean@poorly.run
In-Reply-To: <1622468035-8453-2-git-send-email-rajeevny@codeaurora.org>
References: <1622468035-8453-1-git-send-email-rajeevny@codeaurora.org> <1622468035-8453-2-git-send-email-rajeevny@codeaurora.org>
Subject: Re: [v1 1/3] dt-bindings: msm/dsi: Add yaml schema for 7nm DSI PHY
Date:   Tue, 01 Jun 2021 08:32:10 -0500
Message-Id: <1622554330.075037.242370.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 31 May 2021 19:03:53 +0530, Rajeev Nandan wrote:
> Add YAML schema for the device tree bindings for MSM 7nm DSI PHY driver.
> 
> Cc: Jonathan Marek <jonathan@marek.ca>
> Signed-off-by: Rajeev Nandan <rajeevny@codeaurora.org>
> ---
>  .../bindings/display/msm/dsi-phy-7nm.yaml          | 68 ++++++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Unknown file referenced: [Errno 2] No such file or directory: '/usr/local/lib/python3.8/dist-packages/dtschema/schemas/display/msm/dsi-phy-common.yaml'
xargs: dt-doc-validate: exited with status 255; aborting
Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.example.dts:19:18: fatal error: dt-bindings/clock/qcom,dispcc-sc7280.h: No such file or directory
   19 |         #include <dt-bindings/clock/qcom,dispcc-sc7280.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:380: Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1416: dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1485686

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

