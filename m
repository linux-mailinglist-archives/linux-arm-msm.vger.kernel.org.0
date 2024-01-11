Return-Path: <linux-arm-msm+bounces-7040-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C18982B1D2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jan 2024 16:29:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 703A41C22C3C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jan 2024 15:29:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D8DD4CB59;
	Thu, 11 Jan 2024 15:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="3UJA2fLt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17447482F7
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jan 2024 15:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f65.google.com with SMTP id 4fb4d7f45d1cf-5588ac5d988so1191113a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jan 2024 07:28:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1704986906; x=1705591706; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B7mE+52tIHuQGxlPUuwMMzBM9GxGpHPAmvjX828iiAI=;
        b=3UJA2fLt8ao7qa7PJpFFX89y4/NzY91dQdlWmuu2JcDf2fGp7WD6d/HJ5V3VxagBBg
         jSlhJFDWGqNp55VCfjzI7ftJJjYgV2zfT/G+SULL18+ycirnZKHaUsZgCSk5XMERIQB5
         3ctP07jkt2i+IboO8vrkCVlt8Q7xTRQHo4onn6YeFLKxweN6Y5MtS+lbrp15zC67uCkk
         a4uc5DHKZL2YBgXhcC6lgk4/AbbWmT5T+6oXFr/Pq1p8hOu3pu0DaxVUso6v66kdaoEr
         MSX5Q5vmiEYjZYpkhdspCA7kyVGaZol2IMtLaQwEJQDmrFnpK1PkL/HxomPc+UCGFrqi
         4XKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704986906; x=1705591706;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B7mE+52tIHuQGxlPUuwMMzBM9GxGpHPAmvjX828iiAI=;
        b=KHbMjNAhfBvBY5SlkTGcEH+m6Zv5LIFbP+UZhPqFYNbdZ8h+m4zU31t+Wu08tsvzqB
         4bZU/0rX1dzEGoRCE7KAd/Xb9Zi/fK+wcCfqk8NByZYL45ZQFhYMFMSjyRpjpCJOUZpv
         puKDqJtGde+hTK9NsjDx2QzviCtmqYXPTCx63euTkaDs3Po2v3KggJPUNT7hJyHivTkJ
         l/KPb3iYU003VVsumEyJtLvQbalwaAkhQxne8qSJYUfMwAouEqbNp4UtumPGPruQf1vI
         o9Nyq9GbHP1W87kL1tXTI3nHecJN0jxN7yBFG0cN6VFb+ahm4iqLflhwuFZVVOj8lW/e
         vOIA==
X-Gm-Message-State: AOJu0YxTGphNPU5KJz1XENn4vNPLg2DyS9z8NeY4g4/7V+rxFDufWhDq
	cvH5vJXxJyTLKMstgDoBtzhA/YpAmoLzsA==
X-Google-Smtp-Source: AGHT+IFrvzkgvZxDk2Qj4HTlNXeH9Cg5K5scTvQ7rSicpxuLzRPig/wdkeNZZxH3cj4lmdNGi3b+9Q==
X-Received: by 2002:aa7:d403:0:b0:558:b988:b8dc with SMTP id z3-20020aa7d403000000b00558b988b8dcmr33261edq.84.1704986906349;
        Thu, 11 Jan 2024 07:28:26 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id m23-20020a50ef17000000b0055751515a84sm717753eds.51.2024.01.11.07.28.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jan 2024 07:28:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Jan 2024 16:28:24 +0100
Message-Id: <CYBZEZ4IM6IL.VR04W7933VI@fairphone.com>
Cc: "Neil Armstrong" <neil.armstrong@linaro.org>, "Jessica Zhang"
 <quic_jesszhan@quicinc.com>, "Sam Ravnborg" <sam@ravnborg.org>, "David
 Airlie" <airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "Rob
 Herring" <robh+dt@kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Bjorn Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konrad.dybcio@linaro.org>, "Andy Gross" <agross@kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>
Subject: Re: [PATCH v2 2/4] drm/panel: Add driver for DJN HX83112A LCD panel
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Linus Walleij" <linus.walleij@linaro.org>
X-Mailer: aerc 0.15.2
References: <20240110-fp4-panel-v2-0-8ad11174f65b@fairphone.com>
 <20240110-fp4-panel-v2-2-8ad11174f65b@fairphone.com>
 <CACRpkdaWTfPDCin_L6pefHsokjNyO8Mo6hWPdzPLLi1EUkKUuA@mail.gmail.com>
In-Reply-To: <CACRpkdaWTfPDCin_L6pefHsokjNyO8Mo6hWPdzPLLi1EUkKUuA@mail.gmail.com>

On Thu Jan 11, 2024 at 3:57 PM CET, Linus Walleij wrote:
> On Wed, Jan 10, 2024 at 4:14=E2=80=AFPM Luca Weiss <luca.weiss@fairphone.=
com> wrote:
>
> > Add support for the 2340x1080 LCD DJN panel bundled with a HX83112A
> > driver IC, as found on the Fairphone 4 smartphone.
> >
> > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>
> This makes it sound like the Himax HX83112A is the driver IC.
>
> This does not seem to be the case:
> https://github.com/HimaxSoftware/HX83112_Android_Driver
>
> The driver IC seems to be a truly 5p65.

Hi Linus,

In some internal documentation it says "LCD Driver IC" "HX83112A" and I
don't see any reference to Truly 5P65 anywhere.

On their website they have this sentence:

  Himax offers display drivers for mobile handset displays that combine
  source driver, gate driver, timing controller, frame buffer, and DC to
  DC circuits into a single chip in various display technologies, such
  as TFT-LCD, LTPS, In-Cell Touch and AMOLED.

https://www.himax.com.tw/products/display-drivers/mobile-handset-applicatio=
ns/

While I'm not super well versed in panel driver ICs, this sounds like it
should be the one to take the name from?

Regards
Luca

>
> If this is right, could you rename the driver file to truly-5p65.c
> and all symbols containing hx83112 to truly_5965 or something
> that indicate the driver IC instead of the panel?
>
> My main concern is that the next display using the same IC
> need to find the right file to patch.
>
> Yours,
> Linus Walleij


