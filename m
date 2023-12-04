Return-Path: <linux-arm-msm+bounces-3298-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3CD803691
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 15:27:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0E4AEB2096C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 14:27:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E55F28387;
	Mon,  4 Dec 2023 14:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qeXekkRv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03958249ED
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Dec 2023 14:27:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D024C433C8;
	Mon,  4 Dec 2023 14:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701700048;
	bh=iTFfJWlVyVd40bRiM1AFzumUzQtTXVFumdktfECzhMY=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=qeXekkRv92r8qCLjoELFNMe1SrBuRQi7VtQm4F/WELvSzqVt6BPW1WU8fTcxaMcpE
	 flrCCtiPLkBKHnTRYMZUyEnJh6Ir/rZ65NJ86l9tk9hO7qibzsAnBB1DRD4S4lQgbH
	 cEeQ27eNhvt8eVQeeSy2QAj90Fb3VEIrhybbUCA/Q0tvoK5HalvDSBtWt4PNOHudCN
	 OpBaYZN8bPyueVeyI0Z4En/7+BFib/WfZgSM4E5kCOGraxZcpriMFV5FZYQ3PFAL7R
	 BaXfIo4B2OPuO7eEnbdfoMQS6t0U1puiOMefjUg0JLKF0TTM58Y0Q2bpr6ghAfTaXS
	 PIdFGsoK0Qrag==
Message-ID: <59d4f1e74b4546b9f9eea0fed62a5546@kernel.org>
Date: Mon, 04 Dec 2023 14:27:25 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 0/7] drm: revert solid fill support
In-Reply-To: <20231204131455.19023-1-dmitry.baryshkov@linaro.org>
References: <20231204131455.19023-1-dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, "Abhinav
 Kumar" <quic_abhinavk@quicinc.com>, "Daniel Vetter" <daniel@ffwll.ch>, "David
 Airlie" <airlied@gmail.com>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Rob Clark" <robdclark@gmail.com>, "Sam
 Ravnborg" <sam@ravnborg.org>, "Thierry Reding" <thierry.reding@gmail.com>, "Thomas
 Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

On Mon, 4 Dec 2023 15:13:47 +0200, Dmitry Baryshkov wrote:
> Altough the Solid Fill planes patchset got all reviews and
> acknowledgements, it doesn't fulfill requirements for the new uABI.
> Merging it was a fault of mine.
> 
> It has neither corresponding open-source userspace implementation nor
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

