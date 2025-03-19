Return-Path: <linux-arm-msm+bounces-52011-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D562FA69435
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 16:59:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 83D2018887F8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 15:53:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D356F1ADFFE;
	Wed, 19 Mar 2025 15:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YfHBY8Rz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B7D8248C;
	Wed, 19 Mar 2025 15:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742399570; cv=none; b=B6eSnStjkQ9MYkOrVcCv9nCWJ2QcsnzID3NnyKx9AEBzsJLNX6PC20Z/Ufwg4rKLuaFVQ+5ImQeqMVlB96kGtfpXMB06cqFYAHoRhvPb9Ktjk+LVBychmRGOwD8pcVEjUFNQaqJOjMHpT+kLkI3p5dVO/RAAJxAow3W7xYJXbgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742399570; c=relaxed/simple;
	bh=oYiINVdzIoBCxFX8j1b/goCcPvWMDU9tBsffGEb/1xA=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=aAd81iWHyHCQW0w8kjlgNcfyFucNLI9Cl5ip2Lx6SRYBMSVIS806+HlN7baXK/fypR067kQ/RqY+cbVScWDPz+QOzAtzhf72+GjamdFvsixgcTH3d1+KNgw7sjf5kkjB7vbIPNSAnLuO+2ZKYBOSDLSAYiQKiJlOaL8rxH/0Hgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YfHBY8Rz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB99AC4CEE4;
	Wed, 19 Mar 2025 15:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742399570;
	bh=oYiINVdzIoBCxFX8j1b/goCcPvWMDU9tBsffGEb/1xA=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=YfHBY8RzU2fcusIAFAdOxWb6tFvKbcDvIekN/cATF4QnlSepo1vEAjaCFltpG0qw6
	 DYqhQd58EEljH3a8mmJjOMak+MUJB7IfjCkScuXt/kMAY6K89HtmBsQ6nwsxPSWdUL
	 ZZ8sDhKxvFi9GxxJu3UxDSgUaoXJ601gt1TxeUAldfU5Kbu9bz8fT5gzxTB+U4CvZ5
	 ZGoyHq2mPKdSocoyvPbUykVMrjXzHquCyHYi6VXwRd4u3uNjw/PtfWMtFRjczaSi1M
	 9oHmByJtYIFWXUBTySK3P5fN3FVGJA4+Jnw/j7xfeHSD8F0ih+aBdoEBX2EOhqVW3E
	 Pt/ke3htc6bvw==
Message-ID: <30c25e064d7c46ee6e70a6a32eddd819@kernel.org>
Date: Wed, 19 Mar 2025 15:52:47 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v6 3/4] drm/bridge-connector: hook DisplayPort audio
 support
In-Reply-To: <20250314-dp-hdmi-audio-v6-3-dbd228fa73d7@oss.qualcomm.com>
References: <20250314-dp-hdmi-audio-v6-3-dbd228fa73d7@oss.qualcomm.com>
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

On Fri, 14 Mar 2025 11:36:50 +0200, Dmitry Baryshkov wrote:
> Reuse existing code plumbing HDMI audio support and the existing HDMI
> audio helpers that register HDMI codec device and plumb in the
> DisplayPort audio interfaces to be handled by the drm_bridge_connector.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

