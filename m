Return-Path: <linux-arm-msm+bounces-55865-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6C7A9E9F0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 09:49:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB2213A73AE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 07:47:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AE6E1E1E04;
	Mon, 28 Apr 2025 07:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hddJxAKF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B961DE8BE;
	Mon, 28 Apr 2025 07:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745826324; cv=none; b=tR5n2ZFmwG3s6WbINeSYAASh/55xoZb54tKIvGWbYJ6RCKUv3gsPN1y/oyrRkLjWEiT2xTOkZJNGx5zy59lqefFO55ZhIxzRtTq7+Vc6bhyQeSyKjVu8LhD0Dn1AkPdkFAxlNKXjLCa87QwRPC8RTvemdz9g9RtX6QxPESn6CUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745826324; c=relaxed/simple;
	bh=t0Da91DWrbzujPj1g6eKoWgpJ0WoF4h007/WWJU4frk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l5YNIforn1TsV1mg0Q0azQfa0Z8oYyVSwyjHEFMy3RjYQJi8YECmZHSpJ1R0i1Isqou7+uHSI14rqjH48LfFQgxDfIjEnmF+uksQTqXHCYOMZvk9BxcXXOhO1C+8EvayMEBXpC7J71DL9TMQz+yB8paPQ2ra875U9pnlswLiOqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hddJxAKF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4B8FC4CEE4;
	Mon, 28 Apr 2025 07:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745826323;
	bh=t0Da91DWrbzujPj1g6eKoWgpJ0WoF4h007/WWJU4frk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hddJxAKFJISn2zWBvXWpe1bcwMG1Bww03EhSUYat2xtGuVjmbgrwIntzPhyCCrgiS
	 cYmxEfK2NNIHTvDlr2qg1U1Jk2rWeSJXf70ViBJ88dsFGuSFapG8lwRwuX7HXVTr89
	 7TXSJB5eyt3X7uOQpQkJzmjY7/JtFQBgkvWc9kmPZEGxhkGEWvu3vG67vRokCrQkaC
	 b5wDioRo90sKLnMQVxcRwqSbEvTniIb6etAYizIV6WPW5W/Oo03Fr7bOJM4xECu6vW
	 es9P4uj9BUYolIcqqxSnPLFkWMR5hynxvveh71EjF2NDMcld/6VQc4UQ47ZuHF4Mrf
	 G+KKVTDXJRZQQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1u9JB6-000000004zK-0H1W;
	Mon, 28 Apr 2025 09:45:24 +0200
Date: Mon, 28 Apr 2025 09:45:24 +0200
From: Johan Hovold <johan@kernel.org>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	laurentiu.tudor1@dell.com, abel.vesa@linaro.org
Subject: Re: drm/msm/dp: Introduce link training per-segment for LTTPRs
Message-ID: <aA8yFI2Bvm-lFJTl@hovoldconsulting.com>
References: <20250417021349.148911-1-alex.vinarskis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417021349.148911-1-alex.vinarskis@gmail.com>

On Thu, Apr 17, 2025 at 04:10:31AM +0200, Aleksandrs Vinarskis wrote:
> Recently added Initial LTTPR support in msm/dp has configured LTTPR(s)
> to non-transparent mode to enable video output on X1E-based devices
> that come with LTTPR on the motherboards. However, video would not work
> if additional LTTPR(s) are present between sink and source, which is
> the case for USB Type-C docks (eg. Dell WD19TB/WD22TB4), and at least
> some universal Thunderbolt/USB Type-C monitors (eg. Dell U2725QE).

Does this mean that the incomplete LTTPR support in 6.15-rc1 broke
adapters or docks with retimers in transparent mode?

You describe at least one of this patches as a fix but I'm not seeing
any Fixes tags or indication that these need to go into 6.15-rc to fix
a regression.

> Changes in v3:
> - Split 1st patch into 3
> - Simplified handling of max_lttpr_lanes/max_lttpr_rate
> - Moved lttpr_common_caps to msm_dp_link (not msm_dp_panel, as LTTPRs
>   are link related, not panel related)
> - Picked Stefan's T-b tag (last patch only, as 1st one is getting split)
> - Droped Abel's R-b tags from 1st patch that got split due to high diff
> - Fixed alignment issues, initialization of variables, debug prints
> - Moved lttpr_count to avoid ugly pointer
> - Link to v2: https://lore.kernel.org/all/20250311234109.136510-1-alex.vinarskis@gmail.com/

I tested v2 due to the dependencies in msm-next and DP altmode still
works on my X13s and T14s (while not using any docks):

Tested-by: Johan Hovold <johan+linaro@kernel.org>

> Aleksandrs Vinarskis (4):
>   drm/msm/dp: Fix support of LTTPR initialization
>   drm/msm/dp: Account for LTTPRs capabilities
>   drm/msm/dp: Prepare for link training per-segment for LTTPRs
>   drm/msm/dp: Introduce link training per-segment for LTTPRs

Johan

