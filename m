Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53F252D1CD4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Dec 2020 23:10:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726250AbgLGWJ6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Dec 2020 17:09:58 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:37552 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726007AbgLGWJ6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Dec 2020 17:09:58 -0500
Received: by mail-ot1-f67.google.com with SMTP id o11so11364944ote.4;
        Mon, 07 Dec 2020 14:09:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eEyuCq0orrK+zaG7y0s2/donzkzWcAZFmgt/A1f//Yk=;
        b=oQsNqxXWeRo9cSnUQ1BDDThk5nzLZokrl0l3E6wJk1l7Isgb23jBPUqKDmn0XmJg0I
         GUV5yeg3egcEr/putvp8O2wSco/x1UuFxlt/RP0dTOPLaqSZbqHsvRd8nBWla3PFlzeW
         XbVIofLTwm6vOzd01ozmZRpo8JsYocHwYxdNuxQ2tAQ/sUE05l5HSwghgevZw3LAJ4wu
         GmOeIlBzGWNbTM3JIMwPXAUUd6B8eg5h6ubVncj7wcA4nBgolV+uF/ddR5pBY8bpgaZL
         8alYtpSafJxnhgPp5FWaGOA82JluVmg8r6zFj2a7A8Bch6Giw9t17wwL3zWLwqs3npnz
         1lmg==
X-Gm-Message-State: AOAM531fVdSW2LXCGX06xVkgYYWvIPVYQPfzKISCE7bOdrcN0qzbb6cQ
        JiplwqnubwisgxG4vKuS9Q==
X-Google-Smtp-Source: ABdhPJy+Zvpma0/n7ijbAgsnojTNissbUFf8+kWdcn9VvzvovXHlQI/qIhixgouaF2p/sDJ9KdZNsg==
X-Received: by 2002:a9d:5f03:: with SMTP id f3mr14573953oti.91.1607378951694;
        Mon, 07 Dec 2020 14:09:11 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 60sm2928735ott.32.2020.12.07.14.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 14:09:10 -0800 (PST)
Received: (nullmailer pid 923974 invoked by uid 1000);
        Mon, 07 Dec 2020 22:09:09 -0000
Date:   Mon, 7 Dec 2020 16:09:09 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thara Gopinath <thara.gopinath@linaro.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        herbert@gondor.apana.org.au, davem@davemloft.net, sboyd@kernel.org,
        mturquette@baylibre.com, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [Patch v2 6/6] dt-bindings: crypto: qcom-qce: Add v5.4 to binding
Message-ID: <20201207220909.GA918596@robh.at.kernel.org>
References: <20201119155233.3974286-1-thara.gopinath@linaro.org>
 <20201119155233.3974286-7-thara.gopinath@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201119155233.3974286-7-thara.gopinath@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Nov 19, 2020 at 10:52:33AM -0500, Thara Gopinath wrote:
> Add compatible string to support v5.4 crypto engine.
> 
> Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  Documentation/devicetree/bindings/crypto/qcom-qce.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.txt b/Documentation/devicetree/bindings/crypto/qcom-qce.txt
> index fdd53b184ba8..ed1ede9c0acc 100644
> --- a/Documentation/devicetree/bindings/crypto/qcom-qce.txt
> +++ b/Documentation/devicetree/bindings/crypto/qcom-qce.txt
> @@ -2,7 +2,9 @@ Qualcomm crypto engine driver
>  
>  Required properties:
>  
> -- compatible  : should be "qcom,crypto-v5.1"
> +- compatible  : should be
> +		"qcom,crypto-v5.1" for ipq6018
> +		"qcom,crypto-v5.4" for sdm845

An outstanding example of why to use SoC specific compatibles rather 
than versions. Keep v5.1, but use SoC compatibles going forward.

>  - reg         : specifies base physical address and size of the registers map
>  - clocks      : phandle to clock-controller plus clock-specifier pair
>  - clock-names : "iface" clocks register interface
> -- 
> 2.25.1
> 
