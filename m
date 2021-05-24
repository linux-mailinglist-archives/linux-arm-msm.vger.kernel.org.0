Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EDDA38F503
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 May 2021 23:39:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233060AbhEXVlI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 May 2021 17:41:08 -0400
Received: from mail-oi1-f175.google.com ([209.85.167.175]:34499 "EHLO
        mail-oi1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232547AbhEXVlH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 May 2021 17:41:07 -0400
Received: by mail-oi1-f175.google.com with SMTP id u11so28374580oiv.1;
        Mon, 24 May 2021 14:39:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=oZgYZTZUD5+APBZoaT6l8ZwbOZbqbgSkGLzVf/tRBGA=;
        b=tuUw7U+ItT4IJoN5Q/l+/A8NYQYXlaxLu7Xj1ufISMOOdXKBUNAAN+24K8TkejlCG8
         4FkKuJhZc79psds/WpPYY8Jxyxbp3xQYeF5a66taK+ZVPr/IPBVEPVJoUhJnH//XeCXd
         nVg9fblwc5nMBddipLX5WRoIGsVC1NGBPLSaxfOB+mwi5lYt9PLfkMloZFUwhnmyS6wo
         KoCmrbl8QyBGC7w2pUzk6jUqm0m+E8Zy/SKCNNqqbvW7yuVq8vAPqpWpY7Zb4WQKaiPH
         Q35SwCztPUOuq6ogAUHbeAJYBJGm/dK9RDERVQljVBT8klyYrgS3G0WfwW9cJ3MDk+H8
         3pfQ==
X-Gm-Message-State: AOAM531vCskIiJpdyfXTAWqFQqGjFOGBXTn29oapmIu+809QKn37zU83
        tXWf0h2q1/sFdjTlvBnLGg==
X-Google-Smtp-Source: ABdhPJwzD4unQyBP4EbhN+KSVb7mCjgNBOrrwEZLKwwF2vGlsNzBa3Otszl7AocZmk/cI829T8E5Kw==
X-Received: by 2002:aca:2115:: with SMTP id 21mr4966103oiz.12.1621892377488;
        Mon, 24 May 2021 14:39:37 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id e21sm2919793oie.32.2021.05.24.14.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 14:39:36 -0700 (PDT)
Received: (nullmailer pid 1190594 invoked by uid 1000);
        Mon, 24 May 2021 21:39:35 -0000
From:   Rob Herring <robh@kernel.org>
To:     Martin Botka <martin.botka@somainline.org>
Cc:     konrad.dybcio@somainline.org, linux-arm-msm@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        angelogioacchino.delregno@somainline.org,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        marijn.suijten@somainline.org
In-Reply-To: <20210523211016.726736-1-martin.botka@somainline.org>
References: <20210523211016.726736-1-martin.botka@somainline.org>
Subject: Re: [PATCH V2 1/2] dt-bindings: clk: qcom: gcc-sm6125: Document SM6125 GCC driver
Date:   Mon, 24 May 2021 16:39:35 -0500
Message-Id: <1621892375.408287.1190593.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 23 May 2021 23:10:13 +0200, Martin Botka wrote:
> Document the newly added SM6125 GCC driver.
> 
> Signed-off-by: Martin Botka <martin.botka@somainline.org>
> ---
> Changes in V2:
> Add commit description.
>  .../bindings/clock/qcom,gcc-sm6125.yaml       | 72 +++++++++++++++++++
>  1 file changed, 72 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sm6125.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/clock/qcom,gcc-sm6125.example.dts:27.28-29 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:380: Documentation/devicetree/bindings/clock/qcom,gcc-sm6125.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1416: dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1482526

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

