Return-Path: <linux-arm-msm+bounces-64895-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF74B04CFF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 02:34:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 449CD3B2DB4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 00:32:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09A591DFF0;
	Tue, 15 Jul 2025 00:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QgUwGKpF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A75156F5E
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 00:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752539501; cv=none; b=BPQLDqRwjD9pLRuzMswPHDM83/9F7S/lBMYQ2YGS3JYSDvfXyrB03o1qF1Ma5QRWzWuC7HQ7HvFoCXoxE0LfaUA7eZWUfis/clGJgCM8Ri5/VQ+R8UXXBLopcpTSSb0mrE0muoHnr/4uJW4ss6rdtOBLi/6iVhuVNnOvOxxd03c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752539501; c=relaxed/simple;
	bh=9/TsGKT1IXLxbvzNiG5O5+4dsI1PzU9V68WuEAXh/OI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=afFED6eK+hV9fj+A7wt10tRT/h4WUj8Na2H5KwHc/tyG8ADHd/njJmxqQ1MElHsxxM/ldnm44txMnR8y7Iy4w13SAVqSGm5uILM4ZFyaCTaZWd0JRzxTnLD7KfOK5M6ugIAnZChO0M/qhGJ1zyVH3/5+QEL6FqxS67ZPvP6XC8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QgUwGKpF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56EIL5ac028415
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 00:31:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=rnWWSbqyVPN78Z8y5QMVj8G1tTsX+qJi/k8zbVH/95E=; b=Qg
	UwGKpFM6pGFgwuXYzYWR7HqPmzzi3rx7A5CthiwYTuMJlJiV4LrbHOfooHRQScl2
	8JxBTgYse/tvM0f066IhNrPMr15v4Hj5sPdDbK+5mUxfqRCbG2S4YZcGuYkMHlGY
	Zng4NOYL/3sJfff6e1A5MWwaDmN3ELtXm125lUJlq9y5FdydcBcoQkXl+PEagNCn
	7L4uwjIIa+ytk70peZfbo6P3BlPe4vTA8sqxPrW61ooNo00IG91odp1MLv7Cletf
	mtKghUn1yo5Ib9flW+5PrCuZzZsZeOXwJBK7Hq/x2a6sbS8YwFiUx4NpXQM/JzuU
	318dLvQqsyLKVnbTowSw==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufut66qj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 00:31:38 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-40b4c0b616fso4556201b6e.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 17:31:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752539498; x=1753144298;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rnWWSbqyVPN78Z8y5QMVj8G1tTsX+qJi/k8zbVH/95E=;
        b=vASvI8Up3Da8zBVLVFFPMDQNBR9JAdtuE6Ka9TXu6bv6Uh/8N37ZiCnkKO5LRt7dLK
         SM/11MCW3j57ObzySHoCs82ce1U+P0pmxWPQx+WRTDbkO6GwYGbe7t2kNr1Ph3RY9CXn
         uiZjTbYiKtcq+LSavbjS3q92w0oR8sKj6+lcsTLCNKqvOuQSS5tejLhuvMPaJSUtmHbB
         Sqcn6Barj/TuGtlxaU104StHnPVRAkAG299pTCU4+AGrbNzlYWIw8+vXRNt17u3buIPF
         DiZcysZ2KJKuk74WZfua6z3wF2l5zW+n/URfN07tkZcfQucleMnEb0s2ClPDhQR75Pj0
         gcUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzjP/shFk4IwALIvyMOMXhDudiP4V2/lE19IWkEQvEL0FbFf2kC/RcycpaVtqAHCx3LFnVvXPLKxfQjzuH@vger.kernel.org
