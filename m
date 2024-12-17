Return-Path: <linux-arm-msm+bounces-42584-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C879F52A8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 18:21:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1AC7C1882928
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 17:18:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 648311F75B5;
	Tue, 17 Dec 2024 17:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yizxq0fy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE4A1F63D5;
	Tue, 17 Dec 2024 17:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734455865; cv=none; b=lG/Bv9hC4kgyluDjQSeJYEtufgvMXMRdMEXeTLzz6OSvET1xF42OMtpPIZn0LYdSW8egac5w14YzvV6DM7a4ecs9tgg+EhjgTQeS2ppRwMFUpYZQGrQftqj5/wfWfjdKU+qnr8dYZ+zECWrIfaS96AQiBidcyPLG8hnUu2uKU+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734455865; c=relaxed/simple;
	bh=Cmwm3m/rW7SiHNy9IHnh01I5x+FOBVJH8AyaTu6Ie7g=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=kwAaTv+XvgCAOqUUwoYzkn2/HJ/PU28bFW8U+PZI707DkPrPhyHHFh2EXVU8/p318UvqSEjvqJZC3h4J2Hte6q7/erTJKBcIs+RqTR/dc6Y8BU0ULpmlfmTv8hmJylDxwsGaU9CxZNHUxJpdLM2r+SMPmLljExc12s1Prp46YSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yizxq0fy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1CD8C4CED7;
	Tue, 17 Dec 2024 17:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734455865;
	bh=Cmwm3m/rW7SiHNy9IHnh01I5x+FOBVJH8AyaTu6Ie7g=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=Yizxq0fyZcbV143u6z50pim2sGhxdlOmHURR0Uejxw8VRWCRAkaDoikW071P+oykV
	 /OIB2xoEWoQouNKEEprR7DxvX8jWigtVsUqRGA+AaRgZcT81zDUzgAGkfpuN3HXqEi
	 X522E4feKZFJkMTtWZh0D8Du5Z0/rJ2YhvuZKBmKLM1V4kTX4BEDZxFt1PRGHNDRB2
	 bIo3i0MWb28RUjkhSPsDL/fzMQPx3LgYnDIl8bminr645owO7+KOxJIbRrfCHlGwwk
	 SIJiw2IXyNtELlD98xXiAs/FURfzHfgmWFjxXPMEQxOKPdjr+GnGEx+RYseYhe5xNS
	 Ft6ZzIukQBEaQ==
Message-ID: <76a2c89359a5a2177cddf8e1449016d9@kernel.org>
Date: Tue, 17 Dec 2024 17:17:42 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Jessica Zhang" <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH v4 03/25] drm: Add valid clones check
In-Reply-To: <20241216-concurrent-wb-v4-3-fe220297a7f0@quicinc.com>
References: <20241216-concurrent-wb-v4-3-fe220297a7f0@quicinc.com>
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

On Mon, 16 Dec 2024 16:43:14 -0800, Jessica Zhang wrote:
> Check that all encoders attached to a given CRTC are valid
> possible_clones of each other.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

