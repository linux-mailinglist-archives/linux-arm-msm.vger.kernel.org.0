Return-Path: <linux-arm-msm+bounces-109041-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WCA9Dsz0DmqmDQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109041-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 14:04:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CD15A4792
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 14:04:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 317D03022879
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 12:04:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0D483C5859;
	Thu, 21 May 2026 12:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lHxflUCe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A374371D15
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 12:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779365063; cv=none; b=pyxxafGxDX4HM+y1kYEu5XxVUT22VtmqWhi9lg64eBW97me9/3cXA4LDGe5fVnw+RvDexxKuEDRHyGnNuv6dMgMHSg/v0NdMcIgjwJgzjS8Is2VkxvXMgcswhq4hwYquFSkW8J3SGYzvD+QMHex+km5tsna8+Bft7OUyl+3Kvy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779365063; c=relaxed/simple;
	bh=sUj3Twmg9sv0IDvSRDz8N2kvdStNX/TLH4+TmHaPjNE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qWDa+1DujBt5/6rbCIBbx3goG0eLQjhNAe96i7d0bdmlf9w38zqqnsBNJdZADPqf9xM7w55p4y0+2w3MKa5a1m49CL5r6nEFZfI/tac9h1MdJpZlhpuAMazmrIZ7JeWOuzrz6C+i/VzmkotZxNysKpgPEPIQFTsVajMEO2Pyj28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lHxflUCe; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49039a8851fso5637175e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 05:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779365060; x=1779969860; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kjahf0mvv6U9uz8GUu7it7h6OHA5HQ2HOSOEgZINcYE=;
        b=lHxflUCeC61k47AfshSEUYR7WBGR1SeMLDN05P3arvCggEdqx6DNzd8ABA8acldvA5
         qanOp3SYwXl8HRfOdKGfTU+s3tDjYTlVe92h8VeH0E6PGHh5Yaqp6Mh+I+jh4x+Oefq/
         Tp2jNDPc9q6Jsmbmu5gF1CnGZ25e7ZYWNyvNS83r1I+dAHZiZ1q52qrpWJrfqif14wiU
         Ai0fd1pNIpZ1WLUjnJgEfzkMQGVaVashLx3/sOuw+D2Up53R5+3wgyjov9hcRtQDzbVQ
         wNshp2ZZGbu8MJldff+zWxVm+W94t7zvwiq7ThCmKm3h9WZSEMI6f4GcM5nHu/rvwDMi
         KqGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779365060; x=1779969860;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kjahf0mvv6U9uz8GUu7it7h6OHA5HQ2HOSOEgZINcYE=;
        b=GY8nEbCf1KLnW9KvIlgWcHr0swYsIUU4K8b1T0UNfDjob3qlB13qemEWWyEPDmK2+d
         06Qy6fDTgpu2rzUnK+IppsczPcvHuOPNtVuwq8yxTH4cRRNrq/WCycEq4xIb5eDriRIJ
         G7eCX1PPp4g7f0hQUMsN6nvWxWu8veaZpfyATxW9HJVpG9a02/odV7qGZRg4QS0l5ncC
         qzqHtT/RWJwF8Gc2Ceve8PMGSUzMkecertAb2eYWLgr/1YKl7boKNHjssw8SBLu3RWMn
         M4UDMYt1edCYmbpCkdsagr80JEiHJBUoR7vjcPQjTkLE45Dzaw0AtaDC7ORo1Ug/vF1A
         p+Rg==
X-Forwarded-Encrypted: i=1; AFNElJ8JCsbx/PnrX2j1Q3MOzXhktoMI3Fq3PpnL2gUpanewQjjUbay9dIRMk+HAimopIsUUUJKtDRw8yF3txKBH@vger.kernel.org
X-Gm-Message-State: AOJu0YzXgyiSmk1Xvvio1gMdRYTzAXtL7SUT7L65vxpJTTRTrgaP+TBk
	VCh5hSpt5cTp+xSudw+tJf4hgKwsSCO0cj/U5ccWdPKz8PkgCQpFm0mAYzTcKiLSWxI=
