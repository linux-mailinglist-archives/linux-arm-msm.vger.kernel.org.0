Return-Path: <linux-arm-msm+bounces-11869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7326185BED0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 15:32:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AEAB71C20B99
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 14:31:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92DE854277;
	Tue, 20 Feb 2024 14:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="lFHkbs+a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5F42F2C
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 14:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708439517; cv=none; b=ZZIzBWecD91veZUG6PMy17Bc8yB0g8bIlmTDxrrIRBDMBDhVKFJZP+FQbBUimn4JTfXSMhb9lyp5x9K/1kzrij7ExSFql6/SGQ/HWbTzyXPQI5hO3yc2jchlQhoyVBRZOOOoTGA9SCQoXEJ+7RjcJX2pILpTJw1/pR7QS4erQG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708439517; c=relaxed/simple;
	bh=UB9n+2vXmx8kSjWpZUtThzJ8/Wjk4SVOdwSVTMPgOJ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bonccr51nGGVTGA/5nL8GBs7jdxDJFQPdCZhBV6hjisz9Q/864ldZ7FlbTy6M2pT3g4uZqkcRwta5e7wXvdphkqqaY1qBJKVIngmEXB/QwdcHJGjR5LO4rnx2YAlZxlE/eXfv4X1OBKJj5RU5MU5ujWGU8V1pHpProI0VWdtAZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=lFHkbs+a; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1708439508;
	bh=UB9n+2vXmx8kSjWpZUtThzJ8/Wjk4SVOdwSVTMPgOJ4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lFHkbs+aPr2vz+EUKwa8ItHSSBP/sE0Dn2pHgOw2NFQd2Hpibq9zDdmFds8qIgDiZ
	 jeLT6IndiVLJmUF1fgEhRjCJwI3EYu1UrhTcH5KaLSpdL1MxQDT5OsvexXCXt5FBBo
	 R9CfhBklKwDIrDXfNAfkfZBrnBSrplt8D58S4ESE8LBbpTua1o6FNgPgL9cxaXxWJE
	 VcYef0VqS3x5XccnmsSlGFwYwGJBMMdyjfnccdBMVyWOsoGQO1VXTogu4zkNYfmgGp
	 tXl+wExwfdHOlfMdrOQfX2Fh8USsUUEGlLVeirz8VbtRhngxW7fBJdvRPrIFmCiA+s
	 K8fSVM0sesbfw==
Received: from [100.95.196.25] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: koike)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 89C2F3780627;
	Tue, 20 Feb 2024 14:31:44 +0000 (UTC)
Message-ID: <54a3f3d9-ad3e-4828-96c0-61dd81c61d76@collabora.com>
Date: Tue, 20 Feb 2024 11:31:44 -0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: ci: uprev IGT
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
References: <20240220121741.2994222-1-dmitry.baryshkov@linaro.org>
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <20240220121741.2994222-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 20/02/2024 09:17, Dmitry Baryshkov wrote:
> Bump IGT revision to pick up Rob Clark's fixes for the msm driver:
> 
> - msm_submit@invalid-duplicate-bo-submit,Fail
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Do you have a gitlab pipeline link I can check?

Thanks
Helen

> ---
>   drivers/gpu/drm/ci/gitlab-ci.yml | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
> index 8b82e6656924..47e567b4f7a7 100644
> --- a/drivers/gpu/drm/ci/gitlab-ci.yml
> +++ b/drivers/gpu/drm/ci/gitlab-ci.yml
> @@ -5,7 +5,7 @@ variables:
>     UPSTREAM_REPO: git://anongit.freedesktop.org/drm/drm
>     TARGET_BRANCH: drm-next
>   
> -  IGT_VERSION: d2af13d9f5be5ce23d996e4afd3e45990f5ab977
> +  IGT_VERSION: 3f2879fef93c0c546a2f1c0aa48a9cc2a594b9d2
>   
>     DEQP_RUNNER_GIT_URL: https://gitlab.freedesktop.org/anholt/deqp-runner.git
>     DEQP_RUNNER_GIT_TAG: v0.15.0

