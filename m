Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB7842C5AB9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Nov 2020 18:37:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404401AbgKZRgd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Nov 2020 12:36:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404201AbgKZRgc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Nov 2020 12:36:32 -0500
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5601FC0613D4
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2020 09:36:32 -0800 (PST)
Received: by mail-oi1-x244.google.com with SMTP id k26so3059307oiw.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2020 09:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6T8QYExqOXTZQRoPmNmRTj5CbwAQHzUDSySXajqV1h0=;
        b=Vv6UIWASYy9l4tPyT7VP8MwuTXWF/R/cn8vHrXqmDwK8g1Gv13I9rrEpaRZDkR3ENj
         zZ5mi84B/msAXxrQpDj0mDxxjyuHQWmdkfDycwBXnF2Hp+qIq8t3MRdEHjvrj5PeC1Xw
         0xNYmByfOXwVC6II0Yahnyn01X06OpNFOsSGxWydX6xZtnyYDoSz/99lsUX26+9IOWrs
         bW9WEHvytx3FTwcVIeZ65yAXpes+IylYNXz/K5mWF64YSusDKkXQBUBnHt6H4x+kgFzI
         d1YQeVPUeb55Q7Y0vapbLSarIM9o/Ri3tg9XCPMsuQaS9RpENo2rCTvlrD5tC3gadkC/
         rl9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6T8QYExqOXTZQRoPmNmRTj5CbwAQHzUDSySXajqV1h0=;
        b=l0JCghKah3Vr6qob0OF2bYTgvAt/+xzDBnkUo9SBQjpSfUdd5JEX7LB5zwPslD9rBh
         Ox9rh6YSvAh240NrKtiC5ZxqT6Ubq+hkjOEFhNKJUv/vvQruZhho8YQh7hasFmVb8Dyg
         RHGdx9sd7l407nGqv1GRD5wMW6yZPpQ2cYPwTCGLweySX7ZrfJs1GPzSCen2KsVUG9ky
         hZhMxY3UV/uURD4kmcsF52wdJ6hxT3V6ZN2IlULZoI/wyCrCpVNzENKw3f8AGR/3k2ES
         2va7z3qBnZagYH4b3V43KSU7ZgLVZZymc8V7UhkR7lVSdT8A/TuHS2kia/b/vFbNab55
         xn2Q==
X-Gm-Message-State: AOAM53340eNlizxbgvOxX8SuGWxV/Hwo5yquQXkECV9pVe9QRcBpxZGA
        LVRV66/Scx9DBM+4BoM+wMcoLw==
X-Google-Smtp-Source: ABdhPJxebkdK5IJYc2ClwfaGbEipX1ip5QMk0qJZW5zsQa/fK4ya+AIMPav5gax7pf9ccvb6X9BbsQ==
X-Received: by 2002:aca:5742:: with SMTP id l63mr2575215oib.166.1606412191734;
        Thu, 26 Nov 2020 09:36:31 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id z188sm3412702oia.32.2020.11.26.09.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2020 09:36:31 -0800 (PST)
Date:   Thu, 26 Nov 2020 11:36:29 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom-pmic-gpio: Add pmx55
 support
Message-ID: <X7/nnfA8LA/haMHM@builder.lan>
References: <20201126092151.1082697-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201126092151.1082697-1-vkoul@kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 26 Nov 03:21 CST 2020, Vinod Koul wrote:

> Add support for the PMX55 GPIO support to the Qualcomm PMIC GPIO
> binding.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
> index c3d1914381ae..7648ab00f4e2 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
> @@ -29,6 +29,7 @@ PMIC's from Qualcomm.
>  		    "qcom,pm8150b-gpio"
>  		    "qcom,pm6150-gpio"
>  		    "qcom,pm6150l-gpio"
> +		    "qcom,pmx55-gpio"
>  
>  		    And must contain either "qcom,spmi-gpio" or "qcom,ssbi-gpio"
>  		    if the device is on an spmi bus or an ssbi bus respectively
> @@ -110,6 +111,8 @@ to specify in a pin configuration subnode:
>  		    gpio1-gpio12 for pm8150l (hole on gpio7)
>  		    gpio1-gpio10 for pm6150
>  		    gpio1-gpio12 for pm6150l
> +		    gpio1-gpio11 for pmx55 (holes on gpio3, gpio7, gpio10
> +					    and gpio11)
>  
>  - function:
>  	Usage: required
> -- 
> 2.26.2
> 
