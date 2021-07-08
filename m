Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A4673BF653
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jul 2021 09:34:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229845AbhGHHh0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Jul 2021 03:37:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229819AbhGHHh0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Jul 2021 03:37:26 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB6F5C061574
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jul 2021 00:34:43 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id w74so6736140oiw.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jul 2021 00:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=oAvMp+Ra1hGRaw0is8fIIs3Aux+5CC2LcgaoBBqSCPs=;
        b=bTXwCHKV7sHOm1Z7kkZ8GWVgoqOb4OtNM+ev5IT9t0vJ20NZSagGBxfaqD+XRlP+64
         4qBk2HriPIlZmnxv2kzGONNKYXGRxAupwfuAsb/AviXZ0w/jsNMyMTvO52BjsONPJc19
         Mm4bsNwHamNxyT8Mdku1KpQnSfFb/VhGEYGr0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=oAvMp+Ra1hGRaw0is8fIIs3Aux+5CC2LcgaoBBqSCPs=;
        b=eTrpqwfHp3AM6V+LbhVQWyLALu6dQws4wTPX8LsBd2GFqK5Bn416EClF9AOtkCCl35
         WLfN0ZdQdLD0ujcPAgZwcsvXEJQ+K8Pw/MmudZxJKshxYk5QIC5U+MHsJOpjzkUnbeXz
         hZvoNYhzuPaUCGthgf5D/5JZ/UFZW1acIw7rzTdsznTbXc1NcaIHKGx9WmyMZcM++yta
         YgtnzRTCkNZ4zmKXZzoyUz0e59w4O+9g/TmkcMeshzLL6pRXBz4p+8kP4vmS8OuK8lXx
         pnwEgWC5p9O7+dIqbULA/k5BXnz4sQVAEij1XjAdIswhlF/qW6iibk1gVKJiiyYJUkUB
         TfLw==
X-Gm-Message-State: AOAM533paxrUuWM/F7YsDxKa/LvwcXRuQKMLgt8Hh91fiM1nx7N1FDFV
        7LC9dMKA35/oGZl2k/3PSTfQTDXb/obMxXo4Z5KgbQ==
X-Google-Smtp-Source: ABdhPJxwpT6g2vtdmGi//wdPVjt2NQptFRmwbqjDsqzx3VBRFaxDJ3FHoWrljvZiKGOo3CIhCFJPJQcaguvqdTp1bRY=
X-Received: by 2002:aca:d941:: with SMTP id q62mr2639352oig.166.1625729683241;
 Thu, 08 Jul 2021 00:34:43 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 8 Jul 2021 07:34:42 +0000
MIME-Version: 1.0
In-Reply-To: <1625592020-22658-4-git-send-email-khsieh@codeaurora.org>
References: <1625592020-22658-1-git-send-email-khsieh@codeaurora.org> <1625592020-22658-4-git-send-email-khsieh@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 8 Jul 2021 07:34:42 +0000
Message-ID: <CAE-0n53JxLuQZBUMLOuH_Bm7zQ7Vite2OhjTB_xO=s_KAGarXw@mail.gmail.com>
Subject: Re: [PATCH 3/7] drm/msm/dp: reset aux controller after
 dp_aux_cmd_fifo_tx() failed.
To:     Kuogee Hsieh <khsieh@codeaurora.org>,
        dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run
Cc:     abhinavk@codeaurora.org, aravindh@codeaurora.org, airlied@linux.ie,
        daniel@ffwll.ch, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2021-07-06 10:20:16)
> Aux hardware calibration sequence requires resetting the aux controller
> in order for the new setting to take effect. However resetting the AUX
> controller will also clear HPD interrupt status which may accidentally
> cause pending unplug interrupt to get lost. Therefore reset aux
> controller only when link is in connection state when dp_aux_cmd_fifo_tx()
> fail. This fixes Link Layer CTS cases 4.2.1.1 and 4.2.1.2.
>
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_aux.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
> index 4a3293b..eb40d84 100644
> --- a/drivers/gpu/drm/msm/dp/dp_aux.c
> +++ b/drivers/gpu/drm/msm/dp/dp_aux.c
> @@ -353,6 +353,9 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
>                         if (!(aux->retry_cnt % MAX_AUX_RETRIES))
>                                 dp_catalog_aux_update_cfg(aux->catalog);
>                 }
> +               /* reset aux if link is in connected state */
> +               if (dp_catalog_link_is_connected(aux->catalog))

How do we avoid resetting aux when hpd is unplugged and then plugged
back in during an aux transfer?

> +                       dp_catalog_aux_reset(aux->catalog);
>         } else {
>                 aux->retry_cnt = 0;
>                 switch (aux->aux_error_num) {
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>
