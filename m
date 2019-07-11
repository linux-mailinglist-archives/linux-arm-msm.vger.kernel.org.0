Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F9AB65A8F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2019 17:37:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728532AbfGKPhG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Jul 2019 11:37:06 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:38921 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728377AbfGKPhG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Jul 2019 11:37:06 -0400
Received: by mail-pg1-f195.google.com with SMTP id u17so3122825pgi.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jul 2019 08:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9q5e5xsE6UxbmvyByXA+T20mGnA1lQm57hTSJ8K1J6c=;
        b=WirpxiIcaTZJLjiGHmjvKbWIuxyqKSaAOWWXitxjrgTIuR7qbwoRJ2CGeMeBLRm1YW
         yw1ORYVGE0f77F2r5ZvyBboEzPO6ysNKVLB4mVRm7HWoWIox4uuWjHg0VI9ownVbkaoD
         S5oFK33zkdztHh5wAjS64D78P/pQSM14Mtu8i95jPa9G0AYH6Ffbf8hrQx6Cb/Uv3+Q7
         +V0sX88zCbxJhx9VKkR8o45PFL07SnLY7T714rbRWEiUghXFjoszW1KQiiwYaX9S3EBP
         VuTmsJ3MThSPtlz4beuWAbemPL9aaqUNJSvXKJ/bY+NKsnkLnXDPWH31xU+8p0gNqt6v
         qAuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9q5e5xsE6UxbmvyByXA+T20mGnA1lQm57hTSJ8K1J6c=;
        b=MKpWxMxkVQeTn+trbxQofsVtx9rMJ8Kgmq7VzN7hQGux9i4tvQawA6WQ7DXHLhnxOF
         Hoh/EMPixiW0x3/6B1vRu4PJji4DDfcKx8inwZaTsRKqWN782d2XSZkxSZ19iaaiyqso
         XOMLSa1RzFillJSRLVHH3GXxd2RBCkB0+PdwdYD3xi2dcn4wjesOvN4pdYmloZ5o+FRk
         pj+ee2deSMkJkPa2wNr9uVTeRw2Ph3Y3E6iYKj8SGGCU+K/EoaDAa1iHVONBw+HULhaE
         qTK7DDYk15p4/jgp/AcZrJK8ZNuH8/K9riCfO2KfrTQ6RnNde0ycrhRTgVELiJWCed5F
         G8tw==
X-Gm-Message-State: APjAAAXT3psWmAd8TQWJjRLffyp9qa9vNcTD4jzpld7arx4dL6uZdqIh
        wS7SRKHkR3N83P9u0OYtZ4Qs1Q==
X-Google-Smtp-Source: APXvYqzuqvMH6AXJCqhmNmJ/utjIj6ugh+olGsdA8MnlNSZPH9ZRkxrUsWy/oAinWZYwXeLc/WH/tg==
X-Received: by 2002:a63:5b52:: with SMTP id l18mr5084750pgm.21.1562859425665;
        Thu, 11 Jul 2019 08:37:05 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id o32sm5562157pje.9.2019.07.11.08.37.04
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 11 Jul 2019 08:37:05 -0700 (PDT)
Date:   Thu, 11 Jul 2019 08:38:16 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vivek Gautam <vivek.gautam@codeaurora.org>
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        jcrouse@codeaurora.org, rishabhb@codeaurora.org,
        vnkgutta@codeaurora.org, evgreen@chromium.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] soc: qcom: llcc: Rename llcc-sdm845 to llcc-plat
Message-ID: <20190711153816.GQ7234@tuxbook-pro>
References: <20190711110340.16672-1-vivek.gautam@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190711110340.16672-1-vivek.gautam@codeaurora.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 11 Jul 04:03 PDT 2019, Vivek Gautam wrote:

> To avoid adding files for each future supported SoCs rename
> the file to a generic name - llcc-plat, so that llcc configuration
> tables for other SoCs can be added in the same driver.
> 

We've had a generic LLCC Kconfig option and then a specific SDM845 one,
with this change we have two different generic options and both would
either always be enabled or disabled.

So I think you should drop QCOM_SDM845_LLCC and build both llcc-slice
and llcc-plat into the same qcom_llcc.ko instead.

Regards,
Bjorn

> Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
> ---
>  drivers/soc/qcom/Kconfig                        | 10 +++++-----
>  drivers/soc/qcom/Makefile                       |  2 +-
>  drivers/soc/qcom/{llcc-sdm845.c => llcc-plat.c} |  0
>  3 files changed, 6 insertions(+), 6 deletions(-)
>  rename drivers/soc/qcom/{llcc-sdm845.c => llcc-plat.c} (100%)
> 
> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> index a6d1bfb17279..8110d415b18e 100644
> --- a/drivers/soc/qcom/Kconfig
> +++ b/drivers/soc/qcom/Kconfig
> @@ -62,13 +62,13 @@ config QCOM_LLCC
>  	  to clients that use the LLCC. Say yes here to enable LLCC slice
>  	  driver.
>  
> -config QCOM_SDM845_LLCC
> -	tristate "Qualcomm Technologies, Inc. SDM845 LLCC driver"
> +config QCOM_PLAT_LLCC
> +	tristate "Qualcomm Technologies, Inc. platform LLCC driver"
>  	depends on QCOM_LLCC
>  	help
> -	  Say yes here to enable the LLCC driver for SDM845. This provides
> -	  data required to configure LLCC so that clients can start using the
> -	  LLCC slices.
> +	  Say yes here to enable the LLCC driver for Qcom platforms, such as
> +	  SDM845. This provides data required to configure LLCC so that
> +	  clients can start using the LLCC slices.
>  
>  config QCOM_MDT_LOADER
>  	tristate
> diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
> index eeb088beb15f..3bf26667d7ee 100644
> --- a/drivers/soc/qcom/Makefile
> +++ b/drivers/soc/qcom/Makefile
> @@ -21,6 +21,6 @@ obj-$(CONFIG_QCOM_SMSM)	+= smsm.o
>  obj-$(CONFIG_QCOM_WCNSS_CTRL) += wcnss_ctrl.o
>  obj-$(CONFIG_QCOM_APR) += apr.o
>  obj-$(CONFIG_QCOM_LLCC) += llcc-slice.o
> -obj-$(CONFIG_QCOM_SDM845_LLCC) += llcc-sdm845.o
> +obj-$(CONFIG_QCOM_PLAT_LLCC) += llcc-plat.o
>  obj-$(CONFIG_QCOM_RPMHPD) += rpmhpd.o
>  obj-$(CONFIG_QCOM_RPMPD) += rpmpd.o
> diff --git a/drivers/soc/qcom/llcc-sdm845.c b/drivers/soc/qcom/llcc-plat.c
> similarity index 100%
> rename from drivers/soc/qcom/llcc-sdm845.c
> rename to drivers/soc/qcom/llcc-plat.c
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
