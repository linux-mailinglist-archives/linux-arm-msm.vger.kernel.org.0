Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64BB611C63A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2019 08:14:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728094AbfLLHO0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Dec 2019 02:14:26 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:33400 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728088AbfLLHO0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Dec 2019 02:14:26 -0500
Received: by mail-pg1-f195.google.com with SMTP id 6so684390pgk.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2019 23:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=UM9s++t70j7Y7bhdUOf1V6X/EWBiJPENZLLU9vngZ8U=;
        b=mUXcCxZaCrXhrYZXOXSZZrz7FP6QAzw5h1YlXmxZgFNrPPX6ifBFB07Eyy6fIybNX1
         CeDq2DJ4HAlO/RVBkGXKtEMgXT6k+uRJAbpcUU+RZU/jh36ORpWFS88Eqkw9K2HuijkA
         /kpbPwjWFg/u4OIag4yFbjtlqtgnxzVkqoNPR2NK1AltoT/KlFwoP8lm9VQG3gA9Nz5w
         nfibCRxZh5t846fyCKB2pH6ShdttgGKekh/9YynSpZuftZs+KearB+jZEL/Vb0VStYp8
         aZmUHH9ggbinBZ+OOG1sZYXdSVspE50Fyu77e7HPIs9FZf0CEXAIgaB5lZjtw8eHdetz
         jsJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=UM9s++t70j7Y7bhdUOf1V6X/EWBiJPENZLLU9vngZ8U=;
        b=X6M0k4fWb/sLMma9RjpfC3dfldqOIYbnUB4Ad+T4iocFXR+4lrpu/kAR6nG4QPBxmk
         fgm/x0nI3UvK4hkhk4c7SBM5zvdQJkppNaxVRvAVpFSB+uq7u7Him5vD0vym9kACk3lt
         BDzQzZ9/DAzNIqqKsaJQbqvA+E9FXMknoi7SWkO5UocvxYr6W51w7pPKLrEGrL8StH5I
         4aTxWXESXuwaJAJotiRbJKKPDAXb+WNBMRUuZaBhEmLnusVypDDM/+4iWgcrPls8QgOx
         29bHqoJURJ1HtDO871nOOqZTiwjTv3sQhx8M2QHRfc0XqrUJYnOpu3rIhCc84qCPHSr3
         KIeA==
X-Gm-Message-State: APjAAAXcLCERf+kazT9Jg+bCpnbsMheoXRZnenHKGoKacwtFRjRN9r4+
        mspvWGHTy2XPmzTwSEXj5iM5J7SWeG8=
X-Google-Smtp-Source: APXvYqxEhDt6TR1zRqNDj0IsSQyAd5Pugqzryb7zLf+dCbFy9ycoYI7ZMOwvSQuHBNF1O0ExRGyhkg==
X-Received: by 2002:a63:6e0e:: with SMTP id j14mr8713365pgc.361.1576134865659;
        Wed, 11 Dec 2019 23:14:25 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id bo9sm4620133pjb.21.2019.12.11.23.14.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2019 23:14:24 -0800 (PST)
Date:   Wed, 11 Dec 2019 23:14:22 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Brian Masney <masneyb@onstation.org>
Cc:     robdclark@gmail.com, sean@poorly.run, robh+dt@kernel.org,
        airlied@linux.ie, daniel@ffwll.ch, jcrouse@codeaurora.org,
        dianders@chromium.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: drm/msm/gpu: document second
 interconnect
Message-ID: <20191212071422.GL3143381@builder>
References: <20191122012645.7430-1-masneyb@onstation.org>
 <20191122012645.7430-2-masneyb@onstation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191122012645.7430-2-masneyb@onstation.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 21 Nov 17:26 PST 2019, Brian Masney wrote:

> Some A3xx and all A4xx Adreno GPUs do not have GMEM inside the GPU core
> and must use the On Chip MEMory (OCMEM) in order to be functional.
> There's a separate interconnect path that needs to be setup to OCMEM.
> Let's document this second interconnect path that's available. Since
> there's now two available interconnects, let's add the
> interconnect-names property.
> 
> Signed-off-by: Brian Masney <masneyb@onstation.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  Documentation/devicetree/bindings/display/msm/gpu.txt | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/gpu.txt b/Documentation/devicetree/bindings/display/msm/gpu.txt
> index 2b8fd26c43b0..3e6cd3f64a78 100644
> --- a/Documentation/devicetree/bindings/display/msm/gpu.txt
> +++ b/Documentation/devicetree/bindings/display/msm/gpu.txt
> @@ -23,7 +23,10 @@ Required properties:
>  - iommus: optional phandle to an adreno iommu instance
>  - operating-points-v2: optional phandle to the OPP operating points
>  - interconnects: optional phandle to an interconnect provider.  See
> -  ../interconnect/interconnect.txt for details.
> +  ../interconnect/interconnect.txt for details. Some A3xx and all A4xx platforms
> +  will have two paths; all others will have one path.
> +- interconnect-names: The names of the interconnect paths that correspond to the
> +  interconnects property. Values must be gfx-mem and ocmem.
>  - qcom,gmu: For GMU attached devices a phandle to the GMU device that will
>    control the power for the GPU. Applicable targets:
>      - qcom,adreno-630.2
> @@ -76,6 +79,7 @@ Example a6xx (with GMU):
>  		operating-points-v2 = <&gpu_opp_table>;
>  
>  		interconnects = <&rsc_hlos MASTER_GFX3D &rsc_hlos SLAVE_EBI1>;
> +		interconnect-names = "gfx-mem";
>  
>  		qcom,gmu = <&gmu>;
>  
> -- 
> 2.21.0
> 
