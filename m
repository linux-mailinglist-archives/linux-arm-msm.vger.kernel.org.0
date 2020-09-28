Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CC6127B31F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Sep 2020 19:26:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726615AbgI1R0D (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Sep 2020 13:26:03 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:33916 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726281AbgI1R0C (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Sep 2020 13:26:02 -0400
Received: by mail-oi1-f193.google.com with SMTP id n2so2201667oij.1;
        Mon, 28 Sep 2020 10:26:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HloElYYvYC1E1YQK+ED9h3Lv0ZR4LSLurL4goAyk4Hk=;
        b=pLFYHDdASG/dPnhn2c8wt0o6qmlYSDcBbeF2f/EUCCE/LwlJwADL4ssbrkpwlZk8GL
         mpKFbSG9NZUEemKr1teuVwnrquULr1IPXS/Ny8hlNzhl4fRzDM/aqCbZ4KGhLwjfwead
         v1MACYwUB2ERLaUoK7qSockU9xkZaumXe0Ifo4MF3ruKfqqQQlk4OLjpG6/skTI2pCgH
         6Flk58A4OIQO/HHfuNEQyn5S81Q9DxzAxCklxdQ/SOpbsY1gG6rOcQ7g3e9cYHkoT9GQ
         eTLQ2Iq4gJkIs8lSOjkQ+Iq5cp/ufl4JBgb8QL36GiDj2g/QI42pbc6kjwnT+cI0RMxO
         SVfg==
X-Gm-Message-State: AOAM533tePkTZvV0hwu072WPonQNggo6M45deiQ4LOTsluduNkI6Ev3S
        T/OwkHqLnVWywTxDFLsx9w==
X-Google-Smtp-Source: ABdhPJySKUlY/EdH9Kz+XTJL/0MRpMu/N57VNY+hnl6b5Pp35NWL85Hf9qx/i6OfGKk8Avb/lUq9vA==
X-Received: by 2002:aca:b4c4:: with SMTP id d187mr1582908oif.21.1601313961816;
        Mon, 28 Sep 2020 10:26:01 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id j1sm347389oig.45.2020.09.28.10.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 10:26:01 -0700 (PDT)
Received: (nullmailer pid 2932956 invoked by uid 1000);
        Mon, 28 Sep 2020 17:26:00 -0000
Date:   Mon, 28 Sep 2020 12:26:00 -0500
From:   Rob Herring <robh@kernel.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org,
        sboyd@kernel.org, robh+dt@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mturquette@baylibre.com
Subject: Re: [PATCH v2 2/4] dt-bindings: clock: Add support for LPASS Always
 ON Controller
Message-ID: <20200928172600.GA2932700@bogus>
References: <20200925103115.15191-1-srinivas.kandagatla@linaro.org>
 <20200925103115.15191-3-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200925103115.15191-3-srinivas.kandagatla@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 25 Sep 2020 11:31:13 +0100, Srinivas Kandagatla wrote:
> Always ON Clock controller is a block inside LPASS which controls
> 1 Glitch free muxes to LPASS codec Macros.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  .../bindings/clock/qcom,aoncc-sm8250.yaml     | 58 +++++++++++++++++++
>  .../clock/qcom,sm8250-lpass-aoncc.h           | 11 ++++
>  2 files changed, 69 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,aoncc-sm8250.yaml
>  create mode 100644 include/dt-bindings/clock/qcom,sm8250-lpass-aoncc.h
> 


My bot found errors running 'make dt_binding_check' on your patch:

Error: Documentation/devicetree/bindings/clock/qcom,aoncc-sm8250.example.dts:25.30-31 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:342: Documentation/devicetree/bindings/clock/qcom,aoncc-sm8250.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1366: dt_binding_check] Error 2


See https://patchwork.ozlabs.org/patch/1371159

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

