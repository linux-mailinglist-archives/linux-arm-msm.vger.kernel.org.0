Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC711403960
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Sep 2021 14:01:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348327AbhIHMB7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Sep 2021 08:01:59 -0400
Received: from mail-oo1-f50.google.com ([209.85.161.50]:44683 "EHLO
        mail-oo1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234758AbhIHMB7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Sep 2021 08:01:59 -0400
Received: by mail-oo1-f50.google.com with SMTP id k18-20020a4abd92000000b002915ed21fb8so678287oop.11;
        Wed, 08 Sep 2021 05:00:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pIa+Ymh64lyH4Ksb3GNVCGfVEEWsQqehYzNJo9Tvkgw=;
        b=qRaXBTHa6465lpNtcdAEdj+GR9GIsPkZNudW23/QV3PEGox7yH7wBoxng8hdu9uTih
         jdKNUvE6uooBv5GwaJwjXiEHwnBw90iK52a9/tp90LAUGVlgLRBbmCGc+SovN3dDFdX+
         LrNefB/SZxGLTLjbxPuOTes6VUmddc9aUTn8ZNwzK/6eZ34VFDOzw+pg8brN0wem9DCg
         nZYeKEH/3Yt3YksTZ7IjQXToCMGMocGUbcSmvaPVXjcbFu/oWoTf/tEODBTY9lGSoP1j
         aWA5moTSxewp2K028sk1WjM4mKERxx6O3TQM1ntktfzJTgG0yfZVN1ilWLMvERuyBpea
         5hTw==
X-Gm-Message-State: AOAM530htKj8pZwo7+6elIYMnEa1c3Ms2YT41qwL1/UdBN6+m8NEU5hi
        nO4aEu4tMWqvKnRwWtvM4g==
X-Google-Smtp-Source: ABdhPJyMOfCDqyxfhCpt75LbckaogIBcRViiXDtBG51ntFGEIU2DpplLlJ8npLttM1aYAd4r9ZrbDg==
X-Received: by 2002:a4a:a509:: with SMTP id v9mr2482404ook.73.1631102451023;
        Wed, 08 Sep 2021 05:00:51 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id c14sm397800otd.62.2021.09.08.05.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Sep 2021 05:00:50 -0700 (PDT)
Received: (nullmailer pid 1853720 invoked by uid 1000);
        Wed, 08 Sep 2021 12:00:48 -0000
Date:   Wed, 8 Sep 2021 07:00:48 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sireesh Kodali <sireeshkodali1@gmail.com>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Krishna Manikandan <mkrishn@codeaurora.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: msm: dsi: Add MSM8953 dsi phy
Message-ID: <YTil8LIWywhwxu0N@robh.at.kernel.org>
References: <20210903170844.35694-1-sireeshkodali1@gmail.com>
 <20210903170844.35694-2-sireeshkodali1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210903170844.35694-2-sireeshkodali1@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Sep 03, 2021 at 10:38:42PM +0530, Sireesh Kodali wrote:
> SoCs based on the MSM8953 platform use the 14nm DSI PHY driver
> 
> Signed-off-by: Sireesh Kodali <sireeshkodali1@gmail.com>
> ---
>  Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
> index 72a00cce0147..d2cb19cf71d6 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
> @@ -17,6 +17,8 @@ properties:
>      oneOf:
>        - const: qcom,dsi-phy-14nm
>        - const: qcom,dsi-phy-14nm-660
> +      - const: qcom,dsi-phy-14nm-8953
> +

This is going to conflict with v5.15-rc1, so you'll need to resend it.

>  
>    reg:
>      items:
> -- 
> 2.33.0
> 
> 
