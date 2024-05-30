Return-Path: <linux-arm-msm+bounces-21120-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0238D4E0C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 16:34:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E49181F21253
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 14:34:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C759417C21C;
	Thu, 30 May 2024 14:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UY6jCxw7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D99016EC1E
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 14:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717079663; cv=none; b=iY5Da7+b//4DqY6CQ1b/iska9h7H7gYSKfOulVp5HPE6s0BjJAMG+5+ZfG9E7RgXdq/Lo5XH7FiDSi9B0qcYP/2E0vUIpTJhD7Di7Dym1tcXA/LgqQZiXC6z4LVYCfHOAyxusRq9pKdRaW7i0u7hbnVEQpl1jxcEg1R65U35Fcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717079663; c=relaxed/simple;
	bh=Lr42HS19H39Jg+IU3og7cv+Dzp46hLgy1NFduKRJYvM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oNr4T2D+OV/aYCibx7WTjUI87ra3WcN7XH7DBv87X5qiWgX4/TeIg4ZHRCyZclzCENfL2NOEO1LReCiLjC3aO/sttYlhr4MylG9v5V5sq6/q20vuc75p1fbfBUy1oO1gYfYgN3B4rxGbP2ZFr5NcTSOc+b68k01G1UBnqfE6cJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UY6jCxw7; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-43e23ce7b07so4880881cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 07:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717079658; x=1717684458; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SC6nWvS6ksIVK7SPyvfcXHHq7DHpEEdDXC/BUNLhAHQ=;
        b=UY6jCxw7Lk1SQALETVI3z3POLOF6PdPDSnAN43zIlY5TkXy4wIM3rWAXkor8WPVTW0
         +FDYyWld50d4vnD/69LIADvwYkaT1fTtXtkY/uZCsbzvI6k4Bv0wEZDR4qGCilGLnSjL
         j75mk4HFvQcfZSHt2trFBc3rUmnIDQBWgBPWw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717079658; x=1717684458;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SC6nWvS6ksIVK7SPyvfcXHHq7DHpEEdDXC/BUNLhAHQ=;
        b=mbtFr5FzHUcGKI6HqGfDSFYZEVPlzAluI6fMjUY3tzH82GKaonRpiuCbASojAIjYN1
         wNQCl8ubAMlIRCwIjNdsyWuEATn59U+bOWuOqDmbYwIraRqc8F1BlZhicFokJMHbdun9
         yEOo+t2gKN9+uRYy+2YSfy23zNsxY2xl2fW8pHmkaC6DZjTX5/w9lu3vqEysXyjm8/5B
         61rapGihizZ8EQzP9n1/fQXeQPKv3Zgr/t8ORbVZLJQGBWCIjRVg9pjGQDBa9toC50Mr
         BqaN3Eh38Vyt+CtwjDwRfw3R1DqjQPW9VPQwgVZy5hQ2cHWqZFokv7ecxF/4kD1rlPBz
         P5Pg==
X-Forwarded-Encrypted: i=1; AJvYcCU9m06Gki0bMAW8iXGQJsqbKSheyibB5VIWpt7a3zToc1qeWeqaeBuvMawfH8nG3NrZJQYbuNdrvOhKzO/pysB31WPd7dm3nU69MPD7Ug==
X-Gm-Message-State: AOJu0Yy3854W1/2SYv88Shy7tbndSxE6NJZnjusGOV4VVJQDjrQ/C34C
	MyjKFt8NI5DXebB4YkNJdBTaapSSt+X8XFP563fa6ygeQ/Cc6Q2hFNyDW46m3VkUoUtuBeLrkdw
	=
