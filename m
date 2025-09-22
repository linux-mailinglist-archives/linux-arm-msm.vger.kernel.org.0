Return-Path: <linux-arm-msm+bounces-74449-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C5609B923C6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 18:33:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7BB793A4BAE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 16:33:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A610E30C625;
	Mon, 22 Sep 2025 16:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P9sqOndv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752182D7812
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 16:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758558784; cv=none; b=UXUdOHOudF9kMghndi9O+nWoPfGoQogBbrLJ4dpT0tSgEZSYETqIpixT4mUQnFKgsbpL9OtcNCj3Tn5xaQXeLYr+atimwFov5/a0/E9njs/wMsno4W330hE0PPXcqqVTjdGGAGkRxIfAYVfCosuUHkXftFgfpTCNTLeaNadYza4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758558784; c=relaxed/simple;
	bh=wGAPuFleOTPdg3Nd74WJol9VRVfv/oElnmTC1BhpF1A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UPgNENMePdLEX2l9h1sEW7xGb2aTaMunGjiFdzeR67LSoqEeemcOJahn7PgAvs7t/OWedlnXorqzsSAQAWSCGn8QcT+JZ7ypehyLm0CmBl67hOS7+NyGJ+UaWwKSFZ2cUfl+yuqcuBBL29/K5upHvHX+H+4iGFzPsHtq1+kN6uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P9sqOndv; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-46dfd711172so7926885e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 09:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758558781; x=1759163581; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v1wHAoCkXd5geKh9VVRmxk6qpbp5tT7LVPERA+lkELM=;
        b=P9sqOndvxOY/bKS/Lwh9YTEoM3+g6tNFBeXZrrn7uynjG5miF+6xcrUdUESntRz45j
         BJXdGR3dYlJpPTooUZf+rrLed3I0a9QAwXeApej9z/3nY3jKCI5uN1qHAySVuLZgyQeE
         iBzDnjSfCSmjDwmf4crejO5ZenVSF6MoYViTmptpCwuRA2JKHeC6iswsDYrigtyRXR8Z
         sv3p53MQssMPgSc/speJBM0xFAB7CAZ9PhaqCQtLeFnIkj4NU+3t+s3rsv87lT7ncvtI
         chsISMe3TTyPpY6cUzYT/v53679bOsQQIm3Kf6jrlaFJcGaSgVbanl51SXGyzpD0FoEE
         1BZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758558781; x=1759163581;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v1wHAoCkXd5geKh9VVRmxk6qpbp5tT7LVPERA+lkELM=;
        b=kXCtHsWK23xHmf90NrnVgdhRWJTKvKJtBJTWcGF9Ad6z5jx5SGiv0E0wiAphN9MJ4C
         W8fu46qWp6sUq82QHHXt75ZmRCHAnfg3Zw/B3qTDoiujymcB/zglKwPC2aLdRxLcAfJj
         pZb0a62Y4BL5NC2VF8CWC8SdKHThG1PNc/tQ5X4H/e7/DkNWY141e0kp3IWFgAJYsZAs
         Xw47qde7U3r3WXzmqgtSln48zl5dkTOpfkPMMFm3iEpX8Oti03ikHbij8SBGj3Tl73i4
         RIHOFDSiaLWDzhMvqhCbnvGkBAF7+m9StthkRrqMTMqgiqDr4SZz2K8HLHLoMISEZOmC
         B2Ww==
X-Forwarded-Encrypted: i=1; AJvYcCVcql5PA07c8eWSCu/IVxwxWyn8IBuqAizpg3ehM+02q9+IwC5qwIiaIa0drbdbxG2Rg62mJ5K4N/0IPsig@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6cmsAAnBWoq+wJ33UeKc6SoXX/s8Qtsl9PpboeLq1QHPSvmtx
	g3kfae+h1fQOW18lP5Zx3jNmlw/Ad6cBDJ+hEFclRqZ86q1C+Bchg8r5VPaPxkxUsQc=
X-Gm-Gg: ASbGnctOJ0T+xxIg+Kj1svoEIVR1Le2+nER3/FpbwMNTWWBYmhOl22oJs2BZ8rvYKNO
	iYq3qpNECuLxemrGr2ORCFAg2W2MzKsY23S1dR2dMRHVIAAiDcjU5ViFIP/V5bv+l8oS/Z23xUW
	sji7fAK/xEB0RP3obOaD2LaHV62LNXLni6H6tuka5pvYrein0ZZhKMfvKvOQt3kE0JtPGt5OH6m
	9DVjW20N4gUzAPZyDWEshkJarxv+xXyohQqDqGCcsLtmsuBz7qlIn5qAxuAIkh3DVhxBLpVKXym
	6itsRIoTCZEmTJ5NPv01r3qD/IOSS5muvYUPHrmvolVcYNQPWzv0QkqdjzXYlLsg4Io3iuqdIi/
	kCi53gSnWMTa1qGFWyvvNIckYdI6Ouhuk
