Return-Path: <linux-arm-msm+bounces-39130-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 063D99D8BAE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 18:54:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D9A3163EA9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 17:53:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D641F41C92;
	Mon, 25 Nov 2024 17:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JifcHzyr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005B81B414F
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Nov 2024 17:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732557239; cv=none; b=fvqIqdnTtSVNvAS/YMtGSh+rllmof1W5xR78uorTgLFf5UpHJieaZ3BcbUGznFvOymK96XvN9aDu0kQrG/xVDHPE7KJka5ILfMHlWASj0Nfhhz+2zzUAkuJCvBj2nXcOBtBW4x6rkc7fwaSpoMGHSYENQg3otg8tzENzuKMPgDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732557239; c=relaxed/simple;
	bh=+aKBNdyqoPPoH7YFlDbUCvXZ6sn8H8tO0XYdJpv9c8M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=INTVcWB4qolld2ku8sjphB4+JKYidAci27llsWSSJs2dcpU+oc8X7kJduUQSky5/5oM5NpSldnQdEIx5NnU48xi7VPibEg/dbR0y7i/4rrwklF6XQ2dw/g+Z3BOyFmw3uKVYjItSUupn5wsXVd96VDoeiPkKx4gpQivyvdkCWjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JifcHzyr; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-53dd59a2bc1so3723856e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Nov 2024 09:53:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732557235; x=1733162035; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bAoWd6DpzeBICi4AhBURcNm7laPx9KjIN0TBKhbYcUY=;
        b=JifcHzyrpA83IybBgVuyMiiJFfmVevRVWEdtH2KZF2e4jnNKPdBQXF9WTvv4gT//hf
         aAP/gkX+eEMiT6DiMYO0qku7RwGrgXOvNo6RhW9ds5fSn+MfS8PesRAk+0PNP7lVVwV2
         VXZGHXmPdGxuZ3aN1xqjZRsXIihtO9gbZxt+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732557235; x=1733162035;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bAoWd6DpzeBICi4AhBURcNm7laPx9KjIN0TBKhbYcUY=;
        b=LoCn1apMawUThX+0Z3JoonkL3vV91Q+Oxk8Z3Uf+0x2HUvcyiA17HroDWniKJvEeC5
         p7+J/J8p9+VZzcORKMtnq9Qe7CX75BeIGLgrlVWPrwMsXsv5+YFn9PA8+l73CRy4M7X1
         Z+lGLC8RfrJNV03YBuLCGlGbx5iEZivoQdBwZJF/Ulq2LM3MV5qjA5xmFsJyjhDFljBR
         0nKI4nmZ/78quiAKwc58loHQQ8UbxG9JHH0+x1OKscT87x9tqTB7uVFRe13Ct/3NdApl
         fMDhzBHfLjhFhN/FbVq20pweqDqEISxbuZXe8/x06cyr09I+13aMsWbwae52a3AAh9QQ
         KKJA==
X-Forwarded-Encrypted: i=1; AJvYcCUG3AHxBc/uenY14lUaUhORZz0+ZEcLUZVrimBGqQaHocVaxNua7VLW9v3gdUipM0qjtXYvulZ7sipcs/bg@vger.kernel.org
X-Gm-Message-State: AOJu0YwJtGNuK5rKXHOomxedNqgf+G6HQCcybZ0zS8QDQqCR0p87Gsuh
	BTkV6nvUcbOKNTnk0L6nGQNhrJvVtJqZKO7BweaDWMQx7JUbGunxZFNcs1ym/Q+AuhxF206P4Ox
	YYg==
X-Gm-Gg: ASbGncuwLOhjyZcmOsxuGBa8dg/EwIhuWeALE8S9BogTQ8QEh2bOgA79nDyK6qiw2iR
	0fdp0ynDpDDhdRI1FQn/mJ+WOo9Sh6joOVOuT9Yvya/3Hfi9qJtzTp127zN0SBFjcDE9L8QtAnJ
	qgB9uCu2ITU95wPraY6suBOHTmAY5EpLIuFAheUh2BB5Q99UhDDpc4TnFmXrHs4jcUNl9WP8sr6
	USFE5ws8WlSsM56cS55hO/1itBZq6kTNzE/m8IicCpSIx/vErr8FfSRfzKCZHqyemZSmb5nAyF1
	FD04uIGpy95qYZjB4Q==
