Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E63C730B19
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jun 2023 01:01:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229453AbjFNXBF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Jun 2023 19:01:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233912AbjFNXBE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Jun 2023 19:01:04 -0400
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com [IPv6:2607:f8b0:4864:20::c2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 763D12130
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jun 2023 16:01:02 -0700 (PDT)
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-55b069a7cf4so1031421eaf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jun 2023 16:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686783661; x=1689375661;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nSH2hR39R1Nu5nYNmwG59rST+IPCeWv6B5EE3Mhl5OY=;
        b=Do/rnoOZm8KDvaqEeuPKDPWhinfOkHT4967FvL6stWl4f2aWuVw1RoQtdmgbCLprwu
         Qay+1kaHFf4r0eZSd6cXzTP3xUfRmLWBpPdrEW/Ud6QlbopV58yn7LEPn4SSC8jD00pe
         Zn77Tk6OjEDBQODXDmftu+yLVIhILKdBVon1Kbspwj1Ct8S+qSE9OCOq1jeG0YmQveSR
         qmYOYNHFYvnF1UMlqZTg7T2vR46EnoMP3JudhhH23KfCzwMdheNjM4u+F8TYJgGG//8+
         /A4BQL6CedjOgS5OWH7ZWQBgH/vYKvnWts1ZmPGvcDIYFw6Rucxo5s3n2IywCkhL02qq
         kd0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686783661; x=1689375661;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nSH2hR39R1Nu5nYNmwG59rST+IPCeWv6B5EE3Mhl5OY=;
        b=lNetdvdUyxl3NcjDZn1GBqb6OLoA9imSBsZNf4DvSOfbSuHxt17/ntESKs/0XGBZCZ
         CDXHXTvIx6bQliqGW/tFjgtQHpf5siB44Yj5MwSyDwz/17gQm/hsQpzOOuKhZPCgtSDC
         JqX2w61lSzf4vRnZ+mA3hxTH6fGX9TBqIAFMxBYSf2IjvdGpWCWDkD9ba5XMO7+fqEMg
         6WPp8RexF9y1GkBC3N0bW7UFqJW5PD5Jj3Uy4ykJeXXzQIky2mplGuLb2o9JeejhQxBa
         fRPjqEsLOq62V6G2iPDeBF9xjQ1pKYens/wby+oaSUd79/dfOkDegwELiqeMJ1U01Zy4
         v42Q==
X-Gm-Message-State: AC+VfDw/6HrRUNQQ40dDGo1pHQLduihyOZZoZ//8SiH3m+HIXlSmmkDp
        6Zsz3e4ccVQB+VFPgKHYlHx0NmzIM+mytP1TSW8=
X-Google-Smtp-Source: ACHHUZ46yEBe1FcunlF58VnQxu8cvZA4PXvar+FFbc8FSJYjMNbi0r+gSceDdOluLVGBpOQSW/Mt5H5Q5U21bdq5deA=
X-Received: by 2002:a4a:d9d5:0:b0:55b:2f80:39e4 with SMTP id
 l21-20020a4ad9d5000000b0055b2f8039e4mr11211428oou.4.1686783661535; Wed, 14
 Jun 2023 16:01:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230612182527.3345786-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20230612182527.3345786-1-dmitry.baryshkov@linaro.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 14 Jun 2023 16:00:50 -0700
Message-ID: <CAF6AEGv6ZYSN343AMF5JEaL-04ciRjMWxSdd21TgQDoUXpSzyg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/adreno: make adreno_is_a690()'s argument const
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jun 12, 2023 at 11:25=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Change adreno_is_a690() prototype to accept the const struct adreno_gpu
> pointer instead of a non-const one. This fixes the following warning:
>
> In file included from drivers/gpu/drm/msm/msm_drv.c:33:
> drivers/gpu/drm/msm/adreno/adreno_gpu.h: In function =E2=80=98adreno_is_a=
660_family=E2=80=99:
> drivers/gpu/drm/msm/adreno/adreno_gpu.h:303:54: warning: passing argument=
 1 of =E2=80=98adreno_is_a690=E2=80=99 discards =E2=80=98const=E2=80=99 qua=
lifier from pointer target type [-Wdiscarded-qualifiers]
>   303 |         return adreno_is_a660(gpu) || adreno_is_a690(gpu) || adre=
no_is_7c3(gpu);
>
> Fixes: 1b90e8f8879c ("drm/msm/adreno: change adreno_is_* functions to acc=
ept const argument")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Rob Clark <robdclark@gmail.com>

> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/ms=
m/adreno/adreno_gpu.h
> index 1283e5fe22d2..9a7626c7ac4d 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -284,7 +284,7 @@ static inline int adreno_is_a660(const struct adreno_=
gpu *gpu)
>         return adreno_is_revn(gpu, 660);
>  }
>
> -static inline int adreno_is_a690(struct adreno_gpu *gpu)
> +static inline int adreno_is_a690(const struct adreno_gpu *gpu)
>  {
>         return gpu->revn =3D=3D 690;
>  };
> --
> 2.39.2
>
