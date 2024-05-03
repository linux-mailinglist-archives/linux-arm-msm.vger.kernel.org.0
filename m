Return-Path: <linux-arm-msm+bounces-19172-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CD68BA9BB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 May 2024 11:21:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC5932820EA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 May 2024 09:20:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31A5D1534F2;
	Fri,  3 May 2024 09:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Q4KZfdwE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0BB9152521
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 May 2024 09:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714727938; cv=none; b=kTvtDHl7EtygqVYfkJV0RNUTqd/U31nAfVmPI7oU9UHPf43hbQMB0LKtxY+HtTdLzpnLcqj38jXcbhiZpIMJgPsOVDyIiEAknEh2sMFUJW5HgVwM8dHsYTQPCleTsw5KZsHyZq8YYR7xpIzD+klayD0dCrHTPwaE20XsfuCvaSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714727938; c=relaxed/simple;
	bh=y9eG/6zcrN+47zdEwOlgRlZFsHm9WWYX+ndvwIbhKks=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=agwzhYoHHHss9FVVQMIHQnbHV+8wd/h7bNn/9D7tuexzyAIEcqIP8P6mBTkgVRx8YOX3ij/p2eYqTG5UrSk5EtiQzXloAMP6GiRL/uZ6hwtmjpGNNYjRVwO/YszyYRMCgEaE4SEZMhOt4ISv96lxFOuue2+UM3TZ7XtTWgin20A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Q4KZfdwE; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a58c89bda70so1037093266b.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 May 2024 02:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1714727934; x=1715332734; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=27M+GiFTHZXnHsJeQQFjfy6D2Lb4h96J0r+ztTDnB2Y=;
        b=Q4KZfdwE+6MJimo+v3irs29g8GBmWHqVMSR9IECD9noGPsE+CtXBU64RQTt08dNKK0
         nIPl12timy0BHBZ+zmnTxpsLtObGXLyCVjKDJ2IUNfezZxGdYMN2k3n0qEVLI8vVKSjU
         sO6f5NfrRfCeqp8ueY+5XZheo3+r2sqI9zzaXE0r4tv64wKUmzYosgW9iFjXjdYmCTlr
         NmkDUke/fwT/64IwEGA+aFvPge7jO9LlNPCU5n1vF/7XrclBgOUT/kNJ4OwWujUl8LB9
         ek3zzhJXFlf4QDrwsNq1HRZMO+Qs/4jRNC9cyQSptWRvRx31nwIeaDYib2JNPs3dNIz0
         sjTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714727934; x=1715332734;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=27M+GiFTHZXnHsJeQQFjfy6D2Lb4h96J0r+ztTDnB2Y=;
        b=J8q5HWnzZPpbpiqOELhmIC8CesKEmHjLM9QZH6feXqkcLW3nIYmnIKl4E2nKXnM3Di
         1Nr6BpsXX1zDLsR6JYrv4T9U7JUAQe0BM4EK1i7LsYmEsaDXDG/xTgxnfTYuZyKd54D8
         4niBfwH9tAqo3fYkTxME4zciZ7cUKJipzqTvPtk/pw3pqGJ4qeyGfZGVYMh17KibejWl
         cJeqMxVds9V+k/MwyB60HoAlLwSTpTXWnMW5Pvr4QHE/2Y3R29Vx2y2pGF03+8w1z39R
         y9m13bYFwOykseQ8EuKKcolk9JnE1QM6VwrhN7dvJqtJ8lp8OsWKvbOZ0g5FTVNduJQH
         5/rA==
X-Forwarded-Encrypted: i=1; AJvYcCUAZsj6ma0s6bKWkFLWNmqMBAK5YPZ0rn+VjGmyIMveFioTND3o7ydd9HA+saw+v12dUTo13wlvYBbZYN8YEhevaZLUoClK2ro9/HGm9w==
X-Gm-Message-State: AOJu0YytXkZqB0QpW/eGvEU8DV9u3kuJLu5HnnzvXhoQuHN72m7V4yLe
	r7oiBDBe2KviiMNwSiMGATPlahtD+LNhQ2eyOIWQaKi9DOnHHIbHyhr72sQqyWw=
X-Google-Smtp-Source: AGHT+IGwGUAimmvXfipen1P3d+DtgUGP1PC9mtiV9eXQGm9ynGAZ735zq0H+RX+qV8ihNUy1ARjqGA==
X-Received: by 2002:a17:907:25cd:b0:a59:8fae:f5c8 with SMTP id ae13-20020a17090725cd00b00a598faef5c8mr841147ejc.7.1714727933652;
        Fri, 03 May 2024 02:18:53 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id t14-20020a1709064f0e00b00a46aba003eesm1492035eju.215.2024.05.03.02.18.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 May 2024 02:18:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 May 2024 11:18:52 +0200
Message-Id: <D0ZWBLILU0EW.XOAQ4C99DQRO@fairphone.com>
Cc: "Rob Clark" <robdclark@gmail.com>, "Abhinav Kumar"
 <quic_abhinavk@quicinc.com>, "Sean Paul" <sean@poorly.run>, "David Airlie"
 <airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>
Subject: Re: [PATCH] drm/msm/dpu: fix vblank IRQ handling for command panels
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>, "Marijn Suijten"
 <marijn.suijten@somainline.org>
X-Mailer: aerc 0.17.0
References: <20240330-dpu-fix-irqs-v1-1-39b8d4e4e918@linaro.org>
 <mxwrvnqth5f2vd4m55ryzqgyj7brykiqynzldelanxkuj2zny3@4pqi6p57c2q2>
 <CAA8EJpqbzSc00T4exAYuh1QdifuimHD40uh0BCrd3SP9F5TQKQ@mail.gmail.com>
In-Reply-To: <CAA8EJpqbzSc00T4exAYuh1QdifuimHD40uh0BCrd3SP9F5TQKQ@mail.gmail.com>

On Sun Apr 7, 2024 at 5:15 AM CEST, Dmitry Baryshkov wrote:
> On Sat, 30 Mar 2024 at 18:49, Marijn Suijten
> <marijn.suijten@somainline.org> wrote:
> >
> > On 2024-03-30 05:52:29, Dmitry Baryshkov wrote:
> > > In case of CMD DSI panels, the vblank IRQ can be used outside of
> > > irq_enable/irq_disable pair. This results in the following kind of
> >
> > Can you clarify when exactly that is?  Is it via ops.control_vblank_irq=
 in
> > dpu_encoder_toggle_vblank_for_crtc()?
>
> Call trace:
>  dpu_encoder_phys_cmd_control_vblank_irq+0x218/0x294
>   dpu_encoder_toggle_vblank_for_crtc+0x160/0x194
>   dpu_crtc_vblank+0xbc/0x228
>   dpu_kms_enable_vblank+0x18/0x24
>   vblank_ctrl_worker+0x34/0x6c
>   process_one_work+0x218/0x620
>   worker_thread+0x1ac/0x37c
>   kthread+0x114/0x118
>   ret_from_fork+0x10/0x20
>
> The vblank_ctrl_work happens when the framework attempts to trigger
> the vblank on the CRTC.
>
> >
> > > messages. Move assignment of IRQ indices to atomic_enable /
> > > atomic_disable callbacks.
> > >
> > > [dpu error]invalid IRQ=3D[134217727, 31]
> > > [drm:dpu_encoder_phys_cmd_control_vblank_irq] *ERROR* vblank irq err =
id:31 pp:0 ret:-22, enable true/0
> > > [drm:dpu_encoder_phys_cmd_control_vblank_irq] *ERROR* vblank irq err =
id:31 pp:0 ret:-22, enable false/0
> >
> > You are right that such messages are common, both at random but also se=
emingly
> > around toggling the `ACTIVE` property on the CRTC:
> >
> >         [   45.878300] panel-samsung-souxp ae94000.dsi.0: samsung_souxp=
00_disable
> >         [   45.909941] panel-samsung-souxp ae94000.dsi.0: samsung_souxp=
00_unprepare
> >         [   46.093234] [drm:dpu_encoder_helper_wait_for_irq] *ERROR* en=
coder is disabled id=3D31, callback=3Ddpu_encoder_phys_cmd_ctl_start_irq, I=
RQ=3D[134217727, 31]
> >         [   46.130421] panel-samsung-souxp ae94000.dsi.0: samsung_souxp=
00_prepare
> >         [   46.340457] panel-samsung-souxp ae94000.dsi.0: samsung_souxp=
00_enable
> >         [   65.520323] [dpu error]invalid IRQ=3D[134217727, 31] irq_cb:=
dpu_encoder_phys_cmd_te_rd_ptr_irq
> >         [   65.520463] [drm:dpu_encoder_phys_cmd_control_vblank_irq] *E=
RROR* vblank irq err id:31 pp:0 ret:-22, enable true/0
> >         [   65.630199] [drm:dpu_encoder_phys_cmd_control_vblank_irq] *E=
RROR* vblank irq err id:31 pp:0 ret:-22, enable false/0
> >         [  166.576465] panel-samsung-souxp ae94000.dsi.0: samsung_souxp=
00_disable
> >         [  166.609674] panel-samsung-souxp ae94000.dsi.0: samsung_souxp=
00_unprepare
> >         [  166.781967] [drm:dpu_encoder_helper_wait_for_irq] *ERROR* en=
coder is disabled id=3D31, callback=3Ddpu_encoder_phys_cmd_ctl_start_irq, I=
RQ=3D[134217727, 31]
> >         [  166.829805] panel-samsung-souxp ae94000.dsi.0: samsung_souxp=
00_prepare
> >         [  167.040476] panel-samsung-souxp ae94000.dsi.0: samsung_souxp=
00_enable
> >         [  337.449827] [dpu error]invalid IRQ=3D[134217727, 31] irq_cb:=
dpu_encoder_phys_cmd_te_rd_ptr_irq
> >         [  337.450434] [drm:dpu_encoder_phys_cmd_control_vblank_irq] *E=
RROR* vblank irq err id:31 pp:0 ret:-22, enable true/0
> >         [  337.569526] [drm:dpu_encoder_phys_cmd_control_vblank_irq] *E=
RROR* vblank irq err id:31 pp:0 ret:-22, enable false/0
> >         [  354.980357] [dpu error]invalid IRQ=3D[134217727, 31] irq_cb:=
dpu_encoder_phys_cmd_te_rd_ptr_irq
> >         [  354.980495] [drm:dpu_encoder_phys_cmd_control_vblank_irq] *E=
RROR* vblank irq err id:31 pp:0 ret:-22, enable true/0
> >         [  355.090460] [drm:dpu_encoder_phys_cmd_control_vblank_irq] *E=
RROR* vblank irq err id:31 pp:0 ret:-22, enable false/0
> >
> > Unfortunately with this patch, turning the CRTC off via ./modetest -M m=
sm -a
> > -w 81:ACTIVE:0 immediately triggers a bunch of WARNs (note that the CRT=
C turns
> > on immediately again when the command returns, that's probably the fram=
ebuffer
> > console taking over again).  Running it a few times in succession this =
may or
> > may not happen, or reboot the phone (Xperia Griffin) entirely:
>
> I could not reproduce it here, on Pixel-3. I'd like to review vblank
> IRQs later. For now I think it is easier to revert d13f638c9b88
> ("drm/msm/dpu: drop dpu_encoder_phys_ops.atomic_mode_set"). I'll send
> a patch.

