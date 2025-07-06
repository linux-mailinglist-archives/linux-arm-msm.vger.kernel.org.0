Return-Path: <linux-arm-msm+bounces-63857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 252C1AFA618
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Jul 2025 17:11:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7996D17CA35
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Jul 2025 15:11:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37BBE2882A7;
	Sun,  6 Jul 2025 15:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KleaMkK9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B91D2877D8
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Jul 2025 15:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751814681; cv=none; b=fDP8gtDNNfgkre1dE6RVRPvNfsdwRlKrIinz9LnqyuOxQ+9T4CZaNq9F9nyrgAIQoTe1VZt6NdVqdYj7Euecfrdz5gsx2dAxzfJyJm3MVSTqEx7EMiyR+EOzMEBzphu8SEEqex9/SATxP4byb39S+W/EsuGcCAmWkQJWW4Qpk0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751814681; c=relaxed/simple;
	bh=QEedb3gvKUnOPqlhv4FlNyLU4cBMnRFmbVLsO9eB2bk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IUBb2d3y2D5ZXnL77EC2v4TfXR72a3LTdNBRIl71pPoQh9M/M8N3B+V2BSZRf9RjvIUgTcXnQaVZDO8SFJsogJdxyf0TBPFcSebgUMNZclixbAwc6QJrOpYd+t2pb8woLMYlKMRQu374rYk0x/dq87DwoZ/932NoqnkQjJBz1N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KleaMkK9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5667URLH028284
	for <linux-arm-msm@vger.kernel.org>; Sun, 6 Jul 2025 15:11:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=deOGb66htBHQke4mAZ1lh4AWcMp6dCPlP5Iwn3G7D+E=; b=Kl
	eaMkK9gP9gNKG5XeBj9jBgcBp7vENfmcsh0/TCHTmmdbaXEeDcTbiUI6qblYfgwT
	NeXqP5alMjTm2/J6W5GC+1UQP+rLsza5wO+4w5vOR4icdopGWfT9cxgUkwE2Ag7j
	dWWk1qfaS9yJ644gqYQ6ua8L6xy9ByARWBS8P8nrJAdNq2tlbJNwzQd90ieDnY/U
	8EdJ9BZUx6IsGZyUf987cN/v6z1ON4/iNrfpR3j5BqZLo15mC7HA/5cLAqcoYnX4
	JVVacZWyKtuy20VWSGESwN1mXY7CrT28lSVYFVSzIubUGxVwdNlv9ZddNR8bl5KV
	BK3fPxj2AWM+488DZB8g==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47psdqd4du-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 06 Jul 2025 15:11:17 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-40abfc09f67so565708b6e.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Jul 2025 08:11:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751814677; x=1752419477;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=deOGb66htBHQke4mAZ1lh4AWcMp6dCPlP5Iwn3G7D+E=;
        b=i5ZltxP+EfOYBErq0jReMaCUdj4qAsIcPZNrD7/7ygGy2+gHeObsdpPsG2x2JgfqUo
         lPJ91siGvtS1nd3f43ANLIrEk+EKJSVHXFxcLMIkGirqjOirP4mAM+KxXztSymShS74a
         RgT1jkCicghQa2gC/bnE95AXlx328QPgJPL8784Efc/vDWSdQ75dFUw75gFXXzxForB7
         5pCfeKhIylFNs+ZKbMc6c7gQ9+bAIwTaNh82/fWj/0Hhd2kdujUhh2b/wo6Ltw+HeUKh
         NgVBkmAnQe/8lZEt9JLICxbH+Jpj7MvzWP6l2GXVLE+m3wcE9/R+2Nb5kXlFi7S7eNcr
         pi3A==
X-Forwarded-Encrypted: i=1; AJvYcCU5JTO7Ko3/tXdLdBlg03duQAO03dNVQsiqVzo9nVJoT4Zbah7jV8IUGKqz5QlKZSGJQXKepszhcDoOU2Fz@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9EuK3m7rrQL9IlrBC5riotpEfmJf4UAvANI9sBEUFywUJ8Y5z
	E5ruIb05717Jms3RRgwureSrQ50yxfLlWWqnVyXdNUEUnyviXJEQlTkS2V1gkSqXnbTLxtKA0AB
	1pw9MobvxMiRfuXSmsfXxqeL/P8s18Ub6cRLdPztIhWwrqhfD6qPsTK8Ah+0rnc4iFdPvbtRS/6
	Lo/RTsUNYKVpoJMzXIsldviQ1pB8Y/BZM02/Vd3AH6mVU=
