Return-Path: <linux-arm-msm+bounces-66774-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49019B12D3D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Jul 2025 02:49:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7FCB34A0DD8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Jul 2025 00:49:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88D511DA55;
	Sun, 27 Jul 2025 00:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="j2vuk7+G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A9F182;
	Sun, 27 Jul 2025 00:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753577391; cv=none; b=p25zf5l5Lln1yqC8ZRk/Zb31jHo1T7A+Tq3QZIP8KObLe8zR156+lbBmk5iWDPsVEqWcc3na77RW9cSZ/K5tMzFErP9lmRTk05H/sAvP81KvXrgZ8FUeEKJ/Qlhp44M7+NoWF5DUuuPDFl5h2nP2YnOFivfrrNxhCvwp4vPRGsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753577391; c=relaxed/simple;
	bh=a53d9aoObtRCbPa9u0Apg6/R/vHkZ8x0X/h8IvjYC20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kwHNNaKKmqNaUGQvtb2jLsiPRFfVGl+iJIuIKo/Z4094ZQdau44vfTJXxsGwR3Z0VUYeXCM6BMEuHLQB2PUKEcz55WCbGca/xe/2QlHYL9gG14vlTjJiLVXdeH3OA6L76o4j4KrdMjpWwoWi5tuWUSTaynFAi5P838tDZxIyiAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=j2vuk7+G; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4bqNKv45Bdz9sp0;
	Sun, 27 Jul 2025 02:49:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1753577379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=a53d9aoObtRCbPa9u0Apg6/R/vHkZ8x0X/h8IvjYC20=;
	b=j2vuk7+GWuCAFVpKwcj3x3aDvD4pPz5yXqelaXlmCp6BaLoqTjHz3oCMaS51zq9PGpiUXZ
	8hAg2JYYbi2ucuT5MMHxLAOfqqb+QvHJS5ZWgsq4SsP5zzxszpAZ/Q3b8u4ZnMvu+6uuKb
	gMUDQEiR5hOgGrsgW4WVkyPFzzpTJtJqxxCY/K6m+P4NgJVAXMV4KlOatdAvPx8kJh0cyk
	OXIBQ7yUXGpy3JI4BH6112sstA0NFtEze7Z+cETIPtXe/hvmUhlkM6zRhPzCLgWVHUW5oH
	H91zhuesb1FrFvf0nhH5diKJ3+rzC4X3HHpL5gyjCExIvWqCR2C2KhrqJOv1oQ==
Date: Sun, 27 Jul 2025 02:49:35 +0200
From: Anthony Ruhier <aruhier@mailbox.org>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 17/17] drm/msm/adreno: Relax devfreq tunings
Message-ID: <acawiyjobxkmvgmjcr6ct6lkkoom66q6tn25wyrsqusq2hh2hq@t5di44stzbp2>
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-17-9347aa5bcbd6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250720-ifpc-support-v1-17-9347aa5bcbd6@oss.qualcomm.com>
X-MBO-RS-META: ez5yztpbkr5h39tq1gyjgfyzemm7pyy9
X-MBO-RS-ID: 9ce0f1739a2f2abe88e

Tested-by: Anthony Ruhier <aruhier@mailbox.org>

Thanks for this patch series! I tested in on the Yoga Slim 7x, it works well on
my setup beside this specific patch. On Hyprland, it makes the animations
stuttery (in particular workspace changes, which are by default similar to
Gnome's).

Dropping this patch fixes this problem.

Thanks,

--
Anthony Ruhier

