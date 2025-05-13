Return-Path: <linux-arm-msm+bounces-57773-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E483AB5F03
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 00:06:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 552EF860412
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 22:06:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 600D874C14;
	Tue, 13 May 2025 22:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SYQF76dI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D2B2770B;
	Tue, 13 May 2025 22:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747174004; cv=none; b=IYfTieUpVko371Pp5hpY18Q7pj3v683yfpSd/VL1za12VHJt/25STaokYi4a+5YezrAndM5xKc944O8rt5cbchxFmYy8RJr7QjF72vjYnd+0PkulFyfYKJg5K8TK+RWw70vI0X9OKUxoiV33Chv8/CZFu4LGJPd7kNK4iWlFD7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747174004; c=relaxed/simple;
	bh=dhav+Y0q2M9Ebn6kPMy4OqurNV5qty5UNjwoOYXPJwo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WxINzJxzLuXXuDjGRXDMeL/O8ub19chXx06wXY2WBidIm4MWPBG7qEm52AvRBGH/dlaDaSrH8L/E1McC+vfX7bz+pBD1OauzzcEW0aTx025cAJ0YMRtf4+zDa+EJNpjune7i4kuqKoOhSrouJyNK99Kr8Pv0Bxl/d/54aTtowVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SYQF76dI; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-3da6fb115a6so53558955ab.1;
        Tue, 13 May 2025 15:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747174002; x=1747778802; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3NSr3zCVYmv0aPTkXL+9a8Y73rmWDloOCZ1MASrXE/Q=;
        b=SYQF76dINTuKIy9F3UxZMA134hEuZjbfAcjEoWvrUDKYdSO6TunT+x1+zLmsPqFpg4
         dHyr03zN/QIC7LoXK5n6lIim3WZcZky3vvyAaos0GAKirlnaXSNoYVMNzzbB8JmuIUap
         Z2INzYu8kx8v2tRfAgS6rJTQ7rZYMA3WMkv9tYYZZT+CmgPEmSAcBSrbC/jTz3PjUVom
         w3Sn+Nu9wITPbW+AtFOtsZNJgLgHsV65TPItmWYGwon/nHqBRmoxdL57ygabR+o/tKDx
         UBDEiNaQr6M3FWlHikdXPu1VBhZuf5fGzq5TOVc48Kd2y/kxRKYFpmPFpKwxpp6Y7gDE
         mT+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747174002; x=1747778802;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3NSr3zCVYmv0aPTkXL+9a8Y73rmWDloOCZ1MASrXE/Q=;
        b=Vbu/eJHRAuKwSyGPo1GKhIUzRoMHhu4BWUZmfPsc2YJmnaJrzHUIlVA2urP06V85r/
         wRKiqqHTMAvTMhACByr/+LYgOve1pUckNym+MJtd6RTRuPk0itEV5On/TWldYF4i2qv3
         pxMNiHRV9SE7JyW2Ud8uEoFeigigxP5dYbDE9L1Z2EagD3Xr5Qt5bI50nt0AwnDEQles
         mznFbVZgkl1lQcbu9/MTwelXmBmsfcdpD3BEtvycgsAHMp3Lxd6EGjORs+E3sX2PD2UY
         N38kMEQnr35GFkaGXjxSwZ3aEBezRIkFjAWG03bh8MJ9JZItBPAG2YjhsawFGpG9ATgQ
         GGCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVanYcnX5ZTNkK1CgksIeF8AeJHOG98vpMJry58qK5C2aGxfnugx24jtGLyzqGNHFSuywHaJp96OOBPC8Qq@vger.kernel.org, AJvYcCX3jydLLMjsKcb0NfJ1zzjo4cAiTWP32XKwwrWFue6vq2blxBPE4U46ot0zxKJyV0/0z5hXQ9zYFRTDQIg8@vger.kernel.org
X-Gm-Message-State: AOJu0YxsPqOLk0YulCTGo74DdK37SZDaNxyq+aodJJBCu0303l/nzwF7
	uHxOwXEbXO64Dx/6aPQfQTFKczjEz8TNv1pULzXtkAJvGDePVs5BwbQhXrhVXQpyRtq91nQk95K
	LNph+15B9W2nTqN/AmyOYX+HjPQE=
X-Gm-Gg: ASbGncvGgb2Td1juDIt7cXjlcgnGWBOH6YuNiY2rGLpig7nZvQ8Lx+Xbws5Vy09HvQ9
	vw4V8xR7vYFW1t6Hj2tyUimsyeWM0eEnNrcZaL+SBWUsPhxelM1viQYxD00ZafxMTVhQuN2TZvT
	7mzs9SVU26sWaXMCFjzKoOoBZZf6JXO0SBxgn1SfV6e1/DZR8duppp2WFA7utsXwE=
