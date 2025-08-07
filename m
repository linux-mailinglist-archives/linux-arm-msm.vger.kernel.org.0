Return-Path: <linux-arm-msm+bounces-68038-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF199B1DBD0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 18:35:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 51D341895948
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 16:35:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B40F3268C42;
	Thu,  7 Aug 2025 16:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kQisyQxg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5BF82701D9
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Aug 2025 16:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754584465; cv=none; b=eXJCXhiF1lu2pbs3glCvkdy+0apjcM6TVhCeALRoOwXdFOPap80Fmww7xjOJPj9uUZNC9Du5Tk6LrYT3cpWwFSQXk/y5HwUYynvktHfPzoFV240ik+vbkqeKBpNCgrsTd8v2rQ0Vee2JpxS4qfKDvMldUPS3vjC9kgEK79QNGBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754584465; c=relaxed/simple;
	bh=tMLLVGRar0cuCHRh5zAov50PijhI7i7o0O+F5lFtrjU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AfvnbCoqNVLd+NhqhUpPWHAucY1ThGqLHDGfr5gZOZHD7/vH/+xLNrs1qepPDaRZD23CBHJNg27xncd4srIu387tawcEFbNVhBtGAgDjqnoGvtSJoRzw2x9vEMlcTFAJ5wopxsojw0Oju0r57xy+VayADqRa47I8q1zhtCRVItU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kQisyQxg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 577ECZ0M005950
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 Aug 2025 16:34:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=20XGyfXXNdGC7HQWVvn1/217ySdGWAG+LZsLEYNzAEc=; b=kQ
	isyQxgZ6iPc3Dqkz5PhDNE/kGLpDsQ1ExaMUJT8FuqRF88ggtnaVwPqFhtVZbLI1
	AVFcjII7mpAI2W74c7NZIgVunInTO6+H4l/3PPcbGd1zdz3+PjlV/nA9UhSC5Mfn
	K66TfR6SpTM4hMitkVKpZfTd5Z+z3qyQRfLDVSwYHmhLTIKrZ8aMHXXHhvzJdYeg
	nkGYgGCGfyMH7LIfj4GlSieIQ55NtSGy/+hdAdMUY/D6O44xp+jJMRhAoe7+4YQU
	r3gOOygXgCN6ziP3huRubTzWKdhWF8AQ9EAiGs34kSrN7CTFbkZ0/WnH7EIJNKzf
	IUEEUB+S4GlObvJ7EJ1Q==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpybf1q5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 Aug 2025 16:34:22 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-41b398d3704so1731510b6e.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Aug 2025 09:34:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754584462; x=1755189262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=20XGyfXXNdGC7HQWVvn1/217ySdGWAG+LZsLEYNzAEc=;
        b=lbO26YMBMx80O36MKGSXJI78MiXKl6TfU0uNZoldrCZjSGmFMWeScNWADucsgcmYME
         wyFXEyeUhIQ45IA85ZD6rx1pnTZrGgO+/xybGqp2UbMd8FtqFooZ5NkOU/YOtgFhTcjs
         rw7niN/EviAgj4sTeLwx9u3q3v825G6ipE/A2STM6Ki21DRirftBnnHBiyXiHC+CJWN/
         FDOgSKTrd7X+8s2P5fBq2PRWaouN0XjWsoRwNugZ8ILYNPBPZJ5T78NXt6rk3MDL+m1p
         VRzMtwFTFPvBSGiBrtmtPHWdOlLaOZahi71T4ksu06PohwW4CyRK8x6P1GS9NG1SkPCd
         LxGw==
X-Forwarded-Encrypted: i=1; AJvYcCUbnRZ4E3Fx76hyq1xAqIh7hi5lmMqOdjaIiriVH2DDAELK5SHAf4KAr9vH0KROw7UsXCmE+Rz2I6gFOu/m@vger.kernel.org
X-Gm-Message-State: AOJu0YzyiHqBPeXH4McmaAbm/c9yYVwo+2cwa/7CWNmtSI2RxptGMmaS
	PRMwN55dhrarbt/7uIcThG5JoQmP3vnTIfsWsOuE2b09lWrzz8bxOuibdXt3fZ/YWVMb3A4oonP
	EHpw8+DCmPkDrrvzLiL2Wk5W5xcMbCYMZMsXSFXVuH/elXOX02GmDFWPYYvvhtUn27XV9vc1Mxt
	e8ROSw8JlSdGMCCTVSprTIX+52/r9wJfBasI/fy6Z6BwE=
