Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42F22419260
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Sep 2021 12:42:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233856AbhI0Koe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Sep 2021 06:44:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233827AbhI0Koe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Sep 2021 06:44:34 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CE26C061604
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Sep 2021 03:42:56 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id z184-20020a1c7ec1000000b003065f0bc631so77647wmc.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Sep 2021 03:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=bl3l80PLJwDnjPoaNYbvG3Z+vfpuSPjJGAmYGrPl1Y4=;
        b=kDhQYXhctmPax8BWT4MUKhzXGoZ8mPx8LMLOINhqUYV3MUr4X0A/ZLvxTikNd6/CA8
         WvBFrCd1W/Wnl0wf9u1H9Tb1Yb/C0Ud0C1JWmey+IcaZvCuAjJc2M5GgPuIFR8H5YcI0
         6f9L6Y5scExb76lRh4gJt+2rp52cbmlZWbogJQIm78QLF17Jbek0MGib2KUpFkoDG7MR
         4oIxmxM+E5kEO1zKdYS0ZcOyjoFfON66Jnpww5Q6aSWfebCLXkkicXZbwG3tbGUvEbgJ
         VCqOT21vRQoqaUULj/6I5NLuv90AGBsvVxhpsgN3rkKqM8puquBoZOANORH09LfxsiRl
         i5jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bl3l80PLJwDnjPoaNYbvG3Z+vfpuSPjJGAmYGrPl1Y4=;
        b=ONfncv/gIObEfwn4TyeTEbj6qLzTtV2q9x+8KSLD43Dy75TtXpbFi/jPHyKyVMOc/i
         jHQ4et1cbXwYyd1ioqSNBiTMb9sUX8Zcwqjx18IzwLOqzg9goCiwEc64SI9ttSy125ky
         TcmQcewiRBYqBoFrKQPKuxS1D1fhf2EfVqK3ctPNiApJfrRgmojW3yPledgYEUfg9L9b
         bJp7RF5+qfk5IUK2uGg8Qfh6GjT48DmE1yaLOXf58nuyszSjvR55MVV7LwD4lQ/XTXFC
         C1T6hulTRzp030vGY90k0JHr0eGmsu7cKLBpLiGobRJI4GMHOiIB2NbeTPKiQ2Jn9kUC
         FQaQ==
X-Gm-Message-State: AOAM530bRe+DCT3D9nOl2y9Yu3FZbh+Rk5ZuBQNukpQPwvjH1xjTkHvJ
        uPLqzP1simWu5gfJrqELLrPVEA==
X-Google-Smtp-Source: ABdhPJyPrHcwo/l44zFRoQnD/3cTUE6JBsBv7AeTjSfz3ViSTlBXNAeTSvaNS50OEFWy78/iNPp4+w==
X-Received: by 2002:a7b:c8da:: with SMTP id f26mr15176884wml.109.1632739374619;
        Mon, 27 Sep 2021 03:42:54 -0700 (PDT)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id i18sm16528281wrn.64.2021.09.27.03.42.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Sep 2021 03:42:54 -0700 (PDT)
Subject: Re: [PATCH v2 4/5] ASoC: codecs: tx-macro: Update tx default values
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, swboyd@chromium.org,
        judyhsiao@chromium.org
Cc:     Venkata Prasad Potturu <potturu@codeaurora.org>
References: <agross@kernel.org; bjorn.andersson@linaro.org;
 lgirdwood@gmail.com; broonie@kernel.org;robh+dt@kernel.org;
 plai@codeaurora.org; bgoswami@codeaurora.org; perex@perex.cz;
 tiwai@suse.com;srinivas.kandagatla@linaro.org; rohitkr@codeaurora.org;
 linux-arm-msm@vger.kernel.org; alsa-devel@alsa-project.org;
 devicetree@vger.kernel.org; linux-kernel@vger.kernel.org;
 swboyd@chromium.org; judyhsiao@chromium.org;>
 <1632313878-12089-1-git-send-email-srivasam@codeaurora.org>
 <1632313878-12089-5-git-send-email-srivasam@codeaurora.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <e65c77f4-766c-a5ce-9cbd-f1697c1be28c@linaro.org>
Date:   Mon, 27 Sep 2021 11:42:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1632313878-12089-5-git-send-email-srivasam@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 22/09/2021 13:31, Srinivasa Rao Mandadapu wrote:
> Update mic control register default values to hardware reset values
> 
> Fixes: c39667ddcfc5 (ASoC: codecs: lpass-tx-macro: add support for lpass tx macro)
> 
> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> ---
>   sound/soc/codecs/lpass-tx-macro.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
> index e980b2e..66c39fb 100644
> --- a/sound/soc/codecs/lpass-tx-macro.c
> +++ b/sound/soc/codecs/lpass-tx-macro.c
> @@ -279,7 +279,7 @@ static const struct reg_default tx_defaults[] = {
>   	{ CDC_TX_CLK_RST_CTRL_SWR_CONTROL, 0x00},
>   	{ CDC_TX_TOP_CSR_TOP_CFG0, 0x00},
>   	{ CDC_TX_TOP_CSR_ANC_CFG, 0x00},
> -	{ CDC_TX_TOP_CSR_SWR_CTRL, 0x00},
> +	{ CDC_TX_TOP_CSR_SWR_CTRL, 0x60},

This does not make sense as this register only has one bit to control.
Why do we even need to change this, can you please explain what happens 
if we do not change this?

>   	{ CDC_TX_TOP_CSR_FREQ_MCLK, 0x00},
>   	{ CDC_TX_TOP_CSR_DEBUG_BUS, 0x00},
>   	{ CDC_TX_TOP_CSR_DEBUG_EN, 0x00},
> @@ -290,8 +290,8 @@ static const struct reg_default tx_defaults[] = {
>   	{ CDC_TX_TOP_CSR_SWR_DMIC1_CTL, 0x00},
>   	{ CDC_TX_TOP_CSR_SWR_DMIC2_CTL, 0x00},
>   	{ CDC_TX_TOP_CSR_SWR_DMIC3_CTL, 0x00},
> -	{ CDC_TX_TOP_CSR_SWR_AMIC0_CTL, 0x00},
> -	{ CDC_TX_TOP_CSR_SWR_AMIC1_CTL, 0x00},
> +	{ CDC_TX_TOP_CSR_SWR_AMIC0_CTL, 0x0E},
> +	{ CDC_TX_TOP_CSR_SWR_AMIC1_CTL, 0x0E},

These two registers should have default value of 0x06 as this has only 
one clk selection field with bits 2:1.

-srini


>   	{ CDC_TX_INP_MUX_ADC_MUX0_CFG0, 0x00},
>   	{ CDC_TX_INP_MUX_ADC_MUX0_CFG1, 0x00},
>   	{ CDC_TX_INP_MUX_ADC_MUX1_CFG0, 0x00},
> 