X-Gm-Message-State: AOJu0YwIrsiSQGJzo56aNjkGyfZFujtYcf/1uud+yiTQBxMg316hNv1z
	HL7XXz87r4M3rh0oROIqDUZciC9J1jmKuNZQGSttUUjo3vAknMe05S3i6/SLUncHnp+rdgS2PO9
	A6A4JQ3GDBiKPC0/6RUblYt9XZRRBAj4ncyU7zUArYo3KDXagJpthr1cIlC+pC+mujkjiQ726VD
	lWOLBNWAKSBCvgcrOnRhcxZ7YqKUrw4dO+JZ1ydiB+xGw=
X-Gm-Gg: ASbGncukK7weZZNHva8YGRUCr3IDrcd2bdKXLNpUoLoGw4pa2ITzHb3teO6KYdx1Cj6
	fPVM2EaRO8q7h3JG5GXnTb0PmTp9yQQRoANO38aGwi4VMsibz4PrkDYBCmNpI1PJfCZArSSmFZl
	4alurAV/VxV3aJ0cj4nqYHqk/LFyXTDm8fVvUR+BPLpqpjTU19Dh9+
X-Received: by 2002:a05:6808:1b20:b0:41b:2876:a93b with SMTP id 5614622812f47-41b7a364efcmr1243727b6e.6.1752539497902;
        Mon, 14 Jul 2025 17:31:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVe0q7vgkIseEjo0dk13NCUfajh6E6wM7UZk0jmXnLOcEYFwaSqyd5OwR2la8d/TxAac8+t4HrvknpzfBER2Q=
X-Received: by 2002:a05:6808:1b20:b0:41b:2876:a93b with SMTP id
 5614622812f47-41b7a364efcmr1243707b6e.6.1752539497369; Mon, 14 Jul 2025
 17:31:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250714230813.46279-1-mcanal@igalia.com>
In-Reply-To: <20250714230813.46279-1-mcanal@igalia.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 14 Jul 2025 17:31:26 -0700
X-Gm-Features: Ac12FXyhqSGe2MJwwTijBSGs8N0ketRONbFjQxi_2j2xnDRBqZcf9njzSpvOAUE
Message-ID: <CACSVV02kLAg9t31HNCy5zL3xAJ3j2MRp9zn1P1FiVE0tz5SMyQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Remove unused global fault counter
To: =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        kernel-dev@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=e7gGSbp/ c=1 sm=1 tr=0 ts=6875a16a cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=V2sgnzSHAAAA:8 a=m9oiR8dIFG-smg8RVMEA:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22 a=Z31ocT7rh6aUJxSkT1EX:22
X-Proofpoint-GUID: NRqnkAhpyED1M_d07PjtBL53zAH79ZZ-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDAwMyBTYWx0ZWRfX/hgbkFxp2fg1
 uM4bcr8jeIJ2H9zEsk/Dujv/QraQiOMsbK+56fIM85gpjOrOGW3eyVcqJrs7WcT+277hdMI8k3N
 IAeaMQOGEXwIkU2AwY9K4jEExiYkre8YC49IApImjG6afNqb063OMSANFPdoMqxVxCeykrapT2M
 5knc1gPIuC/LGHvL/WBvBnxQGOaRrV3Cfw7l5B+GdskbypMHpak4AKtuCRiJ1Rfw4TTa9TdBhyi
 gmZGZbbtV1R7lEe5T9s7LgxiLWkzcJe6ZCq69zgkbal1bk+YvhPQm11hlL4yovnWaZQpG7+XZBA
 GaslT9OI5CCxYmZtoVzLgAJ4EnOP+PbMpDOYNhWi/n8xQESjjjlfSsREFEy84JzJhl7OczT4KpH
 kNO1f2TEsbI4Cr4PhfPJvF8X7nX6Hrz1pc2BiioQO0hXG1sh1wIm11yZv33XnFyh0UwU1+3B
X-Proofpoint-ORIG-GUID: NRqnkAhpyED1M_d07PjtBL53zAH79ZZ-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_03,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0 suspectscore=0
 phishscore=0 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0
 malwarescore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507150003

