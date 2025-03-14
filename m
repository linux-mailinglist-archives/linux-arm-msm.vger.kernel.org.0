Return-Path: <linux-arm-msm+bounces-51460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 636BFA618AB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 18:54:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 708921898EE0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 17:54:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D14B202C55;
	Fri, 14 Mar 2025 17:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AjTAUCj1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456851FDA76;
	Fri, 14 Mar 2025 17:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741974827; cv=none; b=GF8Rxr7/qI15KA74bYphbTsvdfDlBu3htIt/nKaWQAFZH3ZZoycVcXWX4dx5whpoSJsawFf2yKCj5n64ndKHivwHsJl3unCEyh+EKakmDWw+qZo1d+Y2fFoR4UiEMI7jcSr/7GismFWElaNDKOg/RI/Ku2qkzGGgw40xZkBft6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741974827; c=relaxed/simple;
	bh=s5sHm7/QnN7CVS7K9YFNqIidGfIhRwMnWMvEDWIzRJE=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=ny4bGGKBir2vtIczGyngxNpD3elVVFJ2heMNyJow4RcYQnISbToZSW44as07FMpVbrySYZp9nGBaGO7CSb7oUYY0WcRDK/2yb1w22+tpx5NHP2cZ61VAh8/P8B0GkH4Vm2E7OonI0qAdG/44HdxOcOsoSnJN5cNrK9vVZ17nh3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AjTAUCj1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38E7CC4CEE3;
	Fri, 14 Mar 2025 17:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741974826;
	bh=s5sHm7/QnN7CVS7K9YFNqIidGfIhRwMnWMvEDWIzRJE=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=AjTAUCj1AqyVFILuqDf1htnLC/n62fgzlyWA5H1BD+dsyXp0Bezik4MJ2zfCreNrZ
	 7zIvkQhkDFUaZwkGqBp6VmKVjpoSZ9LAnHumSkaVJ4OTJDkvtzHqgCiI3zOUZDk0tV
	 qL9kilD6gIdHzzJaOa64ZMi3yC6LLdmJWPf/sHqLUQnYqEMEtv6d62fWnlu8AFHtg5
	 5T2CXO9P3RQkQgz6k4fc87k/ByPD3g4qe4bq+1viJ4Ay72N7eqgpBIALy3hssFL+PJ
	 T8UvGgGHwMdOqHpT/I9iAOwjpWMrtFfp+n8dKcdv3Jw4jRFgGGfvQDICdC7ke9ic9Q
	 3DdsLkLSb8kJA==
Message-ID: <26194ac041ad313a9e48ec1c7ef21cfc@kernel.org>
Date: Fri, 14 Mar 2025 17:53:44 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v6 2/4] drm/bridge: add function interface for
 DisplayPort audio implementation
In-Reply-To: <20250314-dp-hdmi-audio-v6-2-dbd228fa73d7@oss.qualcomm.com>
References: <20250314-dp-hdmi-audio-v6-2-dbd228fa73d7@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, "Abhinav
 Kumar" <quic_abhinavk@quicinc.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "David
 Airlie" <airlied@gmail.com>, "Dmitry Baryshkov" <lumag@kernel.org>, "Hermes
 Wu" <Hermes.wu@ite.com.tw>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Marijn Suijten" <marijn.suijten@somainline.org>, "Maxime
 Ripard" <mripard@kernel.org>, "Neil Armstrong" <neil.armstrong@linaro.org>, "Rob
 Clark" <robdclark@gmail.com>, "Robert Foss" <rfoss@kernel.org>, "Sean Paul" <sean@poorly.run>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

On Fri, 14 Mar 2025 11:36:49 +0200, Dmitry Baryshkov wrote:
> It is common for the DisplayPort bridges to implement audio support. In
> preparation to providing a generic framework for DP audio, add
> corresponding interface to struct drm_bridge. As suggested by Maxime
> for now this is mostly c&p of the corresponding HDMI audio API.
> 
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

