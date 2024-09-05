Return-Path: <linux-arm-msm+bounces-30856-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E7196D0B8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 09:48:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8479CB24E4E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 07:48:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2ABA193070;
	Thu,  5 Sep 2024 07:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vExL71mT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88038189506;
	Thu,  5 Sep 2024 07:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725522479; cv=none; b=XGHExHIHnm/wTghWTGQY1ApiwNMnTFdYniVOpeP13tHqfGUpNVPnkvwbzCZkvjSCJ494UbWfeJJWEsvuSXTutxqQ6wFEFSEk6ggPnuT8fUM5R6pjkBvAk6CBJhc618x6B5h01K0QVrz3RhB4M7i6+f575ihwjnr0YWS+SV8OUss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725522479; c=relaxed/simple;
	bh=k1A18bSItXyIZjz9DAyh4l9IJuamFYFuOFgUucR/180=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LFnmaUOglUNPbYemvN4aC6fhkXfeHUIQ4DiDGau9zH+IkXmnX3+3X2/EYLHHbzfK8Hq1oVfFmSVXsKYvXQih1WAoOV7qEFwHZ6fGivINktexQsz+GRJTDggqhXGchsExjLcwDgfZfD0ecbOXic5k7+BNlukXuf5mXZQzYnLURXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vExL71mT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17337C4CEC6;
	Thu,  5 Sep 2024 07:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725522479;
	bh=k1A18bSItXyIZjz9DAyh4l9IJuamFYFuOFgUucR/180=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vExL71mTerT7I7xz/5v1SVflbH9olWp560pi+0+leE5p1zeFtilW/1CEsEiY1mCXr
	 5d399itNVtNKNziG/70I46CgyQUHc22/VfaVcDubaodmlIDnSXyAyKQoj/naVwvDt3
	 YE9qPUB0uoKDC/7X5/oSIIEOdEIfhNHEhSfFcZpZi9LbgQMu/u/6tabY+19gFQDtUP
	 WM8auwPCk1kXVwCmuZAmzG7AxF1CJtiUJoS4KcqiKy0RE4TverJG52yCDG3MJK1Ssy
	 DM0ItZ4aZ0iGLMrjAKHyT8H8ItFCfVFR4/rYruOXTA52UE02PTZ/jgBPrlUrIuGcqB
	 ImBO+hCBhC5HQ==
From: Maxime Ripard <mripard@kernel.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 0/2] drm: add two missing DRM_DISPLAY_DSC_HELPER selects
Date: Thu,  5 Sep 2024 09:47:55 +0200
Message-ID: <172552245933.2905944.14392896379200688443.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240905-fix-dsc-helpers-v1-0-3ae4b5900f89@linaro.org>
References: <20240905-fix-dsc-helpers-v1-0-3ae4b5900f89@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 05 Sep 2024 06:08:20 +0300, Dmitry Baryshkov wrote:
> Add two selects for DRM_DISPLAY_DSC_HELPER which got missed in the
> original commit ca097d4d94d8 ("drm/display: split DSC helpers from DP
> helpers") and were later reported by LKP.
> 
> 

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime

