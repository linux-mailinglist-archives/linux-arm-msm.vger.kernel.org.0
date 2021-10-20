Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0A8343441D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Oct 2021 06:23:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229520AbhJTEZQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Oct 2021 00:25:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbhJTEZQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Oct 2021 00:25:16 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C80DDC061746
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Oct 2021 21:23:02 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id l10-20020a056830154a00b00552b74d629aso5465044otp.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Oct 2021 21:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=Bs3Hx7Xml+AKZzdgDE9rHnfZKTi0TD4gTNNMxvuouzw=;
        b=hRDpLNEWqiqc9tbEifLp0DqHyPdzF9Sr5oiDPZyU8YMkJSwqlu3BKUPMQRC8AzY7Mt
         Y1kcLVaIv+n81zA6JJTdc43VxLZdnJ4eiTf0oK27JsSx7SGc3Dj5BqZGdBV6ooNTQ9WZ
         pnlbTJe8+nKB/kZ3FL+QgnG0c83kNRjgCn5LU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=Bs3Hx7Xml+AKZzdgDE9rHnfZKTi0TD4gTNNMxvuouzw=;
        b=u9Aut//gXsD2ibI0aO6mSjDdEZ0yvH4OsfWaqKSmj4Wfe10ZVk/KN5TXYGRmoNzPen
         5gCcCbQi8L1YMDCWnd/4jGg+f7Mefo4EqdikhzVr1Uq3XZqwLyWsjFpHURpx7C/YFZXJ
         VVETi5aXWUFSu91BCf68abmHIDixz+XF68t4tImFrW8yhyeXXa4S3t/TXoX3QoBPXhIz
         nKEfKWQaJkIf5eY37B22hLIJICbk7wqfeodoxIGORNVcah+I0wb6d/KG6y+2/YPjzSC8
         vonr/6KEVMOGM7Oxqv4ups0NPjrKHYHY9euEDN9VOlZlg5b9YDNU9H/adb4Ix5o2kNaq
         9cBA==
X-Gm-Message-State: AOAM5337OOWLE0WaS1qXHkMOAqCDvG3ZV5X2DrHv1J5RWnysuSksM8d1
        qYPpI4o42JSMelqsWffPrTPix2JGQE2xr7suG6G0IQ==
X-Google-Smtp-Source: ABdhPJyOKkL0wQNubSm3C1Hh3QCslWvDpIb6fE78XIybDX0ScYFy0By0TVmpHiOzhY9VXZRM4BxzV4E5ru6naCrkWWA=
X-Received: by 2002:a05:6830:1c2e:: with SMTP id f14mr8354158ote.159.1634703782105;
 Tue, 19 Oct 2021 21:23:02 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 19 Oct 2021 23:23:01 -0500
MIME-Version: 1.0
In-Reply-To: <1634621428-11652-1-git-send-email-mkrishn@codeaurora.org>
References: <1634621428-11652-1-git-send-email-mkrishn@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Tue, 19 Oct 2021 23:23:01 -0500
Message-ID: <CAE-0n51aKextY4CtEEM1bZo5AWTiM7Yt8uXvCbKfGT3sXvTxAA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm: use compatible lists to find mdp node
To:     Krishna Manikandan <mkrishn@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     kalyan_t@codeaurora.org, robdclark@gmail.com,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Krishna Manikandan (2021-10-18 22:30:28)
> In the current implementation, substring comparison
> using device node name is used to find mdp node
> during driver probe. Use compatible string list instead
> of node name to get mdp node from the parent mdss node.
>
> Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
>
> Changes in v2:
>    - Use compatible lists instead of duplicate string
>      check (Stephen Boyd)
> ---
>  drivers/gpu/drm/msm/msm_drv.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 2e6fc18..451d667 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -1241,9 +1241,13 @@ static int add_components_mdp(struct device *mdp_dev,
>         return 0;
>  }
>
> -static int compare_name_mdp(struct device *dev, void *data)
> +static int find_mdp_node(struct device *dev, void *data)
>  {
> -       return (strstr(dev_name(dev), "mdp") != NULL);
> +       if (!dev->driver)

I don't think we want to wait for the device to have an attached driver.
That could be far later than when we're trying to add all the
components here. Can you reference the match tables directly?


> +               return 0;
> +
> +       return (of_match_node(dev->driver->of_match_table,
> +                               dev->of_node) != NULL);

Drop useless parenthesis.

>  }
>
>  static int add_display_components(struct platform_device *pdev,
> @@ -1268,7 +1272,7 @@ static int add_display_components(struct platform_device *pdev,
>                         return ret;
>                 }
>
> -               mdp_dev = device_find_child(dev, NULL, compare_name_mdp);
> +               mdp_dev = device_find_child(dev, NULL, find_mdp_node);
>                 if (!mdp_dev) {
>                         DRM_DEV_ERROR(dev, "failed to find MDSS MDP node\n");
>                         of_platform_depopulate(dev);
