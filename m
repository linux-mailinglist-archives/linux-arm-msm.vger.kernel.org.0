Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF61343CDE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2019 17:38:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728540AbfFMPiO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jun 2019 11:38:14 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:42449 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727086AbfFMPiN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jun 2019 11:38:13 -0400
Received: by mail-pl1-f193.google.com with SMTP id go2so8294593plb.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2019 08:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=NsCl+jcY3prb6sL8d4R7dMFJh2KQ7NpmK3YBOqHAoNM=;
        b=Wsz0h2gxegM8cTTN62AKR3fOsoZrE9ufIqMw3Peexu+eaBFtEUgcgEcawREWwquMoa
         A6o30acE27+qdgYeXPRKS+r+gY+CnxGpJTwfgeOFwDYU368HN5TEr+Km5RLfBSp4T1nf
         S1CUhNQI3bT7N7ZUFzPs+nK+0f/nE70Rc/QucXUDAK6VM329pQHw/R2ZF1zfn05Kyhbz
         AsmtdUR6uS9EJcgpqUSMqBHKximAI0zLDuPqCysCeUyY1x+vFd3q96o4A0qIolZeXMRx
         Ii5F9g4hxHf3JJsOlS7BoT3H6A9lCE/eaZdFX2/1i0RysQWtdujBX/+yVYQKDjLMzoqe
         Z4Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=NsCl+jcY3prb6sL8d4R7dMFJh2KQ7NpmK3YBOqHAoNM=;
        b=H++AFx2LmG/IF8oSrfnk9Gy6qs28HEDPnMR0FobIBEellu48UsHiGfzA6/45mM8G3g
         CoSU7uy/ZPRay9Cl6pfS+uBghyzklI4OkKY9wXBVV2JgHW8/s2T4u53OnxDdMLU6yQQT
         D3aXFzSIVC0IzVnVVEVkkugUUSbwsjFA5DewvUSoaas0tQsCOUHd4fmBKp5DCOXnPR24
         Ma1JFqT3LVC90LpEJUUnHzatYP37zp/ixx+b88DbsJdH+mvXuA5zX5LbnOSPNfTtsx1J
         KAz10y/0Mh62IOXyCkg94XJgcvVzRL+jXKSFYeOLBR4RLlmvVgcfHstUwHUo8uKIs3j7
         lShQ==
X-Gm-Message-State: APjAAAWl2qrrSBa94J+iS3W/usjHehbjNTRe3g0MEMhHiMGgJOW9dTNg
        5yX6Lx8rItz6yFi9UCPeAwBOyg==
X-Google-Smtp-Source: APXvYqw2bFFTvTat1VVEhfhx9vDMP+Oe+aWwmaNVtjrNNXdKoUetz2qyIKgh+6lRBxS2DNVjMTo5xA==
X-Received: by 2002:a17:902:9f93:: with SMTP id g19mr72995347plq.223.1560440293028;
        Thu, 13 Jun 2019 08:38:13 -0700 (PDT)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id f10sm44348pfd.151.2019.06.13.08.38.12
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Jun 2019 08:38:12 -0700 (PDT)
Date:   Thu, 13 Jun 2019 08:38:10 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Amit Kucheria <amit.kucheria@linaro.org>
Subject: Re: [PATCH v2] clk: qcom: msm8916: Don't build by default
Message-ID: <20190613153810.GG6792@builder>
References: <d654907d-a3a2-a00f-d6f5-3a34ae25ebcf@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d654907d-a3a2-a00f-d6f5-3a34ae25ebcf@free.fr>
User-Agent: Mutt/1.10.0 (2018-05-17)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 13 Jun 08:09 PDT 2019, Marc Gonzalez wrote:

> QCOM_A53PLL and QCOM_CLK_APCS_MSM8916 stand out as the only options
> built by default. Let's bring them back in line with the rest.
> 
> Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>

This looks reasonable

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
> Changes from v1:
> - Drop the default altogether, instead of changing it to 'default MSM_GCC_8916'
> ---
>  drivers/clk/qcom/Kconfig | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index e1ff83cc361e..6461a1aa7325 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -21,7 +21,6 @@ if COMMON_CLK_QCOM
>  
>  config QCOM_A53PLL
>  	tristate "MSM8916 A53 PLL"
> -	default ARCH_QCOM
>  	help
>  	  Support for the A53 PLL on MSM8916 devices. It provides
>  	  the CPU with frequencies above 1GHz.
> @@ -31,7 +30,6 @@ config QCOM_A53PLL
>  config QCOM_CLK_APCS_MSM8916
>  	tristate "MSM8916 APCS Clock Controller"
>  	depends on QCOM_APCS_IPC || COMPILE_TEST
> -	default ARCH_QCOM
>  	help
>  	  Support for the APCS Clock Controller on msm8916 devices. The
>  	  APCS is managing the mux and divider which feeds the CPUs.
> -- 
> 2.17.1
