Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 645F3DF3C3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2019 19:02:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728267AbfJURCf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Oct 2019 13:02:35 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:41583 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728056AbfJURCf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Oct 2019 13:02:35 -0400
Received: by mail-pg1-f194.google.com with SMTP id t3so8163059pga.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2019 10:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=WE3loKlrNVB/ZMokowzJvbTFMxvuhMb9YXaUOyOSVIs=;
        b=fyyccYOpIWitmKoEpx17UlocsclWwBqBrNxi4Zk+T8JDNAl2JlzmcZmEqpCdkJsk+A
         6FLWxS6PA1P57yXjZB1JZj20O6IXVTN44FOn56ac2YMQ9lC3S5pWcs8qld6gPWggq2ZJ
         sGcB81xleT4y0FhrF55ZvOitoNpDFpfeS92wAPQu5WW1Np1Hzy8RNLm5CJERHWW/pzkb
         L6ZKWYIlJLS96pLUMFF1XkeMEDBir6K0ka0dCT8legbjLmOKIMDOf6FEhouWcp/zSaFM
         C8e98AaEkIqFQ7r0sTQEBRI91VnMIr7Xb4zv1dev8m0pRJuzOApa17tk1U/Z8gdinEeU
         sJsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=WE3loKlrNVB/ZMokowzJvbTFMxvuhMb9YXaUOyOSVIs=;
        b=JruZj6YmIWX0dJoaEzOpHLPyz4hTI4ITKyM4605LTqUJ0AzTXDTb8IQwgofFCQ4UkQ
         lj1fUVZ3fODwPEI8b1R+lrPVtc7awKmmnrzcH5rNEgrFMzAD4tVgwHyEQzPTPKC5RydI
         MdTQM8Gp3s47Tht3W/RjpoqYT0PS10vp/2ANSISwI+dxPrBhPCHx670DRpsivKcGGUWo
         YCR2uOsnITh/GkgiKuRx2id1nt/z/ljW+7h6SuRyh7/9EyElc/Iwuj1K2ww38qv27EVW
         OPMBzUkZ0g5kOolJ24hRWIchHSegN96eyRt01ElnSjj4i1mwPxH6Zekp7SFgsxgSsMDg
         3MbQ==
X-Gm-Message-State: APjAAAVqY1cHhIDoq+58/HuNiGhv8ylNkVCA8cAOVs/XH0cJeTEIdwDE
        Mq9U95Sslt7GvvWRQDgXfnAbDJYbXVw=
X-Google-Smtp-Source: APXvYqxkx0Ib7ad028RoCwLeMm+LVxnLlHQ02O1StO4rrIWDGonLkK0q6NhUDcJMB4WjucYPNuOHiw==
X-Received: by 2002:a63:ed4b:: with SMTP id m11mr19218482pgk.24.1571677354239;
        Mon, 21 Oct 2019 10:02:34 -0700 (PDT)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 18sm18824808pfp.100.2019.10.21.10.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2019 10:02:33 -0700 (PDT)
Date:   Mon, 21 Oct 2019 10:02:31 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     linus.walleij@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Subject: Re: [PATCH] pinctrl: qcom: sc7180: Add missing tile info in
 SDC_QDSD_PINGROUP/UFS_RESET
Message-ID: <20191021170231.GK571@minitux>
References: <20191021141507.24066-1-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191021141507.24066-1-rnayak@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 21 Oct 07:15 PDT 2019, Rajendra Nayak wrote:

> The SDC_QDSD_PINGROUP/UFS_RESET macros are missing the .tile info needed to
> calculate the right register offsets. Adding them here and also
> adjusting the offsets accordingly.
> 
> Fixes: f2ae04c45b1a ("pinctrl: qcom: Add SC7180 pinctrl driver")
> 
> Reported-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/pinctrl/qcom/pinctrl-sc7180.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-sc7180.c b/drivers/pinctrl/qcom/pinctrl-sc7180.c
> index 6399c8a2bc22..d6cfad7417b1 100644
> --- a/drivers/pinctrl/qcom/pinctrl-sc7180.c
> +++ b/drivers/pinctrl/qcom/pinctrl-sc7180.c
> @@ -77,6 +77,7 @@ enum {
>  		.intr_cfg_reg = 0,			\
>  		.intr_status_reg = 0,			\
>  		.intr_target_reg = 0,			\
> +		.tile = SOUTH,				\
>  		.mux_bit = -1,				\
>  		.pull_bit = pull,			\
>  		.drv_bit = drv,				\
> @@ -102,6 +103,7 @@ enum {
>  		.intr_cfg_reg = 0,			\
>  		.intr_status_reg = 0,			\
>  		.intr_target_reg = 0,			\
> +		.tile = SOUTH,				\
>  		.mux_bit = -1,				\
>  		.pull_bit = 3,				\
>  		.drv_bit = 0,				\
> @@ -1087,14 +1089,14 @@ static const struct msm_pingroup sc7180_groups[] = {
>  	[116] = PINGROUP(116, WEST, qup04, qup04, _, _, _, _, _, _, _),
>  	[117] = PINGROUP(117, WEST, dp_hot, _, _, _, _, _, _, _, _),
>  	[118] = PINGROUP(118, WEST, _, _, _, _, _, _, _, _, _),
> -	[119] = UFS_RESET(ufs_reset, 0x97f000),
> -	[120] = SDC_QDSD_PINGROUP(sdc1_rclk, 0x97a000, 15, 0),
> -	[121] = SDC_QDSD_PINGROUP(sdc1_clk, 0x97a000, 13, 6),
> -	[122] = SDC_QDSD_PINGROUP(sdc1_cmd, 0x97a000, 11, 3),
> -	[123] = SDC_QDSD_PINGROUP(sdc1_data, 0x97a000, 9, 0),
> -	[124] = SDC_QDSD_PINGROUP(sdc2_clk, 0x97b000, 14, 6),
> -	[125] = SDC_QDSD_PINGROUP(sdc2_cmd, 0x97b000, 11, 3),
> -	[126] = SDC_QDSD_PINGROUP(sdc2_data, 0x97b000, 9, 0),
> +	[119] = UFS_RESET(ufs_reset, 0x7f000),
> +	[120] = SDC_QDSD_PINGROUP(sdc1_rclk, 0x7a000, 15, 0),

PS. There's no drive-strength control of the rclk and I presume that's
why this is just specified as 0. It would be good if pinctrl-msm was
improved to be able to handle pins with bias, but no drive-strength
control and then this updated.

But we should merge this patch as is.

Regards,
Bjorn

> +	[121] = SDC_QDSD_PINGROUP(sdc1_clk, 0x7a000, 13, 6),
> +	[122] = SDC_QDSD_PINGROUP(sdc1_cmd, 0x7a000, 11, 3),
> +	[123] = SDC_QDSD_PINGROUP(sdc1_data, 0x7a000, 9, 0),
> +	[124] = SDC_QDSD_PINGROUP(sdc2_clk, 0x7b000, 14, 6),
> +	[125] = SDC_QDSD_PINGROUP(sdc2_cmd, 0x7b000, 11, 3),
> +	[126] = SDC_QDSD_PINGROUP(sdc2_data, 0x7b000, 9, 0),
>  };
>  
>  static const struct msm_pinctrl_soc_data sc7180_pinctrl = {
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
