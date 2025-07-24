Return-Path: <linux-arm-msm+bounces-66624-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 270E1B111F4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 22:01:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6797E7A99D1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 19:59:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13FDB1FC3;
	Thu, 24 Jul 2025 20:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N36GKPRU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C37F9C1
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 20:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753387280; cv=none; b=fo87niy6t/wBR+GhPyP3+mBUUxFpNFbIF1WdqX1joHOP3omuf3VGAcFhwqJjppPVRlYVvWvrliaatdDJFS1Sb7e71+jZktFtX8YpFPc2ZAMZDGqK7Yv6WDwigRQ9V1rb3/uloD3wW1A1TLB6FYUtsS149k6LnH0/JJ9ltancIOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753387280; c=relaxed/simple;
	bh=VSOu4F1u6IlZ/kprq8pc9n1PSDpr2H2JTrXHFUUQpMo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B2CQS8iiezT+N0uHWTI/F8LZ0lgofqMq6VtRLr2ZoUF/UYuhYJIWIeduCcdMO2wTxrUcR7jJNiHlaqEndPoH68RNIO9RIzYIdAZOMZfDivtkCuVMTObBdIlh5poti+ALPZgrPTeMQMjDiq29AOIHfGIMqQT1Sms92uIsRRekSDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N36GKPRU; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-313fab41fd5so51381a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 13:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753387278; x=1753992078; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8YVZhtijekIW/92qFTf+Oe+xPDMC02tgXfuwwVtfYSI=;
        b=N36GKPRUqxgx8CcZY9mj5pxT8/3209rY4G0yL3Eh6d04Fqp5F9x/p1enjHe+ifQWfj
         biK+2yebreF0g9XkGyqgv0LJtivlDD66muFFS7z/4YsSinxUpf38wSSiOyFCyZW8ySLq
         KPRKdDvkA+UsNWAMas/EpJLoDcRLB4h2xJKzpaUv4hq99feMvA9BODBjRzUc1TlX59yq
         lXEhde/E1gqWs+03yoludtFMGTKunuWoGd7PL6zRxB2AtzINqtmL9JLejUu5k0lcCYXH
         if+UkLmcvzy9oOYLdOssInYkxHHItNQe7h+OzBVEEqsgZxNr6OsOyjOzh+equryYxAJS
         uCTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753387278; x=1753992078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8YVZhtijekIW/92qFTf+Oe+xPDMC02tgXfuwwVtfYSI=;
        b=QD6FosdQpzvHka/CMfU4lckeTMvFWdordRfWeQ17ijr2g0FSQuw260agSS86TFk7Dy
         URm0/EjuMEOhs8+GwbvNRFRhjbAQcK8lWSfEKfcqDoijeWbLX2xIX8LPAc9i+cXTEtjv
         oWjuBDxg3PvYFosiwtEkLNLkBFl2FxfJ9RqRfiRkloQ/EkD4jzrre/G6jhI6BkeUCLLr
         9y28GW3xQUxeQZuaTWhpI7Q8PP9JbwIfMATmxfnRmELW8HUbipWnF95atLjZJ/b8KoBb
         uvOyZTZJEVloTVlibhmSRCiUmGkMdyBibBSjm5UHMFyODhFf1pR4ZqdRkTnL5kFzD/4s
         IagQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsaQB0/2T0vXDSye6JTMSeoMFgJcLHjKpkSuGFzNzJJacr1hQpbNKJLFCPJc6skeKO0XtEdSEV8mnXWDvh@vger.kernel.org
X-Gm-Message-State: AOJu0YxYI2XCUdtu3XwgmmcOBoo/Va9y0TKzIcSy1wWEJuzdDHY0CFY+
	5ifIhF8Kswnz+j5tjYyAtvjsjEUiJ2eJ6V5+0DpuFH1xAtCeAikOLFXG36r+nY9ftH4A8D2BGZx
	QTsnyHdWJ+nP4ALdPSlHVn/mPScYz83Y=
