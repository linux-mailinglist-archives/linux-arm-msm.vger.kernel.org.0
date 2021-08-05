Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECD3B3E1530
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Aug 2021 14:57:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241554AbhHEM56 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Aug 2021 08:57:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240155AbhHEM56 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Aug 2021 08:57:58 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3153EC0613C1
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 Aug 2021 05:57:43 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id l4so6963736ljq.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Aug 2021 05:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=pZbqm5rS9uY9gmvr3en4eNyV6i6PzvdvqtugR3RNZI4=;
        b=Zi5QS4ost9k+8KVdKBU7r03nUUtTVbc6SfPzr1I2afFxBj0e//LSNDbkaTWGXOSG9R
         fOGgzBcnPf+yiFA67ZO1C95AvyNAvEMWxn/95Hkkq8fgtU8WcUT/UgLKmLwTxthcr9HL
         Oj/4Kng4KtFmb934rG5hpXXxvCFHbsNG64AxzZ/P52ornKB29zHk+0ombK2+CqAK3Xkk
         CBEOo0DzKaWgfdbGwpRR/Y96fmY00RfHlWJK6rpywrxrzgqut1vpb8wHlJQUCHqylzQX
         WxTr5M95SKZgZaXGOnlm+gjD2caLSPuLc5GHKMszTovTLgYPWPz5LikLJsPUvo6/QABu
         1K0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pZbqm5rS9uY9gmvr3en4eNyV6i6PzvdvqtugR3RNZI4=;
        b=X08elHRY9fHiok5C5EELTUnsZsJo/Bj0zSCwq3aoD5okgAtUKScREbeBz5gcuL2P0K
         ybEeahNeiTx7GxB5zFoVM9tPVjUfF5rw4U1Qflozxa3xJa3BML1Ev5wAFGrCgSt/1RQl
         yP0gP42Hn1swlwcepEH4q2W1Bx/NzQJG3LS/2eOgDNPdblqR1XEQoPx6BORqhCx1QGgV
         OjBG9VaIp54HHqSLUA20F7fxFF9Sa20v9qCsx4djGCEuNIfM/vOTk56YZxO1bfKuUVQh
         xPqRFh9CrElP6opznVNVEtL+UddxS8PBVQJP4YLTjcEHsLII+NB/D/DMRz37FGrMBqR7
         1tqg==
X-Gm-Message-State: AOAM5305g6SObiD1xCFlUQKcGxPd0VsWFXorAI7h033SqZcZ+vBQkJ6j
        kXds6E6lLm9Uvq+SmcRZzQbPEQ==
X-Google-Smtp-Source: ABdhPJyZl78mfSg8C4X8bMAPnoTfiSQY/0XoV8C1PnyrVYJoW6qOSWIY4BtAKOAyd3Ke5NxYYt08zg==
X-Received: by 2002:a2e:7e0a:: with SMTP id z10mr3089416ljc.283.1628168261452;
        Thu, 05 Aug 2021 05:57:41 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id m13sm509172lfu.5.2021.08.05.05.57.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Aug 2021 05:57:41 -0700 (PDT)
Subject: Re: [PATCH v2] ARM: dts: qcom: apq8064: correct clock names
To:     David Heidelberg <david@ixit.cz>, linus.walleij@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Brian Masney <masneyb@onstation.org>
References: <20210707131453.24041-1-david@ixit.cz>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <5d11261e-592a-31cc-b3e2-5eee76681ec0@linaro.org>
Date:   Thu, 5 Aug 2021 15:57:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210707131453.24041-1-david@ixit.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/07/2021 16:14, David Heidelberg wrote:
> Since new code doesn't take old clk names in account, it does fixes
> error:
> 
> msm_dsi 4700000.mdss_dsi: dev_pm_opp_set_clkname: Couldn't find clock: -2
> 
> and following kernel oops introduced by
> b0530eb1191 ("drm/msm/dpu: Use OPP API to set clk/perf state").
> 
> Also removes warning about deprecated clock names.
> 
> Tested against linux-5.10.y LTS on Nexus 7 2013.
> 
> Reviewed-by: Brian Masney <masneyb@onstation.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
> - v2 improved commit message, added R-b
> 
>   arch/arm/boot/dts/qcom-apq8064.dtsi | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
> index 6005620ac297..96b7755afabf 100644
> --- a/arch/arm/boot/dts/qcom-apq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
> @@ -1262,9 +1262,9 @@ dsi0: mdss_dsi@4700000 {
>   				<&mmcc DSI1_BYTE_CLK>,
>   				<&mmcc DSI_PIXEL_CLK>,
>   				<&mmcc DSI1_ESC_CLK>;
> -			clock-names = "iface_clk", "bus_clk", "core_mmss_clk",
> -					"src_clk", "byte_clk", "pixel_clk",
> -					"core_clk";
> +			clock-names = "iface", "bus", "core_mmss",
> +					"src", "byte", "pixel",
> +					"core";
>   
>   			assigned-clocks = <&mmcc DSI1_BYTE_SRC>,
>   					<&mmcc DSI1_ESC_SRC>,
> 


-- 
With best wishes
Dmitry
