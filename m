Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88F63143279
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2020 20:36:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727009AbgATTgm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jan 2020 14:36:42 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:45335 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726607AbgATTgm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jan 2020 14:36:42 -0500
Received: by mail-pg1-f196.google.com with SMTP id b9so144154pgk.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jan 2020 11:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=kV18ZB3OdaVHnupftfiGPuw+5EOO07kYgb5mXEqEo+k=;
        b=EIan6DgANAg+4ke6Cn/EoZM5Bkx1BLqgja/FLOcAN7QnF6He78WJH/Fc98ZouFNhuX
         p7wS/vsDuAYEk5X+RK0kYx58xYRN+yB2zW9H/RrC99OIgCATBEvlqvXPGcoC6xAj2fnC
         9j9uH9RJXpgSXzXV0r/ShpvW+w5/8EBI6tHmW+w0sV+E0gkSBBnhFHzPbzHznAi2imvB
         DK5O5VMWQm3LUF8rt8+s1KZxBrATrMfa4EdW0b3Ah6MOIdFFXKoZw6IZWaqIgwNCBp0k
         jAc6hmZakXqfgKPEssaLtGBwZKHrzHvxp6hHnKE3DO6Q54tioEtNGpp5Rqx/N+cp0p3s
         Eb9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kV18ZB3OdaVHnupftfiGPuw+5EOO07kYgb5mXEqEo+k=;
        b=HJykZNdzeYht6xc4JaG3RcwtGmEToxbkFGUTRccAvk1MM+UoRhCam/u43mk5aRotFW
         sy34huRN8wlJSlCmlpq4l4kE0nMrBgEjHpywDrbvE+kk9cNTV2Eji0dCVpI6V74klHzd
         hpRpJX2xrgRaUbaRYMKLXQYm9Hlux3H2lpmMnMvHQ0EdsP/HDifkHWX9VipkmJKEPS+t
         KIevegvnzevRfBnVQ8ALNySfzWwFA6s7TsRIAQhhbTl+gFudQMxZwcuB7hjWZmU8CnwD
         4Gu2EzVywNf0yEVz5vWLvYJQGGIqNiqKrdJIsqouI5/TORiRK/X05eHVkHXxp6CvCxW1
         LkDg==
X-Gm-Message-State: APjAAAXVlw7ZiJh7c3hKDgfLfUVoRQ6RSFurG7IsERWyCqGJrZjGoP3c
        t7TseGP0YoimfNp3A+l16xrS9A==
X-Google-Smtp-Source: APXvYqzZSgL5iovEwaLITIBxMYmbfTg8/ef5G7Tf37jgVvwlVQ2dIYbc+ZkQ88Yeufnv8XVA4/Oi3w==
X-Received: by 2002:a63:1b54:: with SMTP id b20mr1303204pgm.312.1579549001420;
        Mon, 20 Jan 2020 11:36:41 -0800 (PST)
Received: from yoga (wsip-184-181-24-67.sd.sd.cox.net. [184.181.24.67])
        by smtp.gmail.com with ESMTPSA id k190sm39447610pga.73.2020.01.20.11.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2020 11:36:40 -0800 (PST)
Date:   Mon, 20 Jan 2020 11:36:38 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     evgreen@chromium.org, p.zabel@pengutronix.de, ohad@wizery.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, agross@kernel.org
Subject: Re: [PATCH 4/4] remoteproc: qcom: q6v5-mss: Improve readability of
 reset_assert
Message-ID: <20200120193638.GK1511@yoga>
References: <20200117135130.3605-1-sibis@codeaurora.org>
 <20200117135130.3605-5-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200117135130.3605-5-sibis@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 17 Jan 05:51 PST 2020, Sibi Sankar wrote:

> Define CONN_BOX_SPARE_0_EN and fixup comments to improve readability of
> Q6 modem reset_assert sequence on SC7180 SoCs.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  drivers/remoteproc/qcom_q6v5_mss.c | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index 6a98e9029c70b..8c9cfc213d5ff 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -71,6 +71,7 @@
>  #define NAV_AXI_HALTREQ_BIT		BIT(0)
>  #define NAV_AXI_HALTACK_BIT		BIT(1)
>  #define NAV_AXI_IDLE_BIT		BIT(2)
> +#define CONN_BOX_SPARE_0_EN		BIT(0)
>  
>  #define HALT_ACK_TIMEOUT_MS		100
>  #define NAV_HALT_ACK_TIMEOUT_US		200
> @@ -415,16 +416,26 @@ static int q6v5_reset_assert(struct q6v5 *qproc)
>  		ret = reset_control_reset(qproc->mss_restart);
>  		reset_control_deassert(qproc->pdc_reset);
>  	} else if (qproc->has_halt_nav) {
> -		/* SWAR using CONN_BOX_SPARE_0 for pipeline glitch issue */
> +		/*
> +		 * SWWA for the pipeline glitch issue seen while

Is SWWA an abbreviation for SoftWare WorkAround?

> +		 * putting the Q6 modem on SC7180 into reset:
> +		 * 1 - Assert PDC reset
> +		 * 2 - Set CONN_BOX_SPARE_0_EN
> +		 * 3 - Withdraw the halt requests
> +		 * 4 - Assert MSS reset
> +		 * 5 - Deassert PDC reset
> +		 * 6 - Clear CONN_BOX_SPARE_0_EN
> +		 * 7 - Deassert MSS reset

This pretty much outlines what's written below. How about making this
something like:

/* 
 * Work around a pipeline glitch seen when putting the Q6 modem in
 * SC7180 into reset by also toggling CONN_BOX_SPARE_0_EN, while holding
 * the PDC reset.
 */


Although, it would be even better if it indicated what you mean with
"pipeline glitch"...

Regards,
Bjorn

> +		 */
>  		reset_control_assert(qproc->pdc_reset);
>  		regmap_update_bits(qproc->conn_map, qproc->conn_box,
> -				   BIT(0), BIT(0));
> +				   CONN_BOX_SPARE_0_EN, 1);
>  		regmap_update_bits(qproc->halt_nav_map, qproc->halt_nav,
>  				   NAV_AXI_HALTREQ_BIT, 0);
>  		reset_control_assert(qproc->mss_restart);
>  		reset_control_deassert(qproc->pdc_reset);
>  		regmap_update_bits(qproc->conn_map, qproc->conn_box,
> -				   BIT(0), 0);
> +				   CONN_BOX_SPARE_0_EN, 0);
>  		ret = reset_control_deassert(qproc->mss_restart);
>  	} else {
>  		ret = reset_control_assert(qproc->mss_restart);
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
