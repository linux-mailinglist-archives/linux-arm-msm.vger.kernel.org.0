Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EFDDB1296B2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2019 14:58:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726682AbfLWN6o (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Dec 2019 08:58:44 -0500
Received: from mail-io1-f67.google.com ([209.85.166.67]:36641 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726676AbfLWN6n (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Dec 2019 08:58:43 -0500
Received: by mail-io1-f67.google.com with SMTP id r13so6169596ioa.3;
        Mon, 23 Dec 2019 05:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3PKfJo7e/F8iYmHNlUC4kcHL5CKe5kHebcIO1c7mfek=;
        b=dDAyIimizk4oR9NYXHcsKtFz27JZds8feHchTbuhSFGETI/pNbAsciKDI4kkOO1IfW
         nd1fJJu8DGsZTzaO48gK39ip/2Y7RXR64/zH5QtItx5EMlpR/syeXSe2R4uiULrRrwOF
         DGIaEEckCcWI0jeY0KKBgvwVAilBeRgkNhrBI9GEFTr+z77vSDBRAysEiLX9O5JQ+sl8
         89Bv2ne5VAOHZasFhbr5n/1sqBzJ+m2+PDv7/foH36JVYk+2N6zc0oY2wVDAx/ELxRVJ
         9/Hjh8GLcGbiqL84jnvkKy46ND/X9Enf9+4wn4alAT5qQoGvuaru7lZB96gaBN10o4jB
         T7/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3PKfJo7e/F8iYmHNlUC4kcHL5CKe5kHebcIO1c7mfek=;
        b=qO52ApdHUP6nHcLJT8UtBz284YenKPidOAI42S4sELqaZAHSwB0KDURhmr8Xip5CCy
         WxQ/HS2wLEkh28wPfdqD8WcHGlLq2HUXZcPtEMCzSxl2t+MJFCivoVEo7nbaBb6dEEc0
         iiT+/A/1AKwqpKDe4QoIxg6M8hWTQaw2jiAmWVtVgzU1l4U3cfwwISs0ELQq7bJu0kLT
         sCtf37MMX8/I1DFnJH6Wj3Joi1AU0fZ7HLZ16H9GDCW+/icsQ3P/op8CNJe+Ffb6Nk+W
         N02hhYQEN0NbCwUpljx20qzTfWBfdkkTkt6MWmqRiBOTnW2+muXmQ3YHmN4fPf5asM21
         90UA==
X-Gm-Message-State: APjAAAVIUF9M9oorJiHExJL2s1T/Q8h2dRzLqYXhF+NbgkfBypdsSpvG
        XtQzgL+vSeIupTSuPTbZ93hMqOGZsmVYhMwWAK8=
X-Google-Smtp-Source: APXvYqzUM8YJ6tRj448hYxFlxEOEtyUsp/J3wkALdJo8nymUv20lta/KuUBHcl5Mm/Nxt1SgHLy1Br5zccJrGGPCy8E=
X-Received: by 2002:a02:ca56:: with SMTP id i22mr22510644jal.140.1577109523001;
 Mon, 23 Dec 2019 05:58:43 -0800 (PST)
MIME-Version: 1.0
References: <1577096361-8381-1-git-send-email-harigovi@codeaurora.org>
In-Reply-To: <1577096361-8381-1-git-send-email-harigovi@codeaurora.org>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Mon, 23 Dec 2019 06:58:32 -0700
Message-ID: <CAOCk7NoDsjGWV=ddZO2yVG_n2N-mhdhfeaNML=kTTr2Mg88q0Q@mail.gmail.com>
Subject: Re: [Freedreno] [v1] drm/msm: update LANE_CTRL register value from
 default value
To:     Harigovindan P <harigovi@codeaurora.org>
Cc:     "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        DTML <devicetree@vger.kernel.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Rob Clark <robdclark@gmail.com>, nganji@codeaurora.org,
        Sean Paul <seanpaul@chromium.org>,
        "Kristian H. Kristensen" <hoegsberg@chromium.org>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Dec 23, 2019 at 3:19 AM Harigovindan P <harigovi@codeaurora.org> wrote:
>
> Updating REG_DSI_LANE_CTRL register value by reading default
> register value and writing it back using bitwise OR with
> DSI_LANE_CTRL_CLKLN_HS_FORCE_REQUEST. This works for all panels.

Why?
You explain what the code does, which I can tell from reading the
code.  The commit text should tell me why this change is necessary.
Why would I care if this change is in my tree or not?  What feature
does it provide or what issue does it fix?

>
> Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index e6289a3..d3c5233 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -816,7 +816,7 @@ static void dsi_ctrl_config(struct msm_dsi_host *msm_host, bool enable,
>         u32 flags = msm_host->mode_flags;
>         enum mipi_dsi_pixel_format mipi_fmt = msm_host->format;
>         const struct msm_dsi_cfg_handler *cfg_hnd = msm_host->cfg_hnd;
> -       u32 data = 0;
> +       u32 data = 0, lane_ctrl = 0;
>
>         if (!enable) {
>                 dsi_write(msm_host, REG_DSI_CTRL, 0);
> @@ -904,9 +904,11 @@ static void dsi_ctrl_config(struct msm_dsi_host *msm_host, bool enable,
>         dsi_write(msm_host, REG_DSI_LANE_SWAP_CTRL,
>                   DSI_LANE_SWAP_CTRL_DLN_SWAP_SEL(msm_host->dlane_swap));
>
> -       if (!(flags & MIPI_DSI_CLOCK_NON_CONTINUOUS))
> +       if (!(flags & MIPI_DSI_CLOCK_NON_CONTINUOUS)) {
> +               lane_ctrl = dsi_read(msm_host, REG_DSI_LANE_CTRL);
>                 dsi_write(msm_host, REG_DSI_LANE_CTRL,
> -                       DSI_LANE_CTRL_CLKLN_HS_FORCE_REQUEST);
> +                       lane_ctrl | DSI_LANE_CTRL_CLKLN_HS_FORCE_REQUEST);
> +       }
>
>         data |= DSI_CTRL_ENABLE;
>
> --
> 2.7.4
>
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