Hi,

Did anything happen regarding this, I'm not finding anything on the
lists?

I'm seeing these errors also on SC7280/QCM6490 Fairphone 5 phone with
kernel 6.9-rc6 (+ out of tree patches).

[   77.073366] [dpu error]invalid IRQ=3D[134217727, 31] irq_cb:dpu_encoder_=
phys_cmd_te_rd_ptr_irq
[   77.073391] [drm:dpu_encoder_phys_cmd_control_vblank_irq] *ERROR* vblank=
 irq err id:31 pp:0 ret:-22, enable true/0
[   79.214720] [drm:dpu_encoder_phys_cmd_control_vblank_irq] *ERROR* vblank=
 irq err id:31 pp:0 ret:-22, enable false/0

Regards
Luca


>
> >
> >         [   23.423930] panel-samsung-souxp ae94000.dsi.0: samsung_souxp=
00_disable
> >         [   23.461013] [dpu error]invalid IRQ=3D[134217727, 31]
> >         [   23.461144] [dpu error]invalid IRQ=3D[134217727, 31]
> >         [   23.461208] [drm:dpu_encoder_phys_cmd_control_vblank_irq] *E=
RROR* vblank irq err id:31 pp:0 ret:-22, enable false/1
> >         [   23.461340] [dpu error]invalid IRQ=3D[134217727, 31]
> >         [   23.461406] panel-samsung-souxp ae94000.dsi.0: samsung_souxp=
00_unprepare
> >         [   23.641721] [drm:dpu_encoder_helper_wait_for_irq] *ERROR* en=
coder is disabled id=3D31, callback=3Ddpu_encoder_phys_cmd_ctl_start_irq, I=
RQ=3D[134217727, 31]
> >         [   23.679938] panel-samsung-souxp ae94000.dsi.0: samsung_souxp=
00_prepare
> >         [   23.900465] ------------[ cut here ]------------
> >         [   23.900813] WARNING: CPU: 1 PID: 747 at drivers/gpu/drm/msm/=
disp/dpu1/dpu_hw_interrupts.c:545 dpu_core_irq_register_callback+0x1b4/0x24=
4
> >         [   23.901450] Modules linked in:
> >         [   23.901814] CPU: 1 PID: 747 Comm: modetest Tainted: G     U =
            6.9.0-rc1-next-20240328-SoMainline-02555-g27abbea53b6b #19
