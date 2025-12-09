Return-Path: <linux-arm-msm+bounces-84779-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B1927CB03C2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Dec 2025 15:18:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BC91B303CF5E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Dec 2025 14:17:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B68D5299929;
	Tue,  9 Dec 2025 14:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EJcDhqP6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2296A29ACFC
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Dec 2025 14:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765289858; cv=none; b=gCxXZP20Wtfxp9DTqH2EQNKpZAX6TzZRIf10umqwsS2EOiXkQ+5hSxK6jZzi2U+RaGJuOsuvIFb0bGzE+tm0nLfTtyvNDX8kFGeK8MXinla6sV2XF5LnGdNvtBLYNirRREOETNSsqZYatZDdwKO8dyjXNKK0Ot3ZzrSeOsuPkcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765289858; c=relaxed/simple;
	bh=unuZ6P3b7Yxjaa+0itPHl4nXBL7mIF6rtwXPOxCWtX4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XFfgSJFv4UxVbQzyKzy25xBH9J4+eWRRVg5fwoAkCYKUEsaXElP3vkPcBMV471KgWaMKvbflGILOiODuOO0SgPZdDWxsap0zMgqDKFOVa7FeNLxDD6AYLAhZOYRfR5CjxMu6RwgmqtGCzrvwq3+bDPT464zGTC7HJH1Rd6TlQtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EJcDhqP6; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2a484a0b7cfso7230277eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 06:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765289856; x=1765894656; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GqGl05z99jHp2ShgOvgQgByFBkkP2VElXGK/JMHVdj4=;
        b=EJcDhqP6gkSRYJwsSv2k0z0JKn9iv5hcbelmELr2P3lxWCRnlk0lbADGeEpal6NB4p
         wYuuoo9+s5zqMnCoWq40Dd4sWemsqp+oOEPWUbqAl3J/GbjdVKnH/2NbJbU7hong+gjQ
         sawD3lVJ6BJcqYA9eu75o9Gnka3/Z5vxcEXy8NS4ZouORDBysJdlvLwaNm208Z74YZBe
         +Tyl8ln2f+b5tVxwpZFY2dly7V0+LHt4ezeVsRejV5mAkwpMOJRd2rH97TzHkb/iBjcc
         amJ7UUeOBoZvlsLphZZunoALUwUDvoFN8NbYLerIHWjUqFLqCkBtu2i6Ww45VwuZtD5E
         h/2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765289856; x=1765894656;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GqGl05z99jHp2ShgOvgQgByFBkkP2VElXGK/JMHVdj4=;
        b=JGFfUFxcMnsDp0FjgRcr8IfHyIgP40uTaDc1HXxb4uijWjapX6Grj6aZcmTnxT0AOC
         7riumLy6fB1CD3LhQ2NcaCpvE2qbuqx9Pf21OnweCX3F0XPHR90iGj+XfbvpbkEL8BFo
         L2f87Sjgpn1r8HNl/icWNT5V4hMIgVwvktzcdyiczJZXBiMjfpvS7jGOfxpiMCf28iAm
         1zmJxpGoikTqDlnGrff7sKZlM7W+PTST9KcMKj3vE8BjxMp+ngEJ91Ze86gWs1Tsp95H
         UDi4zye2rvyn8b+qLlAKOyyJGIiAqPac8mM2lRVLbzt4il5EIsL+jaiiPKU4QvB4b9/3
         DqoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHQJSn++S3PozbCT/L2EnGZ+fDWblhZx6bOI1Ral8dLxv9Mo2+V8/kIMRUp9psXSXLFM9i5ndQOS+3HR7n@vger.kernel.org
X-Gm-Message-State: AOJu0YyICU81DKM4QlZJ60VigyIGlxc8liCig1LpganQtR3kACzZNV5j
	BZJ9zWHuESqxeIEQNTui2KCMsooo+XG/NuVqb0odUinQ/yRvoPMJARTkMG+vKVX4cvbb/pkFg/j
	aYG//gNovA8XdxT4yfz+RDA2acNPXMWQ=
X-Gm-Gg: AY/fxX5pm7AOLF+36SOYu2W/XnC8pPcppRnIFOPP+D2LXtmJPgvpYIau3VkeR7/Gct/
	i5G63tFqdr0ac6Bk4WN6FDMamBMx/7isFRriMsrcZfVB8bcq/rE3s0nMtdKUQzWkQkat4YdHwBL
	wAGeURU9E80vITrB6ifmIjPauCMap+6/cX/zcLX+fRB4UL/5SLbySKrCHOhT/VtSl+mZNvcz/Ut
	Zl/qUL/1GOVt927w9y4ezMUuCGM2ZnYf0T4NLyAGY1Mwmi+UVPUpwCNWi4BYgWLPh6yd19gMgTI
	4y05V+sUfu56lH0ljMZtgASrq3pboh05Zbx1xsK+8HM5Dmp7/y8j6jhCQhTyJ0iCBZyWxMl38VC
	ne5tjfqzw6w==
X-Google-Smtp-Source: AGHT+IHJSK7Qp1zb5om02W592OqiY5udTEsk9nBSftpZyGmqI0e9P/OjwE7rDiAyfrBX382yq5jBhBWzuWKkJmGaXh4=
X-Received: by 2002:a05:7301:f25:b0:2a4:50c2:a74c with SMTP id
 5a478bee46e88-2abf8dee655mr691583eec.8.1765289856143; Tue, 09 Dec 2025
 06:17:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251124182751.507624-1-robh@kernel.org> <CGME20251127142839eucas1p186846c6c1ea1d9e43369fbba9bb5d17c@eucas1p1.samsung.com>
 <20251124182751.507624-2-robh@kernel.org> <674efe8d-c299-4ce9-bf6b-c1920a5393eb@samsung.com>
 <CAL_JsqJTrGAJx-fv8OQGDhsLVKavQzzQotssEq_E5f_aJe8bOg@mail.gmail.com>
In-Reply-To: <CAL_JsqJTrGAJx-fv8OQGDhsLVKavQzzQotssEq_E5f_aJe8bOg@mail.gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 9 Dec 2025 16:20:03 +0200
X-Gm-Features: AQt7F2rjwQKc_bRBeYsxUFhD_YJR9U-Y3qN6s4VMgPax1Na8ykfHoapTIdM-w18
Message-ID: <CAEnQRZDBZ52FoNRBJa1qScbkcEYKwbyP_ephutdkYFaY5b1yLw@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] remoteproc: qcom: Use of_reserved_mem_region_*
 functions for "memory-region"
To: Rob Herring <robh@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Peng Fan <peng.fan@nxp.com>, 
	Beleswar Padhi <b-padhi@ti.com>, linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Other platforms (non-QCom) were tested also use
> devm_ioremap_resource_wc(). So something else is claiming the same
> region? Can you dump out /proc/iomem?
>
> The region is dynamically allocated, so maybe that has something to do with it.

We noticed a related issue with imx_dsp_rproc.

Because:
imx_dsp_rproc_prepare:
 -> imx_dsp_rproc_add_carveout
     -> /*... */ and this calls devm_ioremap_resource_wc
-> pm_runtime_get_sync

imx_dsp_rproc_unprepare:
 ->pm_runtime_put_sync

There is no easy way to manually undo devm_ioremap_resource_wc so I have
sent a patch to use devm_ioremap_wc.

https://lore.kernel.org/imx/20251209140425.766742-1-daniel.baluta@nxp.com/T/#u

In your case Marek at least you need to understand which driver
reserves    8dc00000-8e7fffff : reserved and why.

thanks,
Daniel.

