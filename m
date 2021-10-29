Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E83934405CF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Oct 2021 01:34:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231154AbhJ2XhS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Oct 2021 19:37:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbhJ2XhS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Oct 2021 19:37:18 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6005CC061570;
        Fri, 29 Oct 2021 16:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
        Subject:Sender:Reply-To:Cc:Content-ID:Content-Description;
        bh=j7tHi0E9ih/9DxtgnPEaBt+ylaL3mB87At5hWcxuYws=; b=YK4TYPb3aLg1TwJlPFgKath8XD
        2Nh8o4rROJjgQ6rxBPbrktgRo1BsIZ4IHrYuB0zeQ7UvC4Z/fAkH90msTRchu7lytqOC4RHBKfbjX
        22+3tU+gAV+fZTuDEUlRkCCnbm/RSiUSdDZGpefHfL7MgbopbTieGnsRmrU4X7FDPw5xAWij9d/6V
        iWMXQMTsQ1I28JzjaqOiWaI2sLo3Y2zlrjDboRslvmWI5TVLKFCbZ69tRECJ4Z5s5DlXcoo/vtbhv
        IDqyT+h4ma31IiU+PDlgxZJbkGUYUsTVaGHL4ZM6jsYH84aTRhIfB7UgQoL8kl5ufxHBGaFPwOlTn
        LBJ1VOnw==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mgbOY-00CWMP-Uz; Fri, 29 Oct 2021 23:34:47 +0000
Subject: Re: [PATCH v4 2/2] ASoC: qcom: SC7280: Add machine driver
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        srinivas.kandagatla@linaro.org, rohitkr@codeaurora.org,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        swboyd@chromium.org, judyhsiao@chromium.org
References: <1635519876-7112-1-git-send-email-srivasam@codeaurora.org>
 <1635519876-7112-3-git-send-email-srivasam@codeaurora.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <4d1ca1b5-6656-1b3b-65a0-c05c92824d18@infradead.org>
Date:   Fri, 29 Oct 2021 16:34:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1635519876-7112-3-git-send-email-srivasam@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/29/21 8:04 AM, Srinivasa Rao Mandadapu wrote:
> diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
> index cc7c1de..d9ffcb7 100644
> --- a/sound/soc/qcom/Kconfig
> +++ b/sound/soc/qcom/Kconfig
> @@ -152,4 +152,16 @@ config SND_SOC_SC7180
>   	  SC7180 SoC-based systems.
>   	  Say Y if you want to use audio device on this SoCs.
>   
> +config SND_SOC_SC7280
> +	tristate "SoC Machine driver for SC7280 boards"
> +	depends on I2C && SOUNDWIRE
> +	select SND_SOC_QCOM_COMMON
> +	select SND_SOC_MAX98357A
> +	select SND_SOC_LPASS_RX_MACRO
> +	select SND_SOC_LPASS_TX_MACRO
> +	help
> +	  To add support for audio on Qualcomm Technologies Inc.
> +	  SC7280 SoC-based systems.
> +	  Say Y if you want to use audio device on this SoCs.

	  Say Y or M if you want to use audio devices on this SoC.

-- 
~Randy
