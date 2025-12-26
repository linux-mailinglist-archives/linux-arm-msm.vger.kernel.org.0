Return-Path: <linux-arm-msm+bounces-86649-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC21CDEBC6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Dec 2025 14:25:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3A8E4300A354
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Dec 2025 13:25:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB479322B9C;
	Fri, 26 Dec 2025 13:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KoKUru12"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B5B322B94
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Dec 2025 13:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766755516; cv=none; b=VrS886LjKPU/BzPZQzOc959ce+/pJzwGTK6AMLupvF3dI+/5djYDnRuqcSm5dkhGeYjVzLxdEgzut18VzG6sIo9Qq3yrJjBc47iHOCBB2vNeU3m9Wvlpw5LWS8MjwvaMgUHV2QEee1HmOLYMzknZazTe6SVQ6IJnMoC37gr5xw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766755516; c=relaxed/simple;
	bh=N+qW2ZxSsuwmsYTva/gQOv+mTm92bNRglN2W548IvcA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fLZ80Bd6JvHnL5Gl/hYUxLegb6duaL5Zsn2ETPXAzvcxPqJsY0K63Vmi2+SvCjvwrgB3m59K6LLeZ7W3jLkFcKMARqeA3AEQwQhtkCP/ePmZBm645osBjGrr3+SFou9Ku6ASeTobgPFxrLw0nkqEG1WBfGUkkG7FqIMg6OzQg6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KoKUru12; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9471CC16AAE
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Dec 2025 13:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766755516;
	bh=N+qW2ZxSsuwmsYTva/gQOv+mTm92bNRglN2W548IvcA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KoKUru127MmKqpxOtiKtGZVqos42eS2rV+eZZsCt+pHnhHZYX5uwop4XJ1sNx58/C
	 iqnHS22FY3rlWBOKEeslx9wyieiDW53wLUVHmHzweQ9JkNimISJDRmMdOMbo49CS1R
	 h+pboSIW7cIjrgUV6ILI3naWHXoC84rhRaOAHTHasvK7SWl2mkdWjYNQ2+3cNyKWWJ
	 rLEtCUmBxZqCkn2g/hyqIFbNsSMDzgHa9eewCCTXdMEf5HISN1FGEvkR7TAtBXlSp8
	 COKBmfbpTkx293y/H6dGRk6EN5DU2svPtFOWNhZbphoR+nf3WEjO9XZ2QUE01DTTC8
	 DSvBfR28e7APA==
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-78d6a3c3b77so79512727b3.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Dec 2025 05:25:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVHTpLAwikxRVX4GrNBSgVqgbF6jVqJuwemYDSHGLiFgM0mwJE48/ywLcxwA3dUK38nFdYVSyoIseLW5KFw@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7V0okX8K1YYC8AFxwKMlsr4MyuN08aGXGZkh1aPX2V3SEH0d2
	EFAcPniWbfdYGEKirFL3mfRo2BG0aSUl4sEyq0eu9JskS/24lDg4cdJFtTcJgMsVfEP2gwI37LU
	SlUVJPTg/Ek7HO966QdoqNc6qgld8Juk=
X-Google-Smtp-Source: AGHT+IHMzaKONrzGJpNhXsdknH/aicOLZRUDH4SPgdgpx5CWGFJAOAxyt9BwJTfc6IFbfEyFRCcvwGHe8FMXyOD1eRI=
X-Received: by 2002:a05:690e:2519:10b0:641:f5bc:6930 with SMTP id
 956f58d0204a3-646632e007bmr15196355d50.41.1766755515738; Fri, 26 Dec 2025
 05:25:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251222-drm-panels-sony-v2-0-82a87465d163@somainline.org> <20251222-drm-panels-sony-v2-4-82a87465d163@somainline.org>
In-Reply-To: <20251222-drm-panels-sony-v2-4-82a87465d163@somainline.org>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 26 Dec 2025 14:25:04 +0100
X-Gmail-Original-Message-ID: <CAD++jLmSev3=HJF1j_kTU5j-u2NhxH6TsdE0uUjnD7Vqkt_h-w@mail.gmail.com>
X-Gm-Features: AQt7F2pPUaVNesdOAXSUmIYRXMzhy6HJ5toLN43bCtVtfp2IOUez4k0c74ZILyE
Message-ID: <CAD++jLmSev3=HJF1j_kTU5j-u2NhxH6TsdE0uUjnD7Vqkt_h-w@mail.gmail.com>
Subject: Re: [PATCH v2 04/11] dt-bindings: display: panel: Describe Samsung
 SOFEF01-M DDIC
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>, 
	David Airlie <airlied@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, 
	Casey Connolly <casey.connolly@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Simona Vetter <simona.vetter@ffwll.ch>, 
	~postmarketos/upstreaming@lists.sr.ht, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, 
	Martin Botka <martin.botka@somainline.org>, Jami Kettunen <jami.kettunen@somainline.org>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Dmitry Baryshkov <lumag@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Marijn,

thanks for your patch!

On Mon, Dec 22, 2025 at 12:32=E2=80=AFAM Marijn Suijten
<marijn.suijten@somainline.org> wrote:

> Document the Samsung SOFEF01-M Display-Driver-IC and 1080x2520@60Hz
> command-mode DSI panels found in many Sony phones:
> - Sony Xperia 5 (kumano bahamut): amb609tc01
> - Sony Xperia 10 II (seine pdx201): ams597ut01
> - Sony Xperia 10 III (lena pdx213): ams597ut04
> - Sony Xperia 10 IV (murray pdx225): ams597ut05
> - Sony Xperia 10 V (zambezi pdx235): ams605dk01
> - Sony Xperia 10 VI (columbia pdx246): ams605dk01
>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
(...)
> +      - samsung,sofef01-m-amb609tc01 # 6.1"
> +      - samsung,sofef01-m-ams597ut01 # 6.0"
> +      - samsung,sofef01-m-ams597ut04 # 6.0"
> +      - samsung,sofef01-m-ams597ut05 # 6.0"
> +      - samsung,sofef01-m-ams605dk01 # 6.1"

So is the assembled product really named like that?

Samsung S0FEF01-M AMS605DK01?

I would more expect the compatible strings to be excluding the DDIC
name, like:

samsung,ams605dk01

...but it's not like the vendor is helping us here, so I'm practically
fine either way. They are clearly using the S0FEF01-M display
controller.

Yours,
Linus Walleij

