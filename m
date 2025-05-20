Return-Path: <linux-arm-msm+bounces-58728-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B212ABDD99
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 16:44:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 96EF0189509D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 14:44:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6D7B24A04A;
	Tue, 20 May 2025 14:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d0C0WhaH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B8E24A043
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 14:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747752183; cv=none; b=LfbwalaWIBdllVW2EZ4f87CSFSJFsS3ewODAffg7f20hV5rbFrZLxj7fZg3cGG6jYnssBFNCHJp18ssNa8FAtyarC/MfvKfMhuj4UooGmYi/VdkRgOvn7dJYlbOG0ps25kEVy0S65FjOLR65eUXelrdePhEha46pG/9CSTrFdkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747752183; c=relaxed/simple;
	bh=3M48Bi0RAMhbjAINU8Rj4l8VTLi4EPIWgknw+A4XTeQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X2vMKZMvB04e+ItG8HME2qXVn8k2+bkhIBjzUjOyd1BNEXKOUWRsFOkjepfTOmdFH369k9jd8at69jmIXq0wFAonKw5WrXZtdk624MM6nb/e/Ba1/rqVwMcIdKfNxLU+jVkx0OBfRkchaqo/iuP86Rb5crXwzbrc6Sd/PlhYXMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d0C0WhaH; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-309f26c68b8so528154a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 07:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747752181; x=1748356981; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NL9VnS5cf/6NW/p94tIKHT/4gGzvfJ3RyyiZ0fUNEek=;
        b=d0C0WhaHbEaIeTZJNm279NSRuNMuafgRatbIqfRMxBB5qD1MNdbP5oPEmLQVN4DSWk
         E6uJljf0ipS3SUHGU7wNftXGyNvjD7p9Ry6vnLARnO9BvOKuhFlvpCPEBpGsQG2Jiuq6
         h2GnB93vPxie/WPHE3V/azDmIf7aWoVsPONM6eA6KTlkOqG2qq36+WuAboo9fO1pVCbX
         QIBZ6rMbTXSXid6E1KcfkuuZ+4voKFrEC1GM8s07TrdutdCfRsFdfsoSnlgDfwXYfDpe
         8r0ZbswrZXwgd3ZhFiOu73beTh0+50SrsreRbBcu+WxvVz2ur8aCFzzMhVRcnnKYBiXr
         ejLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747752181; x=1748356981;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NL9VnS5cf/6NW/p94tIKHT/4gGzvfJ3RyyiZ0fUNEek=;
        b=kfxj4C8D3C+1mZ5xRjdkXiwYwCDkui9YTouBk0xdWgfYi6RkBTRQDS7blZAxMEHbU0
         c2x/ROsY4lHEEpXL/Vo6C24b0/yXc1r3mn/hRu+rheLUs6VozkqOfklFwXP04ihul94N
         dwRhG62YsmD22CTPuafWXlqo9DneaaxYzGPjyf/qKkSZ8HdBxYquJo5DWBzYJ6Vqm3i1
         dJfs0u7PbDY2UxarKND0c2oKdKo17NpEF5s18OJYFYv4ZUZQU1kalNjdalMf/dm08Tsi
         /bb8B9dGb0J1cGkSX3LURPNHO/Htzn/Kdxy2ji/pJtfpLaLyQVkHm583UiTD/Cxq+J5p
         Q8AQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMKs+TmVDGDvnYoaIZEs8S4/iLYLsX24xA3XgFh3JK/58oHTX1+DzZuDYLz3Sx9olon2x4W6fCYZd3HaX4@vger.kernel.org
X-Gm-Message-State: AOJu0YyizyzGPHHNWKsXo5IJSdUDcGkNoyuvC5raPUiu6UQ/5W20cwyc
	WnsQDB4odDyzlhvql/7lIYuTTadLc32fF2mbPOeCdIPCDrJY7UgWTm21suSAdQJTqrAZp78iFZJ
	uu+FX4f85IQHJnij18r0kBNdCnKHm01I=
