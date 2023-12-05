Return-Path: <linux-arm-msm+bounces-3477-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1E2805CB3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 19:01:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 617E5B20B5F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 18:01:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CB826A342;
	Tue,  5 Dec 2023 18:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="FksvE4Ga"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EFD0B2;
	Tue,  5 Dec 2023 10:00:57 -0800 (PST)
Received: from [100.95.196.25] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: koike)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3F433660715D;
	Tue,  5 Dec 2023 18:00:51 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701799256;
	bh=RgkVHjxMEsdXllUes00vbSqVmLybs60goWYS6kaWos8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FksvE4Ga17Z+a4BzWvMY/16U6sbJxavWMiB1tuCqhvG2l/iOMPypzK0mWMcq0yjTQ
	 bhX/HsWwRYZHkW8QgV14rI4VOvDjYtTH01HaqZR0rqOwr3B35KNPl4Tgq0UaWn2/hQ
	 agqC7hEHzp7ekxcJX6CbAb0xtepUiCUkaUTm3zM7CaR1aF3teuzGmGtzaJV7eUUzB1
	 oAgJuZlvXBgdK3hIsLxIEjBFaWjsOg+GLAyutPNqQvZS29FMf6a/1DmN6etZfVfxlS
	 4RIsFTFctyCuX+dBSDMNrU4wTwAfIm1MbdFFv+209MYurr+5GIbWWHgpGKW/nq0low
	 DnpSecXjQGzTQ==
Message-ID: <03724cf8-e7c1-462a-80a4-587f5df202ef@collabora.com>
Date: Tue, 5 Dec 2023 15:00:50 -0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 08/10] drm: ci: uprev IGT
Content-Language: en-US
To: Vignesh Raman <vignesh.raman@collabora.com>, airlied@gmail.com,
 daniel@ffwll.ch
Cc: david.heidelberg@collabora.com, sergi.blanch.torne@collabora.com,
 guilherme.gallo@collabora.com, daniels@collabora.com,
 gustavo.padovan@collabora.com, emma@anholt.net, robdclark@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 virtualization@lists.linux-foundation.org,
 linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org
References: <20231129121841.253223-1-vignesh.raman@collabora.com>
 <20231129121841.253223-9-vignesh.raman@collabora.com>
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <20231129121841.253223-9-vignesh.raman@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 29/11/2023 09:18, Vignesh Raman wrote:
> virtio-gpu kernel driver reports 16 for count_crtcs
> which exceeds IGT_MAX_PIPES set to 8 in igt-gpu-tools.
> This results in below memory corruption,
> 
>   malloc(): corrupted top size
>   Received signal SIGABRT.
>   Stack trace:
>    #0 [fatal_sig_handler+0x17b]
>    #1 [__sigaction+0x40]
>    #2 [pthread_key_delete+0x14c]
>    #3 [gsignal+0x12]
>    #4 [abort+0xd3]
>    #5 [__fsetlocking+0x290]
>    #6 [timer_settime+0x37a]
>    #7 [__default_morecore+0x1f1b]
>    #8 [__libc_calloc+0x161]
>    #9 [drmModeGetPlaneResources+0x44]
>    #10 [igt_display_require+0x194]
>    #11 [__igt_unique____real_main1356+0x93c]
>    #12 [main+0x3f]
>    #13 [__libc_init_first+0x8a]
>    #14 [__libc_start_main+0x85]
>    #15 [_start+0x21]
>   
> This is fixed in igt-gpu-tools by increasing IGT_MAX_PIPES to 16.
> https://patchwork.freedesktop.org/series/126327/
>   
> Uprev IGT to include the patches which fixes this issue.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>

Acked-by: Helen Koike <helen.koike@collabora.com>

Thanks
Helen

> ---
> 
> v6:
>    - Added a new patch in the series to uprev IGT to fix memory corruption
> 
> ---
>   drivers/gpu/drm/ci/gitlab-ci.yml | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
> index aeb9bab1b069..dac92cc2777c 100644
> --- a/drivers/gpu/drm/ci/gitlab-ci.yml
> +++ b/drivers/gpu/drm/ci/gitlab-ci.yml
> @@ -5,7 +5,7 @@ variables:
>     UPSTREAM_REPO: git://anongit.freedesktop.org/drm/drm
>     TARGET_BRANCH: drm-next
>   
> -  IGT_VERSION: d1db7333d9c5fbbb05e50b0804123950d9dc1c46
> +  IGT_VERSION: d2af13d9f5be5ce23d996e4afd3e45990f5ab977
>   
>     DEQP_RUNNER_GIT_URL: https://gitlab.freedesktop.org/anholt/deqp-runner.git
>     DEQP_RUNNER_GIT_TAG: v0.15.0