On Mon, Jul 14, 2025 at 4:08=E2=80=AFPM Ma=C3=ADra Canal <mcanal@igalia.com=
> wrote:
>
> The global fault counter is no longer used since commit 12578c075f89
> ("drm/msm/gpu: Skip retired submits in recover worker"). Additionally,
> with commit eab7766c79fd ("drm/msm: Remove vram carveout support"), all
> supported devices now have a defined virtual memory address space, which
> eliminates the need for a global fault counter.

Hmm, I think commit 12578c075f89 ("drm/msm/gpu: Skip retired submits
in recover worker") was wrong, now that you point it out.  We could
still have situations where we get a fault after the faulting process
has ended.  In that case get_pid_task() would return NULL.

BR,
-R

>
> Hence, remove the global faults counter. While here, s/unusuable/unusable=
.
>
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c |  5 +----
>  drivers/gpu/drm/msm/msm_gpu.c           | 23 +++++++++++------------
>  drivers/gpu/drm/msm/msm_gpu.h           |  6 ------
>  3 files changed, 12 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/ms=
m/adreno/adreno_gpu.c
> index f1230465bf0d..5bb00b9c998a 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -416,10 +416,7 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm=
_context *ctx,
>                 *value =3D 0;
>                 return 0;
>         case MSM_PARAM_FAULTS:
> -               if (vm)
> -                       *value =3D gpu->global_faults + to_msm_vm(vm)->fa=
ults;
> -               else
> -                       *value =3D gpu->global_faults;
> +               *value =3D vm ? to_msm_vm(vm)->faults : 0;
>                 return 0;
>         case MSM_PARAM_SUSPENDS:
>                 *value =3D gpu->suspend_count;
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.=
c
> index c317b25a8162..3d5a76d2901c 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -463,6 +463,7 @@ static void recover_worker(struct kthread_work *work)
>         struct drm_device *dev =3D gpu->dev;
>         struct msm_drm_private *priv =3D dev->dev_private;
>         struct msm_gem_submit *submit;
> +       struct msm_gem_vm *vm;
>         struct msm_ringbuffer *cur_ring =3D gpu->funcs->active_ring(gpu);
>         char *comm =3D NULL, *cmd =3D NULL;
>         int i;
> @@ -482,20 +483,18 @@ static void recover_worker(struct kthread_work *wor=
k)
>
>         /* Increment the fault counts */
>         submit->queue->faults++;
> -       if (submit->vm) {
> -               struct msm_gem_vm *vm =3D to_msm_vm(submit->vm);
>
> -               vm->faults++;
> +       vm =3D to_msm_vm(submit->vm);
> +       vm->faults++;
>
> -               /*
> -                * If userspace has opted-in to VM_BIND (and therefore us=
erspace
> -                * management of the VM), faults mark the VM as unusuable=
.  This
> -                * matches vulkan expectations (vulkan is the main target=
 for
> -                * VM_BIND)
> -                */
> -               if (!vm->managed)
> -                       msm_gem_vm_unusable(submit->vm);
> -       }
> +       /*
> +        * If userspace has opted-in to VM_BIND (and therefore userspace
> +        * management of the VM), faults mark the VM as unusable. This
> +        * matches vulkan expectations (vulkan is the main target for
> +        * VM_BIND)
> +        */
> +       if (!vm->managed)
> +               msm_gem_vm_unusable(submit->vm);
>
>         get_comm_cmdline(submit, &comm, &cmd);
>
> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.=
h
> index b2a96544f92a..88d8ddef616b 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.h
> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> @@ -226,12 +226,6 @@ struct msm_gpu {
>         /* does gpu need hw_init? */
>         bool needs_hw_init;
>
> -       /**
> -        * global_faults: number of GPU hangs not attributed to a particu=
lar
> -        * address space
> -        */
> -       int global_faults;
> -
>         void __iomem *mmio;
>         int irq;
>
> --
> 2.50.0
>

