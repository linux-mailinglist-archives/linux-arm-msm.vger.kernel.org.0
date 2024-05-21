Return-Path: <linux-arm-msm+bounces-20098-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4630B8CA87A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2024 09:09:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C6A72284E9C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2024 07:09:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 552854AEEA;
	Tue, 21 May 2024 07:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="dMb57hvR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9E47F;
	Tue, 21 May 2024 07:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716275369; cv=none; b=soSrapzWa6m82ICgThdyneLh8whr/3ePIsIzNdTOzuVqGnEJ1iCbRsfGgV5yysF4qUz//DlRWjjGLkkMh0YyyYTK9ql7gTSURJBJmxd0f5awE0VkGBsWvtXWQ2zBVf49T3xAurDyY4Ku19oiRELh5pMSWJBm6dt8/1G9HgfI2Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716275369; c=relaxed/simple;
	bh=2kRe9Ce8rakW5lnoclVrGvOqgAaS9QJgR7+JBCR7qys=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iWZ29YEjIP2qwZr1IZF1bd7E4afgussz8YFKflhlmrxMODbZX1fYbDozuWyngWLi+/M4DgxOj1sL5JLJgR2c8HXLdNU+S/js0numL9kO6o64iXu8flN6J+pZ5Oswd1yKLv48/dMQ1tGMHpmcuFEuw6g3MKyIK2s7vRq12vVTQ9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=dMb57hvR; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716275365;
	bh=2kRe9Ce8rakW5lnoclVrGvOqgAaS9QJgR7+JBCR7qys=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dMb57hvRLq5Ogx/eVkr0GikvvOOcmA5elS88vCrGss1/i4ZaMGyJDakkzpsPqdKT0
	 orLLIzRjSegeeBGqdqT+YLzJOOqeU4I3VEw+Wyz6V/8JUomxmKVqURakWOBdWDGMhc
	 a8uCQLH53IZiJhwL5OhP7wuPoxDUYVsSHadDZiP0iwDeoqLby10l9/7WR9H1v92C4z
	 GO4BQg9kw2QgpPDnELBL9rBKXBR05jMVNEwyv7QDoC9dNX7xJ579aMYDO0a3pLAUBx
	 e4xY/BitVag16MsRrKACbRbrpr6Ufokn02bNWB4NaOnAPDNsq22TPAVjmswEHYFEQY
	 Uo90BDiUZNPUQ==
Received: from [100.66.96.193] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 97C6B378202E;
	Tue, 21 May 2024 07:09:21 +0000 (UTC)
Message-ID: <f3646d66-01f0-476c-8b7f-5df102790fcb@collabora.com>
Date: Tue, 21 May 2024 12:39:19 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] drm/ci: build virtual GPU driver as module
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
 <20240517092502.647420-4-vignesh.raman@collabora.com>
 <elftuzsd7lhz6y5ow6rb5uu5fb5b5jcprxtvxtxtojo774rnyr@swpeg4vkgtnc>
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <elftuzsd7lhz6y5ow6rb5uu5fb5b5jcprxtvxtxtojo774rnyr@swpeg4vkgtnc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Dmitry,

On 20/05/24 16:32, Dmitry Baryshkov wrote:
> On Fri, May 17, 2024 at 02:54:59PM +0530, Vignesh Raman wrote:
>> With latest IGT, the tests tries to load the module and it
>> fails. So build the virtual GPU driver for virtio as module.
> 
> Why? If the test fails on module loading (if the driver is built-in)
> then it's the test that needs to be fixed, not the kerenel config.
> 
> It's fine as a temporal workaround, but please include a link to the
> patch posted to fix the issue.

I will recheck this issue and post a link to the fix.

Regards,
Vignesh

