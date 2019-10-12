Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A92AED509A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Oct 2019 17:09:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727884AbfJLPJG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 12 Oct 2019 11:09:06 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.164]:32758 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727115AbfJLPJG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 12 Oct 2019 11:09:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1570892944;
        s=strato-dkim-0002; d=gerhold.net;
        h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=CODfh4ZUOG3TFj3md4QlLa/jaf0u0Y3ySBrDxZZEcXk=;
        b=H0pRQsZMmZT05AltpwD5vgzP3wW+iqU3DaVa4OsYJnJW1fQH1tTVTPiBxMTDhGmhYk
        c3qfQgr6rHN9Wo3SMOa55lEZY91AN/pa1vZ+uFfmwLsk62Wy61Gd4yrOBVvsd03R06Of
        I67rK88wI9qnZA4iDsmMAQPsiaBeW3EyAkuGu2R8S581xsM/zCc/HkSJrEalDFwgtBL5
        23L3zyNx3rl4Tr8ZTOj45c+68EOWocLJ9Zo+3yXtnNWYo4ZisxdlHRmGuByf/aIgskmm
        MBZYh6LYJA+mcdUplQOGqtzJJ+0afJtTBEFf0AeHTW+AkLX5Au7DSqxRwsyIWA5ap5Fn
        SnLw==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u266HpF+ORJDYrzyYxxieg=="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
        by smtp.strato.de (RZmta 44.28.0 DYNA|AUTH)
        with ESMTPSA id L0811cv9CF93Tij
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Sat, 12 Oct 2019 17:09:03 +0200 (CEST)
Date:   Sat, 12 Oct 2019 17:08:54 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     nikitos.tr@gmail.com
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: msm8916-longcheer-l8150: Enable WCNSS
 for WiFi and BT
Message-ID: <20191012150854.GA33229@gerhold.net>
References: <20191012145821.20846-1-nikitos.tr@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191012145821.20846-1-nikitos.tr@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Oct 12, 2019 at 07:58:20PM +0500, nikitos.tr@gmail.com wrote:
> From: Nikita Travkin <nikitos.tr@gmail.com>
> 
> WCNSS is used on L8150 for WiFi and BT.
> Its firmware isn't relocatable and must be loaded at specific address.
> 
> Signed-off-by: Nikita Travkin <nikitos.tr@gmail.com>

Reviewed-by: Stephan Gerhold <stephan@gerhold.net>

> ---
>  .../boot/dts/qcom/msm8916-longcheer-l8150.dts      | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
> index 2b28e383fd0b..e4d467e7dedb 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
> @@ -18,6 +18,16 @@
>  		stdout-path = "serial0";
>  	};
>  
> +	reserved-memory {
> +		// wcnss.mdt is not relocatable, so it must be loaded at 0x8b600000
> +		/delete-node/ wcnss@89300000;
> +
> +		wcnss_mem: wcnss@8b600000 {
> +			reg = <0x0 0x8b600000 0x0 0x600000>;
> +			no-map;
> +		};
> +	};
> +
>  	soc {
>  		sdhci@7824000 {
>  			status = "okay";
> @@ -68,6 +78,10 @@
>  			};
>  		};
>  
> +		wcnss@a21b000 {
> +			status = "okay";
> +		};
> +
>  		/*
>  		 * Attempting to enable these devices causes a "synchronous
>  		 * external abort". Suspected cause is that the debug power
> -- 
> 2.19.1
> 