X-Google-Smtp-Source: AGHT+IFo/xTn4VodUOPd0HXCF4belFNuNhdKbWinZT4WYEYVhkBT7GZ5rqA6gTICPVxt+VG7T/qNVA==
X-Received: by 2002:a05:6512:1593:b0:53d:dd50:1a94 with SMTP id 2adb3069b0e04-53ddd501c1dmr3472366e87.53.1732557235376;
        Mon, 25 Nov 2024 09:53:55 -0800 (PST)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd2489af7sm1727824e87.184.2024.11.25.09.53.54
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2024 09:53:54 -0800 (PST)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2ffa3e8e917so43577571fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Nov 2024 09:53:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWw0Z1FIl+s0sBsKuQm/vIPf/gNyYafHZy9RBWfNF6V1tEgg8kvgblJMF7JcCnnAV334fDOBHxQiAQ3Dmm4@vger.kernel.org
X-Received: by 2002:a05:6512:1247:b0:536:56d8:24b4 with SMTP id
 2adb3069b0e04-53dd35a4f22mr6019059e87.5.1732557234037; Mon, 25 Nov 2024
 09:53:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241124-hp-omnibook-x14-v1-0-e4262f0254fa@oldschoolsolutions.biz>
 <20241124-hp-omnibook-x14-v1-3-e4262f0254fa@oldschoolsolutions.biz>
In-Reply-To: <20241124-hp-omnibook-x14-v1-3-e4262f0254fa@oldschoolsolutions.biz>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 25 Nov 2024 09:53:42 -0800
X-Gmail-Original-Message-ID: <CAD=FV=V2JhWsK4-gHL72ttXdNA0U2p6YojN+DXtWxNSOjD-ZSw@mail.gmail.com>
Message-ID: <CAD=FV=V2JhWsK4-gHL72ttXdNA0U2p6YojN+DXtWxNSOjD-ZSw@mail.gmail.com>
Subject: Re: [PATCH 3/4] drm/panel-edp: Add unknown BOE panel for HP Omnibook X14
To: jens.glathe@oldschoolsolutions.biz
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Kalle Valo <kvalo@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Nov 24, 2024 at 5:20=E2=80=AFAM Jens Glathe via B4 Relay
<devnull+jens.glathe.oldschoolsolutions.biz@kernel.org> wrote:
>
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
>
> Seems to be like NV140DRM-N61 but with touch. Haven't disassembled
> the lid to look.
>
> Due to lack of information, use the delay_200_500_e200 timings like
> many other BOE panels do for now.
>
> The raw EDID of the panel is:
>
> 00 ff ff ff ff ff ff 00 09 e5 93 0c 00 00 00 00
> 25 21 01 04 a5 1e 13 78 03 ee 95 a3 54 4c 99 26
> 0f 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 a4 57 c0 dc 80 78 78 50 30 20
> f6 0c 2e bc 10 00 00 1a 6d 3a c0 dc 80 78 78 50
> 30 20 f6 0c 2e bc 10 00 00 1a 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 02
> 00 0d 36 ff 0a 3c 96 0f 09 15 96 00 00 00 01 8b
>
> There are no timings in it, sadly.

Yeah, and like other BOE panels also no model info in the EDID. Sigh.
I guess "Unknown" it is until someone can officially add it.


> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/pa=
nel-edp.c
> index 8566e9cf2f82a..403679e506fa4 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -1915,6 +1915,7 @@ static const struct edp_panel_entry edp_panels[] =
=3D {
>         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0c20, &delay_200_500_e80, "NT140=
FHM-N47"),
>         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cb6, &delay_200_500_e200, "NT11=
6WHM-N44"),
>         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cfa, &delay_200_500_e50, "NV116=
WHM-A4D"),
> +       EDP_PANEL_ENTRY('B', 'O', 'E', 0x0c93, &delay_200_500_e200, "Unkn=
own"),

This is sorted incorrectly. I'll fix it for you this time while
applying, but in the future make sure you sort numerically. 0x0c93
should be before 0x0cb6.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed to drm-misc-next:

[3/4] drm/panel-edp: Add unknown BOE panel for HP Omnibook X14
      commit: c1bae6802ee9c8ad8e3c1df7ca3174d6b4b260e5

