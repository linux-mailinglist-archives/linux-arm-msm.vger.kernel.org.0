Return-Path: <linux-arm-msm+bounces-74992-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6418EB9DD11
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 09:10:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1067B163E78
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 07:10:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3832C26FA5B;
	Thu, 25 Sep 2025 07:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bcQvpOqV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E6A1F2361
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 07:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758784249; cv=none; b=R1D4h7K5K+NX5pzSWrWNdr8mWRUW8xBmZ+zSgCBtIyNig5HGcYrcQuQlQXtfwu/L0HFs9oEGatJZyHXbJN+rb2I9oaywzh0dxUoozaE/NGJpJheBIu3Gc8JKy6WtuY1QppIfCq/NypNa0J3Lrg/inxa8UDU0qZ50FjGsuPlTpWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758784249; c=relaxed/simple;
	bh=nt9UhBR6lM/h1AHxl80XKGo62OCVljiHOeH468JvYF0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WmkttrSee1TC6l6caxUK3CJS4y/sHWgMG4MgxXN7y3winJt3J+0SWBFWQa/jj68TBB4IhZgATNZRO7BAXguyMVz7FPROwNyhwhfz1EE3BtjfcD12OPKJQIVpaxdw/RnS+vwmvVUuE5KYmAsgRHUCsOfX2kjLzaGAMUC7JX9jolM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bcQvpOqV; arc=none smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-6352c8b683eso407575d50.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758784246; x=1759389046; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iQb6C3ttjciQrH1J6+L7MgPLJCUOx0fYYmrUWrGIRb8=;
        b=bcQvpOqV2pWuyzULZJjJlYuq5M7Ll2TbVa8zpoAvfXNr83hFR5ealC9c8sju/2GnPM
         cSi3VNq8lhX/xcR8WvxxHtgtgoQbX6AVq2gjB+3ru4Mmu5PPw5sU5NM6WlybocXhY8cw
         lA8JqnouwqIzRcVaAHkm4C2aFMO2sssJJzilyqT44yPhHQ60u+N0dj6kdGaPmxVQAqMx
         K8LeQtf+cp7fn9QeTgfu3XgmJ9lfy0pCPtcWDQRCaIYtMPhelSVLFLiYuAFNyKZupYgV
         43PYAhxTG0Utq9quLqE+hlvomHjwedGAqG5KbPIdEVIjLs0+ANTjzABzuQkiviG/0T6F
         1drw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758784246; x=1759389046;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iQb6C3ttjciQrH1J6+L7MgPLJCUOx0fYYmrUWrGIRb8=;
        b=W263EaIETgz7EBjmE5YsKPyczo3HPDPoXlYPVCbPLC6577txikccHuxMFHr/Oc1dRU
         DoY59dQvSPqJmEohalvSjZ2NmKepgQfZhYvLBHVhyJ0/FIBjN3ZkD5Lgxk2hpZ8bSRID
         vhEWOPVlaDGr+1fW5iBsaRzNr5mX/MW2mhaUJMpwNXPIu1k9a4m0S3qqdS/VmgRs1Zmw
         YEZa5QJsRiuazBUcYxsc4NjRE9Lj4tbuYBQhBi21Lk7XvkTN8n1X+APCAoSkZQlqHN3E
         y405romFpWe+/M10PZTC8G36u1UudsBMiUpZbPmfBOxvud2Skljfip1cmaYe25/Ww0r/
         +BVg==
X-Forwarded-Encrypted: i=1; AJvYcCWI0xnUUMBjqicCjV7U/pVEg/8xCq1lObt7EEhpthCKfFQS/9/Ri/SvcM+9pZqs2W+Cuee8CjuFCNHDaHu0@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo3mRT5yQwe60uDgz2QSyiPEfq0jPhBCFL/UADtGKVjM+7Z+nF
	G/PQQo4CpXGs61vINc8cX5BQhQKyw64iICbZPEeG0ROhcx+YjU2UCz7RJ7/vQdlzQJBdmqOgJpQ
	thWvRoo7BwCv+rVXII5s/BKFOux5SgI+5zZnF8Q3Z/g==
