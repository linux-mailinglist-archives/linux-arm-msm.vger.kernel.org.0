Return-Path: <linux-arm-msm+bounces-41656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 153FD9EDF37
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 07:06:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D7961661DF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 06:06:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1791317E900;
	Thu, 12 Dec 2024 06:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="NpefOtj8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBFA5684;
	Thu, 12 Dec 2024 06:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733983605; cv=none; b=WaHIlhZD/i729oPYQs/OYdkg8zdcLCxSejseSPWKkXGVpnGLt0fj7N83756gbmCKyvwWvwexfHYb32zlZyrAvoyWfJ5dRtqaukHopYj8glHDqcfk4GhXVnQa5xnMrAjVYHogWs0sodEYBxc1o2q/6ciC5bDZQVIfurH5V9/ecIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733983605; c=relaxed/simple;
	bh=gQg/SM6BaV0O6607W1vHe3GKWdp7ZsBXFCJWNiK9SFw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pkR/5X8mYxoJbuSO1Ho9edBI4SzJix0ivAJdGwhm7X0Sy1GSsZwRjVhXRGNmJiuOlJWMCJM5+dmnU9UOArWutc8rGxfbXhogPrJ4TlqIAWDXBTZU0q3V4S/+iL01JExwxOnWjKZw6or6ZQHYAWJgto9wokmNDy3s8XXlteXv0OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=NpefOtj8; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733983599;
	bh=gQg/SM6BaV0O6607W1vHe3GKWdp7ZsBXFCJWNiK9SFw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NpefOtj8iRu+DwDxM1asoHnH6dziH2LfwLXKHmxJwjyTK2JN3w24yG15L61xz/p4E
	 1Q1hNWZSfjRGmpsMMSTs9jLtwssefNOSG/RM9//dKBgGoAZsPgvidKcKcmYdqNDckT
	 DvXj7srS8GjxNG82ITA2ZyObZDMr+FKJHnPXJ2eCGa/aPO9skbkJH1KUiy92L5TrrG
	 xe21GkQQE1jht1xTcoxCHfDQkpM7JcmrU5YdJUw6tiO4zFjK2H8i7k5fb5KgqX2LQ0
	 4RGQwkIzVXHI/rHmuP57LGp8g4Zw2YWtHmYQD+Vb8T5wcqhADpRO9HVMDW86ncn8wZ
	 iSdqcwuU72+UQ==
