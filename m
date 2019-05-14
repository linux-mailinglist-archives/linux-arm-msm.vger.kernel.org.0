Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3C371CC92
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 May 2019 18:11:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726491AbfENQLl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 May 2019 12:11:41 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:38011 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726490AbfENQLl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 May 2019 12:11:41 -0400
Received: by mail-lf1-f66.google.com with SMTP id y19so12337839lfy.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 May 2019 09:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=79OCTNk458byBS2H3Xt0sE1+KJDhnYCsFyQ7h5W7n7w=;
        b=rEV45d52FtweB9bt6szB4ocHbp9e/OFDripRbyALASst+32ezBZgc9ZQa9pOVQkL1A
         L0DxpCJVbFC36R+TXLsFNjOX0MARBsJcPrC9gDqBL70Gy2LQ5PThRWGt5k1jFqLg8tfz
         xL1Pu2dxruYOFf1S1pjMiPx3P9gZzs7jKL70DZdRMFqwtxoAhmCrmYmE5+za2E4YjjyR
         SwYld9BX/B0E6O8aQmBaemGdb3gFJ7wKTT5rYm6hDogI81VKNyZcp5c4pFgFLtXKUY9o
         BRjOYI72AtYR/DFo3zNXYrJmGPZ7bq0lJWhylHd6EEok0J8IIOGhmoefLXWUbj5a69d4
         Ygwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=79OCTNk458byBS2H3Xt0sE1+KJDhnYCsFyQ7h5W7n7w=;
        b=Np5lDFTf20cOZ36+O+H97A+tQHvPWXQ4PkwsIl+gIq3h3I9N8J4RT/Um+WEdnaEzvs
         bWe5B/Lq9y4M1Lodxh+t19YsYDH2zd7jdIGUFg2KJmKfHznKbYKA9fSU8FvxvpGLv65T
         V1ezpNtaBztA3BIbp7XgZj/xdyxptXrmjU987fD3H8Yh6vxDiGWd6C5eZ9IjjuDtY6eu
         cnKcT/TXs/GCT/zEelAGXNoikmWrc6qGyBftrUW5OT+t3JwE6C+GkGTjqbOI14FMnzIu
         KWUuw7AwcTHT91mbaYYAp9BSJvdK5cb/sU0GshVwWtFUz3ieHVtCl5vgO1bE0YuiA3jm
         H58Q==
X-Gm-Message-State: APjAAAWTJCN7CQ1iO3C+UiIWbKlLvz3qG0gStnGM3SD8rzYPDT9+/f3l
        eV0V9ya8UuA9dsdp8xV+oF5pSQ==
X-Google-Smtp-Source: APXvYqyi7e9TjI8XPxrwpktl3EJ2JyOz0p4Se1vjd3AUZyBeZPecL5wHHXSzDB/JwQyEV0EZ41oNRA==
X-Received: by 2002:ac2:4479:: with SMTP id y25mr17316963lfl.95.1557850298941;
        Tue, 14 May 2019 09:11:38 -0700 (PDT)
Received: from centauri.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id l14sm3850033lfc.61.2019.05.14.09.11.37
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 14 May 2019 09:11:37 -0700 (PDT)
Date:   Tue, 14 May 2019 18:11:35 +0200
From:   Niklas Cassel <niklas.cassel@linaro.org>
To:     Amit Kucheria <amit.kucheria@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, andy.gross@linaro.org,
        David Brown <david.brown@linaro.org>,
        Li Yang <leoyang.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCHv1 1/8] arm64: dts: Fix various entry-method properties to
 reflect documentation
Message-ID: <20190514161135.GA1824@centauri.ideon.se>
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

On Fri, May 10, 2019 at 04:59:39PM +0530, Amit Kucheria wrote:
> The idle-states binding documentation[1] mentions that the

This [1] reference is a null pointer ;)

Other than that:
Reviewed-by: Niklas Cassel <niklas.cassel@linaro.org>

> 'entry-method' property is required on 64-bit platforms and must be set
> to "psci".
> 
> We fixed up all uses of the entry-method property in
> commit e9880240e4f4 ("arm64: dts: Fix various entry-method properties to
> reflect documentation"). But a new one has appeared. Fix it up.
> 
> Cc: Sudeep Holla <sudeep.holla@arm.com>
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