X-Gm-Gg: ASbGnctoTT4MjAAN6kMp6gcaLSeFQNpB6qChnxy0SvCFg65NbOjbSa2IlCJKgSGK6aF
	gqUHsv6HdkbdeJ21gzm4XOT5pFbV2Jmymz3gvfLld8j+hUrTYAJq3LEvRai/5BlMI5K8/wUj+5B
	bxkWy5HQ9XbHXMvu9Ql5Y+GkCJ01m9eRLEI139HMxRcU7/kyTxN/KcGh29xNBvrsOsEvwSaEXb+
	DwX0YFHJS5IJk2hVIA=
X-Google-Smtp-Source: AGHT+IH2nB64sZM1uazTNjqpZvzrzocGQiVD/Q+ub5hgCK4Vy30NwPZyFUTfLzh70x15UYl3iWsRdzrjakrOb8ae4F8=
X-Received: by 2002:a05:690e:2508:b0:635:4ecd:75a4 with SMTP id
 956f58d0204a3-6361a8ad38amr1112652d50.50.1758784246352; Thu, 25 Sep 2025
 00:10:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250924-dsi-dual-panel-upstream-v3-0-6927284f1098@linaro.org>
 <20250924-dsi-dual-panel-upstream-v3-2-6927284f1098@linaro.org> <CAO9ioeW2AHDM3KSRu-WOvy+1De9tqfhrCNozw5Wkh=CJDHxFYg@mail.gmail.com>
In-Reply-To: <CAO9ioeW2AHDM3KSRu-WOvy+1De9tqfhrCNozw5Wkh=CJDHxFYg@mail.gmail.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 25 Sep 2025 15:10:35 +0800
X-Gm-Features: AS18NWAPf9tdpp_gChgD_gM1WzlnnA0bBkACDBIPWpyv07LUDbDFj0oLZcuPUcU
Message-ID: <CABymUCP2m-Z1spkAydryNWfysXTVma_H=7w=0GYL6+aH5KW9QA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] drm/mipi-dsi: Add flag to support dual-panel configurations
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krishna Manikandan <quic_mkrishn@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2025=E5=B9=B4=
9=E6=9C=8825=E6=97=A5=E5=91=A8=E5=9B=9B 02:02=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, 24 Sept 2025 at 18:08, Jun Nie <jun.nie@linaro.org> wrote:
> >
> > Some devices treat two independent physical DSI panels as a single
> > logical panel from the CRTC's perspective. However, two separate DSI
> > hosts are still required to drive the panels individually.
> >
> > Introduce a `dual_panel` flag to the `mipi_dsi_device` struct. This
> > allows a panel driver to inform the DSI host that it is part of a
> > dual-panel setup, enabling the host to coordinate both physical
> > displays as one.
>
> How is it being set?

This is set by panel driver in probe(). You mean this should be documented
here, right?

> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >  include/drm/drm_mipi_dsi.h | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
> > index 5a85ba01f402a3866b70828391bb417bb8dd5956..0faff285d9ffeb19e4523cd=
c7bf21c1ec20e6eff 100644
> > --- a/include/drm/drm_mipi_dsi.h
> > +++ b/include/drm/drm_mipi_dsi.h
> > @@ -170,6 +170,7 @@ struct mipi_dsi_device_info {
> >   * @host: DSI host for this peripheral
> >   * @dev: driver model device node for this peripheral
> >   * @attached: the DSI device has been successfully attached
> > + * @dual_panel: the DSI device is one instance of dual panel
> >   * @name: DSI peripheral chip type
> >   * @channel: virtual channel assigned to the peripheral
> >   * @format: pixel format for video mode
> > @@ -188,6 +189,7 @@ struct mipi_dsi_device {
> >         struct mipi_dsi_host *host;
> >         struct device dev;
> >         bool attached;
> > +       bool dual_panel;
> >
> >         char name[DSI_DEV_NAME_SIZE];
> >         unsigned int channel;
> >
> > --
> > 2.34.1
> >
>
>
> --
> With best wishes
> Dmitry

