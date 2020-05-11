Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A239F1CE95F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2020 01:56:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728063AbgEKX4R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 May 2020 19:56:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725854AbgEKX4R (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 May 2020 19:56:17 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6939BC061A0C
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2020 16:56:17 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id r22so3707783pga.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2020 16:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=FoO0icVUfG2ot3i0ptJTYty1EwTgdkqmoTyzycRbtk8=;
        b=HuGLzXsxd6J0gAnoO/4uZioGFN45EGwU/XlNMIoijtSS8H6DAgPq/UTY923/YrloMM
         I8zimnx1X9jmbPUgMFD7GWYZRt8CDlc6P2xIw1J9Trmw2VPOQy619FwZkpJW/j+J3cDN
         LMthIFwBQXvoVv+GQZaFubYN5UofvDVea6vU6/ivIQnr0sO4y3/EPDUehw4gkDorTzBO
         dcNj+1TbO+G2SKWJCOn632TIOnYHYCiF9VZpxd1vmYqshg4B84zX/N28OY5vskoYbmHU
         f6MjNIiivKVeJZIoeuUU7Aj7QQ0N/UlpsH1Wx213i1CLfyfOmIa5OB6AA2xKdvAc59r2
         PYuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FoO0icVUfG2ot3i0ptJTYty1EwTgdkqmoTyzycRbtk8=;
        b=ly8027Kl8fENeZVsL11UT5mUyS7ki6W8rzv5w+ItkOoMhbxFnrZRtJ+WQC/t6G8ttn
         BQ946W40SchTNy0X4sntrgZdzue8+KaHZoArlXSTp2hyzxvKDjsUWgPWXt/kf71kkdBP
         V/ve/ToGSKqBYymvryzpAzRJWb6cYv/+9+ZNgeAtwQUkSAvATMmFfE3HbBTvZnNvVfqD
         8P9Ssx1y2ei5U1di3oVdjoWdITWlLh408RrhLihdGKu9KWaDFXXizOeOVIhUt3QuxxRC
         LDVNAhpjHE6+M+gVHP5VNQ5XiQ4QUgf4QdfGG/ON9L8Xnwv7sXrcdoXvjFmrZ4dcEW3r
         pEDQ==
X-Gm-Message-State: AGi0Puaf48GNulHp9mq3Ze1H/QW3Pc6v3zOEJQF8ioGr64L9E6pD4vJ7
        4u4x+4ZP9CpTfqZvfmeorWMjWQ==
X-Google-Smtp-Source: APiQypKIfC3EgwYUxc4sKfA1kiBKWgAXcA09Fu+5BromkhlEfi4rjBphI1B+ybh8IBJCHICNH0AueQ==
X-Received: by 2002:a63:5413:: with SMTP id i19mr17790585pgb.213.1589241376851;
        Mon, 11 May 2020 16:56:16 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id g9sm3887911pgh.52.2020.05.11.16.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 16:56:16 -0700 (PDT)
Date:   Mon, 11 May 2020 16:54:42 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, agross@kernel.org
Subject: Re: [PATCH 1/2] arch: arm64: dts: msm8996: Fix CSI IRQ types
Message-ID: <20200511235442.GA5349@builder.lan>
References: <1587470425-13726-1-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1587470425-13726-1-git-send-email-loic.poulain@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 21 Apr 05:00 PDT 2020, Loic Poulain wrote:

> Each IRQ_TYPE_NONE interrupt causes a warning at boot.
> Fix that by defining an appropriate type.
> 

Dropped "arch: " from $subject, added Fixes and applied both patches.

Thanks,
Bjorn

> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index 951c53a..24a4625 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -1001,16 +1001,16 @@
>  				"csi_clk_mux",
>  				"vfe0",
>  				"vfe1";
> -			interrupts = <GIC_SPI 78 0>,
> -				<GIC_SPI 79 0>,
> -				<GIC_SPI 80 0>,
> -				<GIC_SPI 296 0>,
> -				<GIC_SPI 297 0>,
> -				<GIC_SPI 298 0>,
> -				<GIC_SPI 299 0>,
> -				<GIC_SPI 309 0>,
> -				<GIC_SPI 314 0>,
> -				<GIC_SPI 315 0>;
> +			interrupts = <GIC_SPI 78 IRQ_TYPE_EDGE_RISING>,
> +				<GIC_SPI 79 IRQ_TYPE_EDGE_RISING>,
> +				<GIC_SPI 80 IRQ_TYPE_EDGE_RISING>,
> +				<GIC_SPI 296 IRQ_TYPE_EDGE_RISING>,
> +				<GIC_SPI 297 IRQ_TYPE_EDGE_RISING>,
> +				<GIC_SPI 298 IRQ_TYPE_EDGE_RISING>,
> +				<GIC_SPI 299 IRQ_TYPE_EDGE_RISING>,
> +				<GIC_SPI 309 IRQ_TYPE_EDGE_RISING>,
> +				<GIC_SPI 314 IRQ_TYPE_EDGE_RISING>,
> +				<GIC_SPI 315 IRQ_TYPE_EDGE_RISING>;
>  			interrupt-names = "csiphy0",
>  				"csiphy1",
>  				"csiphy2",
> -- 
> 2.7.4
> 
