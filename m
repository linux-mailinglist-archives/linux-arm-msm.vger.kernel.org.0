Return-Path: <linux-arm-msm+bounces-32021-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8D797CADE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Sep 2024 16:19:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 892DB283CE8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Sep 2024 14:19:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B8D919B59D;
	Thu, 19 Sep 2024 14:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c/r3Aw6n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C739920B04;
	Thu, 19 Sep 2024 14:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726755566; cv=none; b=OTkPxhSPc5oSrivHpYifhUuAd+qjmoKR/KK5uemHoHC7vOz5l/RGfjsqLJyzm2LPxH+BB37CCf8cMWp8B/U9m3MZcazwqe+KnxniExb0L4jibAd6bG7wYCedaQdN1E5F7LjjtPl/lLarkWV2BxXwb3STurPZCrKe4BvpCVoxhAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726755566; c=relaxed/simple;
	bh=f9V1VxYelbL1NGhd4FOXVxKNM7r5zJ9eTYY9lsW/Mb0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JUifzp68dkQXKY+hOcvHC9U3CLa0xI6vJc/6jjNqTxrvIkTKrD2a61pTCkAWVNHLKWQ5fCefS4fh3pYCLztygEljppCWDNsQeu5RJ8YW7uf1cYMPe0n88VB3TtDO2Eg9aZgf/qbVqDChocVGxr+SiGUqQi8hd+Kvu3+uhVN92+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c/r3Aw6n; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2d87182874fso152262a91.3;
        Thu, 19 Sep 2024 07:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726755564; x=1727360364; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sHYxkPLt4ajy19nCaZr7Axd94HmMZBYZd5MEyptfvOw=;
        b=c/r3Aw6n4UICIBkRUhVOyFB4z4DZtuNJBpJcAeUD0dH7TOyCVsrQ01gTQznOh3N8YV
         oafe3EQ6Kj5nS+VoMdfWjClE7e6x1YXYD+jipC5GKfhgXaTycT78459CZkyfQaR7IIeP
         0tcHYZYvhlELX59y2GHdlg56NGcbbHnoM58qtyfF4nJIomLeB591kUCJ7wLfx7Njjfq7
         LUNKCbaYL8OphiBb44tdgs1jAWUDbkwRoGyFCG1PFGZLlZCUaXzHBbpoN56sVy6gZGrd
         WeYFr/biB1K3zUaobE5XHyAw52MfcXxVu8YD0G3Ru8GN04/PUCXjqKgouHFuUeLnCq51
         cX0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726755564; x=1727360364;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sHYxkPLt4ajy19nCaZr7Axd94HmMZBYZd5MEyptfvOw=;
        b=EqzOoEIg5vL6k0aER/JhoFnQjp+MbCAMrgKTTZ8eBdPyIuYZySwYHbcPgXwYXtnluf
         N1p40tVD1xMohCGyMPXatzhq7T/NkeGhf8SiakHnJRDJ3Pxq/LzZVvMcSP4jtCOSey79
         HEEhfXaOs0WOJxMrBSIDTtFB770wFC9RpkqgGwW+RPtkydPSsG3PB1WWWTO/QZ6+BWvj
         21alxf+b/1kCyBlcmBQMVTqwnumS87Ws/qzqAUJi6EggDuV8hTmd08pkH+VETWiff1/1
         ZPbivWritUtNEbhMsqJuYMd6BjcGvIkvfhlBYY2XtmBfbgCz+A4XXHhf293SSeInsCyp
         ySpw==
X-Forwarded-Encrypted: i=1; AJvYcCU8EOIa6KH0BrPatORKMgpow3oskGY+p6WkPaVrUp7gnbx2PO2ouHu4TGYILHYrSZ3K+HJl9uhny/N2aJzr@vger.kernel.org, AJvYcCVeCd+IFrAu+O6FkLHljP/7O1Ltaum5GemAoPymq1iMg4J9RgLTBoOW7G7aeE5QX1k0DbIesYvxLk+p@vger.kernel.org, AJvYcCVrDq0af1nmIV4TAnAHvCzJIDaLxPZWN7Uno6OZoHu9mzGaTe/X3gbECx4h5+gPePMuqOXOWzSnJ8SwywcY@vger.kernel.org
X-Gm-Message-State: AOJu0YwL3IR5DIi9VW5QZTNgTkxSa+PJDVwS5gY1ESlbywrNqC0oEVeY
	76VLtk6zfz7rgGynLBpXpe7oXy6AyJIVOcEGlqCrfJCgmstZTsvsXWI2MKlOxHhZF0L723bwbz6
	imhgSBbbDJcsJsh1VY/sejn/xhSE=
X-Google-Smtp-Source: AGHT+IEbN7vWGlcZoIzv8CKISKCr4kqfoAxCOlrrLvlJ89KrkmmNd7BvZ1WSVx1ZWKgZ29MhSyOH0c8GzTRIXoIdZfc=
X-Received: by 2002:a17:90a:a893:b0:2dd:5137:a9ca with SMTP id
 98e67ed59e1d1-2dd5137ab65mr4431975a91.8.1726755563867; Thu, 19 Sep 2024
 07:19:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240917-preemption-a750-t-v4-0-95d48012e0ac@gmail.com> <20240917-preemption-a750-t-v4-11-95d48012e0ac@gmail.com>
