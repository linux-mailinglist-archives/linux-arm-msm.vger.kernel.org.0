Return-Path: <linux-arm-msm+bounces-26512-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16035934557
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 02:18:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 39C901C214F4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 00:18:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 570DA1B86D2;
	Thu, 18 Jul 2024 00:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ALxCxLjE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1340C15BB
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jul 2024 00:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721261904; cv=none; b=XbZ2qz4+DwLDz8qr6Y1as8W4SHCpuGO1HAZfsNvxhntRMmI1k4KaMTQkPIwXdUrRlvWsSq09EzEU1/6gdCStiE6qBEb/InA3IW/veaS9d/Pqjy9OOdBafJm6OetrSJkFQu/kS0Bhoo2L+p2PmB+ZaKRniUWqjZUwEKI3jcjSVdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721261904; c=relaxed/simple;
	bh=LDZP5PjnqCXHTDVJyKWG9YjKqovok23dIPj9ME9VSZs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sgn968AQ+HtwvknISbfZ0v6hxp+j46M4oh460bUVO/T6DytTUPk9sbGxzsJgGZMlTpw9TZwUEXTWPlrkq7l7zSxlz/2GtrmYggW2niDHzeBQU5t7tWQ1Va0HHoUj2Ku5QB10kFwJTKYjdhq6bVNDFz1nd3u2GAdGjKOODdn0ZpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ALxCxLjE; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4926a732a8dso70627137.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jul 2024 17:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1721261897; x=1721866697; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jR5TgSXxmEkVnQyI32oZApsa806xibThRKsCEzfjQ2s=;
        b=ALxCxLjE5sjeIfNX6ZJFkJ7jfEV1AARD4qpSJIM1y222pji4eXT1/2P1cJLHj2i5CY
         YqtRB/wZFioV/xQuuqu6wFeLV/SGjIk0zoRyLrqv1OGO2lHVqdBKqTuRvsPaHfJaSrb8
         3Jjp2A3cjwyam2tS0Vs2Ng+1bBC84xkuyd5Xo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721261897; x=1721866697;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jR5TgSXxmEkVnQyI32oZApsa806xibThRKsCEzfjQ2s=;
        b=hfpZ670wpWsUb5dc8/e1Cms78D8wsP4NBa5FV52FKLvLNuGw/uUyq0hNMmpJRFSzHn
         Osb2Xu3wRhd/rA/oLqd4sTUJg6nxwt6Odxdw+mPgfM9UFSXCSlkhF02pdM5HzFJETpTW
         vkx4woSOVULmaz3AdTLdqF0ml2bKvsjWOS6IXAL55zXnKfwwcXA8PbqJE5z5tTrGldui
         ic4x0irFNgXhBdc44XAeZzPfueB6uDXJGt4jYxDERMTaUzVqkia86fgsou3ZVjp11mft
         V6Dml7WH6f84WjJSC80lJMbgHV2/oIUuIHmG8U168xlHzk3drudAK3SV4iMK35Cn9evK
         ZMyA==
X-Forwarded-Encrypted: i=1; AJvYcCUjSKva/RFYi3z0wxb7HxgRBQNhCJ59O97SwT9k1clrviEvkNJgIx28p/p18KKw2t6JEkloZ/RPXUQH5kYMU7vAnqbbjHY7yRfls0OOjA==
X-Gm-Message-State: AOJu0Yxxns/y5oZqJxSmMWPs3MYCbIvF5Z7Y7gNeXsgsXbnWjpk8AvYf
	6uA6NJD0INTKQG9i39t+f+26E+Vjv4//7LWZ5YLi633EgyKw17Fgf9gETFLE/4IINy7j0VpGjE8
	=
X-Google-Smtp-Source: AGHT+IGcJUaWr4A+0WS6NygI3SgYRpT3SOBY9VR9hqr185yXaJ15KowMYeaiJSuwkzXJbHeBtZR+dA==
X-Received: by 2002:a05:6102:2c8d:b0:48f:e683:7b46 with SMTP id ada2fe7eead31-4915976d01fmr4251242137.3.1721261896606;
        Wed, 17 Jul 2024 17:18:16 -0700 (PDT)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com. [209.85.160.175])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-44f5b7e00a7sm53711241cf.26.2024.07.17.17.18.15
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jul 2024 17:18:15 -0700 (PDT)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-447f8aa87bfso156591cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jul 2024 17:18:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV4n6sly6AnaS/Fo1/wkRIijK47Teo4gtSF83BW/u5FjPxi9uc+zzhUt6IZexRPah2sr0/M1wnrSvz1uqHnO37tOvQAhq/dItxVbul5FQ==
X-Received: by 2002:a05:622a:2506:b0:447:f5de:bd18 with SMTP id
 d75a77b69052e-44f925cad76mr430051cf.9.1721261894932; Wed, 17 Jul 2024
 17:18:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240717215847.5310-1-robdclark@gmail.com>
In-Reply-To: <20240717215847.5310-1-robdclark@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 17 Jul 2024 17:17:58 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XCOKJHJ-yzENpvm_MD34tMR5LRy2m2jYdcWzZXP4pfXQ@mail.gmail.com>
Message-ID: <CAD=FV=XCOKJHJ-yzENpvm_MD34tMR5LRy2m2jYdcWzZXP4pfXQ@mail.gmail.com>
Subject: Re: [RFC] drm/panel/simple-edp: Add Samsung ATNA45DC02
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	Rob Clark <robdclark@chromium.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jul 17, 2024 at 2:58=E2=80=AFPM Rob Clark <robdclark@gmail.com> wro=
te:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Just a guess on the panel timings, but they appear to work.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
> This adds the panel I have on my lenovo yoga slim 7x laptop.  I couldn't
> find any datasheet so timings is just a guess.  But AFAICT everything
> works fine.
>
>  drivers/gpu/drm/panel/panel-edp.c | 2 ++
>  1 file changed, 2 insertions(+)

Given that this is a Samsung ATNA<mumble>, is there any chance it's an
OLED panel? Should it be supported with the Samsung OLED panel driver
like this:

https://lore.kernel.org/r/20240715-x1e80100-crd-backlight-v2-0-31b7f2f658a3=
@linaro.org

-Doug

