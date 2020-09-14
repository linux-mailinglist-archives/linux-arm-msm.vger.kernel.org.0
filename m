Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F4CA26894A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Sep 2020 12:30:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726434AbgINKaI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Sep 2020 06:30:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726429AbgINKaD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Sep 2020 06:30:03 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 848A2C06174A
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2020 03:30:02 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id 67so11163521pgd.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2020 03:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=aV1NwayJ9g5Ich31O6EePYi9dUvdkGUF1VlXhnHhYCw=;
        b=Tulk7gRDG0oL9MYWLhfdDz/c8MRLXQLarTfG4raYD8kfPn9BFXl7C9E6YsaCSytyto
         f0QC6E79XoMggJNKTvbEk9l6I2zGozMPqBy4jHLVLHo89HqIPDX1cD82gG6Y7FZ9H4Lv
         EQL6JF9hGy8eYadiy8vpjX1zJ3/GlhHKZ/1zXmIc9rokfxACMBWH0Dpe3eos3S5cOgzB
         6VQcLzUtqyDRsqBBGRbyN85MlTC5Ja4aUcwNdvqbFVT+HJ6stynm4+R8Ha87zsL5QMRs
         hcIvdnCdOWUbNFg8BqCpYYYSgsj17Rt1LOOsW/hovAPGYbUGqTGIWYS/uaxAD7T4YfA8
         Wqeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=aV1NwayJ9g5Ich31O6EePYi9dUvdkGUF1VlXhnHhYCw=;
        b=LNCBgLN9Zu90X9gUG6VmtQTSQLVjI6Q7vdN98bdAwGEiNIbdpbdggiB4yPcwjOsFUd
         JqbnwW0x+UgUtCSiMEZ9BqQRZWB+/ig4xMQBZxkBKXOZPHJNeL7JBZh99d0suirpm0jB
         mASeTUQhwf7GTajViDDgozBGE81RDl57eVvwmPKQ/uuah5FxrKN+MyP412vddI/YG9HP
         t91ZPk6YzhrS0JOWQUq0SNGioRZJNqaDFrdaFD0llJKOtJO4RzojZ4sNwu2DJbrHu9b7
         6RREiUmf6rKWUT0YTtsa7fMxRGGRoyXTxhHoMO8oC1IuxMXEJ0ecAiCUntQpPI+cgj3a
         5Fqg==
X-Gm-Message-State: AOAM5332LCZDuNLhb7bPmO00VP9PmGwmg/ZC7XfuE1GPtxriGp3b3z9j
        BLzM1RWkn2At9E3vVrjxG1h5
X-Google-Smtp-Source: ABdhPJzo1JgcREdbm0ZO59wVSR1fnUpuwnfNT1SOJf28S+H1jG7IlQsfi96MVWCKY7RREmLOWfGu6w==
X-Received: by 2002:a62:8349:: with SMTP id h70mr13313397pfe.47.1600079401814;
        Mon, 14 Sep 2020 03:30:01 -0700 (PDT)
Received: from mani-NUC7i5DNKE ([2409:4072:6d84:8e8a:d537:f870:596d:5afa])
        by smtp.gmail.com with ESMTPSA id f4sm9276526pfj.147.2020.09.14.03.29.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Sep 2020 03:30:01 -0700 (PDT)
Date:   Mon, 14 Sep 2020 15:59:56 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3] pinctrl: qcom: sm8250: correct sdc2_clk
Message-ID: <20200914102956.GA19867@mani-NUC7i5DNKE>
References: <20200914091846.55204-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200914091846.55204-1-dmitry.baryshkov@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Sep 14, 2020 at 12:18:46PM +0300, Dmitry Baryshkov wrote:
> Correct sdc2_clk pin definition (register offset is wrong, verified by
> the msm-4.19 driver).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> Fixes: 4e3ec9e407ad5058003309072b37111f7b8c900a
> ---
>  drivers/pinctrl/qcom/pinctrl-sm8250.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-sm8250.c b/drivers/pinctrl/qcom/pinctrl-sm8250.c
> index a660f1274b66..826df0d637ea 100644
> --- a/drivers/pinctrl/qcom/pinctrl-sm8250.c
> +++ b/drivers/pinctrl/qcom/pinctrl-sm8250.c
> @@ -1308,7 +1308,7 @@ static const struct msm_pingroup sm8250_groups[] = {
>  	[178] = PINGROUP(178, WEST, _, _, _, _, _, _, _, _, _),
>  	[179] = PINGROUP(179, WEST, _, _, _, _, _, _, _, _, _),
>  	[180] = UFS_RESET(ufs_reset, 0xb8000),
> -	[181] = SDC_PINGROUP(sdc2_clk, 0x7000, 14, 6),
> +	[181] = SDC_PINGROUP(sdc2_clk, 0xb7000, 14, 6),
>  	[182] = SDC_PINGROUP(sdc2_cmd, 0xb7000, 11, 3),
>  	[183] = SDC_PINGROUP(sdc2_data, 0xb7000, 9, 0),
>  };
> -- 
> 2.28.0
> 
