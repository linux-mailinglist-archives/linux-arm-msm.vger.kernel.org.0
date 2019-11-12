Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECD1DF99FA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2019 20:43:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727083AbfKLTn4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Nov 2019 14:43:56 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:43990 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726970AbfKLTnz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Nov 2019 14:43:55 -0500
Received: by mail-pf1-f195.google.com with SMTP id 3so14056177pfb.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Nov 2019 11:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=HPem8TIIszZ7FemqTmbnyMN0h8Slh11f2S1uwgjMiNs=;
        b=vCbC4L4b7VLJUVxMLdfu7tTiF+7v9bVwa2ILlKu9Fn4M2fXbwAWOJQgS8FoCOPusVZ
         xVC8bQFTXjujcVkJ9se5vr3widjEEvQwNYG8F2b2EBg5AIUw5+fOPgQG++A4VYLRozqo
         I0TRQVo5VgAsRL9UbLXgDoqWci22cl/Fm+fUjNAZ9g9Y6OdwiN6UPJc9iIpL2aV2P87j
         T0tnEhvI9d35ls+XXBtg5NXJFPTbZJwuODyzDhudMtEvx88qzrv6yg3uZzXtJSK5iX6w
         cPzhimTCv0pRwbAC7M+ErI0dUXGxv2qaOkloyNOT2SnYtiU/o5XmDPQkyfepeLZrvV/G
         ESpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HPem8TIIszZ7FemqTmbnyMN0h8Slh11f2S1uwgjMiNs=;
        b=ujdrouImFYRInBZIqpbhdL6TIWEMOGjoDQaTmsR10bwuBin9u6gV7/ic3wP5lz9xh5
         ezX9IIhXZKe0HX3Ox2EpyQtpx3UMO3sDo+FkTrGX00UMk1U0+uvCEbFe7r6LxnB34+J1
         XubuSflUjYLbHBzmdzM9a+7EV50fp5H321FuUEHF+a+wbj1HI3ungGx5cMUexcq5CweP
         fFdek+sfdT17YrOchqojBDhujGExQ21qUS8HkG+otjwIk+VMlzLGVIJ2SJyPdh0qRb3t
         69OrOladgXcd5QQpYNPJbeqMoJav8KgdeXFG6gM0wC4DEIWc08wtJAeWu5EN4jqxuz6c
         z7Mw==
X-Gm-Message-State: APjAAAWSA5SWM9Fn2zAwmNOk3snYdZy1cdfVYxDBHXaBX2ZZwCsd+/6e
        2saDtJpLHYCNWxCYY4Lp5dMVpg==
X-Google-Smtp-Source: APXvYqwvp01l6+NWe5Q3aOH506LuFAZx7SlH82bO5pfIp1D3hOIxDJgrjOioGwThFhLK0fe655HllA==
X-Received: by 2002:aa7:96bd:: with SMTP id g29mr39160759pfk.28.1573587834096;
        Tue, 12 Nov 2019 11:43:54 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id z18sm19047098pgv.90.2019.11.12.11.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2019 11:43:53 -0800 (PST)
Date:   Tue, 12 Nov 2019 11:43:51 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Amit Kucheria <amit.kucheria@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        edubezval@gmail.com, swboyd@chromium.org, sivaa@codeaurora.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: sdm845: thermal: Add critical interrupt
 support
Message-ID: <20191112194351.GD3140946@builder>
References: <cover.1573499020.git.amit.kucheria@linaro.org>
 <c536e9cdb448bbad3441f6580fa57f1f921fb580.1573499020.git.amit.kucheria@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c536e9cdb448bbad3441f6580fa57f1f921fb580.1573499020.git.amit.kucheria@linaro.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 11 Nov 11:21 PST 2019, Amit Kucheria wrote:

> Register critical interrupts for each of the two tsens controllers
> 
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> Message-Id: <3686bd40c99692feb955e936b608b080e2cb1826.1568624011.git.amit.kucheria@linaro.org>

Picked up for v5.6.

Regards,
Bjorn

> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index 0990d5761860..3b643b04ab5a 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -2950,8 +2950,9 @@
>  			reg = <0 0x0c263000 0 0x1ff>, /* TM */
>  			      <0 0x0c222000 0 0x1ff>; /* SROT */
>  			#qcom,sensors = <13>;
> -			interrupts = <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>;
> -			interrupt-names = "uplow";
> +			interrupts = <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 508 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "uplow", "critical";
>  			#thermal-sensor-cells = <1>;
>  		};
>  
> @@ -2960,8 +2961,9 @@
>  			reg = <0 0x0c265000 0 0x1ff>, /* TM */
>  			      <0 0x0c223000 0 0x1ff>; /* SROT */
>  			#qcom,sensors = <8>;
> -			interrupts = <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH>;
> -			interrupt-names = "uplow";
> +			interrupts = <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 509 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "uplow", "critical";
>  			#thermal-sensor-cells = <1>;
>  		};
>  
> -- 
> 2.17.1
> 
