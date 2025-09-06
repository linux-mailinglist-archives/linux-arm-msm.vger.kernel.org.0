Return-Path: <linux-arm-msm+bounces-72413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C70F0B4784D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Sep 2025 01:24:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9A71F7AB4E6
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Sep 2025 23:23:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02C28279910;
	Sat,  6 Sep 2025 23:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VZKmhAAC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE701386C9;
	Sat,  6 Sep 2025 23:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757201083; cv=none; b=I2FbVQeZfONFss2wlRbqBtCN3s1WvnBVqK/5WC5Ji70+c/gkP4m8KAzBAp4JpztWYJhfOYdRT/E+yYNjkMtfgXDa6oH3cEW8oaF4elXlwmY5R4iWaWGxXRQk26UZcB85l79DTb9Cv0ucVkiQ4timfl4TpZi66R0uLr/tWt4/wxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757201083; c=relaxed/simple;
	bh=J3EUKf+Bnrsfaogk4UiIPvat4gKGkxg0DYy1TdJYMus=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rjd6CZ99Yujxe4li46iNuj8s1X+WvPwNW3+8XWZn+4+rBKKjeo4++h6VGrhqT29FA5fL5izP3PPEmlxXgJNYXxjbDXCaQVbh+ljsMql9MrQy1fy8osxwg4jrzSTVAdeNgQB5q6Bu79spwgHV4wysJF/ZtQnsT2hLM8AsOn5B5Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VZKmhAAC; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3f0fcd81068so22853785ab.2;
        Sat, 06 Sep 2025 16:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757201081; x=1757805881; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PGvk2Ayrgpgkvdk1KxrTdWoSL6fwyp7oUyGO2G+FLos=;
        b=VZKmhAAC74/+tOYehL9zsVK060TSeWVcphyJ2HVvZprwT5drmDby4tcdl08IOG/uwM
         185Oy3EDYbn/WKlFfi9SLbZ/TJGAWfSisIlCg1VvFYfLWf80iaWlccOVzCJ7fxmF9Ibu
         cc4D32wj5h4TUrcQViscJlN55R79b6xnbeeE6JkBF3zvuCY4rZs3xVtA9xkF0cqR+jtk
         OOWwias3fcaYoZRrqZDhOfDssOf65oYATlhqUHPNwYblxy617G8NwB8vNNAzJIs3I1dt
         7EeQR9rh4jLzBhLyVs/O/s09QbuIHoST7JmT2mWr5iuZkbGmHKP5TW87Fj8g5ETmLv6X
         ZbmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757201081; x=1757805881;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PGvk2Ayrgpgkvdk1KxrTdWoSL6fwyp7oUyGO2G+FLos=;
        b=JhqLEUG+1R/6h06zCaEbjzQTTYvAvV9/nMIN2SwWoO4c8f9mZvD4XG4jhzmn6ZVCg7
         t0SGerZOF9EmulsiG73NIVNkQNBEIzk7nAthWHXsFghIBOCH2wDLQh1Ab7VrHQB1lVIa
         oGnqOX9efQ5cvBZiHzcKsznPHu2ql75x+B06Ri74sVmnJX1qoN3Oy4a2dUpXp8QgWMKc
         ItwbHX/QkZLFyvEiiDGlJGkRk+Dx+59xuFjgx4lTStHYmtHDhQtrFzR4FDlnQ+34ibEP
         QOvCT5ueKy70YK5xPoVSpF7kABhlUMX7JkajhxwjdlQy9NgjLaGtHLYNvCty97F0RCkr
         OtrA==
X-Forwarded-Encrypted: i=1; AJvYcCVhye/ENVX3WPE9dmy2ssnDwGOTu0QiI1jDQhMjKt1PZZcwBp6vcF6999YdzkdIZguxOiraHHPvFQZg9krq@vger.kernel.org, AJvYcCXa5YD0SajDdXrhXvQCIRdgatJp3pmnhRpfBdl8OsPOC9I6cgj4bXExxiKFC552LWqEsVpMh+AnzXpUCjhA@vger.kernel.org
X-Gm-Message-State: AOJu0YxCKOTRFiS8LECNoaeyAg8U/64o18MAC9eOL/Ll3fIV9p5EEtKs
	zYUnkF35zESHVjePHn5Z4ApD3zevDdPM2R7V/06CT7+ecKnfy96wREuzk8xxFs1b5mPC2TiA0+2
	Cj4va0DQ+A8r9mwSAaaOwiYhT9Q23K5E=
