Return-Path: <linux-arm-msm+bounces-58224-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2DAAB9DEB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 15:50:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D8FD01C0168E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 13:48:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9997510E9;
	Fri, 16 May 2025 13:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="UVDhcUvK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C9E2A1AA;
	Fri, 16 May 2025 13:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747403314; cv=none; b=oY+cGW+roIDVR9pxNmUk8a3Fffz7RefoXjpny0Fh+a2uax8UbH1BbMsAafByeK0ccKOH6zl1ATsa6q/YJ0Y0Jp8JA0kIEmLt/0E0qlYtnzYLug/nRpbE6cd7wL1uogKieYoRoyUPODI8mVZBZi9k/xuwfG3KC/IdWpdKwDSCouc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747403314; c=relaxed/simple;
	bh=TMuT8a4ncnhyl4/VD++TX0W+ECcbOx8qcjaLMl+w3+A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=obtlx/ZXL7b8mfvHFFtka63nBfeD2LLW55wpQJ/bemMDsIcYlwkq8W6OhPl2W7DJWiEiwNlyRF8zg3p0oJl6ApLsM5nw02gLpXxpy0OKy+1Gs1TCGD33dyTN4GGQaN5YuBcadsZGArH6Y3+ZZRiF+C9HKRHFtR1QIumohX5BLdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=UVDhcUvK; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Hkbeh72Y0ucq/iJdWN5aU8aatswoMTC6+WwiWepvQvA=; b=UVDhcUvKoxA8PncS3akl1v1GSQ
	b34xI5NT8Q5z28EX3kAMIYvVsVmI7FhwsIf1Z7cV8lfPlW3j0Czw5KNBsxyCjGhBRb8k8i5GjhRov
	9XljFAjG4qH5+n5mdW7Yw8uxa85a6DHOlSsgXLu8H4SNoNutHNI32bCLN54ayYtUzPW5q6+Kw3drU
	PJCMKk0YdP7MBl/7+OQoqV3nwodlm7lXpswuu6qxqfro2qOq2SybpiZFHcZNWvIh2xdjAXGFy0NJW
	wiOMTOTCfteuukjPsd/dQoMIOcRCS4H09pCJ/eHMTIDKlNYM3NvSg1cNxzCxUnmePaHZsazEBn5Dp
	m+4w9jJg==;
Received: from [179.180.238.246] (helo=[192.168.68.116])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1uFvKL-0096fp-4V; Fri, 16 May 2025 15:48:15 +0200
Message-ID: <80673b87-792b-49f9-a68e-657c16a9b04a@igalia.com>
Date: Fri, 16 May 2025 10:48:09 -0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: ci: skip msm_mapping@shadow on SM8350
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Helen Koike <helen.fornazier@gmail.com>,
 Vignesh Raman <vignesh.raman@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250513-msm-ci-fixes-v1-1-baba185529a2@oss.qualcomm.com>
Content-Language: en-US
From: Helen Koike <koike@igalia.com>
In-Reply-To: <20250513-msm-ci-fixes-v1-1-baba185529a2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/13/25 15:49, Dmitry Baryshkov wrote:
> The msm_mapping@shadow test fails on SM8350, which means that the write
> might get through (hopefully not though). Disable the test completely
> for now until we can fix the issue.
> 
> Link: https://gitlab.freedesktop.org/drm/msm/-/issues/77
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Acked-by: Helen Koike <koike@igalia.com>

Thanks
Helen

> ---
>   drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-skips.txt | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-skips.txt b/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-skips.txt
> index 9450f2a002fd7e68f0f674ac6ac84aeebf28347f..a8b535abc8ef0d996d0c73ece1c7a9622250928e 100644
> --- a/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-skips.txt
> +++ b/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-skips.txt
> @@ -210,3 +210,8 @@ msm/msm_mapping@ring
>   # [  229.752499] CPU features: 0x18,00000017,00200928,4200720b
>   # [  229.758095] Memory Limit: none
>   # [  229.761291] ---[ end Kernel panic - not syncing: softlockup: hung tasks ]---
> +
> +# Protection doesn't seem to be enforced, don't perform write which might get through
> +# https://gitlab.freedesktop.org/drm/msm/-/issues/77
> +msm/msm_mapping@shadow
> +
> 
> ---
> base-commit: 8f5264d302e803e7ef82a61f9632a0d2ef67413f
> change-id: 20250513-msm-ci-fixes-3e7ce259d1d9
> 
> Best regards,