X-Gm-Gg: ASbGnctyf8EoBhow9IWjf9pjsvxfy2I2dopUo+QxsIpdANNFbSO/fMbE7yo3UyxEoXZ
	3ejwS/xvtSihuqLQwLpSUpUMFzjltL0NfHyk6UAdGLl2k8Vt8aowIh9PTM7KlV+2GESv4bssTtg
	92T4GQ0sOk/k5pg5CQvhsDfMALX6fpYC3H34M=
X-Received: by 2002:a05:6808:4fde:b0:3f4:1c2:874a with SMTP id 5614622812f47-40d2cf2d360mr3898505b6e.24.1751814676737;
        Sun, 06 Jul 2025 08:11:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCvcckgznjdGp/NHPpmur+SYkh7MSUDwzMDpYV3OdsMstVz6vnUJ6ymJyEyW6a8CETCNZtwOf5LWMCyVbpVT0=
X-Received: by 2002:a05:6808:4fde:b0:3f4:1c2:874a with SMTP id
 5614622812f47-40d2cf2d360mr3898492b6e.24.1751814676366; Sun, 06 Jul 2025
 08:11:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250706-msm-no-iommu-v1-0-9e8274b30c33@oss.qualcomm.com>
 <20250706-msm-no-iommu-v1-3-9e8274b30c33@oss.qualcomm.com>
 <CACSVV00Cdwjhta+ozoQAy0QQ81LM8Skf8RcnFGKscbc03xBA=w@mail.gmail.com> <CAO9ioeV47NAo=j=QHdZPSZT_f31jTT=cFSN=EjihboTr4Pmzkw@mail.gmail.com>
In-Reply-To: <CAO9ioeV47NAo=j=QHdZPSZT_f31jTT=cFSN=EjihboTr4Pmzkw@mail.gmail.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sun, 6 Jul 2025 08:11:05 -0700
X-Gm-Features: Ac12FXwWOIs0xq3UqgUHa5M8SliZdTa3qi5qoPVNxk89mJts5QGe6lLAnY2HFko
Message-ID: <CACSVV01QLz40_sU4-jD6EHpnZ8ECRgxqQTaRjNdtRtgrDbAMCA@mail.gmail.com>
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
X-Authority-Analysis: v=2.4 cv=ffSty1QF c=1 sm=1 tr=0 ts=686a9215 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=q-jfb1koqDsd5eNGIpgA:9 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-ORIG-GUID: FyQfv0-TF0VnfNYqMqUOe1idXjTXQyqT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA2MDA5NyBTYWx0ZWRfX1iIFPMpMZzMy
 D0Jl8TVye/gChMDbxdpN5O7nncKBqdYitbuiWkXZlA+qxOY7/kNPHLBQ/jn8x3zUqWIzAlLEvjq
 eK6Vuga7BGtNKz8fHbU4RO8FV1rNzz5g1aZIyvJN8TojgHlZ7jhp35pt6y6wzMfe0wyqrXY94Ev
 88+up2Bk4ViP9W4OTy33q5NbgHdzczsaOmzcH3u03HqN8eW9u0zUiFyENO5NEuMAuyyKnlDBmvj
 WATAguuWonPpyq/MCHHEPglHe4BTqgutyqBym/nkOUgwZ+i/mfz0cqkDQGCFBC8EAu0fEr3CIiY
 D2R+jMwoRhMTNbyKDYbacIRPZ2bNrOhHsV4TRZpJbJeOtO9Fk6uuW18e5J2fSOz7ikSsDIUeEki
 6AKJsJSgctHhqqXz0K0zVB3gIQ/+gdVa22+G/vVdz8S/Cpb7NQxO0nY3y3BgbRTe0WkZC6VJ
