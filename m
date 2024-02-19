Return-Path: <linux-arm-msm+bounces-11742-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 362B785AD1C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Feb 2024 21:26:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA9961F25F21
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Feb 2024 20:25:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30F1C52F96;
	Mon, 19 Feb 2024 20:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="bCfB3zaI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC14524B1
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Feb 2024 20:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708374358; cv=none; b=pohEhGYOR74UScWJblDyYajOqlffmHc0dtwrOktsP/gCGHn7OifYfppxOw7lxbIUqev6AFQ5BD7dLkkFiZF4Cpz/LszWCyOlMAZcFv8kjTKd+luUX8niPu/nRy0KtP2BUidETwaXMoCkGeARgg3Rw/p6RoD1WSdDVCgBAUwdAZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708374358; c=relaxed/simple;
	bh=vqsWU3WOB4sjA2l3XLi4NnyhHkvwjCNUEm//eGLsems=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XKBvb1TkMV/CFXVg+NJeatShjcSO62o+6XlgieqbxN3r+Uhg3vJeP4PHGoKVAlq11qWgsiSOvFX6v1DKfyR1Sk2AHcqirPZKM7EnPMHXKIE0MaRhLas6YpGo8A8jlc1d70UYKluGUPn6ZGAxU+F59jdoGLH/QlCNdNAuWqeHw2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=bCfB3zaI; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1708374354;
	bh=vqsWU3WOB4sjA2l3XLi4NnyhHkvwjCNUEm//eGLsems=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bCfB3zaI7v3YWH1wFD8uhQNGQvA/sR/qgP7t67HvHzDus+44sOlifiKwnTVj1+yWs
	 slZUUcTR0Hf31Qz02fyukAAZSOfn7tUqUuwNg5+51fEeC6/PdnzEIt5qqtierW7sfE
	 0566etSq+JnOU1nWy+59AXHVPWJR+Noh1a2K0YLXHB2T6+wAA7OTnWQsHK6SH/oSWr
	 kn6v6qWSNioK70XO5NZ6w11G+ST09iGWWf9lRfLSFQ1FX/GcFvn+mtbwpEu6WZ0jgf
	 vY6P7sYA/nQgN5s3KV/W2U+QrhVzwvk8l9Jz1FaEcb80mgmMvF4vc09U7Qe3Xg4txP
	 Hn8ppQ7GkUl5A==
Received: from [100.95.196.25] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: koike)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 06AD83782085;
	Mon, 19 Feb 2024 20:25:50 +0000 (UTC)
Message-ID: <dc9872dc-c51a-4f8b-8963-9f92e43c7246@collabora.com>
Date: Mon, 19 Feb 2024 17:25:50 -0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/ci: mark universal-plane-sanity as failing on
 SC7180
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
References: <20240218041204.2522828-1-dmitry.baryshkov@linaro.org>
 <20240218041204.2522828-3-dmitry.baryshkov@linaro.org>
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <20240218041204.2522828-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 18/02/2024 01:12, Dmitry Baryshkov wrote:
> The test kms_universal_plane@universal-plane-sanity fails on both SC7180
> platforms. The drm/msm returns -ERANGE as it can not handle passet
> scaling range, however the test is not ready to handle that. Mark the
> test as failing until it is fixed.
> 
> ERROR - Igt error: (kms_universal_plane:1554) CRITICAL: Test assertion failure function sanity_test_pipe, file ../tests/kms_universal_plane.c:438:
> ERROR - Igt error: (kms_universal_plane:1554) CRITICAL: Failed assertion: drmModeSetPlane(data->drm_fd, primary->drm_plane->plane_id, output->config.crtc->crtc_id, test.oversized_fb.fb_id, 0, 0, 0, mode->hdisplay + 100, mode->vdisplay + 100, IGT_FIXED(0,0), IGT_FIXED(0,0), IGT_FIXED(mode->hdisplay,0), IGT_FIXED(mode->vdisplay,0)) == expect
> ERROR - Igt error: (kms_universal_plane:1554) CRITICAL: Last errno: 34, Numerical result out of range
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Acked-by: Helen Koike <helen.koike@collabora.com>

> ---
>   .../gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt    | 1 +
>   .../drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt    | 1 +
>   2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
> index 7e4d8744fcc6..f0576aa629e8 100644
> --- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
> +++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
> @@ -15,3 +15,4 @@ kms_plane_alpha_blend@alpha-7efc,Fail
>   kms_plane_alpha_blend@coverage-7efc,Fail
>   kms_plane_alpha_blend@coverage-vs-premult-vs-constant,Fail
>   kms_rmfb@close-fd,Fail
> +kms_universal_plane@universal-plane-sanity,Fail
> diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
> index 7e4d8744fcc6..f0576aa629e8 100644
> --- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
> +++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
> @@ -15,3 +15,4 @@ kms_plane_alpha_blend@alpha-7efc,Fail
>   kms_plane_alpha_blend@coverage-7efc,Fail
>   kms_plane_alpha_blend@coverage-vs-premult-vs-constant,Fail
>   kms_rmfb@close-fd,Fail
> +kms_universal_plane@universal-plane-sanity,Fail

