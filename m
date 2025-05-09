Return-Path: <linux-arm-msm+bounces-57440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5874FAB15E3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 15:54:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E3DE64E0796
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 13:52:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 375E42918D3;
	Fri,  9 May 2025 13:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eBQBtT9T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F472918FD;
	Fri,  9 May 2025 13:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746798758; cv=none; b=slDb2jC8keGhIk9WIIFJyHDWdhMw4odD3GpY7dDAW9jYJ1tduw1Fw50EknEK+9OLoCpaTaE1WBrgtwr75o9ilfpkcdGxXR9HyiRyMsvLPR55g84VWjVkMgpEYnZf2P7zsLm0s+yU7ag6D8P2yYESuBHv1UOv/JcfMoVA7pOLCSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746798758; c=relaxed/simple;
	bh=ui8gHGkFEjjFF4d8pkE0+iCKIxWUYvN6qZBgiqenwbM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c7SWt1EySPIT5NuSkzWw9XMH/RxHFef4fmOpaCCUsADyzggKx+hIjb9WYxJhyP8GcvnSshioK3ROHjzLVyyH+sS9Ooo1/GiZAFBNAiOE9uTg+qr+Yj5ahi3gVff1bBC+Ts2OTQTF/+FcYZcvJThXAlImWN4U8qClfxKwO7PMIbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eBQBtT9T; arc=none smtp.client-ip=209.85.166.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-85b4170f1f5so71588139f.3;
        Fri, 09 May 2025 06:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746798755; x=1747403555; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PtSH5nI+hYw4K91qiMTbyWnP4++Yt+hkpqevJyQzufo=;
        b=eBQBtT9T4UAJn2PMEqHAlkB/K9NElv3cChFF7LQ6yCb9BjItWnEOj9N2gQQ+bxmCkv
         fz/uzPHwQX/j73JViZFCmNRVcN6kEECLtM9cNvaxArLECPgfJ0tU2mfpK82OlLlLEBX/
         K+jLsoezBkWEXj82xfKk91p3eDQGt852/5taz4sWreYWmeOadCbqT0y50HSie/MdP2WE
         sAkqg9BFsKYpEy9sFy48gS5Us39eN9Yh2mUNzq9Zv00veGCn71K3PcYGO9npcEq2nJFy
         5CgGpeUOYoW6u2Do4f7jjknnMq/Jf9PaCFNgcXxYKfx3jc4a7X/QJzoLajFaXKgndN5D
         /hjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746798755; x=1747403555;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PtSH5nI+hYw4K91qiMTbyWnP4++Yt+hkpqevJyQzufo=;
        b=RVSzMmaMVZJsZ2WljfgMmvKtMdavevS8tbPB/3a3LLwZrUnPNqipwIaY/6fwgU8oNT
         v4HYra3ZfbfybBb5OsTfKKa/9OX/BHr0qw2WJBiiU2u2EE3hckSiWgPVQwRMDqumK5Xm
         T0tb8KzpDyavsyQl/9xcQGtgFkYVNp1MOklmZtacBxdx3FJUvSKcLkUOiM+v6lH1SUN0
         1kBcTaDfUAQqVvpiI9dw4mYPH4Ly9HF4OrH1HvjZmunaZP/CtASeZPyIIcJ7nv+7bL3z
         vX03jWV2cykEvDQK9M255tMCiybHV7Q5oo/X5ycSuZQDBe+AfTk5AVJlpMm+ZBSXNMpJ
         eq3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUHqCJAd4PwBDDhYE5vc8s3w0APXJuVqvh6EnunPS6jHgcQpJfQIZMWuIp8QkTrSfouVIQ4pe7Ylbw24Zgd@vger.kernel.org, AJvYcCURSNgoZ/zqoyNxCorCav7m4bFdcMTXmyWGylCQsyqcM8WgDdlO/2TRQxwZjdpq2owfs0Oi4KgQSyw8n6SE@vger.kernel.org
