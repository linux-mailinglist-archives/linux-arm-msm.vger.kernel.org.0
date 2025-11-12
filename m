Return-Path: <linux-arm-msm+bounces-81400-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD1DC5212F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 12:49:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 510604E9151
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 11:37:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AE793115B8;
	Wed, 12 Nov 2025 11:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rTSplVLt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1022F3621;
	Wed, 12 Nov 2025 11:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762947432; cv=none; b=VzqS6O71Rmx6ZA1RIu0PZ7pzmpk/GKlkjIvNJSvh2yTACHUyX2jhloTeA2sIkP7GpIpy9gcBa8u975LwNXtQ4DjnqC0b0jkVOV0V7g6b485IhjotMSeteUsHnyGn56ycGzzx6xcJjyji/QDJEvNcB0tZPhPFt7LEU+jdc6jZUZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762947432; c=relaxed/simple;
	bh=ymCfGk4AxYo4bd74CdMZkB02vK66A3ulrQ4KUB+F6wg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nLqXeYT514ejVpZ612oF87jTXXCO1Nqv2fZwGN+kx1hvxAqXSCk9kj3tX9rvl5uzbbo4MmQNvPkBeogA87bLR1VPaLH7JdRhHxXgx0tt/xLde2ems6wZvhj2u8n4U1mF7cmy4ST96iA8maYHwD7zY+6u2P8Bbj/GUdwiP1ORPfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rTSplVLt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F73FC4CEF7;
	Wed, 12 Nov 2025 11:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762947431;
	bh=ymCfGk4AxYo4bd74CdMZkB02vK66A3ulrQ4KUB+F6wg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rTSplVLtdX0NamxtioaiuZdXlSof29fiiG/qEJXf4CmgfrBTyY3YX83kegMriynp3
	 ySuGL3f+j0DNkWzNw41Y9kCgUIS40koqYfyVR0RLTPrrdu7KQbmnPRWbKYszw2XoM3
	 SuHNK5rm2jQtC4uZuR+ZaFt/F+QOHm2QrEArvluLwMkKaqMGtKxVdaH7jJ2EaG1uiO
	 HkHAfjqY7BM/NrEs+7wOl0+gooulTesZq1Dd3OGeQ3bDNhImQsHVVE3PX149JkAPD9
	 cdG6chGChJsLGrjmhkMtyyTnaZ6ZQHR8t15pQYTmgSEEnX8YTEU/sjWuGYucusqsU/
	 wOcDm//eAQOZQ==
Date: Wed, 12 Nov 2025 17:07:08 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, Miaoqian Lin <linmq006@gmail.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH] slimbus: ngd: Fix reference count leak in
 qcom_slim_ngd_notify_slaves
Message-ID: <aRRxZCWCWMFD23b4@vaman>
References: <20251027060601.33228-1-linmq006@gmail.com>
 <176292442599.64339.7709313480733902465.b4-ty@kernel.org>
 <7eed86f6-97a9-487a-8161-3617597f7391@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7eed86f6-97a9-487a-8161-3617597f7391@oss.qualcomm.com>

On 12-11-25, 10:09, Srinivas Kandagatla wrote:
> 
> 
> On 11/12/25 5:13 AM, Vinod Koul wrote:
> > 
> > On Mon, 27 Oct 2025 14:06:01 +0800, Miaoqian Lin wrote:
> >> The function qcom_slim_ngd_notify_slaves() calls of_slim_get_device() which
> >> internally uses device_find_child() to obtain a device reference.
> >> According to the device_find_child() documentation,
> >> the caller must drop the reference with put_device() after use.
> >>
> >> Found via static analysis and this is similar to commit 4e65bda8273c
> >> ("ASoC: wcd934x: fix error handling in wcd934x_codec_parse_data()")
> >>
> >> [...]
> > 
> > Applied, thanks!
> 
> These are slimbus patches? any reason why they are going via soundwire tree?

My mistake, sorry :-( dropped now

-- 
~Vinod

