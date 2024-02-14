Return-Path: <linux-arm-msm+bounces-11011-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6FB5854BB3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 15:41:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 48D0FB239E5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 14:41:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 537625A107;
	Wed, 14 Feb 2024 14:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="hoeqEQIw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8D95A0F8
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Feb 2024 14:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707921700; cv=none; b=RzkzA8sfsr/ByVfadXXqargoI+NeEMP7bLxjFC4xPyN2ESThQ+xP6fW3SK9d9zAioV73vyVfVMeV3DY3iFDrJiQV1oRg4HophDSdmsJft1+R3iZuGucgi0aEDATv/pUEpLJzDOIvUlssg2uq4j0OmfHaYf3/JBrzJt/4/ry5358=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707921700; c=relaxed/simple;
	bh=Ocfp1vuV0hUuPSty8ZYkGXTPlL3oc2sSfjxCcl/aI1A=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Lrruvj3mTru8k2qqbX0OWSflOcmF58ozuysMumSgvrL8WU/zU/n9lVKnTFMKIQcTzaovFZCcX+heGBdoWeY6+9LUwNdsj+kbcx5/jJvDP4+mVkMiaoasWVVk1AsQ1ghy5aEpm5zFnBpJwBOedjAxf1sYBYHgaJW8sSxuzPqIOgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=hoeqEQIw; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707921696;
	bh=Ocfp1vuV0hUuPSty8ZYkGXTPlL3oc2sSfjxCcl/aI1A=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=hoeqEQIw8SUOo0Gn2BN46rR1Ii0EoznEFldQrYi8vYtnw2WKNGHm92g1qzuoC3Wny
	 inJcZM/feEceQRzFbz9jtNf1xSF7lJxljMTw3wAj8oa8qXS9zv63/1ugdH/78L/RoA
	 pcnkbGWYxy5a5CYIchVXd9j0uVbgsiFT0UQKo8pU3Is0V/aoo+4flbB+3evE9fI03b
	 OCpJVa42i/ZG0K4r8TMlab879c659fDOYHAfcDZWKl3RvNOsSBHpfLnP4i74/KqlOn
	 gG3QQg7fgmA67ub1snQOW/5LKwAoJivJsveGBN96JOUJfxHCtK4mFqbxcxQ25qBX6C
	 bOP2E8kzKYZaw==
Received: from [100.95.196.25] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: koike)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id CA6E03782081;
	Wed, 14 Feb 2024 14:41:32 +0000 (UTC)
Message-ID: <7aa0bdd0-ae2d-4e0d-b3f3-7cb0880061d8@collabora.com>
Date: Wed, 14 Feb 2024 11:41:29 -0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm: ci: use clk_ignore_unused for apq8016
Content-Language: en-US
From: Helen Koike <helen.koike@collabora.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Javier Martinez Canillas <javierm@redhat.com>
References: <20240214083708.2323967-1-dmitry.baryshkov@linaro.org>
 <c1078d13-5375-4c3f-93b7-40a1ea22f0dc@collabora.com>
In-Reply-To: <c1078d13-5375-4c3f-93b7-40a1ea22f0dc@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 14/02/2024 10:30, Helen Koike wrote:
> 
> 
> On 14/02/2024 05:37, Dmitry Baryshkov wrote:
>> If the ADV7511 bridge driver is compiled as a module, while DRM_MSM is
>> built-in, the clk_disable_unused congests with the runtime PM handling
>> of the DSI PHY for the clk_prepare_lock(). This causes apq8016 runner to
>> fail without completing any jobs ([1]). Drop the BM_CMDLINE which
>> duplicate the command line from the .baremetal-igt-arm64 clause and
>> enforce the clk_ignore_unused kernelarg instead to make apq8016 runner
>> work.
>>
>> [1] https://gitlab.freedesktop.org/drm/msm/-/jobs/54990475
>>
>> Fixes: 0119c894ab0d ("drm: Add initial ci/ subdirectory")
>> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Acked-by: Helen Koike <helen.koike@collabora.com>

Applied to drm-misc-next.

Regards,
Helen

> 
> Thanks
> Helen
> 
>> ---
>>
>> Changes in v2:
>> - Added a comment, describing the issue and a way to reproduce it
>>    (Javier)
>>
>> ---
>>   drivers/gpu/drm/ci/test.yml | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
>> index 7ffb620d7398..e64205286a27 100644
>> --- a/drivers/gpu/drm/ci/test.yml
>> +++ b/drivers/gpu/drm/ci/test.yml
>> @@ -119,7 +119,10 @@ msm:apq8016:
>>       DRIVER_NAME: msm
>>       BM_DTB: 
>> https://${PIPELINE_ARTIFACTS_BASE}/arm64/apq8016-sbc-usb-host.dtb
>>       GPU_VERSION: apq8016
>> -    BM_CMDLINE: "ip=dhcp console=ttyMSM0,115200n8 
>> $BM_KERNEL_EXTRA_ARGS root=/dev/nfs rw nfsrootdebug 
>> nfsroot=,tcp,nfsvers=4.2 init=/init $BM_KERNELARGS"
>> +    # disabling unused clocks congests with the MDSS runtime PM 
>> trying to
>> +    # disable those clocks and causes boot to fail.
>> +    # Reproducer: DRM_MSM=y, DRM_I2C_ADV7511=m
>> +    BM_KERNEL_EXTRA_ARGS: clk_ignore_unused
>>       RUNNER_TAG: google-freedreno-db410c
>>     script:
>>       - ./install/bare-metal/fastboot.sh

