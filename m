Return-Path: <linux-arm-msm+bounces-11703-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B94A85A650
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Feb 2024 15:48:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DB746B22CCA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Feb 2024 14:47:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B7C521115;
	Mon, 19 Feb 2024 14:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="cySjdgUM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94CE01DFC5
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Feb 2024 14:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708354077; cv=none; b=c4RBFJnjKJUUt0P9humNVYUnUoP+G8cabGXPBOflMhgebP+0wpQ+O5fBLmcsBmus1I8JSgdPmS55AI16ZIKa35Oyby+SL2xcPbu9rOUrmMSxy+u+TyrQE4HSzSey9Q0QUkejOUihXrD+Ut6aMNM3AdrblVOVU4Xjt0rqleAIAns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708354077; c=relaxed/simple;
	bh=Hmaa3EnGuZHGu+zcLLz2TFZJ80IkfVjQgChNdwVLing=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bj4ss05Vp31tJZULnQLd6zsO8ZbDJJYIi4emQyE2xdsJWG0vP5+v9kHD7Sqe1qAST4Sj6ycyznWg7ZSryDMhgWTuQbfgFZG984/sev5TVuqYnmYt+k5piBm3QJyK7ajfiH5tnXEpBtAq2dTgRRZhqzLYpSJgoQ/vFoKu3LFIW40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=cySjdgUM; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1708354073;
	bh=Hmaa3EnGuZHGu+zcLLz2TFZJ80IkfVjQgChNdwVLing=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cySjdgUMOZU1spJTIjh+5efu6dmrO8TTGqpBPmqIWEVQYjEPb7FfEcYjhncdh4Hd/
	 PHC5vKTSPY6bYYz8inSiKC406aC8sMptI5oaaJ31JTtGLsqqrtbN97Tg+8yFnmA1wp
	 0hT+YIh8aLk6BI+hmuz+qj1eDV1Jn3mRCPfMIJ5pGSYCb1dPA4eC5BVvbwMDl94f9j
	 nY6UGpfj75h2aUO1ZkIWMMMBn2CkhNXn//HZ6saLiaGy9UNq8gJCVDoNeZ+2QBk4oG
	 ZwTeUQXHxsO//ri48GHhU3KrOSMcThTe0XuEFwH/GwMd+KbIebRBiuS/ckTZDXKI/Q
	 WRDv62oZcrhdA==
Received: from [100.66.96.193] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id DCF4237820C3;
	Mon, 19 Feb 2024 14:47:50 +0000 (UTC)
Message-ID: <0a120b86-702a-8dd2-9554-e1ccda7cee62@collabora.com>
Date: Mon, 19 Feb 2024 20:17:44 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] drm/ci: skip suspend tests for both msm-sc7180 machines
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Helen Koike <helen.koike@collabora.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
References: <20240216205650.2446153-1-dmitry.baryshkov@linaro.org>
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <20240216205650.2446153-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 17/02/24 02:26, Dmitry Baryshkov wrote:
> The commit ea489a3d983b ("drm/ci: add sc7180-trogdor-kingoftown")
> dropped the msm-sc7180-skips.txt file, which disabled suspend-to-RAM
> tests. However testing shows that STR tests still can fail. Restore the
> skiplist, applying it to both limozeen and kingoftown machines.
> 
> Fixes: ea489a3d983b ("drm/ci: add sc7180-trogdor-kingoftown")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   .../gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt   | 2 ++
>   .../drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt   | 2 ++
>   2 files changed, 4 insertions(+)
>   create mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt
> 
> diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt
> new file mode 100644
> index 000000000000..327039f70252
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt
> @@ -0,0 +1,2 @@
> +# Suspend to RAM seems to be broken on this machine
> +.*suspend.*
> diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt
> new file mode 100644
> index 000000000000..327039f70252
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt
> @@ -0,0 +1,2 @@
> +# Suspend to RAM seems to be broken on this machine
> +.*suspend.*

Acked-by: Vignesh Raman <vignesh.raman@collabora.com>


