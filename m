Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9112939A386
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jun 2021 16:42:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230365AbhFCOoP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Jun 2021 10:44:15 -0400
Received: from mail-wm1-f53.google.com ([209.85.128.53]:44921 "EHLO
        mail-wm1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229744AbhFCOoP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Jun 2021 10:44:15 -0400
Received: by mail-wm1-f53.google.com with SMTP id p13-20020a05600c358db029019f44afc845so3842880wmq.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Jun 2021 07:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=S3gLIzTlRm90Fbhfv86Iy9u6F5Oz2fyU1X9eaD/GjVg=;
        b=WM9zOqh5gwb3s1mR9PW/RGNOGO0iK7n40nVvmbpNnVgKkrWMoT01LlIDTIooL47lZJ
         7wDfbvY95NRzX/etYxYVZJ0lFAbsNs2qggFooGWI9jDjT+tTsM2sleFx7MvygUqm5mNy
         tx4ths746VwyI8UlKOqNeZaaiNoaWg9Qcm+XNZinKI39t9ly9M3WH+fIrjBnS0t7hDUV
         +xNRHxXYoBlortSAdAl/cv89eXehnmCwmss/2JWB5KpXW7vJMjE7wPeLsda/wFVWmHQG
         PdLKJlv4sh3GYkdxrucmXLOeYn04K8DfEzLxyjr0IHvR5dICwZ3wB3MMY/+q222K4gCX
         GSag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S3gLIzTlRm90Fbhfv86Iy9u6F5Oz2fyU1X9eaD/GjVg=;
        b=TwXj7EMfCRx1Y0mjJgZUWMYxHp26FdytK311/znvNgMlfhV1ieahi4OPVDv9G9F73u
         D8WiS54FnFqr9COd1HNgzFOwPyMtVLqgYz29B1UzswuhAOT1GAl687v7atQh6713cmUT
         RGquB805NjSr1rAY5R9hJDH6EUGB1erGyd39lUTDurwWE0jssjsmWnuiyR2d5FgcSGDB
         cF4GMcE8iK802rpRz9c6sUoG/65tY2R5ERT8oh0xiKPO3xzL4VJhJTZXKXy/nedNGPsA
         MxV8mGzPBb7P9PmXyb32DwAwiI4K5Qs0l8ugSWleSr6VJeaab+wVEu8ZmmVnk8WrfFmy
         AeSg==
X-Gm-Message-State: AOAM530YN2/asTWqrHAXGLpvXgYdH23hwRTplP/RaK0h3suKTK75mPq3
        nO2zTfSu80C9eCwvsmw29SFbPDwa3yId/FWSZNB6vCVF
X-Google-Smtp-Source: ABdhPJxLV3SbPwFjb3ZelCeB3oIW2qicl9OJM5oD+Ojp6ILkGuMfs/U2Y4M5ZPWAahsbGutVXx7C1LLUVpuzzeu/4is=
X-Received: by 2002:a7b:ca44:: with SMTP id m4mr10634794wml.123.1622731276458;
 Thu, 03 Jun 2021 07:41:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210529002508.3839467-1-dmitry.baryshkov@linaro.org> <20210529002508.3839467-6-dmitry.baryshkov@linaro.org>
In-Reply-To: <20210529002508.3839467-6-dmitry.baryshkov@linaro.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 3 Jun 2021 07:45:08 -0700
Message-ID: <CAF6AEGsoUET_=P1YkAKb7GMRyrZV5_jmGeMHZhB1u4uE9m7B9A@mail.gmail.com>
Subject: Re: [RFC 5/8] lib: add small API for handling register snapshots
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, May 28, 2021 at 5:25 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Add small API covering lists of register dumps. Currently this is a part
> of MSM DRM driver, but is extracted as it might be usefull to other
> drivers too.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  include/linux/dump_state.h | 78 ++++++++++++++++++++++++++++++++++++++
>  lib/Kconfig                |  3 ++
>  lib/Makefile               |  1 +
>  lib/dump_state.c           | 51 +++++++++++++++++++++++++
>  4 files changed, 133 insertions(+)
>  create mode 100644 include/linux/dump_state.h
>  create mode 100644 lib/dump_state.c
>
[snip]
> diff --git a/lib/dump_state.c b/lib/dump_state.c
> new file mode 100644
> index 000000000000..58d88be65c0a
> --- /dev/null
> +++ b/lib/dump_state.c
> @@ -0,0 +1,51 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2020-2021, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2021, Linaro Ltd
> + */
> +
> +#include <linux/dump_state.h>
> +#include <linux/slab.h>
> +
> +void dump_state_free_blocks(struct dump_state *state)
> +{
> +       struct dump_state_block *block, *tmp;
> +
> +       list_for_each_entry_safe(block, tmp, &state->blocks, node) {
> +               list_del(&block->node);
> +               kfree(block);
> +       }
> +}
> +EXPORT_SYMBOL(dump_state_free_blocks);

nit, perhaps EXPORT_SYMBOL_GPL()?

BR,
-R

> +
> +struct dump_state_block *dump_state_allocate_block_va(void __iomem *base_addr, size_t len, gfp_t gfp, const char *fmt, va_list args)
> +{
> +       struct dump_state_block *block = kzalloc(sizeof(*block) + len, gfp);
> +
> +       if (!block)
> +               return ERR_PTR(-ENOMEM);
> +
> +       vsnprintf(block->name, sizeof(block->name), fmt, args);
> +
> +       INIT_LIST_HEAD(&block->node);
> +       block->size = len;
> +       block->base_addr = base_addr;
> +
> +       return block;
> +}
> +EXPORT_SYMBOL(dump_state_allocate_block);
> +
> +struct dump_state_block *dump_state_allocate_block(void __iomem *base_addr, size_t len, gfp_t gfp, const char *fmt, ...)
> +{
> +       struct dump_state_block *block;
> +       va_list va;
> +
> +       va_start(va, fmt);
> +
> +       block = dump_state_allocate_block_va(base_addr, len, gfp, fmt, va);
> +
> +       va_end(va);
> +
> +       return block;
> +}
> +EXPORT_SYMBOL(dump_state_allocate_block_va);
> --
> 2.30.2
>
