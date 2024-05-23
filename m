Return-Path: <linux-arm-msm+bounces-20286-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7E18CCC0D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 May 2024 08:07:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E7BD1F21B20
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 May 2024 06:07:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D16567581F;
	Thu, 23 May 2024 06:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="coShTuf2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5D51BDD0;
	Thu, 23 May 2024 06:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716444460; cv=none; b=R18ay0Jjbh51ZGcoja04rjL5bdn9vBh8xv1/nChldb0QjUsVEzXZF4CPWOCvGEqOUzMe4vbBdAi/5pFMRWisJ+XoHn5BVbWfv1H+9+jI8PhI7GQOmnZhkArS8+iVAIi8XeQrsyxeCvmb0EHWltdPaGSGiBmi/13gi5WPgRKbMh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716444460; c=relaxed/simple;
	bh=ous1oe/kRPBiEhDvboed42vXxlkNgqhP3ypAKRJeMQM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eEjSvewwE6ePPfsWbD41kgL5IaDunJkQZE7RimmPDYLU5Mh15uhrqB76YUADT0dycDJvXDXyPskaGkxdwOxzVtWNLTQddy0kt7jCxzxolF+zHG7meu78aGYmUsGOCWcEjqSGTaaZWmdEU2jZUGX3YUMH05iAypS4lW/4WULta9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=coShTuf2; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716444457;
	bh=ous1oe/kRPBiEhDvboed42vXxlkNgqhP3ypAKRJeMQM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=coShTuf2hYo7TRLfb7IfCR4Zujw4PpdPG/DQ3NeLkqe74gGerapIkIcVEgSnRTEdu
	 iOlykt96+WfRFsm4hkM0sokeNs/qFailldaa+TvEqawT9IqysUGEFIomjMQ0oZ89W8
	 abpgCL8RunDK5HZKJmbOM/zlXZMAaHlbb5d0T5BertoWrBqCyjfkyVoCfCQ+KNHYBi
	 ZwR4PFk8JEyOe44RHUQtaYpgxxES0m4vpV6y45qmXnufBqR0eluXBefdpqyTFNgmu0
	 r/ZWUUGsW01BBxSm2uF2EbAXIVUcnL0IjG1GlADRP0rMZvgtnTUbnHj4cy3ivwp3V1
	 Z8oTMTKl/pE1g==
Received: from [100.66.96.193] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 119D137820E5;
	Thu, 23 May 2024 06:07:33 +0000 (UTC)
Message-ID: <9cd0667a-12ee-4d45-80e8-dc34259bf01d@collabora.com>
Date: Thu, 23 May 2024 11:37:31 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] drm/ci: uprev mesa version
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com,
 helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch,
 robdclark@gmail.com, david.heidelberg@collabora.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 mcanal@igalia.com, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org,
 amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org
References: <20240517092502.647420-1-vignesh.raman@collabora.com>
 <20240517092502.647420-2-vignesh.raman@collabora.com>
 <2qzmfv3oc6feihwxu3tl37rg6w3qsj2vddu5olvqk6vhqr26cc@bxu5y6ijvtfa>
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <2qzmfv3oc6feihwxu3tl37rg6w3qsj2vddu5olvqk6vhqr26cc@bxu5y6ijvtfa>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Dmitry,

On 20/05/24 16:13, Dmitry Baryshkov wrote:
> On Fri, May 17, 2024 at 02:54:57PM +0530, Vignesh Raman wrote:
>> zlib.net is not allowing tarball download anymore and results
>> in below error in kernel+rootfs_arm32 container build,
>> urllib.error.HTTPError: HTTP Error 403: Forbidden
>> urllib.error.HTTPError: HTTP Error 415: Unsupported Media Type
>>
>> Uprev mesa to latest version which includes a fix for this issue.
>> https://gitlab.freedesktop.org/mesa/mesa/-/commit/908f444e
>>
>> Use id_tokens for JWT authentication. Since s3 bucket is migrated to
>> mesa-rootfs, update the variables accordingly. Also copy helper scripts
>> to install, so that the ci jobs can use these scripts for logging.
>>
>> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
>> ---
>>
>> v2:
>>    - Uprev to recent version and use id_tokens for JWT authentication
>>
>> ---
>>   drivers/gpu/drm/ci/build-igt.sh   |  2 +-
>>   drivers/gpu/drm/ci/build.sh       |  6 +++--
>>   drivers/gpu/drm/ci/container.yml  | 12 +++------
>>   drivers/gpu/drm/ci/gitlab-ci.yml  | 44 +++++++++++++++++++++----------
>>   drivers/gpu/drm/ci/image-tags.yml |  2 +-
>>   drivers/gpu/drm/ci/lava-submit.sh |  4 +--
>>   drivers/gpu/drm/ci/test.yml       |  2 ++
>>   7 files changed, 44 insertions(+), 28 deletions(-)
>>
> 
> [skipped]
> 
>> diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
>> index 8bc63912fddb..612c9ede3507 100644
>> --- a/drivers/gpu/drm/ci/test.yml
>> +++ b/drivers/gpu/drm/ci/test.yml
>> @@ -150,6 +150,8 @@ msm:sdm845:
>>       BM_KERNEL: https://${PIPELINE_ARTIFACTS_BASE}/arm64/cheza-kernel
>>       GPU_VERSION: sdm845
>>       RUNNER_TAG: google-freedreno-cheza
>> +    DEVICE_TYPE: sdm845-cheza-r3
>> +    FARM: google
> 
> I see that this is the only user of the FARM: tag. Is it correct?

No, we need to add FARM variable for other jobs as well.

> Also we miss DEVICE_TYPE for several other boards. Should we be adding
> them?

Yes, device type needs to be added for msm:apq8016, msm:apq8096, virtio_gpu.

I will add this. Thanks.

Regards,
Vignesh

> 
>>     script:
>>       - ./install/bare-metal/cros-servo.sh
>>   
>> -- 
>> 2.40.1
>>
> 