X-Gm-Message-State: AOJu0YyTcalRoJuKaFlbegYHhM3DdCcVUwgPbWDV2k4rqTXu4OR0K/Y9
	V9O6FFPsSLeDPyk2DrlHj9yMtGcEx4MFc7GUZxLETpfmnCu0RQ+JV1+E6iHGzA11Kd2JJLz2Zti
	rwS0yACsgkEQ4Fd9E2pHcRszzgfk=
X-Gm-Gg: ASbGncuXDu4WjJlL0tPfdRYYv4UzCCwZZQ0h0tzY4ZDuWj0eT+0ZQdoL/YU2M2gEvA2
	A3jwchaIRl4Tc00we9eH1p7VTSCkL8JMg7xlFZBGw4IHKOmGzP28qkqCtvCAgRAxzotcgMYv0bN
	j8racRHRfNdO++iuxXNSmVgg==
X-Google-Smtp-Source: AGHT+IEtyWkvkWlkFB/0B7z7ZFqlkBdmXeZzAPAxswbI80SdN2p9eTapIvhC18am+K6cf2EQIuo8FKBK2WLzBA1V15k=
X-Received: by 2002:a05:6e02:1689:b0:3d0:4b3d:75ba with SMTP id
 e9e14a558f8ab-3da7e1e1b24mr43129255ab.4.1746798755408; Fri, 09 May 2025
 06:52:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com>
 <20250508-topic-ubwc_central-v1-4-035c4c5cbe50@oss.qualcomm.com>
 <CAF6AEGtcoMZ+WiW5_BA4NFpLZsoOrDbkY4xyvENGoS2FQVwQxw@mail.gmail.com> <5c3d3682-8378-486d-8af1-4b884b81f3d0@oss.qualcomm.com>
In-Reply-To: <5c3d3682-8378-486d-8af1-4b884b81f3d0@oss.qualcomm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 9 May 2025 06:52:23 -0700
X-Gm-Features: AX0GCFtkuS-MqVFGx1kw13xZjuTaKSplnt5h27l8JKKLHrytJs4ZlOcxEKTw1KU
Message-ID: <CAF6AEGvmEP4oGytfsCHYDCtOUDYq68y=vS7fu0jzP+=oajeq9g@mail.gmail.com>
Subject: Re: [PATCH RFT 04/14] drm/msm/a6xx: Get a handle to the common UBWC config
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 5:31=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 5/8/25 8:41 PM, Rob Clark wrote:
> > On Thu, May 8, 2025 at 11:13=E2=80=AFAM Konrad Dybcio <konradybcio@kern=
el.org> wrote:
> >>
> >> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>
> >> Start the great despaghettification by getting a pointer to the common
> >> UBWC configuration, which houses e.g. UBWC versions that we need to
> >> make decisions.
> >>
> >> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >> ---
> >>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 16 ++++++++++++++--
> >>  drivers/gpu/drm/msm/adreno/adreno_gpu.c |  6 ++++++
> >>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  3 +++
> >>  3 files changed, 23 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/m=
sm/adreno/a6xx_gpu.c
> >> index b161b5cd991fc645dfcd69754b82be9691775ffe..89eb725f0950f3679d6214=
366cfbd22d5bcf4bc7 100644
> >> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >> @@ -585,8 +585,13 @@ static void a6xx_set_cp_protect(struct msm_gpu *g=
pu)
> >>         gpu_write(gpu, REG_A6XX_CP_PROTECT(protect->count_max - 1), pr=
otect->regs[i]);
> >>  }
> >>
> >> -static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
> >> +static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
> >>  {
> >> +       /* Inherit the common config and make some necessary fixups */
> >> +       gpu->common_ubwc_cfg =3D qcom_ubwc_config_get_data();
> >
> > This does look a bit funny given the devm_kzalloc() below.. I guess
> > just so that the ptr is never NULL?
>
> Yeah, would you prefer this is changed?

I think having an all zeros ubwc cfg isn't really going to work
anyways, so probably drop the kzalloc().  Or if there is a case that
I'm not thinking of offhand where it makes sense to have an all 0's
cfg, then add a comment to avoid future head scratching, since
otherwise it looks like a bug to be fixed.

BR,
-R

