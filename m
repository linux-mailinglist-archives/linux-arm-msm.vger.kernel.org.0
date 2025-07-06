Return-Path: <linux-arm-msm+bounces-63851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DD7AFA523
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Jul 2025 15:11:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 003AE189E4F2
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Jul 2025 13:11:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B2402135CE;
	Sun,  6 Jul 2025 13:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bVjZpZuQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38701DF256
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Jul 2025 13:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751807478; cv=none; b=ZvHCO2sWXejHxwN5fzu5VeYeGmHAtPxIpLzgXwPYGHTKzMRUfKSrvaiy32N9SPr0CZhc5aJaJzu3f4gJhvg3BMvXP7kvlK6EBDAuErSwP6WX6mzCcWhLi3jpLiA9mUiuN41dz0DX22TUIuLnOYktNYtjGRPOow08pEdIGhxuGsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751807478; c=relaxed/simple;
	bh=5zXFd/csToypAcdWn5CHPzqGgBYRVWZgKbZ4gfK6s0I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PHF44UkXuFvXAxwrdu6hBMespSOrJygcICJ3bXULlTbxXLUHvmGrNRhnMpbh8++7yVcQrh5ooWwCt3XILYz0yODvtNDIcBUQjxUZ2jLO1LHZmZxwSoWbb/corTtTopoyFvvLQJxH2f2z8BEtGACvNYrZwJI+7sT5jxrGinJnCe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bVjZpZuQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5669pt9R016216
	for <linux-arm-msm@vger.kernel.org>; Sun, 6 Jul 2025 13:11:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=ZGc9wQI6xJh0r5CdmnW1ANLHqlkeoIZrV2AuPt1aH0U=; b=bV
	jZpZuQ3RIYyAoKLa6Lh8OUzNMeAPpsKgTXDJ2SQH8f3UpKNlOBT7LO2cGYK8V7Rl
	oUiDPISlePREROz+zb8TjNx0t3W2yKLYtOU78N0gfe7ysJMVhg5AquiLgARB2niY
	8MZlFZIqPlOcSs8MRclKGZBaGQU6lucSNGW+jNJ9B3EmVMABQs19jaDhR2XnHVTw
	cSO02QdgdXaxZxcOc4ZmMYi0QIZvZjpYvzQSEwjc4DyGzG280FkfLWluSspioybs
	s5b0Jw8prtwSNRWsySIQKiPJC1lIbre86lKj7oc7UzrGvqGwehOOQEHXNJKTIbNt
	PQkdGf1k6Nl+83G2/xhQ==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47psdqcmjj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 06 Jul 2025 13:11:15 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-735a4cb0a05so2795783a34.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Jul 2025 06:11:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751807474; x=1752412274;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZGc9wQI6xJh0r5CdmnW1ANLHqlkeoIZrV2AuPt1aH0U=;
        b=CFCMLGm7sr1sPM27exAofu6ewjoXyIqGjxc/fqV7knV6xQDGDVY1VUuSaM7mw8IBQp
         BocwnJrHtaos6NJp5MZtciLb9PrESqSm/AjfX+9XWF91c36R50Wdd2VXMrg/cmNCmOu1
         uJBjl8mxa06aVGJWblXkeomaoi28oB41hJvQn+6QkN+pSOaQt8X2jXeeHRZ4ZNjaVHCo
         mvWh5Bkt2664nPjK59wgIRi6edTYQFgeZyDbwTHI1jzPjnVau0dP1ETtpt4zlk1NpQEr
         f+NOaT7HL439Q4usMhyc1fkJOm/3e65ra6u3DMUn1IJ0yM+6NlXllqsjag8lj1nTXGh0
         KEcg==
X-Forwarded-Encrypted: i=1; AJvYcCXCBwOkWw0lT5wunx48w6J157CZFDJoUbSHmwNLUpQ00wamgRhlvoWyGD+71zm0oikG/PZ/nX8v8ot4lv4A@vger.kernel.org
X-Gm-Message-State: AOJu0Yw51Awhs/DTfrqJoPz3LHYt9DDPVqpMDAsWQNep4LituIdz2xZ7
	E2CQYnyr5FzTUXB0EwqKoWV0uyaKFtHTwbdgFxyTJAGgoLZes3R0KkOZplUBcic1avhBwxV9Fey
	IJZkwsqphXDKLln9g9fAkvczR5hry/df+4zuEJOwhyUVeEu0yNtUbf9prBkETCYCxBrb9CGfa7z
	XgSz+H/h1p+GbTbTM26AukucTOdTVs9C7HP1jwENYv3LPmNIqEqh4=
X-Gm-Gg: ASbGnctWCYxcYZQitlg9JdHMkZk0yJVMPk5biXndu1aya/s4Joa9jNMjjPDSPMt6E5Z
	YSo8EsGGbQI9XOeTc0Grgl0hOPb9pp1owG2ocfV0DYePI6hUrTrMfzQckJxU4sFldXWwdsZth46
	r3RhPJxD/JzgSpwew3I8jdM9BVxtIkG7uheXM=
X-Received: by 2002:a05:6808:1b21:b0:40a:a971:3918 with SMTP id 5614622812f47-40d073f722cmr6309743b6e.38.1751807474369;
        Sun, 06 Jul 2025 06:11:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXqTIxYOpfrcpl+16hlqYgFIybIHth3/Nw1AkuewmfHyr5AuL3eQcE0fbOtAaXCzTUxvDDs3JmQ1pGw8qClxo=
