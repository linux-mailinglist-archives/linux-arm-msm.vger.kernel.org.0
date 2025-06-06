Return-Path: <linux-arm-msm+bounces-60436-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D31DDACFC3F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 07:34:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3B5EF7A60D0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 05:33:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADC441DD9AD;
	Fri,  6 Jun 2025 05:34:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565C34683;
	Fri,  6 Jun 2025 05:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749188071; cv=none; b=RGXgH4kbDdMSyrqaYGbmihtqpsLn9443ctjwDIUY2emFnahDkPTZlUCEYjs24M4MCL4+oMB6GLoroyKzEzuPCwe3CcUKxcwZwmzjUPY7jGf+JMoOX4gWvLNN73aa1zHLLA9tLHGKAZH4qsexv9F1UPrlJsZNMuCOl+WVbSdmwLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749188071; c=relaxed/simple;
	bh=riEMFiK8zdrNN4Yj3Qo3hW9QXjZmq1fPdfZytpr7bbE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lO7q4uy44gRnY6YFLPIwoD6ifHmuYKQKe15E+zx6i5VCxi5o8/wUHH07JjWbsKrktQ8GKxJbRpiRebUUz033Dt6eenIN8OnYOcSGQS+lrS5QGLq6sXaS3iL8IxIK7b9BNnQrKOWR7BoDh+mP5jFB6laxpa9bqLxkZgE8I938bHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.204.34.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpgz4t1749188049t95d02e75
X-QQ-Originating-IP: 8itqSUwG57Xz1wRjpsBQU4erKIvz2MIRDy9i7XkRA/k=
Received: from [127.0.0.1] ( [116.237.87.75])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 06 Jun 2025 13:34:07 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5191052925718409957
Message-ID: <EF0467E1FD371A7E+f68ef9be-76d3-4e6a-8c8c-48f07c4228b8@radxa.com>
Date: Fri, 6 Jun 2025 13:34:06 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT] drm/msm/dpu: enable virtual planes by default
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250514-dpu-enable-virt-planes-v1-1-bf5ba0088007@oss.qualcomm.com>
From: Xilin Wu <sophon@radxa.com>
Content-Language: en-US
In-Reply-To: <20250514-dpu-enable-virt-planes-v1-1-bf5ba0088007@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:radxa.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: MdlxueOE7DMoTyrg0J8D2o2wsBZyn2dQ/t3NuPhnpdUVYKTNdVDwzV/c
	00iD/TbRmgQ16hOhg25pQfGvlZhwnw5bR8hIkmBmB/c3i7oUAJNqhHVJb8U0aMlAIT3gcKx
	cCuhydtns2Dp0TxaxGQajeDvU/GMAz28UnB6YzqUtDInuHa3oR4RNDAl5mi0UcvvkmZqNmh
	GmEffs5XY829Q9X6zU5Zqp4KGZWLLlkHhtUXgsvxx6YCVU4ILJjnmq39+JPaiX6swbCZlzG
	DSEvrrG6WQ2NXaLAjWnaaoN0xNH+bWo0KUppeHwUN11KHzhwtS8JlRyJCLdq6frwLNukIFY
	LBPdNBt1i6JIr7HzCwsyQKVTkzDu6L6vclgYQUn4ZsGcbVcnABlaXFNzBCxOb9HPWIaq3+C
	ytHfzJFEjhiGs0ND/sh4fw/ObLMxIsEkfxzg8Rw4yxY/mEJxutjTXZfqgh8RNyF6S5LXcvq
	kMKKIsnzU+9zfF4Ny8pmgG2qF6PVgOx8O3V+Pdsdy/GKFRwKpbeOJy62MiPUGT1eunpZw7i
	hvKdo1wov4QeTmYl3/MWei+/QXvQMR7OZkHgfnSVXXq+TuM9zhVlSY09HZFJ4sCZ3b2OoOO
	CVXXdh9A483GS2XTV/pBWrSnZ+2pxnIYjHbG6WCH/GWEW/E3/FKlaVpyD9WA5Ry/H9LUdTA
	O6phTof0eBsoTD1NMU39Wl4kIkdJGXKkBNXV4KN6tU8G3ovLaBnHNcGR4fkQMXC/lrXEdWh
	nbWGb1WnxteF9ICoL9Kh09E/XGD5bQRZ5pBjj1gh3z9Roi35DhBizZSdz6KggUW00NMNlCb
	WS7NUDUMPGyOtDSxfo8U1vl0pBgBagyQsZcG6FqTU+crs0YiihPW7y09KE1ZuIuNrnw7Bzs
	THKhBuuW+5soXoTgOBk4PWtYn4DggqIriaJp4aGnjOXoHbmnY1eheruf/FqBjptEK2KVebP
	ySbfHSMVvVRFd6g==
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0

On 2025/5/14 07:30:00, Dmitry Baryshkov wrote:
> Turn on the switch and use virtual planes by default, enhancing
> utilisation of the display pipelines. It is still possible to use legacy
> implementation by using `msm.dpu_use_virtual_planes=false` kernel boot
> parameter.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> This is being sent as an RFT for now. Please give it a test with your
> compositor of choice. X11. Weston. Sway. Wlroot. CrOS. I plan to turn
> the switch for 6.17.
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 