> 
>>
>> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
>> ---
>>
>> v2:
>>    - No changes.
>>
>> ---
>>   drivers/gpu/drm/ci/build.sh       | 1 -
>>   drivers/gpu/drm/ci/igt_runner.sh  | 6 +++---
>>   drivers/gpu/drm/ci/image-tags.yml | 4 ++--
>>   drivers/gpu/drm/ci/test.yml       | 1 +
>>   drivers/gpu/drm/ci/x86_64.config  | 2 +-
>>   5 files changed, 7 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
>> index a67871fdcd3f..e938074ac8e7 100644
>> --- a/drivers/gpu/drm/ci/build.sh
>> +++ b/drivers/gpu/drm/ci/build.sh
>> @@ -157,7 +157,6 @@ fi
>>   
>>   mkdir -p artifacts/install/lib
>>   mv install/* artifacts/install/.
>> -rm -rf artifacts/install/modules
>>   ln -s common artifacts/install/ci-common
>>   cp .config artifacts/${CI_JOB_NAME}_config
>>   
>> diff --git a/drivers/gpu/drm/ci/igt_runner.sh b/drivers/gpu/drm/ci/igt_runner.sh
>> index 20026612a9bd..55532f79fbdc 100755
>> --- a/drivers/gpu/drm/ci/igt_runner.sh
>> +++ b/drivers/gpu/drm/ci/igt_runner.sh
>> @@ -30,10 +30,10 @@ case "$DRIVER_NAME" in
>>               export IGT_FORCE_DRIVER="panfrost"
>>           fi
>>           ;;
>> -    amdgpu)
>> +    amdgpu|virtio_gpu)
>>           # Cannot use HWCI_KERNEL_MODULES as at that point we don't have the module in /lib
>> -        mv /install/modules/lib/modules/* /lib/modules/.
>> -        modprobe amdgpu
>> +        mv /install/modules/lib/modules/* /lib/modules/. || true
>> +        modprobe --first-time $DRIVER_NAME
>>           ;;
>>   esac
>>   
>> diff --git a/drivers/gpu/drm/ci/image-tags.yml b/drivers/gpu/drm/ci/image-tags.yml
>> index 60323ebc7304..328f5c560742 100644
>> --- a/drivers/gpu/drm/ci/image-tags.yml
>> +++ b/drivers/gpu/drm/ci/image-tags.yml
>> @@ -4,9 +4,9 @@ variables:
>>      DEBIAN_BASE_TAG: "${CONTAINER_TAG}"
>>   
>>      DEBIAN_X86_64_BUILD_IMAGE_PATH: "debian/x86_64_build"
>> -   DEBIAN_BUILD_TAG: "2023-10-08-config"
>> +   DEBIAN_BUILD_TAG: "2024-05-09-virtio"
>>   
>> -   KERNEL_ROOTFS_TAG: "2023-10-06-amd"
>> +   KERNEL_ROOTFS_TAG: "2024-05-09-virtio"
>>   
>>      DEBIAN_X86_64_TEST_BASE_IMAGE: "debian/x86_64_test-base"
>>      DEBIAN_X86_64_TEST_IMAGE_GL_PATH: "debian/x86_64_test-gl"
>> diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
>> index 612c9ede3507..864ac3809d84 100644
>> --- a/drivers/gpu/drm/ci/test.yml
>> +++ b/drivers/gpu/drm/ci/test.yml
>> @@ -350,6 +350,7 @@ virtio_gpu:none:
>>     script:
>>       - ln -sf $CI_PROJECT_DIR/install /install
>>       - mv install/bzImage /lava-files/bzImage
>> +    - mkdir -p /lib/modules
> 
> Is it necessary to create it manually here?
> 
>>       - mkdir -p $CI_PROJECT_DIR/results
>>       - ln -sf $CI_PROJECT_DIR/results /results
>>       - install/crosvm-runner.sh install/igt_runner.sh
>> diff --git a/drivers/gpu/drm/ci/x86_64.config b/drivers/gpu/drm/ci/x86_64.config
>> index 1cbd49a5b23a..78479f063e8e 100644
>> --- a/drivers/gpu/drm/ci/x86_64.config
>> +++ b/drivers/gpu/drm/ci/x86_64.config
>> @@ -91,7 +91,7 @@ CONFIG_KVM=y
>>   CONFIG_KVM_GUEST=y
>>   CONFIG_VIRT_DRIVERS=y
>>   CONFIG_VIRTIO_FS=y
>> -CONFIG_DRM_VIRTIO_GPU=y
>> +CONFIG_DRM_VIRTIO_GPU=m
>>   CONFIG_SERIAL_8250_CONSOLE=y
>>   CONFIG_VIRTIO_NET=y
>>   CONFIG_VIRTIO_CONSOLE=y
>> -- 
>> 2.40.1
>>
> 

