Return-Path: <linux-arm-msm+bounces-3047-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD96801EC2
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Dec 2023 22:41:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ABBDF1C206FD
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Dec 2023 21:41:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2479219F4;
	Sat,  2 Dec 2023 21:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vETsaeuM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3285E5
	for <linux-arm-msm@vger.kernel.org>; Sat,  2 Dec 2023 13:41:18 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-50be3611794so1229714e87.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Dec 2023 13:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701553277; x=1702158077; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QWlbs0KWaBVaE8N6qVsZVkB13N3rqr1ujf1GT2aj7Uc=;
        b=vETsaeuMD4B1CzCswjXZvGbaX/f6xyORqYLh9ajeNs7zlN+AH0M97nelXCUmyk9p7/
         I01qFyYjwNp4hTUy6gtCpoB7WX5cgQgufgFEeVjX2upimyHeCYPekTugnqLjF8tVofyN
         Ih952FWbW8tAhJeaaTkHvVxowjUsAve/gCEUy1DuZ5cE72/oB3DT4w/88jD/g/jZlB4h
         JUwVTlG3jaQwLZmaEqykOe9dmlBnYlVS0yIr99lwm+LE7+30uDoe5ADaQR2keUAFQ5Yl
         Mk4VQsfKqnszsq//oDTmLccbv+DfkpEvCLs8Da6PLhbgFSkkYqiePeaupHV4nuJxdkH3
         d1MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701553277; x=1702158077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QWlbs0KWaBVaE8N6qVsZVkB13N3rqr1ujf1GT2aj7Uc=;
        b=rloSdYryZW3ZRA6iB5kD6QSkh/bbTJfmENDzZDZS5eDL+FuKsWc02pUwCIMzRyek0b
         jIbqF6xm/1LpvYLSUgu6CIa4zrRGt9hBVJe/mX3ha/UrtuylGIAs4guM8rqwCf4HV7Wh
         7s58qB+HbeG2jb6lWK9XowWASC5cZ6fs8BBdI5nRm40McQnpk3BqFyI8Ld9EhNIrT5cB
         V51Zdz2ztdBFLkFaWegkqfKQDc4yjbMei8fRw8l9VAQ5PaMnp3XUptcpW1mariQrMfEw
         5hugjKYKt1LE8z8/kG1XqQnD+jCbZhZ2k/bXJPjgIBloKZrlA7BwNZ7jXwYAza4zfZ94
         tWwg==
X-Gm-Message-State: AOJu0YxBuCWxU0JbnAH5v4TcGVE9oipTN0n/b2pFY+55MkoLRA5uQHv2
	ypYgQfwVmUAckOKNAxwNI/WDHQ==
X-Google-Smtp-Source: AGHT+IE4fJCooRxy/WvcclobOdpHuXuNKEXkbUoo4PErcRVQclKZm/XLN5PrK52OLiSuV17YyY06tA==
X-Received: by 2002:a05:6512:2151:b0:50b:f2c5:56b2 with SMTP id s17-20020a056512215100b0050bf2c556b2mr7119lfr.47.1701553277170;
        Sat, 02 Dec 2023 13:41:17 -0800 (PST)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id k39-20020a0565123da700b0050bf06eb35esm78810lfv.86.2023.12.02.13.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Dec 2023 13:41:16 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: quic_abhinavk@quicinc.com,
	ppaalanen@gmail.com,
	contact@emersion.fr,
	laurent.pinchart@ideasonboard.com,
	sebastian.wick@redhat.com,
	ville.syrjala@linux.intel.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	wayland-devel@lists.freedesktop.org,
	Pekka Paalanen <pekka.paalanen@collabora.com>,
	Harry Wentland <harry.wentland@amd.com>,
	Sebastian Wick <sebastian@sebastianwick.net>
Subject: Re: (subset) [PATCH RFC v7 00/10] Support for Solid Fill Planes
Date: Sat,  2 Dec 2023 23:41:13 +0200
Message-ID: <170155324921.2215646.4829699354481827834.b4-ty@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231027-solid-fill-v7-0-780188bfa7b2@quicinc.com>
References: <20231027-solid-fill-v7-0-780188bfa7b2@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 27 Oct 2023 15:32:50 -0700, Jessica Zhang wrote:
> Some drivers support hardware that have optimizations for solid fill
> planes. This series aims to expose these capabilities to userspace as
> some compositors have a solid fill flag (ex. SOLID_COLOR in the Android
> hardware composer HAL) that can be set by apps like the Android Gears
> test app.
> 
> In order to expose this capability to userspace, this series will:
> 
> [...]

Applied to drm-misc-next, thanks!

[01/10] drm: Introduce pixel_source DRM plane property
        commit: e50e5fed41c7eed2db4119645bf3480ec43fec11
[02/10] drm: Introduce solid fill DRM plane property
        commit: 85863a4e16e77079ee14865905ddc3ef9483a640
[03/10] drm: Add solid fill pixel source
        commit: 4b64167042927531f4cfaf035b8f88c2f7a05f06
[04/10] drm/atomic: Add pixel source to plane state dump
        commit: 8283ac7871a959848e09fc6593b8c12b8febfee6
[05/10] drm/atomic: Add solid fill data to plane state dump
        commit: e86413f5442ee094e66b3e75f2d3419ed0df9520
[06/10] drm/atomic: Move framebuffer checks to helper
        commit: 4ba6b7a646321e740c7f2d80c90505019c4e8fce
[07/10] drm/atomic: Loosen FB atomic checks
        commit: f1e75da5364e780905d9cd6043f9c74cdcf84073

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

