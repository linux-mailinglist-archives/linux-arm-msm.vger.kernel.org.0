Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEF0E29D8B0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Oct 2020 23:36:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388225AbgJ1Wft (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Oct 2020 18:35:49 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:40470 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732560AbgJ1Wfr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Oct 2020 18:35:47 -0400
Received: by mail-oi1-f195.google.com with SMTP id m128so1246919oig.7;
        Wed, 28 Oct 2020 15:35:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=j40fXvYMK2w1uYoqbRN/p/K2nSLc7QBgd4j2HeymL48=;
        b=rZxK11zR99v0qURJQX/GHzTQbEUlOkWtuiBfwl1SBRgwr7B11SPJiMCbDIeyFlosdt
         P538eehxjTY+dtWzgXLGm/BsC+zxxj23tWAulV4goETwIHMzddLmby6pAuO9qCJDotM/
         rZnvllcO/z1RvCbCFWvpshW+KfAdtbov9EgRCkDlb8T1rkArypoAHH7Xlz/mmKFwJVDO
         MVZA6oLIOGd5Pgc+2wNtv6/nhqV36Hr31ehIPbZXwYWLkOZMNipj+huWgzkvDvRTAopR
         ufLRRvBJ2lEXWiJLI5SxxVfPP1kRTec35wrpsJ2CQxFy2nY0H5MihgoZ36ecwkxk2Iva
         Dvlw==
X-Gm-Message-State: AOAM532Ak0cMegW5QRAq/PBQ/Gea6vZZLV8z4Tp4DfRrHUKxbrrr320Y
        Yg4YAWo8ZEE3Wr4/sSgX0BFKdM/4qA==
X-Google-Smtp-Source: ABdhPJwoDP3ZNhOt8k6d3nBfKIYb6o3ezWXIw7ASHIquqjVuovgMd+jq/KjXaIEjhCPeoDgQTQdHFw==
X-Received: by 2002:aca:38c6:: with SMTP id f189mr5415873oia.27.1603893201354;
        Wed, 28 Oct 2020 06:53:21 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t5sm2145145oth.16.2020.10.28.06.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 06:53:20 -0700 (PDT)
Received: (nullmailer pid 3927164 invoked by uid 1000);
        Wed, 28 Oct 2020 13:53:19 -0000
Date:   Wed, 28 Oct 2020 08:53:19 -0500
From:   Rob Herring <robh@kernel.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, sboyd@kernel.org,
        robh+dt@kernel.org, mturquette@baylibre.com,
        devicetree@vger.kernel.org, bjorn.andersson@linaro.org
Subject: Re: [RESEND PATCH v3 1/4] dt-bindings: clock: Add support for LPASS
 Audio Clock Controller
Message-ID: <20201028135319.GA3926524@bogus>
References: <20201026120221.18984-1-srinivas.kandagatla@linaro.org>
 <20201026120221.18984-2-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201026120221.18984-2-srinivas.kandagatla@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 26 Oct 2020 12:02:18 +0000, Srinivas Kandagatla wrote:
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

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/clock/qcom,audiocc-sm8250.example.dts:25.30-31 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:342: Documentation/devicetree/bindings/clock/qcom,audiocc-sm8250.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1366: dt_binding_check] Error 2


See https://patchwork.ozlabs.org/patch/1387714

The base for the patch is generally the last rc1. Any dependencies
should be noted.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

