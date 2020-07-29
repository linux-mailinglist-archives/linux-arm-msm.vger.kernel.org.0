Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3494231AA2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jul 2020 09:54:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726336AbgG2HyD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Jul 2020 03:54:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726290AbgG2HyD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Jul 2020 03:54:03 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE679C061794;
        Wed, 29 Jul 2020 00:54:02 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id 9so1802487wmj.5;
        Wed, 29 Jul 2020 00:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=/AF3ziGdsv+yHT1fe3PUelS/2zrWYP4f9GP8YSs/IPc=;
        b=MlUH8kBaFu79dJ7zTA7AxHX5vZnH3atVoFmXTrsQVk0XGmsKLFztoB8RZ+7l9NxADa
         heVEVjCRrLpA09FB0tMRmlYRxowPetxVox4fUGfZlhrkAWkhm5XbMuQR/wR4mC99k+g9
         gFlPUjreBiXvEg0CpWWx3HKClpA7t1wc1xde5lfEYfBQGgoSl+5QdqvsXm6bZ/8xqP0t
         wuw4MIhFh7v1oBZaAATh83lNhwaaRouCuYSFSUOsI89temx6LA2/4iMgieU5TMqAMf9N
         lRmg4rK+i0Ak753bQsVyCR1z76g1RZK7xAnLuGr5TD/feaWW7SY+keMpaAmcuFQyRJQT
         AKUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/AF3ziGdsv+yHT1fe3PUelS/2zrWYP4f9GP8YSs/IPc=;
        b=GENtcOLyOu9m2H9M1TRovl290K/0WFtAhFuDaqyMOlja9KD7e80wVxeySiwagiktA3
         gc20Ja7hb5pmhFPs7giPP1F1zMUyVcZwiZqISN/qInPz3rXbyLfhGDAAhr2OIfbYaD/u
         UsKGwqL1Slj/cWA2bGgMhEyKP8moqJqgHcz1fldeTxty0oJmWAT50KYKuJcri4EORtZn
         E5+vcQ8UHiOEZd04VvTzO0roiodrBDQGu1vvsZZflhfgfOwnRCDjpaacUJUZb/wGp/3K
         hAmb+cNsn5aSbZh4C7vEdD/n2rJGu/uA6dWuhKzKsx2R2DPvdVlGR1X6ux/qCJshOjKG
         BdYg==
X-Gm-Message-State: AOAM533NyosjHjJS+HYl1ExwqpvLW07WCrQ/OewglFRGQwMC4ipVOJZA
        YeaH6V6KKW88w43AVAqVM7JsM5p2bmY=
X-Google-Smtp-Source: ABdhPJxamnrbfIgoOPs5700FsQ5inek8s3ZEJ1uxRNAQLfIqnK+Jz1/HzqUtD7rdjPAG/HH75zH4Gg==
X-Received: by 2002:a1c:5f41:: with SMTP id t62mr7199927wmb.53.1596009241124;
        Wed, 29 Jul 2020 00:54:01 -0700 (PDT)
Received: from ziggy.stardust ([213.195.122.158])
        by smtp.gmail.com with ESMTPSA id t13sm3207810wru.65.2020.07.29.00.54.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2020 00:54:00 -0700 (PDT)
Subject: Re: [PATCH 1/2] soc: mediatek: mtk-infracfg: Fix kerneldoc
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20200729074415.28393-1-krzk@kernel.org>
From:   Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <92ac7165-765e-da75-4c0b-3b232521b5e9@gmail.com>
Date:   Wed, 29 Jul 2020 09:53:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200729074415.28393-1-krzk@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 29/07/2020 09:44, Krzysztof Kozlowski wrote:
> Fix W=1 compile warnings (invalid kerneldoc):
> 
>      drivers/soc/mediatek/mtk-infracfg.c:34: warning: Function parameter or member 'infracfg' not described in 'mtk_infracfg_set_bus_protection'
>      drivers/soc/mediatek/mtk-infracfg.c:34: warning: Excess function parameter 'regmap' description in 'mtk_infracfg_set_bus_protection'
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Queued for v5.9-next/soc

Thanks
Matthias

> ---
>   drivers/soc/mediatek/mtk-infracfg.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-infracfg.c b/drivers/soc/mediatek/mtk-infracfg.c
> index 341c7ac250e3..4a123796aad3 100644
> --- a/drivers/soc/mediatek/mtk-infracfg.c
> +++ b/drivers/soc/mediatek/mtk-infracfg.c
> @@ -19,7 +19,7 @@
>   
>   /**
>    * mtk_infracfg_set_bus_protection - enable bus protection
> - * @regmap: The infracfg regmap
> + * @infracfg: The infracfg regmap
>    * @mask: The mask containing the protection bits to be enabled.
>    * @reg_update: The boolean flag determines to set the protection bits
>    *              by regmap_update_bits with enable register(PROTECTEN) or
> @@ -50,7 +50,7 @@ int mtk_infracfg_set_bus_protection(struct regmap *infracfg, u32 mask,
>   
>   /**
>    * mtk_infracfg_clear_bus_protection - disable bus protection
> - * @regmap: The infracfg regmap
> + * @infracfg: The infracfg regmap
>    * @mask: The mask containing the protection bits to be disabled.
>    * @reg_update: The boolean flag determines to clear the protection bits
>    *              by regmap_update_bits with enable register(PROTECTEN) or
> 
