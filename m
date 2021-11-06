Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8829A446F33
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Nov 2021 18:08:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229526AbhKFRLT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 6 Nov 2021 13:11:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234649AbhKFRLS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 6 Nov 2021 13:11:18 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82BEEC06120A
        for <linux-arm-msm@vger.kernel.org>; Sat,  6 Nov 2021 10:08:36 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 13so2609717ljj.11
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 Nov 2021 10:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Ra1BXH1mMvzlfwLf58YXxvKpl4xCKYL2+7bQMH4f4Ic=;
        b=hWfhd4WqhxVia6qAP5I/BmZbVOUE4pK+zqJjZHKsaLaUfg5wRZf7VAOYoW/DeaPqAA
         gc68u2rfPx+J1au61skDN471TEkBm39v0Sp01b1mrfY7jDE2u3eDqoc37e02iaf3qrVN
         BIZjwVIDunb9dZnZ8y+JhLR+fGnd7J0o13cd7FT14GsIIwXWB38mzTaWSKtKJnc2Wjff
         AqHvCsPwNEDWma0kf6/quSSzd5pCCVvBCBOzQsQZ3jE2r+H25jsXmbgPXeCArRwwh9RL
         QcG2HfR0NqNDcCq7gz1iNCUqdiB1yoiiRAvYaihkFnPEU0W9g34okj6Znl+VtRoJ7r0t
         fmLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ra1BXH1mMvzlfwLf58YXxvKpl4xCKYL2+7bQMH4f4Ic=;
        b=T25FvPNXuabjNFeTCcukIjRz/CFziBxJOJ1RIVJwfHfE0+Nhw3aQAt8FTl1jo/5sg4
         GN7I3l7p97Go0qkj3wtWN2y3V51RsplcfDw4iznBcZTXEQq0fnlAJdeXTW68YOZDf45a
         HZtBNyE168UTYqldZff3bDUptP6haP5Q4+QxyAeSP9jhihWCcW2eSNmwVDUU11uFN9Qk
         mOAhdgrgLHdYd9PNWY+04bGnZDkvReCcCHG2SnBKianPQ7MpkRynlUKPr/YU6f/7ZJZK
         vzksyIGBGfHgAaEM2Qn/qBOvyoY+5ao7Gl042u6Ybn8Pv0vi7rC69ohYrOcTR3dPCGYQ
         JFXQ==
X-Gm-Message-State: AOAM532GE4KY7j+LSMJl2ysn9xm7xrj5MhgLsZY50PpGcyGMq9kBa9ZT
        gF+jubiGmKTrKGqqUX8/jqZwbbnBgcjTL2KO
X-Google-Smtp-Source: ABdhPJxFRw4c4lV8pU6p+Q3c3cW6wkyhE3Zgn4ouE51tUvxu3ICTcvN9+7ZPfxD0MjrJoWTxBpwxmg==
X-Received: by 2002:a2e:91d4:: with SMTP id u20mr3210304ljg.92.1636218514622;
        Sat, 06 Nov 2021 10:08:34 -0700 (PDT)
Received: from [192.168.1.102] (62-248-207-242.elisa-laajakaista.fi. [62.248.207.242])
        by smtp.gmail.com with ESMTPSA id u9sm1212394lfo.87.2021.11.06.10.08.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Nov 2021 10:08:34 -0700 (PDT)
Subject: Re: [PATCH] pinctrl: qcom: sm8350: Correct UFS and SDC offsets
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20211104170835.1993686-1-bjorn.andersson@linaro.org>
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Message-ID: <51217da2-958d-124e-c84d-27b1432e0f37@linaro.org>
Date:   Sat, 6 Nov 2021 19:08:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20211104170835.1993686-1-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/4/21 7:08 PM, Bjorn Andersson wrote:
> The downstream TLMM binding covers a group of TLMM-related hardware
> blocks, but the upstream binding only captures the particular block
> related to controlling the TLMM pins from an OS. In the translation of
> the driver from downstream, the offset of 0x100000 was lost for the UFS
> and SDC pingroups.
> 
> Fixes: d5d348a3271f ("pinctrl: qcom: Add SM8350 pinctrl driver")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>   drivers/pinctrl/qcom/pinctrl-sm8350.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-sm8350.c b/drivers/pinctrl/qcom/pinctrl-sm8350.c
> index 4d8f8636c2b3..1c042d39380c 100644
> --- a/drivers/pinctrl/qcom/pinctrl-sm8350.c
> +++ b/drivers/pinctrl/qcom/pinctrl-sm8350.c
> @@ -1597,10 +1597,10 @@ static const struct msm_pingroup sm8350_groups[] = {
>   	[200] = PINGROUP(200, qdss_gpio, _, _, _, _, _, _, _, _),
>   	[201] = PINGROUP(201, _, _, _, _, _, _, _, _, _),
>   	[202] = PINGROUP(202, _, _, _, _, _, _, _, _, _),
> -	[203] = UFS_RESET(ufs_reset, 0x1d8000),
> -	[204] = SDC_PINGROUP(sdc2_clk, 0x1cf000, 14, 6),
> -	[205] = SDC_PINGROUP(sdc2_cmd, 0x1cf000, 11, 3),
> -	[206] = SDC_PINGROUP(sdc2_data, 0x1cf000, 9, 0),
> +	[203] = UFS_RESET(ufs_reset, 0xd8000),
> +	[204] = SDC_PINGROUP(sdc2_clk, 0xcf000, 14, 6),
> +	[205] = SDC_PINGROUP(sdc2_cmd, 0xcf000, 11, 3),
> +	[206] = SDC_PINGROUP(sdc2_data, 0xcf000, 9, 0),
>   };
>   
>   static const struct msm_gpio_wakeirq_map sm8350_pdc_map[] = {
> 

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

--
Best wishes,
Vladimir