X-Gm-Gg: ASbGncs1dPDyjdWRQJ5w467BixMKOmmHLSLnmUrFNBdePUogX/ysgmtFvozXMxHv8n/
	LcSxXO8e2ThGO+OAX1csc0VenRs0wyyaX2xszG+0/xms3/hGyc3Qc/AVRoHD2JbYG1m3DC63YUX
	cAyceJF3WJKY2hn3341vxGM02A1ge3xwbVPoiBP0RnIshc13/GfQCBKYtkEvdHZKFHBVMF1PV+i
	3cuLaTcCgavIfS9vEd9+/OlWLMAi281yVZr4fs=
X-Google-Smtp-Source: AGHT+IHbzFuGMDmnv0frhPIhTq5oYnNBUOAk33jBZ607JH+WQ67OjaXktEPH/I3o/DLT4BySNFcTAXpPczzukF4YKsU=
X-Received: by 2002:a05:6e02:4711:b0:402:d4b1:d751 with SMTP id
 e9e14a558f8ab-402d4b1d86fmr17352145ab.1.1757201081308; Sat, 06 Sep 2025
 16:24:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250524-binrep-v2-1-09040177218e@oss.qualcomm.com> <6mgmrqmixjdftpjz2hvwjnsyh3wwylxuaih7yez2mdgjpcp3l2@zjr4ai6kkjxn>
In-Reply-To: <6mgmrqmixjdftpjz2hvwjnsyh3wwylxuaih7yez2mdgjpcp3l2@zjr4ai6kkjxn>
From: Rob Clark <robdclark@gmail.com>
Date: Sat, 6 Sep 2025 16:24:29 -0700
X-Gm-Features: Ac12FXzsPBQeiW2jcuLgi_Mcl3QQ3Ze1Zo1qrNITBC_QCVQJV05ZtZCsjicpQXg
Message-ID: <CAF6AEGvJnSiyUJvBPusBZ+mriiP_vRiAgZnTyLSseu8Sdf9PXA@mail.gmail.com>
Subject: Re: [PATCH v2] drivers: gpu: drm: msm: registers: improve reproducibility
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Ryan Eatmon <reatmon@ti.com>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Bruce Ashfield <bruce.ashfield@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 24, 2025 at 10:15=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Sat, May 24, 2025 at 09:25:37PM +0530, Viswanath Kraleti wrote:
> > From: Ryan Eatmon <reatmon@ti.com>
> >
> > The files generated by gen_header.py capture the source path to the
> > input files and the date.  While that can be informative, it varies
> > based on where and when the kernel was built as the full path is
> > captured.
> >
> > Since all of the files that this tool is run on is under the drivers
> > directory, this modifies the application to strip all of the path befor=
e
> > drivers.  Additionally it prints <stripped> instead of the date.
> >
> > Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > Signed-off-by: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
> > ---
> > The files generated by gen_header.py include the source path to the
> > input files and the build date. While this information can be useful,
> > it inadvertently exposes build system configuration details in the
> > binaries. This hinders binary reproducibility, as the output will
> > vary if the build environment changes.
> >
> > This change was originally submitted to the linux-yocto-dev kernel [1]
> > to address binary reproducibility QA errors. However, the fix is generi=
c
> > enough to be applicable to the mainline kernel and would benefit other
> > distributions as well. So proposing it here for broader inclusion.
> >
> > [1] https://git.yoctoproject.org/linux-yocto-dev/commit/?id=3Df36faf0f9=
f8d8f5b4c43a68e5c6bd83a62253140
> > ---
> > Changes in v2:
> > - Corrected author id
> > - Link to v1: https://lore.kernel.org/r/20250523-binrep-v1-1-c3a4465188=
47@oss.qualcomm.com
> > ---
> >  drivers/gpu/drm/msm/registers/gen_header.py | 8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> >
>
> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>
> Rob, WDYT?

I'm revisiting this one, in the context of trying to re-sync
gen_header.py with mesa.. but it is only changing the contents of
comments, so it's not quite clear to me how this ends up mattering for
binary reproducibility.

That said, since the generated files are no longer checked in to mesa
or the kernel, we could probably just drop all of this if it mattered.

BR,
-R

