Return-Path: <linux-arm-msm+bounces-55946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A88A9FAD3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 22:54:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D81D65A4D16
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 20:53:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEB101F872D;
	Mon, 28 Apr 2025 20:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YHujt9MM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063DF1F4C8E
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Apr 2025 20:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745873647; cv=none; b=eVN4ZAgqLe1lEFjoOibxXtu93KcqZHDeydCwDr5q1movg/+ynrqnqPG8dzfSHAcusjXhjyFlH4y8WiwtvZ/eDr+tRSzgF9LmG4rpF4rmgl0tvvGuL+mpUVudbgpNa0vBxoLxIQSOPuwCOjNYNLieeOx12WBEJyjqUbG8AdF6uYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745873647; c=relaxed/simple;
	bh=n4WGwCItyZewiOJcBSp4Eaj+wnGcnc5O6i3QGT0fNG8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MZ2Lf/RA6MTSmWfFbpW9cTajJFe0hlDqO+p1WpWPBJ0SZKN+BM9ml9hegospsoO/4EnCNmGG3XJhP8DsREU0YoUFuIwIU9gel9SgbsirZE4pGxmiC0grb3wpK/HmcLzjxVuSjREE6T8qc5hnFuFe0tUPw3CPV3p1N3JOeCwp4hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YHujt9MM; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-736aaeed234so4469305b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Apr 2025 13:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745873645; x=1746478445; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=duqrSY39uZvRf9QP4FI5wn82Hvp3y0G6BGsbl6wCfsU=;
        b=YHujt9MMTp8bKrMsFmXM63bMM8a+I2YXydtfpVDqQAF3DVIzLp41fZ7aZMRYjXHg1l
         DhEJEskBspuF4q7G933v3fo40LBtspLETpFYAIzL7KWa41H2k04Aq+LRX3YOefHIPU/Q
         nfKgompPqt/dqYsgIAhR4l+BSNllmue2YLiEI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745873645; x=1746478445;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=duqrSY39uZvRf9QP4FI5wn82Hvp3y0G6BGsbl6wCfsU=;
        b=o4x+E98YOiJeeAZE97RTpe/G8kaQ9onxWuGGEVEHnLTdDfOPKib+7MOLAnZp4Y7Bhm
         ksOxbmDvYNuMbnIebQ1Z2mhJanKe/Se0d0kSyb6f23DC0PdQfE6CdnrHtgnnewpWG6U4
         ZF0+3Q3sXuWibYwowY7FKYRGiFeyfo4OGAjbUG6h4bI3NlzzR+T3K8GPnMbo9x9RkAQS
         q/g7YD+zTdeqcuX+c2nrdBXyovRio7VQeFANo7I5yhqTuRCWaa40x7kmJveJ+TPbluUG
         jOsrb/xjdFGtmWdPCXz3YyIG7IhPA0hrVCCsXL4OCeC2SIRp1fR8kwGsphn3eI7kGAep
         MGKA==
X-Forwarded-Encrypted: i=1; AJvYcCUupJ0UYEKTpPQ0qp7XyFMC896wluxLPVGvXMA72zgptfDUkFFQEGqK6z8dmulCv0KurcxGIsXMXiimwmHo@vger.kernel.org
X-Gm-Message-State: AOJu0YxchsNoL/5j6WnFN/sROZQpN0TrVFlInhYDv/RHtFBhTn6RVWs2
	e1lG+nKWj5s8oNKlWOmaNEitIf+uGQM2FWIpr6TWYncXm5vMlKWKO1XF777jf3juWtfEwHwyeAE
	=
X-Gm-Gg: ASbGnctI+hvQwyfkHYOxE69v1uuibOSEPkDt6c/LHWTV6MTsi2KLQC6NzBy6oU8km/H
	ocVvkrmAAqSzfkSGJqmpX12GM2g+WLcXlwzDaiSUwzfgLu1GojL1TL2lkVCTldh0WOvhTf9olYX
	179UdbhRVrVj3CoHkico70dXoAVFiUrcqz6R2UzRTsvz53fr9Hhk6u99uiPAu+WWBY6c/MXaepm
	/XBkUL+FMxBjErF0ZVhM9tgpaqLr6TQTqImV+msykacZ4Z+LgeX52drw+C5ZcQ4swhHCi/n7UmE
	DNKlndAr5nwBXNAcRTUqy10lo6opvLq5iJNwj1jd6qeIA6IQyqy5CBzYBrVGYRII1D7wZftYlYV
	2YnHG
X-Google-Smtp-Source: AGHT+IHub0z9e0RURh/relXZ4pmizQPsonS3Epy1p0T2Tc9T+jTLABuiM2Bg8Z997Ft7vATVthYPoQ==
X-Received: by 2002:a05:6a00:240e:b0:736:450c:fa54 with SMTP id d2e1a72fcca58-74027139752mr1622626b3a.6.1745873645395;
        Mon, 28 Apr 2025 13:54:05 -0700 (PDT)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com. [209.85.216.41])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25967bfcsm8520006b3a.84.2025.04.28.13.54.05
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 13:54:05 -0700 (PDT)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2ff694d2d4dso4697626a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Apr 2025 13:54:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWbN48HoLP33V54OMDwof0UV7WnYNs3O3K1+HdOA/DI24KQu8NRMonMwW2ngIfUDTBwgVfSIxSQYKZQxJoS@vger.kernel.org
X-Received: by 2002:a17:90b:2d08:b0:2fe:b9be:216 with SMTP id
 98e67ed59e1d1-30a215a9e35mr1596359a91.31.1745873644318; Mon, 28 Apr 2025
 13:54:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <20250424-drm-bridge-convert-to-alloc-api-v2-13-8f91a404d86b@bootlin.com>
In-Reply-To: <20250424-drm-bridge-convert-to-alloc-api-v2-13-8f91a404d86b@bootlin.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 28 Apr 2025 13:53:52 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WBxgJ9HZK=UyE8R17OiM0+ME2Lp5O7zoZRVOw2z6_sng@mail.gmail.com>
X-Gm-Features: ATxdqUGX6srhk44LYXds4__tJ7VKjYOOGbCee4VbhetmdBaO7SswZM-oniFpcj8
Message-ID: <CAD=FV=WBxgJ9HZK=UyE8R17OiM0+ME2Lp5O7zoZRVOw2z6_sng@mail.gmail.com>
Subject: Re: [PATCH v2 13/34] drm/bridge: ti-sn65dsi86: convert to
 devm_drm_bridge_alloc() API
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Anusha Srivatsa <asrivats@redhat.com>, 
	Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>, Hui Pu <Hui.Pu@gehealthcare.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org, 
	asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	chrome-platform@lists.linux.dev, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	Herve Codina <herve.codina@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Apr 24, 2025 at 12:00=E2=80=AFPM Luca Ceresoli
<luca.ceresoli@bootlin.com> wrote:
>
> This is the new API for allocating DRM bridges.
>
> Reviewed-by: Herve Codina <herve.codina@bootlin.com>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I can confirm that I can still build/boot on a board with ti-sn65dsi86
after this patch. Thus, happy with:

Tested-by: Douglas Anderson <dianders@chromium.org>

Happy to have someone else land this through drm-misc-next or I can
land it there myself.

