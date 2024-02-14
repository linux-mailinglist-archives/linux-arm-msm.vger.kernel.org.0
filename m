Return-Path: <linux-arm-msm+bounces-10959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE6D85410D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 02:18:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5A24BB28333
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 01:18:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48F606138;
	Wed, 14 Feb 2024 01:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bveaKCvz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0D4372
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Feb 2024 01:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707873477; cv=none; b=qiX39/TCEMGSxCLdScSKMz/hlIxaTf7IwKyV7NfwTHG3kSwqefd8Gz2OuvKWyqnL+phqIg6DD/1IxfSZDTULQiL6cbRsL2nkODnep6WfpTu+uDAXcSzKlAuaNhC8oq1HaWamGQf0pVfDxWjZ05iurHhJWXqgKzeKbLrSBN5j/FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707873477; c=relaxed/simple;
	bh=rBM05EwNb5zPmJZsUcrviXxJFm4T/Pw0l7QiMDppS5M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JLFNcCaI5G5hVq3y5cXD0jH3qcEF7r60OUzN9Kimhr1XJX6Y6c2mGmsAEocCiX+H1c+oDq3TNnLC2tyaJVDoVd8h4aCm4h0eaarVF5+W/rSBZ2nmAbhQYIkLeWCaDfNV0vzv14F/cS7xJ0QjhgUf7TnTghvq/hsCz32CKdjD8dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bveaKCvz; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a3566c0309fso607201166b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Feb 2024 17:17:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1707873471; x=1708478271; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rBM05EwNb5zPmJZsUcrviXxJFm4T/Pw0l7QiMDppS5M=;
        b=bveaKCvzlrMd0vxaArv+rLMs218PWPG20i6R9TfycTGArfIY0YqptaMqeW5BvYmo4o
         uyxGH+QFPrlk2LsZqT/vULXQNDJn8Yp/jrNG/iWRFN62vmu/FNkVUhbHu/FcC+QdijKF
         qP1INmSb6kmfrT8Swj3O7y308E5gWHQkneoHo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707873471; x=1708478271;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rBM05EwNb5zPmJZsUcrviXxJFm4T/Pw0l7QiMDppS5M=;
        b=Awle/t7e2l8On8Zs4qq/E4fn985DyONR+BxApsi+hXYL6jzjBuT9n4709ivLRXi6yn
         TvJqYanO2qvqMRVG3x4fySASKVmGzKY/9sqicGLh6wZ2iiXKyiyxn4r0sfpqp0U2dqjv
         POa/6TU2BABqcnpCv6tXTwe06mmNBjx0iH3nl69PSaQYAVDRq6titOpl2b+C+3hPSNRB
         Klcws+P0qvoY+q/DFbnA/j+8ZZvJ/HZ/lzCNYZAGntph/LYahrHqCC/78EP+vAQV4BW3
         UvBMxVwyBrptADbK63Ia9hiJ8UjSGSkvb7ODnNtzkDzm2gYgANuJQV80VKOaih2wR66T
         AY8g==
X-Forwarded-Encrypted: i=1; AJvYcCVLQB5+zokhAhIzVc9yoeXYZoNNSLO0BlN4QBpfBPmKWllQrk3cqVNlAYLqQKh4y0xW3+X6zgvSf33xODYhDYVGk4RfjarwKshPcQdaLg==
X-Gm-Message-State: AOJu0Yz2ignap74l8LgIODNdu72ksoHWRoxqLxVAZQuN1HEdGQW81Uk0
	P14kRre6RfpSkXnbzfa7TIJoxstTjqSG2GrqrtBbAuhxl79J2JlA169cFySPhhyxFAObSI+U/PL
	84l3J
X-Google-Smtp-Source: AGHT+IF5jOahcwBML9wW+uP8ertJKRoylmu1Iz+iLao2oro29ZXaOK7ZWmUhcmZaJiKiCRHUU5j74A==
X-Received: by 2002:a17:906:4a53:b0:a3c:fde:6382 with SMTP id a19-20020a1709064a5300b00a3c0fde6382mr644618ejv.52.1707873471315;
        Tue, 13 Feb 2024 17:17:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW4lY1gUSsNZfLEm4Mhm92mwufnWlQ+AM3D9gXLsjNUKcK5XE3Zlogo0p5M3iKFawFev3FeSYyj/qU6OTUw3uwQ3GaWJXAuWWNIl72O9A==
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com. [209.85.128.54])
        by smtp.gmail.com with ESMTPSA id lu1-20020a170906fac100b00a3c97e49bc9sm1785784ejb.218.2024.02.13.17.17.50
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Feb 2024 17:17:50 -0800 (PST)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-410c9f17c9eso104155e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Feb 2024 17:17:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVhF88ykWNe1UmV3M3Ny0Q9j9maL/WrQyyLo5eIDNc/2YZp/iIC4bmXKZvC+jDZIievpY10O/NkkaQRLqfPwIxvEO28/4AIVdMAHy1rRg==
X-Received: by 2002:a05:600c:4e4d:b0:411:62c:b4ae with SMTP id
 e13-20020a05600c4e4d00b00411062cb4aemr75039wmq.7.1707873469959; Tue, 13 Feb
 2024 17:17:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240210070934.2549994-1-swboyd@chromium.org> <20240210070934.2549994-19-swboyd@chromium.org>
In-Reply-To: <20240210070934.2549994-19-swboyd@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 13 Feb 2024 17:17:34 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WE4bgwTWTKjPbQR9RCt-SEVZXfQtXoaXAjvTiZiMr=wA@mail.gmail.com>
Message-ID: <CAD=FV=WE4bgwTWTKjPbQR9RCt-SEVZXfQtXoaXAjvTiZiMr=wA@mail.gmail.com>
Subject: Re: [PATCH 18/22] dt-bindings: chrome: Add binding for ChromeOS Pogo
 pin connector
To: Stephen Boyd <swboyd@chromium.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Pin-yen Lin <treapking@chromium.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Feb 9, 2024 at 11:10=E2=80=AFPM Stephen Boyd <swboyd@chromium.org> =
wrote:
>
> Describe the set of pins used to connect the detachable keyboard on
> detachable ChromeOS devices. The set of pins is called the "pogo pins".
> It's basically USB 2.0 with an extra pin for base detection. We expect
> to find a keyboard on the other side of this connector with a specific
> vid/pid, so describe that as a child device at the port of the usb
> device connected upstream.

Can you remind me what the side effects would be if a different
VID/PID shows up there? I know it's not an end-user scenario, but I
have a pre-production "coachz" keyboard that's actually programmed
incorrectly and shows up as the wrong PID. Presumably I could either
throw the old hardware away or figure out a way to re-program it and
it's really not a big deal, but just curious what happens...


-Doug

