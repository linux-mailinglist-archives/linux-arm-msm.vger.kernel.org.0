Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30D6644D3E9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Nov 2021 10:19:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232347AbhKKJV5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Nov 2021 04:21:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232516AbhKKJVx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Nov 2021 04:21:53 -0500
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEC19C06127A
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Nov 2021 01:19:03 -0800 (PST)
Received: by mail-pg1-x530.google.com with SMTP id 200so4693769pga.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Nov 2021 01:19:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=W4oON9tVLzbGnMHdSvx5FpIn6WtCPoheg0Qx9WxWbPQ=;
        b=LEI+Zjqvo5YR46BDk0UGfF0Z206KbIE5NfmIdD1sEs38gVeU/TXLHux/kPRlEhpwpm
         CKnJNdTqjFVmVY7fu07F4vbbKnEpeJ2Bj16hCjCBZzOwas3FwxaISJe+xwjqMQMK5s+y
         pn5aWxgxZxZi8BHfshdRinyy3kjTyvS01GXAK/49RSSdNZf/MtmU9QfX2oAXmZwfe/hu
         UdzVBaFmyiNiYcmCL5HKtRanaJEGwvJsntBRkhIKEoM9iXFteOmnIX1xqzYBMHfQZN+8
         ubPkn+Q3+swfnbA88+4LlBqwA0ms/McQxqxEuCObiQiZfQLL7SMnHiyPBRvgKD4NsMoV
         x85Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=W4oON9tVLzbGnMHdSvx5FpIn6WtCPoheg0Qx9WxWbPQ=;
        b=bR/juV1/N3Z1c6KuVgK4ZhacMC6QIPCLIebPGajDxYW/M3RnMzVE5oLTn+z40MREdw
         jWCPZs5NESnjm+Rl9npCgGLh8hop4U8MeyiC2ySfPhaHoE03rgk3eFT3/9Wta+lXzN1C
         X5Xs3w9ick6MYaCg/kf+HUK00lsnQpBgUOb7Z2fw/ns8hsoO6x434v6WcaKMpb5ZUOI3
         iiIqHD1b8Fkj8s29zkSSOwCZStHSYdagqIJKGzd/s3LbPHJ64RfLPJbpIZOMmqzA7uIe
         JUwivIvelQVyRMc3oJ7a1Ct3Djl5+pTy1ATMdrk6Wun/6o+WH0yR1PiX/BnXNBY5qEWS
         NRMw==
X-Gm-Message-State: AOAM533Pa/Q/ss2B3TNt7EY+RGTKCpM5vWtRErp5C633nPRUOwqTAPNG
        GcGYhuo/4DXq5dq3QIMw9rYYSA==
X-Google-Smtp-Source: ABdhPJyAgSAhmt4zPqV47R/uN2HyIfaw0kvLLeTkHktBsw5JQz044Jif9nZJrLioItZgzYZiwiQepQ==
X-Received: by 2002:a62:1c0e:0:b0:4a0:3492:37b5 with SMTP id c14-20020a621c0e000000b004a0349237b5mr5425509pfc.33.1636622343312;
        Thu, 11 Nov 2021 01:19:03 -0800 (PST)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id u10sm2240141pfh.49.2021.11.11.01.19.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Nov 2021 01:19:02 -0800 (PST)
Date:   Thu, 11 Nov 2021 17:18:56 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Rob Herring <robh@kernel.org>
Cc:     linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Georgi Djakov <djakov@kernel.org>
Subject: Re: [PATCH 5/6] dt-bindings: interconnect: Add Qualcomm QCM2290 NoC
 support
Message-ID: <20211111091855.GK7231@dragon>
References: <20211110120716.6401-1-shawn.guo@linaro.org>
 <20211110120716.6401-6-shawn.guo@linaro.org>
 <1636573460.901134.1783738.nullmailer@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1636573460.901134.1783738.nullmailer@robh.at.kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Nov 10, 2021 at 01:44:20PM -0600, Rob Herring wrote:
> On Wed, 10 Nov 2021 20:07:15 +0800, Shawn Guo wrote:
> > Add bindings for Qualcomm QCM2290 Network-On-Chip interconnect devices.
> > 
> > Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> > ---
> >  .../bindings/interconnect/qcom,qcm2290.yaml   | 117 ++++++++++++++++++
> >  .../dt-bindings/interconnect/qcom,qcm2290.h   |  94 ++++++++++++++
> >  2 files changed, 211 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/interconnect/qcom,qcm2290.yaml
> >  create mode 100644 include/dt-bindings/interconnect/qcom,qcm2290.h
> > 
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/interconnect/qcom,qcm2290.example.dts:20:18: fatal error: dt-bindings/clock/qcom,gcc-qcm2290.h: No such file or directory
>    20 |         #include <dt-bindings/clock/qcom,gcc-qcm2290.h>
>       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Thanks for the report!

The header has just landed on mainline tree.  But the binding actually
doesn't need to include it.  I will drop it for the next posting.

Shawn
