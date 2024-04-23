Return-Path: <linux-arm-msm+bounces-18289-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5C78AE5ED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Apr 2024 14:23:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 83BB0B23611
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Apr 2024 12:23:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ADE283CD6;
	Tue, 23 Apr 2024 12:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qtQDLjrx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8558A85C48
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Apr 2024 12:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713874999; cv=none; b=O4lpaqT+/g4lNzrlenZx/s1nhNU9mQGh0k/z1MJHRAAjqvFmgpltikOHOQcJSrhLDJ73/RyY9/+xrd9+D+D89PB7sy+gVx9PUnTWRn3V9sO1VEcrnoOaV0nZu8ZzbPbffL2IK0fjrHxIBYfvIuo2rtYlReV5D4GUm26WbY/YCKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713874999; c=relaxed/simple;
	bh=zdEuS8XRlyMWs8i+nahfC/xh1vWX2u7uUNV94NmtyxI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jPC9zMuybP6cqQs7S1Mawj4oiAGy0jJNRbFk1jNek3iTJgtMz2nuCR63VqpumSkffm8HVo3ae6xXxXcn3YOePMJHusDvSQIC3EPQeH6jFdwUanDr8eONcN9S8ThKm8d7VFnO2gq6eldERXMwb+vWVqBqrOlWr4hf8nNANeSQA4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qtQDLjrx; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-de54c2a4145so892010276.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Apr 2024 05:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713874997; x=1714479797; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zdEuS8XRlyMWs8i+nahfC/xh1vWX2u7uUNV94NmtyxI=;
        b=qtQDLjrxOz4wZvnJ9bfDXVOwl9pgcBQaULNGILtSLiwxeDyEfhAr8hY1GpjLS2dTRk
         hQ1iEhbECkmemy1TAXFuMPOUOPGWJ4rJo2px55vkJ71AvfR6b49QPvbxKf8zrSmSbhDL
         bQ6ESm52uGwAZteQRyEsWi+LVmP+rj6eeITbPGoDbG9wthTw8JwH56ionOcthpbCsPt2
         4qkwk+V30rP778AX8Fo+6zV0EUS7gnYsMXei7jeXT20ob3nxPjhcJLsMDKuLfT5Ccqlj
         q+xCVo5CRZqIuVae8f4MvSq4uyC3n5xov/0Pw4C7KkELMp4EY9osQ15Hc88NeVYZ1Tq7
         vsMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713874997; x=1714479797;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zdEuS8XRlyMWs8i+nahfC/xh1vWX2u7uUNV94NmtyxI=;
        b=Al0YTgc48rm0ZC7bABr1U6KGz+C+UYgpZkLlVelclc9vCSvaxYNw7RHyAuoH91zwG+
         StHG95P1pXywirOgrouJ4fK/GZfwDK00uPNzI5+zpGw5ZrZ+wUvgSmSz+M0EhM4bH2vh
         2pNAacthSdDa/vkx8h62xEvwbMRxp6a4WNsjdfOzecoIoKOmKX/ypgZa3MP2EZEwtS00
         hfhUocr6DrtdUHMlLxjg58a+/acXt6Wv9yieT5A7EnJAOBJnHyi8xWVWmzaXjkNovNnb
         Vh/DbhLlUhz8wSwaiWKVGMIyvczgVHhaf0p8vOBikoBZcFyISGNJrl4poTuDpgVDDPuK
         gFuA==
X-Forwarded-Encrypted: i=1; AJvYcCV2PRRGRpIOw/HCJruFA0/XiJlQGidJzBmmm4uLYM/CLws3deJi8362715lALIf1Mz6DDFt8v8VNqo3kvgDxPEl6BZs3fL80/eLpudbyg==
X-Gm-Message-State: AOJu0Yx+Bm1bmSbFKx00y6ug50O/i1uw29scUOAgjx1M6melRbTTTkMx
	uXVEy+nuoknhzRTjBhopjKknL/yeDrdrcXIJsxStmPqVZZZQShG09IjqZJoirclwGDOi+aRsLxJ
	sjMI5EdJTMwnWYZTv2GhBG2HeY+qgO/siNwRRaw==
X-Google-Smtp-Source: AGHT+IFGEmHXL5CwAkBYa70XCoYWKwe8UnjgAcbc2h7iJmpsycDinZVPrwrOVKWCKX5O935DZ/QH6hClp73iSys2pzI=
X-Received: by 2002:a25:8251:0:b0:dc7:4067:9f85 with SMTP id
 d17-20020a258251000000b00dc740679f85mr12766959ybn.58.1713874997608; Tue, 23
 Apr 2024 05:23:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240423040243.448091-1-vignesh.raman@collabora.com>
 <20240423040243.448091-4-vignesh.raman@collabora.com> <e3a0ea8f-d306-488c-a69c-aa18078e5e03@igalia.com>
In-Reply-To: <e3a0ea8f-d306-488c-a69c-aa18078e5e03@igalia.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 23 Apr 2024 15:23:06 +0300
Message-ID: <CAA8EJppaaitcXkXSFTB4-S2CbBcrAVHouB0wWiU5Nw2FvpagqA@mail.gmail.com>
Subject: Re: [PATCH v1 3/4] drm/ci: uprev IGT and generate testlist from build
To: =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>
Cc: Vignesh Raman <vignesh.raman@collabora.com>, dri-devel@lists.freedesktop.org, 
	daniels@collabora.com, helen.koike@collabora.com, airlied@gmail.com, 
	daniel@ffwll.ch, robdclark@gmail.com, david.heidelberg@collabora.com, 
	guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com, 
	linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, amd-gfx@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
	virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 23 Apr 2024 at 13:24, Ma=C3=ADra Canal <mcanal@igalia.com> wrote:
>
> On 4/23/24 01:02, Vignesh Raman wrote:
> > Uprev IGT to the latest version and stop vendoring the
> > testlist into the kernel. Instead, use the testlist from
> > the IGT build to ensure we do not miss renamed or newly
> > added tests.
>
> Nitpick: wouldn't it be better to (1) stop vendoring the
> testlist into the kernel in one patch and then (2) uprev
> IGT to the latest version? I feel that this patch is changing
> a lot of different stuff.

Definitely. Otherwise it's hard to understand whether a change to
fails/flakes is caused by the uprev or by the testlist change. E.g. in
several cases the list of failing subtests seems to be replaced with
the test itself.

>
> Best Regards,
> - Ma=C3=ADra
>
> >
> > Skip kms tests for panfrost driver since it is not a kms
> > driver and skip driver-specific tests. Update xfails with
> > the latest testlist.
> >
> > Increase the timoout of i915 jobs to 2h30m since some jobs
> > takes more than 2 hours to complete.
> >
> > Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> > ---


--=20
With best wishes
Dmitry

