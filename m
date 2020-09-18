Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39FE527035D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Sep 2020 19:29:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726384AbgIRR3h (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Sep 2020 13:29:37 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:43315 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726495AbgIRR3V (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Sep 2020 13:29:21 -0400
Received: by mail-il1-f193.google.com with SMTP id a19so6968845ilq.10;
        Fri, 18 Sep 2020 10:29:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Zp/UgCO4yesf32LjMFW5Twkm/7ZCg9X5k+hMqt07GWE=;
        b=mAweGh+Mi8cf0Mh95dGkIFAFAvWVyVKcAv+xi4oN5e3O/sakqvuaiWQsRP8TmzNZIe
         lVSn1Bfjv7dLJk2SOi1t02wIK42/ZtMT6VJWNkYEgjmi37mm3iqPyLLmRx5WjSqMxMVp
         ABHXlyWRplAyfol5YHk9/QK/GkEICuiae2sQX4LrXXeIdbY6lvLXkNEffnxhYcL+fkwI
         w/WpVzdJyAq+1+C1I/rJCEa33hT5Gl/UuhSzod8nDTeWdM/O4FxCnaUi03+j9L2Y3/io
         3f7qaK2jtnnFl8sROiQE3MKU7rOBbpcVWI4IcBfw0dvKy2pjMtVn4K18np827wNaNZez
         hO3w==
X-Gm-Message-State: AOAM532pJ8zjqyawnMDX2HFu8zSZtt9q/ZOFVl48D+sp8bAX0c9vL4i+
        MqAziB4IhACrucBXrhJ96Yz6dGHbID8k
X-Google-Smtp-Source: ABdhPJxjQh+EEtw5uCfwtCt8JutOTg7mAqFPtFABcDPIUIAA/b1d2ssI/Aef7xdXn145949h96YVLg==
X-Received: by 2002:a92:d48b:: with SMTP id p11mr26390866ilg.69.1600450159255;
        Fri, 18 Sep 2020 10:29:19 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id o15sm1899367ilc.41.2020.09.18.10.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2020 10:29:18 -0700 (PDT)
Received: (nullmailer pid 3827355 invoked by uid 1000);
        Fri, 18 Sep 2020 17:29:17 -0000
Date:   Fri, 18 Sep 2020 11:29:17 -0600
From:   Rob Herring <robh@kernel.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     sboyd@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, mturquette@baylibre.com,
        bjorn.andersson@linaro.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: clock: Add support for LPASS Audio
 Clock Controller
Message-ID: <20200918172917.GA3827183@bogus>
References: <20200917132850.7730-1-srinivas.kandagatla@linaro.org>
 <20200917132850.7730-2-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200917132850.7730-2-srinivas.kandagatla@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 17 Sep 2020 14:28:47 +0100, Srinivas Kandagatla wrote:
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


See https://patchwork.ozlabs.org/patch/1366127

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

