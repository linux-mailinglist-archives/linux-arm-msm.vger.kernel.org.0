Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A64A27B30D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Sep 2020 19:24:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726652AbgI1RYm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Sep 2020 13:24:42 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:43273 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726327AbgI1RYm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Sep 2020 13:24:42 -0400
Received: by mail-ot1-f68.google.com with SMTP id n61so1683134ota.10;
        Mon, 28 Sep 2020 10:24:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WqjG9DRBwfKFJg0LUafPQi/HKKAdsDR9CK0lOC6pnf0=;
        b=r/BTR+J8ra7Vpr726c0QGRvAxZRfuvotTGIOJo/9zWIa+m+GEhANzAfadoXN4mihrw
         HaiGIMH72243JPo1S144sfCyF+zR8f5SFdLg4a0e08XNVABZR0nEV0bovOtM3jDC1LUi
         0AsgmN3kuho6oUvE53Vgds2MrO/Qnz5ZJaUpEmcJTvFT2ic4AVkUPwPmN7IdYZ0KMddo
         hPQ19eNj0/cQw3xu3fiZJr3SgxFbWU88IEt1haC2onTLYWwJ+umT4W33i2WylqHzQ8d4
         C6x2x3Z7W/Drf+K4tJJf6twJnzq2Y0XsB4fxH6DA+1Vbu3jThsylbXPcbChaPdKXN2FP
         ghSQ==
X-Gm-Message-State: AOAM533C06Hwq+ts4lcTn5oNtTiSeFLRWE/cSCV2siAMoO/K/SH9dBLw
        37jUhz2osOhbBB9ouG/JDUX2TZLLphAG
X-Google-Smtp-Source: ABdhPJwpyGGUwyLDEy5HjiCBfDm68LTLVrB7HzQZJohrmCnq5K9pJPkrruYLZFF6qK6tC2WgHBbS5w==
X-Received: by 2002:a05:6830:1e89:: with SMTP id n9mr41449otr.274.1601313881244;
        Mon, 28 Sep 2020 10:24:41 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id j1sm346408oii.5.2020.09.28.10.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 10:24:40 -0700 (PDT)
Received: (nullmailer pid 2931079 invoked by uid 1000);
        Mon, 28 Sep 2020 17:24:39 -0000
Date:   Mon, 28 Sep 2020 12:24:39 -0500
From:   Rob Herring <robh@kernel.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        sboyd@kernel.org, bjorn.andersson@linaro.org,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        mturquette@baylibre.com, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: Add support for LPASS Audio
 Clock Controller
Message-ID: <20200928172439.GA2930708@bogus>
References: <20200925103115.15191-1-srinivas.kandagatla@linaro.org>
 <20200925103115.15191-2-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200925103115.15191-2-srinivas.kandagatla@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 25 Sep 2020 11:31:12 +0100, Srinivas Kandagatla wrote:
> Audio Clock controller is a block inside LPASS which controls
> 2 Glitch free muxes to LPASS codec Macros.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  .../bindings/clock/qcom,audiocc-sm8250.yaml   | 58 +++++++++++++++++++
>  .../clock/qcom,sm8250-lpass-audiocc.h         | 13 +++++
>  2 files changed, 71 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,audiocc-sm8250.yaml
>  create mode 100644 include/dt-bindings/clock/qcom,sm8250-lpass-audiocc.h
> 


My bot found errors running 'make dt_binding_check' on your patch:

Error: Documentation/devicetree/bindings/clock/qcom,audiocc-sm8250.example.dts:25.30-31 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:342: Documentation/devicetree/bindings/clock/qcom,audiocc-sm8250.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1366: dt_binding_check] Error 2


See https://patchwork.ozlabs.org/patch/1371157

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

