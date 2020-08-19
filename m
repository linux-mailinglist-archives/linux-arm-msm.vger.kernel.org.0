Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CAB524A97D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Aug 2020 00:38:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726578AbgHSWiV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Aug 2020 18:38:21 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:38481 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726209AbgHSWiU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Aug 2020 18:38:20 -0400
Received: by mail-io1-f65.google.com with SMTP id h4so399933ioe.5;
        Wed, 19 Aug 2020 15:38:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xPyt+EvrScyVFPN2VNZ0c+hUQv88k7zeTnNulBEUgDg=;
        b=tNE4zdXMPXXDIwIg2UKnGGb8ZbXz4j/5c4bBaVDz/dhgW9fP7YbkbW39+7+wJ9ykQ3
         9nyosotRbGPdjdUI9FKqw3lGYWzhC9XA8B/FV8iuYSHhjeip2NlWOKR5spJ9rbeMBsTF
         GugjIrW+BM020bJeQQAkWk4XD4Y0ypsBc74PNAfmX1MYXrrjTrya6EGqqlRagD5f8pyz
         jZxoQYDpAR/Jv5S1hcIvzlofTgyFS/gGvdA/TkvPfejl4UTow6zGGdWk/sTM/Vvl6gLk
         6W+cfKynuPEWuY/i/n9bcnnIrUxyDoyZ6Bhy0MUwreIigL8SKiHxycmhADL/XZhSu6zT
         dIDg==
X-Gm-Message-State: AOAM532AICeJf34glhyoKA+8E8PN9onyWvy6lZsNZCtikxs9ENy5VY/f
        nuRABgb1fvjVZgNUe/4WxQ==
X-Google-Smtp-Source: ABdhPJzDahgCzai3Hll859/KRgHgIE/s6LE4+0rJ3qUbVjR2PjpP7SnOl5G/MFPxyJdnakYNhwLK8Q==
X-Received: by 2002:a5e:d90e:: with SMTP id n14mr117615iop.197.1597876699516;
        Wed, 19 Aug 2020 15:38:19 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
        by smtp.gmail.com with ESMTPSA id t16sm227445ili.75.2020.08.19.15.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2020 15:38:18 -0700 (PDT)
Received: (nullmailer pid 2090447 invoked by uid 1000);
        Wed, 19 Aug 2020 22:38:15 -0000
Date:   Wed, 19 Aug 2020 16:38:15 -0600
From:   Rob Herring <robh@kernel.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, devicetree@vger.kernel.org,
        Josh Cartwright <joshc@codeaurora.org>,
        Stephen Boyd <sboyd@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        linux-kernel@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        linux-arm-msm@vger.kernel.org, mauro.chehab@huawei.com,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] dt-bindings: convert spmi.txt to spmi.yaml
Message-ID: <20200819223815.GA2090217@bogus>
References: <94b055687143c9593cd4311f8bcda99a743a619f.1597850327.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <94b055687143c9593cd4311f8bcda99a743a619f.1597850327.git.mchehab+huawei@kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 19 Aug 2020 17:20:06 +0200, Mauro Carvalho Chehab wrote:
> Convert the SPMI bus documentation to JSON/yaml.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
> 
> Rob,
> 
> As promissed, this patch converts the spmi.txt generic bus bindings to
> html.
> 
>  .../bindings/mfd/qcom,spmi-pmic.txt           |  2 +-
>  .../bindings/spmi/qcom,spmi-pmic-arb.txt      |  4 +-
>  .../devicetree/bindings/spmi/spmi.txt         | 41 ------------
>  .../devicetree/bindings/spmi/spmi.yaml        | 62 +++++++++++++++++++
>  4 files changed, 65 insertions(+), 44 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/spmi/spmi.txt
>  create mode 100644 Documentation/devicetree/bindings/spmi/spmi.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

Error: Documentation/devicetree/bindings/spmi/spmi.example.dts:23.18-19 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:342: Documentation/devicetree/bindings/spmi/spmi.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1367: dt_binding_check] Error 2


See https://patchwork.ozlabs.org/patch/1347886

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

