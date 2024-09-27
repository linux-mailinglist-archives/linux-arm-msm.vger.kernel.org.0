Return-Path: <linux-arm-msm+bounces-32644-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFF5987FB1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Sep 2024 09:46:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2165A28483B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Sep 2024 07:46:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEB1E17BB25;
	Fri, 27 Sep 2024 07:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IloIFCHQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB761167D80;
	Fri, 27 Sep 2024 07:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727423154; cv=none; b=mkMkYZjLsJLR00sov+Xkyad0vvIZjpRvb8DAEnBDaZS3gfuMrytF1BV4C3JbsrDh+ehzpGG5JJdHxifukYLVldQv7yXkJuscYhhYjS7jZa81M8oKg3QkStRMryget9glv9bKDyCHVybhHixzl6LRGYOtn3Np4k597NHkv2vRhmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727423154; c=relaxed/simple;
	bh=muHlqJ7iEOLfJfdfnWfRQ+Z4rZB4TQDLw6WtJrxW/FY=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=A/bg8hw1hKGS4XhKYhFdotOj2JIaOct7DbBwxp4zZYB4jqLf5CXl2wTRnZRY0/dhDsFNt3hANXzj+T0+gVkLRmrEt81OjcGXMPFCWidFHxI4GpuQTI1UbNcGP230q0dSyDAVXMWPMswLrHPCH3cRndX8JhJAIxNy+Y73/Ytsnm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IloIFCHQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9D42C4CEC7;
	Fri, 27 Sep 2024 07:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727423154;
	bh=muHlqJ7iEOLfJfdfnWfRQ+Z4rZB4TQDLw6WtJrxW/FY=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=IloIFCHQVPrmcLnhS3Iihmfb/Rcd24BcaORt9mlaW+c37RrYEgtgRNkITVY51uovw
	 bl5kjuT3ljwQiEQHrZVjBP7+Vx0RUkuMDqg1oDhtTGroKD/xCIr22LVQhMB1yuP68s
	 SZSI/1KRueCUqGo7kSSWyUcJMEw/wZu2wEIvkUkZEUo2ZNmxktazbBQfpOZU+EugIm
	 8h/BPS2wdxXpxWRGlJ5UvYdO5vqB74ndbB/67+qxPXVd+cprGszrfx145c0svxxFqg
	 whyEQjU8IM1LLGgb68qfvB7beaP5QcLEDjE9vM5e3EvC/a/WFLOOkD/DkrWkMA/cLn
	 oFcajaknfB5fg==
Message-ID: <545585e6f2e9d0bbe35f0a2785838cfa@kernel.org>
Date: Fri, 27 Sep 2024 07:45:51 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Vignesh Raman" <vignesh.raman@collabora.com>
Subject: Re: [PATCH v3] docs/gpu: ci: update flake tests requirements
In-Reply-To: <20240927052416.1833889-1-vignesh.raman@collabora.com>
References: <20240927052416.1833889-1-vignesh.raman@collabora.com>
Cc: airlied@gmail.com, amd-gfx@lists.freedesktop.org, daniel@ffwll.ch, daniels@collabora.com, deborah.brouwer@collabora.com, dmitry.baryshkov@linaro.org, dri-devel@lists.freedesktop.org, guilherme.gallo@collabora.com, helen.koike@collabora.com, intel-gfx@lists.freedesktop.org, linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, mripard@kernel.org, quic_abhinavk@quicinc.com, robdclark@gmail.com, rodrigo.vivi@intel.com, sergi.blanch.torne@collabora.com, virtualization@lists.linux.dev, "Maxime
 Ripard" <mripard@kernel.org>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

On Fri, 27 Sep 2024 10:54:14 +0530, Vignesh Raman wrote:
> Update the documentation to specify linking to a relevant GitLab
> issue or email report for each new flake entry. Added specific
> GitLab issue urls for i915, msm and amdgpu driver.
> 
> Acked-by: Abhinav Kumar <quic_abhinavk@quicinc.com> # msm
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

