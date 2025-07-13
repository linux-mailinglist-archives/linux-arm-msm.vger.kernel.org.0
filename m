Return-Path: <linux-arm-msm+bounces-64719-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF1EB03118
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Jul 2025 15:17:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 540053BC717
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Jul 2025 13:16:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 815DBB660;
	Sun, 13 Jul 2025 13:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ULnlX0DF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C447E33E1
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Jul 2025 13:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752412636; cv=none; b=pueqZ0m+JjCxSqSVCMrdcDOETLD2S/Vge5ro+LxhdpRovWDuE78GfH/BELSeUB54EqIRWKkcaBEKxUljUVBB7+BpnaM/yTTtxfAwjGpuHFsLO4x+FF+SG7BUH/NJwlhk1zxfawtacZe4EeUvp7ef/dL7J0TTrCkx5Ac477Nnlrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752412636; c=relaxed/simple;
	bh=bQRf+gZrYzxxj6RxPTQT/0OmyL+eq9kkMld0hhhnwXY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sWZ4u50KvYsX+fcEPDuHmlmrOgt7Rg1fC8rls9XFwq2968HeBxmV71t3AqdhlKCTkkksWffkCq5VsBbWxo9h1B29qbTT8h5xtZu0UbzhMME0ausY/PmOMPh5vuYZHwAl4Kzw3AM3/OTWDCllQDsdf1S8WjF5YNFOrJJOqXdwQg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ULnlX0DF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56D6dCeD009324
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Jul 2025 13:17:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=bTUx+VZ4YLVbV9D1AWkOK6pRuT0f7GMSlVwY3D452HQ=; b=UL
	nlX0DF5b+61nX7zTfN7F5d7ks+Plznjmaf/qz74NyHN2wQ5nyRAShZ9pAlPxsjQ6
	fbiHuCTENTFtvOZE05onoO1ePrwO7965IAKw6FFPIwlA337NwfZJG1/IFuX2w6t5
	+ONrzCTcK3rQ8S7jadlmYot6db5h3UpdXPjTYErRUF6Z+jHJY4DWhPhUupuXBl5X
	qBVCSewMyPU2IHCgM2ylBfK2XERhWJLGDEE7z9srf+gIubKagQ5bTMVUqMo9J8mB
	LoR95awqTj6LgyHJiZfujgYRoAXCihgStegcXdpO5u1CzCCWzj0ymJpw4PFXjpGg
	bCwZUeMxePFY3bHrQV/A==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47uftma4pg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Jul 2025 13:16:42 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-40b4c0b616fso3471698b6e.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Jul 2025 06:16:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752412602; x=1753017402;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bTUx+VZ4YLVbV9D1AWkOK6pRuT0f7GMSlVwY3D452HQ=;
        b=Xl8wzoM7vDB4IEzLeuye68CClJqku8TI+jS9k/7ISblYTmUy9fzpboDWpw3OqjcTGw
         0ErOeKPU329bikIdmVkV9gYjukyxQkH0vA4O/ai0kY+rUiTQLOhHDOXWCuN7d0wWac95
         jZsQhfwGkZmZBjx9cp68H8JDaeQRF3x94GbVyStnt+gqooCSKRRqQdhWZUd+esUODO58
         rIiHy+NzdmThrDui7PANU7j/cqoIl1x8G9O8nrGFRFxFLbMM3GRKKOG+AI8RMB6qR3PJ
         OuS0CiPKVCFDjcJtVS0fBlt7rpzz7ysEXVjspfVhBbwetMh7amjBiICUKUzNiscxr6tO
         tPbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTuqYcJzc4eYRMMIbnpyLOm25kRm6ntS0kL0AnNNNfzyPhpLwNAfnwpkQ7mQ6hbilmzkXpr6dQha7pb+UG@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2jHBLL6Dln2fNA/xPLSkIGXd3ESZvGzJtNFUWpxvh+QWDEGoz
	YEJP5S5tPDrZgN8+kPDlSVLz1GBTcZ0guSPMUu0ydsHGVmQ+gCH3DDsoCKXx4hiz9NpPCrdH/Ir
	AUhuy1obS6wzmTBbIMX1mh4q37hafDGuPsZaUMV4cSrlF0iZCCXyi3MO1li8gPUKEt3xbnS0e4Z
	7BUvTQ/ZgxfhGBugVi6OhYs6fHjkVtfbv2Pvll4PPY+EQ=
X-Gm-Gg: ASbGncvQ65kl7mtsAt4fKvKVIOBMf6HqiP1HZcbVvGOvQVT0Zxhx0REJ863j/Vkixp8
	PFobG/ICymZDlP38DCQ+r9zKc9eCRAOpRGOTDqilL8W3sC9IK9tEVUmVh6cQDG2K14lx71QPBed
	X6DtxooRVonHIuO2PxzPIS+Y1BsixOW7BCadho8yuFkkEyFNnYdix+
