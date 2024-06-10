Return-Path: <linux-arm-msm+bounces-22160-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 40709901CEF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2024 10:30:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E560E1F21381
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2024 08:30:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5F2C6F2EC;
	Mon, 10 Jun 2024 08:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SohFcnHY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD5B38DFC;
	Mon, 10 Jun 2024 08:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718008207; cv=none; b=J9L7yX6sGtaL8bghJeT3ZNbYFIDivzfpATEnT03cQYse9/6+xW7tp74/sSJytJ3t7R27jFfiryymZHmXjA91u5YRvGJV7hghWooJWH4+OM+m7VQhTd8m76PUvSIDQKq/i/u7RadOfPtVLT2jVvw/Qr5Adh/VoebrTo903uhXON8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718008207; c=relaxed/simple;
	bh=nTVn4gDwqTmEQqI98pMWF2QDD4wAEEh3xJoL8K68ph0=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=HT7k+Ss/xJx1Rv3Hfp1eFxrhcTxhxxA+7W1zZuzBCLjlcpnq6f3c81h/BjnmCKV5Jf6T7iG+DGu2q/RWfY29Gx4nLzOHn+zQ2R0zEfOy/KHDgqUvuZjinWtJeOiqBRVN4DcA3TPch+jPuXQyd9TXc2749+fKBGU1dbNZg2M2Bh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SohFcnHY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2444C2BBFC;
	Mon, 10 Jun 2024 08:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718008207;
	bh=nTVn4gDwqTmEQqI98pMWF2QDD4wAEEh3xJoL8K68ph0=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=SohFcnHYl3baCEu1xluTM0aSCeUeSuqw1V7vAXT5ncyeMuwBO0w0z/cwftRRE4dDl
	 U89UvO0YlWVAPbkBNsY7OoIezIpQyVwPkshp3BMxNgNAvbEh8a8+yk/UgztXold0gB
	 dICCIc+7ZqHpSTqXBwAgmO78xhtkS9cWShQjOe9dBuAWColwaPhTmO0xfZyQGbcjTa
	 +qGzBK/8M5ArrOlvg51lIYu5ISsISzESZoOrzO1gRCfCnHdHLsaHxGuYpNU+pkz06X
	 qBSAcBWQgue7Wk2jBr4YzBI9JnzpKkCf3nyHX4j0TJe1xo8ukmSFMr9g/xCw+dJ+e3
	 /LFxU5eE+hedQ==
Message-ID: <66021e08602decbe759dbf77a71490d7@kernel.org>
Date: Mon, 10 Jun 2024 08:30:04 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v5 1/9] drm/connector: hdmi: allow disabling Audio
 Infoframe
In-Reply-To: <20240607-bridge-hdmi-connector-v5-1-ab384e6021af@linaro.org>
References: <20240607-bridge-hdmi-connector-v5-1-ab384e6021af@linaro.org>
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

On Fri, 7 Jun 2024 16:22:58 +0300, Dmitry Baryshkov wrote:
> Add drm_atomic_helper_connector_hdmi_disable_audio_infoframe(), an API
> to allow the driver disable sending the Audio Infoframe. This is to be
> used by the drivers if setup of the infoframes is not tightly coupled
> with the audio functionality and just disabling the audio playback
> doesn't stop the HDMI hardware from sending the Infoframe.
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

