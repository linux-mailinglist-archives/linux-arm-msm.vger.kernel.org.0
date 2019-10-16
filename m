Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4658D8870
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2019 08:03:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731498AbfJPGDo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Oct 2019 02:03:44 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:41297 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726421AbfJPGDo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Oct 2019 02:03:44 -0400
Received: by mail-pg1-f196.google.com with SMTP id t3so13604944pga.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Oct 2019 23:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=T3AaA+xd4mdUluLNxKlBwgWXimT50aOOjAm086WDcRg=;
        b=k14SKKFhg+MCKc7BkdTTbY/cz6o/SmHSY8ToObQ0N3Ebxydl6rVf5aFzX7VN6car4K
         MVLvLuo5tPDV1vE2Y1g0BfCdHJLPN9IkyNreQ6v3qLFCXgz+OndJti7vTbUVkurFv98N
         VLVYRHiPkPB10KrEmCxI+DOIuzVE28mfq1VacfbhjBxQlrdyZ0ucWQQuIJSMhggmP4S5
         /XupeyH/jxzmR9mNFa9jdSxMGEUpFhm/gq2qcmvUSmanqapuzD+B4kCS66LqLc/YWS15
         W92yFJU1W4GTbix9eHzEB6/PeZJa+5lUgC4KWiOVo8JPqgyQGGyZrCAxByTKeAZW75yg
         ZJfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=T3AaA+xd4mdUluLNxKlBwgWXimT50aOOjAm086WDcRg=;
        b=qquMAhY9bAhH1gWN4cOQ3kHS42m4thwRwsjGTJuTjRWH1sLXpmWghQ57+109ZbTWS0
         qMgNoMn+n0BR8atgb5zUY03Km5hx1ONazySbn4jNFEsKx1V8iAVMDzfvBPpLx35BKtNx
         Wg7XQXKT0ciy39PiYYt9duL3RnXlEun1/O0+fS4/3HT+gJXJXlkTJTqSp/AxKN27Izq4
         bzKt0wZ6Qbgd3wyJJEmRehTSH3wir+C7iYMpiqNpg224OzQoXMIv9OKgxuhZjHkKPhu+
         k9/TTo1Gm3k2I2sp8m2umiKgK/24U1DqWUZr5kV9O1Puvk1ftWaHpZ0lnGqceDH5C3/1
         1UbQ==
X-Gm-Message-State: APjAAAWAjgvQ/EedTcTIEkFjyUmzBjUBuczAZgho39vTU09wEA/516Xf
        atJP7OYCJun5cBV1Io8M28XtdA==
X-Google-Smtp-Source: APXvYqzLK05iyhTKyl1v2KloPGgrLB7LEacVf7SN+L9WsqFPB+PouwGTpqa5kkyY5DfZba02HDvQOg==
X-Received: by 2002:a65:6091:: with SMTP id t17mr398775pgu.159.1571205822925;
        Tue, 15 Oct 2019 23:03:42 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id p24sm9426321pgc.72.2019.10.15.23.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2019 23:03:42 -0700 (PDT)
Date:   Tue, 15 Oct 2019 23:03:39 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Catalin Marinas <catalin.marinas@arm.com>,
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
        linux-arm-msm@vger.kernel.org, Alex Elder <elder@linaro.org>
Subject: Re: [PATCH] arm64: defconfig: Enable Qualcomm remoteproc dependencies
Message-ID: <20191016060339.GB4731@tuxbook-pro>
References: <20191009001442.15719-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191009001442.15719-1-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 08 Oct 17:14 PDT 2019, Bjorn Andersson wrote:

> Enable the the power domains, reset controllers and remote block device
> memory access drivers necessary to boot the Audio, Compute and Modem
> DSPs on Qualcomm SDM845.
> 
> None of the power domains are system critical, but needs to be builtin
> as the driver core prohibits probe deferal past late initcall.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Thanks Alex & Vinod!

Applied.

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
> -- 
> 2.18.0
> 
