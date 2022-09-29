Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 340A35F0091
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Sep 2022 00:36:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229768AbiI2WgB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Sep 2022 18:36:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230131AbiI2Wew (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Sep 2022 18:34:52 -0400
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CFFC1D6249;
        Thu, 29 Sep 2022 15:31:36 -0700 (PDT)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-131f1494dc2so577049fac.7;
        Thu, 29 Sep 2022 15:31:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=+ppqKUZekTxVrZE6//gc6FmK7Y2dgigVSPtRGAj8nKU=;
        b=3AWZmD0qtPK/T/JPAaoRnEu0TCSsBo7sJnu1o2+RxJpTDhY4fF0RgRyfUbsCm/ygUx
         +HY7Ecj0qdGtNM8r9vKYmBNF2G/wHej5Krkjdd7Pd+kRzTHeSyIyXXoPBlPmx4TXQ7E6
         K4gPn+wXE5jWudfZ5QKniVffhLYy3+qlxwtfjbSf8kah7PEjbfLjLxxQFexWgQu2ZX6G
         +MB1HuIbKIFLUz7LdUZRg4HGd0TkVhbbQvZzK0TkoIBylsYHMvR6mH8xdQbqNEaw4dhX
         HDJUB7ISBln/OM4c7B949ap3nXb96CRAi+WEdSWa/DFpwxZ2HLgbEhCQFWl7rqdE0mIr
         sFqA==
X-Gm-Message-State: ACrzQf3eqW6vAQAFHSt8lQ7/xRGXSmgy4vBgVoIp5WUzHKn4L5GWfg6y
        pDF0VEJLjv70zch+2GajIA==
X-Google-Smtp-Source: AMsMyM6VPQStiQxDY3pOVC8hYCgC8vnsmw1bwW+gJ4KDrpxt0NpOa9gHUrAo8NDlWtbXSD65Hd6G9A==
X-Received: by 2002:a05:6870:55a4:b0:130:c298:46e5 with SMTP id n36-20020a05687055a400b00130c29846e5mr9872616oao.216.1664490672775;
        Thu, 29 Sep 2022 15:31:12 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id u36-20020a056870702400b0013125e6a60fsm229085oae.58.2022.09.29.15.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 15:31:12 -0700 (PDT)
Received: (nullmailer pid 2882012 invoked by uid 1000);
        Thu, 29 Sep 2022 22:31:11 -0000
Date:   Thu, 29 Sep 2022 17:31:11 -0500
From:   Rob Herring <robh@kernel.org>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-arm-kernel@lists.infradead.org,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Yann Gautier <yann.gautier@foss.st.com>,
        devicetree@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 1/3] dt-bindings: mmc: arm,pl18x: Document
 interrupt-names is ignored
Message-ID: <20220929223111.GA2880118-robh@kernel.org>
References: <20220927191736.299702-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220927191736.299702-1-marex@denx.de>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Sep 27, 2022 at 09:17:34PM +0200, Marek Vasut wrote:
> Due to inconsistency of existing DTs regarding the content of this IP
> interrupt-names DT property, document this such that interrupt-names
> is not used by this IP bindings.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Konrad Dybcio <konrad.dybcio@somainline.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: Yann Gautier <yann.gautier@foss.st.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-mmc@vger.kernel.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-arm-kernel@lists.infradead.org
> ---
>  Documentation/devicetree/bindings/mmc/arm,pl18x.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml b/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
> index 1e69a5a42439b..a0ddf6495f85e 100644
> --- a/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
> +++ b/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
> @@ -95,7 +95,8 @@ properties:
>        PIO (polled I/O) interrupt and occurs when the FIFO needs to be
>        emptied as part of a bulk read from the card. Some variants have these
>        two interrupts wired into the same line (logic OR) and in that case
> -      only one interrupt may be provided.
> +      only one interrupt may be provided. The interrupt-names property is
> +      not used due to inconsistency of existing DTs regarding its content.
>      minItems: 1
>      maxItems: 2

       deprecated: false


>  
> -- 
> 2.35.1
> 
> 
