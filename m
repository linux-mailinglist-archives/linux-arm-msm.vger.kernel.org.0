Return-Path: <linux-arm-msm+bounces-71280-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 626A8B3C8C8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Aug 2025 09:34:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2032A1677C8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Aug 2025 07:34:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4632230264;
	Sat, 30 Aug 2025 07:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b="AYfuSV+V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6411D16F0FE
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Aug 2025 07:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756539280; cv=none; b=XCdO7FLishJCs+cPO2LqoOFT6iZTW8LRgzT9v4hs47//gujGxvrYDLyos3oaDLyyCY4EV+EYtkFkv/RYYAedjLYIZTewS2v63Pzhd3UwATtxrEdaIbOULaq3JjObzoWrk/RVox16xmaRI0alUA+qFOsZKRzDpJlMA+oAlZOFNaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756539280; c=relaxed/simple;
	bh=ddimCuuu8iN3xYZdmcMu0ICYLJHfknoay+NbdcrWIto=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eExdz61DWn0XMVj/ZXtfSIwA4a5GM0faoFR18Dj5tzV4oeYfrdgp9Q2fuHQJk2mg73iAy2AXAyhMO/MCCpSBDMWbNz9kqh9HgqDno0RLn+c9OVQHfKU1ocTwyIvbYxhR+xjhx/TIZ83345fi+pHgtwTyEePWjS6hXth5p4IxiyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org; spf=pass smtp.mailfrom=fooishbar.org; dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b=AYfuSV+V; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4b1099192b0so53082191cf.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Aug 2025 00:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1756539278; x=1757144078; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/XKolNdOG4rWtnm/Z1Xm//IS1jzblLqTcVqQ5IMS/rM=;
        b=AYfuSV+V1/7udVcc68cZuehl7KiGUQpOfk5ZND2KQyaW+oKFYFOa1u6iVPj9tWPfGf
         FormpVOGlBZDCurCe4hnCOOtnDFI25Ct/85ucZPuqZoHeM7XSdWrWX2A9OWNHAX72sYf
         gsvdMUZwBY93jRHsIyOmkAcCIRc0HG0jvZ9QE6pTC9xGzV553hJmtTEZVHplWiEPHw90
         v8tt3BCdoqdQVbWnP0kd+pag/MsP1Y0bJ3D8y/4hpmree2BcwBdVaK29RP9aq59cfwgY
         4i6FVqY+eaFE7IEXhbLqPpvdwGLUw0lJxUiS6EIDzG1MlEFG9I2HPSqC3+2BA9K29m23
         8G5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756539278; x=1757144078;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/XKolNdOG4rWtnm/Z1Xm//IS1jzblLqTcVqQ5IMS/rM=;
        b=lBwCxoe9Vxdu3mnwViP25fWuWoBj4cIwMYA3FIRicfFG9FQTuFW6smyCgqg/OKDqok
         bFPCMeWSts4+mt5qHXtYmfvkQGUL8ocflTKGhxmZ4nl718M4zqhWxegKMqsU/TrqAnwV
         O4GiMugt6VGHl6FThZ4Gv47lMUISkJUxN4WQb8TGIMLie08RC+jpwYBPgcwZMZPuwAlc
         CkgT+Zv6RBu8pNgHu6clhcjN0DbuqXWy+I8fMRX3uM5yZBsYnQd81xrn0GA1RFj2/UXf
         wlozL1CGjbK8VN07Ynt0yVgLOp4+uYE15fVUpqqpKxH6CEZjzb8sRjRG6HIQGvP4cG97
         mrAw==
X-Forwarded-Encrypted: i=1; AJvYcCVUcSWK8AnyVODfKFVI8Sm94BBut3LIjJT+Ug/2UTEj+FfZp8qPCBOqJFMHCR8iS78GwfjY4pquHJEdqnxT@vger.kernel.org
X-Gm-Message-State: AOJu0YymWuK/ssth04c84e4S1ZqfNPvB9ZexmYbaSilcmEv0dsF4yBs8
	fglZHe9Gltfn2lSt4o98Va0BLb3oXCa9sKG0kwYHe/jlWwm7wYWVsOLfEAd23lR6p2XuW2CJ4MC
	ExIf9VIfw10cLrb0bjIRnd/RE6NbiIHlw6IyeUsbxjg==
X-Gm-Gg: ASbGncsArGvxxntyiQW+4/GA5uea0rEsR+/ZNgFRMKGOnb2EB3J98QJefwePBlMxjQB
	mJtUS4rT/Qx11UyCry1ZYY2QT/94g4xS5h0mmAFqL8SAsQKMv3Y5STLVQRfbAq4ySJ/sAtYcOLu
	pxaR4SUV7oIAAt7W2NBeqrJAuBWq0rHG/8YY5i4RN5qf1fk9Ex+7uLc3PraY0NOMUyZ4HbTKacp
	prB5A==
X-Google-Smtp-Source: AGHT+IF+RtT0nHcRaStCokPpIqIxLujpZpjFFgu9P7ssG1Dbp9cdTPQGJvkbcXDD3qNhvrdS/Kj2NXgLvHLELse+VQw=
X-Received: by 2002:a05:622a:4116:b0:4b2:ec43:3de4 with SMTP id
 d75a77b69052e-4b31dcb27f5mr15037901cf.75.1756539278311; Sat, 30 Aug 2025
 00:34:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250830-drm-limit-infoframes-v3-0-32fcbec4634e@oss.qualcomm.com> <20250830-drm-limit-infoframes-v3-9-32fcbec4634e@oss.qualcomm.com>
In-Reply-To: <20250830-drm-limit-infoframes-v3-9-32fcbec4634e@oss.qualcomm.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Sat, 30 Aug 2025 09:34:26 +0200
X-Gm-Features: Ac12FXz1p7iZOdEEQR_vXRtXiF18jyko9t937NCSmf3jeVcnUDmrfFo9HX_W5zM
Message-ID: <CAPj87rNMr-2ZeZ2Pqb5qG4Z-xtUyOVxbY635pw_PDEjVpd5-OQ@mail.gmail.com>
Subject: Re: [PATCH v3 09/11] drm/connector: verify that HDMI connectors
 support necessary InfoFrames
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>, 
	Samuel Holland <samuel@sholland.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	=?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Liu Ying <victor.liu@nxp.com>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 30 Aug 2025 at 02:23, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
> +       if (!(supported_infoframes & DRM_CONNECTOR_INFOFRAME_VENDOR))
> +               drm_info(dev, "HDMI conneector with no support for Vendor-Specific InfoFrame\n");

'conneector'

