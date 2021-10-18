Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BFDD4323F4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Oct 2021 18:37:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233150AbhJRQjU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Oct 2021 12:39:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232251AbhJRQjU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Oct 2021 12:39:20 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BEC9C061745
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Oct 2021 09:37:09 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id y207so541102oia.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Oct 2021 09:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=L6u+YNaDZtPRetTG0ljC8h1IN8hHY7pl5qB7PDsL30o=;
        b=ed337YS85d0zgIbx8R3ZOudNI2q2vZe5ZEi+nXjRB//GpH140g62ZCxH3yA+gYQDcu
         +3HW503yW/iIs3XeM0BgozYPExQCXg40WY7IlzVACTQy1NU1V1JXUtSQoyjFXjcigaO/
         fF7TPkeoaK9AeLVwip1GG04X0Jruvsus+vzfEHJOSVPr+sB3Qme/ESARF1j7v8LEmUct
         XdZnjHmohmB+/bR7A9BBeo0bvdriNiXlTw2d6KshIwaZORiOvEX8WsAHXi+HKvSneFlQ
         uYBNSlnH/ZqJHM+GomxPjXxq7LU3JaOz8sJI9+VPw4z5pdeDAyUOK98stuasOYtQvuHi
         Zy+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=L6u+YNaDZtPRetTG0ljC8h1IN8hHY7pl5qB7PDsL30o=;
        b=FXM8ffJwfpvRBiD/jOUJ2n4PEDG7t+yRkZUj7yGsqyK7H2qbBTuDURorJmHhSpSn39
         NETN848PMDnjd66gy057IELI7DO9aaF1L5aPvtY9BR5iDAJNdxhFBfhDGPFpBoiTNxl3
         OxfjfwpNMKbpA27xnuFr2JVrJMlpCXZK4JLbsCsW3VGjIgCU7XaJhb6lSTtpWECP1o0S
         LJyLTT2MM+wsOm8jm2Viq21WwslDPlTzkJDoNroJzgcsdouMxp6lP6m5b9mCkLRJkaFI
         +4nc1mK3WR7+Bb9hSumlN9u0anCcWEHyAwK1Ea831z/SgEz9BmKRwgVJNJlZeqXM8R4v
         2TwA==
X-Gm-Message-State: AOAM532t+2nuF3FVRjt5ZtxoqXZvVh3K7P9guwEI/zXzOwNVihAMoDhd
        Il8tJMX7vhZaB5Vvli2wENjCWw==
X-Google-Smtp-Source: ABdhPJwKfsWSEtFUWuIBaOew7U6qb4+Pq5Sd13Sc0ld3Y5jH0TCFVDmEweLRBsfnmOmMmQfbASSzvA==
X-Received: by 2002:aca:5b07:: with SMTP id p7mr692644oib.14.1634575028496;
        Mon, 18 Oct 2021 09:37:08 -0700 (PDT)
Received: from [192.168.11.48] (cpe-173-173-107-246.satx.res.rr.com. [173.173.107.246])
        by smtp.gmail.com with ESMTPSA id h2sm3113551otr.37.2021.10.18.09.37.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Oct 2021 09:37:08 -0700 (PDT)
Message-ID: <5181cbf2-21bf-623b-9b63-6ecd25fdbcbe@kali.org>
Date:   Mon, 18 Oct 2021 11:37:06 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [PATCH] arm64: defconfig: Enable Qualcomm LMH driver
Content-Language: en-US
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Thara Gopinath <thara.gopinath@linaro.org>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20211017204036.2761122-1-bjorn.andersson@linaro.org>
From:   Steev Klimaszewski <steev@kali.org>
In-Reply-To: <20211017204036.2761122-1-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 10/17/21 3:40 PM, Bjorn Andersson wrote:
> With the introduction of LMH in '36c6581214c4 ("arm64: dts: qcom:
> sdm845: Add support for LMh node")' the CPUfreq gained a reference for
> the two interrupts from the LMh. This means that if the LMh driver isn't
> enabled CPUfreq will not probe and there's no frequency scaling.
>
> Enable LMh to make CPUfreq functional again on SDM845.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>   arch/arm64/configs/defconfig | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 86224aa3a74b..0ae6cd2748d2 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -577,6 +577,7 @@ CONFIG_TEGRA_BPMP_THERMAL=m
>   CONFIG_TEGRA_SOCTHERM=m
>   CONFIG_QCOM_TSENS=y
>   CONFIG_QCOM_SPMI_TEMP_ALARM=m
> +CONFIG_QCOM_LMH=m
>   CONFIG_UNIPHIER_THERMAL=y
>   CONFIG_WATCHDOG=y
>   CONFIG_SL28CPLD_WATCHDOG=m

Tested on the Lenovo Yoga C630

Tested-By: Steev Klimaszewski <steev@kali.org>

