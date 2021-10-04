Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79E51421693
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Oct 2021 20:34:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238404AbhJDSgC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Oct 2021 14:36:02 -0400
Received: from mail-ot1-f42.google.com ([209.85.210.42]:44672 "EHLO
        mail-ot1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbhJDSgC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Oct 2021 14:36:02 -0400
Received: by mail-ot1-f42.google.com with SMTP id h9-20020a9d2f09000000b005453f95356cso22789341otb.11;
        Mon, 04 Oct 2021 11:34:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=knUJ++gCkH0YzfTgjeyyFLEPM19JWGgrMdgeiG9dfr0=;
        b=ZH9ZKZX0LoAVx1BPHd0qQA4Lf2M1zW8gJRtWF+Ivrkn2CwWqX/x43nD2A7iWthx58w
         EJnYJGOKBrxjqRj1jYYUOpnMh0GuRmly0C1Zoo6qf3kVkfotqc8m2FsM2bWREDOCRQB1
         SZC6hFNpDvn740PrvnkHeiZH+gw2Wlxnjsw2A25b/Ue0zrjXbpjP0mS3/U0KZDD4OQ3W
         g0Wov47pmq4SLupjZ7Z3r+LcFEK9YNmZg9GSv8FDiGCbRA6T7/aZu+V1Fb+IPRXLFx39
         8EpKtPAC3p1xJ3m9vD4o+lfVLsVHFLgW4iKkTFnJ6u3Olv080EiIFXcl7Y7S7GErm4Q2
         QSLQ==
X-Gm-Message-State: AOAM530kjN1hXI3TR9jw+J6/BHQot6L2KwhZMbkFVvoPSdUIj0jBW+cZ
        rS4sMMKS7rArkzI0dCV8zQ==
X-Google-Smtp-Source: ABdhPJxhmFsq7jhbIvHuobTSpWL78IuEztcmQg9POgKTR3rQa6/xqPU/Koa7Xfnl0PLxskCnxrbbLQ==
X-Received: by 2002:a05:6830:1c1:: with SMTP id r1mr10850663ota.372.1633372452441;
        Mon, 04 Oct 2021 11:34:12 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id p8sm3003547oti.15.2021.10.04.11.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 11:34:11 -0700 (PDT)
Received: (nullmailer pid 1621450 invoked by uid 1000);
        Mon, 04 Oct 2021 18:34:10 -0000
Date:   Mon, 4 Oct 2021 13:34:10 -0500
From:   Rob Herring <robh@kernel.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH 08/15] dt-bindings: arm: cpus: Document qcom,msm8916-smp
 enable-method
Message-ID: <YVtJIm6Tu2z+Ph/V@robh.at.kernel.org>
References: <20210928171231.12766-1-stephan@gerhold.net>
 <20210928171231.12766-9-stephan@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210928171231.12766-9-stephan@gerhold.net>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Sep 28, 2021 at 07:12:24PM +0200, Stephan Gerhold wrote:
> Document the qcom,msm8916-smp enable method. It is actually just
> an alias for qcom,msm8226-smp since it should be implemented identically.
> 
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
>  Documentation/devicetree/bindings/arm/cpus.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
> index 11e3e09da2e5..5602a8f3c513 100644
> --- a/Documentation/devicetree/bindings/arm/cpus.yaml
> +++ b/Documentation/devicetree/bindings/arm/cpus.yaml
> @@ -211,6 +211,7 @@ properties:
>            - qcom,kpss-acc-v1
>            - qcom,kpss-acc-v2
>            - qcom,msm8226-smp
> +          - qcom,msm8916-smp

I thought arm64 is PSCI only.

>            - renesas,apmu
>            - renesas,r9a06g032-smp
>            - rockchip,rk3036-smp
> @@ -295,7 +296,8 @@ properties:
>        Specifies the ACC* node associated with this CPU.
>  
>        Required for systems that have an "enable-method" property
> -      value of "qcom,kpss-acc-v1", "qcom,kpss-acc-v2" or "qcom,msm8226-smp"
> +      value of "qcom,kpss-acc-v1", "qcom,kpss-acc-v2", "qcom,msm8226-smp"
> +      or "qcom,msm8916-smp".
>  
>        * arm/msm/qcom,kpss-acc.txt
>  
> -- 
> 2.33.0
> 
> 