X-Google-Smtp-Source: AGHT+IHH8XMbXywE7+ILVKsYc3F5InxyGAMPOhQYjsvCcY4gyCKCsqusIh3q+72eHNXy24eHEUamlkcX0NT6vD5p55w=
X-Received: by 2002:a05:6e02:17cc:b0:3d9:43fe:8e49 with SMTP id
 e9e14a558f8ab-3db6f7a54bfmr16529165ab.8.1747174001762; Tue, 13 May 2025
 15:06:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com>
 <20250508-topic-ubwc_central-v1-4-035c4c5cbe50@oss.qualcomm.com>
 <CAF6AEGtcoMZ+WiW5_BA4NFpLZsoOrDbkY4xyvENGoS2FQVwQxw@mail.gmail.com>
 <5c3d3682-8378-486d-8af1-4b884b81f3d0@oss.qualcomm.com> <CAF6AEGvmEP4oGytfsCHYDCtOUDYq68y=vS7fu0jzP+=oajeq9g@mail.gmail.com>
 <b7bd0f7a-854b-4464-abd6-51f932ee2998@oss.qualcomm.com>
In-Reply-To: <b7bd0f7a-854b-4464-abd6-51f932ee2998@oss.qualcomm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 13 May 2025 15:06:18 -0700
X-Gm-Features: AX0GCFsyH0dODUBB_8dHA6zkgfgnHu6B6D4Rxp3wAqz4e7AWlwmSCMHzcPSjotw
Message-ID: <CAF6AEGuDBdmyS+N4pR3gEYz0mSLkKqYZjCASk8am2atdGKq5UA@mail.gmail.com>
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

On Fri, May 9, 2025 at 10:00=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 5/9/25 3:52 PM, Rob Clark wrote:
> > On Fri, May 9, 2025 at 5:31=E2=80=AFAM Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> >>
> >> On 5/8/25 8:41 PM, Rob Clark wrote:
> >>> On Thu, May 8, 2025 at 11:13=E2=80=AFAM Konrad Dybcio <konradybcio@ke=
rnel.org> wrote:
> >>>>
> >>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>>
> >>>> Start the great despaghettification by getting a pointer to the comm=
on
> >>>> UBWC configuration, which houses e.g. UBWC versions that we need to
> >>>> make decisions.
> >>>>
> >>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>> ---
> >>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 16 ++++++++++++++--
> >>>>  drivers/gpu/drm/msm/adreno/adreno_gpu.c |  6 ++++++
> >>>>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  3 +++
> >>>>  3 files changed, 23 insertions(+), 2 deletions(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm=
/msm/adreno/a6xx_gpu.c
> >>>> index b161b5cd991fc645dfcd69754b82be9691775ffe..89eb725f0950f3679d62=
14366cfbd22d5bcf4bc7 100644
> >>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >>>> @@ -585,8 +585,13 @@ static void a6xx_set_cp_protect(struct msm_gpu =
*gpu)
> >>>>         gpu_write(gpu, REG_A6XX_CP_PROTECT(protect->count_max - 1), =
protect->regs[i]);
> >>>>  }
> >>>>
> >>>> -static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
> >>>> +static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
> >>>>  {
> >>>> +       /* Inherit the common config and make some necessary fixups =
*/
> >>>> +       gpu->common_ubwc_cfg =3D qcom_ubwc_config_get_data();
> >>>
> >>> This does look a bit funny given the devm_kzalloc() below.. I guess
> >>> just so that the ptr is never NULL?
> >>
> >> Yeah, would you prefer this is changed?
> >
> > I think having an all zeros ubwc cfg isn't really going to work
> > anyways, so probably drop the kzalloc().  Or if there is a case that
> > I'm not thinking of offhand where it makes sense to have an all 0's
> > cfg, then add a comment to avoid future head scratching, since
> > otherwise it looks like a bug to be fixed.
>
> So my own lack of comments bit me.
>
> Without the allocation this will fall apart badly..
> I added this hunk:
>
> ---------------------
> /* Inherit the common config and make some necessary fixups */
> common_cfg =3D if (IS_ERR(common_cfg))
>         return ERR_PTR(-EINVAL);
>
> *adreno_gpu->ubwc_config =3D *common_cfg;
> ---------------------
>
> to get the common data but take away the const qualifier.. because
> we still override some HBB values and we can't yet fully trust the
> common config, as the smem getter is not yet plumbed up.

So I get that common_ubwc_cfg is the const thing without fixups (and
agree that it should say const), and ubwc_config is the fixed up
thing.  But don't see how that necessitates the zeroalloc.  Couldn't
you just:


  if (!IS_ERR_OR_NULL(adreno_gpu->common_ubwc_cfg)
    adreno_gpu->ubwc_config =3D *adreno_gpu->common_ubwc_cfg;

> I can add a commit discarding all the HBB overrides (matching or not)
> or we can keep the zeroalloc around for some time (i'd rather keep
> the function returning const so that when things are ready nobody gets
> to poke at the source of *truth*)

We can keep the overrides to start (although the goal should be to
remove them).. but qcom_ubwc_config_get_data() not finding anything
seems like more or less a fatal condition.

BR,
-R