X-Gm-Gg: Acq92OGy4rKD6llJYh0IEHm6i9RwTnEZ42fhH2rGIJddBDvJ5B887rNOGf0P2w5WTJv
	iPU2QQvLNRA1g6CuuJASu/deoynLc51y/WgKsjhyLyBy4bsmeaKoIeI66ovwZHuS3Q2fQ/8V10u
	oo348sSpcky+eiY7T5qaR9W+NELnaOFhy+CVc50/RQ0QlWIC1nUrPu5LtPzt6lzOD/zHU8Rw/w+
	x6e9jHHkzXrFp+wByGpmOkI8ga0V6hW+LbQp0GJTzhJn7Fxcc1TRf8O9ZZRo9Ifn7scAJxqXWzI
	clb+pCbAR3AZUO3Bgz+oLsBj1MW/a7949CaLw1dTTQIUIQlcJYHZu52OJo9jD2MTD/SLtGi9sLX
	QVklTzSQJXxBdVIV48X/hxRjPCLn2Fdc+nuvhLyShsZLy1JoMWfP+AxAz1vOLezNdawVI490tEI
	ud+M0a9hHwFcpmzUBgxeZNYIR4c5e/otFctg==
X-Received: by 2002:a05:600c:6c8:b0:489:1d74:56d with SMTP id 5b1f17b1804b1-490360c52e4mr22056995e9.29.1779365060197;
        Thu, 21 May 2026 05:04:20 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.55.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903c99d807sm25117975e9.5.2026.05.21.05.04.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 05:04:19 -0700 (PDT)
Message-ID: <ac559877-f4f2-48d7-b00c-4cf24fc64489@linaro.org>
Date: Thu, 21 May 2026 13:04:18 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: x1-dell-thena: bump linux,cma to
 256 MiB
To: Michael Scott <mike.scott@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org
Cc: vkoul@kernel.org, neil.armstrong@linaro.org,
 dmitry.baryshkov@oss.qualcomm.com, wesley.cheng@oss.qualcomm.com,
 abelvesa@kernel.org, faisal.hassan@oss.qualcomm.com,
 linux-phy@lists.infradead.org, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, val@packett.cool, laurentiu.tudor1@dell.com,
 alex.vinarskis@gmail.com, linux-kernel@vger.kernel.org