Received: from [192.168.50.250] (unknown [171.76.86.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B8F6917E11E2;
	Thu, 12 Dec 2024 07:06:32 +0100 (CET)
Message-ID: <3e719a95-5b84-4530-9afe-c742e5c6eff7@collabora.com>
Date: Thu, 12 Dec 2024 11:36:29 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/ci: uprev IGT
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com,
 helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch,
 robdclark@gmail.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org,
 amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20241211142806.1824961-1-vignesh.raman@collabora.com>
 <f2dac4eatkajw633ksnnb3nfq7zop2l4ux2euj6jqg4hg3soqt@sv7p2r6xk7fz>
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <f2dac4eatkajw633ksnnb3nfq7zop2l4ux2euj6jqg4hg3soqt@sv7p2r6xk7fz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Dmitry,

On 12/12/24 03:09, Dmitry Baryshkov wrote:
> On Wed, Dec 11, 2024 at 07:58:05PM +0530, Vignesh Raman wrote:
>> Uprev IGT to the latest version and update expectation files.
>>
>> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
>> ---
>>
>> v1:
>>    - Pipeline link - https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1327810
>>      Will update the flake bug report link after v1 is reviewed.
>>
>> ---
>> diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt b/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
>> index 066d24ee3e08..7752adff05c1 100644
>> --- a/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
>> +++ b/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
>> @@ -1,4 +1,7 @@
>>   kms_3d,Fail
>> +kms_cursor_legacy@forked-bo,Fail
>> +kms_cursor_legacy@forked-move,Fail
>> +kms_cursor_legacy@single-bo,Fail
>>   kms_cursor_legacy@torture-bo,Fail
> 
> Interesting, DRM_MODE_CURSOR_BO tests fail
> 
>>   kms_force_connector_basic@force-edid,Fail
>>   kms_hdmi_inject@inject-4k,Fail
>> diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
>> index 6dbc2080347d..581d0aa33b4f 100644
>> --- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
>> +++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
>> @@ -8,6 +8,8 @@ kms_color@ctm-red-to-blue,Fail
>>   kms_color@ctm-signed,Fail
>>   kms_cursor_legacy@cursor-vs-flip-toggle,Fail
>>   kms_cursor_legacy@cursor-vs-flip-varying-size,Fail
>> +kms_display_modes@extended-mode-basic,Fail
>> +kms_display_modes@mst-extended-mode-negative,Fail
> 
> This is a bug in 5f7cde6a9878 ("tests/kms_display_modes: Skip test if
> joiner display is connected"), the driver unconditionally calls
> is_joiner_mode(), or in 88abc2d2c646 ("lib/igt_kms: Add is_joiner_mode
> function"), the is_joiner_mode() should return false for non-Intel
> hardware. Please fix it in the IGT instead.

Can we add this in skips mentioning the IGT gitab issue link?

> 
>>   kms_flip@flip-vs-modeset-vs-hang,Fail
>>   kms_flip@flip-vs-panning-vs-hang,Fail
>>   kms_lease@lease-uevent,Fail
>> @@ -15,4 +17,3 @@ kms_pipe_crc_basic@compare-crc-sanitycheck-nv12,Fail
>>   kms_plane_alpha_blend@alpha-7efc,Fail
>>   kms_plane_alpha_blend@coverage-7efc,Fail
>>   kms_plane_alpha_blend@coverage-vs-premult-vs-constant,Fail
>> -kms_rmfb@close-fd,Fail
>> diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-flakes.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-flakes.txt
>> index d74e04405e65..5122233b9941 100644
>> --- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-flakes.txt
>> +++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-flakes.txt
>> @@ -18,3 +18,10 @@ msm/msm_shrink@copy-gpu-oom-32
>>   # IGT Version: 1.28-g0df7b9b97
>>   # Linux Version: 6.9.0-rc7
>>   msm/msm_shrink@copy-gpu-oom-8
>> +
>> +# Board Name: sc7180-trogdor-kingoftown
>> +# Bug Report:
>> +# Failure Rate: 50
>> +# IGT Version: 1.29-g33adea9eb
>> +# Linux Version: 6.13.0-rc2
>> +kms_lease@page-flip-implicit-plane
> 
> Do you have a failure log?


https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/68026461#L3262

Let me know if I can create a gitlab issue for this.

Regards,
Vginesh

> 
>> diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
>> index 6dbc2080347d..581d0aa33b4f 100644
>> --- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
>> +++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
>> @@ -8,6 +8,8 @@ kms_color@ctm-red-to-blue,Fail
>>   kms_color@ctm-signed,Fail
>>   kms_cursor_legacy@cursor-vs-flip-toggle,Fail
>>   kms_cursor_legacy@cursor-vs-flip-varying-size,Fail
>> +kms_display_modes@extended-mode-basic,Fail
>> +kms_display_modes@mst-extended-mode-negative,Fail
> 
> Again, the same IGT issue.
> 
>>   kms_flip@flip-vs-modeset-vs-hang,Fail
>>   kms_flip@flip-vs-panning-vs-hang,Fail
>>   kms_lease@lease-uevent,Fail
>> @@ -15,4 +17,3 @@ kms_pipe_crc_basic@compare-crc-sanitycheck-nv12,Fail
>>   kms_plane_alpha_blend@alpha-7efc,Fail
>>   kms_plane_alpha_blend@coverage-7efc,Fail
>>   kms_plane_alpha_blend@coverage-vs-premult-vs-constant,Fail
>> -kms_rmfb@close-fd,Fail
>> diff --git a/drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt
>> index fa8c7e663858..69076751af24 100644
>> --- a/drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt
>> +++ b/drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt
>> @@ -1,4 +1,3 @@
>> -drm_read@invalid-buffer,Fail
>>   kms_color@ctm-0-25,Fail
>>   kms_color@ctm-0-50,Fail
>>   kms_color@ctm-0-75,Fail
>> @@ -19,6 +18,8 @@ kms_cursor_legacy@flip-vs-cursor-atomic,Fail
>>   kms_cursor_legacy@flip-vs-cursor-crc-atomic,Fail
>>   kms_cursor_legacy@flip-vs-cursor-crc-legacy,Fail
>>   kms_cursor_legacy@flip-vs-cursor-legacy,Fail
>> +kms_display_modes@extended-mode-basic,Fail
>> +kms_display_modes@mst-extended-mode-negative,Fail
> 
> The same IGT error
> 
>>   kms_flip@flip-vs-modeset-vs-hang,Fail
>>   kms_flip@flip-vs-panning-vs-hang,Fail
>>   kms_lease@lease-uevent,Fail
>> @@ -28,4 +29,3 @@ kms_plane_alpha_blend@coverage-7efc,Fail
>>   kms_plane_alpha_blend@coverage-vs-premult-vs-constant,Fail
>>   kms_plane_cursor@overlay,Fail
>>   kms_plane_cursor@viewport,Fail
>> -kms_rmfb@close-fd,Fail
>> diff --git a/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-fails.txt
>> index 4892c0c70a6d..8d26b23133aa 100644
>> --- a/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-fails.txt
>> +++ b/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-fails.txt
>> @@ -7,9 +7,4 @@ kms_cursor_legacy@torture-bo,Fail
>>   kms_cursor_legacy@torture-move,Fail
>>   kms_hdmi_inject@inject-4k,Fail
>>   kms_lease@lease-uevent,Fail
>> -kms_plane_alpha_blend@alpha-7efc,Fail
>> -kms_plane_alpha_blend@alpha-basic,Fail
>> -kms_plane_alpha_blend@alpha-opaque-fb,Fail
>> -kms_plane_alpha_blend@alpha-transparent-fb,Fail
>> -kms_plane_alpha_blend@constant-alpha-max,Fail
>>   msm/msm_recovery@gpu-fault-parallel,Fail
>> diff --git a/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-flakes.txt b/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-flakes.txt
>> deleted file mode 100644
>> index c1859d9b165f..000000000000
>> --- a/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-flakes.txt
>> +++ /dev/null
>> @@ -1,6 +0,0 @@
>> -# Board Name: sm8350-hdk
>> -# Bug Report: https://gitlab.freedesktop.org/drm/msm/-/issues/65
>> -# Failure Rate: 100
>> -# IGT Version: 1.28-ga73311079
>> -# Linux Version: 6.12.0-rc1
>> -msm/msm_recovery@gpu-fault
> 

