Return-Path: <linux-arm-msm+bounces-39834-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C3C9DFEBE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 11:23:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 61F15B22749
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 10:19:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD37A1FBC9B;
	Mon,  2 Dec 2024 10:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kmhsd5qN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7923A1D8E10;
	Mon,  2 Dec 2024 10:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733134784; cv=none; b=bwNF1wIwTparFVA4FW67ftq8oNezDm/FD4KtLLIjYwmPRVIsGpDHUR+izY3yZ6mvn2i/7+L7wNyoN0ofg9yqq9NBC91E4uhi3+F158SRYuVuX1FSbLBa7MqPkZtB+Wsow910mGMl32ct7a/2yDpp4dMDM7TBO5nEbUb3eZ2AUSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733134784; c=relaxed/simple;
	bh=0nLS4J9qXeFv/L92DDeQg9+azIKURqKYfy9mdnxjm3k=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=SypZiVOmf+BgXxaNwwYA5kuUb0Qp/yR+ZrXk6OHZzxY/Xqfv+aZ2u5jyeI9rqEwIc868edplJPEwHTUXe6MXk/AJZlu74URrT1+p6VnD5kV/I7t9tvTJxjT9Cu83Bo7OaQSwA6BM/A6PbdWnVXLC6OAKE2Ch25IP/sWiyVtO1Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kmhsd5qN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA1B3C4CED1;
	Mon,  2 Dec 2024 10:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733134784;
	bh=0nLS4J9qXeFv/L92DDeQg9+azIKURqKYfy9mdnxjm3k=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=kmhsd5qNP8PjnFw7JW1cgOBNkW9mQLZPH4pXX5/8dwKvqwnJuyfirt1aqyztIlDdV
	 IH1fjkg7XyFypJst+r31tBHNAEr7/qTjDQF2oM/8PA2tPcxtUxuYqdYsN77yJxxDxE
	 D49bbL44XFfS1wbpfVfBn5YTyxG+t99wmK43EiWT1WvygzcP6G28C/zlIKWPnlzfCe
	 zAxLiPTwPN1zh6Klz9GCZ0auLZ+9TcEQ0RsSi8QLjmsaMREjCrwaybirjM8aDu7HJp
	 PiDC4e0R7txSroxQpjqcg7C7CBbHK/g+gMX1VhGs3ZGwVqMxES1G+5DNd4QBX8vEir
	 0VvpMFIv5dbLw==
Message-ID: <77545786331df8bfaf5fdcb309437358@kernel.org>
Date: Mon, 02 Dec 2024 10:19:41 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 00/10] drm/connector: add eld_mutex to protect
 connector->eld
In-Reply-To: <20241201-drm-connector-eld-mutex-v1-0-ba56a6545c03@linaro.org>
References: <20241201-drm-connector-eld-mutex-v1-0-ba56a6545c03@linaro.org>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, "Abhinav
 Kumar" <quic_abhinavk@quicinc.com>, "Alain Volmat" <alain.volmat@foss.st.com>, "Alex
 Deucher" <alexander.deucher@amd.com>, "Alim Akhtar" <alim.akhtar@samsung.com>, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, =?utf-8?b?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, "Dave
 Stevenson" <dave.stevenson@raspberrypi.com>, "David Airlie" <airlied@gmail.com>, "Harry
 Wentland" <harry.wentland@amd.com>, "Inki Dae" <inki.dae@samsung.com>, "Jani
 Nikula" <jani.nikula@linux.intel.com>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Joonas Lahtinen" <joonas.lahtinen@linux.intel.com>, "Krzysztof
 Kozlowski" <krzk@kernel.org>, "Kyungmin Park" <kyungmin.park@samsung.com>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Leo Li" <sunpeng.li@amd.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Marijn Suijten" <marijn.suijten@somainline.org>, "Maxime
 Ripard" <mripard@kernel.org>, =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Phong LE" <ple@baylibre.com>, "Raphael
 Gallais-Pou" <rgallaispou@gmail.com>, "Raspberry Pi Kernel Maintenance" <kernel-list@raspberrypi.com>, "Rob
 Clark" <robdclark@gmail.com>, "Robert Foss" <rfoss@kernel.org>, "Rodrigo
 Siqueira" <Rodrigo.Siqueira@amd.com>, "Rodrigo Vivi" <rodrigo.vivi@intel.com>, "Sean
 Paul" <sean@poorly.run>, "Seung-Woo Kim" <sw0312.kim@samsung.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Zimmermann" <tzimmermann@suse.de>, "Tvrtko
 Ursulin" <tursulin@ursulin.net>, "Xinhui Pan" <Xinhui.Pan@amd.com>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

On Sun, 1 Dec 2024 01:55:17 +0200, Dmitry Baryshkov wrote:
> The connector->eld is accessed by the .get_eld() callback. This access
> can collide with the drm_edid_to_eld() updating the data at the same
> time. Add drm_connector.eld_mutex to protect the data from concurrenct
> access.
> 
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

