Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D766E392525
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 May 2021 05:00:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234250AbhE0DB4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 23:01:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234169AbhE0DB4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 23:01:56 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B0E3C061574;
        Wed, 26 May 2021 20:00:23 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id v12so1614525plo.10;
        Wed, 26 May 2021 20:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=an1polfQn6vieJpzgSqPdiPhq14M4oUVqX/Ylf5ziPs=;
        b=iLjcXPx4lqRNQzS3ska24bUU8Af/ko9/sGGaMUI2RpAPp4UphYKVzdDipO9Y6M1GkE
         dIeKh+Wbu7M0IJYH4YV7hRR2J2e+cpmie5MkvOZ6QXhbCNK8ozlr+ebLG9RAR3TZbFNY
         cqNFjJ22qsdDqQiBjJ4TrxeCjDN1GBfAqbGW2h8AsSMI7dp224h6CLRbild7A5zbTnwH
         ylEixnDV4NgDPWuBJDtBszWouxoysKzlIsbdbAXvfvDfFwPq3e3C6eFF0Q8gxmraFcp9
         XNWPwPB5nD4EkajG5bZMVM0b7TJgRdNN7ecydStYCcYAIoQVKl5hIrMS05Wg7CDmgVg/
         gu5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=an1polfQn6vieJpzgSqPdiPhq14M4oUVqX/Ylf5ziPs=;
        b=g2SR7ECloq5f2xAprQUdn2zDqqiPXOYYjpTShEHITYM540UTaQdf/bPaYUMR7wREx1
         74Zz4hREdhueicRcoWZ26i8j5xspHruM+O7yIZO9x8aYz8DxaWGq8yc5OLt65oXeibAG
         gtsCXzmKwQ/Le82eaqH95LvLwapbr5+LEbxwOtiMo/+WqNaN50f3m6wWEqR0A3tUlAio
         gxpcdpHm3g3MrvgLaJQzLkjLU+hXD/U+s0detdTZxJm7Bp/Ewc+wc7hgybJrM/O3u6Jg
         qtRJgpK/fX1v/6VdpDX8jzox6IFaskF1DKs+TH0KanIx54bTMPwveDsFL9am399Ggj5w
         /Asg==
X-Gm-Message-State: AOAM530SHngXpFRYZnLnp4OKeVf8qGxbr8fn0n+v6gikCI/GLwkbINed
        n17BjJTN6wHAtzZhYV7xIctLdNcLJI55aeKov/ZlcWMjdu4=
X-Google-Smtp-Source: ABdhPJwxnVnyzztt10Q86m+xS+QHTuioQsfAf05wWmuIlWJgsJUPA5s9c7IYyF029xW9KvhOQBt41hDKcpXIzZ1E8KM=
X-Received: by 2002:a17:90a:bd08:: with SMTP id y8mr7132190pjr.8.1622084423104;
 Wed, 26 May 2021 20:00:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210521041633.GA1747@raspberrypi>
In-Reply-To: <20210521041633.GA1747@raspberrypi>
From:   Austin Kim <austindh.kim@gmail.com>
Date:   Thu, 27 May 2021 12:00:12 +0900
Message-ID: <CADLLry7xtt60wNqD4ZkcLByqEuyBpdO4VYjGjbrTMLsG1ACdcw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: remove unused variable cmd_enc
To:     robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        Daniel Vetter <daniel@ffwll.ch>,
        angelogioacchino.delregno@somainline.org,
        dmitry.baryshkov@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        =?UTF-8?B?6rmA64+Z7ZiE?= <austindh.kim@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

2021=EB=85=84 5=EC=9B=94 21=EC=9D=BC (=EA=B8=88) =EC=98=A4=ED=9B=84 1:16, A=
ustin Kim <austindh.kim@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> After the call to to_dpu_encoder_phys_cmd() is made,
> 'cmd_enc' is not used. Where to_dpu_encoder_phys_cmd() is simply replaced=
 with
> container_of(x, struct dpu_encoder_phys_cmd, base) by compiler.
>
> So it had better remove W=3D1 kernel build warning(s):
>
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c: In function
>  =E2=80=98dpu_encoder_phys_cmd_wait_for_commit_done=E2=80=99:
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c:688:31: warning:
>   variable =E2=80=98cmd_enc=E2=80=99 set but not used
>
> Signed-off-by: Austin Kim <austindh.kim@gmail.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drive=
rs/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> index b2be39b9144e..088900841bf8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> @@ -685,10 +685,6 @@ static int dpu_encoder_phys_cmd_wait_for_tx_complete=
(
>  static int dpu_encoder_phys_cmd_wait_for_commit_done(
>                 struct dpu_encoder_phys *phys_enc)
>  {
> -       struct dpu_encoder_phys_cmd *cmd_enc;
> -
> -       cmd_enc =3D to_dpu_encoder_phys_cmd(phys_enc);
> -
>         /* only required for master controller */
>         if (!dpu_encoder_phys_cmd_is_master(phys_enc))
>                 return 0;
> --
> 2.20.1
>

If you are available, would you please review this patch.

BR,
Austin Kim
