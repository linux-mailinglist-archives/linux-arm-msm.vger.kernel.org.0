Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A86D3270360
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Sep 2020 19:29:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726550AbgIRR3m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Sep 2020 13:29:42 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:35352 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726495AbgIRR3k (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Sep 2020 13:29:40 -0400
Received: by mail-io1-f65.google.com with SMTP id r9so7697402ioa.2;
        Fri, 18 Sep 2020 10:29:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Ny9tDH+nBQM6mJBprxM+c/wU9flvPjzymRh3lT0/kVk=;
        b=KCwsV9b57CDbeQJu92upDEnQtRu71xe1oDAp0ENqkol2dpGViXlfateHKi4D2yZ+pp
         RoxEBp9J65zG8atyEwO3lSLc+cpS3U/FdF3e1J+BO11Lu3S/6lwkjjAqMFKEOYB72iqT
         sl2jBeoLZQ9UEIP0T4MrEBbn/dqCO3hvPLm3Gf3nSNY3cLCbp8f5kU07P6+hRx2HUVo+
         HQq7tOtw8FZppcKfqHBh/NUO3I886sGdk1of72g4iqaKKqRoui1VJJtM3PVxSVCVwdnQ
         ankKaxwcAAKoRYoBc1A8aLkbgSkEbRn0PGYc3TVmIuFQz2DCGRHALWDqLTzPllZtm9RK
         s+1w==
X-Gm-Message-State: AOAM533SyHh7oqzmx3dy8YeMc77rfeG9eV2fvnLvAWy1CMHAE6wKuXb1
        hXACySwxVTyHjyhHH5PH1lKBx0T2GnwP
X-Google-Smtp-Source: ABdhPJzLozBMYhtZYDqrpXIyir/PmouLlphXJhKeqvt/SJfp+lOEGVYC0ThUZCFwtGy6Xwq7htWmng==
X-Received: by 2002:a05:6602:240c:: with SMTP id s12mr28010535ioa.5.1600450177899;
        Fri, 18 Sep 2020 10:29:37 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id a20sm1987472ilq.57.2020.09.18.10.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2020 10:29:37 -0700 (PDT)
Received: (nullmailer pid 3827896 invoked by uid 1000);
        Fri, 18 Sep 2020 17:29:36 -0000
Date:   Fri, 18 Sep 2020 11:29:36 -0600
From:   Rob Herring <robh@kernel.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        sboyd@kernel.org, mturquette@baylibre.com,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        robh+dt@kernel.org, bjorn.andersson@linaro.org
Subject: Re: [PATCH 2/4] dt-bindings: clock: Add support for LPASS Always ON
 Controller
Message-ID: <20200918172936.GA3827721@bogus>
References: <20200917132850.7730-1-srinivas.kandagatla@linaro.org>
 <20200917132850.7730-3-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200917132850.7730-3-srinivas.kandagatla@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 17 Sep 2020 14:28:48 +0100, Srinivas Kandagatla wrote:
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


See https://patchwork.ozlabs.org/patch/1366126

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

