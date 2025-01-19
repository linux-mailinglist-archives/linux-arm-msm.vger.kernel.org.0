Return-Path: <linux-arm-msm+bounces-45504-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AA085A1615B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Jan 2025 12:29:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 20BE31885BD2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Jan 2025 11:29:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DDAB19DF6A;
	Sun, 19 Jan 2025 11:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="xMqoqpXw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3911C1CDFD5
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Jan 2025 11:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737286169; cv=none; b=ipytegg2bZqoQhkgddyRB+v+ZxZ5IjQkpuNOv2UWj2/wGjjrUGiZqVyg7Bo+BwDtmZpHcvAfpfNvhDJ+pO6+128k+Vzd+dCCdWFqnVDsS7MUrzEWXj4UTrMMvCESUkAh/+gLYEhK1fgQ4KBNaNYDbDDASQATdFw0tZNYFFYltqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737286169; c=relaxed/simple;
	bh=7RerRqZdue3bMzgOBsuTBAAh+prW4dbvWF7BYRiX6tQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a/loGJZz4gyexXLgNHijZQewAF5zcPPU2clRkdYk8uKYmDrQQktSWRzy6ZTSPODvNipl6Y9Ez8P/uB2itRo6YKp0ljV7cgREJUGnTYzdyvb5Sq2IR6p8GfXHaBDqgYyXzkW1LXorUVRme3dbESo7EgGKsOP0GBiQLHN8N7t+w4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=xMqoqpXw; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <b97fcd2f-516a-4172-aef3-631418564cfa@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737286164;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uuK0LkbEgQqPgK0yPnR5LzoggyynezSlKlKR/CKdeTY=;
	b=xMqoqpXwM+10B3buteMukau9UQmlGuAXyj0ur9aXSA7WbWzwRnMniPiQaxTWp6qqTY2fRw
	kdeVaGsloeyKfqel8VbZAIHcFFD77zLC4uiMyod2/pw8443jMEAy0AngMSBb8Lp3KLn9lX
	baphMPg1zk5Qs828ODB8iVWTCpuol5w=
Date: Sun, 19 Jan 2025 19:29:14 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 25/25] drm/xlnx: Compute dumb-buffer sizes with
 drm_mode_size_dumb()
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 nouveau@lists.freedesktop.org, virtualization@lists.linux.dev,
 spice-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
 intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andy Yan <andyshrk@163.com>, Daniel Stone <daniel@fooishbar.org>
References: <f3ba05c7-6e49-4641-a3f9-ba418ebdb7c3@ideasonboard.com>
 <c6735280-7c32-4319-8ca9-a7305d8117c3@suse.de>
 <d67adb03-5cd0-4ac9-af58-cf4446dacee3@ideasonboard.com>
 <0ea6be58-0e04-4172-87cd-064a3e4a43bc@suse.de>
 <f35cb350-6be9-48ca-ad7e-e9dd418281d5@ideasonboard.com>
 <4af0b6a7-c16a-4187-bbf5-365a9c86de21@suse.de>
 <e327ad84-b5c9-4480-b873-dc3aca605538@ideasonboard.com>
 <a2bbeb47-2569-4ee0-9265-92bab139bdc6@suse.de>
 <f3833771-fcd7-45dc-9019-1525fef34429@ideasonboard.com>
 <CAMuHMdXxYa+Na3XxpLTy=-eUL_zQ9kAiUKYu-E04u3KWApusSA@mail.gmail.com>
 <xz5ncq67bgmdase2jg3cfvyaxpiwhol2eqpfzow6dqpauvslo5@2w3rw27lhnxo>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <xz5ncq67bgmdase2jg3cfvyaxpiwhol2eqpfzow6dqpauvslo5@2w3rw27lhnxo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hi,

