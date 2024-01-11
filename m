Return-Path: <linux-arm-msm+bounces-7035-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A88482B128
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jan 2024 15:57:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DAFA21F2142E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jan 2024 14:57:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E812A4A9B3;
	Thu, 11 Jan 2024 14:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LtwipY78"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B2B4B5AD
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jan 2024 14:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-5f588ce1b6dso45703587b3.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jan 2024 06:57:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704985033; x=1705589833; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y4QJ/Zk/UxhefO+/Ds686chTEmns6pEsPp66wCH/Tr8=;
        b=LtwipY78GtVt3Y6uFrZXrDiJiH551VQ/8DFSI1guS+otC8ZssAtguJ1jEXgXnmDaDv
         pue7uidnE6Zzhty2K5sNdSQ1x+oz+bc3+kJ/m+DdkQPPB34IxUesvLmnGlbqgi52FfpY
         Qj+UqAfLAPoaetCNTINOVtII+ZOpWPLJsU3sthyo3Co3HSDIqGEvNmp9VIeZZlm7TC8O
         S9gUu+1V16ITU9K5KT1XnI155I/OHMgwtJv4kcct4wK771Hb97GeOEMJoT1djPqFSNyH
         ECzVsQxERBCpfPhhiiPUq8jwhedDQhIaclKbuclo4nUTJHN+gzdO7062nHzPqcGDp5OA
         Iq3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704985033; x=1705589833;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y4QJ/Zk/UxhefO+/Ds686chTEmns6pEsPp66wCH/Tr8=;
        b=iFPfVeu8zTNP1QfjL0QWEIQpx6INs/vyGQyxkJhZ2D+79/eSEaDYanXr0pB82qKFoV
         hriNMdJjRbOmhTgYvOsPmS3UjOLoGecofT/mWAHMHlMj7B8YiHIIZVQbrLU2MhAZYGa8
         txleLRTRPZTOIsaSXoEsyPUCsvYURuNsrmJKqOFpdd5H3kueTe11IRpy03V2uuok+Eub
         b+geHbUw92wo4hxwQrGb8g0IIc1I8bI3IW69fZeoQevwT4QvnsLS5lg4RqtFpa5AnD0l
         APocSkxTNtEAUF/ee4TG20mj8LD6RydYC4Wv2yDcEvQZYwl5e5I9HeQmOXBa6Re/4kEw
         CsUA==
X-Gm-Message-State: AOJu0YzM+fh/KrVTk12IW3YQnImwuWpdX2AejsopzzFeIVipWC18LzPA
	we3rsWNVQSzOxSB+4TAq2b3+vbusYh8u79cHr+fQ3TsMTKoJ6A==
X-Google-Smtp-Source: AGHT+IGlqFbVsocwq/Ya8t4EI0KodBoh1TFUMaOyVVs9af4K5210a84z1fodh56RrT3NSO1DP38JsInOPARS+62cxkU=
X-Received: by 2002:a81:aa11:0:b0:5e7:9454:6a2a with SMTP id
 i17-20020a81aa11000000b005e794546a2amr407663ywh.42.1704985032557; Thu, 11 Jan
 2024 06:57:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240110-fp4-panel-v2-0-8ad11174f65b@fairphone.com> <20240110-fp4-panel-v2-2-8ad11174f65b@fairphone.com>
In-Reply-To: <20240110-fp4-panel-v2-2-8ad11174f65b@fairphone.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 11 Jan 2024 15:57:01 +0100
Message-ID: <CACRpkdaWTfPDCin_L6pefHsokjNyO8Mo6hWPdzPLLi1EUkKUuA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] drm/panel: Add driver for DJN HX83112A LCD panel
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 10, 2024 at 4:14=E2=80=AFPM Luca Weiss <luca.weiss@fairphone.co=
m> wrote:

> Add support for the 2340x1080 LCD DJN panel bundled with a HX83112A
> driver IC, as found on the Fairphone 4 smartphone.
>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

This makes it sound like the Himax HX83112A is the driver IC.

This does not seem to be the case:
https://github.com/HimaxSoftware/HX83112_Android_Driver

The driver IC seems to be a truly 5p65.

If this is right, could you rename the driver file to truly-5p65.c
and all symbols containing hx83112 to truly_5965 or something
that indicate the driver IC instead of the panel?

My main concern is that the next display using the same IC
need to find the right file to patch.

Yours,
Linus Walleij

