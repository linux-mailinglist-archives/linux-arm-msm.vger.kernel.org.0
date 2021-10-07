Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D39A4254DF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Oct 2021 15:57:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241742AbhJGN64 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Oct 2021 09:58:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241788AbhJGN6z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Oct 2021 09:58:55 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4DA8C061755
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Oct 2021 06:57:01 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id o20so19366863wro.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Oct 2021 06:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kQq0xCGqotFLmmvs4jPCrD6mVz7A9gMb8nAtNV0dxeM=;
        b=HWsW/9OcJDxgqkkiBU5+qjxZoCSIB1shHRB+Sb9HVtqJ4XUIq8IHStPoon98fq5AlA
         tQL18prYExD5HuJ/q51xDAIxa73iSTqP+caEJgVhotTekYDxw3GzzTrUzl3xD1kbIbte
         GSGrDPY7amQU1ZtLPxS+v7aoyzRwH1/x6XGBgrCsOa3k7ygT5YXUoMCJwPORlfJD/VBe
         RPd70qF/boWR6xWNPKzUrZgvA8SpqW6YnEjut8ZWGpwDtiNsIFb6eyEGdv9/BkgESm1W
         X1+I/n7PQewysIaWhfp3QoAzDTOdUG/O0FGplrFvZS0GnO5/VSvVehqEaWvq5eBLjzj9
         o6hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kQq0xCGqotFLmmvs4jPCrD6mVz7A9gMb8nAtNV0dxeM=;
        b=Ym3BI+OmDLjJzD16AZ5EL8Uv29KpSvxevodmu7f23ONYz/O604xQMWL+vBhdb5Uigw
         vilo/xQRGEC63/SoOOJPgYprpg6JGdcVgb2XQf8wWxHEMNi2E6xY69otS5HsXJ7MS3Ef
         FqSBe0PwToeOcbvlT71aih4CjBJesDVDd3hDeyWfrJdsEPD7lmpcHKEF7SuBb3/L8bs3
         mCCMM0ZBJ23fYbBIYu9El/cs2dwXtqdPwO2SCEsSzzuuEBep82K872AlStj3MPjaZCzX
         f0b5iclR0yAmz43YhZk7014Ps2fU03CcCIJtnmca+OqGIJWx5ZetXje5CV+TKbK5g8xf
         FY+A==
X-Gm-Message-State: AOAM530sKER68iJ4pWeNittyPoLmNgs+KwgyYXFMg9w8jJdLXH4Jcag9
        E7It81OQXZ6u/wyBN5Uol1WgoA==
X-Google-Smtp-Source: ABdhPJxHCzaN93g3HhmQUt/+mxJ7EZDf5b2xG9w94uqi//2O64Y6WdJ6bv5skd3oTFllx0TjKqLm7A==
X-Received: by 2002:adf:c70b:: with SMTP id k11mr5478970wrg.154.1633615020393;
        Thu, 07 Oct 2021 06:57:00 -0700 (PDT)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id q18sm8800003wmc.7.2021.10.07.06.56.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Oct 2021 06:56:59 -0700 (PDT)
Subject: Re: [PATCH] ASoC: codec: wcd938x: Add irq config support
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, swboyd@chromium.org,
        judyhsiao@chromium.org
Cc:     Venkata Prasad Potturu <potturu@codeaurora.org>
References: <1633614675-27122-1-git-send-email-srivasam@codeaurora.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <217797a8-b37d-9084-f2de-b9162e21718f@linaro.org>
Date:   Thu, 7 Oct 2021 14:56:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1633614675-27122-1-git-send-email-srivasam@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 07/10/2021 14:51, Srinivasa Rao Mandadapu wrote:
> This patch fixes compilation error in wcd98x codec driver.
> 
> Fixes: 045442228868 ("ASoC: codecs: wcd938x: add audio routing and Kconfig")
> 
> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>

LGTM,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


> ---
>   sound/soc/codecs/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
> index 82ee233..216cea0 100644
> --- a/sound/soc/codecs/Kconfig
> +++ b/sound/soc/codecs/Kconfig
> @@ -1583,6 +1583,7 @@ config SND_SOC_WCD938X_SDW
>   	tristate "WCD9380/WCD9385 Codec - SDW"
>   	select SND_SOC_WCD938X
>   	select SND_SOC_WCD_MBHC
> +	select REGMAP_IRQ
>   	depends on SOUNDWIRE
>   	select REGMAP_SOUNDWIRE
>   	help
> 
