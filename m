Return-Path: <linux-arm-msm+bounces-57325-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA92AB03AC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 21:26:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2FEB89827F2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 19:26:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76CDE28A3F3;
	Thu,  8 May 2025 19:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dBVCkeZj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E028A288C23;
	Thu,  8 May 2025 19:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746732379; cv=none; b=gBJaI7GGHoFl4+fAXambhxAnNhaGQoVCv6nnCIxLIdkt/flCfE55bukChMtALPcY8d2+C/AdXGhuMwztGCTzwLhD+8Er+mJ/FDig25f5xg5AImTTA+E8Yd0uQsm73XCGmPe9PhqV3l2iZtwLd1PiJzpwGsLjAuoZYbpS6k3wzQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746732379; c=relaxed/simple;
	bh=k01Q2LGD0bus8lsuZd0h+QYKPrxWol7qHFfDhg230c8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i6WaZdngVuYszlX+X3jHNi+PoYCcCjpW/jIf+a8rv0g0bso/WiA4dxXiE52fKPHNbRJmqYDAXoDhQmCH1S/f9B3XPf3wFlXedH6tyxWjsOc6U3CB0q5p7RSU8hEBbMOL2xHqzWVNfGnrwQ5577z8FsJroU9s9ed+YdcRq1jLxBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dBVCkeZj; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-309f26c68b8so212886a91.2;
        Thu, 08 May 2025 12:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746732375; x=1747337175; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0hKru1L8dMScGzoC6BZyI54uV4RakPZMb8WHsDI441M=;
        b=dBVCkeZjJnC9u6To9H3V4/0DJXywLf48c+qJ792thnrozzd4BR5KgKlCzPal3h77zP
         K2QJ0SRx2P2jQ/i50JtImtBG7JcpLfvfU6Jf1MKopolqYokvgVM5Uc0CCF1FmJq/8OMc
         dC+p9ffVwQewS7CkXRn0DvrCBc4b4YhZLHVXkPo11lmBrrkji2qIgrarwT0ZZanYNHr1
         eJ9NTrAtfWjjWkF+0MeJT55fsjdHhnENA9k61LyEEuLWWlzWYBmQeGhFkKnk6XEuK0Iu
         8llEhhOWz3xHi+gur/9Ixm6eA19hoLm+dsO4PZLGy/gXv3BSGtzMK9+bTQY7EIFaeYoQ
         dKDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746732375; x=1747337175;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0hKru1L8dMScGzoC6BZyI54uV4RakPZMb8WHsDI441M=;
        b=UPzJlR2G7JXjWaWUDVaga87Cm8zb5ozIXYrwmDrWAbHJ/vCmNbb92PkTksEid5AFbJ
         poze5PxPZDb7HSsgELVoNg32QYTCPDbaj9Oqe7CW+oL796AFPvJ/GJtzi8/ktvNd7UnW
         P6WYKlZEGCh1kvhZp1tD/TNCmAvrXu3K0mDCp+u8M0gGAR5Brjx41RqaPm8xN9kxJ01T
         Kfxf/aYSEmvEF82lKIZvuqKMz33P2+zisquivvo54WXUW7kKZs7VpPdfhmZoYP1oVGfW
         ns2X0D8p33jHPKWH46yN4FrJOo9kJKp7TfEPC2VqW39I5noWtjTNeX6+Tk4NBOOpf4N0
         xTeA==
X-Forwarded-Encrypted: i=1; AJvYcCWYOk8T5ekgHvk1VvNO1JWatOe+rTxULkkeL60EPoLDvN4RDORdURMqE7p54xHBiFOnplvf7QdFAocCynsc@vger.kernel.org, AJvYcCXpPPs9RvvXOqks3RlkfTWp5k9KR+fNLQQfRdsBXcf123A+Hks1mNqQWHzWevA8kuU/U5CbJtzIELvr/vA0@vger.kernel.org
X-Gm-Message-State: AOJu0YwLUldVhjUFYFoMOig+XNi37MXwG2uj5MJblyN1ah+EsL9IynvE
	FbIMsZFdDNQtn0vTmRatkA3OTjvCXlKt9pWR0fKJQNaFgObIjkwc/4nnOp9yWxpDkCw4MfAIwUK
	ZXhQ4h7fQZuR6pb6g8LF9dfeRUwM=