In-Reply-To: <20240917-preemption-a750-t-v4-11-95d48012e0ac@gmail.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Thu, 19 Sep 2024 15:19:11 +0100
Message-ID: <CACu1E7HgVBJgin5R8ZgsqrCzEbSZHg9djjg0o1Nuq9h1ebBNNg@mail.gmail.com>
Subject: Re: [PATCH v4 11/11] Documentation: document adreno preemption
To: Antonino Maniscalco <antomani103@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Jonathan Corbet <corbet@lwn.net>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 17, 2024 at 12:14=E2=80=AFPM Antonino Maniscalco
<antomani103@gmail.com> wrote:
>
> Add documentation about the preemption feature supported by the msm
> driver.
>
> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> ---
>  Documentation/gpu/msm-preemption.rst | 98 ++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 98 insertions(+)
>
> diff --git a/Documentation/gpu/msm-preemption.rst b/Documentation/gpu/msm=
-preemption.rst
> new file mode 100644
> index 000000000000..c1203524da2e
> --- /dev/null
> +++ b/Documentation/gpu/msm-preemption.rst
> @@ -0,0 +1,98 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +:orphan:
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +MSM Preemtion
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Preemption allows Adreno GPUs to switch to an higher priority ring when =
work is
> +pushed to it, reducing latency for high priority submissions.
> +
> +When preemption is enabled 4 rings are initialized, corresponding to dif=
ferent
> +priority levels. Having multiple rings is purely a software concept as t=
he GPU
> +only has registers to keep track of one graphics ring.
> +The kernel is able to switch which ring is currently being processed by
> +requesting preemption. When certain conditions are met, depending on the
> +priority level, the GPU will save its current state in a series of buffe=
rs,
> +then restores state from a similar set of buffers specified by the kerne=
l. It
> +then resumes execution and fires an IRQ to let the kernel know the conte=
xt
> +switch has completed.
> +
> +This mechanism can be used by the kernel to switch between rings. Whenev=
er a
> +submission occurs the kernel finds the highest priority ring which isn't=
 empty
> +and preempts to it if said ring is not the one being currently executed.=
 This is
> +also done whenever a submission completes to make sure execution resumes=
 on a
> +lower priority ring when a higher priority ring is done.
> +
> +Preemption levels
> +-----------------
> +
> +Preemption can only occur at certain boundaries. The exact conditions ca=
n be
> +configured by changing the preemption level, this allows to compromise b=
etween
> +latency (ie. the time that passes between when the kernel requests preem=
ption
> +and when the SQE begins saving state) and overhead (the amount of state =
that
> +needs to be saved).
> +
> +The GPU offers 3 levels:
> +
> +Level 0
> +  Preemption only occurs at the submission level. This requires the leas=
t amount
> +  of state to be saved as the execution of userspace submitted IBs is ne=
ver
> +  interrupted, however it offers very little benefit compared to not ena=
bling
> +  preemption of any kind.
> +
> +Level 1
> +  Preemption occurs at either bin level, if using GMEM rendering, or dra=
w level
> +  in the sysmem rendering case.
> +
> +Level 2
> +  Preemption occurs at draw level.
> +
> +Level 1 is the mode that is used by the msm driver.
> +
> +Additionally the GPU allows to specify a `skip_save_restore` option. Thi=
s
> +disables the saving and restoring of certain registers which lowers the
> +overhead. When enabling this userspace is expected to set the state that=
 isn't
> +preserved whenever preemption occurs which is done by specifying preambl=
e and
> +postambles. Those are IBs that are executed before and after
> +preemption.

This should mention that `skip_save_restore` only works with level 1
preemption and only if using GMEM rendering. Also, be a bit more
specific than "certain registers" - maybe something like "all
registers except those relating to the operation of the SQE itself."

> +
> +Preemption buffers
> +------------------
> +
> +A series of buffers are necessary to store the state of rings while they=
 are not
> +being executed. There are different kinds of preemption records and most=
 of
> +those require one buffer per ring. This is because preemption never occu=
rs
> +between submissions on the same ring, which always run in sequence when =
the ring
> +is active. This means that only one context per ring is effectively acti=
ve.
> +
> +SMMU_INFO
> +  This buffer contains info about the current SMMU configuration such as=
 the
> +  ttbr0 register. The SQE firmware isn't actually able to save this reco=
rd.
> +  As a result SMMU info must be saved manually from the CP to a buffer a=
nd the
> +  SMMU record updated with info from said buffer before triggering
> +  preemption.
> +
> +NON_SECURE
> +  This is the main preemption record where most state is saved. It is mo=
stly
> +  opaque to the kernel except for the first few words that must be initi=
alized
> +  by the kernel.
> +
> +SECURE
> +  This saves state related to the GPU's secure mode.
> +
> +NON_PRIV
> +  The intended purpose of this record is unknown. The SQE firmware actua=
lly
> +  ignores it and therefore msm doesn't handle it.
> +
> +COUNTER
> +  This record is used to save and restore performance counters.
> +
> +Handling the permissions of those buffers is critical for security. All =
but the
> +NON_PRIV records need to be inaccessible from userspace, so they must be=
 mapped
> +in the kernel address space with the MSM_BO_MAP_PRIV flag.
> +For example, making the NON_SECURE record accessible from userspace woul=
d allow
> +any process to manipulate a saved ring's RPTR which can be used to skip =
the
> +execution of some packets in a ring and execute user commands with highe=
r
> +privileges.
>
> --
> 2.46.0
>