X-Gm-Gg: ASbGncvY/rv1Yy0cgUprB9JEEOreFNbwS9B0KOAgo26wH/rCoNPNwQneHRj7jUttPBt
	k3KKaMwrZWcEOsjCAh+anhBhXlw7Pg18CEtc0+q9+m2TfuWxmDt81geTjmwNwX3/xsCok7edNhj
	al0+lNWBOk9whs0b0y3wMAqKaETi8DGQgglX5Nc2Bv+15Xd6lr3wpfAriSGTDE/6Jt44tdPy9+p
	v2A3yo=
X-Google-Smtp-Source: AGHT+IEywbJAAkTGz+hnYFVLzpBw5QA8DweVZDJ4Oe2m2pnxOIP7gvawN1ZP+mydg2QW0xhuQz8f4TpUp6wqYJgnlFQ=
X-Received: by 2002:a17:90b:1b45:b0:31c:3871:27ad with SMTP id
 98e67ed59e1d1-31e506937b3mr5278925a91.0.1753387277346; Thu, 24 Jul 2025
 13:01:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250718-msm-gmu-fault-wait-v1-1-4dcadd3b0eb6@gmail.com>
 <CACSVV023+6939fWvObBKg-rcoqP7TvxjQ2a8mY5+69dBh6cakA@mail.gmail.com> <6cca1521-a806-4c43-a003-36a045cf007c@oss.qualcomm.com>
In-Reply-To: <6cca1521-a806-4c43-a003-36a045cf007c@oss.qualcomm.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Thu, 24 Jul 2025 16:01:06 -0400
X-Gm-Features: Ac12FXwGoeDZgwfQOG90WaluaEzfX64KjMyzuxK7C8G3NFvRCh0bDTf5-rS3sXI
Message-ID: <CACu1E7EApr6Ne3XxFv4cUa2JuwNW2kfo1c5wSsAUN78iWyQ2sg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Wait for MMU devcoredump when waiting for GMU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: rob.clark@oss.qualcomm.com, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 24, 2025 at 3:48=E2=80=AFPM Akhil P Oommen <akhilpo@oss.qualcom=
m.com> wrote:
>
> On 7/21/2025 9:02 PM, Rob Clark wrote:
> > On Fri, Jul 18, 2025 at 6:50=E2=80=AFAM Connor Abbott <cwabbott0@gmail.=
com> wrote:
> >>
> >> If there is a flood of faults then the MMU can become saturated while =
it
> >> waits for the kernel to process the first fault and resume it, so that
> >> the GMU becomes blocked. This is mainly a problem when the kernel read=
s
> >> the state of the GPU for a devcoredump, because this takes a while. If
> >> we timeout waiting for the GMU, check if this has happened and retry
> >> after we're finished.
> >>
> >> Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> >> ---
> >>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c   | 21 ++++++++++++++++++---
> >>  drivers/gpu/drm/msm/adreno/a6xx_hfi.c   | 21 ++++++++++++++++++---
> >>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 11 +++++++++++
> >>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  2 ++
> >>  4 files changed, 49 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/m=
sm/adreno/a6xx_gmu.c
> >> index 28e6705c6da682c7b41c748e375dda59a6551898..6ec396fab22d194481a76d=
30b2d36ea5fb662241 100644
> >> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> >> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> >> @@ -340,6 +340,7 @@ int a6xx_gmu_set_oob(struct a6xx_gmu *gmu, enum a6=
xx_gmu_oob_state state)
> >>         int ret;
> >>         u32 val;
> >>         int request, ack;
> >> +       struct a6xx_gpu *a6xx_gpu =3D container_of(gmu, struct a6xx_gp=
u, gmu);
> >>
> >>         WARN_ON_ONCE(!mutex_is_locked(&gmu->lock));
> >>
> >> @@ -363,9 +364,23 @@ int a6xx_gmu_set_oob(struct a6xx_gmu *gmu, enum a=
6xx_gmu_oob_state state)
> >>         /* Trigger the equested OOB operation */
> >>         gmu_write(gmu, REG_A6XX_GMU_HOST2GMU_INTR_SET, 1 << request);
> >>
> >> -       /* Wait for the acknowledge interrupt */
> >> -       ret =3D gmu_poll_timeout(gmu, REG_A6XX_GMU_GMU2HOST_INTR_INFO,=
 val,
> >> -               val & (1 << ack), 100, 10000);
> >> +       do {
> >> +               /* Wait for the acknowledge interrupt */
> >> +               ret =3D gmu_poll_timeout(gmu, REG_A6XX_GMU_GMU2HOST_IN=
TR_INFO, val,
> >> +                       val & (1 << ack), 100, 10000);
> >> +
> >> +               if (!ret)
> >> +                       break;
> >> +
> >> +               if (completion_done(&a6xx_gpu->base.fault_coredump_don=
e))
>
> I didn't get why this is required. Could you please add a comment?

Without this, if the GMU timed out for some other reason not related
to SMMU then we'd loop infinitely. This gives up if there isn't
currently a crashstate pending.

>
> >> +                       break;
> >> +
> >> +               /* We may timeout because the GMU is temporarily wedge=
d from
> >> +                * pending faults from the GPU and we are taking a dev=
coredump.
> >> +                * Wait until the MMU is resumed and try again.
> >> +                */
> >> +               wait_for_completion(&a6xx_gpu->base.fault_coredump_don=
e);
> >> +       } while (true);
> >
> > It is a bit sad to duplicate this nearly identical code twice.  And I
> > wonder if other gmu_poll_timeout()'s need similar treatment?  Maybe
> > Akhil has an opinion about whether we should just build this into
> > gmu_poll_timeout() instead?
>
> Yeah. That make sense. A potential issue I see is that we might be
> holding both gpu and gmu locks here and the crashstate capture in the pf
> handler tries to lock gpu, which can result in a dead lock.

