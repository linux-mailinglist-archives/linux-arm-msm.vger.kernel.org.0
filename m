Return-Path: <linux-arm-msm+bounces-21067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 509468D477B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 10:50:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 037BA1F21D39
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 08:50:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12A50155349;
	Thu, 30 May 2024 08:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TKozrd/s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01F9155336;
	Thu, 30 May 2024 08:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717059002; cv=none; b=PvZo/2IkEFrx35EO1n7R7a/lL/eaFhNlZLjHNKPzQUbT6NiekjBneAgRu8COTxesXV8WfAQZb/8e/ATQ8aYjBkOKM2Qz1m6j5MvHDqXC7x3n/o9fOAXF4WoM/OQVKeXBDlaoV8ef/2LOMQOiswW6/SRcUlbJHu9N5k32hT3YrlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717059002; c=relaxed/simple;
	bh=2DXQrqvVhn7otPeeh3pzCu9NQCv4f7YT6NDKPqdXedE=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=TqIxDuMg90gEddmNpF2l0rJlLhXFweHvlckV+qBvaZigX4wFp+Q5H448AwWORpWm38vCFtOhOxtU5fh/FE/nY4gDwo3JqoEPZKC12xz8gRnHfHK06HzZjT3nR6OaMj3bAzkHTA8GchYIRu8aW25w9KX9aw8c/H4cGnhB49Cz5ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TKozrd/s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4720C2BBFC;
	Thu, 30 May 2024 08:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717059001;
	bh=2DXQrqvVhn7otPeeh3pzCu9NQCv4f7YT6NDKPqdXedE=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=TKozrd/sfuLL8YZ3I/qoW8DNZRo0fy62JLiLLByUT572EOQX/IHePNikrojJDnhJZ
	 930TYhi9LNdQZdXCkQ0veUcNqonnm45usg+yWOZrz3TCfGsff38o+piGnlbrC3XlCe
	 5qa4uhXWDe7q7BXs7YgmxRNr8e1ZB0CxGh2dc4ZrjUyHDaWmDXnA7eNKCzSx6E8ZmT
	 L0iSEO2gRlCkGXBETlPtO7Ln+WYTtfsM5LRx5FNu/8eSl+iZLpNbUfzq95omOmz/pE
	 B+z22BvS8j2dMZwnyfXT7+zgvi6TC96O+RcIR2coO9xBRaSQVQUiSCxImNA1jTlgyZ
	 4UWXu2nHsy/Dg==
Message-ID: <61893982881596ef18a206f2f3ed152e@kernel.org>
Date: Thu, 30 May 2024 08:49:58 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3 2/7] drm/bridge-connector: switch to using drmm
 allocations
In-Reply-To: <20240530-bridge-hdmi-connector-v3-2-a1d184d68fe3@linaro.org>
References: <20240530-bridge-hdmi-connector-v3-2-a1d184d68fe3@linaro.org>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, "Abhinav
 Kumar" <quic_abhinavk@quicinc.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "Daniel
 Vetter" <daniel@ffwll.ch>, "David Airlie" <airlied@gmail.com>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jonas Karlman" <jonas@kwiboo.se>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Marijn
 Suijten" <marijn.suijten@somainline.org>, "Maxime Ripard" <mripard@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Rob Clark" <robdclark@gmail.com>, "Robert
 Foss" <rfoss@kernel.org>, "Sean Paul" <sean@poorly.run>, "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

On Thu, 30 May 2024 02:12:25 +0300, Dmitry Baryshkov wrote:
> Turn drm_bridge_connector to using drmm_kzalloc() and
> drmm_connector_init() and drop the custom destroy function. The
> drm_connector_unregister() and fwnode_handle_put() are already handled
> by the drm_connector_cleanup() and so are safe to be dropped.
> 
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

