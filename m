Return-Path: <linux-arm-msm+bounces-76919-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D2719BD131E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 04:11:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AC7074EAC64
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 02:11:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DBC727F18B;
	Mon, 13 Oct 2025 02:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SrQ4iNdT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446462D5C9E
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 02:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760321388; cv=none; b=GC/y7Xm2CMfc0PallqrMfsOuHYIMkgZ6lGVuzcYv6y+dylpgvsGnh5JtlWEQLiar/A0xDnd3A8iTlEZHnziuDVoExCHjUetKhtjsUlIFlGoslQuoktJbdJKfi7E81ggWPjQb9J5kVvdMicW6Go6R/9upPBBG1ots6GS9r/yhJzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760321388; c=relaxed/simple;
	bh=FkhTO/czN9dofNzglJcnz28mMXp59FfI5fzYQN4S4kc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BUOR8kz2MEymBuBlURtWYOGSt/fGxgwcH+9lw0MLK+S/ecC5etNfl3zsSAHSUkVbySPdqwDfl16/G2RFPiz8wy3mLuTrdvjEcAwfxOhF8hhTQvyEoeCEzRu0c995O+Cv8jxrVw7IgH6mwPxaDIDjla4zt7ZwPyZwQi+FaeaLUc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SrQ4iNdT; arc=none smtp.client-ip=209.85.208.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f67.google.com with SMTP id 4fb4d7f45d1cf-6318855a83fso8394671a12.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Oct 2025 19:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760321384; x=1760926184; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wN9WKZXYO2Nmb+YIelwARSerR3E1lKOGfH0FqHzn+JU=;
        b=SrQ4iNdT4nG40VHPXbi+zLCcO4HFG8jR5gOMH9D5ZMC3P142Zkx3LzYXg+8vHG7dnt
         a+l3irMChyLPCPVb4lijKbAoPCB7z/IWpqTyE/0gyXl6OUkJiWVOgGoOhoGETithmEue
         uQ933uQikE9b+NCfx5otAcE1UmGBmPTz47kF11PyBMdA7iXxZCNtbg0SEVzgtTNwGs4Z
         /fB73rzMXg0Zx7iB6PLf16H7+dPio6MnqTvpLuBkiFzM5msLNhUKykzSt31Yw5EgdSna
         7Z47e7hBGg1JY9m2raFKNoGzDvcUBVLj7SrEEhaTAX5TVkr7lt87wwKsz6f64FazMbGk
         O6HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760321384; x=1760926184;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wN9WKZXYO2Nmb+YIelwARSerR3E1lKOGfH0FqHzn+JU=;
        b=ZWLXqE8iogDZeKSWVdG4Dhx1NTNqzu3a82zf/8+LYDervUzY/kj26P5yMxMOCwhQ6M
         xUAnghYDvx+RL/mI6IYF7NX+HW1uaUw5OlDrwV0mRtzdO+G7/FAAmt24OFUFImJ+5whv
         t/b2keaSQDgtAgVATRRsz3lgpVXyKxfYAi+rTTqloMAQRfTZakGjMNcuVzQ6pjxGr3N3
         dxC56825ne4FFdMUa8U9U5nlyHgdaB1xqKCYhOfgWDAFGE7RYKmOc2rAd87qArn06lKT
         pz5Fyfcu7rpwxJR1O6WT1ch/NASEMP7g/tC17XpTOrPHIyacLrsuIXrjinmLmaeiE43a
         fH0w==
X-Forwarded-Encrypted: i=1; AJvYcCX50vulmavQyjDUmmYa5BugI+AnZE3oMKpcxnR1a+3PeXBpI68dd6Ei3IeTt2dPpeoaxgqzDlBDD3ahVTAs@vger.kernel.org
X-Gm-Message-State: AOJu0YzQg9jJ/rkMhit3HXwdVHMBU9HFb4zId3enhi0bb5NYhudkw406
	ogFQsQN4glkGpoH2C9dRpcInoic7La4SEFqSu0jz/aBcMZtoFNszGBWiUpELuMsGsN9iqEclJ9t
	QDweXuNkGlpBrc3yc55JO58rVK0XPy9Y=
