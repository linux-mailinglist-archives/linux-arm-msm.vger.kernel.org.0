Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C647B24FCCD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Aug 2020 13:40:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726075AbgHXLkt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Aug 2020 07:40:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726934AbgHXLh2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Aug 2020 07:37:28 -0400
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com [IPv6:2607:f8b0:4864:20::a42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30EABC061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2020 04:36:34 -0700 (PDT)
Received: by mail-vk1-xa42.google.com with SMTP id k1so1887137vkb.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2020 04:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JV6tfVfklUu/NgG7bOgXNfj+ClShTy9jxY/fWbFwF1Q=;
        b=SR05v7vEY5sKMrTnPQXPXjzApuQk/oa1b/hk2ngKloy/+6+cKi9GyhYUL4kt+JBbkY
         pFsINiplBoi0Ijf2LF4x2ZBTFIlXpzah5m1eCE1AAbUdy18LYtncpit+/50yr2Bi39Ny
         hvRSdgcNB9nMuCfwtSzRJ3WblfiSUa/jY0qujdILepfgqr9S+YVHx3xavukh/XkrBCxv
         E5SNrxD4DJuOb8KyVzuWTGGv1qeL/evptBdSvJ/beTaeUmXX8B59rdysWiEuUI2k47r7
         /W9m4FCDtZmVl9PidXfCiGiCOpanM1+y208zn60nqEDwUoD5RyT3KQ7KcBmpcDGMkL2G
         SRnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JV6tfVfklUu/NgG7bOgXNfj+ClShTy9jxY/fWbFwF1Q=;
        b=TPO035OwBz+6ECrQI0wkJOCPBdjJ+I/T9sl4SwdozCW1EPH212qlCYKXh0LDf25ChV
         DMN+etCBLcQrjJrWzFGd2Bvc3q2oKZunWVtkmfrF/vyzAmi6wUlU+YeHNDL7dF9eJBKB
         E4zkRxjrmqEH2jYWDi4DV5B55x1MwkjsLPFi/G0fwlzQbylCsHQmoBLmoXxM20ZEbBUu
         P75WIGU1ZdjoY6Xki+D2Wy+Qh5o2whEEJE1WBSfQDlGun+D5t53S2EbL71VrfC7tVnzO
         Kl9Adii1PMwhr3BkRcBgB6Od9KJN2wk/KnzrIfO2PGDiaKpngdTTetY+VgK/ztC51IgN
         1buQ==
X-Gm-Message-State: AOAM530ETKbMe0nXmXd4JkvSuPJlVFZPCc9QgiLXHrBLUV1C5akue2Ow
        8X1NApM64lEskEyYi7pXvWrpuNW1vXsDrQq6xWZH6g==
X-Google-Smtp-Source: ABdhPJwV339wbAhfl6NpdVN6lNoSFp1QLhcdRK1T9FWMbikCYbOeJPxGF0aDPlZioYf/71LuBla4tnSiHVkKQV97zsY=
X-Received: by 2002:a1f:2895:: with SMTP id o143mr2131690vko.59.1598268993288;
 Mon, 24 Aug 2020 04:36:33 -0700 (PDT)
MIME-Version: 1.0
References: <1597831670-17401-1-git-send-email-mkshah@codeaurora.org> <1597831670-17401-2-git-send-email-mkshah@codeaurora.org>
In-Reply-To: <1597831670-17401-2-git-send-email-mkshah@codeaurora.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 24 Aug 2020 13:35:57 +0200
Message-ID: <CAPDyKFrY=U45K6NSkoJwvYuWWzMUdZNLaQn5XmnMGkJnCLgvdQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] Revert "drivers: qcom: rpmh-rsc: Use rcuidle
 tracepoints for rpmh"
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>, lsrao@codeaurora.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        John Stultz <john.stultz@linaro.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 19 Aug 2020 at 12:08, Maulik Shah <mkshah@codeaurora.org> wrote:
>
> This change was done based on an test results of unmerged series of
> adding RSC power domain and using .power_off callback of genpd to
> invoke rpmh_flush().
>
>      Call trace:
>       dump_backtrace+0x0/0x174
>       show_stack+0x20/0x2c
>       dump_stack+0xc8/0x124
>       lockdep_rcu_suspicious+0xe4/0x104
>       __tcs_buffer_write+0x230/0x2d0
>       rpmh_rsc_write_ctrl_data+0x210/0x270
>       rpmh_flush+0x84/0x24c
>       rpmh_domain_power_off+0x78/0x98
>       _genpd_power_off+0x40/0xc0
>       genpd_power_off+0x168/0x208
>
> Later the final merged solution is to use CPU PM notification to invoke
> rpmh_flush() and .power_off callback of genpd is not implemented in the
> driver.
>
> Remove this change since RCU will not be idle during CPU PM notifications
> hence not required to use _rcuidle tracepoint. Using _rcuidle tracepoint
> prevented rpmh driver to be loadable module as these are not exported
> symbols.
>
> This reverts commit efde2659b0fe835732047357b2902cca14f054d9.
>
> Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> Cc: John Stultz <john.stultz@linaro.org>
> Cc: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>

Along with Stephen's comments, feel free to add:

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Also note, when using the PSCI OSI mode, I am proposing to use "genpd
on/off notifiers" [1]. This may lead to similar RCU issues, but let's
come back to adress that later on, when/if needed.

Kind regards
Uffe

[1]
https://www.spinics.net/lists/kernel/msg3629443.html


> ---
>  drivers/soc/qcom/rpmh-rsc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
> index ae66757..fabe390d 100644
> --- a/drivers/soc/qcom/rpmh-rsc.c
> +++ b/drivers/soc/qcom/rpmh-rsc.c
> @@ -495,7 +495,7 @@ static void __tcs_buffer_write(struct rsc_drv *drv, int tcs_id, int cmd_id,
>                 write_tcs_cmd(drv, RSC_DRV_CMD_MSGID, tcs_id, j, msgid);
>                 write_tcs_cmd(drv, RSC_DRV_CMD_ADDR, tcs_id, j, cmd->addr);
>                 write_tcs_cmd(drv, RSC_DRV_CMD_DATA, tcs_id, j, cmd->data);
> -               trace_rpmh_send_msg_rcuidle(drv, tcs_id, j, msgid, cmd);
> +               trace_rpmh_send_msg(drv, tcs_id, j, msgid, cmd);
>         }
>
>         write_tcs_reg(drv, RSC_DRV_CMD_WAIT_FOR_CMPL, tcs_id, cmd_complete);
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
>
