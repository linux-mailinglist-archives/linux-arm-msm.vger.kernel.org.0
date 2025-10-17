Return-Path: <linux-arm-msm+bounces-77699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1ADBE6F10
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 09:31:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0DF884E2569
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 07:31:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D78D1EC01B;
	Fri, 17 Oct 2025 07:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="WLaKsOv+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ADCB1A316C;
	Fri, 17 Oct 2025 07:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760686300; cv=none; b=QuIH12RSBxrMQANYV/oUUQKipWTIatQpO9M0jNBkwZXWtcI/lwFd3aryMkb9psbPRyevz2EmwJ+LvWZVp7fTNdpFaWBKKMtPGwvNcQuntJgOoISEukA818dQRC9PFSvpHGp3UzCR6Fu3fDbG4iaHlDU+pljmPS4wo/nmEsb47Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760686300; c=relaxed/simple;
	bh=+BMP92K4asKFaGVxNw7U7Zl5UFujoFolv1nhfrtKbto=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tW9xeDaqaEs7P/dE950460AvNKHH0YKq4ErpRVP8u6C0BNB2ybtA0qLTHfuisTa7H99uuozq09XWHUM+/vGZCJFidpSH/V+pA25UYoesqAAcoXJ/yE2ps0xqpdC4pbh/l1hHbnqb4sVBS69DZRh0LFpBP30Ra/8z8Tv1cGqvCN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=WLaKsOv+; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760686296;
	bh=+BMP92K4asKFaGVxNw7U7Zl5UFujoFolv1nhfrtKbto=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WLaKsOv+PriMSUKniOrtmEXJaysfC6roB605EvkuYZgZ5pOgtRwb+klzkqa3zLy+3
	 TziAC0z7uf7vMRQkkUdOgda1bI6JuvZkfnjGPNTDaJ4Ey8bPBDjhJ+H7qY4UCKvAOd
	 11GI3+ZY+7NHLI7bkbomSD675uSgk5FnOxSmPX5EW5zNcIRKWb+8X0kI9t6LIQ7Qpt
	 w/HCWZHSP9yOLVJJP1to35UeXykuyZiBYpNLnm9UWk6LjOTg7bLwPGG9FtWCuy3Uhx
	 gtk5SbONRX3EalYkRgfIVhqafdHuNcxJcnoQEyRdWVBA4yOxYzDi+FSvC4aW/NcmHD
	 Nz3MB0AbQjHkg==
Received: from [192.168.50.250] (unknown [171.76.80.157])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B11C217E0FAD;
	Fri, 17 Oct 2025 09:31:32 +0200 (CEST)
Message-ID: <6769d162-ab1c-4427-a0be-22c0b62673c3@collabora.com>
Date: Fri, 17 Oct 2025 13:01:24 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/7] drm/ci: disable apq8016 and apq8096 bare-metal
 jobs
To: rob.clark@oss.qualcomm.com
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com,
 helen.fornazier@gmail.com, airlied@gmail.com, simona.vetter@ffwll.ch,
 robdclark@gmail.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, valentine.burley@collabora.com,
 lumag@kernel.org, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org,
 amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250718105407.32878-1-vignesh.raman@collabora.com>
 <20250718105407.32878-2-vignesh.raman@collabora.com>
 <CACSVV029ueL_4Y5irmmOwy_9QDQGqDe_1wCGUe22FdefQiNjkw@mail.gmail.com>
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <CACSVV029ueL_4Y5irmmOwy_9QDQGqDe_1wCGUe22FdefQiNjkw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Rob,

On 16/10/25 20:22, Rob Clark wrote:
> On Fri, Jul 18, 2025 at 3:54 AM Vignesh Raman
> <vignesh.raman@collabora.com> wrote:
>>
>> These devices are being moved to LAVA. The jobs will be enabled and the
>> job definitions will be updated once the move is complete.
> 
> fwiw, the runners are up and running in LAVA now

Thanks. I will enable them and send v2.

Regards,
Vignesh

> 
> BR,
> -R
> 
>> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
>> ---
>>   drivers/gpu/drm/ci/test.yml | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
>> index 81147e86bfd0..53d19ffaaf61 100644
>> --- a/drivers/gpu/drm/ci/test.yml
>> +++ b/drivers/gpu/drm/ci/test.yml
>> @@ -148,7 +148,9 @@ msm:sc7180-trogdor-kingoftown:
>>       GPU_VERSION: ${DEVICE_TYPE}
>>       RUNNER_TAG: mesa-ci-x86-64-lava-sc7180-trogdor-kingoftown
>>
>> -msm:apq8016:
>> +# FIXME: Disable the bare-metal jobs. These devices are being moved to LAVA.
>> +# Once the move is complete, update the job definitions accordingly.
>> +.msm:apq8016:
>>     extends:
>>       - .baremetal-igt-arm64
>>     stage: msm
>> @@ -165,7 +167,7 @@ msm:apq8016:
>>     script:
>>       - ./install/bare-metal/fastboot.sh || exit $?
>>
>> -msm:apq8096:
>> +.msm:apq8096:
>>     extends:
>>       - .baremetal-igt-arm64
>>     stage: msm
>> --
>> 2.47.2
>>


