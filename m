Return-Path: <linux-arm-msm+bounces-53669-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA851A82A6D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 17:32:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 84ACB7ACAB6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 15:29:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DDCB267B1F;
	Wed,  9 Apr 2025 15:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j/qvpMxC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A00C267700;
	Wed,  9 Apr 2025 15:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744212624; cv=none; b=Vz6e0iosnw8rvAlGjm40abNShhpoDqcpY/vvVfMJk8In9PFT05oYg3rdFSEEWyfFsqO/mLt5MQfw3sRrAFpRyJrOvrKlL3RaAgzuIMsZhG1dfGCLpbXZjRFDNLpWfdiWcgxIfNMU0/D/WAPDgy4emY1rG2YFS0aBoRskUfNFH0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744212624; c=relaxed/simple;
	bh=2c8Imyjxh5wJ8QbYOd6mxWFUbOT5GO1SJNdmlNcU2HA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ma2SRoITWPIIVS+nawdnX9q2UzEjCqULsd5YCV9nMPY3tA5/sCGlcBmaTx5t7FY1G+oWz+QEUKYJVh0Qtdf3yGWIRGXmDnCFX5l+BaP9LqIggDlVrB0tZ2nJ6ECEzkA7cqjdZ2YR8o1S6JEA+4FNlhYUugwDoxvMV6X/zGiBit8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j/qvpMxC; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-738fd9dbe8aso448744b3a.1;
        Wed, 09 Apr 2025 08:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744212622; x=1744817422; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z8RHRVKQouQftyjR10Wqn4eO6RF5eyTqUXdahuKdSrg=;
        b=j/qvpMxCsGrKiZU860c5FA8cYLBcxm8Pt645rdC13gnxdRNEi0uDAqUjhmwGHDEClP
         rZirFohxi90G0YtmMViaPj7fU4GsMkWRoDD8OHPLfD6plkB+foMSheA/WlXKRhD0m/hD
         LS7pGy83jBmZA/miraVDf8eacCeVKUBu35LTn84xgAhjQh874ltCXMghIqFsuYAvJssW
         PLzPsh2D6J/R9Kp/yBar+uds0P0b6i2NRLfpqmF/pI+ZjnaP4g1AWZv0exNWr/h6jnnv
         uWMqnLLwBXXStRL7V/K2zD3DwqJ3YpYMXbVTybJPnJWjSGj4Is3NznZTlp776KFKpO+a
         SRIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744212622; x=1744817422;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z8RHRVKQouQftyjR10Wqn4eO6RF5eyTqUXdahuKdSrg=;
        b=HrmFp7PDutM1Hm1jgrkdsLajuTQ5Onp9pVHxz/Lmb9+62yA/b5ROl9MgwBygvFNpHS
         SHYMGGuMNoNTyaxkbcXanLQ4zjlWqP8oGVj5thUtJIR/+A9+AM0N+lhZgy9usTXzfA+Y
         V7BL+/CPvJskpSHoIW9xeysxyskYfRz9VGeODw2HuNNQgtLTR4d9gNvqFgvd3awssX+e
         QKneKayIVUeY8TlZEVMPD14r27ROePjJPMVG2kGuZGJStxucazrgVvMl4no5bv0Ye9DJ
         fUu9vLPB1tQMPd95Fkg6cszOk6ihRzGrIbApFms4CKZhcUqkmXUlBvXnbOKXxJ84Ic7M
         tbGA==
X-Forwarded-Encrypted: i=1; AJvYcCVPDdrsEYCh+fsUW1bijgLBHvWlQf0jTBMOrRFsLBmv/DTz9newAWtz/mB89Y18LU24aikr2UrNOB/xX7Xl@vger.kernel.org, AJvYcCW0qOfdWRS8wbQcNn3UDsO3uw5sfubceSq/O0DtMyeh1FscbKbNlB5jsidfsYmSR7eJ54rNqaDwxczRNoYS@vger.kernel.org, AJvYcCXrR8qqrQ1dalNTI2TbY1v16OKy9mihRuzWfuAce3WBFFGGJSIp9oSPl3D8LGGLDV3oR7358mkZBxiC38fbrOhX@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4vE7GtTV43pmRoOjS6WgSa4CfXmwn1gpb6zaMh/4bRMbmmdeB
	6FdaA/3ucYs+8NJuc5fEzlSfyHyMuJEG74T/wbXyn2xjBjRI3nix6EZZ2NzNj6LHRUbsVMg9Ge7
	uXXyLm+YjGMpeYKtzYVSNj2+qZgE=
X-Gm-Gg: ASbGncsZ5wMcvc5BtW1bOUOc9rUCXU9SSlxpEtYfNB2AL5XrbpSEiiD9v+FMnPZjMqG
	jwNDddLs6STofyXXeSSVQL2s4EYLUf6/9q7H9H/kFJIIaxW9zfmBy2cOMpxdRidM833VVrS2XtT
	KARCqT3p7Ku9jny8pDQE23tw==