> >         [   23.902402] Hardware name: Sony Xperia 1 (DT)
> >         [   23.902674] pstate: 804000c5 (Nzcv daIF +PAN -UAO -TCO -DIT =
-SSBS BTYPE=3D--)
> >         [   23.903133] pc : dpu_core_irq_register_callback+0x1b4/0x244
> >         [   23.903455] lr : dpu_encoder_phys_cmd_irq_enable+0x30/0x8c
> >         [   23.903880] sp : ffff800086833930
> >         [   23.904123] x29: ffff800086833930 x28: 0000000000000001 x27:=
 ffff0273834522d0
> >         [   23.904604] x26: ffffd46ebdb5edc8 x25: ffffd46ebe0f1228 x24:=
 ffff02738106b280
> >         [   23.904973] x23: ffff027383452000 x22: ffffd46ebd086290 x21:=
 0000000000000000
> >         [   23.905452] x20: ffff027382712080 x19: 0000000000000008 x18:=
 ffff8000840550d0
> >         [   23.905820] x17: 000000040044ffff x16: 005000f2b5503510 x15:=
 00000000000006ce
> >         [   23.906300] x14: 0000000000000f00 x13: 0000000000000f00 x12:=
 0000000000000f00
> >         [   23.906778] x11: 0000000000000040 x10: ffffd46ebe853258 x9 :=
 ffffd46ebe853250
> >         [   23.907146] x8 : ffffd46ebec30000 x7 : 0000000000000000 x6 :=
 0000000000000000
> >         [   23.907621] x5 : 0000000000000000 x4 : ffff027384eac080 x3 :=
 ffff027381a1a080
> >         [   23.908099] x2 : 0000000000000001 x1 : ffff027384eac140 x0 :=
 ffffd46ebd086290
> >         [   23.908467] Call trace:
> >         [   23.908688]  dpu_core_irq_register_callback+0x1b4/0x244
> >         [   23.909113]  dpu_encoder_phys_cmd_irq_enable+0x30/0x8c
> >         [   23.909417]  _dpu_encoder_irq_enable+0x58/0xa4
> >         [   23.909814]  dpu_encoder_resource_control+0x1e8/0x498
> >         [   23.910116]  dpu_encoder_virt_atomic_enable+0x9c/0x15c
> >         [   23.910531]  drm_atomic_helper_commit_modeset_enables+0x180/=
0x26c
> >         [   23.910871]  msm_atomic_commit_tail+0x1a4/0x510
> >         [   23.911277]  commit_tail+0xa8/0x19c
> >         [   23.911544]  drm_atomic_helper_commit+0x188/0x1a0
> >         [   23.911842]  drm_atomic_commit+0xb4/0xf0
> >         [   23.912226]  drm_client_modeset_commit_atomic+0x1fc/0x268
> >         [   23.912540]  drm_client_modeset_commit_locked+0x60/0x178
> >         [   23.912963]  drm_client_modeset_commit+0x30/0x5c
> >         [   23.913256]  drm_fb_helper_lastclose+0x64/0xb0
> >         [   23.913542]  msm_fbdev_client_restore+0x18/0x2c
> >         [   23.913948]  drm_client_dev_restore+0x8c/0xec
> >         [   23.914233]  drm_lastclose+0x68/0xac
> >         [   23.914499]  drm_release+0x128/0x15c
> >         [   23.914765]  __fput+0x7c/0x2cc
> >         [   23.915017]  __fput_sync+0x54/0x64
> >         [   23.915272]  __arm64_sys_close+0x3c/0x84
> >         [   23.915661]  invoke_syscall+0x4c/0x11c
> >         [   23.915932]  el0_svc_common.constprop.0+0x44/0xec
> >         [   23.916230]  do_el0_svc+0x20/0x30
> >         [   23.916600]  el0_svc+0x38/0xe4
> >         [   23.916854]  el0t_64_sync_handler+0x128/0x134
> >         [   23.917139]  el0t_64_sync+0x198/0x19c
> >         [   23.917515] ---[ end trace 0000000000000000 ]---
> >         [   23.918007] ------------[ cut here ]------------
> >         [   23.918324] WARNING: CPU: 1 PID: 747 at drivers/gpu/drm/msm/=
disp/dpu1/dpu_hw_interrupts.c:545 dpu_core_irq_register_callback+0x1b4/0x24=
4
> >         [   23.918720] Modules linked in:
> >         [   23.918878] CPU: 1 PID: 747 Comm: modetest Tainted: G     U =
 W          6.9.0-rc1-next-20240328-SoMainline-02555-g27abbea53b6b #19