X-Gm-Gg: ASbGncs/kwkdWenF2LuIuxZeUW7UWfAVjQVTKMzfVbehrgXMsZ3rHvLD+w1KJEQwTKs
	IVE3LXNJtAEAEjGrHCURYn5+omAXFFLCIncu7LW6F0dDSWbnmTiLMLhaBGa9VezOwI0iWyiShzH
	iY1QmXOWjKAirj4yul58n5Yg==
X-Google-Smtp-Source: AGHT+IGSpiN7eaDH3O4Uokp10YbmchAx5slpcUK4Ki93gIDNWaqoAmMgsVOGKoMSaAoqs8hgzbmH4KVxaKA8k0N96h4=
X-Received: by 2002:a17:90b:3e83:b0:30a:a50a:8c93 with SMTP id
 98e67ed59e1d1-30c3d674dadmr365318a91.7.1746732375030; Thu, 08 May 2025
 12:26:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com> <20250508-topic-ubwc_central-v1-13-035c4c5cbe50@oss.qualcomm.com>
In-Reply-To: <20250508-topic-ubwc_central-v1-13-035c4c5cbe50@oss.qualcomm.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Thu, 8 May 2025 15:26:04 -0400
X-Gm-Features: ATxdqUECrHAxamM6cf9DmM-j_slTE2IU4QDuio4QvANymnYvV5oJYBJ2BHROTFg
Message-ID: <CACu1E7E9yU-cygZxBqVypP7aFkXJCNTfXA2uqdvU84mi9T51Xg@mail.gmail.com>
Subject: Re: [PATCH RFT 13/14] drm/msm/a6xx: Drop cfg->ubwc_swizzle override
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 8, 2025 at 2:14=E2=80=AFPM Konrad Dybcio <konradybcio@kernel.or=
g> wrote:
>
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> On A663 (SA8775P) the value matches exactly.
>
> On A610, the value matches on SM6115, but is different on SM6125. That
> turns out not to be a problem, as the bits that differ aren't even
> interpreted.

This is definitely going to break userspace, because the kernel
doesn't expose the UBWC version, instead exposing just the swizzle and
userspace expects that it sets the right value for older UBWC versions
before it became configurable (0x7 for UBWC 1.0 and 0x6 for 2.0-3.0).
It looks like the data for SM6125 is just wrong.

Connor

>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.c
> index 28ba0cddd7d222b0a287c7c3a111e123a73b1d39..d96f8cec854a36a77896d39b8=
8c320c29c787edd 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -597,13 +597,10 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu =
*gpu)
>
>         *cfg =3D *common_cfg;
>
> -       cfg->ubwc_swizzle =3D 0x6;
>         cfg->highest_bank_bit =3D 2;
>
> -       if (adreno_is_a610(gpu)) {
> +       if (adreno_is_a610(gpu))
>                 cfg->highest_bank_bit =3D 0;
> -               cfg->ubwc_swizzle =3D 0x7;
> -       }
>
>         if (adreno_is_a618(gpu))
>                 cfg->highest_bank_bit =3D 1;
> @@ -630,10 +627,8 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *=
gpu)
>                 cfg->highest_bank_bit =3D 3;
>         }
>
> -       if (adreno_is_a663(gpu)) {
> +       if (adreno_is_a663(gpu))
>                 cfg->highest_bank_bit =3D 0;
> -               cfg->ubwc_swizzle =3D 0x4;
> -       }
>
>         if (adreno_is_7c3(gpu))
>                 cfg->highest_bank_bit =3D 1;
>
> --
> 2.49.0
>

