Return-Path: <linux-arm-msm+bounces-63854-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A722AFA5AA
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Jul 2025 16:02:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 566C316B274
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Jul 2025 14:02:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FA68286D4D;
	Sun,  6 Jul 2025 14:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qnqpt6A+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08BB32E3700
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Jul 2025 14:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751810559; cv=none; b=h0diP61599Dg9jMR87HoTn0v77JG64eCRS/4aekY3EA6NKOEj/LDV4VHMudxTn80frX/3iP0Jf5Vrnq8zXqNE/a7ROMBlSx+H8ruYd6chFQf+E7GWLPV28dHZnCx1mHrppCpTSnJxQZk73Ehje2nd+98uq0eCRcKh0b3YLy5eOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751810559; c=relaxed/simple;
	bh=ieYNIRcY1Mcxekul5/VazQrkxb7a++0ZqPwLGm1AH2A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a5lMZ6nWbebpEQJHQgh9C65J+lEtuyPpjEYyALcbUDqK/F1iHcOPdAPqKzL3EpYkYb47sjZu2I3EUk6+ZRbAqyMNIbaTm/ZWwLcM0vuxNny645fDy1Qcfifv/ugKwBcME/9ZVigHw830KgMdxN0pY03yhWJ7JuzVW554WK51WKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qnqpt6A+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 566E0MxN010311
	for <linux-arm-msm@vger.kernel.org>; Sun, 6 Jul 2025 14:02:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wxj7HqGGrZODqPROvMBKCjS0gz/MMI/Glo0w6GOHDno=; b=Qnqpt6A+0IMlzv5p
	sY5qHSU3K/Nj/C67SrSQ68qU63NIqgZhpXl5RC4gIM+T2p7ymfz7zXSIqx8JAfy9
	703ZFaioXNeei1MqTXja6/yCEk66cR5Y8yZs4G9U7D91MPAp6MYMwueqzTW5xDEZ
	VembucwALeGx822r46pPDOKISkP9GSK/6LQkKMQjkm/VF3/C3AAJ1DrSLEjdC/aL
	Sga+Ur+JJHCqoibTmuTqg1Idw3usA8oUjIbesPRtozwM8anZmB7itlwS5vNjeJE2
	qAOvWJcpRG8i8ZkTwtYq9U+lmkRcuzJKOB5JbQNfcHZcPt0WmUtrZB1ncIGTNmDT
	ulw11A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pu0vvjuv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 06 Jul 2025 14:02:37 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-315af0857f2so2191715a91.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Jul 2025 07:02:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751810556; x=1752415356;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wxj7HqGGrZODqPROvMBKCjS0gz/MMI/Glo0w6GOHDno=;
        b=Ut+fAIc3ElxxcERW3Io870D8srwSEyqx8WYP4vJ2tE/wX99mgU3z2cg7AVhhOCR8sc
         we68i178rPiN7ne0xbmK82i2eUVSdC/5lplJxaSVTvivyvOA+Mu65F9Q8AfA5RHarn98
         nZT2J9NPoaIDX17ntYYJ7asMXoIBy5NlE9GdzFsQx/kijBdoUV78gxh/SnvtGlr4ZRAT
         ePr8E9eRUG6s7o8HLqznbff143zoPfsKSYFyTktg3ybtNI54qI1rAzNYMvBTqwFrl54y
         kQbPoImwzfyUEf0AG4J//arScNPe7aZzR4tz2XdD8Y1dnOU2Q8Pharq0GMgI4LtqEm8v
         ZLjA==
X-Forwarded-Encrypted: i=1; AJvYcCURy7kMnbIUkBRjMpSjIaxAB2Je+yzo6u/ar9XhYRG/iNjmJgQli23rJwQveHNmvmXxoUboNQYBArlR1fBK@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu1Fv9M1cEGT0Swk+Upowd8Tz8y/ctGyI+JqIWTMOhZJomdNi0
	7LbiYHCFQD4V1n3TqXbn57+FtfGUPBX8Nz1JdenJTvmB5N/napKk8s7cdxbXPbkClZXOClNEtey
	87rRP4e1gc6YvmTgHJJXJ5BmcSKR040tA/wTJqFZ+PPM++vggSGt7yl/OumRXkxiyGLIX5wqAUk
	hFeElgouSrLYyDVtrfnk3k20EDmYK6QtF6vgC/u/i0bDA=
X-Gm-Gg: ASbGncvHlZlHf/YtQRK2w8IrzdwPWNtNzVykNgDa3MvQVLR/A23E48tYFMrnL0zV1x+
	S7+XZqH/3iykv5DMrEvEZ34Gyyvb7GylDwOpPbSfYOy6j3IewzFSFrtWshxEKhJgJVFB+Hl6mWC
	hrv0yc9STj42n7hkqN/Q==
X-Received: by 2002:a17:90b:28c3:b0:311:f05b:869b with SMTP id 98e67ed59e1d1-31aaddc53famr12497029a91.30.1751810556266;
        Sun, 06 Jul 2025 07:02:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFfcxb3whsTrEP9JFBXZUEILpaINN46Ri6Rk09CCIfQf9eys+yq5fHc4CQx3OZduLcJw1kfjr5yhBJgxFZDRtI=
X-Received: by 2002:a17:90b:28c3:b0:311:f05b:869b with SMTP id
 98e67ed59e1d1-31aaddc53famr12496960a91.30.1751810555650; Sun, 06 Jul 2025
 07:02:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250706-msm-no-iommu-v1-0-9e8274b30c33@oss.qualcomm.com>
 <20250706-msm-no-iommu-v1-3-9e8274b30c33@oss.qualcomm.com> <CACSVV00Cdwjhta+ozoQAy0QQ81LM8Skf8RcnFGKscbc03xBA=w@mail.gmail.com>
