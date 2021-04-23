Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 732E036958E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Apr 2021 17:05:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242842AbhDWPFp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Apr 2021 11:05:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242768AbhDWPFm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Apr 2021 11:05:42 -0400
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com [IPv6:2607:f8b0:4864:20::f2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FC15C06174A
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Apr 2021 08:05:04 -0700 (PDT)
Received: by mail-qv1-xf2d.google.com with SMTP id x14so597429qvr.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Apr 2021 08:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JVfcpr7bRZ6s3YruMjp8qVrxCIDgGdMtl+A9Aczl7R4=;
        b=OmkoAWs02RMbBHLvV9IRy4MYyPogzVzCe/IRTZBe8Q8RQor+AxWdLtkaXkkm4yrXYF
         yGeG9sWF2Ccr+0PFhaZ4Mh24QEurXCZ2iWDjymdhirsl2s05BCzWjakOwWgzHz0B3Alv
         lFv4NZEY+l3uzW+HSGZ8PZOJcYNSDhfomjBjo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JVfcpr7bRZ6s3YruMjp8qVrxCIDgGdMtl+A9Aczl7R4=;
        b=sW4sAiZoFVXbLN7M9Axuxo7dkrvzqCLldzzutYgOpCj4qcPzmnQx62nN43qaqnSWTH
         h4gQagK6zn9YnMRPMdpzUWnDkuThwwH9MTVt4DlLXDHPc7+t7gGlDCpfV6WqHWmtN61p
         ODmxO/qNoTZ7JTJ1t4VS3mQM6J5r6FoRkvSirKaO0n54r69c+4n7o6ttQ+FubGqSR+Ht
         jWhgcWJs5sXHN2jf/kG8e05topjkhZ2jsjs8UL/GWjnL2Zb2Uk+u1b/714LTV+iNx53w
         N2h6KCH4T6+mseVOOzVtdTawaJ1ZohTpOro7eBvb9vf4In1sqTOU3OwUpT9bGp/J3tgL
         SRwg==
X-Gm-Message-State: AOAM532uf3kT9KNKfUy3vpZh5PoK5HoR74dC7plhpL8G2Ep0RdCoyM5A
        UWZpYY3QsrQ3wzJRk+S0UL+cAiCmp2oFsQ==
X-Google-Smtp-Source: ABdhPJx3ZvMZWUT6V9wBiokTafJXPFsRMwkIpbd6A4aMQb4wtU71TeW3cckcyGpleT2vtIyt4QqJtg==
X-Received: by 2002:ad4:4844:: with SMTP id t4mr4634749qvy.38.1619190303164;
        Fri, 23 Apr 2021 08:05:03 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id o7sm4210796qkb.104.2021.04.23.08.05.02
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Apr 2021 08:05:02 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id 82so55999823yby.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Apr 2021 08:05:02 -0700 (PDT)
X-Received: by 2002:a25:6088:: with SMTP id u130mr6500819ybb.257.1619190302321;
 Fri, 23 Apr 2021 08:05:02 -0700 (PDT)
MIME-Version: 1.0
References: <1619161503-8784-1-git-send-email-rnayak@codeaurora.org>
In-Reply-To: <1619161503-8784-1-git-send-email-rnayak@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 23 Apr 2021 08:04:50 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VN+iP85D6dkEDE=C7Z9rX_-mQXU-u-Jo_5=s46tZcq0Q@mail.gmail.com>
Message-ID: <CAD=FV=VN+iP85D6dkEDE=C7Z9rX_-mQXU-u-Jo_5=s46tZcq0Q@mail.gmail.com>
Subject: Re: [PATCH] nvmem: qfprom: minor nit fixes, no functional change
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "Ravi Kumar Bokka (Temp)" <rbokka@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Apr 23, 2021 at 12:05 AM Rajendra Nayak <rnayak@codeaurora.org> wrote:
>
> Fix a missed newline, and update a comment which is stale
> after the merge of '5a1bea2a: nvmem: qfprom: Add support for fuse
> blowing on sc7280'
> No other functional change in this patch.
>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
> Sending a follow-up patch for these nits since they came in after
> the previous patch was already pulled in
> https://lore.kernel.org/patchwork/patch/1401964/
>
>  drivers/nvmem/qfprom.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/nvmem/qfprom.c b/drivers/nvmem/qfprom.c
> index d6d3f24..b7d2060 100644
> --- a/drivers/nvmem/qfprom.c
> +++ b/drivers/nvmem/qfprom.c
> @@ -122,6 +122,7 @@ static const struct qfprom_soc_compatible_data sc7280_qfprom = {
>         .keepout = sc7280_qfprom_keepout,
>         .nkeepout = ARRAY_SIZE(sc7280_qfprom_keepout)
>  };
> +
>  /**
>   * qfprom_disable_fuse_blowing() - Undo enabling of fuse blowing.
>   * @priv: Our driver data.
> @@ -195,7 +196,7 @@ static int qfprom_enable_fuse_blowing(const struct qfprom_priv *priv,
>         }
>
>         /*
> -        * Hardware requires 1.8V min for fuse blowing; this may be
> +        * Hardware requires a min voltage for fuse blowing; this may be
>          * a rail shared do don't specify a max--regulator constraints
>          * will handle.
>          */

Thanks for sending these! Is there a reason you didn't do the "else
if" change too?

-Doug