X-Google-Smtp-Source: AGHT+IFvw7UU8V9RYaU2yDGTDkK4qSbmVBUa5uAZXnS90yUfYYPnyAx4R3eS12INHlN8U3kMlOUeGD8W96fBB246NpQ=
X-Received: by 2002:a05:6a00:3a01:b0:736:559f:eca9 with SMTP id
 d2e1a72fcca58-73bae5272f5mr1833806b3a.3.1744212621584; Wed, 09 Apr 2025
 08:30:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250409-topic-smem_dramc-v1-0-94d505cd5593@oss.qualcomm.com>
 <20250409-topic-smem_dramc-v1-3-94d505cd5593@oss.qualcomm.com>
 <CACu1E7GMf0Mx2ZX_t76h+b1CPin49LGix7c5uvoWaJZC3dKyOw@mail.gmail.com> <c2dac38b-bbe5-4cd1-9d33-b4bba629d54b@oss.qualcomm.com>
In-Reply-To: <c2dac38b-bbe5-4cd1-9d33-b4bba629d54b@oss.qualcomm.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Wed, 9 Apr 2025 11:30:10 -0400
X-Gm-Features: ATxdqUHcBvVK0Cb2KxzN_hC_D58IOi6LWCz6c0PE-YPMPs9wv_qjFpk5kCr2vVc
Message-ID: <CACu1E7F71M0Z5KUdArRYbLEMXoS3jQEtp=0-4LEYFRysOsYZfA@mail.gmail.com>
Subject: Re: [PATCH 3/4] drm/msm/a6xx: Get HBB dynamically, if available
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Rob Clark <robdclark@gmail.com>, 
	Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Dmitry Baryshkov <lumag@kernel.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 9, 2025 at 11:22=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 4/9/25 5:12 PM, Connor Abbott wrote:
> > On Wed, Apr 9, 2025 at 10:48=E2=80=AFAM Konrad Dybcio <konradybcio@kern=
el.org> wrote:
> >>
> >> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>
> >> The Highest Bank address Bit value can change based on memory type use=
d.
> >>
> >> Attempt to retrieve it dynamically, and fall back to a reasonable
> >> default (the one used prior to this change) on error.
> >>
> >> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >> ---
> >>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 22 ++++++++++++++++------
> >>  1 file changed, 16 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/m=
sm/adreno/a6xx_gpu.c
> >> index 06465bc2d0b4b128cddfcfcaf1fe4252632b6777..0cc397378c99db35315209=
d0265ad9223e8b55c7 100644
> >> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >> @@ -13,6 +13,7 @@
> >>  #include <linux/firmware/qcom/qcom_scm.h>
> >>  #include <linux/pm_domain.h>
> >>  #include <linux/soc/qcom/llcc-qcom.h>
> >> +#include <linux/soc/qcom/smem.h>
> >>
> >>  #define GPU_PAS_ID 13
> >>
> >> @@ -669,17 +670,22 @@ static void a6xx_calc_ubwc_config(struct adreno_=
gpu *gpu)
> >>  static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
> >>  {
> >>         struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
> >> +       u32 hbb =3D qcom_smem_dram_get_hbb();
> >> +       u32 ubwc_mode =3D adreno_gpu->ubwc_config.ubwc_swizzle & 1;
> >> +       u32 level2_swizzling_dis =3D !(adreno_gpu->ubwc_config.ubwc_sw=
izzle & 2);
> >> +       u32 hbb_hi, hbb_lo;
> >> +
> >>         /*
> >>          * We subtract 13 from the highest bank bit (13 is the minimum=
 value
> >>          * allowed by hw) and write the lowest two bits of the remaini=
ng value
> >>          * as hbb_lo and the one above it as hbb_hi to the hardware.
> >>          */
> >> -       BUG_ON(adreno_gpu->ubwc_config.highest_bank_bit < 13);
> >> -       u32 hbb =3D adreno_gpu->ubwc_config.highest_bank_bit - 13;
> >> -       u32 hbb_hi =3D hbb >> 2;
> >> -       u32 hbb_lo =3D hbb & 3;
> >> -       u32 ubwc_mode =3D adreno_gpu->ubwc_config.ubwc_swizzle & 1;
> >> -       u32 level2_swizzling_dis =3D !(adreno_gpu->ubwc_config.ubwc_sw=
izzle & 2);
> >> +       if (hbb < 0)
> >> +               hbb =3D adreno_gpu->ubwc_config.highest_bank_bit;
> >
> > No. The value we expose to userspace must match what we program.
> > You'll break VK_EXT_host_image_copy otherwise.
>
> I didn't know that was exposed to userspace.
>
> The value must be altered either way - ultimately, the hardware must
> receive the correct information. ubwc_config doesn't seem to be const,
> so I can edit it there if you like it better.
>
> Konrad

Yes, you should be calling qcom_smem_dram_get_hbb() in
a6xx_calc_ubwc_config(). You can already see there's a TODO there to
plug it in.

Connor

