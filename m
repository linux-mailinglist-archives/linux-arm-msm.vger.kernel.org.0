Return-Path: <linux-arm-msm+bounces-64630-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FCFB0230A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 19:45:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 02AEF5C56A2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 17:45:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35ED32F273A;
	Fri, 11 Jul 2025 17:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hVF4bZbE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FBC62F19A9
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 17:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752255893; cv=none; b=rkRtvGULP6b93JbfXm4zjaQXKC/J1v1wlmSCYsVIaAek8J8Z6wKg4ipV8gmOnpsUTxCGwjs8qVD8DLFjwFO4TpC4mJZDzWABrSIXL7vk/CyfZ7OQEP/r/A5//+ZvoaxIrfoEUcQv1CxssDbytpTkeJHr5IBuqn+jG7J0RQ7i4eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752255893; c=relaxed/simple;
	bh=u+ZM5SO8L4rZ2xYIS3dtWrMrDyHsyXlquIkrSDaXE+w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m/Nhx8Ze4qjp9vtgZ0xGAQ1UYszeQorhE2L9+MaWjIKevsY6vDJ0wETsufh6+j7gx+DdtsjVGcZH9X6s25OtRxq70Hix7v/BDD9dWv3nsEoK6RC3c7Leq/ocZ0GuOFooLshyfEJtA4pSmjErmBpZT8Ah8zCoe5JkCWF3iKDrGr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hVF4bZbE; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-32b7113ed6bso20235511fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 10:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752255889; x=1752860689; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u+ZM5SO8L4rZ2xYIS3dtWrMrDyHsyXlquIkrSDaXE+w=;
        b=hVF4bZbEuP4pvsIBFxaWeWBlnqNCB7BB/8a/uCD1T/DUCO2u8PBQaL5NwIZc8VVKqi
         syC4aExadO+FYZh9gUFcvIdzcjJUTQuPBU/8HO/urMdoSB7zWNXrjOCiOeFXG4D/wHHd
         jZGYvL8sLieeQ07O9T+cbLWv/U46cyOTu+nTw/8wZ554+qxc9wE2tamuPmXoJboHT1B3
         v6rxJwF1LS4Nt8F7/jCbbg5AP0BbYriPjz7wFXdPRUnILInVlChIa5JXrCX7wLJnntah
         H+RrgZ1rwnKLeBvMoSqYBoN9vxP5LJc/gSaVvAAxBkvBEY/tL519nSt/Swt65OrL/0qJ
         APsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752255889; x=1752860689;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u+ZM5SO8L4rZ2xYIS3dtWrMrDyHsyXlquIkrSDaXE+w=;
        b=Xv0MYZH7S6zZXqpPbQNwBWY17H1Am8my1IbeI/laH1VbOh+wb7WMPXS2QShKhynClt
         wymkXx3Emm3PycQWCmOlm40+BJ3mEJgMHDg9iQYr+dfdYT8sReJ7BWnQCOK83g9/8yWp
         YaiyBwnYqg6MN+5+mqi9pjAZ6AmmIEoqWj2Sqq4dvOg11QSuj2FfzQLBL6GjHm+pWofT
         123SQadqkuZDSzFYW8YqOFUTe0hrZd+Wjx3to0swDScas092lm34cHRMdG5RE2F7i9tP
         MKE9ScJUyaPUZpP3aInSL5CZCCs/BZPvRIwxwYTax2LNxBnsCLlUTmr+sFng5fjEJu5w
         +M3w==
X-Forwarded-Encrypted: i=1; AJvYcCVj/BDaNHHo0g+b3Bz5y0qWtd9eWtZEgP3/O2tTZEbDKgBHVSyxl1JReGB+sFHQyw3tEXjb30ogpqhIYHKd@vger.kernel.org
X-Gm-Message-State: AOJu0YzA47Cs8Qiu741QdgpEY9Fc3x2KM/bw0YxRLXapROKtMqoIibqE
	QeiBQHNlfXQ4d4VTMeWj+qkn81QQhisnaXMAzb5xXoAwo1RdAf+tbjvNh/7DdlvleQhIH6YJTyA
	MrbrWPz/ALYNVMfPl9LateEpfMQevKbfhCGtr05FaJQ==
X-Gm-Gg: ASbGncsMY1sk6R/lsZLtRggJZWct6T0+kiSEAfiRVsXdGMj69rE+zJJG1PSEh3K6NeC
	/VMURyYLEUufD3XMGNhcAhB2R5H5lmXJupGE9DAJjcFBd/KNtR5A8hBPHIy/eEVKtttADrOGm9z
	d4HWs2RqFPLs7EPrEb1n0X/RP44+o57YjNaV931/t0LFStIsEx5LCgv27jwl2g6ZKrVh+Z8BsT8
	WiTYeQ=
X-Google-Smtp-Source: AGHT+IH6ZOzBfHIgYUwgOc3NHyt2gji+Em8NzLEp8xFU4pLvltizLDn2SrTtw5BwtYgzrpRFDHd1anYmDStmm3/BYxA=
X-Received: by 2002:a2e:ae05:0:b0:32b:75f0:cfa4 with SMTP id
 38308e7fff4ca-3305343ffbdmr14799021fa.25.1752255889239; Fri, 11 Jul 2025
 10:44:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250710-drm-clk-round-rate-v1-0-601b9ea384c3@redhat.com> <20250710-drm-clk-round-rate-v1-5-601b9ea384c3@redhat.com>
In-Reply-To: <20250710-drm-clk-round-rate-v1-5-601b9ea384c3@redhat.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Jul 2025 19:44:38 +0200
X-Gm-Features: Ac12FXxUNTUQvVOGg3MoOkpShRe7WywXW6kbpP4WvN3P-CcJwwv5gR7MoObTWCg
Message-ID: <CACRpkda3R+2hhzvd+snkTGrRb-gZ8OUvzAhFE5Cg6yXfZ+E4nQ@mail.gmail.com>
Subject: Re: [PATCH 5/9] drm/pl111: convert from round_rate() to determine_rate()
To: Brian Masney <bmasney@redhat.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Yannick Fertre <yannick.fertre@foss.st.com>, 
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
	Philippe Cornu <philippe.cornu@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Stephen Boyd <sboyd@kernel.org>, dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 10, 2025 at 7:43=E2=80=AFPM Brian Masney <bmasney@redhat.com> w=
rote:

> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

