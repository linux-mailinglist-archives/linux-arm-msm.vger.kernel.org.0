Return-Path: <linux-arm-msm+bounces-69985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 799AFB2DFD9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 16:48:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A4811C4669F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 14:48:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4066C283CBD;
	Wed, 20 Aug 2025 14:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dHNGNfZO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C336305069;
	Wed, 20 Aug 2025 14:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755701264; cv=none; b=EtAwQTf4SzC+6TgonGqE1KUqKF/rF/aSqL85z3Ig2qelfSNAsZnelwkP/XotQy+O7w5/wcP+Razh75abynErY/3xNxQ2KMUxIKECZ6/wE7+yqO3k9AA8WVl64w54CYK3N+m75LsrrOpL2IYwaiPtpJbL2pmKBRN2GMNDEKiCCfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755701264; c=relaxed/simple;
	bh=cWj1IX21smcNyiPgz/gPQYjxqJa5esyosznvb1OSK7I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ISJkLxOh6eUYk3SE6tSoCyQBxXVk5lOnaZ7rS6Mrky6M6ExYyNvFa6LPgTGzJPPHlX4FHBz1JC0qBb90WgQWh9eLJZzJYT07ytmD9QmHs65xjZPTd7FmB+1uzHvNQSl+fo0yybJXhK/v3iZTLrMWXzEUuAdD1WAzp+tCDtrgFfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dHNGNfZO; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3232679d227so737a91.1;
        Wed, 20 Aug 2025 07:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755701261; x=1756306061; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P74cWaI2z7D5zkTAV6WkwACmi9NfYu/QabOQMTjargE=;
        b=dHNGNfZOjOBOPTxPq9o6JnBx5uI8BEG7qg3+rczOQpPgAq/sGYNecNRyHSdhdFNqiy
         S7zjvsDamOvwnWgiqmOhu/5YjkwUeZRoCaFIifdwQY2BC4K1py4d3kq522z35YlwbUK3
         HoEH5gnAd6sCfVitc6as4PSOr1Qu0LxQmbzQroHKVjOFkD+KO2rboVrOqgDfMpNppY7N
         DMAVKqVhhWVA72FcDyNGbQ8Bfz6seIJXvB5ZDiZUzIDixkvTqGpXxr4AFNj+RGw4gvJi
         swJxq50BdhZU4lR7kCJ6ZSHYw1eNsCYM2F7i4D43G6VF6AWrdMF1iCm5IuQJbZb0tLZT
         Xx0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755701261; x=1756306061;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P74cWaI2z7D5zkTAV6WkwACmi9NfYu/QabOQMTjargE=;
        b=wKhf2OXAGArl93JbnSQeRgkSDZafRnY8c1TMuAOBIrLbnKh0C8DPbO4t+p8gEGPfVW
         JX43LvlNL1JuXqPR88JG4nKIf/i4a8r7+LN3I5WFKoiA2utsAtJcjHTBU2ktRzjTRhBq
         66Vn1BrOGsFAPjbaBxgJeC4Td3B1AsOdgw/KGfvekrVSLgUAMCra9RZmfMVGKnyqq7v4
         3Ov1iaI6F+XleEyzoZpNoHl7SF1rteE7LBo0xPH7x9b7sRj1oA9AM0Feo/JAI4wmzAaQ
         R4WMxVzVUYsCM2CdHwGJuw8RkPq8ZeJsHosx60ZBwuOR3555eOg7yKcsKaVMYv/PT0hZ
         DKeA==
X-Forwarded-Encrypted: i=1; AJvYcCVv0cH3/YLmxKyR5XDXSTqv18DpLDTdrzJp1bsNOwaT8RH2qd+bsts1GDCKJJW/S4pN1nC4uOpAzwiHbswQ@vger.kernel.org, AJvYcCXpIE+7e5dTz3DLpKSci4I81oXvkcvs+zLZlE/p0eGWBeTwuhrjYcDVsFiXl3JD9NlnHaVXRnu4EYFKNO40@vger.kernel.org
X-Gm-Message-State: AOJu0YxptrBeOR5c+Ry7PS/3f2C7HPzwi/+P5gMCKnQX8jPNZ+4Nxkxm
	WQ8aDbeKnW/DA8Mhd4ty7g1sT+MchEjALHisnO7qajB3vu03Sj9O70X9hGetZ/ZJt8GPykIwEIE
	t00t7C6eU3FSFfaDxii9fJR+lLh01J1Q=
X-Gm-Gg: ASbGnctEWt4sM2X7Ppq2T6vNocShWlE/ZczPkw+wGCgd+yyZazq7sAw1fMlWE2YcSxd
	60TMVtrqkd4faq8yHSFCES2xkNyvbzC3Effz/NN824Vkfkj8llT5AettjY4VwtGLykOrySA/j4b
	2NlT7eAFpXIX+W557mXtZ3mNeZFUhjftEMsBiVqWH5/MezziWN6aOUPkLeQPFyudLKdyEEDcu+3
	dZBlwgF46k6BsBS4w==
X-Google-Smtp-Source: AGHT+IFUNJ9BxglyIJfmA24m4n2cMgP8qB/zVxhLPOKn4d+ZE2WHDRb30TmaMasdJc610kkF0N/8cY8mrV+0HOB+b00=
X-Received: by 2002:a17:90b:4b8a:b0:321:29c4:e7c3 with SMTP id
 98e67ed59e1d1-324e141af03mr2170138a91.3.1755701260964; Wed, 20 Aug 2025
 07:47:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250819232905.207547-1-robin.clark@oss.qualcomm.com>
In-Reply-To: <20250819232905.207547-1-robin.clark@oss.qualcomm.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Wed, 20 Aug 2025 10:47:29 -0400
X-Gm-Features: Ac12FXwouonsgjTZxaCzJYBWL0yW-dIZ2_c2VOjUHtNx9Lqxaj97eBQUloKwy2E
Message-ID: <CACu1E7FA-TTeW=cFqdUN+5NZhmU-hphiW--4qyvOgk+5RT5dqw@mail.gmail.com>
Subject: Re: [PATCH 0/3] drm/msm: A few GEM/VM_BIND fixes
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, David Airlie <airlied@gmail.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
	open list <linux-kernel@vger.kernel.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>, 
	Simona Vetter <simona@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 19, 2025 at 7:29=E2=80=AFPM Rob Clark <robin.clark@oss.qualcomm=
.com> wrote:
>
> Fixes for a few issues found in vkd3d-proton testing.
>
> Rob Clark (3):
>   drm/msm: Fix obj leak in VM_BIND error path
>   drm/msm: Fix missing VM_BIND offset/range validation
>   drm/msm: Fix 32b size truncation
>
>  drivers/gpu/drm/msm/msm_gem.c     | 17 ++++++++---------
>  drivers/gpu/drm/msm/msm_gem.h     |  6 +++---
>  drivers/gpu/drm/msm/msm_gem_vma.c | 31 +++++++++++++++++++++++++------
>  3 files changed, 36 insertions(+), 18 deletions(-)
>
> --
> 2.50.1
>

Confirmed that this fixes vkd3d-proton test_large_heap on a750 with my
turnip sparse MR.

Tested-by: Connor Abbott <cwabbott0@gmail.com>

