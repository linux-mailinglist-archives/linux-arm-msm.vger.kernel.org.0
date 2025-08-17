Return-Path: <linux-arm-msm+bounces-69460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E955B29393
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Aug 2025 16:44:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5146A5E1ACA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Aug 2025 14:44:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66F142E5D32;
	Sun, 17 Aug 2025 14:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WYLRyYJf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF274242D70
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 Aug 2025 14:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755441840; cv=none; b=rtsw8NmoRTP6z/aK++1Ik7UzLuxW5VHK48iPE4UCtVFmI8uNqj67hKLEDjuwqMzLWYieGsxnECpXMpU8V8nJ1EdGQb2Kt+zTtMI2ncT/sf5aApRIbxOORSk2z/bHqFPL8I3ZxenludttmFlie2YNpp+FFfkGBd3rielibSWihUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755441840; c=relaxed/simple;
	bh=HERO5RicVEngZIG5W/btl+e5Pm7lDj5IJJ3ZkaEEuE8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hS411xbxX/Kuu4FFQ0O/kO522/dhEz/YWiOLxrxtveT6I4FSUySqUybXu7y/L8yZB1VK1DwezyUNhAQeY0k42r3jiLX02xdwLEU5O7FUsHu8czp2DJp/Qf2Oxr3aI6avshzfVgBdfRNeHmlMhyKUeOGitfncfh7PVyJSa/esRuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WYLRyYJf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57HCu3uV010931
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 Aug 2025 14:43:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=mG+T9ioMHhpoCcn/9XccD1BhBmq0p9hKB6K8Qj/BJqM=; b=WY
	LRyYJfUyboIDLBmXgXmK3V093KoKPRUAjgTKsm0T4HD96UoxuRoH407Mzv69H68I
	+/X6HXBNVtTgoOMWcnrbxPJv6behmKsBpgbyj6x+hn3FfDYFH7YMtV5rWzPvVHhc
	ZEi5fWJTkTWf33CQnocQ62jYqWChMsEdSfW4jmAcYM1VY7X4qG89WWZj0tvSRUeb
	qJJzzBnmrY+fVVbJm9pSJ/MCggGgz+WSqn2oMHo36YcrZwG91inwK7BRUv8VcCLg
	3TsSALJA0at46jQBU8IHVoclO7Pmp5AyPWpTiGrPuDqRX003YW1G8VjIgoglyb6O
	BUbRCoDvoWdy4XCoXEOw==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jj2ua7kk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 Aug 2025 14:43:57 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-61bfaa21cfcso364645eaf.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Aug 2025 07:43:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755441836; x=1756046636;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mG+T9ioMHhpoCcn/9XccD1BhBmq0p9hKB6K8Qj/BJqM=;
        b=RZumaVblanr+WpHxCdqCzueLVY8Z1UBL5uckr/vdfNzeNmqWW1GIP4C0Xut25/zZ+N
         icWfbaioEBzdgwREggNuY/XjVU7jLheMX2yWar1IlGYO+BYLHFWjq3rJgWEOfn6YynYg
         SDoGBZcVXVVMVfzene8lfVuq7YeQUAOmjpIIDVmj6NVP9Zz2eviw8IEObLly35LkWNNW
         u5xcXgNMNXcJJXPUaicn32T2k0gvf83XsE3Q7OclDnnjFcYPWOWdKA7JWLKmdLmQljcr
         CRL8mtOwHH0xBKTsKSckD7iZLSVwGe2yNAwrpM+f/wqD0Bvt8nfYziMiI3M8hfcrALfg
         mr7Q==
X-Forwarded-Encrypted: i=1; AJvYcCV34U7Kdncj5C9x4IcAyLePDh3t1siEh/rvD8DwWY+h2A1QrjWGkMdmUjn5NgDfsAx0XzoIxVpxJwep57Dn@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj8Tu8WoSFGPSs78+WO9SzSUHbapnzKKIeNQVzrmo5O/WBeZAy
	kLYPAgUatY3S2UrEPF6zWKpUew6n5DNstHsG+EXz2TsQHeAFeggpYhjE0cXBKqoHTJAnsp3J6Um
	hh62+t1GOpVwMWtq4vT5g+VYiijNSHK11dLz9GOfdt/VvY1oBlDxtOA+eFog4Wm/qy2eCYpok67
	Z1l99WyuY1xYAKlf+XGNLlWNRXP+YYcthcPY2CG0Lm1Ko=
X-Gm-Gg: ASbGncv3wV5bXIFzwt7ziuQC2gr7NRml0BFDF9sojYXbCI2j1NLG0lvp80dYGdTAwHF
	pfj3w1zF+y0+JMKvsQ7Z00bYXf7hiNiE4BONnCK+TaG2btMWAeOrdrmaVapu21D9M0YAWvKIRq8
	1SYdAcdHXbtdly43YjEvg+nuOwNY67zrhD7I1vlVmBW1tXwchkpTxM
X-Received: by 2002:a05:6808:190d:b0:435:8516:343e with SMTP id 5614622812f47-435ec3cdf92mr4934039b6e.8.1755441836588;
        Sun, 17 Aug 2025 07:43:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUkSCqKu1FMmtaCkSAOjjSEAlkF0asPnqBI3LUqti5JAzUxffF+Jw+/TKYdskWLAqj7nUf2y4Z3UOZBgeOrxo=
X-Received: by 2002:a05:6808:190d:b0:435:8516:343e with SMTP id
 5614622812f47-435ec3cdf92mr4934026b6e.8.1755441836116; Sun, 17 Aug 2025
 07:43:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250720214458.22193-1-mcanal@igalia.com> <b2dcdd42-7547-47f3-a2f6-5de1f8f26f70@igalia.com>
