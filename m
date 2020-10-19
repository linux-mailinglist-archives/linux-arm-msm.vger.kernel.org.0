Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02F63292923
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Oct 2020 16:18:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729096AbgJSOSw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Oct 2020 10:18:52 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:33646 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728311AbgJSOSv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Oct 2020 10:18:51 -0400
Received: by mail-ot1-f68.google.com with SMTP id t15so10617468otk.0;
        Mon, 19 Oct 2020 07:18:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Z24gVtSLB9rMmRuyKZCmyYJQn2Pd/8+qOLiSmvSdEls=;
        b=JGRvv6+oXNGOBRmRBR7xjui9dlZ9CT0H/dnOPQC3Dvfw86GU5ZKdFyybRce0bWyf/A
         olmRhckkU2JC6CMTdsrcd3b4mN7bbM94C6hl0woZlMPgrgjEKJMalM+N8AkTY2Ck+cYC
         cZv05etvxF6Lijnmv3aLbfYxwSOv2tOpLwbHRCa0tMa0xU0kjdVjFNgVxq+sKSUZEv8o
         l/R3mrcgTMhpLgkQbZr1LHm/7O+Eq8zZgxrO0fePP3JX0psIn5fRPOc6hG3WHQ1c3af1
         S2xJtB6G4o+mOSJndXqC68XJ9vm0UmX9itPUkyg38Xui0sb8PRhhaMcHHDJvxBvGkoG3
         XatQ==
X-Gm-Message-State: AOAM530iHj32ZFlAv3/xDiEK3SC4QYeBHG67qNtXzGVw8avtWfuH55wc
        ffiMZXpJUb4H3XASoWVbFg==
X-Google-Smtp-Source: ABdhPJzckhvgxw/qMc6EYqyurH71faTEzRho8uZp+h9D0opQzmdm2mlLotPw1M327xXTwCWLmrS5/A==
X-Received: by 2002:a9d:61:: with SMTP id 88mr143344ota.109.1603117130528;
        Mon, 19 Oct 2020 07:18:50 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t84sm3580828oih.35.2020.10.19.07.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 07:18:49 -0700 (PDT)
Received: (nullmailer pid 3036284 invoked by uid 1000);
        Mon, 19 Oct 2020 14:18:48 -0000
Date:   Mon, 19 Oct 2020 09:18:48 -0500
From:   Rob Herring <robh@kernel.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     devicetree@vger.kernel.org, bjorn.andersson@linaro.org,
        robh+dt@kernel.org, linux-kernel@vger.kernel.org, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, mturquette@baylibre.com,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: clock: Add support for LPASS Audio
 Clock Controller
Message-ID: <20201019141848.GA3035809@bogus>
References: <20201016141241.5839-1-srinivas.kandagatla@linaro.org>
 <20201016141241.5839-2-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201016141241.5839-2-srinivas.kandagatla@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 16 Oct 2020 15:12:38 +0100, Srinivas Kandagatla wrote:
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


See https://patchwork.ozlabs.org/patch/1383373

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

