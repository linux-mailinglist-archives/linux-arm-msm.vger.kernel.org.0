Return-Path: <linux-arm-msm+bounces-21445-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 823008D7CBF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 09:50:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3DA0D2815BE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 07:50:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D848F4AEF2;
	Mon,  3 Jun 2024 07:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XZHEKvoa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0BDF4AED1;
	Mon,  3 Jun 2024 07:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717401040; cv=none; b=HaZT/pg/TSWoA4XWorSHk/0qXKn081KylUK9WGt328PnrO0WElSc7jZkpyyM5Etq+6HgAWwaP8kzLoQSi5dmLldBN2oDj8EA7t+E9dMLMT4DW9+sKz4/0TMu45aPTGRKXEMdqt6Gf22aYbEeo4ZTdKvhxgHeRRtkhwKL331SNG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717401040; c=relaxed/simple;
	bh=vPuSoLpsoPv1fgo3ne/M8R9du/neO5GYC/OOGK76npY=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=iFwAuh2Dj3Oue8Vz2WFq9ClPDBxz9paoPsZwgsszlcDKCUqq4Q93FZIaS6auxU9ksRsqshEzKKmW3enKbV8vqjxsdnhApdd/99qt0RLff29Eeivnf8DXKelOFSkIkwLpY1K/6x92ZLl9cKMGnju0D4Qc4U3ReYyBU825TxfT2Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XZHEKvoa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC58CC2BD10;
	Mon,  3 Jun 2024 07:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717401040;
	bh=vPuSoLpsoPv1fgo3ne/M8R9du/neO5GYC/OOGK76npY=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=XZHEKvoaFfAxmESMIoCHL5iHZqZxd2CFNdo8ZiNinZgIHMOag0Jw0duqJjPQeruht
	 /feg5FqwREbA24rNLwYINyNW5lHKBBoDyhgVKK2OiVLgaH+TrMV70XiGviHC2KGy7g
	 XIijAJDcEwsbbOzBhcPF01lAqXCorX3ld6RNFTf1hjqCeBfECLpwI7wm1GFWOm8Pwr
	 xDpMXM0PFOc0Swp+U6DZPf4e/45+uMCbeDBlr7P9Kch+joXQZXe1+S9qLXdWMYC4Go
	 KGDv/8Bju/ukU9Z+n72IWCvmvpt0/pYGPnV6eBvoi3P0UsB3mF9CGPO4fsXj1HTriH
	 a3+FVtyG7+BMQ==
Message-ID: <53746adf592a721f40d3c8f4e846ceba@kernel.org>
Date: Mon, 03 Jun 2024 07:50:37 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 7/9] drm/msm/hdmi: get rid of hdmi_mode
In-Reply-To: <20240531-bridge-hdmi-connector-v4-7-5110f7943622@linaro.org>
References: <20240531-bridge-hdmi-connector-v4-7-5110f7943622@linaro.org>
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

On Fri, 31 May 2024 23:07:30 +0300, Dmitry Baryshkov wrote:
> Use connector->display_info.is_hdmi instead of manually using
> drm_detect_hdmi_monitor().
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

