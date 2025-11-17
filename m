Return-Path: <linux-arm-msm+bounces-82132-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 43ECDC64EF9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 16:46:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B663F34CFE8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 15:44:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE6A02773EC;
	Mon, 17 Nov 2025 15:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z9hLVsPF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F139126E704
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 15:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763394260; cv=none; b=m+q7RbHUyLgLAr6F+JoG7OCV4YVQoopNumBLWq2tIs5hTnv1AM4bnBVDWz1EslDzWWQVWTb5WTISDcHzZm46iSiHpPInOPMR8MUB/zxSv86EP+6BbWNsuY8m9lY0bCJVFWsqyIvuKgjKHJZK7QvYCWC6ChZzhbkkWqDIee4qLEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763394260; c=relaxed/simple;
	bh=GakGLx3BRYbnpcXKQqj2rxUbKKiFxYQ8pO9cOSBXY70=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MQzPUuSL/iquRey+d5j82LxjBSYNevfC3W1sfrrIKOZ1jP4PGSVrHSclGhlifqAz6jtYXXQBFgoPLEzcvQtd3/euZ3OMSWAbVgVNqN2SUQdyeZwS70R2OVm7OSR9BSqV1Edf0b7K1Amfl/wT2nheSv+x8HCvM6HPgAch9mFQY3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z9hLVsPF; arc=none smtp.client-ip=209.85.166.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-9486248f01bso154273439f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 07:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763394257; x=1763999057; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GakGLx3BRYbnpcXKQqj2rxUbKKiFxYQ8pO9cOSBXY70=;
        b=Z9hLVsPFWXh8ou8e8+hREoGBt/GvVkrF1z5NKwnLwcXJw2pRJXtJQWjGZNt+l+CeBS
         g+xfKbJfVGM3kwG/SSNfvdLY5+rSU+gX2rvXd4F9rJ0NdNGTqcQLfQ0KHKd3qQ1rgp+m
         1HFKUet6ct0HHqSBbUOBwyFF3Qac4TlP36gmFFnq0tykytu2BhRBThmbDQzozHJprhiD
         OBEYnZpSyzQml4/cckmspF9IOlGEWGvpu0zwLBMJEYLVFpWXoNexVqygNbrg/IFg8aHo
         Xti7nXm6TqQpWnAf/VXIFilctyJulbYUzYlsXjgX8NLyiL4fe0s1chZF7yRWOfTqb6Wt
         dGDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763394257; x=1763999057;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GakGLx3BRYbnpcXKQqj2rxUbKKiFxYQ8pO9cOSBXY70=;
        b=ZTMtjTRKenmQ0ew/JhRbKz5x1jF71FNW2M5xMyGYJ2YEH7XpIDKlj2wwOUL6u7jlKc
         lyLqqz/Ds/SOyaxUT9xZ6BTRqDKRumdB3hY2GpzIly/xZ/niGmE7x6B/k139GAfrrdpq
         4xOuFVAUdpnGgDpztSMOFfjUZsS9rGRJnPIYRx/9UvKQ4vzvD8bQoYvNligKv6Vz3ypd
         4kaQJyjEXyyzrPCFiDgQdEqZ33xfaWQ83dFfS+oW8W1loyBF/1BfrTavhXxhi4jGTJw5
         EBDMSEcOZZchxiCgbJrMKhgUc3gfWEXfxAqMVLzwlBvGgKdQgtCfIANjR+Zutwfq/7oU
         Avzg==
X-Forwarded-Encrypted: i=1; AJvYcCWUnHUxFT2G+CII3HJenTvcp8g4SaNzdIuM+qxk7aJQfuGM+fLttUwM48ClJGS22LZVWwSR+ki6kO8Lc3jb@vger.kernel.org
X-Gm-Message-State: AOJu0Ywiwd2iyS5ANFQ+eSpBdoh1z9l+SmUl2i34pOY9B//BDtqZkof6
	/2XDqdiJ4fFXUXOqtJuevOsDsL2cg5aapdan7jPAWHNrseNxpWV0HZqltEIdMRSta783x2Neq4d
	f5ohx/gju+4++qVgunKIDxQ0/TaXleHg=
X-Gm-Gg: ASbGncu0WNo3wo1jIPYdaX2oV+x5drR2dIjLRihl+mMXkPB/YUwbzp3rdlg7JS4kkWH
	T5N0ydmjvX5T7K5cdWbLQ5k0a3UTaZW9D5bcjLw0THPD0dMvypF8Os6PSf0a59H8tKwtGNVyDcf
	zCFO8q0CtvKgSMZDiMYOskflaDgBSNrd7DPtt692OTXWpL/Zy+kDp7PAt9fiCACgHgcv1VY1TJT
	3sb6r9IE+gxQ9RN3xp6sIQmhpIt0cXimAa6trDDFy00vunc/WZhuJA98MF3l3m7QRTq9lY=
X-Google-Smtp-Source: AGHT+IFbdBdmra1r1MTAuYm3h2YFina8VK1yyiL7rlrlzpAiB2tUYzJNKmJeOBR2QgET/eNSGZvdZJ+H1CdvND+9bDs=
X-Received: by 2002:a05:6e02:1808:b0:434:74a6:48f1 with SMTP id
 e9e14a558f8ab-4348c94f0b1mr136903685ab.27.1763394257015; Mon, 17 Nov 2025
 07:44:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251114-kaana-gpu-support-v3-0-92300c7ec8ff@oss.qualcomm.com>
 <20251114-kaana-gpu-support-v3-3-92300c7ec8ff@oss.qualcomm.com> <ff634b09-c28c-47d0-a57f-6203755cedb6@oss.qualcomm.com>
In-Reply-To: <ff634b09-c28c-47d0-a57f-6203755cedb6@oss.qualcomm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 17 Nov 2025 07:44:05 -0800
X-Gm-Features: AWmQ_bmyUIznEYyCXfUeRMdsertmn-wYkkRaXSqTVS6sR8e15JC5caO5D32ua0k
Message-ID: <CAF6AEGv9OVHBDF+XVNRr+ZtWijs+MDNUgw9zg0HbebuCQbHcZg@mail.gmail.com>
Subject: Re: [PATCH v3 03/20] drm/msm/a6xx: Skip dumping SCRATCH registers
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Rob Clark <robin.clark@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Sean Paul <sean@poorly.run>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Jonathan Marek <jonathan@marek.ca>, 
	Jordan Crouse <jordan@cosmicpenguin.net>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Connor Abbott <cwabbott0@gmail.com>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	iommu@lists.linux.dev, devicetree@vger.kernel.org, 
	Rob Clark <rob.clark@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 17, 2025 at 6:00=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 11/14/25 12:29 AM, Akhil P Oommen wrote:
> > Crashdec doesn't require SCRATCH registers anymore for a6xx and newer
> > architectures. So skip dumping them during recovery.
> >
> > Suggested-by: Rob Clark <rob.clark@oss.qualcomm.com>
> > Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> > ---
>
> Looks like this changed in:
>
> https://gitlab.freedesktop.org/mesa/mesa/-/commit/95104707f189b2e1b06c855=
b563c1203b33da354

Crashdec finding estimated hang location based on CP registers dates
back prior to importing that code into mesa ~5yrs ago, fwiw.. and was
improved over the years to better handle IB prefetch since then.
Fwiw.

It does mean for gen8 we are going to need a CPU based fallback to
crashdumper to make smmu fault devcoredumps useful (since now
crashdumper is needed to capture CP regs), but we need that anyways.

BR,
-R

> and needs_seqno is never true now?
>
> Konrad