References: <20260521010935.1333494-1-mike.scott@oss.qualcomm.com>
 <20260521010935.1333494-5-mike.scott@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20260521010935.1333494-5-mike.scott@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,oss.qualcomm.com,lists.infradead.org,vger.kernel.org,packett.cool,dell.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109041-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.10:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,linaro.org:mid,linaro.org:dkim,0.0.0.1:email,qualcomm.com:email,ac16000:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: A1CD15A4792
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 21/05/2026 02:09, Michael Scott wrote:
> The 128 MiB linux,cma reserved-memory pool on dell-thena is too small
> to support the camera pipeline in parallel with the normal Linux
> desktop. On a freshly-booted system with GNOME running, the typical
> runtime consumers — msm DRM framebuffers (Wayland triple buffering on
> the eDP panel), qcom_iris video codec buffers, qcom_camss VFE
> pre-allocated buffers — already occupy ~100 MiB of the pool, leaving
> only ~25 MiB free.
> 
> The libcamera "simple" pipeline handler used by /dev/media0 on
> dell-thena allocates four ABGR8888 frames at 1920×1088 = 32 MiB total.
> That request fails on the fourth frame:
> 
>      ERROR DmaBufAllocator: dma-heap allocation failure for frame-3
>      ERROR Allocator: Stream is not part of /base/.../camera@10 active configuration
>      Can't allocate buffers
>      Failed to start camera session
> 
> resulting in gnome-snapshot's "Could not play camera stream" and any
> other libcamera-mediated app being unable to actually stream.
> 
> Bumping linux,cma to 256 MiB (a 0.9% reservation on these laptops'
> typical 27 GiB RAM) leaves ~150 MiB free at runtime — sufficient for
> the libcamera buffer set plus headroom for video playback or other
> CMA-hungry workloads in parallel.
> 
> Tested on Dell Latitude 7455: with the 256 MiB pool, CmaFree at
> GNOME-desktop idle is ~150 MiB, gnome-snapshot streams the OV02E10
> camera cleanly, and `cam -c 1 --capture=2` succeeds.
> 
> The companion board files dell-inspiron-14-plus-7441 and the upstream
> .dts variants inherit from x1-dell-thena.dtsi, so this changes the
> pool size for every dell-thena-based laptop in one place.
> 
> Signed-off-by: Michael Scott <mike.scott@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
> index d6de4da02dcd..714988a81384 100644
> --- a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
> @@ -167,7 +167,7 @@ led-camera-indicator {
>   	reserved-memory {
>   		linux,cma {
>   			compatible = "shared-dma-pool";
> -			size = <0x0 0x8000000>;
> +			size = <0x0 0x10000000>;
>   			reusable;
>   			linux,cma-default;
>   		};

How old is your version of libcamera ?

With CONFIG_UDMA=y you don't need a contiguous memory area at all and 
you will get juicy and delicious GPUISP.

Instead of allocating in the kernel just use a better version of libcamera

┌─[deckard@inspiron14p-linux] - [~/Development/libcamera] - [Thu May 21, 
13:03]
└─[$] <git:(0.7.0-multipass-v0*)> zcat /proc/config.gz | grep UDMA
CONFIG_UDMABUF=y
┌─[deckard@inspiron14p-linux] - [~/Development/libcamera] - [Thu May 21, 
13:03]
└─[$] <git:(0.7.0-multipass-v0*)> cam -v
libcamera version v0.7.1
┌─[deckard@inspiron14p-linux] - [~/Development/libcamera] - [Thu May 21, 
13:03]
└─[$] <git:(0.7.0-multipass-v0*)> qcam
[68:50:10.493478857] [438859]  INFO Camera camera_manager.cpp:340 
libcamera v0.7.1
[68:50:10.511134091] [438863] ERROR V4L2 v4l2_subdevice.cpp:1192 
'ov02e10 10-0010': Unable to get rectangle 2 on pad 0/0: Inappropriate 
ioctl for device
[68:50:10.511201590] [438863]  WARN CameraSensor 
camera_sensor_legacy.cpp:402 'ov02e10 10-0010': The PixelArraySize 
property has been defaulted to 1928x1088
[68:50:10.511206069] [438863] ERROR V4L2 v4l2_subdevice.cpp:1192 
'ov02e10 10-0010': Unable to get rectangle 1 on pad 0/0: Inappropriate 
ioctl for device
[68:50:10.511209559] [438863]  WARN CameraSensor 
camera_sensor_legacy.cpp:413 'ov02e10 10-0010': The 
PixelArrayActiveAreas property has been defaulted to (0, 0)/1928x1088
[68:50:10.511213778] [438863] ERROR V4L2 v4l2_subdevice.cpp:1192 
'ov02e10 10-0010': Unable to get rectangle 0 on pad 0/0: Inappropriate 
ioctl for device
[68:50:10.511216590] [438863]  WARN CameraSensor 
camera_sensor_legacy.cpp:421 'ov02e10 10-0010': Failed to retrieve the 
sensor crop rectangle
[68:50:10.511219559] [438863]  WARN CameraSensor 
camera_sensor_legacy.cpp:427 'ov02e10 10-0010': The sensor kernel driver 
needs to be fixed
[68:50:10.511221746] [438863]  WARN CameraSensor 
camera_sensor_legacy.cpp:429 'ov02e10 10-0010': See 
Documentation/sensor_driver_requirements.rst in the libcamera sources 
for more information
[68:50:10.511327474] [438863]  WARN CameraSensorProperties 
camera_sensor_properties.cpp:538 No static properties available for 
'ov02e10'
[68:50:10.511330599] [438863]  WARN CameraSensorProperties 
camera_sensor_properties.cpp:540 Please consider updating the camera 
sensor properties database
[68:50:10.511334089] [438863]  WARN CameraSensor 
camera_sensor_legacy.cpp:617 'ov02e10 10-0010': Rotation control not 
available, default to 0 degrees
[68:50:10.511340912] [438863]  WARN CameraSensor 
camera_sensor_legacy.cpp:502 'ov02e10 10-0010': No sensor delays found 
in static properties. Assuming unverified defaults.
[68:50:10.512362985] [438863]  WARN IPAProxy ipa_proxy.cpp:196 
Configuration file 'ov02e10.yaml' not found for IPA module 'simple', 
falling back to '/usr/share/libcamera/ipa/simple/uncalibrated.yaml'
[68:50:10.512372828] [438863] ERROR V4L2 v4l2_subdevice.cpp:1192 
'ov02e10 10-0010': Unable to get rectangle 0 on pad 0/0: Inappropriate 
ioctl for device
[68:50:10.512377464] [438863]  WARN CameraSensor 
camera_sensor_legacy.cpp:881 'ov02e10 10-0010': The analogue crop 
rectangle has been defaulted to the active area size
[68:50:10.512386578] [438863]  WARN IPASoft soft_simple.cpp:104 IPASoft: 
Failed to create camera sensor helper for ov02e10
[68:50:10.512505275] [438863]  INFO Camera camera_manager.cpp:223 Adding 
camera '/base/soc@0/cci@ac16000/i2c-bus@1/camera@10' for pipeline 
handler simple
[68:50:10.548026157] [438859]  INFO Camera camera.cpp:1216 configuring 
streams: (0) 1920x1088-ABGR8888/sRGB
[68:50:10.548323081] [438863]  INFO IPASoft soft_simple.cpp:258 IPASoft: 
Exposure 1-2242, gain 16-248 (1)
[68:50:10.548402247] [438863]  INFO SoftwareIsp software_isp.cpp:278 
Input 1928x1088-GRBG-10-CSI2P stride 2416
Zero-copy enabled
[68:50:10.636862424] [438866]  INFO eGL egl.cpp:288 EGL: EGL_VERSION: 1.5
[68:50:10.636899299] [438866]  INFO eGL egl.cpp:289 EGL: EGL_VENDOR: 
Mesa Project
[68:50:10.636902112] [438866]  INFO eGL egl.cpp:290 EGL: 
EGL_CLIENT_APIS: OpenGL OpenGL_ES
[68:50:10.636904768] [438866]  INFO eGL egl.cpp:291 EGL: EGL_EXTENSIONS: 
EGL_ANDROID_blob_cache EGL_ANDROID_native_fence_sync 
EGL_EXT_config_select_group EGL_EXT_create_context_robustness 
EGL_EXT_image_dma_buf_import EGL_EXT_image_dma_buf_import_modifiers 
EGL_EXT_query_reset_notification_strategy EGL_EXT_surface_compression 
EGL_IMG_context_priority EGL_KHR_cl_event2 EGL_KHR_config_attribs 
EGL_KHR_context_flush_control EGL_KHR_create_context 
EGL_KHR_create_context_no_error EGL_KHR_fence_sync 
EGL_KHR_get_all_proc_addresses EGL_KHR_gl_colorspace 
EGL_KHR_gl_renderbuffer_image EGL_KHR_gl_texture_2D_image 
EGL_KHR_gl_texture_3D_image EGL_KHR_gl_texture_cubemap_image 
EGL_KHR_image_base EGL_KHR_no_config_context EGL_KHR_reusable_sync 
EGL_KHR_surfaceless_context EGL_EXT_pixel_format_float EGL_KHR_wait_sync 
EGL_MESA_configless_context EGL_MESA_gl_interop 
EGL_MESA_image_dma_buf_export EGL_MESA_query_driver 
EGL_MESA_x11_native_visual_id EGL_NV_context_priority_realtime
[68:50:10.643064652] [438866]  INFO eGL egl.cpp:332 EGL: GL_VERSION: 
OpenGL ES 3.2 Mesa 26.0.6-arch1.1
[68:50:12.667202273] [438866]  INFO Benchmark benchmark.cpp:89 Debayer 
processed 30 frames in 228802us, 7626 us/frame
┌─[deckard@inspiron14p-linux] - [~/Development/libcamera] - [Thu May 21, 
13:03]
└─[$] <git:(0.7.0-multipass-v0*)>

