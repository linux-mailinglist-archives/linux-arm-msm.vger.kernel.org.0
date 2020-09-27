Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F404327A266
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Sep 2020 20:50:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726265AbgI0Suw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 27 Sep 2020 14:50:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726239AbgI0Suw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 27 Sep 2020 14:50:52 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E1DFC0613CE;
        Sun, 27 Sep 2020 11:50:52 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id x14so9419257wrl.12;
        Sun, 27 Sep 2020 11:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=g+t9R4EAtEIISULglZW0aLkA0SSVKLPzn9R1Q498LHQ=;
        b=FfJglfhij6sPHhMkXQYWrIyFodAjuGnK198UmhbKgvEU4nYuMphPdhTGhpPhIzXvTD
         heTAoND4AxD42O+xHl8M0e0c4gDmdtaJrlMHBh8ksBkiC+oFANGc7Jugcko0augs8lUf
         Qc0+TyQgEqN5kDUYtCWc4ufK3sQmmDpad/6XyUPDshBWiQlbpNCMvMk38Ni+3B9Vll6U
         CZEV4rsfW8Yx+ZJQZGfyhl/HmW/ifpDmtXAVlvF1n6WSxaPXm296SxyStdvjiHW5B/fo
         FAGqQdHNR2aunhQMS+KQJLd/mb4zgOZw9IVxqf9Db2t9C1VdCAvMpU6shpPoGiYZHqXo
         +U1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g+t9R4EAtEIISULglZW0aLkA0SSVKLPzn9R1Q498LHQ=;
        b=IO/cbOaPo15kEgO7Tz+Wgc5mCBRXHJK4JMiVB9d+oVD+ct/IgsIjhdqA74n1Dc48Av
         QP6cjVPf4Urf1xhEQD7tYzz0yJjV3QwAuc5nGwFyT5KYOm52xS97Urw1GbBpLVcd1q+h
         pIDM3dm3eN0uTS6rCW5RMjowDqcQ01f7XXp3/S8hk3BbIXNNyT5lgUfYXFXDrKIUiANV
         C63u6UE7/QdX1789bPcl31OSw3Id2VAqCyZVKODqQNWHkkCcvZ6+bk+sQ3NN5WXtQC2x
         R+Ju8iWzOBNUPA3ogQH9G0LuEbeBJ4B2bq5X/9rq8GgJ9Kpkud7Bkxcz8N9p10eMok5s
         uNwQ==
X-Gm-Message-State: AOAM533Xuttu1td6wbWOFv8Cb5b/BcivJ1V93ewgbxGEUVpReHPE5Ar2
        bv2LUwZA2RFzMkDw4wYzllfYdZ6kGwrpzRjvZc8=
X-Google-Smtp-Source: ABdhPJwReFAlPBA6bUsKMfNlvNTagxLjBdCxdBbMVAxawsEUEhQO6mmWgIpDc1xFg1fg+gnJfmbaZCa5NF13iGOIXSI=
X-Received: by 2002:adf:f382:: with SMTP id m2mr14295407wro.327.1601232650778;
 Sun, 27 Sep 2020 11:50:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200926125146.12859-1-kholk11@gmail.com> <20200926125146.12859-8-kholk11@gmail.com>
In-Reply-To: <20200926125146.12859-8-kholk11@gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Sun, 27 Sep 2020 11:51:54 -0700
Message-ID: <CAF6AEGud+uR5J8aJ_FK544-nCuFVQ6AgbJGQPkxMm_RH-i37xg@mail.gmail.com>
Subject: Re: [PATCH 7/7] drm/msm/a5xx: Disable UCHE global filter
To:     AngeloGioacchino Del Regno <kholk11@gmail.com>
Cc:     Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Konrad Dybcio <konradybcio@gmail.com>, marijns95@gmail.com,
        martin.botka1@gmail.com,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        phone-devel@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Sep 26, 2020 at 5:52 AM <kholk11@gmail.com> wrote:
>
> From: Konrad Dybcio <konradybcio@gmail.com>
>
> Port over the command from downstream to prevent undefined
> behaviour.
>
> Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
> Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> index bdc852e7d979..71cd8a3a6bf1 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -722,6 +722,9 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
>             adreno_is_a512(adreno_gpu))
>                 gpu_rmw(gpu, REG_A5XX_RB_DBG_ECO_CNTL, 0, (1 << 9));
>
> +       /* Disable UCHE global filter as SP can invalidate/flush independently */
> +       gpu_write(gpu, 0x00000E81, BIT(29));

Looks like this is REG_A5XX_UCHE_MODE_CNTL?  We should define a name
for this, rather than open coding.

(It's ok if you just add it to a5xx.xml.h, I can push a MR to add this
to mesa a5xx.xml)

BR,
-R

> +
>         /* Enable USE_RETENTION_FLOPS */
>         gpu_write(gpu, REG_A5XX_CP_CHICKEN_DBG, 0x02000000);
>
> --
> 2.28.0
>