X-Proofpoint-GUID: FyQfv0-TF0VnfNYqMqUOe1idXjTXQyqT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=947 mlxscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507060097

On Sun, Jul 6, 2025 at 7:02=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Sun, 6 Jul 2025 at 16:11, Rob Clark <rob.clark@oss.qualcomm.com> wrote=
:
> >
> > On Sun, Jul 6, 2025 at 3:50=E2=80=AFAM Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >
> > > Use the msm_kms_init_vm() function to allocate memory manager instead=
 of
> > > hand-coding a copy of it. Although MDP4 platforms don't have MDSS
> > > device, it's still safe to use the function as all MDP4 devices have
> > > IOMMU and the parent of the MDP4 is the root SoC device.
> >
> > So, originally the distinction was that mdp4 didn't have the mdss
> > wrapper.  Maybe it works out because device_iommu_mapped(mdp_dev)
> > returns true?
>
> Yes, as expressed in the cover letter.

Right, but with this patch, I think nothing is enforcing that, so we
could end up dereferencing mdp_dev->parent if the device did not have
an iommu.

I guess you could solve that with an extra device_iommu_mapped() in
mdp4_kms_init()

BR,
-R

> >
> > BR,
> > -R
> >
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > ---
> > >  drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 27 +++++-----------------=
-----
> > >  1 file changed, 5 insertions(+), 22 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/d=
rm/msm/disp/mdp4/mdp4_kms.c
> > > index 88296c41d1a5eb0e16cb6ec4d0475000b6318c4e..41d236d30e71ebb6ac8a5=
9052529f36fadf15cd7 100644
> > > --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> > > +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> > > @@ -391,11 +391,9 @@ static void read_mdp_hw_revision(struct mdp4_kms=
 *mdp4_kms,
> > >
> > >  static int mdp4_kms_init(struct drm_device *dev)
> > >  {
> > > -       struct platform_device *pdev =3D to_platform_device(dev->dev)=
;
> > >         struct msm_drm_private *priv =3D dev->dev_private;
> > >         struct mdp4_kms *mdp4_kms =3D to_mdp4_kms(to_mdp_kms(priv->km=
s));
> > >         struct msm_kms *kms =3D NULL;
> > > -       struct msm_mmu *mmu;
> > >         struct drm_gpuvm *vm;
> > >         int ret;
> > >         u32 major, minor;
> > > @@ -458,29 +456,14 @@ static int mdp4_kms_init(struct drm_device *dev=
)
> > >         mdp4_disable(mdp4_kms);
> > >         mdelay(16);
> > >
> > > -       mmu =3D msm_iommu_new(&pdev->dev, 0);
> > > -       if (IS_ERR(mmu)) {
> > > -               ret =3D PTR_ERR(mmu);
> > > +       vm =3D msm_kms_init_vm(mdp4_kms->dev);
> > > +       if (IS_ERR(vm)) {
> > > +               ret =3D PTR_ERR(vm);
> > >                 goto fail;
> > > -       } else if (!mmu) {
> > > -               DRM_DEV_INFO(dev->dev, "no IOMMU configuration is no =
longer supported\n");
> > > -               ret =3D -ENODEV;
> > > -               goto fail;
> > > -       } else {
> > > -               vm  =3D msm_gem_vm_create(dev, mmu, "mdp4",
> > > -                                       0x1000, 0x100000000 - 0x1000,
> > > -                                       true);
> > > -
> > > -               if (IS_ERR(vm)) {
> > > -                       if (!IS_ERR(mmu))
> > > -                               mmu->funcs->destroy(mmu);
> > > -                       ret =3D PTR_ERR(vm);
> > > -                       goto fail;
> > > -               }
> > > -
> > > -               kms->vm =3D vm;
> > >         }
> > >
> > > +       kms->vm =3D vm;
> > > +
> > >         ret =3D modeset_init(mdp4_kms);
> > >         if (ret) {
> > >                 DRM_DEV_ERROR(dev->dev, "modeset_init failed: %d\n", =
ret);
> > >
> > > --
> > > 2.39.5
> > >
>
>
>
> --
> With best wishes
> Dmitry