X-Gm-Gg: ASbGncuHwfwYdw/aOw97HRJjsCwIv8Mnbr2y/wSk4YjG1OH1Yf8A9KtNCzE2HFmBczs
	PjDNgTKMNwIukElvlx7eu8iz988cQf6NR8IDinrqqfXiWQUzc06at8UDHAVOXkd68YqNzM3xqxy
	aMYvhK7u6g6ECXhro4F2OdsK6iOrqhhUCtpIaifYLKmav4ixrDjix2
X-Received: by 2002:a05:6808:4f62:b0:435:51e3:4c32 with SMTP id 5614622812f47-435949944cbmr412524b6e.22.1754584461674;
        Thu, 07 Aug 2025 09:34:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyYDpEiutargwcHztd1uMH+An3wIVt+BWQAJA5PusdGM4Ay+XwJsJLRnHeGzu24XnAc+azltF8a3XWtp0hOuI=
X-Received: by 2002:a05:6808:4f62:b0:435:51e3:4c32 with SMTP id
 5614622812f47-435949944cbmr412515b6e.22.1754584461239; Thu, 07 Aug 2025
 09:34:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250807131058.1013858-1-sashal@kernel.org>
In-Reply-To: <20250807131058.1013858-1-sashal@kernel.org>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Thu, 7 Aug 2025 09:34:09 -0700
X-Gm-Features: Ac12FXxMSsMGvIgYDAvLfpHDoBnkFhjLk_774zLTck_kXTKHSm6n5z-AQjQuJmY
Message-ID: <CACSVV03b+tAN4o9kFFaNVJrcO6OgaCSmajL-LpvCd_wDzWPSBQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm: Fix objtool warning in submit_lock_objects()
To: Sasha Levin <sashal@kernel.org>
Cc: lumag@kernel.org, abhinav.kumar@linux.dev, jessica.zhang@oss.qualcomm.com,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, antomani103@gmail.com, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfXwKu74i0jnDnv
 M0iMVRhI4pJzYy/Z6fh73xNZg4KQ3DbL2YBy0hbKLh505eso0CrNnGoMMtFnQIZDBvmQbSYLT3K
 kNCWbHhYCEtRbcSQOigGJi9KAm8ulcVHSnm/aX2jG5E3IPOe4JlykjDPDEQd8zR+QwCjBumbVey
 pCLds3lIgfTpi1rhJa/Y0jK6gOU1VXSJ001xxA3AQh2zVaZdAB2bMD/tLvartYWFEqctv8ZSDmd
 7dpVDeDmVtuzFBgp4DavzObuWXp2kX2L3WDG73SgSYtKqpFNOcrHiC89D6vd1gYObB++WWWieZV
 b5ckGwz4cTysAqIHPmOgdqj4uo4bQJD2cTT91wkDDfkmEH22pfIyLQbrc1nOwIbdNPh0PKr5K6x
 XHIzNfQU
X-Proofpoint-GUID: 7g6g2CUsjCNtsC2l3YXTLXJfuH0Yet2K
X-Authority-Analysis: v=2.4 cv=EavIQOmC c=1 sm=1 tr=0 ts=6894d58e cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=VwQbUJbxAAAA:8 a=J1DvxoY-jygCTqRSKsMA:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-ORIG-GUID: 7g6g2CUsjCNtsC2l3YXTLXJfuH0Yet2K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-07_03,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0
 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009

On Thu, Aug 7, 2025 at 6:11=E2=80=AFAM Sasha Levin <sashal@kernel.org> wrot=
e:
>
> Split the vmbind case into a separate helper function
> submit_lock_objects_vmbind() to fix objtool warning:
>
>   drivers/gpu/drm/msm/msm.o: warning: objtool: submit_lock_objects+0x451:
>   sibling call from callable instruction with modified stack frame
>
> The drm_exec_until_all_locked() macro uses computed gotos internally
> for its retry loop. Having return statements inside this macro, or
> immediately after it in certain code paths, confuses objtool's static
> analysis of stack frames, causing it to incorrectly flag tail call
> optimizations.
>
> Fixes: 92395af63a99 ("drm/msm: Add VM_BIND submitqueue")
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Thanks, I've pushed this to my staging branch for msm-fixes

