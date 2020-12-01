Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C089F2C971A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Dec 2020 06:44:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726412AbgLAFn1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Dec 2020 00:43:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726006AbgLAFn1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Dec 2020 00:43:27 -0500
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8CEEC0613D3
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Nov 2020 21:42:46 -0800 (PST)
Received: by mail-ot1-x344.google.com with SMTP id 79so582253otc.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Nov 2020 21:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Ihaaw08cFhiCTwND/g0fTHzN6wosSubPF99ETYHbTgs=;
        b=gwDibg4TlAg5NeyOlM6hBjtDtmouEcBLDmyt+9YcL6pdBoS5nB1kdDb2tG6qenFjMX
         XU5/0feGrXkwZzTkYspdT4UnWQlb7SzhaRS8W2TWV6nXC0YxF1XQAmgcnK2enVW8uQ3e
         dAo31khv7My8LBj0cjyGERRkzVyF3jvmaWcW9ACePTnSv7kxETrfxIR8SDW03daxXj+X
         1n2a4UoBNfJiSr0KhrY0wnrdYUfqUK+LMfqwpPp9p+L5YvcRffMH0W6wYTnmeWLfWO1h
         YdyY70HHJ7DRDyQp1qlbf0h9/J8fpUue0+F0+76OsWTzWWj2vmazJRz4TMjAzwVGfy0+
         OWhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Ihaaw08cFhiCTwND/g0fTHzN6wosSubPF99ETYHbTgs=;
        b=TY24IdFvFqsuGPFp6t3glJOjhjVqKA92SMiKVNqJu98VQhRfOJgV2Cp7ycaahS6Va3
         1LUnp7wTZ9m5C28jlmQtm2FR6hilOcb0T16M7o5YXS9fcsU4C29LI3+hd0v7IqSZFdXG
         7tovLq8BRzMMcL/0FyClob3OxyVD3eWs4VF5QYJKYdDrYjApXr9EuP9w1MP5od9UFSTY
         L5Uc5EqOrKzr4PrQsnTk2o15jAkM2igN4LabHnyYwAZ36/NtMgbxQZySqR6gM9SPVpRv
         e9d6mnMkdYhxN5JUbW+DMwsdyxxaw/nkBymFdYPcC3r+5YCw/1aVkUOxYPnN2uTB1+rK
         q5cA==
X-Gm-Message-State: AOAM531GMQsfPy8viK6+TcgQRJ+iGV/gkh9e/lwhzaaVaX5Zaepf+lto
        JKYpnnKJx6y8AOVQJ4W3vpcDHw==
X-Google-Smtp-Source: ABdhPJydhjPMZwS2lnEmgiWCsVcT2IJupPLRtggoGu082WDn6p2VE/1EIPSfdvszf/m7l4kf42tj/g==
X-Received: by 2002:a9d:7505:: with SMTP id r5mr849109otk.64.1606801363728;
        Mon, 30 Nov 2020 21:42:43 -0800 (PST)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id w6sm171010otj.12.2020.11.30.21.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 21:42:42 -0800 (PST)
Date:   Mon, 30 Nov 2020 23:42:40 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Marc Zyngier <maz@kernel.org>, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: qcom,pdc: Add compatible for SM8250
Message-ID: <20201201054240.GK807@yoga>
References: <20201201053537.2134991-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201201053537.2134991-1-vkoul@kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 30 Nov 23:35 CST 2020, Vinod Koul wrote:

> Add the compatible string for SM8250 SoC from Qualcomm. This compatible
> is used already in DTS files but not documented yet
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Although it doesn't matter much until this is translated to yaml...

Regards,
Bjorn

> ---
>  .../devicetree/bindings/interrupt-controller/qcom,pdc.txt        | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
> index 1df293953327..9c1a046e6fd9 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
> +++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
> @@ -20,6 +20,7 @@ Properties:
>  	Definition: Should contain "qcom,<soc>-pdc" and "qcom,pdc"
>  		    - "qcom,sc7180-pdc": For SC7180
>  		    - "qcom,sdm845-pdc": For SDM845
> +		    - "qcom,sdm8250-pdc": For SM8250
>  
>  - reg:
>  	Usage: required
> -- 
> 2.26.2
> 
