Return-Path: <linux-arm-msm+bounces-42582-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD389F526D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 18:19:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ADC231652F8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 17:17:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F249F13DBB6;
	Tue, 17 Dec 2024 17:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h/Rk5cr7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4531F76B1;
	Tue, 17 Dec 2024 17:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734455797; cv=none; b=seMwgzKdMaS7cR6TIxWGcXpEiUvpioE9wt9OSdLL5mx8zMnjZvMDWxuNlxIHI66KPS7oQNelmYnTOjLgbN2iMQJDtu1R4sKRmovmPE5ZQ2uqCxdQzKh5e20raLpZ21V3vZ3jGi6sks+SpXXYR/09gJy1tJ6DLNGObbhaFm0Jxy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734455797; c=relaxed/simple;
	bh=mALeudlsz4tffkWUerdlBg3NdDAP0x7MdgTaQvMmqbg=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=gH9NI2SrhwhPx+YqBhmnlkKLqATcmet05D4oZPmIFrm19BpiVTcrJQeU8e+cNAGpZFd46vjoBZOM5FKi74GnLFseNwj420OSLSgh6io5SEeS62steQK8Cr2BXZUYaH6wptTun+XXQb09g1BKE48Xe4ueLz/p6CRHGbLUKMAcnXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h/Rk5cr7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 091D7C4CEDD;
	Tue, 17 Dec 2024 17:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734455797;
	bh=mALeudlsz4tffkWUerdlBg3NdDAP0x7MdgTaQvMmqbg=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=h/Rk5cr7NWBk4BGvrUY/Pz6jXQkhT6ZT6iM7rxav2vLeqobPJTZNG2MK0U4kI8OfN
	 kt5AV7A6swzUFZ1Ji4Zk7/M8yGUFHDYENdfVcT/rammZklLlxisWRh1uVurzzIX2Vl
	 gKUUh3H17ue1Q8ilf5HOU8p18NKDJlc1AC0cR6iW3p/go844hZqK6fepR7D5jb71tg
	 x5dOXqkZ9JjWfLLYMQ5M0/AlE4BWT0rPOXgYOuQNa0GPsOfWcMgd/FD4liN6dOnkNY
	 NcfPBIJQD6YcwaKMiHlr5MJGuPEHoIkJEVNJ6g41jc5tBLz7j8UIfpHBXV+yEPva2j
	 gPHt4GK62yB8Q==
Message-ID: <de77731bc192ae3d8d2cd184f076619c@kernel.org>
Date: Tue, 17 Dec 2024 17:16:35 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Jessica Zhang" <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH v4 01/25] drm: add clone mode check for CRTC
In-Reply-To: <20241216-concurrent-wb-v4-1-fe220297a7f0@quicinc.com>
References: <20241216-concurrent-wb-v4-1-fe220297a7f0@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, quic_abhinavk@quicinc.com, quic_ebharadw@quicinc.com, DavidAirlie <airlied@gmail.com>, "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>, JessicaZhang <quic_jesszhan@quicinc.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Marijn Suijten" <marijn.suijten@somainline.org>, "Maxime
 Ripard" <mripard@kernel.org>, "Rob Clark" <robdclark@chromium.org>, "Rob
 Clark" <robdclark@gmail.com>, "Sean Paul" <sean@poorly.run>, "Simona Vetter" <simona.vetter@ffwll.ch>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Zimmermann" <tzimmermann@suse.de>,
 =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

On Mon, 16 Dec 2024 16:43:12 -0800, Jessica Zhang wrote:
> Add a common helper to check if the given CRTC state is in clone mode.
> This can be used by drivers to help detect if a CRTC is being shared by
> multiple encoders
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

