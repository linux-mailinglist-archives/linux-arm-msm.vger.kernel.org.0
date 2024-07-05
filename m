Return-Path: <linux-arm-msm+bounces-25373-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D019287E6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 13:26:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9AC2F1F21480
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 11:26:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 934B11494C2;
	Fri,  5 Jul 2024 11:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rMY2NsS5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7141474C9;
	Fri,  5 Jul 2024 11:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720178805; cv=none; b=fA829jnQhS9PHvsccypZT3l/Q36vqMgyiavOhgzCMWa19lJce07s22IAo3ksVJu+jQ5PlzXRoIvf2eMeHKxAvRLDZVTX+STEhmVHT4IQrOtijMzAy3ckbwVWfP9OnO4RLSZjxBaqw6ZrBMKmqA69C48IzXDLpsnzV7QqV0TwSPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720178805; c=relaxed/simple;
	bh=yl5XDJkF2mnEPH4zD2PEULxDkOPHGf+X7s1caWCPjhY=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=quNvXTmhqQYza5B+crj4y4wz5QGR236sNS4HXUNAyGvw+AjNbkd3CAyIKS9Z6KO13JlWtxy9BjTFOwH0X0LcK6rloLwBSw1/eJcARK6dmnYG1iXKKH17wZzTp708+Ef2SWAQfYxsxQKsIip3JTiTbSKLGtMpy49aXbDtEP4y38Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rMY2NsS5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 751FDC116B1;
	Fri,  5 Jul 2024 11:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720178805;
	bh=yl5XDJkF2mnEPH4zD2PEULxDkOPHGf+X7s1caWCPjhY=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=rMY2NsS5nigIKmNbS4DxsqjjBdla8LJ6TDcCVhIhj3FbW61V/3gFaXUW3CjO9+8NF
	 qYoUNNORvvvmpqXjv2SwZuHhHuldEX5zXPPDPiYt00CJ1BG4JG1CSwaGP023gsz1ml
	 3rGDA4H/Usn46787110+PzyvTfIO7pbnx89HJ3UBpomhLaxYD99t4qp0PcyKSFDPTy
	 mZdufRCyvJm2cLGAVx4Xe1VkZnawX9TPEa2ktFTZ/SNufbS33iC0J1I3rT5miXDIBE
	 CYKveKNVXD6QTjTWyHQQBZmXPf64kjEO1AW1EbysanTgEYubBfraXOX7VsMLNZQ8p7
	 I2/xV5PGlj1ww==
Message-ID: <f509590f5b9721368382dd82a142e965@kernel.org>
Date: Fri, 05 Jul 2024 11:26:42 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v6] drm/display: split DSC helpers from DP helpers
In-Reply-To: <20240704-panel-sw43408-fix-v6-1-3ea1c94bbb9b@linaro.org>
References: <20240704-panel-sw43408-fix-v6-1-3ea1c94bbb9b@linaro.org>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, "Abhinav
 Kumar" <quic_abhinavk@quicinc.com>, "Alex Deucher" <alexander.deucher@amd.com>,
 =?utf-8?b?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, "Daniel
 Vetter" <daniel@ffwll.ch>, "David Airlie" <airlied@gmail.com>, "Jani Nikula" <jani.nikula@linux.intel.com>, "Jessica
 Zhang" <quic_jesszhan@quicinc.com>, "Joonas Lahtinen" <joonas.lahtinen@linux.intel.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Marijn Suijten" <marijn.suijten@somainline.org>, "Maxime
 Ripard" <mripard@kernel.org>, "Neil Armstrong" <neil.armstrong@linaro.org>, "Rob
 Clark" <robdclark@gmail.com>, "Rodrigo Vivi" <rodrigo.vivi@intel.com>, "Sean
 Paul" <sean@poorly.run>, "Thomas Zimmermann" <tzimmermann@suse.de>, "Tvrtko
 Ursulin" <tursulin@ursulin.net>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

On Thu, 4 Jul 2024 22:17:08 +0300, Dmitry Baryshkov wrote:
> Currently the DRM DSC functions are selected by the
> DRM_DISPLAY_DP_HELPER Kconfig symbol. This is not optimal, since the DSI
> code (both panel and host drivers) end up selecting the seemingly
> irrelevant DP helpers. Split the DSC code to be guarded by the separate
> DRM_DISPLAY_DSC_HELPER Kconfig symbol.
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