X-Google-Smtp-Source: AGHT+IGnQPkxMftXWyc0+CV4hBsymweO1uIa+g45TRCqmBDBE2a4JgAwlc/K21Y2/aal8sHjc8EnYQ==
X-Received: by 2002:a05:600c:4f42:b0:468:7a5a:725 with SMTP id 5b1f17b1804b1-4687a5a0801mr128268745e9.1.1758558780393;
        Mon, 22 Sep 2025 09:33:00 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:30:ae58:9ec8:1ac6:e1a6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-464eadd7e11sm219510625e9.0.2025.09.22.09.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 09:32:59 -0700 (PDT)
Date: Mon, 22 Sep 2025 18:32:55 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] drm/msm: Fix refcnt underflow in error path
Message-ID: <aNF6N8u1VIFSTaRM@linaro.org>
References: <20250723190852.18394-1-robin.clark@oss.qualcomm.com>
 <20250723190852.18394-2-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250723190852.18394-2-robin.clark@oss.qualcomm.com>

Hi Rob,

On Wed, Jul 23, 2025 at 12:08:49PM -0700, Rob Clark wrote:
> If we hit an error path in GEM obj creation before msm_gem_new_handle()
> updates obj->resv to point to the gpuvm resv object, then obj->resv
> still points to &obj->_resv.  In this case we don't want to decrement
> the refcount of the object being freed (since the refcnt is already
> zero).  This fixes the following splat:
> 
>    ------------[ cut here ]------------
>    refcount_t: underflow; use-after-free.
>    WARNING: CPU: 9 PID: 7013 at lib/refcount.c:28 refcount_warn_saturate+0xf4/0x148
>    Modules linked in: uinput snd_seq_dummy snd_hrtimer aes_ce_ccm snd_soc_wsa884x regmap_sdw q6prm_clocks q6apm_lpass_da>
>     qcom_pil_info i2c_hid drm_kms_helper qcom_common qcom_q6v5 phy_snps_eusb2 qcom_geni_serial drm qcom_sysmon pinctrl_s>
>    CPU: 9 UID: 1000 PID: 7013 Comm: deqp-vk Not tainted 6.16.0-rc4-debug+ #25 PREEMPT(voluntary)
>    Hardware name: LENOVO 83ED/LNVNB161216, BIOS NHCN53WW 08/02/2024
>    pstate: 61400005 (nZCv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
>    pc : refcount_warn_saturate+0xf4/0x148
>    lr : refcount_warn_saturate+0xf4/0x148
>    sp : ffff8000a2073920
>    x29: ffff8000a2073920 x28: 0000000000000010 x27: 0000000000000010
>    x26: 0000000000000042 x25: ffff000810e09800 x24: 0000000000000010
>    x23: ffff8000a2073b94 x22: ffff000ddb22de00 x21: ffff000ddb22dc00
>    x20: ffff000ddb22ddf8 x19: ffff0008024934e0 x18: 000000000000000a
>    x17: 0000000000000000 x16: ffff9f8c67d77340 x15: 0000000000000000
>    x14: 00000000ffffffff x13: 2e656572662d7265 x12: 7466612d65737520
>    x11: 3b776f6c66726564 x10: 00000000ffff7fff x9 : ffff9f8c67506c70
>    x8 : ffff9f8c69fa26f0 x7 : 00000000000bffe8 x6 : c0000000ffff7fff
>    x5 : ffff000f53e14548 x4 : ffff6082ea2b2000 x3 : ffff0008b86ab080
>    x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0008b86ab080
>    Call trace:
>     refcount_warn_saturate+0xf4/0x148 (P)
>     msm_gem_free_object+0x248/0x260 [msm]
>     drm_gem_object_free+0x24/0x40 [drm]
>     msm_gem_new+0x1c4/0x1e0 [msm]
>     msm_gem_new_handle+0x3c/0x1a0 [msm]
>     msm_ioctl_gem_new+0x38/0x70 [msm]
>     drm_ioctl_kernel+0xc8/0x138 [drm]
>     drm_ioctl+0x2c8/0x618 [drm]
>     __arm64_sys_ioctl+0xac/0x108
>     invoke_syscall.constprop.0+0x64/0xe8
>     el0_svc_common.constprop.0+0x40/0xe8
>     do_el0_svc+0x24/0x38
>     el0_svc+0x54/0x1d8
>     el0t_64_sync_handler+0x10c/0x138
>     el0t_64_sync+0x19c/0x1a0
>    irq event stamp: 3698694
>    hardirqs last  enabled at (3698693): [<ffff9f8c675021dc>] __up_console_sem+0x74/0x90
>    hardirqs last disabled at (3698694): [<ffff9f8c68ce8164>] el1_dbg+0x24/0x90
>    softirqs last  enabled at (3697578): [<ffff9f8c6744ec5c>] handle_softirqs+0x454/0x4b0
>    softirqs last disabled at (3697567): [<ffff9f8c67360244>] __do_softirq+0x1c/0x28
>    ---[ end trace 0000000000000000 ]---
> 
> Fixes: b58e12a66e47 ("drm/msm: Add _NO_SHARE flag")
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_gem.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> index 33d3354c6102..958bac4e2768 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -1114,10 +1114,12 @@ static void msm_gem_free_object(struct drm_gem_object *obj)
>  		put_pages(obj);
>  	}
>  
> -	if (msm_obj->flags & MSM_BO_NO_SHARE) {
> +	if (obj->resv != &obj->_resv) {
>  		struct drm_gem_object *r_obj =
>  			container_of(obj->resv, struct drm_gem_object, _resv);
>  
> +		WARN_ON(!(msm_obj->flags & MSM_BO_NO_SHARE));
> +
>  		/* Drop reference we hold to shared resv obj: */
>  		drm_gem_object_put(r_obj);
>  	}

This patch seems to break something for direct IRIS/video playback using
dmabuf. I use a simple GStreamer test pipeline for testing IRIS on X1E
(on GNOME, in case that matters):

 $ gst-launch-1.0 filesrc location=bbb_sunflower_2160p_60fps_normal.mp4 \
   ! qtdemux name=d d.video_0 ! h264parse ! v4l2h264dec \
   ! capture-io-mode=dmabuf ! waylandsink

The video plays fine, but if I try to exit (CTRL+C) the display hangs
for a few seconds and then the console is spammed with pretty much
exactly the messages that you tried to fix here. If I revert this patch,
everything is fine again. It feels like your patch does exactly the
opposite for this use case. :-)

