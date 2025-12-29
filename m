Return-Path: <linux-arm-msm+bounces-86827-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 58791CE69C3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 12:53:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C06FB30123CD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 11:53:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 323BF27B348;
	Mon, 29 Dec 2025 11:53:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [5.144.164.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09EB82D641F
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 11:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.144.164.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767009185; cv=none; b=hOqQ3+FFTIQvK+0AHVhw4B6cMmGIOoflDowZHHEw6LWItDBVI/vaOpHsUQVaG7QmXQEs1/HdZr3YRgORcZCsRm9v1aPs3QEYBUc1/0yC4OflUZ/Fqj7oencxpQjAi+aLerY/jKm039xtvHzZbKdP0ysxvkT5d2prfbrm5QeVS7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767009185; c=relaxed/simple;
	bh=uboTYwJ421NXpiSVGfrHsrE26DsNNAgP/uiRqAChfXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D81qoN/6/HcGT+JOWvYcnk3OSG36ikNiV0uacv/QfOGwfgmmmwjnSeACMMHE+573Bvo1RptRUE8S0WWxmNPfxwBg+gg+Xp1HJfTdFXumUpkon4+IXOD2POBwrhyscTYdx2aPThn0TuLaA9dlsu0+VgjCx/BCIG3hInPAocsfQ6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org; spf=pass smtp.mailfrom=somainline.org; arc=none smtp.client-ip=5.144.164.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=somainline.org
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 3DD973F65A;
	Mon, 29 Dec 2025 12:52:57 +0100 (CET)
Date: Mon, 29 Dec 2025 12:52:55 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, 
	Casey Connolly <casey.connolly@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Simona Vetter <simona.vetter@ffwll.ch>, 
	~postmarketos/upstreaming@lists.sr.ht, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, Martin Botka <martin.botka@somainline.org>, 
	Jami Kettunen <jami.kettunen@somainline.org>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v2 04/11] dt-bindings: display: panel: Describe Samsung
 SOFEF01-M DDIC
Message-ID: <aVJpbJEymWWQLK6O@SoMainline.org>
References: <20251222-drm-panels-sony-v2-0-82a87465d163@somainline.org>
 <20251222-drm-panels-sony-v2-4-82a87465d163@somainline.org>
 <CAD++jLmSev3=HJF1j_kTU5j-u2NhxH6TsdE0uUjnD7Vqkt_h-w@mail.gmail.com>
 <aU6QxjOphoq9E1pL@SoMainline.org>
 <CAD++jL=HDRAcwDVUeYUKFbamqVnOADqz5qpbSr1XVsr3M1iNoQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jL=HDRAcwDVUeYUKFbamqVnOADqz5qpbSr1XVsr3M1iNoQ@mail.gmail.com>

On 2025-12-26 18:38:56, Linus Walleij wrote:
> On Fri, Dec 26, 2025 at 2:48 PM Marijn Suijten
> <marijn.suijten@somainline.org> wrote:
> > On 2025-12-26 14:25:04, Linus Walleij wrote:
> 
> > > They are clearly using the S0FEF01-M display controller.
> >
> > So you're implying or certain that these panel names here are always bundled
> > with exactly the same controller (making the SOFEF01 part "redundant" in the
> > compatible)?
> 
> Yes that's what I suspect.

Do you still want me to drop it from the compatible, but definitely keep it in
the driver filename unless we unify all of the drivers (hopefully in a later
patch)?

> > Also, divergence of the driver commands got significant with the last two panels
> > / three phones, though that might be down to vendor configuration/calibration.
> 
> That's kind of normal. The defaults suffice for a while, then engineers
> want to start poking at different voltages to the display to improve
> and tweak things.

Makes one wonder if the changes are down to the panel used, or vendor tuning
when they started using these panels in their phones.  To note, I think I booted
all these phones on the "original" SOFEF01 driver without problems, before
ultimately implementing all diverging commands because I don't know if they're
defaults, related to color tuning, timings, thermals, manufacturer tolerances or
anything else.

- Marijn

