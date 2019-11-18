Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A323100E6B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2019 22:55:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726735AbfKRVzG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Nov 2019 16:55:06 -0500
Received: from mail-io1-f67.google.com ([209.85.166.67]:46259 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726647AbfKRVzG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Nov 2019 16:55:06 -0500
Received: by mail-io1-f67.google.com with SMTP id i11so9669881iol.13;
        Mon, 18 Nov 2019 13:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=V8+YMGwvqk5TQ81XMsSGIPXYqzjGQUSCEBcZAgkyIx0=;
        b=fcsDqcY9RysCqoQK9oKbkqzSWyaxuBOuSKvd0FkmY83tr+bDboKs2fdnGzLpRYOdjv
         MtId9sEmELnmNLm/k/zLboPzvFX/G94CEygQY0F3yXunHSZp0QDH4GN0zY+/aOYTPULb
         4JJQOgYTGmO2FWsglS6D/fMO1Je+F84GOkWqTW/EKvIFn3OInfHCl2dwthpRYdSjULpm
         mJBJX5MW7LORtF6WuKhviiO9iMWOobhYnQfVRcG0VkHO5fmqZqQFI49z1nr1Vif5fOCI
         EaWNkbnE9opkaIAA+CAEC58sV008h/xHoNNLuE4IBD6HbUL+q7ybnP/d/OngGU/iUObv
         SRIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=V8+YMGwvqk5TQ81XMsSGIPXYqzjGQUSCEBcZAgkyIx0=;
        b=p+GQiN2GetGYy6GFHmyzKF7N80l/wxD6Ouiy5dz0dVGoDyD91p5Eh5UbXI0n6JW8fU
         ACNPRiPoPqY6OoB7dOXFwjK8noplyLL8mgMW222/HwVb+FZqZKrx7c4k8ah01GzoGcm9
         UwIlpbz+0lqUBH12EjNiJKRrK5pZhqd4f+wlCNUbWN3FL62SqHxlQJ+LVMbtDjLKaYSa
         iOns+tcvt7F0uRw9M3y4T2ghMS2TZ4EYkIS7Wa8Ei8mETSYU41Aypb+mV4YbIBUqUNn+
         cgxF6yGTu59r3VNryg1bA4X6Ku4Nw/vCMLwhQ9yKj8g+jIVguy7JLaYBYaa5i8V3eS7O
         /YBA==
X-Gm-Message-State: APjAAAUwSZZeayR8w+ERkmudL1ljULpPu7Sl+b1IyVxEX0ipzZOZ50U9
        ffW9I/ER8vM6seHkAC79Mb5qoWcvR1rCyJI3YwdH1A==
X-Google-Smtp-Source: APXvYqwdAwUyX98DJxl91PanWw8Y7ZU4Fb8R/Jh21hRR8cRfvEHcua53U4oWEwWaZeX8mXsSKZGn8OnvWg7EZkYe3Hs=
X-Received: by 2002:a5e:a70e:: with SMTP id b14mr5517607iod.166.1574114105011;
 Mon, 18 Nov 2019 13:55:05 -0800 (PST)
MIME-Version: 1.0
References: <20191118214250.14002-1-sibis@codeaurora.org> <0101016e80782dd7-2617455b-7d73-4e68-8a9a-b63c29e9ad76-000000@us-west-2.amazonses.com>
In-Reply-To: <0101016e80782dd7-2617455b-7d73-4e68-8a9a-b63c29e9ad76-000000@us-west-2.amazonses.com>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Mon, 18 Nov 2019 14:54:54 -0700
Message-ID: <CAOCk7Nou94bxk_48JArrXhQw2KR+3bKanLe+hb2=d7_j6y3VbQ@mail.gmail.com>
Subject: Re: [PATCH 01/16] remoteproc: q6v5-mss: fixup MSM8998 MSS out of
 reset sequence
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mark Rutland <mark.rutland@arm.com>, p.zabel@pengutronix.de,
        MSM <linux-arm-msm@vger.kernel.org>,
        linux-remoteproc@vger.kernel.org,
        DTML <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Nov 18, 2019 at 2:43 PM Sibi Sankar <sibis@codeaurora.org> wrote:
>
> Fixup the following in the MSS out of reset sequence on MSM8998:
> * skip ACC override on MSM8998.
> * wait for BHS_EN_REST_ACK to be set before setting the LDO to bypass.
> * remove "mem" clock from the active pool.

Why any of this is necessary isn't explained.
Seems like it should be 3 separate patches.
Regarding the mem clock change, wouldn't it be an issue if we don't
vote for that?

>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  drivers/remoteproc/qcom_q6v5_mss.c | 23 ++++++++++++++++++++---
>  1 file changed, 20 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index 471128a2e7239..2becf6dade936 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -100,6 +100,11 @@
>  #define QDSP6SS_XO_CBCR                0x0038
>  #define QDSP6SS_ACC_OVERRIDE_VAL               0x20
>
> +/* QDSP6v62 parameters */
> +#define QDSP6SS_BHS_EN_REST_ACK                BIT(0)
> +#define BHS_CHECK_MAX_LOOPS            200
> +#define QDSP6SS_BHS_STATUS             0x0C4
> +
>  /* QDSP6v65 parameters */
>  #define QDSP6SS_SLEEP                   0x3C
>  #define QDSP6SS_BOOT_CORE_START         0x400
> @@ -505,8 +510,9 @@ static int q6v5proc_reset(struct q6v5 *qproc)
>                 int mem_pwr_ctl;
>
>                 /* Override the ACC value if required */
> -               writel(QDSP6SS_ACC_OVERRIDE_VAL,
> -                      qproc->reg_base + QDSP6SS_STRAP_ACC);
> +               if (qproc->version == MSS_MSM8996)
> +                       writel(QDSP6SS_ACC_OVERRIDE_VAL,
> +                              qproc->reg_base + QDSP6SS_STRAP_ACC);
>
>                 /* Assert resets, stop core */
>                 val = readl(qproc->reg_base + QDSP6SS_RESET_REG);
> @@ -534,6 +540,18 @@ static int q6v5proc_reset(struct q6v5 *qproc)
>                 val |= readl(qproc->reg_base + QDSP6SS_PWR_CTL_REG);
>                 udelay(1);
>
> +               /* wait for BHS_EN_REST_ACK to be set */
> +               if (qproc->version == MSS_MSM8998) {
> +                       ret = readl_poll_timeout(qproc->reg_base + QDSP6SS_BHS_STATUS,
> +                                                val, (val & QDSP6SS_BHS_EN_REST_ACK),
> +                                                1, BHS_CHECK_MAX_LOOPS);
> +                       if (ret) {
> +                               dev_err(qproc->dev,
> +                                       "QDSP6SS_BHS_EN_REST_ACK timedout\n");
> +                               return -ETIMEDOUT;
> +                       }
> +               }
> +
>                 /* Put LDO in bypass mode */
>                 val |= QDSP6v56_LDO_BYP;
>                 writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
> @@ -1594,7 +1612,6 @@ static const struct rproc_hexagon_res msm8998_mss = {
>         .active_clk_names = (char*[]){
>                         "iface",
>                         "bus",
> -                       "mem",
>                         "gpll0_mss",
>                         "mnoc_axi",
>                         "snoc_axi",
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>
