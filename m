Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 963E31BD54
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 May 2019 20:39:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727263AbfEMSj2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 May 2019 14:39:28 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:46364 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726940AbfEMSj2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 May 2019 14:39:28 -0400
Received: by mail-pl1-f193.google.com with SMTP id r18so2135309pls.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 May 2019 11:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=OHoX7oCDIxtnl3NxtTVvKViiqkZglgOas/g1Rubunpw=;
        b=ZWZUGjjawgSeblVhgOyDlCAGehMU/Z0twGz6rujUUg+RLiCUzlrAnTLFcPy3TgWvfU
         Fd0UT+okOXosraWP4hGiz8yB04ZmpU2BsxQRd46mO6PNoqx9TsGDiJEtV4lxbPJ36ex/
         undy3vtilTIBNn4Y4yuefGrOfxV+XQhh2dKnvDf9hnscJrHAnjVSeALFFT+AMWCW4Y9h
         Jhu6wF0JwP2e1KmW5KLrnrbFPn19cVSLTD1kKx3wOx8Ofp+KpQZsBdtHK9Ql00vuWihH
         LExnK/hNrae/YOtkyv7dzAx+3QR52XAF+I8RMbJoQndRs6tFofXaU4Z4yETkZJkd1BhX
         e9sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=OHoX7oCDIxtnl3NxtTVvKViiqkZglgOas/g1Rubunpw=;
        b=C5hekZ1rWQgeaK2SC4ORsUju9Rw6RPU+h/zVovGxG9XQ3vo9iIImE7AgGG2WpzUVjD
         qqMTEGmalTPh299IenZ8WZSAbjPpo0EIH2aUaNm6dTsyBd75x09wNnSaX0LudhwZm+gH
         7QijIvVAQhHrDogQC7NI64YDRU0h9VBIMQL2XumqPdxj+krPWx0REtI9cQZ/INb2hQYQ
         f8romNg8B6MeWQGFQyhTB2tR+eb+uWv52qwuoj1ZqvGVWH5VJmdaWnDO2uaAKRBETVd6
         2acBvi2v+1gFyqxdcGzDV6jBPFLni1jrttp5V12welLsA80qzH/UWVrk9lKegoPXLFWN
         TZUw==
X-Gm-Message-State: APjAAAWlAC0sRK1KTVawqvp219Ea7HU6mfjbAQ3vavei/OiRyBK4wJZS
        fkJ/a5892MNe+Y1QCEykq4W4lw==
X-Google-Smtp-Source: APXvYqynr2g6ljNTN5TU7b36goVbopwPwI4vVSq9IFQfsOzsCc5jpeiEx5UIY/EXqC5dgrtP7joR6w==
X-Received: by 2002:a17:902:2de4:: with SMTP id p91mr16401267plb.300.1557772766932;
        Mon, 13 May 2019 11:39:26 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id b23sm5116335pfi.6.2019.05.13.11.39.25
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 May 2019 11:39:26 -0700 (PDT)
Date:   Mon, 13 May 2019 11:39:47 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Amit Kucheria <amit.kucheria@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        andy.gross@linaro.org, David Brown <david.brown@linaro.org>,
        Li Yang <leoyang.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCHv1 1/8] arm64: dts: Fix various entry-method properties to
 reflect documentation
Message-ID: <20190513183947.GJ2085@tuxbook-pro>
References: <cover.1557486950.git.amit.kucheria@linaro.org>
 <ab5bad0258e455ef84059b749ca9e79f311b5e3c.1557486950.git.amit.kucheria@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ab5bad0258e455ef84059b749ca9e79f311b5e3c.1557486950.git.amit.kucheria@linaro.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 10 May 04:29 PDT 2019, Amit Kucheria wrote:

Subject indicates pluralism, but this fixes a specific platform
(board?). I think you should update that.

> The idle-states binding documentation[1] mentions that the
> 'entry-method' property is required on 64-bit platforms and must be set
> to "psci".
> 
> We fixed up all uses of the entry-method property in
> commit e9880240e4f4 ("arm64: dts: Fix various entry-method properties to
> reflect documentation"). But a new one has appeared. Fix it up.
> 
> Cc: Sudeep Holla <sudeep.holla@arm.com>

The message looks good though, so with a new subject you have my:

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> ---
>  arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> index 2896bbcfa3bb..42e7822a0227 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> @@ -51,7 +51,7 @@
>  		 * PSCI node is not added default, U-boot will add missing
>  		 * parts if it determines to use PSCI.
>  		 */
> -		entry-method = "arm,psci";
> +		entry-method = "psci";
>  
>  		CPU_PH20: cpu-ph20 {
>  			compatible = "arm,idle-state";
> -- 
> 2.17.1
> 