In-Reply-To: <CACSVV00Cdwjhta+ozoQAy0QQ81LM8Skf8RcnFGKscbc03xBA=w@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 6 Jul 2025 17:02:24 +0300
X-Gm-Features: Ac12FXyooe1pNll4vWeSnZkXQveBQYBb4dYUg2ydMWu4a9IUk0GIhGseVDKlY6A
Message-ID: <CAO9ioeV47NAo=j=QHdZPSZT_f31jTT=cFSN=EjihboTr4Pmzkw@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/msm/mdp4: use msm_kms_init_vm() instead of
 duplicating it
To: rob.clark@oss.qualcomm.com
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
X-Proofpoint-ORIG-GUID: RP_LVaygVFpdOAQfYr3QdaHSrJm2amkd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA2MDA4OSBTYWx0ZWRfX08C90Llc+11e
 B0MQOgGkRddK1+8bbJ7JphFE30WsqnFUGHiNA5DyPmZxDn3WL7KKBk86yhhl3eCV/h1aPsdg6Up
 3VbKvz0/CUgeR+wmRqVirPk5csqnFUE9uk3eavUvbhHPQbH4Tnkm8rbh9De5Fv6BPZJuduSocHg
 wTddZu+Wm5ogmzqlDGNsh7jhpOEkLH8LdHppjHng0GMZ381JgjhZLTra5X09BDlWKPOj5KNUezM
 EcbHgQ9P5Lygz/GxMLtyp4MWZTSLYszg63oqrybYYMn/XXN+AV7s1FF9lh5cO5fIxtqJqSxHIFG
 4q6UJJRMKkghdS5p13LVt4OOgdF5/ftAj5EYADWxuKSkKxVw+0YFQsV9zjl61jM8grS4y4VwcqY
 RvfnTU7btH5gkPaBRj+nt9sJ4Pk/1hn5imKhqoOWPhYtV6utJMrxOAhxbtFEuIujFEk7kOj6
X-Authority-Analysis: v=2.4 cv=Rd2QC0tv c=1 sm=1 tr=0 ts=686a81fd cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=r4SaECpLYQUvehMX0aYA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: RP_LVaygVFpdOAQfYr3QdaHSrJm2amkd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 mlxscore=0 malwarescore=0 lowpriorityscore=0
 mlxlogscore=907 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507060089

On Sun, 6 Jul 2025 at 16:11, Rob Clark <rob.clark@oss.qualcomm.com> wrote:
>
> On Sun, Jul 6, 2025 at 3:50=E2=80=AFAM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > Use the msm_kms_init_vm() function to allocate memory manager instead o=
f
> > hand-coding a copy of it. Although MDP4 platforms don't have MDSS
> > device, it's still safe to use the function as all MDP4 devices have
> > IOMMU and the parent of the MDP4 is the root SoC device.
>
> So, originally the distinction was that mdp4 didn't have the mdss
> wrapper.  Maybe it works out because device_iommu_mapped(mdp_dev)
> returns true?

Yes, as expressed in the cover letter.

>
> BR,
> -R
>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 27 +++++-------------------=
---
> >  1 file changed, 5 insertions(+), 22 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm=
/msm/disp/mdp4/mdp4_kms.c
> > index 88296c41d1a5eb0e16cb6ec4d0475000b6318c4e..41d236d30e71ebb6ac8a590=
52529f36fadf15cd7 100644
> > --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> > +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> > @@ -391,11 +391,9 @@ static void read_mdp_hw_revision(struct mdp4_kms *=
mdp4_kms,
> >
> >  static int mdp4_kms_init(struct drm_device *dev)
> >  {
> > -       struct platform_device *pdev =3D to_platform_device(dev->dev);
> >         struct msm_drm_private *priv =3D dev->dev_private;
> >         struct mdp4_kms *mdp4_kms =3D to_mdp4_kms(to_mdp_kms(priv->kms)=
);
> >         struct msm_kms *kms =3D NULL;
> > -       struct msm_mmu *mmu;
> >         struct drm_gpuvm *vm;
> >         int ret;
> >         u32 major, minor;
> > @@ -458,29 +456,14 @@ static int mdp4_kms_init(struct drm_device *dev)
> >         mdp4_disable(mdp4_kms);
> >         mdelay(16);
> >
> > -       mmu =3D msm_iommu_new(&pdev->dev, 0);
> > -       if (IS_ERR(mmu)) {
> > -               ret =3D PTR_ERR(mmu);
> > +       vm =3D msm_kms_init_vm(mdp4_kms->dev);
> > +       if (IS_ERR(vm)) {
> > +               ret =3D PTR_ERR(vm);
> >                 goto fail;
> > -       } else if (!mmu) {
> > -               DRM_DEV_INFO(dev->dev, "no IOMMU configuration is no lo=
nger supported\n");
> > -               ret =3D -ENODEV;
> > -               goto fail;
> > -       } else {
> > -               vm  =3D msm_gem_vm_create(dev, mmu, "mdp4",
> > -                                       0x1000, 0x100000000 - 0x1000,
> > -                                       true);
> > -
> > -               if (IS_ERR(vm)) {
> > -                       if (!IS_ERR(mmu))
> > -                               mmu->funcs->destroy(mmu);
> > -                       ret =3D PTR_ERR(vm);
> > -                       goto fail;
> > -               }
> > -
> > -               kms->vm =3D vm;
> >         }
> >
> > +       kms->vm =3D vm;
> > +
> >         ret =3D modeset_init(mdp4_kms);
> >         if (ret) {
> >                 DRM_DEV_ERROR(dev->dev, "modeset_init failed: %d\n", re=
t);
> >
> > --
> > 2.39.5
> >



--=20
With best wishes
Dmitry

