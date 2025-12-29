Return-Path: <linux-arm-msm+bounces-86822-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 754E4CE6954
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 12:45:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3C0FA30141EA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 11:43:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57E3B2066DE;
	Mon, 29 Dec 2025 11:43:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [5.144.164.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB64301460;
	Mon, 29 Dec 2025 11:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.144.164.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767008615; cv=none; b=oOYuI67VxnzrpO/RcCd7R1EK6Zugkyfy2qQInzx+7QuuQQhuUFarZymx2nzCqSX0e068TdVXKfSXjy9OteReFf97HOswWY6UmpbQn8pqdmu8hMA3gcinTfFzBEYjydBMm5whR6TVumP4SBXmn1s/gQof0oa/sX5ijCyLkqlWP6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767008615; c=relaxed/simple;
	bh=jmzMjrpmB3DMcKfSHbtLtRaBrJmhzjkzJi1bfjji/Kc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b611HbFSjWLo8fGLqpkHYv5IfuRaPlPPjYWc+ONRAnQB6rPpwLu2zb/UKTqXu+I+BlDHipR1RB5sljvaTpa1k/TBZvSqG/mAN0UkIwZRzOe/sgBXep3mNATRCeMwieZIn5UaxF3haewg1BK7zh4l5Eo6fc0V8aP5fov2LP62lno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org; spf=pass smtp.mailfrom=somainline.org; arc=none smtp.client-ip=5.144.164.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=somainline.org
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r2.th.seeweb.it (Postfix) with ESMTPSA id A22523F439;
	Mon, 29 Dec 2025 12:43:27 +0100 (CET)
Date: Mon, 29 Dec 2025 12:43:26 +0100
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
Subject: Re: [PATCH v2 05/11] drm/panel: Add panel driver for Samsung SOFEF01
 DDIC
Message-ID: <aVJou4aNqfGATv3g@SoMainline.org>
References: <20251222-drm-panels-sony-v2-0-82a87465d163@somainline.org>
 <20251222-drm-panels-sony-v2-5-82a87465d163@somainline.org>
 <CAD++jL=X1hX6kmodcOC3+x-w6t+Vg6XTaCMab-Dn=vHAeD82Gw@mail.gmail.com>
 <aU6XXi2HmgjZY8CY@SoMainline.org>
 <CAD++jLn0cFtDhg9WFU2LS6g+cLa7ZMzzcHAJ_W9REVHodFYpAw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLn0cFtDhg9WFU2LS6g+cLa7ZMzzcHAJ_W9REVHodFYpAw@mail.gmail.com>

On 2025-12-26 18:43:03, Linus Walleij wrote:
> On Fri, Dec 26, 2025 at 3:16 PM Marijn Suijten
> <marijn.suijten@somainline.org> wrote:
> > On 2025-12-26 14:21:37, Linus Walleij wrote:
> 
> > > The sofef00 driver tell us exactly what this sequence is:
> > >
> > > #define sofef00_test_key_on_lvl2(ctx) \
> > >         mipi_dsi_dcs_write_seq_multi(ctx, 0xf0, 0x5a, 0x5a)
> > > #define sofef00_test_key_off_lvl2(ctx) \
> > >         mipi_dsi_dcs_write_seq_multi(ctx, 0xf0, 0xa5, 0xa5)
> > >
> > > I would just rename these two to sofef01_test_key_on/off_lvl2()
> > > and use the same helpers in this driver to follow the sofef00 pattern.
> >
> > Right, yes.  I think I already brought this up in V1, that some existing
> > Samsung drivers call this (the 0xf0 part) the MCS PASSWORD, others call it the
> > LEVEL_2_KEY or USER_KEY or ACCESSPROT.
> 
> Actually all of the samsung s6e panels are suspected to be s0fef0/1

Just noting the first 0 is actually the letter o.

> display controller variants, which you see if you look inside
> panel-samsung-s6e*, for example panel-samsung-s6e3fc2x01.c has this:

...

> I think the s0fef0/1 drivers and all the panel-samsung-s6e* drivers
> should probably be unified a bit maybe we can just create a
> local s0fef.h file with the above for all these drivers to use?
> 
> (If someone has actual datasheets for s0fef0/1 that would be great.)

If we know exactly what the commands are, and have their arguments documented,
it'd be nice to have these as constants and functions in a global reusable
header, but it does require being absolutely certain on their meaning and
equivalence.

- Marijn

