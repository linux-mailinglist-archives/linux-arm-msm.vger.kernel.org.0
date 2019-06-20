Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A82F4CF8F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2019 15:50:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726757AbfFTNus (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Jun 2019 09:50:48 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:36857 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726675AbfFTNus (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Jun 2019 09:50:48 -0400
Received: by mail-lj1-f196.google.com with SMTP id i21so2789488ljj.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jun 2019 06:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=87/mmep8o4xjpng42pfKe0HvnZpFCEv5wyHUTYM4F04=;
        b=VkyHNmJKqo0qrBEXD8HTGqBxcqBDEgbYFFaxDPeiq1NCPLpeT3i4FhyPn+6E294uNa
         wLgstEm7V4BT2uRAGVrLmnFT8gWWzHOh/HxjX8bFdxwbEvp57J5LzK8jZ+j7Qm/gX5it
         furkKmT7oIWSMPN/GhA1TwUb9f2MdzK1hFlYr9NYmb7rFeFfpzL+ug4fOn5ZgYoadReA
         /dCD0iGDBzSl88mK7r8/u9D5m8O6brFsHMy18Rc7LvoCR2iaxOZvHL0rQP3miNDbjzkH
         PwgiF6NtOaaVZXeeFmPSqiA+n0fDrM6OocjmaZeo3GNl5IONVZgY6Vl7Vq5QSw6m9MPy
         L7uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=87/mmep8o4xjpng42pfKe0HvnZpFCEv5wyHUTYM4F04=;
        b=oi/hJERypmLJUXKMuNzCEKBLIx1lWi+SQokzjwbG0bhdfdZu4a7wNeb/xZBxGR5ABF
         jcYRfsAlwgkGfaaeSkuuJzP4rEagMROeIcrvKW0w5Hm99H8CcHM5WG/9ZhTI3TFh3RSz
         DOnrESerbFNa+hrh/g/OtoUhO+KPLLIM4dd74SWXsO6LSndMQzi667bmEotRsmFNIT2D
         H24/tEugNwhU922AxlJzamnhw9iL6XK0VzBJHpw+5yf2ahh3m9Pl7p7HCgEkzSx0ZkgP
         V70MjfcA+yxihXhsfc0xkEOdGkIBOA0SbtJoGp8xsGM+ayDCiWBgBHeuzGyDTIAsbiaq
         8oQg==
X-Gm-Message-State: APjAAAWsNq7WDgbzGWiuAOmM5nAwGQNv9QGTvxrkBjSrbi9z0NTiyusd
        Qd+nEJfn/6VYsb16/oafO5foPA==
X-Google-Smtp-Source: APXvYqxwnFna5l+CRnQ7eSfwSQ0TT6LbGX6hIoEfl7KwqgiayhTFixuAgZgGdrIsH5TwcHjccMaC/Q==
X-Received: by 2002:a2e:81c4:: with SMTP id s4mr58341729ljg.182.1561038646384;
        Thu, 20 Jun 2019 06:50:46 -0700 (PDT)
Received: from centauri (m83-185-80-163.cust.tele2.se. [83.185.80.163])
        by smtp.gmail.com with ESMTPSA id e26sm3537359ljl.33.2019.06.20.06.50.44
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 20 Jun 2019 06:50:45 -0700 (PDT)
Date:   Thu, 20 Jun 2019 15:50:43 +0200
From:   Niklas Cassel <niklas.cassel@linaro.org>
To:     Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Cc:     agross@kernel.org, david.brown@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, jeffrey.l.hugo@gmail.com
Subject: Re: [PATCH] arm64: dts: qcom: qcs404-evb: fix vdd_apc supply
Message-ID: <20190620135043.GA16411@centauri>
References: <20190619181653.29407-1-jorge.ramirez-ortiz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190619181653.29407-1-jorge.ramirez-ortiz@linaro.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jun 19, 2019 at 08:16:53PM +0200, Jorge Ramirez-Ortiz wrote:
> The invalid definition in the supply causes the Qualcomm's EVB-1000
> and EVB-4000 not to boot.
> 
> Fix the boot issue by correctly defining the supply: vdd_s3 (namely
> "vdd_apc") is actually connected to vph_pwr.
> 
> Reported-by: Niklas Cassel <niklas.cassel@linaro.org>
> Tested-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/qcs404-evb.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
> index b6092a742675..11c0a7137823 100644
> --- a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
> @@ -65,7 +65,7 @@
>  };
>  
>  &pms405_spmi_regulators {
> -	vdd_s3-supply = <&pms405_s3>;
> +	vdd_s3-supply = <&vph_pwr>;
>  
>  	pms405_s3: s3 {
>  		regulator-always-on;
> -- 
> 2.21.0
> 

Tested-by: Niklas Cassel <niklas.cassel@linaro.org>
