Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A55436BAF1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Apr 2021 23:04:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235396AbhDZVFb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Apr 2021 17:05:31 -0400
Received: from mail-oi1-f173.google.com ([209.85.167.173]:45920 "EHLO
        mail-oi1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233483AbhDZVFa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Apr 2021 17:05:30 -0400
Received: by mail-oi1-f173.google.com with SMTP id n184so31749539oia.12;
        Mon, 26 Apr 2021 14:04:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=9sYpBbEdCsZlXn6s0zm9BTjvqWIX5oqEQY81N9nJXUQ=;
        b=oA/oNryQGgSFRdJnpVC4OEV7V+AuizHsv7SonOalZLPSBiyUmxDAiiwaDQ3j8IQDax
         ot+XwDbQK4w7z1XcOBMgy9jZ7B+wV375lR/R+jmWb0gRuoe2ir3qaCQwa+d/l1rrxfPd
         NqZbYJ1Zk3LrM3MxyES/Kmfno3nKVHMF6sza+tyw3O7C348XeXzmr8rNvhaNSmdLaJaP
         EsYoE1keSOI7EI83XWS/NQcXtbhIjKI2EeWDcf2kH+0Vr8zFwPJozUASrE1aCHThC3is
         tNRtbWnSmvEG9ZRZ/uAh3DyQT7w84OREjIR5LS+C30EugkL2RZXuXD/oMrVsIjFS1xTY
         9kLQ==
X-Gm-Message-State: AOAM533f7k89hUoN39ZUECDIeyHKtTUzjI6qWkPZLi3+UTuXJE2TZPCJ
        R4h1ubFr9+rykyRPY52+Qw==
X-Google-Smtp-Source: ABdhPJzKYcM9Xr8ii7oWngd0BsINs7L82hbm7wSvPZPLlsusNDqVR+RyLs2yFTyFBTRoVpprcsa/ew==
X-Received: by 2002:aca:5789:: with SMTP id l131mr707651oib.164.1619471087324;
        Mon, 26 Apr 2021 14:04:47 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id i13sm3749245otp.41.2021.04.26.14.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Apr 2021 14:04:46 -0700 (PDT)
Received: (nullmailer pid 4086058 invoked by uid 1000);
        Mon, 26 Apr 2021 21:04:43 -0000
From:   Rob Herring <robh@kernel.org>
To:     Rajeev Nandan <rajeevny@codeaurora.org>
Cc:     dianders@chromium.org, dri-devel@lists.freedesktop.org,
        hoegsberg@chromium.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        abhinavk@codeaurora.org, mkrishn@codeaurora.org,
        seanpaul@chromium.org, devicetree@vger.kernel.org,
        kalyan_t@codeaurora.org
In-Reply-To: <1619416756-3533-2-git-send-email-rajeevny@codeaurora.org>
References: <1619416756-3533-1-git-send-email-rajeevny@codeaurora.org> <1619416756-3533-2-git-send-email-rajeevny@codeaurora.org>
Subject: Re: [v3 1/2] dt-bindings: backlight: add DisplayPort aux backlight
Date:   Mon, 26 Apr 2021 16:04:43 -0500
Message-Id: <1619471083.447682.4086057.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 26 Apr 2021 11:29:15 +0530, Rajeev Nandan wrote:
> Add bindings for DisplayPort aux backlight driver.
> 
> Changes in v2:
> - New
> 
> Signed-off-by: Rajeev Nandan <rajeevny@codeaurora.org>
> ---
>  .../bindings/leds/backlight/dp-aux-backlight.yaml  | 49 ++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/dp-aux-backlight.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/leds/backlight/dp-aux-backlight.example.dts:22.38-39 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:377: Documentation/devicetree/bindings/leds/backlight/dp-aux-backlight.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1414: dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1470203

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