X-Gm-Gg: ASbGncsWgwLBsqa4E7sLb9J3wb52Q+7D8cIx69BN0dtkP5I8Komo+7UfK5h7x7gs/eP
	ZV7247vsxiL7UphR6wOw+gfIPtN6HPFtD2IbeWJBmVHeKbHphRhcaNeZzKp/NyB0UZ/Jt6F4wCQ
	FoBucvCwBrD1zZm1V9OpZHTqZnbGRZAzLhUfk5FBM2Zl2USTgkfV34MazLj+kQaszU2m7JeC/ek
	1perYrG1h7B2Be9nXdPAvZIBO/yC9us/oAw
X-Google-Smtp-Source: AGHT+IHSJMTE42FzCsgTGmPKRezFnzYeGwD48gJLrMiPETpubu6LIUbFJ/YFNHidT3rkFndsTeRCcQITlZmFIhHHLUY=
X-Received: by 2002:a05:6402:5106:b0:638:e8af:35d9 with SMTP id
 4fb4d7f45d1cf-639d5c3e994mr18251877a12.23.1760321384245; Sun, 12 Oct 2025
 19:09:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251001135914.13754-1-caojunjie650@gmail.com>
 <20251001135914.13754-4-caojunjie650@gmail.com> <lfdhib6a7ct36nmj3of2setjft7ydrf6sfgtx7qued7qd56nhc@2xol3grm5re7>
In-Reply-To: <lfdhib6a7ct36nmj3of2setjft7ydrf6sfgtx7qued7qd56nhc@2xol3grm5re7>
From: =?UTF-8?B?5pu55L+K5p2w?= <caojunjie650@gmail.com>
Date: Mon, 13 Oct 2025 10:09:32 +0800
X-Gm-Features: AS18NWB68269yeiTzdACPvm7V3NMKR_y0HxD4z4iqSVQM-VjCZQP0WcUwHJ0Wsc
Message-ID: <CAK6c68h307fRVR=QKJG1pRJuDi1oCSrSYXBamwpAMx_jUgX7fg@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/panel: Add Novatek NT36532 panel driver
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Antonino Maniscalco <antomani103@gmail.com>, 
	Jonathan Marek <jonathan@marek.ca>, Eugene Lepshy <fekz115@gmail.com>, Jun Nie <jun.nie@linaro.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2025=E5=B9=B4=
10=E6=9C=882=E6=97=A5=E5=91=A8=E5=9B=9B 10:05=E5=86=99=E9=81=93=EF=BC=9A
>On Wed, Oct 01, 2025 at 09:59:14PM +0800, Junjie Cao wrote:
>> Add a driver for panels using the Novatek NT36532 Display Driver IC,
>> including support for the CSOT PPC100HB1-1, found in the OnePlus Pad 2
>> tablets.
>>
>> Signed-off-by: Junjie Cao <caojunjie650@gmail.com>
>> ---
>>  MAINTAINERS                                   |   7 +
>>  drivers/gpu/drm/panel/Kconfig                 |  10 +
>>  drivers/gpu/drm/panel/Makefile                |   1 +
>>  drivers/gpu/drm/panel/panel-novatek-nt36532.c | 437 ++++++++++++++++++
>>  4 files changed, 455 insertions(+)
>>  create mode 100644 drivers/gpu/drm/panel/panel-novatek-nt36532.c
>>
>> +
>> +static const struct panel_info csot_panel_info =3D {
>> +     .width_mm =3D 250,
>> +     .height_mm =3D 177,
>> +     .lanes =3D 4,
>> +     .format =3D MIPI_DSI_FMT_RGB888,
>> +     .mode_flags =3D MIPI_DSI_MODE_VIDEO | MIPI_DSI_CLOCK_NON_CONTINUOU=
S |
>> +                   MIPI_DSI_MODE_LPM,
>> +     .display_mode =3D csot_display_mode,
>> +     .dsc_slice_per_pkt =3D 2,
>
>As this is not a part of the standard, what if the DSI host doesn't
>support this feature?
>

Without it, parameters will not be calculated correctly, garbled then.

>> +     .dsc_cfg =3D &csot_dsc_cfg,
>> +     .init_sequence =3D csot_init_sequence,
>> +     .is_dual_dsi =3D true,
>> +};
>> +
>
>--
>With best wishes
>Dmitry

Regards,
Junjie

