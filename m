Return-Path: <linux-arm-msm+bounces-22161-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 569F2901D17
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2024 10:40:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E77F0282C77
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2024 08:39:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75E04626CB;
	Mon, 10 Jun 2024 08:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C0r+3mVR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0E84D8A0;
	Mon, 10 Jun 2024 08:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718008795; cv=none; b=pNTZa5md7XPr2FDfpl+Uov6ttNLrnYqIjoNynOLYjlGbUiumciGmuVIDWsRjmnW7jc4OZxyXVqTkAwcVY1VEPaiyMcT+fJK+Lq4/MQsrHeQQw0B/eq8FDXtGf+2OF0z69tuEmJhjGFJ7M/yENR/Wt49xrG0E65X2ag+3bvOOWN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718008795; c=relaxed/simple;
	bh=IVgr4Lg50VrbVkuyXy975ptx5KVagoNyzgIsSR4Gwcc=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=C6ArNue8uIgbSsygZXCIw+XpuhkFk8ondVFr3Ha8Ehn3QGos1kz8AbXPBH3dZQyCDNzsuexWfRmaGDElQeD/LF5E3khxCNx7rR77caDtIJFgBAhl5qIyZdc1N4t29AWXhXP422XOLtzzXBEQ8773n3+JJG0tT4gJzrCcch3+i4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C0r+3mVR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E335C2BBFC;
	Mon, 10 Jun 2024 08:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718008794;
	bh=IVgr4Lg50VrbVkuyXy975ptx5KVagoNyzgIsSR4Gwcc=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=C0r+3mVR9h65sNZw2h/PtmQvmfCv0OL3koJTZfCen/Pv8HNmOnHwoSdRX2Q455Sje
	 PtEb5D8ZUFHobDYBBVYzPzbuWWT0Fhs9MCDtnFrLpj0mEAnJkioJ+AfvEyDNxzc/9A
	 E2UG3R1PsbLebPwlsmYmai01CycCRbrQy1h6A0IFh+wmCmguf8qTCgI/nhw0w7oKoO
	 rRDRitS3ldmUQUMS5uzsSNlBayjLYO3gZLsQak7PBA/VAmkituavAThbVBCUBVLavA
	 d5clubbVLcN9XnWBFBH6cHoMGTEraiI7tYU7+FjyrYA7eCX8D8W9Q4M1ry6v3GkxLs
	 XHbqAWAwJibiA==
Message-ID: <da82bfcfce841103980500b0960d2da1@kernel.org>
Date: Mon, 10 Jun 2024 08:39:52 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v5 9/9] drm/msm/hdmi: also send the SPD and HDMI Vendor
 Specific InfoFrames
In-Reply-To: <20240607-bridge-hdmi-connector-v5-9-ab384e6021af@linaro.org>
References: <20240607-bridge-hdmi-connector-v5-9-ab384e6021af@linaro.org>
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

On Fri, 7 Jun 2024 16:23:06 +0300, Dmitry Baryshkov wrote:
> Extend the driver to send SPD and HDMI Vendor Specific InfoFrames.
> 
> While the HDMI block has special block to send HVS InfoFrame, use
> GENERIC0 block instead. VENSPEC_INFO registers pack frame data in a way
> that requires manual repacking in the driver, while GENERIC0 doesn't
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

