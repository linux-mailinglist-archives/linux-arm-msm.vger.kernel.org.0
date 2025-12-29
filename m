Return-Path: <linux-arm-msm+bounces-86818-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A47CE6826
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 12:23:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2A7633000538
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 11:23:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8CD03009EE;
	Mon, 29 Dec 2025 11:23:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [5.144.164.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D28281370;
	Mon, 29 Dec 2025 11:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.144.164.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767007424; cv=none; b=KiaPvkF6yF/PbpXMKjk+we/2qZJSshWMEDutngi9+o0gLPkDEj2JHaFKd43OTWYI0649Sqi2VSARr/SWAUFriF525A61Wl5ThCg3EKRJWXEc7AdEqJnVVbYp296riSfwdq4gw7Y/lvvXTPb33k+ZrrOVkPLTO7IW/S/QtiUCqUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767007424; c=relaxed/simple;
	bh=9Ql4KU9FBLpXUdFX60DWSOMFha9hb5HcxLBGhxbFkzs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m/oaCtxhjjPZL6YmOEvAlOYUX0GLwSKPGSahniOa+Qio09Q7rqVIIPh+AYYz4vRYE9Uy+68l8Twu+By3xRNhkcOcByJeCj6SCeXzliZhCR6a3sIqEmOhBXNDoZtYJuhaVc8AbdPbM4mkn3A/5gRvvu+eFb9+6s8lbSVk5ITxW9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org; spf=pass smtp.mailfrom=somainline.org; arc=none smtp.client-ip=5.144.164.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=somainline.org
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 39E273EC05;
	Mon, 29 Dec 2025 12:23:41 +0100 (CET)
Date: Mon, 29 Dec 2025 12:23:40 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Teguh Sobirin <teguh@sobir.in>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] drm/msm/dpu: Set vsync source irrespective of mdp
 top support
Message-ID: <aVJkkOBfGFujXC-p@SoMainline.org>
References: <20251228-intf-fix-wd-v5-0-f6fce628e6f2@oss.qualcomm.com>
 <20251228-intf-fix-wd-v5-1-f6fce628e6f2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251228-intf-fix-wd-v5-1-f6fce628e6f2@oss.qualcomm.com>

On 2025-12-28 05:57:11, Dmitry Baryshkov wrote:
...
> [DB: restored top->ops.setup_vsync_source call]
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Maybe these need to be flipped so that your S-o-B sits directly after the [DB:]
modification comment.  Just a nit either way.

- Marijn

