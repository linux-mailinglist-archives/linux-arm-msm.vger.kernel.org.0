Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 087C51E7226
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2020 03:44:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390743AbgE2BoY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 May 2020 21:44:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390624AbgE2BoX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 May 2020 21:44:23 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AEA3C08C5C6
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2020 18:44:23 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id n15so417496pjt.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2020 18:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=u4wZ+oHEh/yb9giuq7Wc+trVdOCFbwrAb/vb2s3+ZuA=;
        b=vMV7M9EAIXjVXAAowVp5lF3LjvAy3Yark1Ef6htTY8AViNpwtknqFvfKLIwM+G9hvW
         cjy6t0WzyAT3SOeJkZFKVDmrdfLMvRlj9BqniInHBCtH4PYH/Pq4xS0/vyKHbzBJjb6e
         Twaqt99ggKCQeIhoEvv9C78Yvxmu5mpF87E0vMjwgzWQeJP9h8WTUni5RKYs1PmSFrzr
         68va5kyG0V9x4AHtiegOJH2zM2tva4tIKqOJfZ/qIw8IPnVR8URzVGxYOy/IMu25lzq+
         T9Cy3cWFkuOYs0gqFQgw/r6aQJRNif9SvqEZbMFYUI5ILDwwLMIRfSDZr2R1QBjv6tMM
         +/3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=u4wZ+oHEh/yb9giuq7Wc+trVdOCFbwrAb/vb2s3+ZuA=;
        b=b0bJ9q3dhhgMXbNHBdkkcP0to2y8ULebc4fzdLkRZSupbPm+hcVeQd8hRYN/vm+7ns
         FldkGJKAiH7hrQ+2vyfZ0pXAvxyc+5GPr5U8wWpZAdG3vkDns8YwXkwlEr8YLyB57BNI
         btPSSTeE2ASDDtmWHAI29MsP1886vfrc252750F24Ja47rQXMQ4VFayrp64BaQlIeDHs
         RvktlyZxzonbFBii9NO0r3vgSv0MNJKGtkrUIGGn6F1uwT8Y5vQLxIk/p8W6l6dS3wqa
         /KGLyoPa4Ht4+zbj2QhS/JPgvG7MylMN7bAnOOVYUAKRPD2BBKv2ECI9V2TD6oBlFykU
         Vcug==
X-Gm-Message-State: AOAM533EIhZC1RNnwuKme73y3yNLs9NszXmK7HCWSO+mi6sHZftzSZTc
        qeaCJcmJ94dS3+3TUpN2dJndbA==
X-Google-Smtp-Source: ABdhPJyJaSYGk0UqVl2+SQmlhVC4Bg+mJS2V6qh10qUdo+5iNZ9Gksku4wC/H0JGHfu4s0p+3PHgeg==
X-Received: by 2002:a17:902:684f:: with SMTP id f15mr6624515pln.237.1590716662672;
        Thu, 28 May 2020 18:44:22 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id z13sm5843414pfq.16.2020.05.28.18.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 18:44:21 -0700 (PDT)
Date:   Thu, 28 May 2020 18:43:16 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sumit Semwal <sumit.semwal@linaro.org>
Cc:     agross@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
        robh+dt@kernel.org, nishakumari@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kgunda@codeaurora.org,
        rnayak@codeaurora.org
Subject: Re: [PATCH v3 3/5] arm64: dts: qcom: pmi8998: Add nodes for LAB and
 IBB regulators
Message-ID: <20200529014316.GM279327@builder.lan>
References: <20200528154625.17742-1-sumit.semwal@linaro.org>
 <20200528154625.17742-4-sumit.semwal@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200528154625.17742-4-sumit.semwal@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 28 May 08:46 PDT 2020, Sumit Semwal wrote:

> From: Nisha Kumari <nishakumari@codeaurora.org>
> 
> This patch adds devicetree nodes for LAB and IBB regulators.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Nisha Kumari <nishakumari@codeaurora.org>
> Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
> 
> --
> v2: sumits: updated for better compatible string and names
> v3: sumits: updated interrupt-names as per review comments
> 
> ---
>  arch/arm64/boot/dts/qcom/pmi8998.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pmi8998.dtsi b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
> index 23f9146a161e..1a72fe92f1a6 100644
> --- a/arch/arm64/boot/dts/qcom/pmi8998.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
> @@ -25,5 +25,19 @@ pmi8998_lsid1: pmic@3 {
>  		reg = <0x3 SPMI_USID>;
>  		#address-cells = <1>;
>  		#size-cells = <0>;
> +
> +		labibb: labibb {

Although I don't see any reason to reference this node as of today, so
it doesn't really need a label.

Regards,
Bjorn

> +			compatible = "qcom,pmi8998-lab-ibb";
> +
> +			ibb: ibb {
> +				interrupts = <0x3 0xdc 0x2 IRQ_TYPE_EDGE_RISING>;
> +				interrupt-names = "sc-err";
> +			};
> +
> +			lab: lab {
> +				interrupts = <0x3 0xde 0x0 IRQ_TYPE_EDGE_RISING>;
> +				interrupt-names = "sc-err";
> +			};
> +		};
>  	};
>  };
> -- 
> 2.26.2
> 