X-Google-Smtp-Source: AGHT+IEXpUo3C95M/tp3DRvfQzyBlWXd5dR43a8h1iHXluWsdo3BMj11ZkaWvFnfHEBVu/OttmZxzw==
X-Received: by 2002:a05:622a:1a9a:b0:43a:f441:75ab with SMTP id d75a77b69052e-43fe92bb699mr26235961cf.22.1717079658321;
        Thu, 30 May 2024 07:34:18 -0700 (PDT)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com. [209.85.160.175])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-794e52c1517sm119760385a.59.2024.05.30.07.34.16
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 07:34:16 -0700 (PDT)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-43dfe020675so363511cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 07:34:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXMga/u+yR5W/9flWWB5smEZmHr34abxUVwJm5Pdmq1AQgZJR3MhonI6COivpsHOW9FF0PR68DX+dukEMFz+rYvPZ7Fhfd6A7wTfEx7eg==
X-Received: by 2002:a05:622a:544e:b0:43a:b51c:46ca with SMTP id
 d75a77b69052e-43feb5182fdmr2765661cf.29.1717079656252; Thu, 30 May 2024
 07:34:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240529-edp-panel-drop-v2-0-fcfc457fc8dd@linaro.org> <20240529-edp-panel-drop-v2-1-fcfc457fc8dd@linaro.org>
In-Reply-To: <20240529-edp-panel-drop-v2-1-fcfc457fc8dd@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 30 May 2024 07:33:59 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Uw+KYQQ2xFLhNdWSW0sNX9uV_zSAVO2uBWY4JEcaO2bA@mail.gmail.com>
Message-ID: <CAD=FV=Uw+KYQQ2xFLhNdWSW0sNX9uV_zSAVO2uBWY4JEcaO2bA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] drm/panel-edp: add fat warning against adding new
 panel compatibles
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Sam Ravnborg <sam@ravnborg.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, Jeffrey Hugo <quic_jhugo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, May 28, 2024 at 4:52=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Add a fat warning against adding new panel compatibles to the panel-edp
> driver. All new users of the eDP panels are supposed to use the generic
> "edp-panel" compatible device on the AUX bus. The remaining compatibles
> are either used by the existing DT or were used previously and are
> retained for backwards compatibility.
>
> Suggested-by: Doug Anderson <dianders@chromium.org>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/pa=
nel-edp.c
> index 6db277efcbb7..95b25ec67168 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -1776,7 +1776,23 @@ static const struct of_device_id platform_of_match=
[] =3D {
>         {
>                 /* Must be first */
>                 .compatible =3D "edp-panel",
> -       }, {
> +       },
> +       /*
> +        * Do not add panels to the list below unless they cannot be hand=
led by
> +        * the generic edp-panel compatible.
> +        *
> +        * The only two valid reasons are:
> +        * - because of the panel issues (e.g. broken EDID or broken
> +        *   identification),
> +        * - because the platform which uses the panel didn't wire up the=
 AUX
> +        *   bus properly.
> +        *
> +        * In all other cases the platform should use the aux-bus and dec=
lare
> +        * the panel using the 'edp-panel' compatible as a device on the =
AUX
> +        * bus. The lack of the aux-bus support is not a valid case. Plat=
forms
> +        * are urged to be converted to declaring panels in a proper way.

I'm still at least slightly confused by the wording. What is "the lack
of the aux-bus support". I guess this is different from the valid
reason of "the platform which uses the panel didn't wire up the AUX
bus properly" but I'm not sure how. Maybe you can explain?

I guess I'd write it like this:

    /*
     * Do not add panels to the list below unless they cannot be handled by
     * the generic edp-panel compatible.
     *
     * The only two valid reasons are:
     * - because of the panel issues (e.g. broken EDID or broken
     *   identification).
     * - because the platform which uses the panel didn't wire up the AUX
     *   bus properly. NOTE that, though this is a marginally valid reason,
     *   some justification needs to be made for why the platform can't
     *   wire up the AUX bus properly.
     *
     * In all other cases the platform should use the aux-bus and declare
     * the panel using the 'edp-panel' compatible as a device on the AUX
     * bus.
     */

What do you think? In any case, it probably doesn't matter much. The
important thing is some sort of warning here telling people not to add
to the table. In that sense:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

