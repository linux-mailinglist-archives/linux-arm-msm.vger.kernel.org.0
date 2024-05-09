Return-Path: <linux-arm-msm+bounces-19617-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2658C17BE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 22:43:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36D2C2815D0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 20:43:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CD457F7FD;
	Thu,  9 May 2024 20:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wfdHfDz5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B54C7FBA3
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 May 2024 20:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715287383; cv=none; b=Cgox6dAqWAH1oMUCUNz82GRQjdPIdwgARzMzlLL6tOis/SA/MLcg62M7gBnum+JerJ8COYtBAtv0MuMj/NKTlk0PJZfSpYUM9UEGe5D8hAZvBaf8+s9CLJYQfkTwoQZnTk+sPPED+EHgPYUvjj5JQ57StSD8XIYgHGjC9U5pvJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715287383; c=relaxed/simple;
	bh=Xuyf5D/JeLOVpt2488i7mkV8ldkhM6ZKdnpJaxNMLQw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B4ome7R38oZjEE8zqY1/yeCWcsyU3FUhQpJthicRjcf6ZJXdxYYXXmebWCud4WVSk8CkrWKKsKxx8iw10sNJCSsqm99vug7T/uS48KbizwIp9CUUNKCRtsFLzHOF/kkHN20YOB485ZMXB3uxY1evbl4h1QEy65rDIs80nwaubxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wfdHfDz5; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-de8b683f76cso1876009276.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 May 2024 13:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715287380; x=1715892180; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GyO7lOaBJGIXBBRmSEVUT3jjg2maQrneBPVuSy70JpQ=;
        b=wfdHfDz5BFi0szady3flK7d7MdwJdlWlzsjMwbtyiSFNSXC8pubTPPQg+WcMc67RRx
         mXPGmU+Et7MtJcttJ5crfbopZHIlsJvf/snAGpKo6rNzYmttsSo4YzY801CX2f5c0C6Z
         hKDegbw+vCj/POQaAu4ZAbkLMP+D0+mIB7FP6fkw7qVRc6cFb5bsy4ust9RGnzrKK6zu
         YA0DuZWV/UEfppPOfOmLHdllSn5EjE5W8udCF0pmegkp0y5Ynn8BshINJLS83VGSfvha
         5Wu6U8ucX358SVTI4hmiTdnv3smW4PQcBd96B3jI11Ffp13zz0vWLXRiSNyh5/Zaca0t
         TLsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715287380; x=1715892180;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GyO7lOaBJGIXBBRmSEVUT3jjg2maQrneBPVuSy70JpQ=;
        b=LRlVKKALuF4WMoRF8JkThrjdv1mNW22ngZmqq/c/7OBBv5uRzwK5m7UM0Gs5AoMxCR
         QT8qUsIpBwiNmw45ZsUNY4rlEYWrbMGWpuMYT46ShPOHkNYcZActf1kodHUrDaFg4nym
         vBJ9l65ZS9icPXO37D5qMzj5qZd+sYvt98RAIt3Mn4ebGZwhQ7aV9bJy61yViEKm3Lsr
         HWZWdMv0YfyhQNWmkd2VCu7tm7ITMYa66OWwPJuhSyhEQHemWuBsk1ouliEgmV8r/NOj
         bt1FWGxGp4wcJllwetEt0xc8Z0xFjGI49/wySPUDK2167zQFg/3OaBLq/RsFhlCCX/cL
         T5xQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjcNzVcRIYnAYy6K142pXGzRJ6pURGI5doEKQYvaz13Qa5/Cv77agJsy5U6b5LYwU3E3FWrlGCsONF63rk0b7X5S8xM0+zLQOxyavcsQ==
X-Gm-Message-State: AOJu0YyV5hTFyfvAMh8EOaMU/LXhwk3ueEEQoO5GwGX/wnQzlcr8APzl
	UHBiVk3S6Di51GxWb5odKzVT0Sr8+7zV1IhTEpDrKOuVRQ7+/xy0FvDebnIyoJcAylg2iCmAKxm
	pncWg5J/y8u//CjJoMZZsWuksicYDGE7jqEW0lA==
X-Google-Smtp-Source: AGHT+IG+qfOYPvC5Bh3mUYNkbKmgsIu9m523SnqmodnTG2ySW8CcwXrwuEZ/k1V57bmNDi9Db8o7UONgcoAYL1Cwt9w=
X-Received: by 2002:a25:102:0:b0:dc2:3a05:489 with SMTP id 3f1490d57ef6-dee4e4a7b67mr807131276.14.1715287380304;
 Thu, 09 May 2024 13:43:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240509-irq_wait-v2-1-b8b687b22cc4@gmail.com>
In-Reply-To: <20240509-irq_wait-v2-1-b8b687b22cc4@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 9 May 2024 23:42:49 +0300
Message-ID: <CAA8EJpqQWN4zE7vn=dG+CNPnU=94z_of5o7NSdom6x3d7nObHA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/dpu: fix encoder irq wait skip
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <trabarni@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 9 May 2024 at 22:40, Barnab=C3=A1s Cz=C3=A9m=C3=A1n <trabarni@gmail=
.com> wrote:
>
> The irq_idx is unsigned so it cannot be lower than zero, better
> to change the condition to check if it is equal with zero.
> It could not cause any issue because a valid irq index starts from one.
>
> Fixes: 5a9d50150c2c ("drm/msm/dpu: shift IRQ indices by 1")
> Signed-off-by: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <trabarni@gmail.com>

In the previous revision you have got the Reviewed-by tag, which you
didn't include here for some reason.


This revision is:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Note, there is no need to send a next iteration just for these tags.
They usually get picked up by the patch management software (including
the Fixes tag).


> ---
> Changes in v2:
> - Add Fixes in commit message.
> - Link to v1: https://lore.kernel.org/r/20240509-irq_wait-v1-1-41d653e378=
4e@gmail.com
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/dr=
m/msm/disp/dpu1/dpu_encoder.c
> index 119f3ea50a7c..cf7d769ab3b9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -428,7 +428,7 @@ int dpu_encoder_helper_wait_for_irq(struct dpu_encode=
r_phys *phys_enc,
>                 return -EWOULDBLOCK;
>         }
>
> -       if (irq_idx < 0) {
> +       if (irq_idx =3D=3D 0) {
>                 DRM_DEBUG_KMS("skip irq wait id=3D%u, callback=3D%ps\n",
>                               DRMID(phys_enc->parent), func);
>                 return 0;
>
> ---
> base-commit: 704ba27ac55579704ba1289392448b0c66b56258
> change-id: 20240509-irq_wait-49444cea77e2
>
> Best regards,
> --
> Barnab=C3=A1s Cz=C3=A9m=C3=A1n <trabarni@gmail.com>
>


--
With best wishes
Dmitry

