Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 753F21CE170
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2020 19:18:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729441AbgEKRST (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 May 2020 13:18:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728556AbgEKRST (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 May 2020 13:18:19 -0400
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E52A8C061A0C;
        Mon, 11 May 2020 10:18:18 -0700 (PDT)
Received: by mail-io1-xd42.google.com with SMTP id s10so10625999iog.7;
        Mon, 11 May 2020 10:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b7ywi95dPkco7T5CqY7Ij21XZ2F7lgDUu5ELoqshkqg=;
        b=I60NhLeQjiGFzyZYQdNeASF8N8lVpKsXrFoi+WEQVPRg6ORfGQNSbSoDlW85TD8dq8
         wpMkDS4G3H/3cUbmsSfQgce4XDuGRzrvXeoS2W/aGTlm7tvJ2luOrDCYfda4tZ3LX0wh
         snyFihC9Et+xceZ58cN+y8I6gg76Hl0qcdMaD1Hc3rgSfI1/K23spAX0T7lWlWQs7gLV
         xR5jI7qIz+XDH5j7p8MSr9Ll9Ipl7o67P1oMZpCadGAojWOhGZm2ctyhfT35ZyVQEm37
         6mOzZrqOFWCjLI0MIZQKDSuTnqzHLBqDnBdyxxX0m1klqc0e0vn3xBRrgpXk/P5w2z7p
         hAsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b7ywi95dPkco7T5CqY7Ij21XZ2F7lgDUu5ELoqshkqg=;
        b=FrdBSriMmro1C+xB4KEUUppg1eZM979U3wIk4rLEm9HYSYPbMU9IvPScRkvUZqFAl/
         CoLBwvM+eg79lAlrmVhVPYRocX/Hd3y+FoG07v9t1q3BYRZL3sPDFea6D1FZgyP8ARBS
         Ok7LpF/iDwQwotfI9q6xAIumsAg42+IullTfaMeHCnXOm3UlAjZOr2o8ovmR+7yZIP1l
         ytvKE4/uvOQ98oUZGr/nmUFJtdDeEOc3O+1o0reR5Bq0dOLH1Q2dcRHM8XtCUrxLsMzE
         IcZTLC9ncxFdBqoOm5GuZoHjVp4MIRjDgKs0G+L1zgDUwKDGwjdxzjHs3tZ4Tx7bgW7F
         1g6A==
X-Gm-Message-State: AGi0PuYsmQjxs6GVLJvaRjupoMTAJDP9FC9RJbeY1EL4x+jr8/ZADxff
        yzUKgtL7nC3DN98N5OlPmyFvXJck2DUNZngLX6s=
X-Google-Smtp-Source: APiQypJK/GCol9m33Ip4vahld070bNhXa0mDffBWMWJqSqmecoGneQtpaBcLCytsmrkR2/wYrlQanW8EFsR3wT4jguU=
X-Received: by 2002:a05:6638:11d4:: with SMTP id g20mr2067852jas.19.1589217498143;
 Mon, 11 May 2020 10:18:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200501205201.149804-1-konradybcio@gmail.com>
In-Reply-To: <20200501205201.149804-1-konradybcio@gmail.com>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Mon, 11 May 2020 11:18:07 -0600
Message-ID: <CAOCk7NqbOsQ2Bz1K8Gkeh75pLHDaUn6MhE1T7NkMYEHOPoL0NQ@mail.gmail.com>
Subject: Re: [PATCH] drivers: gpu: drm: Add MDP5 configuration for MSM8x36 and
 its derivatives, such as MSM8939.
To:     Konrad Dybcio <konradybcio@gmail.com>
Cc:     skrzynka@konradybcio.pl, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Allison Randal <allison@lohutok.net>,
        Alexios Zavras <alexios.zavras@intel.com>,
        zhengbin <zhengbin13@huawei.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Ben Dooks <ben.dooks@codethink.co.uk>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, May 1, 2020 at 2:52 PM Konrad Dybcio <konradybcio@gmail.com> wrote:
>
> Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
> ---
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c | 70 ++++++++++++++++++++++++
>  1 file changed, 70 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
> index e3c4c250238b7..1c7de7d6870cf 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
> @@ -342,6 +342,75 @@ static const struct mdp5_cfg_hw msm8x16_config = {
>         .max_clk = 320000000,
>  };
>
> +static const struct mdp5_cfg_hw msm8x36_config = {
> +       .name = "msm8x36",
> +       .mdp = {
> +               .count = 1,
> +               .base = { 0x0 },
> +               .caps = MDP_CAP_SMP |
> +                       0,

Is the "| 0" really adding value here?
