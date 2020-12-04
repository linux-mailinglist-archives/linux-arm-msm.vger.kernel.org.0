Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B4032CE481
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Dec 2020 01:35:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730027AbgLDAeA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Dec 2020 19:34:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726478AbgLDAeA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Dec 2020 19:34:00 -0500
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E656C061A53
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Dec 2020 16:33:20 -0800 (PST)
Received: by mail-oi1-x244.google.com with SMTP id h3so4304691oie.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Dec 2020 16:33:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=F4qSAvqclwaBrwtj+D4WYT0ed0FtCTiqB7wP+jGTvzs=;
        b=Knkst9NAJKJlG81HZrnkT61iPj7pbone3xLt1QMLq6jgnl/Zml13orYQLooU83/6EO
         qTNUIiH8cDxz/UYePN+LNjtTpIeFtiOgaAmbykS+IMxPN1gA4S6O0AupZjlO5bmZ8oBo
         ZzSToqQeT/FblPepO9Qz0afjNe48SrMIGHwWR9bVdq3zNnR9+6X4kV7ls7sDneuozHFn
         kXPJVhhOkf2Ps3V2/A5B69kEfQFAKQnZA3F0xnR0pRJKrJeZiYSuSY3YJNNlCZK7ifOH
         +xZjsWcB6A5KFqI2iIsgzzUhF4rtyQTk7279v7JDCpGwsmRkZhxKBMUKlxg19IGfUmKo
         zhnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=F4qSAvqclwaBrwtj+D4WYT0ed0FtCTiqB7wP+jGTvzs=;
        b=bjDosOXsoh1S2OPmnFOpYNjjDaX1IEGL2gQ4WotKWR8utqLNpKz/4Br3qXETP+cCxi
         i+c0gJ6kYzhlGGcvSux7lQ71cszf4GorGh77qMzF0q0+tDR3LZVZtrF7FpxtIr3Gk0Ou
         wwim+3vVzMqed1s5o25qq8vBMUg4xPiRFB4OBTpBcx08DGprTGtE3lGs4ptWZ5CNCG+e
         WZNC3Faq1IIpIetFp8pA+7FMGniw+Rl0IAgMx7JNNd4xBqRV8okPFDhM04VAN050qPO+
         ZMNml/ozwV0pvGmwpfDur4FFU2aP7A6t4uJ6zerdQDij/O3gltHYTVpQ+8A2z4SfIBML
         kgug==
X-Gm-Message-State: AOAM532CPlwk05raBFlhWHqjmGMjhXO/xws+lezjQRCvGaONkYfyw47j
        vvCOSD5/h3DbATDPOHUyxLfdqw==
X-Google-Smtp-Source: ABdhPJziJks2wT35CJcxJ1e9G8XvcOcmk+m6fxcIbh3JFDPiW6HO059tWwShgKtA6S3Y75WsrzgWKg==
X-Received: by 2002:aca:3c3:: with SMTP id 186mr1339087oid.22.1607041999440;
        Thu, 03 Dec 2020 16:33:19 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id d62sm263751oia.6.2020.12.03.16.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 16:33:18 -0800 (PST)
Date:   Thu, 3 Dec 2020 18:33:17 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8250: rename smem device node to
 follow schema
Message-ID: <X8mDzc77sk+fAFit@builder.lan>
References: <20201203191335.927001-1-dmitry.baryshkov@linaro.org>
 <20201203191335.927001-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201203191335.927001-2-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 03 Dec 13:13 CST 2020, Dmitry Baryshkov wrote:

> Rename 'qcom,smem' to just 'smem' to follow the rest of SoC (and device
> schema).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Applied, no need to include in v2.

Thanks,
Bjorn

> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index 4c472db2738e..bdd9bd303415 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -334,7 +334,7 @@ cdsp_secure_heap: memory@8bf00000 {
>  		};
>  	};
>  
> -	smem: qcom,smem {
> +	smem {
>  		compatible = "qcom,smem";
>  		memory-region = <&smem_mem>;
>  		hwlocks = <&tcsr_mutex 3>;
> -- 
> 2.29.2
> 
