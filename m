Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0306424BF10
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Aug 2020 15:39:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730437AbgHTNj1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Aug 2020 09:39:27 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:53019 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728139AbgHTJaP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Aug 2020 05:30:15 -0400
Received: by mail-wm1-f68.google.com with SMTP id x5so976710wmi.2;
        Thu, 20 Aug 2020 02:30:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=tUnRntDeM2Z0wZOlftJYnlbiTXDqBXyNsySaCh9zCmY=;
        b=SvJm8/wDP+0NcFQQ6EcJiW2c1pBJodLfRnSCUH214i0B5bACBo/O0iTE+g6fMmP8xk
         Pf9wsIVGgID6O8tuWskHpwHk8mkIhVIZrbF1yK00ZDNlP/QDshVMiBaHQrM+YjwLv2X7
         U0xDcXE1ywTYcuu4qt1EdB5HJGdEfkK7CQbVs23P6lZmtlI4XNqKexGPthkqDA4hPcJc
         IhPBcRS2Xz8vNoFtrNXsB0TnqzLvka+lthDfV0tOZLSOFOrIJ7Osfc+oVjPA290S3jF2
         p8bJ8XriUzi8vDx9d1pe4ipOluGshbj1omGRrVb/C4vZWPKaBOenM/vsW2N2ljP5TCtV
         hS5A==
X-Gm-Message-State: AOAM533mZhB3cZ8YRh5T1ZgqMYGEYrJyQyvRg7/+2sYukQZMTzyaKYDq
        l1/IrY5OgxO0SDTIW7dLYUI=
X-Google-Smtp-Source: ABdhPJyodhIy3b6biA58amHmZjnvQq4nyDVjNDGAvrKAsLjjKYeZihDIwmPPHhe2+ewpkCAnODpbww==
X-Received: by 2002:a1c:2808:: with SMTP id o8mr2510138wmo.108.1597915813392;
        Thu, 20 Aug 2020 02:30:13 -0700 (PDT)
Received: from kozik-lap ([194.230.155.216])
        by smtp.googlemail.com with ESMTPSA id z8sm3045868wmf.10.2020.08.20.02.30.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Aug 2020 02:30:12 -0700 (PDT)
Date:   Thu, 20 Aug 2020 11:30:10 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Barry Song <baohua@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Viresh Kumar <vireshk@kernel.org>,
        Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Mans Rullgard <mans@mansr.com>, Jun Nie <jun.nie@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [RESEND PATCH 5/5] ARM: dts: zx: Align L2 cache-controller
 nodename with dtschema
Message-ID: <20200820093010.GA15884@kozik-lap>
References: <20200819175853.21492-1-krzk@kernel.org>
 <20200819175853.21492-5-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200819175853.21492-5-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Aug 19, 2020 at 07:58:53PM +0200, Krzysztof Kozlowski wrote:
> Fix dtschema validator warnings like:
>     l2-cache-controller@c00000: $nodename:0:
>         'l2-cache-controller@c00000' does not match '^(cache-controller|cpu)(@[0-9a-f,]+)*$'
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

I forgot to add the tag from Jun provided on previous submission:
Reviewed-by: Jun Nie <jun.nie@linaro.org>

Best regards,
Krzysztof

> ---
>  arch/arm/boot/dts/zx296702.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/zx296702.dtsi b/arch/arm/boot/dts/zx296702.dtsi
> index afd98de029be..f378c661b3bf 100644
> --- a/arch/arm/boot/dts/zx296702.dtsi
> +++ b/arch/arm/boot/dts/zx296702.dtsi
> @@ -58,7 +58,7 @@
>  			clocks = <&topclk ZX296702_A9_PERIPHCLK>;
>  		};
>  
> -		l2cc: l2-cache-controller@c00000 {
> +		l2cc: cache-controller@c00000 {
>  			compatible = "arm,pl310-cache";
>  			reg = <0x00c00000 0x1000>;
>  			cache-unified;
> -- 
> 2.17.1
> 
