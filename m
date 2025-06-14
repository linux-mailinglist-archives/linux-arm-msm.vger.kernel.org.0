Return-Path: <linux-arm-msm+bounces-61282-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 43DB1AD990D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Jun 2025 02:31:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 62FFB17A580
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Jun 2025 00:31:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F898B640;
	Sat, 14 Jun 2025 00:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jIK8kLZm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764C41C32
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Jun 2025 00:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749861094; cv=none; b=CRjWKQZkQFq0XF6cnYs34rYrwOMNa3dh6mi1q27xFJhhWTtZxhKGd3BsxXljagSHpnswSipTGmaQzZ/KYCQv85L0y9SXg/Rvk3Uis4h+dKWBUbIbvWBoUridsz2sSu7EeHmKxQGFaFkFSANvm48gASDbnDojxtG4PCsOuW3cgOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749861094; c=relaxed/simple;
	bh=EgzweVqUmBboW+BvG/ttoKIcIwpWIzCVl8YEXqI8ohk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jzrBJ+TxpV+K/YG+SuQmDPgpL4K6GmeRZfmw71NgKcohcG7zLtg4JAUmxu09GYgRO1Rfdzt2bx+h+jaVcSK7Zz+i4wDzL9iQDZYRV6dobr3vGMij0z0LKX+e/yc+g+1Fh7Nv8sKdXXxiqrDSrc8gDooNH6QiCoqP2edmpYYWfCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jIK8kLZm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55E0QGKn012592
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Jun 2025 00:31:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=wSPCFDRXGi7WkL+9QNyzhOvPsUrsKkwicVeYLWyQRS4=; b=jI
	K8kLZmoS1HjK6JMTHbvIzRnBGIiydYyEISyBwMp8/H0fgi2oNR0UXk7KgJqskfxi
	jl6oozU16owaAVnszFVJgjF1/bJPTCCdvm83sIHk4wS+xkUpy8aJV9BOcpV72Ypi
	7yM0zV36Le/h9iaLQ20cOZEGPItuJALtkue6six+t2bCtVNbpZsDKGzjai05V0JY
	WsDVkRy4ejqmKGaZNlDB6cjbgFyFF8jNUnuSUMJGEgo2p1TMZMpN5Fi/WxYSJPx7
	ZH//s9b7oOANi/NeMjL/9fy7+/qHc3VMViAUvk2V1B+Y5E/nF/mck1nv6gAK/emD
	q+Fhzx/2K2osPRLDBtGg==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47753c0j32-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Jun 2025 00:31:31 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-2e95bf2f61dso2062109fac.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 17:31:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749861090; x=1750465890;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wSPCFDRXGi7WkL+9QNyzhOvPsUrsKkwicVeYLWyQRS4=;
        b=sZUU4sIrWWbORg5/W4bSBbqSL/TA1C4tZbeYmJI5C9N+98yEdMhU1s524Iqq3ov/XY
         OrQ0yYySrBrbYSuNf2SSMz1jN1RXcrZftvTvwPPNAw1dbASFNxrkI5xqn4OU+t0xp1Px
         NurcBeIvztA0ZaA7GklduTJh+YbZsr8gX6iLJjmUly5ZGjrqBSmf/1YH408EAKfESMxZ
         RKc1eUJWWneWPNNFxeDYUdx6UUYPhofcQRYa8Wt7cINRPLrnOYvZek6KUrizCRYrGKkl
         pi33Adaa7UcreAlEs4tiMD3npdA/VxepVJNfdoQC5YNj0TNT7iNz9YOg/ZOjWUBBvYT2
         +UUQ==
X-Gm-Message-State: AOJu0Yz4Tc8TBfxZAwNcr4AY/YiNOeV/FgylMH/QTe+3QlbFYQV+OiXK
	u6ijChukYdNNy7SCuaq5KAZqValZBnY9KV+2NHe8Nt6ndJaIA/7d79877EA7dhq6CgiAAcYB5Dc
	w5OJuu9qLxW15MMKrKD+iE/wN7SpiyIzwT6fSVf8sPQ8wqS6v0aeJp8vwabxvJ9qVjcpj6AVq7+
	PcTlzG9GbC9cfUjvxcsbLl4coTbgHuYzX8RwXzsCQiSec=
X-Gm-Gg: ASbGncsUZuzsPosbbjfAqhFtnFl/jiGbT7d8Ezg+YF8/qrmY1DgkRedo8OfJWhfWPmW
	T402kK+kxoJ40nTh3iPU/1HzKp3DrkDospaJn1W7gXD5YyCWLJzFWTKW1+PG3uvQI2zZqfJew9H
	B3KFd1tf/95pzTSstFjLF0f7zX+LtxnSF3qsM=
