Return-Path: <linux-arm-msm+bounces-3476-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCFF805CB0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 19:00:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3769B1F2120C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 18:00:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F319C6A343;
	Tue,  5 Dec 2023 18:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ZrmM49No"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF02B90;
	Tue,  5 Dec 2023 10:00:09 -0800 (PST)
Received: from [100.95.196.25] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: koike)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CFBE6660715D;
	Tue,  5 Dec 2023 18:00:03 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701799208;
	bh=BJnfYEP4jnzEj4xC3SBzSpdhlHMoXjr4hMbNgToqNCg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZrmM49NoOB3x8hr/saLAgZ24NK1r5XWWETIfoXyilPXQw0teXOUfW/q9LhuUIpsEP
	 RXlGXacDZ5FwLpr1yhlqHD3schTPsf5KHXDlFbxPtnQN78DuT4kADVCfdIvry2bRSE
	 WSlVcOqqrUWHsHOv2SDEizYb9ROTxZ1coDO/bdOIRO0Dw3ssvk8/hcWg9lzZIs62cF
	 svBTTfCxg3O8YBLRGac9/7HiYDyjQ5de5yWPAFi+zk2ba+pR1ZEa/axQtGTgVoB/0a
	 0xsf0Ys2vZOz6chQenCg1G3WCGcBSHTRAeNvTNqkRPyb9Ou2SX3wcjXhz2rbDFw3Dx
	 EDTTvY+oEWndQ==
Message-ID: <92256a4b-f957-40ac-af90-d5ea03da497b@collabora.com>
Date: Tue, 5 Dec 2023 15:00:03 -0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 07/10] drm: ci: virtio: Make artifacts available
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
 <20231129121841.253223-8-vignesh.raman@collabora.com>
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <20231129121841.253223-8-vignesh.raman@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 29/11/2023 09:18, Vignesh Raman wrote:
> There were no artifacts available for virtio job.
> So make the artifacts available in the pipeline job.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>

Acked-by: Helen Koike <helen.koike@collabora.com>

Thanks
Helen

> ---
> 
> v5:
>    - Added a new patch in the series to make artifacts available for virtio jobs
> 
> v6:
>    - No changes
> 
> ---
>   drivers/gpu/drm/ci/test.yml | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
> index e0fdc55c9b69..2c9a1838e728 100644
> --- a/drivers/gpu/drm/ci/test.yml
> +++ b/drivers/gpu/drm/ci/test.yml
> @@ -329,6 +329,8 @@ virtio_gpu:none:
>     script:
>       - ln -sf $CI_PROJECT_DIR/install /install
>       - mv install/bzImage /lava-files/bzImage
> +    - mkdir -p $CI_PROJECT_DIR/results
> +    - ln -sf $CI_PROJECT_DIR/results /results
>       - install/crosvm-runner.sh install/igt_runner.sh
>     needs:
>       - debian/x86_64_test-gl