X-Received: by 2002:a05:6808:1b21:b0:40a:a971:3918 with SMTP id
 5614622812f47-40d073f722cmr6309716b6e.38.1751807474001; Sun, 06 Jul 2025
 06:11:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250706-msm-no-iommu-v1-0-9e8274b30c33@oss.qualcomm.com> <20250706-msm-no-iommu-v1-3-9e8274b30c33@oss.qualcomm.com>
In-Reply-To: <20250706-msm-no-iommu-v1-3-9e8274b30c33@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sun, 6 Jul 2025 06:11:03 -0700
X-Gm-Features: Ac12FXwEujg0mUTYK0P_aqc5R6aQdoKJa1qQ7yp3VRUOl3NV_roo7RTcVDixtuQ
Message-ID: <CACSVV00Cdwjhta+ozoQAy0QQ81LM8Skf8RcnFGKscbc03xBA=w@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/msm/mdp4: use msm_kms_init_vm() instead of
 duplicating it
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=ffSty1QF c=1 sm=1 tr=0 ts=686a75f3 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=hIhbsxJwIuVk7VQtvR8A:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-ORIG-GUID: acbdCyRrY4u0cV4uqnTeHkHTGSiTDdOy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA2MDA4MyBTYWx0ZWRfXyNHgkU8Qjba9
 9C1PpEYE7BWpztlBac7kPcAOCG3UQN1HVnUA290fxJ194hTmGPsCPAuLQlo4pL1oK8GoJYS70v0
 W4XElv4uYZt2dmG2CubOe9Oe0imf3scHga/OiFDIqltwRyu4RwDaS1B7G6sGEUpveq/mWwKUNJt
 h3wxvor+4xiGC4bYZ16NeadjRIzFGK+CVXk7wlUtiG64Z/V66wVJaYF2Qye5bsfNnpjF50SkVb5
 70SmdEqh5JgZwWjl7tkH8jIXGechiwehj25DSIXWyA5inzqRlQQ/DjP34EOTXNDHRpfVuXTQ+Pw
 4XqyAlM5mCs738kpS6dqPOG6UZMS7Y5oFDhLLzuFvRjEZEdBU6YlL5w0iBUf8WxPlOqaaCKfBof
 n6P4OEiTWfiM5KH4fh+nYc0zMilZNqAVwKyD/R7QzV1MXrMVPaxx7s3gVnYaMFvzxD8HRpwu
X-Proofpoint-GUID: acbdCyRrY4u0cV4uqnTeHkHTGSiTDdOy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=939 mlxscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507060083

On Sun, Jul 6, 2025 at 3:50=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> Use the msm_kms_init_vm() function to allocate memory manager instead of
> hand-coding a copy of it. Although MDP4 platforms don't have MDSS
> device, it's still safe to use the function as all MDP4 devices have
> IOMMU and the parent of the MDP4 is the root SoC device.

So, originally the distinction was that mdp4 didn't have the mdss
wrapper.  Maybe it works out because device_iommu_mapped(mdp_dev)
returns true?

BR,
-R

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 27 +++++---------------------=
-
>  1 file changed, 5 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/m=
sm/disp/mdp4/mdp4_kms.c
> index 88296c41d1a5eb0e16cb6ec4d0475000b6318c4e..41d236d30e71ebb6ac8a59052=
529f36fadf15cd7 100644
> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> @@ -391,11 +391,9 @@ static void read_mdp_hw_revision(struct mdp4_kms *md=
p4_kms,
>
>  static int mdp4_kms_init(struct drm_device *dev)
>  {
> -       struct platform_device *pdev =3D to_platform_device(dev->dev);
>         struct msm_drm_private *priv =3D dev->dev_private;
>         struct mdp4_kms *mdp4_kms =3D to_mdp4_kms(to_mdp_kms(priv->kms));
>         struct msm_kms *kms =3D NULL;
> -       struct msm_mmu *mmu;
>         struct drm_gpuvm *vm;
>         int ret;
>         u32 major, minor;
> @@ -458,29 +456,14 @@ static int mdp4_kms_init(struct drm_device *dev)
>         mdp4_disable(mdp4_kms);
>         mdelay(16);
>
> -       mmu =3D msm_iommu_new(&pdev->dev, 0);
> -       if (IS_ERR(mmu)) {
> -               ret =3D PTR_ERR(mmu);
> +       vm =3D msm_kms_init_vm(mdp4_kms->dev);
> +       if (IS_ERR(vm)) {
> +               ret =3D PTR_ERR(vm);
>                 goto fail;
> -       } else if (!mmu) {
> -               DRM_DEV_INFO(dev->dev, "no IOMMU configuration is no long=
er supported\n");
> -               ret =3D -ENODEV;
> -               goto fail;
> -       } else {
> -               vm  =3D msm_gem_vm_create(dev, mmu, "mdp4",
> -                                       0x1000, 0x100000000 - 0x1000,
> -                                       true);
> -
> -               if (IS_ERR(vm)) {
> -                       if (!IS_ERR(mmu))
> -                               mmu->funcs->destroy(mmu);
> -                       ret =3D PTR_ERR(vm);
> -                       goto fail;
> -               }
> -
> -               kms->vm =3D vm;
>         }
>
> +       kms->vm =3D vm;
> +
>         ret =3D modeset_init(mdp4_kms);
>         if (ret) {
>                 DRM_DEV_ERROR(dev->dev, "modeset_init failed: %d\n", ret)=
;
>
> --
> 2.39.5
>