On 2025/1/16 18:35, Dmitry Baryshkov wrote:
> On Thu, Jan 16, 2025 at 11:17:50AM +0100, Geert Uytterhoeven wrote:
>> On Thu, Jan 16, 2025 at 11:03 AM Tomi Valkeinen
>> <tomi.valkeinen@ideasonboard.com> wrote:
>>> On 16/01/2025 10:09, Thomas Zimmermann wrote:
>>>> Am 15.01.25 um 15:20 schrieb Tomi Valkeinen:
>>>> [...]
>>>>> My point is that we have the current UAPI, and we have userspace using
>>>>> it, but we don't have clear rules what the ioctl does with specific
>>>>> parameters, and we don't document how it has to be used.
>>>>>
>>>>> Perhaps the situation is bad, and all we can really say is that
>>>>> CREATE_DUMB only works for use with simple RGB formats, and the
>>>>> behavior for all other formats is platform specific. But I think even
>>>>> that would be valuable in the UAPI docs.
>>>> To be honest, I would not want to specify behavior for anything but the
>>>> linear RGB formats. If anything, I'd take Daniel's reply mail for
>>>> documentation as-is. Anyone stretching the UAPI beyond RGB is on their own.
>>>>
>>>>> Thinking about this, I wonder if this change is good for omapdrm or
>>>>> xilinx (probably other platforms too that support non-simple non-RGB
>>>>> formats via dumb buffers): without this patch, in both drivers, the
>>>>> pitch calculations just take the bpp as bit-per-pixels, align it up,
>>>>> and that's it.
>>>>>
>>>>> With this patch we end up using drm_driver_color_mode_format(), and
>>>>> aligning buffers according to RGB formats figured out via heuristics.
>>>>> It does happen to work, for the formats I tested, but it sounds like
>>>>> something that might easily not work, as it's doing adjustments based
>>>>> on wrong format.
>>>>>
>>>>> Should we have another version of drm_mode_size_dumb() which just
>>>>> calculates using the bpp, without the drm_driver_color_mode_format()
>>>>> path? Or does the drm_driver_color_mode_format() path provide some
>>>>> value for the drivers that do not currently do anything similar?
>>>> With the RGB-only rule, using drm_driver_color_mode_format() makes
>>>> sense. It aligns dumb buffers and video=, provides error checking, and
>>>> overall harmonizes code. The fallback is only required because of the
>>>> existing odd cases that already bend the UAPI's rules.
>>> I have to disagree here.
>>>
>>> On the platforms I have been using (omap, tidss, xilinx, rcar) the dumb
>>> buffers are the only buffers you can get from the DRM driver. The dumb
>>> buffers have been used to allocate linear and multiplanar YUV buffers
>>> for a very long time on those platforms.
>>>
>>> I tried to look around, but I did not find any mentions that CREATE_DUMB
>>> should only be used for RGB buffers. Is anyone outside the core
>>> developers even aware of it?
>>>
>>> If we don't use dumb buffers there, where do we get the buffers? Maybe
>>> from a v4l2 device or from a gpu device, but often you don't have those.
>>> DMA_HEAP is there, of course.
>> Why can't there be a variant that takes a proper fourcc format instead of
>> an imprecise bpp value?
> Backwards compatibility. We can add an IOCTL for YUV / etc.

[...]

> But userspace must be able to continue allocating YUV buffers through
> CREATE_DUMB.

I think, allocating YUV buffers through CREATE_DUMB interface is just
an *abuse* and *misuse* of this API for now.

Take the NV12 format as an example, NV12 is YUV420 planar format, have
two planar: the Y-planar and the UV-planar. The Y-planar appear first
in memory as an array of unsigned char values. The Y-planar is followed
immediately by the UV-planar, which is also an array of unsigned char
values that contains packed U (Cb) and V (Cr) samples.

But the 'drm_mode_create_dumb' structure is only intend to provide
descriptions for *one* planar.

struct drm_mode_create_dumb {
     __u32 height;
     __u32 width;
     __u32 bpp;
     __u32 flags;
     __u32 handle;
     __u32 pitch;
     __u64 size;
};

An width x height NV12 image takes up width*height*(1 + 1/4 + 1/4) bytes.

So we can allocate an *equivalent* sized buffer to store the NV12 raw data.

Either 'width * (height * 3/2)' where each pixel take up 8 bits,
or just 'with * height' where each pixels take up 12 bits.

However, all those math are just equivalents description to the original
NV12 format, neither are concrete correct physical description.

Therefore, allocating YUV buffers through the dumb interface is just an
abuse for that API. We certainly can abuse more by allocating two dumb
buffers, one for Y-planer, another one for the UV-planer. But again,dumb buffers can be (and must be) used for *scanout* directly. What will yield if I commit the YUV buffers you allocated to the CRTC directly?

In other words, You can allocated buffers via the dumb APIs to store anything,
but the key point is that how can we interpret it.

As Daniel puts it, the semantics of that API is well defined for simple RGB
formats. Usages on non linear RGB dumb buffers are considered as undefined
behavior.

Peoples can still abusing it at the user-space though, but the kernel don't
have to guarantee that the user-space *must* to be able to continue doing
balabala..., That's it.


Best regards,
Sui

>> Gr{oetje,eeting}s,
>>
>>                          Geert
>>
>> -- 
>> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>>
>> In personal conversations with technical people, I call myself a hacker. But
>> when I'm talking to journalists I just say "programmer" or something like that.
>>                                  -- Linus Torvalds

-- 
Best regards,
Sui


