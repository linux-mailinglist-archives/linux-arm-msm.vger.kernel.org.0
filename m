Return-Path: <linux-arm-msm+bounces-16581-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0EB89A3F8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Apr 2024 20:16:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0BEC71C22117
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Apr 2024 18:16:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2167A172778;
	Fri,  5 Apr 2024 18:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gauXiOrD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6442C171E7E
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Apr 2024 18:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712340995; cv=none; b=qHQxQrn4SnbUtyGN9YQXVxUYLV7IQAcrVBVhGIZ5I95qXHOe/+dh5Biq/I14aQ5S/obKoSFAQXdCWK1e2eviytYJfNtcOHX66vCxaZfdQHZcNWsYCahaeVaxUY9MHbzHlQK0DzSu8ps9szh6wO2RTJm6esudDKOpSk/TSfNj5As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712340995; c=relaxed/simple;
	bh=SaGd5AnV0efY/VWAcQ27lIZdQgLwdWAS1q54b6khlsk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D5wSAOfi3DJ/2KnYDXBGHN4U57S6SW/Nd82hng6iqOjmw4GMPtWMJElMA/FakerC32bXNprjY+0qOY6KUNVuXgqUAh9kQrVCBpMANUH30Ecf0ihR047JEfyDrxbyi9M5Q+vMNxXR+hEysrzdRdG8bCgHAygNr/fXxhZv0VAbMKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gauXiOrD; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dc6d8bd612dso2707800276.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Apr 2024 11:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712340992; x=1712945792; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8b1sNjLbSX+4p2YVJs2q/ZYirydHfodZOqbVbZl7vM8=;
        b=gauXiOrDu5jZYmOhqcA4k0IBSR5Tt2dp1kv1Fd2u3ZRPi4aWRku1znZc2ejVEDbYzg
         7TnNh7G8AqflQ8atkmTg1yN3ZJInOZBbC5k+Pjy3gz2o9n17UpEyJ0meQShWOTFGMzcM
         8N7+wIb8XLxVfRKy0IWUYtwFdo/9CdvbRLpVcwYl0kq7vxubg+a4QJSIG7Oo/41smUCr
         O5kAvfaQEtiPL4oT8kpYoJXHdie/FsLENI0slMovxyrSY7d37LAMJy1eRUK183BF3lJD
         yLvplNr8Gm2HrqJB6VtF1GDNivhXZAHYAbRmhXo/MrYDL8auC83y18VyDp+Ufr8uNyWy
         4BKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712340992; x=1712945792;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8b1sNjLbSX+4p2YVJs2q/ZYirydHfodZOqbVbZl7vM8=;
        b=Mm3/ZVMxIlx9gss+VaboSDYTZfyfiUBd9+l9HGuMkYNiLwUAr8Qmet0PjnE1RO/KhU
         tdCXpGrOrxY4HLzp+V4IgBDWEeFTuppPQI3JHim2bZ2cEizh/pp3Im/U+Hiv+HaqMnqI
         bUxCol7H6v9X9IGg2pomX34IOH77vZSZoUhqjqFcqRU/1k7tFjosMo4mXymaf829NJmM
         hpYz2vFRiFwhowVoYx2hlapeBpblF0NP5pnEhoub4SwJAujieIR6e2DM8o/L/F6sUzVj
         nFRvwZOpg79ioSs5To0/za1vDFDyBhq0bs2Jv2B9dz1faDKfKXwcwmtbReWpB+vBLBAd
         FeLQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5pMULiE1q5hYZYBf2WFzeWVVx85bFyWr1VYe2GZ55JvASuXHoOH+2C2/BGr66n2dOLsL+99R7n/EoOA6gGshu28hSck7NYVV9AvnLiw==
X-Gm-Message-State: AOJu0Yxyn1z2SRxSxjeSeUkSShJWmFQPvOsji4Jsg1U1PK26zzgx3p00
	dKDgujjix0+bsjJBx4/PR9TM/Xi2iU9VqeGUA8hfXfj0ZtWScNVUoPVn6SiwJRGhntNohhtP2c4
	daHBFfp/6KNV1apY2YPIJUq/ES/XkihGh7XJ7zQ==
X-Google-Smtp-Source: AGHT+IFxJQpkLQMcuCl47bcv87YmmrC/kzaXW/bMMXwLkVUUAwKCx1eyJZ5ZzM/2byx+B4ZvCfzB9dPUG4xIYtBTXo0=
X-Received: by 2002:a25:d34e:0:b0:dcb:fb49:cb96 with SMTP id
 e75-20020a25d34e000000b00dcbfb49cb96mr2186626ybf.31.1712340992533; Fri, 05
 Apr 2024 11:16:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240309-fd-dsi-cleanup-bridges-v1-0-962ebdba82ed@linaro.org>
 <20240309-fd-dsi-cleanup-bridges-v1-1-962ebdba82ed@linaro.org> <88b3722e-aa46-1ffe-9f0f-1939d43e0100@quicinc.com>
In-Reply-To: <88b3722e-aa46-1ffe-9f0f-1939d43e0100@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 5 Apr 2024 21:16:21 +0300
Message-ID: <CAA8EJppbETLONx8pEdT1kT1Hp1i405m-4PfgumvvOa9N2mh6CA@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/msm/dsi: remove the drm_bridge_attach fallback
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 5 Apr 2024 at 20:20, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 3/9/2024 7:09 AM, Dmitry Baryshkov wrote:
> > All the bridges that are being used with the MSM DSI hosts have been
> > converted to support DRM_BRIDGE_ATTACH_NO_CONNECTOR. Drop the fallback
> > code and require DRM_BRIDGE_ATTACH_NO_CONNECTOR to be supported by the
> > downstream bridges.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/dsi/dsi_manager.c | 36 +++++++++++------------------------
> >   1 file changed, 11 insertions(+), 25 deletions(-)
> >
>
> There are the bridges I checked by looking at the dts:
>
> 1) lontium,lt9611
> 2) lontium,lt9611uxc
> 3) adi,adv7533
> 4) ti,sn65dsi86
>
> Are there any more?
>
> If not, this LGTM
>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

From your message it looks more like Tested-by rather than just Reviewed-by

-- 
With best wishes
Dmitry

