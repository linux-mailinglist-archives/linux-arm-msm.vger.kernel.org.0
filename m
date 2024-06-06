Return-Path: <linux-arm-msm+bounces-21951-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4588FEE2F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 16:43:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD6291F22EB8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 14:43:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E6D719596F;
	Thu,  6 Jun 2024 14:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="r7BAfZHj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A21C1991A9;
	Thu,  6 Jun 2024 14:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717683619; cv=none; b=BnupJWR8bM8AzexLAovjT6U2QQhlx628hJpjVHY+BSGyv65DgpQWpPnYAtk9tunRe6bENdMl/NpSrym9c0aNPBDX/wNmmp0mB4rBt0Fm5WtJQNBdYmXNaLzlDnljMtfFDX3Ta7+T4dseuenT+PMGLy+5wyotlwOiYboaaFlw4Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717683619; c=relaxed/simple;
	bh=zl8eenjF8axi0TjToHHC1WFVOpk/lRB+7SvAzh0uTpk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gI9GLm1ERrgCLlyuh/2YEnw8HKUegazZ5EPfByvnTHQtMGh509qKiyzWfvUzfSbBvuBSToXWvi4quDQo8DsMOQvg6GaokcjdBkTnjTVHSmsGcPm9zcBObF80cfzi/EAo4nJwi/BL6I+bXDPCSkRgpSgwMc6Fe+g1fkd2Ujf5cAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=r7BAfZHj; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1717683616;
	bh=zl8eenjF8axi0TjToHHC1WFVOpk/lRB+7SvAzh0uTpk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=r7BAfZHjzt3EsaNP6MIavVp790kypBU38mJ6+ADpd+btQibB6Ivdao/TenF73zSeC
	 RrziFWUMzKhIgAzAqqiproCPJXyMEs7JxHxIt9gXlZIp0AwtSUIcV1DT4q4hMpk2wl
	 3AhfBSHW+PbdUU7SoiJIVZ/m+Z2Ijpeu29/X1d67O/AyyCTofghKm41nQBofqBQnV6
	 OAjWKwEA7Sk4HOmkkVhMV87oOzpMrrihT9CZLqC5RhgoTv89A0KP2mTJyv5kVy0yD7
	 jr2tEiQRsQPaAgCahTXBK5W1I080C3DAcrejYPrW+xlN4wbMiyxmRNw5f5A7WDSlNb
	 6J6hgbnSto7CA==
Received: from [100.95.196.25] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: koike)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id AC6D737821DF;
	Thu,  6 Jun 2024 14:20:09 +0000 (UTC)
Message-ID: <06547f0b-3512-4194-b9ff-22710cb203b6@collabora.com>
Date: Thu, 6 Jun 2024 11:20:06 -0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] drm/ci: uprev IGT
To: Vignesh Raman <vignesh.raman@collabora.com>,
 dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, airlied@gmail.com, daniel@ffwll.ch,
 robdclark@gmail.com, david.heidelberg@collabora.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 dmitry.baryshkov@linaro.org, mcanal@igalia.com,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-rockchip@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
References: <20240529024049.356327-1-vignesh.raman@collabora.com>
 <20240529024049.356327-5-vignesh.raman@collabora.com>
Content-Language: en-US
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <20240529024049.356327-5-vignesh.raman@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 28/05/2024 23:40, Vignesh Raman wrote:
> test-list.txt and test-list-full.txt are not generated for
> cross-builds and they are required by drm-ci for testing
> arm32 targets. This is fixed in igt-gpu-tools. So uprev
> IGT to include the commit which fixes this issue. Also
> disable building xe driver tests for non-intel platforms.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>

Acked-by: Helen Koike <helen.koike@collabora.com>


> ---
> 
> v2:
>    - Split IGT uprev to seperate patch.
> 
> v3:
>    - No changes.
> 
> ---
>   drivers/gpu/drm/ci/build-igt.sh  | 4 ++++
>   drivers/gpu/drm/ci/gitlab-ci.yml | 2 +-
>   2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/ci/build-igt.sh b/drivers/gpu/drm/ci/build-igt.sh
> index b7d2a49a6db3..eddb5f782a5e 100644
> --- a/drivers/gpu/drm/ci/build-igt.sh
> +++ b/drivers/gpu/drm/ci/build-igt.sh
> @@ -45,6 +45,10 @@ MESON_OPTIONS="-Doverlay=disabled                    \
>                  -Dlibunwind=enabled                   \
>                  -Dprefix=/igt"
>   
> +if [[ "$KERNEL_ARCH" = "arm64" ]] || [[ "$KERNEL_ARCH" = "arm" ]]; then
> +    MESON_OPTIONS="$MESON_OPTIONS -Dxe_driver=disabled"
> +fi
> +
>   mkdir -p /igt
>   meson build $MESON_OPTIONS $EXTRA_MESON_ARGS
>   ninja -C build -j${FDO_CI_CONCURRENT:-4} || ninja -C build -j 1
> diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
> index 8f32de63d92e..1b29c3b6406b 100644
> --- a/drivers/gpu/drm/ci/gitlab-ci.yml
> +++ b/drivers/gpu/drm/ci/gitlab-ci.yml
> @@ -5,7 +5,7 @@ variables:
>     UPSTREAM_REPO: git://anongit.freedesktop.org/drm/drm
>     TARGET_BRANCH: drm-next
>   
> -  IGT_VERSION: d2af13d9f5be5ce23d996e4afd3e45990f5ab977
> +  IGT_VERSION: 0df7b9b97f9da0e364f5ee30fe331004b8c86b56
>   
>     DEQP_RUNNER_GIT_URL: https://gitlab.freedesktop.org/anholt/deqp-runner.git
>     DEQP_RUNNER_GIT_TAG: v0.15.0

