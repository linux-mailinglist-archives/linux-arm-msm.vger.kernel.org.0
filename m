Return-Path: <linux-arm-msm+bounces-11001-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4D1854A87
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 14:31:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E26C428DCFE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 13:31:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADE045472A;
	Wed, 14 Feb 2024 13:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="fwcGPp+r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DBA654BC7
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Feb 2024 13:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707917468; cv=none; b=qo2oHuViPWUL+riah+S/nMIrUQs9ZZRsKrorQKtIXBZupgU5aU103hJRGD+/0wYghIfBJDsvLiS43fS6ShJK/4neLMdP813yZbON7G2vYamZvSa+QmtnJPSuSc2S+9TVkCgSaZT95PUaREva0PEAQrSh5wZHi4q6WNFofdAK0go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707917468; c=relaxed/simple;
	bh=fU/LrTKEOEr5qvUuOXDDcynEiayORw54tUhot/f1gRA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d4mjNIZE7UOQAvkzmSG/Zi3GNKFWpj2etaJJHOdxjIM5X/xwHuR5YX88VEepGvFx5LpxoqgNTEzGY1jfBdNRoDv+2BtDCO2KICbWu1Dgo925bLH1MlqQf1eI9PKYC4Wf9VvFd0PjwXLAFUqyLdUU8E2SjBrFo09mZpIuUeZFIG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=fwcGPp+r; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707917462;
	bh=fU/LrTKEOEr5qvUuOXDDcynEiayORw54tUhot/f1gRA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fwcGPp+rtBiSfVOn3UpxTB+PoBw3/Vlj0xLtM0e3+noBcIw6s8e42LOe6v/QdZzyy
	 JDVdgdDBK01sheQTF4e2Eian70HHDtLKgc8mpFGVvDNDvZWNxZ4Tn7H/wUz9w571Zn
	 oo+Bv0Z3aJM1K5ocKcyiJ/p+IskkWPTyxPnM8LXOQIKs+ZsHJ6BRM2LjoYqZXOkANL
	 c/ZGxSIYuGhQMGCGvihDvmsqFLDHcqisxGKpVcJEDj6NvNCPNj3G6sNbjRcQ60MxCH
	 DoJUzJsBQTZQ8SrNvTsV1od1nzElIKUWyjyHrAJwbiIjaLDQuzI5fajIhLD5yRj5iA
	 fFr9wL7n7Kulw==
Received: from [100.95.196.25] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: koike)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 7DC0E378203F;
	Wed, 14 Feb 2024 13:30:58 +0000 (UTC)
Message-ID: <c1078d13-5375-4c3f-93b7-40a1ea22f0dc@collabora.com>
Date: Wed, 14 Feb 2024 10:30:51 -0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm: ci: use clk_ignore_unused for apq8016
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Javier Martinez Canillas <javierm@redhat.com>
References: <20240214083708.2323967-1-dmitry.baryshkov@linaro.org>
Content-Language: en-US
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <20240214083708.2323967-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 14/02/2024 05:37, Dmitry Baryshkov wrote:
> If the ADV7511 bridge driver is compiled as a module, while DRM_MSM is
> built-in, the clk_disable_unused congests with the runtime PM handling
> of the DSI PHY for the clk_prepare_lock(). This causes apq8016 runner to
> fail without completing any jobs ([1]). Drop the BM_CMDLINE which
> duplicate the command line from the .baremetal-igt-arm64 clause and
> enforce the clk_ignore_unused kernelarg instead to make apq8016 runner
> work.
> 
> [1] https://gitlab.freedesktop.org/drm/msm/-/jobs/54990475
> 
> Fixes: 0119c894ab0d ("drm: Add initial ci/ subdirectory")
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Acked-by: Helen Koike <helen.koike@collabora.com>

Thanks
Helen

> ---
> 
> Changes in v2:
> - Added a comment, describing the issue and a way to reproduce it
>    (Javier)
> 
> ---
>   drivers/gpu/drm/ci/test.yml | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
> index 7ffb620d7398..e64205286a27 100644
> --- a/drivers/gpu/drm/ci/test.yml
> +++ b/drivers/gpu/drm/ci/test.yml
> @@ -119,7 +119,10 @@ msm:apq8016:
>       DRIVER_NAME: msm
>       BM_DTB: https://${PIPELINE_ARTIFACTS_BASE}/arm64/apq8016-sbc-usb-host.dtb
>       GPU_VERSION: apq8016
> -    BM_CMDLINE: "ip=dhcp console=ttyMSM0,115200n8 $BM_KERNEL_EXTRA_ARGS root=/dev/nfs rw nfsrootdebug nfsroot=,tcp,nfsvers=4.2 init=/init $BM_KERNELARGS"
> +    # disabling unused clocks congests with the MDSS runtime PM trying to
> +    # disable those clocks and causes boot to fail.
> +    # Reproducer: DRM_MSM=y, DRM_I2C_ADV7511=m
> +    BM_KERNEL_EXTRA_ARGS: clk_ignore_unused
>       RUNNER_TAG: google-freedreno-db410c
>     script:
>       - ./install/bare-metal/fastboot.sh