With virtual planes enabled on qcs6490, I get a kernel Oops every time I 
plug in a mouse.

Steps to reproduce:

1. Set DisplayPort resolution to 1920x1080 (does not happen with 2560x1440)
2. Boot into plasma wayland desktop (v6.3.5) without usb mouse plugged in
3. Plug in the usb mouse

[   53.594217] hid-generic 0003:3554:F55D.0003: input: USB HID v1.11 
Mouse [Compx 2.4G Wireless Receiver] on usb-xhci-hcd.1.auto-1.3/input2
[   53.737874] Unable to handle kernel NULL pointer dereference at 
virtual address 0000000000000020
[   53.746931] Mem abort info:
[   53.749827]   ESR = 0x0000000096000004
[   53.753690]   EC = 0x25: DABT (current EL), IL = 32 bits
[   53.759159]   SET = 0, FnV = 0
[   53.762309]   EA = 0, S1PTW = 0
[   53.765556]   FSC = 0x04: level 0 translation fault
[   53.770584] Data abort info:
[   53.773564]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
[   53.779205]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
[   53.784411]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[   53.789880] user pgtable: 4k pages, 48-bit VAs, pgdp=000000010f4fd000
[   53.796511] [0000000000000020] pgd=0000000000000000, p4d=0000000000000000
[   53.803493] Internal error: Oops: 0000000096000004 [#1]  SMP
[   53.809309] Modules linked in:
[   53.812465] CPU: 6 UID: 1000 PID: 677 Comm: kwin_wayland Tainted: G 
      W           6.15.0-next-20250528-00020-gc20b5cd31b70-dirty #16 
PREEMPTLAZY
[   53.826292] Tainted: [W]=WARN
[   53.829356] Hardware name: Radxa Dragon Q6A (DT)
[   53.834108] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS 
BTYPE=--)
[   53.841261] pc : dpu_plane_is_multirect_capable+0x60/0x80
[   53.846818] lr : dpu_assign_plane_resources+0x26c/0x3d0
[   53.852192] sp : ffff800085bf3880
[   53.855610] x29: ffff800085bf38b0 x28: 0000000000000960 x27: 
ffff000090878800
[   53.862946] x26: ffff0000c407d948 x25: ffff00009087a200 x24: 
ffff0000b9a79a80
[   53.870284] x23: ffff0000c407d960 x22: ffff00008006a080 x21: 
ffff000084153880
[   53.877623] x20: ffff800085bf38a5 x19: ffff00009087a000 x18: 
0000000000000000
[   53.884960] x17: 0000000000000000 x16: 0000000000000000 x15: 
0000004200000000
[   53.892297] x14: ffff00009087a400 x13: ffff00008006a718 x12: 
ffff000080dca080
[   53.899632] x11: ffff800085bf38a5 x10: ffff00009087a4b8 x9 : 
0000000000000000
[   53.906970] x8 : ffffd8d2d59a09c0 x7 : 0000000000000000 x6 : 
0000000000000217
[   53.914301] x5 : 0000000000000000 x4 : 0000000000000200 x3 : 
0000000000000200
[   53.921639] x2 : ffffd8d2d59a03c0 x1 : 000000000000000a x0 : 
0000000000000000
[   53.928977] Call trace:
[   53.931505]  dpu_plane_is_multirect_capable+0x60/0x80 (P)
[   53.937055]  dpu_crtc_atomic_check+0x5d0/0x680
[   53.941639]  drm_atomic_helper_check_planes+0x144/0x224
[   53.947014]  drm_atomic_helper_check+0x50/0xa4
[   53.951594]  msm_atomic_check+0xd0/0xe0
[   53.955554]  drm_atomic_check_only+0x4d0/0x910
[   53.960134]  drm_mode_atomic_ioctl+0xa14/0xdf8
[   53.964712]  drm_ioctl_kernel+0xc0/0x130
[   53.968750]  drm_ioctl+0x360/0x4e0
[   53.972259]  __arm64_sys_ioctl+0xac/0x104
[   53.976390]  invoke_syscall+0x48/0x104
[   53.980261]  el0_svc_common.constprop.0+0x40/0xe0
[   53.985109]  do_el0_svc+0x1c/0x28
[   53.988533]  el0_svc+0x34/0x104
[   53.991780]  el0t_64_sync_handler+0x10c/0x138
[   53.996265]  el0t_64_sync+0x198/0x19c
[   54.000038] Code: b9402021 370fffc1 f9401441 3707ff81 (f94010a1)
[   54.006301] ---[ end trace 0000000000000000 ]---

$ aarch64-linux-gnu-addr2line -e ~/build_cache/kernel/dragon-q6a/vmlinux 
dpu_plane_is_multirect_capable+0x60/0x80
/home/strongtz/git/linux-super/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:932


-- 
Best regards,
Xilin Wu <sophon@radxa.com>