X-Received: by 2002:a05:6870:92c5:b0:2d5:714b:f07c with SMTP id 586e51a60fabf-2eae9e4ecbamr1600037fac.5.1749861090203;
        Fri, 13 Jun 2025 17:31:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2JEE77EPR4nk6/GCDG9k6zae0f76B624nV6HrnnzykOxwoIanLdN9IYY+qVAEv8oxGyaZHOiD9vg3kef6+cE=
X-Received: by 2002:a05:6870:92c5:b0:2d5:714b:f07c with SMTP id
 586e51a60fabf-2eae9e4ecbamr1600022fac.5.1749861089833; Fri, 13 Jun 2025
 17:31:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250613235705.28006-1-robin.clark@oss.qualcomm.com> <20250613235705.28006-3-robin.clark@oss.qualcomm.com>
In-Reply-To: <20250613235705.28006-3-robin.clark@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Fri, 13 Jun 2025 17:31:19 -0700
X-Gm-Features: AX0GCFsMhrKxQL7KPbaS1-LL1p1Y8oLS4b_xGL0P7j_IA9nNoDuuXTK953qW86M
Message-ID: <CACSVV01seVcTwquu3gjEN=edJZG6UiV5WjokE3WL6QBxJbAUcA@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/gpuvm: Add locking helpers
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Danilo Krummrich <dakr@redhat.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE0MDAwMiBTYWx0ZWRfX6g9yunnKulO/
 fLaTN1Dk+kZ2UAwTeIzjZqylaiKe2s99KACQxf3W3Eb9A+NIEVjS+ARLm7WIC1+JvRHe3ALtpAI
 0dX1pSFTh/N7gf1n6UqweWH5AfBSX16KncNOIkg/045uozTj/I4y0SbzhlF8syj9aq2ITWh2A8s
 fv/7nv52hrcsQIz94K+SshEGMn/gmPVV1nuYIVxVkn8bC2gldxeN97bpMY+8dnGfVM4fe3dBKE3
 E6qHpXWBsw6q13icWEj7RU0hhamXNGEFkRfQ+h+B/z8dh864svWumBfVAxA4g8E/sCHZPliRCyc
 RWwebEVQtrZXatxM4Hkn7aN77bWApHTlgCOiXfKd1g047f4y/mGSCH0UqcPayXDriprEAGilRVQ
 uwgMruK1jvjVfzxUUX99PQuhVqFpaOxuu7MQcJtfOFOYWkdO6lkCHyOcqmrC3CPtNQhPd9K4
X-Proofpoint-GUID: i7Mzw4oeahvajQQWeqXYG_417W3mscXt
X-Proofpoint-ORIG-GUID: i7Mzw4oeahvajQQWeqXYG_417W3mscXt
X-Authority-Analysis: v=2.4 cv=SqOQ6OO0 c=1 sm=1 tr=0 ts=684cc2e3 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=vTrAOcUJOkl49bEEHfkA:9 a=QEXdDO2ut3YA:10
 a=y8BKWJGFn5sdPF1Y92-H:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_04,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0 impostorscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506140002

On Fri, Jun 13, 2025 at 4:57=E2=80=AFPM Rob Clark <robin.clark@oss.qualcomm=
.com> wrote:
>
> For UNMAP/REMAP steps we could be needing to lock objects that are not
> explicitly listed in the VM_BIND ioctl in order to tear-down unmapped
> VAs.  These helpers handle locking/preparing the needed objects.
>
> Note that these functions do not strictly require the VM changes to be
> applied before the next drm_gpuvm_sm_map_lock()/_unmap_lock() call.  In
> the case that VM changes from an earlier drm_gpuvm_sm_map()/_unmap()
> call result in a differing sequence of steps when the VM changes are
> actually applied, it will be the same set of GEM objects involved, so
> the locking is still correct.
>
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>

And if it wasn't clear/obvious, the expected usage is something that
looks like: https://gitlab.freedesktop.org/robclark/msm/-/blob/sparse-newer=
/drivers/gpu/drm/msm/msm_gem_vma.c?ref_type=3Dheads#L1150

ie. the caller handles the drm_exec_until_all_locked bit


BR,
-R

