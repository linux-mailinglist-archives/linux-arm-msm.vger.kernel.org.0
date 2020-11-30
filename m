Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22C8A2C89A0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Nov 2020 17:35:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728881AbgK3Qed (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Nov 2020 11:34:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726213AbgK3Qed (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Nov 2020 11:34:33 -0500
Received: from mail-oo1-xc42.google.com (mail-oo1-xc42.google.com [IPv6:2607:f8b0:4864:20::c42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37197C0613D3
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Nov 2020 08:33:47 -0800 (PST)
Received: by mail-oo1-xc42.google.com with SMTP id t142so2805912oot.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Nov 2020 08:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=wF+KSfYEGboISQSOjgP2pMG62F3CaZKfxuQBmoNo6Lw=;
        b=KHTeyW9YWN46J6zn8dWFKNKuyXTJ+ZrpFUSnUzALlVa3LlUBzHLbpISiFJjZ1IfJ7k
         lmYm9BpYpbzpNaT18wPEzosYSmbPMUigfWbSTsVTNaUKkx4ADLwuL5b5cGJjwehHpIx9
         VeUTVt7N9m0+Vas/3VvB9+G7Aaeb/gchfJWx6qdk97nVbzneF2ayiNP7574m16GbmKhY
         noJvNMTrXNb/bWYP1DWIilgpjzEiWQT/kryKbeockUf/iKQAGqvqIGEg5PJQ/4zm81fE
         9P8PfNgCxIGSBWbg28DNGG5JFACDOUWTA+QHYRV5/QtJuBA2D1WkQsGP39iVLzcb4YGo
         Wzqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=wF+KSfYEGboISQSOjgP2pMG62F3CaZKfxuQBmoNo6Lw=;
        b=rOsNVdYOmEZ46gm5kvrF6Ya0lWqneUrplDds0eftpHOLhdYOzYEF+LEMtYwyQcdn2d
         9R+AvxyaMmKPnl/LS//9uJznrOJtIrnNnU2Oje24fQQycGDLS+r2Imapy+meGIf8PVl/
         HRI6WA45irID/LHFjrAxhngOu6B66Ta24RddejxrufrQifb03HcgV8+ZlnANm/xB8jet
         oMY8G444LI0fPt9GbDab+/qx5CCW2jcyW0j67gc9e/DPpmDepymkFoiBSh6n6gvLTtX4
         +355V8Ndg8O7THo9DAJYvid172o/V1AXdUUws7CIY9A5MSjiBWqoVIMvQnFsVJ3wc5jB
         +0kg==
X-Gm-Message-State: AOAM533DTPQYM7/bEcOcV1kgvQPk7VjXRwH/ORKkFqsjXw1RN2JnCuro
        hFO+ZQXg4SSRI60aOOA94fPEokR7AYrkBx/ZuQU=
X-Google-Smtp-Source: ABdhPJyjcGTdWTupTqlH6YUBnBmz9KTU+QtA2cbbLviGxqtyXgjGbM05figv88/NJ1CLaX5YrSHz6A==
X-Received: by 2002:a4a:9711:: with SMTP id u17mr15983851ooi.57.1606754026199;
        Mon, 30 Nov 2020 08:33:46 -0800 (PST)
Received: from Steevs-MBP.hackershack.net (cpe-173-175-113-3.satx.res.rr.com. [173.175.113.3])
        by smtp.gmail.com with ESMTPSA id g82sm10031114oib.38.2020.11.30.08.33.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Nov 2020 08:33:45 -0800 (PST)
Subject: Re: [PATCH] arm64: defconfig: Enable Qualcomm PON driver
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20201125023831.99774-1-bjorn.andersson@linaro.org>
From:   Steev Klimaszewski <steev@kali.org>
Message-ID: <b4d23c05-60b5-d7f9-f116-702a7abcc988@kali.org>
Date:   Mon, 30 Nov 2020 10:33:44 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <20201125023831.99774-1-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 11/24/20 8:38 PM, Bjorn Andersson wrote:
> The PON block in the PMIC provides, among other things, support for
> "reboot reason", power key and reset "key" handling. Let's enable the
> driver for this block.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index c9246f51085f..8e3ed05b655a 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -521,6 +521,7 @@ CONFIG_POWER_AVS=y
>  CONFIG_QCOM_CPR=y
>  CONFIG_ROCKCHIP_IODOMAIN=y
>  CONFIG_POWER_RESET_MSM=y
> +CONFIG_POWER_RESET_QCOM_PON=m
>  CONFIG_POWER_RESET_XGENE=y
>  CONFIG_POWER_RESET_SYSCON=y
>  CONFIG_SYSCON_REBOOT_MODE=y

Tested-by: Steev Klimaszewski <steev@kali.org>


