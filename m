Return-Path: <linux-arm-msm+bounces-3474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 051C8805CA3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 18:53:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 364C51C20FA2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 17:53:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E5996A33A;
	Tue,  5 Dec 2023 17:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="h+anahSC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6ECE81BC
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 Dec 2023 09:53:47 -0800 (PST)
Received: from [100.95.196.25] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: koike)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C564B660715D;
	Tue,  5 Dec 2023 17:53:42 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701798825;
	bh=+zVb91c+m6mZWUppmt1UznPtzffYZ0X/qe9UpFAAl2c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=h+anahSCRErixp18RZj78XZZkgGVstCESab6hj/QTNL25llGiPXgGS41aQ3YEpyU3
	 Q/V0e4tsDTAatpkPpdp1JNoyDNUpXOIj0D86xRwNL/DmakZzF1AwFsgLLMqvCPKZmb
	 F+bHjc9h1I83M2wrg86rYQIdmlhDTXPvyqU2cj0w2tG1fkfy+yPpbjaFgYYfskEZLC
	 mhvbqdIJvbt952TTPq3XxwqbsG9MLbAlYCwYNn9qwbo5KhK7MbX80Xu131ov1E3YXp
	 5TnuDwtpNH+yAnl8VfmFKcx1JEsMNTQ7i5dDvdsj6erfZMKsoODrrC06HbJnhMNVH1
	 E7F0p/2k0++MA==
Message-ID: <87815255-5a1f-4d19-b8ea-e9defac954cb@collabora.com>
Date: Tue, 5 Dec 2023 14:53:37 -0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ci: remove rebase-merge directory
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 David Heidelberg <david.heidelberg@collabora.com>,
 freedreno@lists.freedesktop.org
References: <20231202221353.1276288-1-dmitry.baryshkov@linaro.org>
Content-Language: en-US
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <20231202221353.1276288-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 02/12/2023 19:13, Dmitry Baryshkov wrote:
> Gitlab runner can cache git repository, including the unfinished rebase
> merge status. New CI job will come as a fresh checkout, however this
> will not destroy the unfinished rebase, failing our build script.
> Destroy the unfinished rebase state.
> 
> Suggested-by: David Heidelberg <david.heidelberg@collabora.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Acked-by: Helen Koike <helen.koike@collabora.com>

Thanks!
Helen

> ---
>   drivers/gpu/drm/ci/build.sh | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
> index e5c5dcedd108..ca2923ed2290 100644
> --- a/drivers/gpu/drm/ci/build.sh
> +++ b/drivers/gpu/drm/ci/build.sh
> @@ -58,6 +58,9 @@ git config --global user.email "fdo@example.com"
>   git config --global user.name "freedesktop.org CI"
>   git config --global pull.rebase true
>   
> +# cleanup git state on the worker
> +rm -rf .git/rebase-merge
> +
>   # Try to merge fixes from target repo
>   if [ "$(git ls-remote --exit-code --heads ${UPSTREAM_REPO} ${TARGET_BRANCH}-external-fixes)" ]; then
>       git pull ${UPSTREAM_REPO} ${TARGET_BRANCH}-external-fixes