> ---
>  drivers/gpu/drm/drm_gpuvm.c | 81 +++++++++++++++++++++++++++++++++++++
>  include/drm/drm_gpuvm.h     |  8 ++++
>  2 files changed, 89 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> index 0ca717130541..197066dd390b 100644
> --- a/drivers/gpu/drm/drm_gpuvm.c
> +++ b/drivers/gpu/drm/drm_gpuvm.c
> @@ -2390,6 +2390,87 @@ drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm, void *=
priv,
>  }
>  EXPORT_SYMBOL_GPL(drm_gpuvm_sm_unmap);
>
> +static int
> +drm_gpuva_sm_step_lock(struct drm_gpuva_op *op, void *priv)
> +{
> +       struct drm_exec *exec =3D priv;
> +
> +       switch (op->op) {
> +       case DRM_GPUVA_OP_REMAP:
> +               if (op->remap.unmap->va->gem.obj)
> +                       return drm_exec_lock_obj(exec, op->remap.unmap->v=
a->gem.obj);
> +               return 0;
> +       case DRM_GPUVA_OP_UNMAP:
> +               if (op->unmap.va->gem.obj)
> +                       return drm_exec_lock_obj(exec, op->unmap.va->gem.=
obj);
> +               return 0;
> +       default:
> +               return 0;
> +       }
> +}
> +
> +static const struct drm_gpuvm_ops lock_ops =3D {
> +       .sm_step_map =3D drm_gpuva_sm_step_lock,
> +       .sm_step_remap =3D drm_gpuva_sm_step_lock,
> +       .sm_step_unmap =3D drm_gpuva_sm_step_lock,
> +};
> +
> +/**
> + * drm_gpuvm_sm_map_lock() - locks the objects touched by a drm_gpuvm_sm=
_map()
> + * @gpuvm: the &drm_gpuvm representing the GPU VA space
> + * @exec: the &drm_exec locking context
> + * @num_fences: for newly mapped objects, the # of fences to reserve
> + * @req_addr: the start address of the range to unmap
> + * @req_range: the range of the mappings to unmap
> + * @req_obj: the &drm_gem_object to map
> + * @req_offset: the offset within the &drm_gem_object
> + *
> + * This function locks (drm_exec_lock_obj()) objects that will be unmapp=
ed/
> + * remapped, and locks+prepares (drm_exec_prepare_object()) objects that
> + * will be newly mapped.
> + *
> + * Returns: 0 on success or a negative error code
> + */
> +int
> +drm_gpuvm_sm_map_lock(struct drm_gpuvm *gpuvm,
> +                     struct drm_exec *exec, unsigned int num_fences,
> +                     u64 req_addr, u64 req_range,
> +                     struct drm_gem_object *req_obj, u64 req_offset)
> +{
> +       if (req_obj) {
> +               int ret =3D drm_exec_prepare_obj(exec, req_obj, num_fence=
s);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       return __drm_gpuvm_sm_map(gpuvm, &lock_ops, exec,
> +                                 req_addr, req_range,
> +                                 req_obj, req_offset);
> +
> +}
> +EXPORT_SYMBOL_GPL(drm_gpuvm_sm_map_lock);
> +
> +/**
> + * drm_gpuvm_sm_unmap_lock() - locks the objects touched by drm_gpuvm_sm=
_unmap()
> + * @gpuvm: the &drm_gpuvm representing the GPU VA space
> + * @exec: the &drm_exec locking context
> + * @req_addr: the start address of the range to unmap
> + * @req_range: the range of the mappings to unmap
> + *
> + * This function locks (drm_exec_lock_obj()) objects that will be unmapp=
ed/
> + * remapped by drm_gpuvm_sm_unmap().
> + *
> + * Returns: 0 on success or a negative error code
> + */
> +int
> +drm_gpuvm_sm_unmap_lock(struct drm_gpuvm *gpuvm, struct drm_exec *exec,
> +                       u64 req_addr, u64 req_range)
> +{
> +       return __drm_gpuvm_sm_unmap(gpuvm, &lock_ops, exec,
> +                                   req_addr, req_range);
> +}
> +EXPORT_SYMBOL_GPL(drm_gpuvm_sm_unmap_lock);
> +
>  static struct drm_gpuva_op *
>  gpuva_op_alloc(struct drm_gpuvm *gpuvm)
>  {
> diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
> index 0ef837a331d6..a769dccfb3ae 100644
> --- a/include/drm/drm_gpuvm.h
> +++ b/include/drm/drm_gpuvm.h
> @@ -1211,6 +1211,14 @@ int drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm, void=
 *priv,
>  int drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm, void *priv,
>                        u64 req_addr, u64 req_range);
>
> +int drm_gpuvm_sm_map_lock(struct drm_gpuvm *gpuvm,
> +                         struct drm_exec *exec, unsigned int num_fences,
> +                         u64 req_addr, u64 req_range,
> +                         struct drm_gem_object *obj, u64 offset);
> +
> +int drm_gpuvm_sm_unmap_lock(struct drm_gpuvm *gpuvm, struct drm_exec *ex=
ec,
> +                           u64 req_addr, u64 req_range);
> +
>  void drm_gpuva_map(struct drm_gpuvm *gpuvm,
>                    struct drm_gpuva *va,
>                    struct drm_gpuva_op_map *op);
> --
> 2.49.0
>

