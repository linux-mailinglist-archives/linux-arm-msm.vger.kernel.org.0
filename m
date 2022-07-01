Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D6B6563A64
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Jul 2022 22:11:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231381AbiGAUIO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Jul 2022 16:08:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229968AbiGAUIO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Jul 2022 16:08:14 -0400
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A12AABCAB;
        Fri,  1 Jul 2022 13:08:13 -0700 (PDT)
Received: by mail-il1-f171.google.com with SMTP id h5so2073766ili.3;
        Fri, 01 Jul 2022 13:08:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4cmnyqPkxRKsOWfhu6C2d1GUwRFJleTnc3K78+DNh4Q=;
        b=25WRjAsrLpJZdmYvnQbcrWjX29IH3uEXOwxdShdQK8uFXjrYHL2Aa9J1aNURqfEJM7
         x4fFMuKvgZwkrIWJzNb1MfGLTiwHUrr0EBnE//FpfXP+ICReBT6AwbEvZQ9tATaVB820
         4uPNo/Bbg3ct2/QQn35F6mfb6LKw11qNDqiWDRy021ohdK+H6eWV3IcdgW49oCU0flRJ
         6N5vfqpYbBVyA8u55rdc+VhOIGlMDb1s2GFYh+ljw+/Y2t67XtND6CbDlZ03VCx97zp7
         tzuFwPq2N+cWx8WXWCgOwiAsXoPYjkX9XWLWgFJtPI/kxXUkYryXXzAgq1jtsWCkaKb9
         ruMA==
X-Gm-Message-State: AJIora8aPjPs1WpdyhcxNR3Gpmb8PuVDvxtpB26EdNRdnt5Cc2TJKBNC
        dBXRBF8Iq0hKNTRapzn/yw==
X-Google-Smtp-Source: AGRyM1t7QhI/co6WT+YVr0GACSS5wqpKqx2bIyp4sLjEcTPc+AkfkcpJUsWupz4KPq9xMx3pGwFSzA==
X-Received: by 2002:a05:6e02:1686:b0:2da:9ac2:ea85 with SMTP id f6-20020a056e02168600b002da9ac2ea85mr9840480ila.108.1656706092762;
        Fri, 01 Jul 2022 13:08:12 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id v6-20020a92d246000000b002d921e1abf2sm9314367ilg.85.2022.07.01.13.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 13:08:12 -0700 (PDT)
Received: (nullmailer pid 1434390 invoked by uid 1000);
        Fri, 01 Jul 2022 20:08:09 -0000
Date:   Fri, 1 Jul 2022 14:08:09 -0600
From:   Rob Herring <robh@kernel.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, krzysztof.kozlowski+dt@linaro.org,
        quic_mkrishn@quicinc.com, swboyd@chromium.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/7] dt-bindings: msm: dsi: Fix phy-name binding
Message-ID: <20220701200809.GA1433418-robh@kernel.org>
References: <20220630120845.3356144-1-bryan.odonoghue@linaro.org>
 <20220630120845.3356144-2-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220630120845.3356144-2-bryan.odonoghue@linaro.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 30, 2022 at 01:08:39PM +0100, Bryan O'Donoghue wrote:
> The driver doesn't care about the name of the phy in DTS. msm8916 has since
> 2016 named the phy "dsi-phy" with later SoCs taking the name "dsi".

Also, for the subject, it's 'phy-names' not 'phy-name'.

> There's no reason to have a constraint on the name here, simply to have a
> name. Remove the redundant const in favour of maxItems: 1.
> 
> Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/dsi-controller-main.yaml    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> index 880bfe930830c..717a5d255ffe4 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> @@ -49,7 +49,7 @@ properties:
>      maxItems: 1
>  
>    phy-names:
> -    const: dsi
> +    maxItems: 1
>  
>    "#address-cells": true
>  
> -- 
> 2.36.1
> 
> 
