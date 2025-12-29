Return-Path: <linux-arm-msm+bounces-86839-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB2DCE6B98
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 13:38:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2F9EF300818F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 12:38:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28F8631062E;
	Mon, 29 Dec 2025 12:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lRTMVPBZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D0F3101CD
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 12:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767011886; cv=none; b=Qa2qz8Mc1OK6CLgGMYxoQ6wn0fbfe+FF1sEQbcp/zNE84a/K82xzKaEaXCKMdBnb6EF/1FqaZc1ERVOoHnBxh2PWkPLUsV+W153I7SpA0o3z8NpuWAwXuv54FuJ9ndmXLvnE0RybsKzQfyX0EoJp2OKEh7y4D40616iF4D7nSm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767011886; c=relaxed/simple;
	bh=rox7wvPh07+CLjjqPOBWQGkUlh+Gyo2uugHFZB5z0+s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AALGHlyp8Hn6TYYD9nvnk96BXSGiKom2gKx8B9k6csP0KqSun1kS/Zuvofb7UmWSvo0IpZkcvmPf+fW9tpDywssIrokPECu6LPEiGdoeke8GLpio6GPMzTrohrXHRA7XrvCyLS9lZAySbEbkT3cZuogYjPgatQ//3VO+tk9EZc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lRTMVPBZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58D23C19421
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 12:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767011884;
	bh=rox7wvPh07+CLjjqPOBWQGkUlh+Gyo2uugHFZB5z0+s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lRTMVPBZDgcRwddGpzXgSGPzbz9RrE5n1iRQoOMioKMSCPyzyYX+7+3flfBtxtXDK
	 dGvZoQ9kL4D68Vkb6jdaGrDuy5Z8dwHBxk4HHH1kVtuJrk6PFXuXssUvu36mETVGuK
	 DOIApZ2r37rOrOh/JOokPGNoA52q9swj7IrOoxDsC+ExurzmULUUyP9S0e8aPpQU0h
	 ZlMRIzgi/Qfg81ZCHrR1hUOC7mFdOmcb6FMI88S+DK6tmG/YIuW9Mfl2xdDNmxkRwj
	 mg8M3Sk6rDjSjImPFQsmP4PicvLD3Jph7YoKMb3I40Ba1EFHlRgLoWH3j3cfGx5X+S
	 AXgrM9Ri+6HwA==
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-642fcb38f35so6960831d50.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 04:38:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXn13NG0PjIwvRphYQBcKjiZtgpJALlUh967RZyv4z4eqvrsNoXAAYvVQnTaEX+PCg4JjGYfgY1+qixQzUX@vger.kernel.org
X-Gm-Message-State: AOJu0YyVoHs0A+VzwKWhapyk0iWKDtjIZn7PfhGx89+g7Kq6mfRdHa2o
	qfzxuZT5NxV+6Kd6ZTuxGgLzpEfVI/ZHOTEyriFBvwel3hXWoijXVxAlBJhiafWu2Od+8qB7xWU
	CBa9AB9mYUvV7aIGndOmStptJuXKIi4I=
X-Google-Smtp-Source: AGHT+IFsGOCuav1GJIi4G3BawSBpJOo6IwnfMUXLRMGmh8VUt++5hT+HtT5U+iVEJ9F2VpETfK2+Gh1JdS0tq7MWKRo=
X-Received: by 2002:a05:690e:3cd:b0:644:4f94:c530 with SMTP id
 956f58d0204a3-6466a84b02amr17388010d50.39.1767011883475; Mon, 29 Dec 2025
 04:38:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251222-drm-panels-sony-v2-0-82a87465d163@somainline.org>
 <20251222-drm-panels-sony-v2-4-82a87465d163@somainline.org>
 <CAD++jLmSev3=HJF1j_kTU5j-u2NhxH6TsdE0uUjnD7Vqkt_h-w@mail.gmail.com>
 <aU6QxjOphoq9E1pL@SoMainline.org> <CAD++jL=HDRAcwDVUeYUKFbamqVnOADqz5qpbSr1XVsr3M1iNoQ@mail.gmail.com>
 <aVJpbJEymWWQLK6O@SoMainline.org>
In-Reply-To: <aVJpbJEymWWQLK6O@SoMainline.org>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 29 Dec 2025 13:37:51 +0100
X-Gmail-Original-Message-ID: <CAD++jLkb7my6Dt4CkqRjKZAMM6iT8YvzHZb67TRLt1jOEU0qdg@mail.gmail.com>
X-Gm-Features: AQt7F2oGDXnIlk3K166SE_nBg82Dd1snbA2UqjpF4XmEvLq6o1P2w_E42qJ58c4
Message-ID: <CAD++jLkb7my6Dt4CkqRjKZAMM6iT8YvzHZb67TRLt1jOEU0qdg@mail.gmail.com>
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

On Mon, Dec 29, 2025 at 12:53=E2=80=AFPM Marijn Suijten
<marijn.suijten@somainline.org> wrote:

> > Yes that's what I suspect.
>
> Do you still want me to drop it from the compatible, but definitely keep =
it in
> the driver filename unless we unify all of the drivers (hopefully in a la=
ter
> patch)?

The compatible should be as precise as possible, so indicate the
assembled display with display controller, typically
samsung,ams605dk01 etc, then the Linux driver is basically
a Linux intrinsic matter, but we would name that after the display
controller so as to make the basis of code sharing obvious between
the compatibles.

> > > Also, divergence of the driver commands got significant with the last=
 two panels
> > > / three phones, though that might be down to vendor configuration/cal=
ibration.
> >
> > That's kind of normal. The defaults suffice for a while, then engineers
> > want to start poking at different voltages to the display to improve
> > and tweak things.
>
> Makes one wonder if the changes are down to the panel used, or vendor tun=
ing
> when they started using these panels in their phones.  To note, I think I=
 booted
> all these phones on the "original" SOFEF01 driver without problems, befor=
e
> ultimately implementing all diverging commands because I don't know if th=
ey're
> defaults, related to color tuning, timings, thermals, manufacturer tolera=
nces or
> anything else.

Yeah a datasheet would really help :/

Samsung, if you're reading this, you know what to do: give us the
datasheets, pretty please with sugar on top.

Yours,
Linus Walleij

