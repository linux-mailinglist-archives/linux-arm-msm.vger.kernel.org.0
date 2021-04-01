Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F21AB3517B6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Apr 2021 19:47:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235378AbhDARml (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Apr 2021 13:42:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234697AbhDARjP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Apr 2021 13:39:15 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93B3DC0225A2
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Apr 2021 08:26:31 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id v24-20020a9d69d80000b02901b9aec33371so2481595oto.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Apr 2021 08:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=y1kLTUZ2DutDMLECPCDo/9HBwkSTm4jPer4fs/ISbQw=;
        b=omBsYOeENt7SVjBE01WDqu8qkh6IuqJn18S0GxB8wH2g235QZGZzREfvWVIVJaIfO/
         1TBmzjcHZeaLC1gXmZ6rI8Tlon9Hb6qxp1KLHxDAhJ20so+bIy87AGTfgQ+Q22cqtCJw
         H4WvKG6fHJxtHglO3JEZM4qD/GaeefgOmd+tXSeqLdk4SklBHGNyWmy/0Hn/jBYf+HsX
         pFbuUB1HhJH98ir9FIYsXxZb6i+xtPJzpKLENPuOd8GgAfqvlWooyCQaAIFJVGoEmGe0
         EOqoltRJIhpiPjTBvaTbju0ULDdXLW5Hf688IH6WMu7qG0p1vO6emJ83VHxl7hPSfcP+
         rkqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=y1kLTUZ2DutDMLECPCDo/9HBwkSTm4jPer4fs/ISbQw=;
        b=M1ZFxGjSOcRD2VhigYrUXgXyUq8wfdVkzty/+J8hudimqXcwJDfQ742LnYCQBczxXv
         VxfdXOu4gaAMh2CA2YDuWNQ2wTjydrJjB7qx/46Y6IfAO7/KjgIRTvjcSxJviTCdTBhe
         28zYYwwdam2u9mAqRl08r2aRj4a3hRf+jYb+HDtQABHwSVhLnKvMCVTVMB3VLbX4RAxd
         jfcoQBBOBrJHFhwdXVmS8ZOvKEu+1pX1gAOdqmEXffwFYoFeoxrrZoO6wcmADZ4SWiXK
         JvpYe8PvNK4GChRFD8cm2kGSPNLW1j/yJBD2l7V9inEjs2FJX1F+tEnKS67HJMSIvpAH
         0qxw==
X-Gm-Message-State: AOAM532ahiwjD88PsnxcyogVEs0O2PP+E4BV33TzqzvtDIEY3vy3/W+l
        s0nEUlfthfyrkZQy8zXoVXwbaw==
X-Google-Smtp-Source: ABdhPJwuxhgyUQPNdxqijp4NxdjFRqjeSz9/Ag+fpV3UkbEs/6cB1Wjoefn5mCAup82be648Kb/y8w==
X-Received: by 2002:a9d:6013:: with SMTP id h19mr7353121otj.72.1617290791027;
        Thu, 01 Apr 2021 08:26:31 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m127sm1093411oib.32.2021.04.01.08.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 08:26:30 -0700 (PDT)
Date:   Thu, 1 Apr 2021 10:26:28 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     satya priya <skakit@codeaurora.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>, kgunda@codeaurora.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH V2 2/3] dt-bindings: pinctrl: qcom-pmic-gpio: Update the
 binding to add four new variants
Message-ID: <20210401152628.GQ904837@yoga>
References: <1617280546-9583-1-git-send-email-skakit@codeaurora.org>
 <1617280546-9583-3-git-send-email-skakit@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1617280546-9583-3-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 01 Apr 07:35 CDT 2021, satya priya wrote:

> Update the binding to add PM7325, PM8350C, PMK8350 and PMR735A GPIO support.
> 
> Signed-off-by: satya priya <skakit@codeaurora.org>
> ---
> Changes in V2:
>  - Placed this patch before conversion patch and updated commit text
>    to be more clear.
> 
>  Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
> index 7648ab0..da7c35e 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
> @@ -30,6 +30,10 @@ PMIC's from Qualcomm.
>  		    "qcom,pm6150-gpio"
>  		    "qcom,pm6150l-gpio"
>  		    "qcom,pmx55-gpio"
> +		    "qcom,pm7325-gpio"
> +		    "qcom,pm8350c-gpio"
> +		    "qcom,pmk8350-gpio"
> +		    "qcom,pmr735a-gpio"

As with the driver, please try to keep these sorted alphabetically and
please rebase on linux-next, which already defines 2 of these.

Regards,
Bjorn

>  
>  		    And must contain either "qcom,spmi-gpio" or "qcom,ssbi-gpio"
>  		    if the device is on an spmi bus or an ssbi bus respectively
> @@ -113,6 +117,10 @@ to specify in a pin configuration subnode:
>  		    gpio1-gpio12 for pm6150l
>  		    gpio1-gpio11 for pmx55 (holes on gpio3, gpio7, gpio10
>  					    and gpio11)
> +		    gpio1-gpio10 for pm7325
> +		    gpio1-gpio9 for pm8350c
> +		    gpio1-gpio4 for pmk8350
> +		    gpio1-gpio4 for pmr735a
>  
>  - function:
>  	Usage: required
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
> of Code Aurora Forum, hosted by The Linux Foundation
> 
