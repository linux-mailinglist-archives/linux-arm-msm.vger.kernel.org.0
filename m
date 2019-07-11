Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 374B265A6C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2019 17:26:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729011AbfGKP0V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Jul 2019 11:26:21 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:44093 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728988AbfGKP0V (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Jul 2019 11:26:21 -0400
Received: by mail-pl1-f193.google.com with SMTP id t14so3192148plr.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jul 2019 08:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=xDOt/R012GpKF8HFEzGHxZ6VjWpUHMuTKXU3bjn70dk=;
        b=XSctE8NXzUrCLSA48gznsH/hlb0BzkA5MbyTNJycR46hL6HiqrgU/6XHxtjagPCsv0
         Vo4OMLScsUWTecg2LnFFpgUXJx7kXpn2DKRdohk/ZxtTbLQTwScsWKBBA/fqN09ZwpZH
         vL25IK6OAQx/Lydn0fgtrOITuktmovLNBnzi7SMhC1mwfgd6PJlGsLNEaFv8FC4zaaDB
         2ZoY2vdtm1JzNKi22EAZ8IjEMtitc645F+sidjRLsoP/lvLgDVE7c6oT+9Q0uQLSUvQ5
         pSTsqU1epdgnfCqfXlB4MjudmmiF77Nmvf1V4DYhkuIQPpNh9YBKJj3cB7MG57BETduu
         Gb2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xDOt/R012GpKF8HFEzGHxZ6VjWpUHMuTKXU3bjn70dk=;
        b=AR1IK99lEnCY3ZE5/dtpRuUv+YuTH1LTmANmgZiklleJuri/dQ27DNNjIBo4Le057G
         QB+y6bZUBwPIQzBNiibxbIzDsFXWRfpOac6iBwgULUIFEjKkkno7dWz7TFzv18xI/Y+O
         rPJqc7H0LWhDWY9XsE+aMJL67Z7R4pbo0x6RvaWwl4NIFtxxvWAD24X6GKuR0m9SBNDT
         edEUOdXYy5/o1+Rl7hSbYdJeNFOARpk683X32W1W1xeGY9s2K0nnb5s4tLuIRSc0mrDU
         fL+DldZqqewEtcMPKKlCdBxloThQ5hofrb7PFhj1Kw40tg9FBNnW/pl6e1Z3T3Lbq+3K
         9JZw==
X-Gm-Message-State: APjAAAUNflJ97zn9v4wL/vQLkUX8LUxOXuZI9fe0VJ1cA62S3JBDK0IT
        SQkkg4RH/eFNg8lN7HJcDRh4+Q==
X-Google-Smtp-Source: APXvYqwBujVJjsQORJ3cp1UkTkrULW8ipykYaV1DbpWN8jqWqpo9mYpGbrYwdO7z3fWkki2TUSWFgQ==
X-Received: by 2002:a17:902:b713:: with SMTP id d19mr5304484pls.267.1562858780510;
        Thu, 11 Jul 2019 08:26:20 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id c98sm5642922pje.1.2019.07.11.08.26.18
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 11 Jul 2019 08:26:19 -0700 (PDT)
Date:   Thu, 11 Jul 2019 08:27:30 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Cc:     sboyd@kernel.org, david.brown@linaro.org, jassisinghbrar@gmail.com,
        mark.rutland@arm.com, mturquette@baylibre.com, robh+dt@kernel.org,
        will.deacon@arm.com, arnd@arndb.de, horms+renesas@verge.net.au,
        heiko@sntech.de, sibis@codeaurora.org,
        enric.balletbo@collabora.com, jagan@amarulasolutions.com,
        olof@lixom.net, vkoul@kernel.org, niklas.cassel@linaro.org,
        georgi.djakov@linaro.org, amit.kucheria@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, khasim.mohammed@linaro.org
Subject: Re: [PATCH v3 14/14] arm64: defconfig: Enable HFPLL
Message-ID: <20190711152730.GN7234@tuxbook-pro>
References: <20190625164733.11091-1-jorge.ramirez-ortiz@linaro.org>
 <20190625164733.11091-15-jorge.ramirez-ortiz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190625164733.11091-15-jorge.ramirez-ortiz@linaro.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 25 Jun 09:47 PDT 2019, Jorge Ramirez-Ortiz wrote:

> The high frequency pll is required on compatible Qualcomm SoCs to
> support the CPU frequency scaling feature.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
> Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index fbbc065415d4..7cc4ad24dfe5 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -671,6 +671,7 @@ CONFIG_MSM_MMCC_8996=y
>  CONFIG_MSM_GCC_8998=y
>  CONFIG_QCS_GCC_404=y
>  CONFIG_SDM_GCC_845=y
> +CONFIG_QCOM_HFPLL=y
>  CONFIG_HWSPINLOCK=y
>  CONFIG_HWSPINLOCK_QCOM=y
>  CONFIG_ARM_MHU=y
> -- 
> 2.21.0
> 