X-Gm-Gg: ASbGncvu7mtwr4Y9XmplXvQk9z7hCPE/cr23cBT4+QXEeHKhy+ft4xeea/WacTDiV2K
	WiO81MYJUhjTrHOoFXf9J6gvJwCAtxaDsTMZW0C0h0M3yXxyKOnyDC2rktcZVD//uqn8bMXnvJp
	t6rsZrxgK7ti2QNhGlw9Nuj8wupCI5lBf2
X-Google-Smtp-Source: AGHT+IF/aCn3KuIR/kknx0aBZr7IzoK3GvwOK/L+4l4anpA0Ks1VE8JmQjWR6x3bz5ayRXEdRHZ1M4ocBueOSYEkMnU=
X-Received: by 2002:a17:90b:3b48:b0:30c:4b09:5f3d with SMTP id
 98e67ed59e1d1-30e7d61316bmr10052600a91.8.1747752181324; Tue, 20 May 2025
 07:43:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515-msm-gpu-fault-fixes-next-v6-0-4fe2a583a878@gmail.com> <20250520141857.GC18711@willie-the-truck>
In-Reply-To: <20250520141857.GC18711@willie-the-truck>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 20 May 2025 10:42:49 -0400
X-Gm-Features: AX0GCFsH2VOZ8YMhHMV3BqM8wqyCOVzoUFywTVBwakEJMPVYAMwwsNIEoTGSpRU
Message-ID: <CACu1E7HdJvbx_6L9KvX3n78_cbkrey8npo=O=AkEzg335wJC=g@mail.gmail.com>
Subject: Re: [PATCH v6 0/7] iommu/arm-smmu, drm/msm: Fixes for stall-on-fault
To: Will Deacon <will@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, iommu@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 10:19=E2=80=AFAM Will Deacon <will@kernel.org> wrot=
e:
>
> Hi Connor,
>
> On Thu, May 15, 2025 at 03:58:42PM -0400, Connor Abbott wrote:
> > drm/msm uses the stall-on-fault model to record the GPU state on the
> > first GPU page fault to help debugging. On systems where the GPU is
> > paired with a MMU-500, there were two problems:
> >
> > 1. The MMU-500 doesn't de-assert its interrupt line until the fault is
> >    resumed, which led to a storm of interrupts until the fault handler
> >    was called. If we got unlucky and the fault handler was on the same
> >    CPU as the interrupt, there was a deadlock.
> > 2. The GPU is capable of generating page faults much faster than we can
> >    resume them. GMU (GPU Management Unit) shares the same context bank
> >    as the GPU, so if there was a sudden spurt of page faults it would b=
e
> >    effectively starved and would trigger a watchdog reset, made even
> >    worse because the GPU cannot be reset while there's a pending
> >    transaction leaving the GPU permanently wedged.
> >
> > Patches 1-2 and 4 fix the first problem by switching the IRQ to be a
> > threaded IRQ and then making drm/msm do its devcoredump work
> > synchronously in the threaded IRQ. Patch 4 is dependent on patches 1-2.
> > Patch 6 fixes the second problem and is dependent on patch 3. Patch 5 i=
s
> > a cleanup for patch 4 and patch 7 is a subsequent further cleanup to ge=
t
> > rid of the resume_fault() callback once we switch resuming to being don=
e
> > by the SMMU's fault handler.
>
> Thanks for reworking this; I think it looks much better now from the
> SMMU standpoint.
>
> > I've organized the series in the order that it should be picked up:
> >
> > - Patches 1-3 need to be applied to the iommu tree first.
>
> Which kernel version did you base these on? I can't see to apply the
> second patch, as you seem to have a stale copy of arm-smmu-qcom.c?
>
> Will

Sorry about that, for the next version I'll rebase on linux-next. I
was using an older version of msm-next for a while now.

Connor

