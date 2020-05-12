Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43DF31CFF28
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2020 22:26:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726661AbgELU0N (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 May 2020 16:26:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725987AbgELU0N (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 May 2020 16:26:13 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F023C05BD0E
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2020 13:26:13 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id b8so6685837pgi.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2020 13:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Hf8u/FwaVvgqSOEmZzk2sCNjlpK0lHpr3UPDWazaR2Y=;
        b=QoxeALWt+Phg1Y5xvPvc+yC7kf1URW8QNGvYGTgTMMk4y+joJOQE4ELuLbGz/AH6Wx
         qyMEEw/soOeEyWq/iR9/lTFpmGOAM5E4u8JIG8A0y9so1cosGrif3WovUtsasZ1xgtUu
         oDLD6aEF7Fz4y/PlZVTNm7Jr6PrDzNzYyiErKAqJulvMkw1tMvxrHCP2xHmjd3IPu+Ft
         OffkO1M6BYxqWTwoLBAwVM6U/15XwO/YMM+LXMZAsew1ZO7e5apTnqnhdYN4Iqo4jwSE
         aeWfJ0rg5hcJnDmeW4Rb7UKX66yFSrcvN+hzLIXwXlEThvrYsBAjS5kOJwhaBlC1brr+
         YyGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Hf8u/FwaVvgqSOEmZzk2sCNjlpK0lHpr3UPDWazaR2Y=;
        b=HxBTgnp15k25e82BU7vMd4h/RZs3mKktOl40PYIkbJNT5EHkpF2kNVj0AZ8rQG9TWd
         X36ZrwMS1Gi+rLD5ytpJueamXW0/aAd/5KslRHZT5yoUGwhDhPI8MYk7oUS0cKOkYl0P
         Q4eljwEtbzdA8JG0yXqxUV++hN4gKz7Hb/2BWIxG5y20y6b/nLtQEGVQ34EkG64n+ja7
         pCNEoCwbppAWfFqJ6sQBu4EEYGeKTYodWeXqqHlhiLn1Y2OVVE8rqcPQYwopIl8yfOja
         GTo07GOTd3c0YocTRBUDpxuFe0xeMSnABCyxtUm4K9z1zVKAhlO5EeT9rqCPBE7etYlg
         N2JQ==
X-Gm-Message-State: AGi0PuagxQwAJbnhJQxcGDemFMkTRQ8F3dkjWmnhM6SXLyAdMQhhOzoM
        RZhWbgXhWPIfQR0FDl0+Lk2nIQ==
X-Google-Smtp-Source: APiQypKvP4JTRPU10Z/QlH/qaxqh9uVfwanejPjs00mSq7UCRg1PX40Nu6fqh0g8byS2KINrwXw8Tg==
X-Received: by 2002:a63:180a:: with SMTP id y10mr22641316pgl.204.1589315172346;
        Tue, 12 May 2020 13:26:12 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id r26sm13066527pfq.75.2020.05.12.13.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 13:26:11 -0700 (PDT)
Date:   Tue, 12 May 2020 13:24:39 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sivaprakash Murugesan <sivaprak@codeaurora.org>
Cc:     agross@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, jassisinghbrar@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V4 8/8] arm64: dts: ipq6018: Add a53 pll and apcs clock
Message-ID: <20200512202439.GK2165@builder.lan>
References: <1588573224-3038-1-git-send-email-sivaprak@codeaurora.org>
 <1588573224-3038-9-git-send-email-sivaprak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1588573224-3038-9-git-send-email-sivaprak@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun 03 May 23:20 PDT 2020, Sivaprakash Murugesan wrote:

> add support for apps pll and apcs clock.
> 
> Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/ipq6018.dtsi | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> index 1aa8d85..af2ceeb 100644
> --- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> @@ -294,12 +294,22 @@
>  		};
>  
>  		apcs_glb: mailbox@b111000 {
> -			compatible = "qcom,ipq8074-apcs-apps-global";
> -			reg = <0x0b111000 0xc>;
> -
> +			compatible = "qcom,ipq6018-apcs-apps-global";
> +			reg = <0x0b111000 0x1000>;

My documentation states that IPQ8074 indeed has this block at
0x0b111000, but IPQ6018 it's at 0x6b111000. Can you confirm this is
correct? Same with the pll below.

Apart from that the patch looks good.

Regards,
Bjorn

> +			#clock-cells = <1>;
> +			clocks = <&apsspll>, <&xo>;
> +			clock-names = "pll", "xo";
>  			#mbox-cells = <1>;
>  		};
>  
> +		apsspll: clock@b116000 {
> +			compatible = "qcom,ipq-apss-pll";
> +			reg = <0x0b116000 0x40>;
> +			#clock-cells = <0>;
> +			clocks = <&xo>;
> +			clock-names = "xo";
> +		};
> +
>  		timer {
>  			compatible = "arm,armv8-timer";
>  			interrupts = <GIC_PPI 2 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> -- 
> 2.7.4
> 
