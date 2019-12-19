Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A82571265C7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2019 16:31:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726928AbfLSPbP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Dec 2019 10:31:15 -0500
Received: from mail-il1-f193.google.com ([209.85.166.193]:45245 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726776AbfLSPbP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Dec 2019 10:31:15 -0500
Received: by mail-il1-f193.google.com with SMTP id p8so5183246iln.12;
        Thu, 19 Dec 2019 07:31:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DVVdjtKv58x1Uc55az3ApF8gHKz/ZX1W12cqDT6rODs=;
        b=JvT9zp0EpA5eXF3hdg5MJ34MDzA+56QpVQBg2UKGdtLFpGPxwriFh2JNeb5+8GCUUR
         3FVZmZYkoygMpEeVdWhi+LE5dH6aPhNfKjJiY7Ff48bUcuLSCYO7QA5CEItHQ9dNkhCa
         iZfQiR9+gKBigCx3Lllt5e07K7eHwUm1mVswmm8osg75KEQU7ptlwDA8b7RxcFh14OYD
         PjyWrLlMmI0Gcz0dbMBMk5AFiBnFhIokefAuuaiDe5kjeuc6f8nb8TTQW/PGGMPJfPo4
         8jrLLZQ0eY+xcDrCFidMz7XSIDV95ytpBSwO9pAltXnBOlp7Hv+aGzF62gSGaRgSi9oM
         0EQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DVVdjtKv58x1Uc55az3ApF8gHKz/ZX1W12cqDT6rODs=;
        b=iCjC96KGf51HJM5X8vqi4xgPT5cEQFvgWqxrBLtcXXs5fHDKJGP8SlOkvRtvfsdYHr
         h5aOuZ66lMm3SFezuuGCWlOtJlezaWzKWG/upFO3AjV7yvCMwhp8jCHMyuxDdpOP3fFF
         HgA78KrqKQjly7jnstjlXOn/nvTmFa4Th36DL7ERnFDqnFqiiRYzfP8wG+FD2UEsgPtJ
         WfsGvc1IK6AeQu5Od+IoXaBgBwuSge7lDR7Zc47rFpnNLj9gbJ0x3KO4bt16TRQ6dPJH
         bVPbf1ZCQKr69p3zArfaGKnxjUnZZM4M1kGRB+O7tkCy8lJ5ZVzA4x4mEKg2sfspRhh7
         BXig==
X-Gm-Message-State: APjAAAXnyHY3UFo9thJjrrDZdb36BNZLhXryMXgYCBbsuPCVAZqnqQyz
        OohfnhJcWFwoxVEeFzFup10aSEw8Xwe48ONR/U8=
X-Google-Smtp-Source: APXvYqxu56w/oZweN1AJFZaIqxBT7mc8D28YjI4wjWxWnEhn6CrcFRtowiwHA4gjbAu7VV8Nywl4FO9TWrdap2lBJv8=
X-Received: by 2002:a92:465c:: with SMTP id t89mr7929451ila.263.1576769474440;
 Thu, 19 Dec 2019 07:31:14 -0800 (PST)
MIME-Version: 1.0
References: <20191219150433.2785427-1-vkoul@kernel.org> <20191219150433.2785427-4-vkoul@kernel.org>
In-Reply-To: <20191219150433.2785427-4-vkoul@kernel.org>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Thu, 19 Dec 2019 08:31:03 -0700
Message-ID: <CAOCk7NqUdxCMnK0ZsjN1u7RfaW=z3ZHpsZ8Vk7+JKpsrjBPJJw@mail.gmail.com>
Subject: Re: [PATCH 3/4] phy: qcom-qmp: Add optional SW reset
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>, Can Guo <cang@codeaurora.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Dec 19, 2019 at 8:05 AM Vinod Koul <vkoul@kernel.org> wrote:
>
> For V4 QMP UFS Phy, we need to assert reset bits, configure the phy and
> then deassert it, so add optional has_sw_reset flag and use that to
> configure the QPHY_SW_RESET register.
>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Reviewed-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>

> ---
>  drivers/phy/qualcomm/phy-qcom-qmp.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
> index 06f971ca518e..80304b7cd895 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
> @@ -1023,6 +1023,9 @@ struct qmp_phy_cfg {
>
>         /* true, if PCS block has no separate SW_RESET register */
>         bool no_pcs_sw_reset;
> +
> +       /* true if sw reset needs to be invoked */
> +       bool has_sw_reset;
>  };
>
>  /**
> @@ -1391,6 +1394,7 @@ static const struct qmp_phy_cfg sm8150_ufsphy_cfg = {
>
>         .is_dual_lane_phy       = true,
>         .no_pcs_sw_reset        = true,
> +       .has_sw_reset           = true,
>  };
>
>  static void qcom_qmp_phy_configure(void __iomem *base,
> @@ -1475,6 +1479,9 @@ static int qcom_qmp_phy_com_init(struct qmp_phy *qphy)
>                              SW_USB3PHY_RESET_MUX | SW_USB3PHY_RESET);
>         }
>
> +       if (cfg->has_sw_reset)
> +               qphy_setbits(serdes, cfg->regs[QPHY_SW_RESET], SW_RESET);
> +
>         if (cfg->has_phy_com_ctrl)
>                 qphy_setbits(serdes, cfg->regs[QPHY_COM_POWER_DOWN_CONTROL],
>                              SW_PWRDN);
> @@ -1651,6 +1658,9 @@ static int qcom_qmp_phy_enable(struct phy *phy)
>         if (cfg->has_phy_dp_com_ctrl)
>                 qphy_clrbits(dp_com, QPHY_V3_DP_COM_SW_RESET, SW_RESET);
>
> +       if (cfg->has_sw_reset)
> +               qphy_clrbits(pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
> +
>         /* start SerDes and Phy-Coding-Sublayer */
>         qphy_setbits(pcs, cfg->regs[QPHY_START_CTRL], cfg->start_ctrl);
>
> --
> 2.23.0
>
