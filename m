Return-Path: <linux-arm-msm+bounces-20096-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 571B48CA83A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2024 08:56:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 128D12827C9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2024 06:56:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF7F244384;
	Tue, 21 May 2024 06:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="j8hBCfaC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055E6C12C;
	Tue, 21 May 2024 06:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716274602; cv=none; b=mEJA15nhDvc+nGS80LfvhIaYF8PwHXge/9ZnbHJZaVmuXzmMv7CdGcXVu+G7bUY41Q4YUUQ9uQ9B6+MVkMWPwewR+BrG6lIRpRGGFo8ULHuSEkriczq4HXSz6v3pqKWe+hWHk9wCXmuTbRMhE1oCANZ+sdTbgp8QaXtqLC1WmbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716274602; c=relaxed/simple;
	bh=TfIOtUcqbwJkZ6notRudlNbUTFukk69iQGuDM3mE/MU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JAW9E/o0DjIlfImstIyhaaL6WBR8MGb18eAhRPZjclsJhWj6KxRNr1+qJ2CZqG8+U7RHXkzCP4GOWR8SGqMN6dnlkhvfpAvFkAtWjHoBLcA+joPQYmyNgr1tS5RAzGywx/7YFoTxhsE6YvKamMYycgXm87+kYa6c2JKniAhzeMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=j8hBCfaC; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716274598;
	bh=TfIOtUcqbwJkZ6notRudlNbUTFukk69iQGuDM3mE/MU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=j8hBCfaCITG8b7pfUhoD1HKU00f770m7cYI7bu4vJH8rk/LXn0Yf+54WofcnvQcjO
	 EBrwL0Jt2wDVrxrr+0JBpPbNrJOira99dUdCUm9/dP/GWui7vnBWQNV3pOEVCaXWfP
	 KIkcTRj8vFjREo+/EPduJnkDhULrUqWVhWOHchgYqBE6VpSp3LlufdpcPgqZgmEoMb
	 0Xi1EdMqEXTobHSa/oC9awjBJi9zI4qGB7izvFUBxKilyV71NgrBMi44w52x5Tklr3
	 l7edZajr7e5ZeXhaq1i2UPch5QdDzhEK/PASHKWT3nl9DpEwW0izTYnOWML1e/u8Iq
	 K8mL3G0ETrAaA==
Received: from [100.66.96.193] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 3B376378202E;
	Tue, 21 May 2024 06:56:35 +0000 (UTC)
Message-ID: <87fba814-eb5a-4b6a-800b-158987fca1d8@collabora.com>
Date: Tue, 21 May 2024 12:26:33 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] drm/ci: generate testlist from build
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
 <20240517092502.647420-3-vignesh.raman@collabora.com>
 <o363vir3dqz2znrnifo6enbdwudalmxqbigdkci2ykxf5qjbnx@2ngllflxotgk>
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <o363vir3dqz2znrnifo6enbdwudalmxqbigdkci2ykxf5qjbnx@2ngllflxotgk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Dmitry,

On 20/05/24 16:30, Dmitry Baryshkov wrote:
> On Fri, May 17, 2024 at 02:54:58PM +0530, Vignesh Raman wrote:
>> Stop vendoring the testlist into the kernel. Instead, use the
>> testlist from the IGT build to ensure we do not miss renamed
>> or newly added tests.
>>
>> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
>> ---
>>
>> v2:
>>    - Fix testlist generation for arm and arm64 builds.
>>
>> ---
>>   drivers/gpu/drm/ci/build-igt.sh  |   34 +
>>   drivers/gpu/drm/ci/igt_runner.sh |    9 +-
>>   drivers/gpu/drm/ci/testlist.txt  | 2761 ------------------------------
>>   3 files changed, 39 insertions(+), 2765 deletions(-)
>>   delete mode 100644 drivers/gpu/drm/ci/testlist.txt
>>
>> diff --git a/drivers/gpu/drm/ci/build-igt.sh b/drivers/gpu/drm/ci/build-igt.sh
>> index 7859554756c4..e62244728613 100644
>> --- a/drivers/gpu/drm/ci/build-igt.sh
>> +++ b/drivers/gpu/drm/ci/build-igt.sh
> 
> [...]
> 
>> @@ -26,6 +50,16 @@ meson build $MESON_OPTIONS $EXTRA_MESON_ARGS
>>   ninja -C build -j${FDO_CI_CONCURRENT:-4} || ninja -C build -j 1
>>   ninja -C build install
>>   
>> +if [[ "$KERNEL_ARCH" = "arm64" ]]; then
>> +    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/igt/lib/aarch64-linux-gnu
>> +elif [[ "$KERNEL_ARCH" = "arm" ]]; then
>> +    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/igt/lib
>> +else
>> +    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/igt/lib64
> 
> Could you please clarify this part? The arm64 vs arm don't look logical
> from my point of view.
> 
> The rest LGTM.

The libs are installed in the below path for different arch.

 > find . -name libigt.so
./x86/igt/lib64/libigt.so
./arm64/igt/lib/aarch64-linux-gnu/libigt.so
./arm/igt/lib/libigt.so
~/igt-build

So for arm64 it is 'lib/aarch64-linux-gnu' and arm it is 'lib'.

s3.freedesktop.org/artifacts/vigneshraman/linux/1179691/arm64/igt.tar.gz
s3.freedesktop.org/artifacts/vigneshraman/linux/1179691/arm/igt.tar.gz
s3.freedesktop.org/artifacts/vigneshraman/linux/1179691/x86_64/igt.tar.gz

Regards,
Vignesh

> 
>> +fi
>> +
>> +generate_testlist
>> +
>>   mkdir -p artifacts/
>>   tar -cf artifacts/igt.tar /igt
>>   

