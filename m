Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55FFD434099
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Oct 2021 23:27:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229632AbhJSV3N (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Oct 2021 17:29:13 -0400
Received: from mail-ot1-f41.google.com ([209.85.210.41]:39655 "EHLO
        mail-ot1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbhJSV3N (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Oct 2021 17:29:13 -0400
Received: by mail-ot1-f41.google.com with SMTP id e59-20020a9d01c1000000b00552c91a99f7so4564388ote.6;
        Tue, 19 Oct 2021 14:27:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jAuCgkSi4P0h6OiWnBVmoOYj0MAk2CO5NicdgBzc8QY=;
        b=mlKUZxNkZqG1eAiNEa7jzZ+OZ6eM6nWddPjuQv2ZW7jzfZ8VidhwXDzgwJLZCHZn00
         56t8mCjgRD2SUlUwXcG94YJoDirh7GqVFdf8SOW9vIwCEftE8zcaD0yZ/GKmCZByj/DP
         78qLhH88tTLX0ejyucSis+BDEc9S1SWDFUk343ofg6gx5yF8qaE4D1nX42nnOTczCK/A
         f+BW6gdin85IwMkgI+kul6r5ZwB2H76mhwYL2+r1raPu8i2DQ+Od6Z1LetOAizpE8V10
         SfM+BC7jWLanUKZhuxZUfEQt2E5mxVuMn1+ppigFmIreynezGtnCPg15r5qa8UKTlfqB
         h7fg==
X-Gm-Message-State: AOAM532T8udjmjZ+3KpQO5aJ8W05LtyH7d4dcoLtG81AcuHH1/ngn+vM
        JnYmHk+w0Y5K35Pva51F/w==
X-Google-Smtp-Source: ABdhPJz1+5Gx3m/C0Irrmu8LeuTVPMxuuzCLnA1QyrFq7zNOnp+a7F4YKxi9URn7mWlQu2WFAbnw7g==
X-Received: by 2002:a9d:4616:: with SMTP id y22mr7318184ote.215.1634678819625;
        Tue, 19 Oct 2021 14:26:59 -0700 (PDT)
Received: from robh.at.kernel.org (rrcs-67-78-118-34.sw.biz.rr.com. [67.78.118.34])
        by smtp.gmail.com with ESMTPSA id j8sm64585otu.59.2021.10.19.14.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 14:26:58 -0700 (PDT)
Received: (nullmailer pid 869393 invoked by uid 1000);
        Tue, 19 Oct 2021 21:26:58 -0000
Date:   Tue, 19 Oct 2021 16:26:58 -0500
From:   Rob Herring <robh@kernel.org>
To:     David Heidelberg <david@ixit.cz>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: arm: qcom, change vendor-prefix lge to lg
Message-ID: <YW84IrUDwslDCiDs@robh.at.kernel.org>
References: <20211008225157.51287-1-david@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211008225157.51287-1-david@ixit.cz>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Oct 09, 2021 at 12:51:57AM +0200, David Heidelberg wrote:
> lge never existed, use correct lg vendor-prefix
> other lge -> lg conversions are comming in different series

Doesn't match the change: asus -> lg

> 
> Fixes: 9304af37d07b ("dt-bindings: arm: qcom, add missing devices")
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index 239c02b6cbf6..b0b4f9d72935 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -101,8 +101,8 @@ properties:
>  
>        - items:
>            - enum:
> -              - asus,nexus4-mako
>                - asus,nexus7-flo
> +              - lg,nexus4-mako
>                - sony,xperia-yuga
>                - qcom,apq8064-cm-qs600
>                - qcom,apq8064-ifc6410
> -- 
> 2.33.0
> 
> 