X-Received: by 2002:a05:6808:23cd:b0:404:dbf3:5b0d with SMTP id 5614622812f47-4151d5914e7mr6575397b6e.3.1752412601966;
        Sun, 13 Jul 2025 06:16:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1VaQK9wqnz+FxTANYpJ62FB5qEMASGOmEnkAQmxm/t7Rjz3H1kfZoKlFbnHST+MqaPlzvrU9rnDXUzvdkudo=
X-Received: by 2002:a05:6808:23cd:b0:404:dbf3:5b0d with SMTP id
 5614622812f47-4151d5914e7mr6575381b6e.3.1752412601552; Sun, 13 Jul 2025
 06:16:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250711191014.12a64210@canb.auug.org.au> <e744987a-2fed-4780-a9c6-fd1175698da8@infradead.org>
In-Reply-To: <e744987a-2fed-4780-a9c6-fd1175698da8@infradead.org>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sun, 13 Jul 2025 06:16:30 -0700
X-Gm-Features: Ac12FXzFPCGagOTtBoMZgRaN1L0GwHmRIThJgFjwywyiNvm8JhFCpXjsqSe1SlY
Message-ID: <CACSVV011qEHt5Srx4QdP5=L9WqxTg9yjY63rTUGwbXawq899gQ@mail.gmail.com>
Subject: Re: linux-next: Tree for Jul 11 (drivers/gpu/drm/msm/msm_gem.c)
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux DRI Development <dri-devel@lists.freedesktop.org>,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=AI4FyeZ1 c=1 sm=1 tr=0 ts=6873b1ba cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JfrnYn6hAAAA:8 a=PbJyB38NimUM2AyV3J8A:9
 a=QEXdDO2ut3YA:10 a=efpaJB4zofY2dbm2aIRb:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: UPFFDr15rl2l7lp4G59yDon0G6ov4oMd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEzMDA5MiBTYWx0ZWRfX9sg9XJcMOmPN
 msgFb/p1/0y1S27JHb43bFRKPQfTgFvagazI47U6xx809g6kxq0aPGnAx9nzUens2lqCuPf8WY+
 61sBle+C/kG5bRQTk/BM8yBEeTcIpv62HBZtRXp0YNGUKq2FcSMuspc0beD8D9rGpca77z7Dfbj
 LvIr1opcdvfaAKWRpNl7/ZgcdelBgL6URLEIhSbookP+TgXU9Wq1EfmlEeVMJ+peTlGKr+dRpUM
 5P0dltniNsvq+5boTNqLResI3q+XT5FrDXWP0rnrLCsolpMfE0v79geFt4gy1SQVp3MiH45//5M
 L/BW0UJtmwcFvnMbWnFqX7s7twFoffdDyE9505ZvKrWHLydYR83yPY3xVtMp64=
X-Proofpoint-GUID: UPFFDr15rl2l7lp4G59yDon0G6ov4oMd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-13_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 phishscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0 classifier=spam
 authscore=0 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507130092

On Sat, Jul 12, 2025 at 11:49=E2=80=AFPM Randy Dunlap <rdunlap@infradead.or=
g> wrote:
>
>
>
> On 7/11/25 2:10 AM, Stephen Rothwell wrote:
> > Hi all,
> >
> > Changes since 20250710:
>
> on i386, when:
>
> CONFIG_DRM_MSM=3Dy
> CONFIG_DRM_MSM_GPU_STATE=3Dy
> CONFIG_DRM_MSM_GPU_SUDO=3Dy
> # CONFIG_DRM_MSM_VALIDATE_XML is not set
> # CONFIG_DRM_MSM_MDP4 is not set
> # CONFIG_DRM_MSM_MDP5 is not set
> # CONFIG_DRM_MSM_DPU is not set
>
> so DRM_MSM_KMS is also not set:
>
> ../drivers/gpu/drm/msm/msm_gem.c: In function =E2=80=98msm_gem_vma_put=E2=
=80=99:
> ../drivers/gpu/drm/msm/msm_gem.c:106:54: error: invalid use of undefined =
type =E2=80=98struct msm_kms=E2=80=99
>   106 |         msm_gem_lock_vm_and_obj(&exec, obj, priv->kms->vm);
>       |                                                      ^~
> ../drivers/gpu/drm/msm/msm_gem.c:107:39: error: invalid use of undefined =
type =E2=80=98struct msm_kms=E2=80=99
>   107 |         put_iova_spaces(obj, priv->kms->vm, true, "vma_put");
>       |                                       ^~
> ../drivers/gpu/drm/msm/msm_gem.c: In function =E2=80=98is_kms_vm=E2=80=99=
:
> ../drivers/gpu/drm/msm/msm_gem.c:668:39: error: invalid use of undefined =
type =E2=80=98struct msm_kms=E2=80=99
>   668 |         return priv->kms && (priv->kms->vm =3D=3D vm);
>       |                                       ^~
>
> --
> ~Randy
>

fixed by https://lore.kernel.org/all/20250709140838.144599-1-robin.clark@os=
s.qualcomm.com/

BR,
-R

