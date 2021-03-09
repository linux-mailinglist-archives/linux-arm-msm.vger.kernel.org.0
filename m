Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3480E332FA2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Mar 2021 21:11:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230173AbhCIULW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Mar 2021 15:11:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231357AbhCIULV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Mar 2021 15:11:21 -0500
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06300C06175F
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Mar 2021 12:11:21 -0800 (PST)
Received: by mail-ot1-x32d.google.com with SMTP id 75so10825554otn.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Mar 2021 12:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=nDU8HEaDFt+U/tR130L3pHQ5tc1We6CEmFa3LppbPl4=;
        b=f4W/TVC9lKb+TyY8+3weZrNji11zh0olJ4lUgfR04OFYGlZtOKh1mXplBhsBSfvw4h
         lEkK6iRmCSDF1g2xpeflwz+x6Tza25ks2r7D0nPwDeloAqyNnnOmDo6mqSPL5IM9Cdmd
         XNWEQV+dNjys5OGPkdtiCLUHhek459X99aY+5sFIR6TQBJQaJ6tLx09cza3bT6aoZw1N
         CCY2YkVZrPJh7usKWLq4bPvAVQRjeQ8/2oX/HqSuQW77B8Uv8ogg6phKRQxmYSoMSOhd
         1eUYMLnT2btNngVwJVS8Y47VZ3uDxztdk1IiAhvcvaAXmQU9wuM49jbKyRh1Q8bMFrRW
         TXuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nDU8HEaDFt+U/tR130L3pHQ5tc1We6CEmFa3LppbPl4=;
        b=jiNfF/EI89v6O76zx+86RqLbQjF/OwwhlyKplJExjkE73uniN/nev6It7K/2+NxrXg
         smzzJaduVreaELrVO2hauLX/4rj4qvtZa4c9+rnqTW4Q7TbhSekYT2oR4OHp2avwBYB7
         O13YuI5jnh4uhEnFpI4/yRSJU25pSsOVgOGmRa7TZ2UmO7TgUVDIKeA4UC5TD9z49kBz
         /8A5aHb9j3yA/AyFpfuEiZwDdFroVPp0FyK2qM2IpwsP8jsUPPzWcYKX3mK/U9iiFl7F
         pyl77zpBy5RTS1VilamkMBzQhx0CZjMxbS0ARoXtIBoo4sAZQ1UrzVLgRhooSm/RrVdA
         LBKg==
X-Gm-Message-State: AOAM532l5s8R6PrQWvPbN9VgV9bfp8FG4UQrQVx+sxZCPSCtb5R8EynD
        jKLLSfvxAN5UAFp2RkGCEvfXSg==
X-Google-Smtp-Source: ABdhPJzoFq0F35X7H/P8NnCFd/JH+3u9SL+2b9pd3ZXLXZLantPepyGOiVNA5xWjB3aEmmIMq+Uwyg==
X-Received: by 2002:a05:6830:2050:: with SMTP id f16mr1100574otp.182.1615320680377;
        Tue, 09 Mar 2021 12:11:20 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id v9sm3068283oon.11.2021.03.09.12.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 12:11:19 -0800 (PST)
Date:   Tue, 9 Mar 2021 14:11:18 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     agross@kernel.org, linus.walleij@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] pinctrl: qcom: sc7280: Fix SDC1_RCLK configurations
Message-ID: <YEfWZqZaGElvklTj@builder.lan>
References: <1614662511-26519-1-git-send-email-rnayak@codeaurora.org>
 <1614662511-26519-2-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1614662511-26519-2-git-send-email-rnayak@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 01 Mar 23:21 CST 2021, Rajendra Nayak wrote:

> Fix SDC1_RCLK configurations which are in a different register so fix the
> offset from 0xb3000 to 0xb3004.
> 
> Fixes: ecb454594c43: ("pinctrl: qcom: Add sc7280 pinctrl driver")
> 

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Reported-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
>  drivers/pinctrl/qcom/pinctrl-sc7280.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-sc7280.c b/drivers/pinctrl/qcom/pinctrl-sc7280.c
> index 49c4347..9d41abf 100644
> --- a/drivers/pinctrl/qcom/pinctrl-sc7280.c
> +++ b/drivers/pinctrl/qcom/pinctrl-sc7280.c
> @@ -1440,7 +1440,7 @@ static const struct msm_pingroup sc7280_groups[] = {
>  	[173] = PINGROUP(173, qdss, _, _, _, _, _, _, _, _),
>  	[174] = PINGROUP(174, qdss, _, _, _, _, _, _, _, _),
>  	[175] = UFS_RESET(ufs_reset, 0xbe000),
> -	[176] = SDC_QDSD_PINGROUP(sdc1_rclk, 0xb3000, 15, 0),
> +	[176] = SDC_QDSD_PINGROUP(sdc1_rclk, 0xb3004, 0, 6),
>  	[177] = SDC_QDSD_PINGROUP(sdc1_clk, 0xb3000, 13, 6),
>  	[178] = SDC_QDSD_PINGROUP(sdc1_cmd, 0xb3000, 11, 3),
>  	[179] = SDC_QDSD_PINGROUP(sdc1_data, 0xb3000, 9, 0),
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