I think there would already be a deadlock, or at least timeout in that
situation now. Any task waiting for the GMU to complete while holding
the GPU lock would block the crashstate capture from completing and
allowing the GMU to continue.

Connor

>
> -Akhil.
>
> >
> > BR,
> > -R
> >
> >>
> >>         if (ret)
> >>                 DRM_DEV_ERROR(gmu->dev,
> >> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/m=
sm/adreno/a6xx_hfi.c
> >> index 8e69b1e8465711837151725c8f70e7b4b16a368e..4e775ca757ce3649ac238d=
25cebfd7eb693fda61 100644
> >> --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> >> +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> >> @@ -104,10 +104,25 @@ static int a6xx_hfi_wait_for_msg_interrupt(struc=
t a6xx_gmu *gmu, u32 id, u32 seq
> >>  {
> >>         int ret;
> >>         u32 val;
> >> +       struct a6xx_gpu *a6xx_gpu =3D container_of(gmu, struct a6xx_gp=
u, gmu);
> >> +
> >> +       do {
> >> +               /* Wait for a response */
> >> +               ret =3D gmu_poll_timeout(gmu, REG_A6XX_GMU_GMU2HOST_IN=
TR_INFO, val,
> >> +                       val & A6XX_GMU_GMU2HOST_INTR_INFO_MSGQ, 100, 1=
000000);
> >> +
> >> +               if (!ret)
> >> +                       break;
> >>
> >> -       /* Wait for a response */
> >> -       ret =3D gmu_poll_timeout(gmu, REG_A6XX_GMU_GMU2HOST_INTR_INFO,=
 val,
> >> -               val & A6XX_GMU_GMU2HOST_INTR_INFO_MSGQ, 100, 1000000);
> >> +               if (completion_done(&a6xx_gpu->base.fault_coredump_don=
e))
> >> +                       break;
> >> +
> >> +               /* We may timeout because the GMU is temporarily wedge=
d from
> >> +                * pending faults from the GPU and we are taking a dev=
coredump.
> >> +                * Wait until the MMU is resumed and try again.
> >> +                */
> >> +               wait_for_completion(&a6xx_gpu->base.fault_coredump_don=
e);
> >> +       } while (true);
> >>
> >>         if (ret) {
> >>                 DRM_DEV_ERROR(gmu->dev,
> >> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm=
/msm/adreno/adreno_gpu.c
> >> index f1230465bf0d0840274a6eb03a10c4df3a7a68d3..19181b6fddfd518e2f6032=
4da1a7087458115e40 100644
> >> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> >> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> >> @@ -293,6 +293,7 @@ int adreno_fault_handler(struct msm_gpu *gpu, unsi=
gned long iova, int flags,
> >>                          struct adreno_smmu_fault_info *info, const ch=
ar *block,
> >>                          u32 scratch[4])
> >>  {
> >> +       struct adreno_gpu *adreno_gpu =3D container_of(gpu, struct adr=
eno_gpu, base);
> >>         struct msm_drm_private *priv =3D gpu->dev->dev_private;
> >>         struct msm_mmu *mmu =3D to_msm_vm(gpu->vm)->mmu;
> >>         const char *type =3D "UNKNOWN";
> >> @@ -345,6 +346,11 @@ int adreno_fault_handler(struct msm_gpu *gpu, uns=
igned long iova, int flags,
> >>                 /* Turn off the hangcheck timer to keep it from bother=
ing us */
> >>                 timer_delete(&gpu->hangcheck_timer);
> >>
> >> +               /* Let any concurrent GMU transactions know that the M=
MU may be
> >> +                * blocked for a while and they should wait on us.
> >> +                */
> >> +               reinit_completion(&adreno_gpu->fault_coredump_done);
> >> +
> >>                 fault_info.ttbr0 =3D info->ttbr0;
> >>                 fault_info.iova  =3D iova;
> >>                 fault_info.flags =3D flags;
> >> @@ -352,6 +358,8 @@ int adreno_fault_handler(struct msm_gpu *gpu, unsi=
gned long iova, int flags,
> >>                 fault_info.block =3D block;
> >>
> >>                 msm_gpu_fault_crashstate_capture(gpu, &fault_info);
> >> +
> >> +               complete_all(&adreno_gpu->fault_coredump_done);
> >>         }
> >>
> >>         return 0;
> >> @@ -1238,6 +1246,9 @@ int adreno_gpu_init(struct drm_device *drm, stru=
ct platform_device *pdev,
> >>         if (ret)
> >>                 return ret;
> >>
> >> +       init_completion(&adreno_gpu->fault_coredump_done);
> >> +       complete_all(&adreno_gpu->fault_coredump_done);
> >> +
> >>         pm_runtime_set_autosuspend_delay(dev,
> >>                 adreno_gpu->info->inactive_period);
> >>         pm_runtime_use_autosuspend(dev);
> >> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm=
/msm/adreno/adreno_gpu.h
> >> index 9dc93c247196d5b8b3659157f7aeea81809d4056..f16556c6f2921708e740ec=
d47f5b4668e87700aa 100644
> >> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> >> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> >> @@ -179,6 +179,8 @@ struct adreno_gpu {
> >>         uint16_t speedbin;
> >>         const struct adreno_gpu_funcs *funcs;
> >>
> >> +       struct completion fault_coredump_done;
> >> +
> >>         /* interesting register offsets to dump: */
> >>         const unsigned int *registers;
> >>
> >>
> >> ---
> >> base-commit: 8290d37ad2b087bbcfe65fa5bcaf260e184b250a
> >> change-id: 20250718-msm-gmu-fault-wait-465543a718fa
> >>
> >> Best regards,
> >> --
> >> Connor Abbott <cwabbott0@gmail.com>
> >>
>

