Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BE5542958D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Oct 2021 19:23:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234038AbhJKRZJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Oct 2021 13:25:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233933AbhJKRZI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Oct 2021 13:25:08 -0400
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67B6CC061570
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Oct 2021 10:23:08 -0700 (PDT)
Received: by mail-qt1-x82a.google.com with SMTP id b12so9020825qtq.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Oct 2021 10:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=uGPKx5GffFzz3pG0w0I86F4Gyd0SMLRg6JWzRHrdVj8=;
        b=j/LwGQIPGXMj+IP16OjneTPFmGFX3IiId5c0xPKLPKbwBxb+ri5dvAczC5l6VjcbID
         fFxqPgPfJbWF/jCqYzeSI5okUXS/5KtGBaCAo9nhmz09nrrfkHYpH22JXK2CPOUld3CJ
         MRhvxbK16FKOMCHpBq0nUvkIhEeAdBmI7zyMMwIupqVJbilMcEE/XYPD7TwArKicVNUg
         Z/ZnqZ3BUUqEoMcu9GfcwYSgocfhEJOVwngUWzOuP5NikKxflSOq78AVLQkKOIk0j3Yf
         LhRxsJJPeDaAHTKKsWE7vkHNTEUXjKhDrp+WYltSZSJC1Uq/sxTsgX5NL3E/YyCLruWq
         P4SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uGPKx5GffFzz3pG0w0I86F4Gyd0SMLRg6JWzRHrdVj8=;
        b=kvS6xxhvWbBv8XVAWzlkrCYAd4O+p3I0GrM2dxhEaH9mLzxcuDLiLw6HwzOnqy5zDS
         FPDqTWKrct5x4Lls3P1dPewosvNlYs7slxicCmX4PYvfS1g+Q1cX5Jwm+m4LAQKAblGT
         2lhoJK0ChiZBBYXHbOo1SwEStz+2GE7R3kQlL+4X0HShI4Q5AK345yh3aq7SoN54IprM
         MN4wPHnr4ZUuLeio9ZKxKOxa6J42qK/5rMGH1v7a82jg3G8qgaDHbdG+dYHylpX6vxui
         X55egSccZDqPc7M9vgmCwM4suionL/q+T4sGiXydSOGT2nvIKCP/buL3fkvcSGynfSyj
         phuA==
X-Gm-Message-State: AOAM533+0aF/eVjWEFBpTpAgzgYHMGwpTnKE8MK+wKQCWaua9rOd+wRN
        QJ//ws94lvX65z3knzS6p616gA==
X-Google-Smtp-Source: ABdhPJyJsVaf3evduEV4KoyFOOXMEZwD5bUJu8xIkuI3/Pqy2DH0a7wjJnhk1K+tZnMHKUdqDwZEZQ==
X-Received: by 2002:ac8:5a:: with SMTP id i26mr16263932qtg.269.1633972987500;
        Mon, 11 Oct 2021 10:23:07 -0700 (PDT)
Received: from [192.168.1.93] (pool-71-163-245-5.washdc.fios.verizon.net. [71.163.245.5])
        by smtp.gmail.com with ESMTPSA id o21sm843542qtq.86.2021.10.11.10.23.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Oct 2021 10:23:07 -0700 (PDT)
Subject: Re: [PATCH] arm64: dts: sdm845: Fix Qualcomm crypto engine bus clock
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20211011095534.1580406-1-vladimir.zapolskiy@linaro.org>
From:   Thara Gopinath <thara.gopinath@linaro.org>
Message-ID: <7007a7e9-dbe8-6dc8-7811-bf9ba2271499@linaro.org>
Date:   Mon, 11 Oct 2021 13:23:06 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211011095534.1580406-1-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/11/21 5:55 AM, Vladimir Zapolskiy wrote:
> The change corrects the described bus clock of the QCE.
> 
> Fixes: 3e482859f1ef ("dts: qcom: sdm845: Add dt entries to support crypto engine.")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

Thanks for the fix.

Reviewed-by: Thara Gopinath <thara.gopinath@linaro.org>

> ---
>   arch/arm64/boot/dts/qcom/sdm845.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index b051adfed4a9..79a87eeee090 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -2376,7 +2376,7 @@ crypto: crypto@1dfa000 {
>   			compatible = "qcom,crypto-v5.4";
>   			reg = <0 0x01dfa000 0 0x6000>;
>   			clocks = <&gcc GCC_CE1_AHB_CLK>,
> -				 <&gcc GCC_CE1_AHB_CLK>,
> +				 <&gcc GCC_CE1_AXI_CLK>,
>   				 <&rpmhcc 15>;
>   			clock-names = "iface", "bus", "core";
>   			dmas = <&cryptobam 6>, <&cryptobam 7>;
> 

-- 
Warm Regards
Thara (She/Her/Hers)
