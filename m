Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C940292932
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Oct 2020 16:21:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728970AbgJSOVn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Oct 2020 10:21:43 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:38623 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728311AbgJSOVn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Oct 2020 10:21:43 -0400
Received: by mail-ot1-f68.google.com with SMTP id i12so10588335ota.5;
        Mon, 19 Oct 2020 07:21:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=12l3M2TcKuloid6NoQYFwjNiQUKK0pB5u9CaECZ0MIg=;
        b=mHZpLha75oDW7QFc3w4LujIhKCfnP155o+pNWAvoQye/iSgH3zFLIHKpPbCM8Nd6+k
         LV2hXSGRoQ2Ah/mruwmkulmzqG+/8Hyvv/0m2qHQAqJyelpuoqxrhhZr5fAFORvm+EhR
         nnkS2KIRpHdrHxmAggA2A+ko2ype6N52F6EoG6YnRiXED5jIHJLcCZP1K/ZCJV6a+Hkp
         Q9v/19mJSVB8N0VPSwdVE/Yvy2bIT3zMlXXAwjemRDDNviA5U9AWVpxz8uIJxOsYqNzA
         4wddJRL2PU7mrCcuVMDwbL3eQEnJ3T2sTrpkML0+wMnqbZRYYv33cF2JngKmyRZKZhNW
         5EuQ==
X-Gm-Message-State: AOAM532OyflUCCQotgZwtegkswjnnnG+Z+/NM7/HGmfM6nr3nLy5JAEP
        8HPCpQnzhf4LRWC0KCqF+A==
X-Google-Smtp-Source: ABdhPJwUgb6IMG5++/5tCBbcC6g5JzsG+i38bL077Cp+wDdLPp0NyvDVE1q8HJYLs7/QT32gopDQDg==
X-Received: by 2002:a9d:2947:: with SMTP id d65mr143936otb.219.1603117302027;
        Mon, 19 Oct 2020 07:21:42 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id u125sm3611745oif.21.2020.10.19.07.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 07:21:40 -0700 (PDT)
Received: (nullmailer pid 3040360 invoked by uid 1000);
        Mon, 19 Oct 2020 14:21:40 -0000
Date:   Mon, 19 Oct 2020 09:21:40 -0500
From:   Rob Herring <robh@kernel.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        sboyd@kernel.org, mturquette@baylibre.com,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org
Subject: Re: [PATCH v3 2/4] dt-bindings: clock: Add support for LPASS Always
 ON Controller
Message-ID: <20201019142140.GA3040103@bogus>
References: <20201016141241.5839-1-srinivas.kandagatla@linaro.org>
 <20201016141241.5839-3-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201016141241.5839-3-srinivas.kandagatla@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 16 Oct 2020 15:12:39 +0100, Srinivas Kandagatla wrote:
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


See https://patchwork.ozlabs.org/patch/1383375

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

