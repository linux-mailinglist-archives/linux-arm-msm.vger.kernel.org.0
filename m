Return-Path: <linux-arm-msm+bounces-54256-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F11EA8874D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 17:34:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 443AD1886222
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 15:25:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D46B842A92;
	Mon, 14 Apr 2025 15:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="emZdFVaj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3BE2DFA59;
	Mon, 14 Apr 2025 15:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744644286; cv=none; b=WLakfgrLEQSr4a67KlSBmdeNHxoVfbum1bQPMgFjQDEzv+c7XlBW3W1VCCE8T/MW5qrMD03U0Y7BLjjjBolTf2dwB9KHWsaXaZHgaHPQPErjK2xIjCcx7SyuOiSB4FbvMzdOSVmVWRrbJIJqhQINdVzTm/x0AuOvZjs16rR/nQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744644286; c=relaxed/simple;
	bh=o3nILmGE9JYuIUmFfw9p9jVeAhSXeW6qek1u5R4dIvs=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=FGd2ZyHr1n560zOUJTiLFO8RApuMXENy1mB3YCWGcJPf0KH6LXFrwbU9eJr3b8+gK1Pcge7v+xy209As9iheAFHvKmWIpg6gTQ/hCb/BZmD0xsKK+Zm5uzHicv0s0oUS2kNCj1tAOwjywnpIhcRxm/t9Hd4JqUW6IsiS/aSf/rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=emZdFVaj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C434FC4CEE2;
	Mon, 14 Apr 2025 15:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744644286;
	bh=o3nILmGE9JYuIUmFfw9p9jVeAhSXeW6qek1u5R4dIvs=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=emZdFVajAeVubJKYb8s7PmiiNnkgFKaE43N1jrqLWj47+kbQtOsjvfQjoU59iEblB
	 JBLwRWwZ4onwjAhMsqOXd0nJwisC3B7zgs9q+m/WDKSWmJIsh71VbO1Qjv1mYxy/zq
	 I/1ZaRT9UfIVKuq71krfK+sLsx3El79qT/DNAlBGPbmNbEW7gU13pPBtMVeTp1yzIn
	 DCBtCwKgetLdsZvLNzVd3SzoN5sqoe1+GnuYfYClRZ8AU2WZtzWbkKYHnaR2gm4sec
	 ki3hKOaadJwVwOhnnydemqLYBeklK5bYCoe+WFQK8PCqvkikrKE+IjYmyV7CNldfjE
	 HV4hzaNOP/zeg==
Message-ID: <905b834cc0c09405570199ef5acfb92a@kernel.org>
Date: Mon, 14 Apr 2025 15:24:43 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/3] drm/display: hdmi: provide central data
 authority for ACR params
In-Reply-To: <20250408-drm-hdmi-acr-v2-1-dee7298ab1af@oss.qualcomm.com>
References: <20250408-drm-hdmi-acr-v2-1-dee7298ab1af@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, "Abhinav
 Kumar" <quic_abhinavk@quicinc.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "Dave
 Stevenson" <dave.stevenson@raspberrypi.com>, "David Airlie" <airlied@gmail.com>, "Dmitry
 Baryshkov" <lumag@kernel.org>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Marijn Suijten" <marijn.suijten@somainline.org>, "Maxime
 Ripard" <mripard@kernel.org>, =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Raspberry Pi Kernel Maintenance" <kernel-list@raspberrypi.com>, "Rob
 Clark" <robdclark@gmail.com>, "Robert Foss" <rfoss@kernel.org>, "Sean Paul" <sean@poorly.run>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

On Tue, 8 Apr 2025 16:54:25 +0300, Dmitry Baryshkov wrote:
> HDMI standard defines recommended N and CTS values for Audio Clock
> Regeneration. Currently each driver implements those, frequently in
> somewhat unique way. Provide a generic helper for getting those values
> to be used by the HDMI drivers.
> 
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

