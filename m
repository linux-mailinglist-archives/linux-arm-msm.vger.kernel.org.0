Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD2A53DB997
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jul 2021 15:49:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231247AbhG3Nt2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Jul 2021 09:49:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231139AbhG3Nt2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Jul 2021 09:49:28 -0400
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F65EC06175F
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jul 2021 06:49:23 -0700 (PDT)
Received: by mail-qk1-x733.google.com with SMTP id o13so9429451qkk.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jul 2021 06:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MKFVB3IPR9lkSCEivG2PKNtFQz06R+D8dqrPSZQVhIs=;
        b=MEbABptqXJglM26bxbD6CXo+dI7tsy8Ef6mKgr0+/TMZtm6CaLpLI83wRe6CtDssMY
         cGrKlT8wH4v18FxmQJ5UKSyQwjt7aPP5UxUNzNEQLXCLZk8BsgyYxmJcfjJSSJcjTnhh
         +qe1EKdSoyzxiUawP0TyNaR3uCQQRcxX+DYLE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MKFVB3IPR9lkSCEivG2PKNtFQz06R+D8dqrPSZQVhIs=;
        b=aN1yWaTvyV7WiDTerx5NsoynvL/AQNGzzXqQOFw/XrtmIC2XW0/vS8CkdBhX5la3lv
         NF9uWzLc+Qja3CntYosXWYarBjQMMqt9RZuaoPWlZMWNGv97yFIVw0Y/GM9BZ6sRe33l
         4cdtaxsigsJx5f9bBTl+pJRRS6XPBv7kCNEyOPc+PP2X7sprY/X26jtuh8FB6rGoY/2i
         VQLDOMNSjnzLSS7q/xbWKk1YWm38WcVH9C/WBAqnnyx+gcKFpqMWxFMBC593MS2JOvqL
         4HqnBCng4Yte14ssmC7EG1FU6BqQ3ZEVuWQM4e0YWX3Nu5VOTUvSu/D9yG0JcdIQCSJL
         +Xtw==
X-Gm-Message-State: AOAM531bJfMBswRYVm1npZe/wADCD42ZspEqpP+8AOmQPfTpR5CSeu6D
        EMvDt3vPtep/YU0t+xaTLjmggMX3k37xWg==
X-Google-Smtp-Source: ABdhPJz+vg99paXqmXEdQlETeV+k9dlqA/RPPZJk6kQRmepEj3VrCUrgGXY7oVbiA4hGA89gR1vJXw==
X-Received: by 2002:a37:b6c1:: with SMTP id g184mr2366797qkf.270.1627652962536;
        Fri, 30 Jul 2021 06:49:22 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id e10sm947413qkg.18.2021.07.30.06.49.22
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jul 2021 06:49:22 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id j77so14113689ybj.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jul 2021 06:49:22 -0700 (PDT)
X-Received: by 2002:a25:6088:: with SMTP id u130mr3375680ybb.257.1627652961581;
 Fri, 30 Jul 2021 06:49:21 -0700 (PDT)
MIME-Version: 1.0
References: <1627627573-32454-1-git-send-email-rnayak@codeaurora.org> <1627627573-32454-3-git-send-email-rnayak@codeaurora.org>
In-Reply-To: <1627627573-32454-3-git-send-email-rnayak@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 30 Jul 2021 06:49:10 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X9wzRu20xydjt3c6682rWocd6dik6qRc9N1t_Dq97ODw@mail.gmail.com>
Message-ID: <CAD=FV=X9wzRu20xydjt3c6682rWocd6dik6qRc9N1t_Dq97ODw@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] nvmem: qfprom: Fix up qfprom_disable_fuse_blowing()
 ordering
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        "Ravi Kumar Bokka (Temp)" <rbokka@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Jul 29, 2021 at 11:46 PM Rajendra Nayak <rnayak@codeaurora.org> wrote:
>
> qfprom_disable_fuse_blowing() disables a bunch of resources,
> and then does a few register writes in the 'conf' address
> space.
> It works perhaps because the resources are needed only for the
> 'raw' register space writes, and that the 'conf' space allows
> read/writes regardless.
> However that makes the code look confusing, so just move the
> register writes before turning off the resources in the
> function.
>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
>  drivers/nvmem/qfprom.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/nvmem/qfprom.c b/drivers/nvmem/qfprom.c
> index 81fbad5..b0ca4c6 100644
> --- a/drivers/nvmem/qfprom.c
> +++ b/drivers/nvmem/qfprom.c
> @@ -139,6 +139,9 @@ static void qfprom_disable_fuse_blowing(const struct qfprom_priv *priv,
>  {
>         int ret;
>
> +       writel(old->timer_val, priv->qfpconf + QFPROM_BLOW_TIMER_OFFSET);
> +       writel(old->accel_val, priv->qfpconf + QFPROM_ACCEL_OFFSET);
> +
>         /*
>          * This may be a shared rail and may be able to run at a lower rate
>          * when we're not blowing fuses.  At the moment, the regulator framework
> @@ -159,9 +162,6 @@ static void qfprom_disable_fuse_blowing(const struct qfprom_priv *priv,
>                          "Failed to set clock rate for disable (ignoring)\n");
>
>         clk_disable_unprepare(priv->secclk);
> -
> -       writel(old->timer_val, priv->qfpconf + QFPROM_BLOW_TIMER_OFFSET);
> -       writel(old->accel_val, priv->qfpconf + QFPROM_ACCEL_OFFSET);
>  }

I think it doesn't matter since all of these resources are just needed
for burning fuses, but I agree that what you have here makes more
logical sense and makes the function less confusing.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
