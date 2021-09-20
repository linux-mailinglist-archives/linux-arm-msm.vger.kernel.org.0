Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93B13412889
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Sep 2021 23:55:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233851AbhITV44 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Sep 2021 17:56:56 -0400
Received: from mail-ot1-f42.google.com ([209.85.210.42]:45646 "EHLO
        mail-ot1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234193AbhITVy4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Sep 2021 17:54:56 -0400
Received: by mail-ot1-f42.google.com with SMTP id l7-20020a0568302b0700b0051c0181deebso25539738otv.12;
        Mon, 20 Sep 2021 14:53:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=X2j5YtyheAq5Lphy8fXkDQEgWgYMfVgh6X/yNCkEz3Q=;
        b=38YYFjauQkPGSA4wEPPyzNuWETM3kGW0c8xGcMFOR3CPAgqud3HiBuMDlkXc2R2PK0
         QOVcNsaAQhAGs9hIhSnTdSfCgtPp2tQBHB8M5edPDReib5g/qprVh303BG+rsqWE+S7V
         nrUnKA6WScX7WdUN9zZKH4Dsh2v9Ql+JkcjSyb7LNqUfKVp0HL3yDHL7hn7Y+rmhQoDP
         iscxJiVtIhGBjCotMsZobh9KnsABv2EeUhIuLp983XOv/zgypNSC2ECFATcVJFfrzw9o
         4UsrzB2XosR7J1eBOnr5D1ud5BSepH0K23KRZL1XD7EPgFr+kf5ntHMSX135RIdLMUmR
         /RmQ==
X-Gm-Message-State: AOAM530chm/4JIm6tmNgcFRdKuZ4BkT1hnNfE2C1g4KcHdJfo4ZzzLoB
        Ssit4Zf+rJoe/GQiGYcUvw==
X-Google-Smtp-Source: ABdhPJwegcq4esMvrkBxmsBb4RHxvmCqmtfc/O8GDwlMOCxv29nheZNjDAf1CkhXb2sVvNIZYuPpyw==
X-Received: by 2002:a05:6830:14c2:: with SMTP id t2mr6795296otq.115.1632174808482;
        Mon, 20 Sep 2021 14:53:28 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id e10sm1316020oig.11.2021.09.20.14.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 14:53:27 -0700 (PDT)
Received: (nullmailer pid 848408 invoked by uid 1000);
        Mon, 20 Sep 2021 21:53:26 -0000
Date:   Mon, 20 Sep 2021 16:53:26 -0500
From:   Rob Herring <robh@kernel.org>
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, bartosz.dudziak@snejp.pl,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/8] dt-bindings: arm: qcom: Document APQ8026 SoC binding
Message-ID: <YUkC1q65RjkwBaAj@robh.at.kernel.org>
References: <20210911232707.259615-1-luca@z3ntu.xyz>
 <20210911232707.259615-8-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210911232707.259615-8-luca@z3ntu.xyz>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Sep 12, 2021 at 01:27:01AM +0200, Luca Weiss wrote:
> Document the APQ8026 (based on MSM8226) SoC device-tree binding and the
> LG G Watch R.

Looks like this was applied, but lg vs. lge needs to be sorted first. 
IMO, we should fix the one instance of 'lge'.

> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index 880ddafc634e..da44688133af 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -25,6 +25,7 @@ description: |
>    The 'SoC' element must be one of the following strings:
>  
>          apq8016
> +        apq8026
>          apq8074
>          apq8084
>          apq8096
> @@ -92,6 +93,11 @@ properties:
>                - qcom,apq8016-sbc
>            - const: qcom,apq8016
>  
> +      - items:
> +          - enum:
> +              - lge,lenok
> +          - const: qcom,apq8026
> +
>        - items:
>            - enum:
>                - qcom,apq8064-cm-qs600
> -- 
> 2.33.0
> 
> 