It seems to run into the WARN_ON you added.

Any ideas?

linux-next should have IRIS support for the Slim 7x if you want to try
this for yourself. Or alternatively, there is a backport for 6.17-rc7 in
the Linaro arm64-laptops tree: https://gitlab.com/Linaro/arm64-laptops/linux

You can find the test video here:
https://download.blender.org/demo/movies/BBB/

Thanks,
Stephan

[  107.430721] ------------[ cut here ]------------
[  107.435513] WARNING: CPU: 3 PID: 2040 at drivers/gpu/drm/msm/msm_gem.c:1127 msm_gem_free_object+0x1f8/0x264 [msm]
[  107.630472] CPU: 3 UID: 1000 PID: 2040 Comm: .gnome-shell-wr Not tainted 6.17.0-rc7 #1 PREEMPT 
[  107.630482] pstate: 81400005 (Nzcv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
[  107.630488] pc : msm_gem_free_object+0x1f8/0x264 [msm]
[  107.676630] lr : msm_gem_free_object+0x138/0x264 [msm]
[  107.676666] sp : ffff800092a1bb30
[  107.676668] x29: ffff800092a1bb80 x28: ffff800092a1bce8 x27: ffffbc702dbdbe08
[  107.676676] x26: 0000000000000008 x25: 0000000000000009 x24: 00000000000000a6
[  107.676682] x23: ffff00083c72f850 x22: ffff00083c72f868 x21: ffff00087e69f200
[  107.676689] x20: ffff00087e69f330 x19: ffff00084d157ae0 x18: 0000000000000000
[  107.676695] x17: 0000000000000000 x16: ffffbc704bd46b80 x15: 0000ffffd0959540
[  107.676701] x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
[  107.676706] x11: ffffbc702e6cdb48 x10: 0000000000000000 x9 : 000000000000003f
[  107.676712] x8 : ffff800092a1ba90 x7 : 0000000000000000 x6 : 0000000000000020
[  107.676718] x5 : ffffbc704bd46c40 x4 : fffffdffe102cf60 x3 : 0000000000400032
[  107.676724] x2 : 0000000000020000 x1 : ffff00087e6978e8 x0 : ffff00087e6977e8
[  107.676731] Call trace:
[  107.676733]  msm_gem_free_object+0x1f8/0x264 [msm] (P)
[  107.676771]  drm_gem_object_free+0x1c/0x30 [drm]
[  107.676816]  drm_gem_object_handle_put_unlocked+0x138/0x150 [drm]
[  107.676852]  drm_gem_object_release_handle+0x5c/0xcc [drm]
[  107.676886]  drm_gem_handle_delete+0x68/0xbc [drm]
[  107.788743]  drm_gem_close_ioctl+0x34/0x40 [drm]
[  107.793553]  drm_ioctl_kernel+0xc0/0x130 [drm]
[  107.798178]  drm_ioctl+0x360/0x4e0 [drm]
[  107.802277]  __arm64_sys_ioctl+0xac/0x104
[  107.806436]  invoke_syscall+0x48/0x104
[  107.810334]  el0_svc_common.constprop.0+0x40/0xe0
[  107.815209]  do_el0_svc+0x1c/0x28
[  107.818662]  el0_svc+0x34/0xec
[  107.821838]  el0t_64_sync_handler+0xa0/0xe4
[  107.826173]  el0t_64_sync+0x198/0x19c
[  107.829971] ---[ end trace 0000000000000000 ]---
[  107.834789] ------------[ cut here ]------------
[  107.839587] refcount_t: underflow; use-after-free.
[  107.844553] WARNING: CPU: 3 PID: 2040 at lib/refcount.c:28 refcount_warn_saturate+0xf4/0x144
[  108.052928] CPU: 3 UID: 1000 PID: 2040 Comm: .gnome-shell-wr Tainted: G        W           6.17.0-rc7 #1 PREEMPT 
[  108.063491] Tainted: [W]=WARN
[  108.075627] pstate: 61400005 (nZCv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
[  108.082808] pc : refcount_warn_saturate+0xf4/0x144
[  108.087756] lr : refcount_warn_saturate+0xf4/0x144
[  108.092704] sp : ffff800092a1bb20
[  108.096141] x29: ffff800092a1bb20 x28: ffff800092a1bce8 x27: ffffbc702dbdbe08
[  108.103491] x26: 0000000000000008 x25: 0000000000000009 x24: 00000000000000a6
[  108.110852] x23: ffff00083c72f850 x22: ffff00083c72f868 x21: ffff00087e69f200
[  108.118222] x20: ffff00087e69f330 x19: ffff00084d157ae0 x18: 0000000000000006
[  108.125572] x17: 0000000000000000 x16: ffffbc704ba1eda0 x15: ffff800092a1b6ef
[  108.132925] x14: 000000000000003a x13: 000000000000003a x12: 0000000000000000
[  108.140280] x11: 00000000000000c0 x10: d2c95932de8ceaa3 x9 : 128386994077d608
[  108.147631] x8 : ffff000840c0c588 x7 : 0000000002ac3ea0 x6 : 0000000000000002
[  108.154990] x5 : 0000000435572e2f x4 : 0000000000000002 x3 : 0000000000000010
[  108.162339] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff000840c0b480
[  108.169697] Call trace:
[  108.172243]  refcount_warn_saturate+0xf4/0x144 (P)
[  108.177199]  msm_gem_free_object+0x25c/0x264 [msm]
[  108.182167]  drm_gem_object_free+0x1c/0x30 [drm]
[  108.186943]  drm_gem_object_handle_put_unlocked+0x138/0x150 [drm]
[  108.193237]  drm_gem_object_release_handle+0x5c/0xcc [drm]
[  108.198906]  drm_gem_handle_delete+0x68/0xbc [drm]
[  108.203867]  drm_gem_close_ioctl+0x34/0x40 [drm]
[  108.208651]  drm_ioctl_kernel+0xc0/0x130 [drm]
[  108.213248]  drm_ioctl+0x360/0x4e0 [drm]
[  108.217319]  __arm64_sys_ioctl+0xac/0x104
[  108.221464]  invoke_syscall+0x48/0x104
[  108.225343]  el0_svc_common.constprop.0+0x40/0xe0
[  108.230207]  do_el0_svc+0x1c/0x28
[  108.233650]  el0_svc+0x34/0xec
[  108.236817]  el0t_64_sync_handler+0xa0/0xe4
[  108.241143]  el0t_64_sync+0x198/0x19c
[  108.244931] ---[ end trace 0000000000000000 ]---


