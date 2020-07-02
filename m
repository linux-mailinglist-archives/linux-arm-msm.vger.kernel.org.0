Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6991212DFB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2020 22:43:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726035AbgGBUni (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Jul 2020 16:43:38 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:34711 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725915AbgGBUni (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Jul 2020 16:43:38 -0400
Received: by mail-io1-f65.google.com with SMTP id q74so6762638iod.1;
        Thu, 02 Jul 2020 13:43:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9CKNLJgI2E2dmsPxA89wHeetvVZ0mTwZVWuoJtaPM1Q=;
        b=JF3CozeEEKEU5ux7KtdB82EsDIcBTR7hw82cNZDvKMgz2jGRgoU8gJdiuxRdPRfLzk
         TMMg9IYXgHCxZsJwReuwSAOCqcEzOuqXZfA1OmDsboCvjjISVaaUnd11bmp05yirWHub
         atzIdyJIRMO9J47fIuJXRmJF1ylmaggCerbisYh4ag3L9HaWgABC5Xo/J7ldXRv38Agb
         roQkMiy2VpRkOGPWlt4TGJi32NyLY/NbIpVAQNKYgT4M86bT1rxZNycIqU79YpwzJJBi
         j3tSohkeyJlTTJ9BG4i9/L66scU1noTGxIhRCuHFODfz5PPV5/hYi/hrg6Jz2LEtJI2V
         R5Kw==
X-Gm-Message-State: AOAM532CCf+uf4K98SC7xolm3nSE5WEjcRvh8eUyF0OiCfJmo+Et3fqO
        0Lp2YdO/CkkqvOBhkHzzWQ==
X-Google-Smtp-Source: ABdhPJxDkpcg7Zn4SUV67PNen92IBqdZprC/69RObQpyOE8clGJd3InVDF2S7lRIlvsVgWUIdYReIQ==
X-Received: by 2002:a02:b18b:: with SMTP id t11mr31938785jah.46.1593722616772;
        Thu, 02 Jul 2020 13:43:36 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id w4sm4979794ioc.23.2020.07.02.13.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2020 13:43:36 -0700 (PDT)
Received: (nullmailer pid 1658496 invoked by uid 1000);
        Thu, 02 Jul 2020 20:43:35 -0000
Date:   Thu, 2 Jul 2020 14:43:35 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [RESEND PATCH v2 06/13] dt-bindings: clock: Introduce SM8150
 QCOM Graphics clock bindings
Message-ID: <20200702204335.GA1657238@bogus>
References: <20200629211725.2592-1-jonathan@marek.ca>
 <20200629211725.2592-7-jonathan@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200629211725.2592-7-jonathan@marek.ca>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 29 Jun 2020 17:17:12 -0400, Jonathan Marek wrote:
> Add device tree bindings for graphics clock controller for
> Qualcomm Technology Inc's SM8150 SoCs.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  .../bindings/clock/qcom,sm8150-gpucc.yaml     | 74 +++++++++++++++++++
>  include/dt-bindings/clock/qcom,gpucc-sm8150.h | 40 ++++++++++
>  2 files changed, 114 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm8150-gpucc.yaml
>  create mode 100644 include/dt-bindings/clock/qcom,gpucc-sm8150.h
> 


My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/qcom,sm8150-gpucc.yaml: maintainers:0: None is not of type 'string'
Documentation/devicetree/bindings/Makefile:20: recipe for target 'Documentation/devicetree/bindings/clock/qcom,sm8150-gpucc.example.dts' failed
make[1]: *** [Documentation/devicetree/bindings/clock/qcom,sm8150-gpucc.example.dts] Error 1
make[1]: *** Waiting for unfinished jobs....
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/qcom,sm8150-gpucc.yaml: ignoring, error in schema: maintainers: 0
warning: no schema found in file: ./Documentation/devicetree/bindings/clock/qcom,sm8150-gpucc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/qcom,sm8150-gpucc.yaml: ignoring, error in schema: maintainers: 0
warning: no schema found in file: ./Documentation/devicetree/bindings/clock/qcom,sm8150-gpucc.yaml
Makefile:1347: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2


See https://patchwork.ozlabs.org/patch/1319320

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