BR,
-R

> ---
>
> Changes since v1:
>  - Extract helper submit_lock_objects_vmbind() instead of refactoring
>    single loop
>
>  drivers/gpu/drm/msm/msm_gem_submit.c | 49 +++++++++++++++-------------
>  1 file changed, 27 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/m=
sm_gem_submit.c
> index 5f8e939a5906..1ce90e351b7a 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -271,32 +271,37 @@ static int submit_lookup_cmds(struct msm_gem_submit=
 *submit,
>         return ret;
>  }
>
> -/* This is where we make sure all the bo's are reserved and pin'd: */
> -static int submit_lock_objects(struct msm_gem_submit *submit)
> +static int submit_lock_objects_vmbind(struct msm_gem_submit *submit)
>  {
> -       unsigned flags =3D DRM_EXEC_INTERRUPTIBLE_WAIT;
> +       unsigned flags =3D DRM_EXEC_INTERRUPTIBLE_WAIT | DRM_EXEC_IGNORE_=
DUPLICATES;
>         struct drm_exec *exec =3D &submit->exec;
> -       int ret;
> +       int ret =3D 0;
>
> -       if (msm_context_is_vmbind(submit->queue->ctx)) {
> -               flags |=3D DRM_EXEC_IGNORE_DUPLICATES;
> +       drm_exec_init(&submit->exec, flags, submit->nr_bos);
>
> -               drm_exec_init(&submit->exec, flags, submit->nr_bos);
> +       drm_exec_until_all_locked (&submit->exec) {
> +               ret =3D drm_gpuvm_prepare_vm(submit->vm, exec, 1);
> +               drm_exec_retry_on_contention(exec);
> +               if (ret)
> +                       break;
>
> -               drm_exec_until_all_locked (&submit->exec) {
> -                       ret =3D drm_gpuvm_prepare_vm(submit->vm, exec, 1)=
;
> -                       drm_exec_retry_on_contention(exec);
> -                       if (ret)
> -                               return ret;
> +               ret =3D drm_gpuvm_prepare_objects(submit->vm, exec, 1);
> +               drm_exec_retry_on_contention(exec);
> +               if (ret)
> +                       break;
> +       }
>
> -                       ret =3D drm_gpuvm_prepare_objects(submit->vm, exe=
c, 1);
> -                       drm_exec_retry_on_contention(exec);
> -                       if (ret)
> -                               return ret;
> -               }
> +       return ret;
> +}
>
> -               return 0;
> -       }
> +/* This is where we make sure all the bo's are reserved and pin'd: */
> +static int submit_lock_objects(struct msm_gem_submit *submit)
> +{
> +       unsigned flags =3D DRM_EXEC_INTERRUPTIBLE_WAIT;
> +       int ret =3D 0;
> +
> +       if (msm_context_is_vmbind(submit->queue->ctx))
> +               return submit_lock_objects_vmbind(submit);
>
>         drm_exec_init(&submit->exec, flags, submit->nr_bos);
>
> @@ -305,17 +310,17 @@ static int submit_lock_objects(struct msm_gem_submi=
t *submit)
>                                         drm_gpuvm_resv_obj(submit->vm));
>                 drm_exec_retry_on_contention(&submit->exec);
>                 if (ret)
> -                       return ret;
> +                       break;
>                 for (unsigned i =3D 0; i < submit->nr_bos; i++) {
>                         struct drm_gem_object *obj =3D submit->bos[i].obj=
;
>                         ret =3D drm_exec_prepare_obj(&submit->exec, obj, =
1);
>                         drm_exec_retry_on_contention(&submit->exec);
>                         if (ret)
> -                               return ret;
> +                               break;
>                 }
>         }
>
> -       return 0;
> +       return ret;
>  }
>
>  static int submit_fence_sync(struct msm_gem_submit *submit)
> --
> 2.39.5
>

