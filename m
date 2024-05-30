Return-Path: <linux-arm-msm+bounces-21071-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B8E8D4812
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 11:06:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1DD3FB26463
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 09:05:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75E8615218D;
	Thu, 30 May 2024 09:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O23mOYk4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8A8176187;
	Thu, 30 May 2024 09:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717059901; cv=none; b=S8vnF2C+DP97xBRDfi/hMU0qfVHdG95Tp1lhv1W+uKm1W6yK1JJt89voPXKXPspicrnVZ6LxA8tItoTL9v9DObEtct/MZiQ9jw4VtogQHwK5HBAHON1eMKxRHenQTfJmLWIZDEIt1jL5IUzaUjFQSalQHXT/Bsv+PcjIRoPBI1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717059901; c=relaxed/simple;
	bh=58FOPhDGg37DCL3uM5t+hUaE4DGFtdvOm40IzQDdEe0=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=V5YbRc5cB/xDrFJJX2MkpLiwDN3PGeMiweH38hZ1aUrJMvCKn22DP4hFB/t0GpuWZO6I49Vmkb9q6YfsNzgd32HN5QCAmysYDrlXShEAOemMuGuTVl7QTKxUmBOW8QXkQvKzkcQhPod+PI5OqX78XACkHHbhruTWKFTYYHcr6fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O23mOYk4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AA16C32786;
	Thu, 30 May 2024 09:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717059900;
	bh=58FOPhDGg37DCL3uM5t+hUaE4DGFtdvOm40IzQDdEe0=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=O23mOYk4WWzsOCev8z14+dawmroIIeCufXyf+6euF96z/TJFm+06YEwTnOtXoFQzJ
	 7QUZkpY8xYAhjL36iLjIUbkzBLQRR8qzvNS5ArqzgmhwAqdQDtSzZY/z36IoVYxkND
	 zan/dRRgAInLmzkaOxJthGwSEgxko1KgLr6KgiQSk/0XihdpUiJJbX7nrdlogcdr/a
	 3iD5+kpX+AW+NDk5knxn3crB4NzukoEcUTLVKfx/A6WDVkTEXjuxVLbNmCGAcHLMhf
	 OFZnRML6JXHCPg6svrXTlgeLR5b6AhBxcy8CeYar+JypYZ5Iix3fDbpg/hsmd2c5wh
	 dPd8MnZjBrOrA==
Message-ID: <116e3e2d57d20833fb2b7ae5ac23d9c0@kernel.org>
Date: Thu, 30 May 2024 09:04:58 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3 4/7] drm/msm/hdmi: switch to atomic bridge callbacks
In-Reply-To: <20240530-bridge-hdmi-connector-v3-4-a1d184d68fe3@linaro.org>
References: <20240530-bridge-hdmi-connector-v3-4-a1d184d68fe3@linaro.org>
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

On Thu, 30 May 2024 02:12:27 +0300, Dmitry Baryshkov wrote:
> Change MSM HDMI bridge to use atomic_* callbacks in preparation to
> enablign the HDMI connector support.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

