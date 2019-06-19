Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60C404C0B9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2019 20:22:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729988AbfFSSWa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Jun 2019 14:22:30 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:34458 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729937AbfFSSWa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Jun 2019 14:22:30 -0400
Received: by mail-pf1-f195.google.com with SMTP id c85so99848pfc.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jun 2019 11:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=a3CSSzDK/AfPhvZqKleGWuu8i4FE7xZqKr9xr1bgsR4=;
        b=E3au49N7pyG8Io5LsggllSx7dglzDxJO/ZYCU/ZSTkVipycqePAt9z+5/9dH+ZrnZ2
         Krlr/654u5Ze421V3VWXqsZPmNeL8bLe+SAZEROt+8KSZm+Nkn8dntnbwFLYPLVnR+lO
         kH0E7SlhlfFUdQ/W3p+WK3k4kPpccPSmKT/4Vxzy41XJLzHf18XGXYvBeRnvFp7JOPej
         x/7WgYM+/FzjjC8n8K1HG4QmVxe7RPEO5/RX/F75WNrD3pyjLcR9Pv4PROpp3Yb4jkWp
         3Nq5EgxniciE3TZoH4FCdBf+jjl8CwZC8op2/RZJnW6SH5ctaAcfZ5qxIlmvJxdNbomv
         ZfGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=a3CSSzDK/AfPhvZqKleGWuu8i4FE7xZqKr9xr1bgsR4=;
        b=Jbkpl4fP48c4ndcfGuAHxD46BBfmV3DSDn142Dkl4B/hnUZTgUOlIJNlWa1cqvKYks
         c2NrvWNNlo6PLzoxK5uibc72xWYGUyZRparUHBjVJKD3mCq62IIX3HTTCc94e6MOkfRc
         AwAt62Ps/Tt30DQVN+qEwcKpowW+CjiHyyrE88dvm4EajWHP1aCxRm0oYiPbEk+sm/va
         iOs2d37eJmqXSw56Ms7x4VWXiAsqAhL+y2izUEMKCge8+/MJNq193DN3ito+OAjYfCz+
         8w8AK+TV47PAMsI2+ax8+eepzgerXLUTWMk46SsN+afgGdnOTPbcSb98dsyPCLIimqH3
         oYHg==
X-Gm-Message-State: APjAAAUeR8V59Dw/x5ifo1kraMnrm/JHqfdtzkf9Q/DXP2iBUtLoJtg2
        Uwxwgymcb4b0UOUliVX7XCCwOQ==
X-Google-Smtp-Source: APXvYqyClqoHUcsBhAU04+uak3wpSqFomnm3WV7QpPGMHHCZMQNt6kymBIn1p6Xcwa/SNOlnvkRkdw==
X-Received: by 2002:a63:6ec1:: with SMTP id j184mr9025604pgc.225.1560968549190;
        Wed, 19 Jun 2019 11:22:29 -0700 (PDT)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id p15sm16736653pgj.61.2019.06.19.11.22.27
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 19 Jun 2019 11:22:28 -0700 (PDT)
Date:   Wed, 19 Jun 2019 11:22:26 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Cc:     agross@kernel.org, david.brown@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeffrey.l.hugo@gmail.com, niklas.cassel@linaro.org
Subject: Re: [PATCH] arm64: dts: qcom: qcs404-evb: fix vdd_apc supply
Message-ID: <20190619182226.GK4814@minitux>
References: <20190619181653.29407-1-jorge.ramirez-ortiz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190619181653.29407-1-jorge.ramirez-ortiz@linaro.org>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 19 Jun 11:16 PDT 2019, Jorge Ramirez-Ortiz wrote:

> The invalid definition in the supply causes the Qualcomm's EVB-1000
> and EVB-4000 not to boot.
> 
> Fix the boot issue by correctly defining the supply: vdd_s3 (namely
> "vdd_apc") is actually connected to vph_pwr.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

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