In-Reply-To: <b2dcdd42-7547-47f3-a2f6-5de1f8f26f70@igalia.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sun, 17 Aug 2025 07:43:45 -0700
X-Gm-Features: Ac12FXxBU22nwFLJC3N9GBviLWCGGcAHNd5VHad9_3XTV7uXsMcKTWXJj9I3wSA
Message-ID: <CACSVV01+eB=E60zGnJTgxO0FaYf0XD7EjP+75T3VdGiQCys6Sw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm: Update global fault counter when faulty
 process has already ended
To: =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        kernel-dev@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=MJ9gmNZl c=1 sm=1 tr=0 ts=68a1eaad cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=VwQbUJbxAAAA:8 a=V2sgnzSHAAAA:8 a=M6jbYL6llvOW2sZO-FMA:9 a=QEXdDO2ut3YA:10
 a=rBiNkAWo9uy_4UTK5NWh:22 a=Z31ocT7rh6aUJxSkT1EX:22
X-Proofpoint-ORIG-GUID: xigWh3QePkJ7bf3z7yRPmGmeUvBVa-3i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzMSBTYWx0ZWRfX2ZyImCYZh8hn
 n0G+si2I6RwA3eVNtRd/Wshti5ntv+KiWtEVpwAX1NvIXVzRbpltK5RjgULQnjk0fZ5O5dfSPO1
 t2chdyO+OqjrNSJHmdNjpbT9w6NHRxkxAjYDDa+L92jmDDYLv5Ot1UgD15dEy+gaoVmibAfD7wb
 5ttEEYXbEs0xmHDA+7Fh22wCFd1VIHhjdjayebhpraCP3qhd/NTmgQ8vIn6CNFRNAcZmqt6LdOE
 MnnTjXt0Ww8c3lfRCCgaEG13lSOpmonXgFQzibKZdPCQa6YDgYsBv5NLLphthoqCv6Ibk7jCNAg
 tby1kiIxO5h1mQ+YdHMq/6Nr4MtKeqj2OV29TRnveCjweQxpPUPjJGmGKqKRYmnsgRrr5ewTP6Y
 U1RZwOYE
X-Proofpoint-GUID: xigWh3QePkJ7bf3z7yRPmGmeUvBVa-3i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-17_06,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0
 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160031

The patch is in msm-fixes, but I was out last week so haven't had a
chance to send a PR yet

thx

BR,
-R

On Fri, Aug 15, 2025 at 1:10=E2=80=AFPM Ma=C3=ADra Canal <mcanal@igalia.com=
> wrote:
>
> Hi,
>
> Gentle ping on this patch.
>
> Best Regards,
> - Ma=C3=ADra
>
> On 7/20/25 18:42, Ma=C3=ADra Canal wrote:
> > The global fault counter is no longer used since commit 12578c075f89
> > ("drm/msm/gpu: Skip retired submits in recover worker"). However, it's
> > still needed, as we need to handle cases where a GPU fault occurs after
> > the faulting process has already ended.
> >
> > Hence, increment the global fault counter when the submitting process
> > had already ended. This way, the number of faults returned by
> > MSM_PARAM_FAULTS will stay consistent.
> >
> > While here, s/unusuable/unusable.
> >
> > Fixes: 12578c075f89 ("drm/msm/gpu: Skip retired submits in recover work=
er")
> > Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> > ---
> >
> > v1 -> v2: https://lore.kernel.org/dri-devel/20250714230813.46279-1-mcan=
al@igalia.com/T/
> >
> > * Don't delete the global fault, but instead, increment it when the we =
get
> >       a fault after the faulting process has ended (Rob Clark)
> > * Rewrite the commit message based on the changes.
> >
> >   drivers/gpu/drm/msm/msm_gpu.c | 11 ++++++++---
> >   1 file changed, 8 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gp=
u.c
> > index c317b25a8162..416d47185ef0 100644
> > --- a/drivers/gpu/drm/msm/msm_gpu.c
> > +++ b/drivers/gpu/drm/msm/msm_gpu.c
> > @@ -465,6 +465,7 @@ static void recover_worker(struct kthread_work *wor=
k)
> >       struct msm_gem_submit *submit;
> >       struct msm_ringbuffer *cur_ring =3D gpu->funcs->active_ring(gpu);
> >       char *comm =3D NULL, *cmd =3D NULL;
> > +     struct task_struct *task;
> >       int i;
> >
> >       mutex_lock(&gpu->lock);
> > @@ -482,16 +483,20 @@ static void recover_worker(struct kthread_work *w=
ork)
> >
> >       /* Increment the fault counts */
> >       submit->queue->faults++;
> > -     if (submit->vm) {
> > +
> > +     task =3D get_pid_task(submit->pid, PIDTYPE_PID);
> > +     if (!task)
> > +             gpu->global_faults++;
> > +     else {
> >               struct msm_gem_vm *vm =3D to_msm_vm(submit->vm);
> >
> >               vm->faults++;
> >
> >               /*
> >                * If userspace has opted-in to VM_BIND (and therefore us=
erspace
> > -              * management of the VM), faults mark the VM as unusuable=
.  This
> > +              * management of the VM), faults mark the VM as unusable.=
 This
> >                * matches vulkan expectations (vulkan is the main target=
 for
> > -              * VM_BIND)
> > +              * VM_BIND).
> >                */
> >               if (!vm->managed)
> >                       msm_gem_vm_unusable(submit->vm);
>

