Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F06D430C65
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Oct 2021 23:48:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344648AbhJQVul (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 17 Oct 2021 17:50:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235532AbhJQVuk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 17 Oct 2021 17:50:40 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AECCCC06161C;
        Sun, 17 Oct 2021 14:48:30 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id d3so62639538edp.3;
        Sun, 17 Oct 2021 14:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=ITGf3Vut+UtfM5ROln1N/6R5L6xjw1Qa66IquNt0VX0=;
        b=pIj8cJf1PaxAJHiENRkrKCsVEVbYyq12M5M+03O8pvDGJtwLnctyfkQsQBxi1cDNsh
         Bm9EHMLGOuN8UOMABFUhM5FqnkVGyohZd2LMicC2n8Zsme+qAcbbOUIJiit8LzyJpLX9
         HMQmQL88lfCHVkNLTzI3Ng9mCpCAd7E7A1aA29+7C0FBqfaTr8I4YTUxxZ1RCLSf+lQI
         OVpZiiz0kfHaktgvLvekhpC5s7+S3cRZ68ah/4/CvTtvMBZ3Ye0qhasHsxsxBRR64WaE
         /+dveRTIs9gPgwUHa6RzOxRccmfy1rEzKtJXfN5uu98OJrfcvPCvHbzpaMCZaNP7N5q4
         VZtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ITGf3Vut+UtfM5ROln1N/6R5L6xjw1Qa66IquNt0VX0=;
        b=3jPjxamLm4EXHcLdw/jeAkjsEP6Sdib3Syy0zqIo1RUXX5GxvaH2fRcBZ7yKBnRYOM
         6FFWHCNSrsQmVTahbC6cPkQWGZdvhcFoGB5RGKRCWu7AZks6BnPL5L7kFGoENh+g1hEN
         A8UmDeGVO+XA0yOrat1BiWINCEYpRA0S66OSE+mKR+/BuF2dEhX1h9y3JADfaH4+9eKg
         1QRlqzbfbvVDjr3tFJfCUzuXV1/mZs3FYbqgPzrhs6+BzHEW2ShOEMSCotBw45whAJl7
         DBxPu3ty1NTT+LY1i5MBHwtNjvDG9A5qRI8oC6RV7ZSZ7kBp1aVokiK0o8CRKh9yKNqG
         EsSw==
X-Gm-Message-State: AOAM531J+jR97FBsPfW29LU/MPXJWDtegR87PMMfcX2BnDIE7X7doaZo
        9jWc6N+nFZW1q/+LMa0JtTXllBXuRGg=
X-Google-Smtp-Source: ABdhPJztx1eDLgYw4evWkOoN9NC0xZuTnGQe2a/Ve5fx1hR5UuVGY6KoRxO7zMOxUV/cWYu49I6umQ==
X-Received: by 2002:a05:6402:1d55:: with SMTP id dz21mr39135677edb.164.1634507309335;
        Sun, 17 Oct 2021 14:48:29 -0700 (PDT)
Received: from [192.168.74.110] (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id bi23sm8014211ejb.122.2021.10.17.14.48.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Oct 2021 14:48:28 -0700 (PDT)
Message-ID: <fb4e2523-65f0-3353-9469-1015af328935@gmail.com>
Date:   Mon, 18 Oct 2021 00:48:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH] clk: qcom: gcc-sm6115: Fix offset for
 hlos1_vote_turing_mmu_tbu0_gdsc
Content-Language: en-US
To:     Shawn Guo <shawn.guo@linaro.org>, Stephen Boyd <sboyd@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210919022308.24046-1-shawn.guo@linaro.org>
From:   Iskren Chernev <iskren.chernev@gmail.com>
In-Reply-To: <20210919022308.24046-1-shawn.guo@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 9/19/21 05:23, Shawn Guo wrote:
> It looks that the offset 0x7d060 is a copy & paste from above
> hlos1_vote_turing_mmu_tbu1_gdsc.  Correct it to 0x7d07c as per
> downstream kernel.

You're right, 0x7d07c is the right offset, my bad.

> Fixes: cbe63bfdc54f ("clk: qcom: Add Global Clock controller (GCC) driver for SM6115")
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---
>  drivers/clk/qcom/gcc-sm6115.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/gcc-sm6115.c b/drivers/clk/qcom/gcc-sm6115.c
> index bc09736ece76..68fe9f6f0d2f 100644
> --- a/drivers/clk/qcom/gcc-sm6115.c
> +++ b/drivers/clk/qcom/gcc-sm6115.c
> @@ -3242,7 +3242,7 @@ static struct gdsc hlos1_vote_turing_mmu_tbu1_gdsc = {
>  };
>  
>  static struct gdsc hlos1_vote_turing_mmu_tbu0_gdsc = {
> -	.gdscr = 0x7d060,
> +	.gdscr = 0x7d07c,
>  	.pd = {
>  		.name = "hlos1_vote_turing_mmu_tbu0",
>  	},
> 

Acked-by: Iskren Chernev <iskren.chernev@gmail.com>
