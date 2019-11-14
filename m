Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2E18FCBD4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2019 18:29:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726473AbfKNR3n (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Nov 2019 12:29:43 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:44066 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726210AbfKNR3m (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Nov 2019 12:29:42 -0500
Received: by mail-pg1-f195.google.com with SMTP id f19so4182956pgk.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Nov 2019 09:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:from:subject:to:user-agent:date;
        bh=CcYQV1LmmMin4KfNUQWfqXUn7x+pyW1iTl5f3vQ+Lhw=;
        b=NxMGYSTtBK4i5RPqbguGXItXdVNjv2nYm1/iGpCOqRIVhhVH6vf7946u7XMPm25GJA
         q7nWJkt3+Xf/XDjNbHKHgXjXTbJHCI69Wm000ian3oAhz2GlGBNz1DTe9WXQgjh7aurH
         DMoXuOTRdgV6nuAZHMYwbqnm9praYO+bqeVas=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:from:subject:to
         :user-agent:date;
        bh=CcYQV1LmmMin4KfNUQWfqXUn7x+pyW1iTl5f3vQ+Lhw=;
        b=F612O9MlBXQ0YhO9l3lFOoEuAJaXwTOscnDWf57AHHaNFalF6TQXZIkPJXZrizDJxT
         zZBxPeR3X3OQRK3Kt1ukeZXCglEXr90R3ufvWxVLqsKYiiuMH3iMi4xzR9bDj5A64zXZ
         M3yDSgdNAqlaQq9AsPYksH2bhn37MLg2alEk4eVWgFGCmxyGapxBlzBBGlU7Sl74BKAh
         CjNmevheOGBs1vI3MqetWvSn0HPiuk870558tRz6GRrI5hfJhMIzuWjTcQ8a2Ny2M43i
         7rswchsHcQ2jGM6BgQS0oLRpvOMPRHcRX7T9EfsIGA6nIHYP+pJ4sO3tgzT3PX7LBRIN
         r/Gw==
X-Gm-Message-State: APjAAAXhjvHghhpq/6o7MnpdsXBRmRhnMZHZrS4TlXjVm9EARyxNmYii
        WD0OXIMBB3WfD7jl5zn0HfRCwQ==
X-Google-Smtp-Source: APXvYqzty8fGyHYZm9ySVIF8pi9T97dNqEd99tGhmW7ag+BB8smmNExV5fwEnlcaxmxVHJRlf+vtew==
X-Received: by 2002:aa7:8256:: with SMTP id e22mr12167282pfn.247.1573752582247;
        Thu, 14 Nov 2019 09:29:42 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id i71sm6900213pfe.103.2019.11.14.09.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2019 09:29:41 -0800 (PST)
Message-ID: <5dcd8f05.1c69fb81.bdd4.2b0a@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1573710976-27551-1-git-send-email-dhar@codeaurora.org>
References: <1573710976-27551-1-git-send-email-dhar@codeaurora.org>
Cc:     Shubhashree Dhar <dhar@codeaurora.org>,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        seanpaul@chromium.org, hoegsberg@chromium.org,
        abhinavk@codeaurora.org, jsanka@codeaurora.org,
        chandanu@codeaurora.org, nganji@codeaurora.org
From:   Stephen Boyd <swboyd@chromium.org>
Subject: Re: [v2] msm: disp: dpu1: add support to access hw irqs regs depending on revision
To:     Shubhashree Dhar <dhar@codeaurora.org>, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
User-Agent: alot/0.8.1
Date:   Thu, 14 Nov 2019 09:29:40 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Shubhashree Dhar (2019-11-13 21:56:16)
> Current code assumes that all the irqs registers offsets can be
> accessed in all the hw revisions; this is not the case for some
> targets that should not access some of the irq registers.

What happens if we read the irq registers that we "should not access"?
Does the system reset? It would be easier to make those registers return
0 when read indicating no interrupt and ignore writes so that everything
keeps working without having to skip registers.

> This change adds the support to selectively remove the irqs that
> are not supported in some of the hw revisions.
>=20
> Change-Id: I6052b8237b703a1a9edd53893e04f7bd72223da1

Please remove these before sending upstream.

> Signed-off-by: Shubhashree Dhar <dhar@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  3 +++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 22 +++++++++++++++++=
-----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |  1 +
>  4 files changed, 22 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu=
/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index ec76b868..def8a3f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -646,6 +646,7 @@ struct dpu_perf_cfg {
>   * @dma_formats        Supported formats for dma pipe
>   * @cursor_formats     Supported formats for cursor pipe
>   * @vig_formats        Supported formats for vig pipe
> + * @mdss_irqs          Bitmap with the irqs supported by the target

Hmm pretty sure there needs to be a colon so that kernel-doc can match
this but maybe I'm wrong.

>   */
>  struct dpu_mdss_cfg {
>         u32 hwversion;
