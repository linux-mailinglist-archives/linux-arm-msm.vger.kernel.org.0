Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62477D2A5C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2019 15:07:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388015AbfJJNHP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Oct 2019 09:07:15 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:45447 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387917AbfJJNHP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Oct 2019 09:07:15 -0400
Received: by mail-io1-f66.google.com with SMTP id c25so13378980iot.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2019 06:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zlF+lm3JRhGGGTiYfCuwp6G/d6yyrmwzyu8GIS+igK4=;
        b=H1dTyMBFIxWKLe11ms1NCdcfBtCBpqXVkW+dP5rVr0WIdme7EQjM/pMm7lcwrIxxM8
         OSmpVngDeVcQJH6WBnFGd5CBlGk1jJn2wITfkXttoIYjJGOc9j6F8GEHm3hqKHUFR7b/
         E463+H76GPy5mHM7FEZ7YO0YV1dEHrrpuEFQTn+9VnXu+uMyin7MPc3glOXQCQpc9IZJ
         h+wVKXChEJU3K1WkMUkwl77tP3C65QvxLJAw4MCzbDlN5OhboWRLuKZZ/E6WGVleIRqd
         Sq69NsqFHpZ7UT1ak4bUVHSqs8JR/AiW3d7uap6GqMi0sq9dGkAHTxvbkTrRyKpv4snl
         7ktA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zlF+lm3JRhGGGTiYfCuwp6G/d6yyrmwzyu8GIS+igK4=;
        b=NlH+75cPbwAGsdhhZw4mY6mAo5JrY5rQKnVihxRl1MkZQ4DmO88sndSM+pBaEvtEjx
         L9zslPX4slXBKoIefD4dXp7tzwIO9ezOsNeEalfH+vnNVgQDe96HbtMoJsPMtbqtUIQL
         CSKxbWRnjr45ahn+jLb6HD6HAzYPSaVZV1KPgr2iyr1nXWfACZaB+7f0jyUVH2WqCDMX
         o8km6TPO9ZwFW8oI9U+8Arg2VB+z3z+nf8QOjI9JNLjq4j2Pph8YOFaqEccuhJIpv/T/
         lUqHdUh8k4D1bAHEi9llNdD5KVc9rq6XcdRNL/xXAFeit8i1V8FgmQGWFT4Wz6879D1J
         orWg==
X-Gm-Message-State: APjAAAXrB5KbEM4RkqXJ4PRDLfE3nQbVpAcPRoH6MczWUqN902JeWmG8
        icXoOPng8gODtGifKkWXFunongkxqrw=
X-Google-Smtp-Source: APXvYqyAjQRQelOCSKOee17IGyMMbI3XhdVPttdK72+RBX5FZw+MN5wAbpJ99qPYf6OKqWinlI7l9w==
X-Received: by 2002:a92:7e91:: with SMTP id q17mr6655ill.22.1570712833738;
        Thu, 10 Oct 2019 06:07:13 -0700 (PDT)
Received: from [172.22.22.26] (c-71-195-29-92.hsd1.mn.comcast.net. [71.195.29.92])
        by smtp.googlemail.com with ESMTPSA id i26sm3491521iol.84.2019.10.10.06.07.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Oct 2019 06:07:12 -0700 (PDT)
Subject: Re: [PATCH] arm64: defconfig: Enable Qualcomm remoteproc dependencies
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Maxime Ripard <mripard@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Anson Huang <Anson.Huang@nxp.com>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20191009001442.15719-1-bjorn.andersson@linaro.org>
From:   Alex Elder <elder@linaro.org>
Message-ID: <cc0482aa-10fe-9a49-da2d-6f30b130da3d@linaro.org>
Date:   Thu, 10 Oct 2019 08:07:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191009001442.15719-1-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/8/19 7:14 PM, Bjorn Andersson wrote:
> Enable the the power domains, reset controllers and remote block device
> memory access drivers necessary to boot the Audio, Compute and Modem
> DSPs on Qualcomm SDM845.
> 
> None of the power domains are system critical, but needs to be builtin
> as the driver core prohibits probe deferal past late initcall.

I asked Bjorn privately about the need for these to be built in,
and he clarified:

> However, Rob Herring introduced a nice feature last year that means that
> if you request a power-domain from a driver that has not yet probed at
> late_initcall that request will fail instead of returning EPROBE_DEFER.
> So compiling these as modules will, based on kernel module load order,
> cause intermittent failures to probe the consumer drivers.

So that's what "the driver core prohibits probe deferral past late
initcall" means, and better explains the issue that requires some of
these to be built-in rather than be built as kernel modules.

I was able to test with and without this applied, and I find that without
the patch the modem won't boot, and it boots successfully when used.

Tested-by: Alex Elder <elder@linaro.org>

> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  arch/arm64/configs/defconfig | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index c9a867ac32d4..42f042ba1039 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -732,10 +732,13 @@ CONFIG_RPMSG_QCOM_GLINK_SMEM=m
>  CONFIG_RPMSG_QCOM_SMD=y
>  CONFIG_RASPBERRYPI_POWER=y
>  CONFIG_IMX_SCU_SOC=y
> +CONFIG_QCOM_AOSS_QMP=y
>  CONFIG_QCOM_COMMAND_DB=y
>  CONFIG_QCOM_GENI_SE=y
>  CONFIG_QCOM_GLINK_SSR=m
> +CONFIG_QCOM_RMTFS_MEM=m
>  CONFIG_QCOM_RPMH=y
> +CONFIG_QCOM_RPMHPD=y
>  CONFIG_QCOM_SMEM=y
>  CONFIG_QCOM_SMD_RPM=y
>  CONFIG_QCOM_SMP2P=y
> @@ -780,6 +783,8 @@ CONFIG_PWM_ROCKCHIP=y
>  CONFIG_PWM_SAMSUNG=y
>  CONFIG_PWM_SUN4I=m
>  CONFIG_PWM_TEGRA=m
> +CONFIG_RESET_QCOM_AOSS=y
> +CONFIG_RESET_QCOM_PDC=m
>  CONFIG_RESET_TI_SCI=y
>  CONFIG_PHY_XGENE=y
>  CONFIG_PHY_SUN4I_USB=y
> 