> >         [   23.919248] Hardware name: Sony Xperia 1 (DT)
> >         [   23.919424] pstate: 804000c5 (Nzcv daIF +PAN -UAO -TCO -DIT =
-SSBS BTYPE=3D--)
> >         [   23.919725] pc : dpu_core_irq_register_callback+0x1b4/0x244
> >         [   23.919934] lr : dpu_encoder_phys_cmd_irq_enable+0x78/0x8c
> >         [   23.920214] sp : ffff800086833930
> >         [   23.920373] x29: ffff800086833930 x28: 0000000000000001 x27:=
 ffff0273834522d0
> >         [   23.920686] x26: ffffd46ebdb5edc8 x25: ffffd46ebe0f1228 x24:=
 ffff02738106b280
> >         [   23.920922] x23: ffff027383452000 x22: ffffd46ebd086020 x21:=
 0000000000000000
> >         [   23.921237] x20: ffff027382712080 x19: 0000000000000029 x18:=
 ffff8000840550d0
> >         [   23.921545] x17: 000000040044ffff x16: 005000f2b5503510 x15:=
 00000000000006ce
> >         [   23.921780] x14: 0000000000000f00 x13: 0000000000000f00 x12:=
 0000000000000f00
> >         [   23.922092] x11: 0000000000000040 x10: ffffd46ebe853258 x9 :=
 ffffd46ebe853250
> >         [   23.922405] x8 : ffffd46ebec30000 x7 : 0000000000000000 x6 :=
 0000000000000001
> >         [   23.922640] x5 : ffffd46ebe0878d8 x4 : ffff027384eac080 x3 :=
 ffff027381a1a080
> >         [   23.922953] x2 : 0000000000000001 x1 : ffff027384eac458 x0 :=
 ffffd46ebd086020
> >         [   23.923266] Call trace:
> >         [   23.923411]  dpu_core_irq_register_callback+0x1b4/0x244
> >         [   23.923616]  dpu_encoder_phys_cmd_irq_enable+0x78/0x8c
> >         [   23.923893]  _dpu_encoder_irq_enable+0x58/0xa4
> >         [   23.924078]  dpu_encoder_resource_control+0x1e8/0x498
> >         [   23.924273]  dpu_encoder_virt_atomic_enable+0x9c/0x15c
> >         [   23.924547]  drm_atomic_helper_commit_modeset_enables+0x180/=
0x26c
> >         [   23.924763]  msm_atomic_commit_tail+0x1a4/0x510
> >         [   23.925030]  commit_tail+0xa8/0x19c
> >         [   23.925205]  drm_atomic_helper_commit+0x188/0x1a0
> >         [   23.925477]  drm_atomic_commit+0xb4/0xf0
> >         [   23.925653]  drm_client_modeset_commit_atomic+0x1fc/0x268
> >         [   23.925856]  drm_client_modeset_commit_locked+0x60/0x178
> >         [   23.926136]  drm_client_modeset_commit+0x30/0x5c
> >         [   23.926325]  drm_fb_helper_lastclose+0x64/0xb0
> >         [   23.926585]  msm_fbdev_client_restore+0x18/0x2c
> >         [   23.926771]  drm_client_dev_restore+0x8c/0xec
> >         [   23.926956]  drm_lastclose+0x68/0xac
> >         [   23.927206]  drm_release+0x128/0x15c
> >         [   23.927379]  __fput+0x7c/0x2cc
> >         [   23.927541]  __fput_sync+0x54/0x64
> >         [   23.927785]  __arm64_sys_close+0x3c/0x84
> >         [   23.927965]  invoke_syscall+0x4c/0x11c
> >         [   23.928141]  el0_svc_common.constprop.0+0x44/0xec
> >         [   23.928411]  do_el0_svc+0x20/0x30
> >         [   23.928582]  el0_svc+0x38/0xe4
> >         [   23.928746]  el0t_64_sync_handler+0x128/0x134
> >         [   23.929008]  el0t_64_sync+0x198/0x19c
> >         [   23.929180] ---[ end trace 0000000000000000 ]---
> >         [   23.929429] panel-samsung-souxp ae94000.dsi.0: samsung_souxp=
00_enable
> >
> > - Marijn


