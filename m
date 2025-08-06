Return-Path: <linux-arm-msm+bounces-67954-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 991B1B1CF74
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 01:38:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C6B93627D4D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 23:38:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0839F277C8F;
	Wed,  6 Aug 2025 23:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B4NhXMfZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B6D277C86
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Aug 2025 23:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754523514; cv=none; b=bHv6YJxPLkPaXQ+/XNoziTLuy5he6i+uNhqhCyBpSHmdpM0d7gnbePT4jmuxB9Bnn470oGTRSoi6KP/UWj7wgI2jjJ6UYl3NLkjrVx44CT+zV5CB0tXhaYMdyuY8MmbkYNJY64SKPm7BLTvCD6oGGz9oJOal7qB4jv0McyRTsHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754523514; c=relaxed/simple;
	bh=VJQWnJ0xkr9EEbnL3lXDukQbwjKMGh/hOEDMFd5Z0qg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ls9o0PlBkibh++FF0NAY/LuDdwvO9rc11PXHa4ZyXYT8joBurBlzFZjG1zgXVgVKDhz4zMkYsv8t0G0qw0jLgMlCPiAsfz3HcYW5IRvw5kave/JAsSoKDu9nM4u12eiHNVrrgnXpesImaoGkHdwZKEDSuQmtwnr3n3PcT5coMDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B4NhXMfZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 576I95T9032385
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 Aug 2025 23:38:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=Ac6klSnA9Mr53PX86rTjqGkchVoRjSTOCtS4mQwGPtg=; b=B4
	NhXMfZIY3KWm6jV5nbmTTOhsPk0QXzDg9ZDqfcFXdh6wYO/uesBS/3C2wsO83bFJ
	rP68H2+u/of4suW5za0If4n+6E9fC7Uaz34XB5Nzc1ipssLt297je78LzE60wx2K
	RwQ2yF9S1SQVMo+D9/J6HWQeu7grns/0tAe7jy082gJUhvMZVhAyhUQEFBxP5OGO
	iZ/jvb8vHLNklSATXeRZSX3kxIe/db8E4vKpF1bPsU5gK0MSdNVpGNP8ttjSaUlw
	UAW9C/yH6s/mbvPMflLUBFBeBOI78k4GtNJ/Ha0/IWIDPFioZATiGhx4zX3GiRJ9
	CRuq4Np6lHjjALpAKTlg==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpw2vc7f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 Aug 2025 23:38:31 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-619b502dd19so795090eaf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Aug 2025 16:38:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754523511; x=1755128311;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ac6klSnA9Mr53PX86rTjqGkchVoRjSTOCtS4mQwGPtg=;
        b=UYP/yHvVS+WFe+vaSo6Wv6//Ym9P5HOi5jof2abtMdXIrjQq+pigtrACZDamDIxccy
         uiTBBpXNwSRpNqqTs3eN+XsDh1D0orU7gZp7BN8ua+WEo3wTLQIRpnonSuMa9BfcbFrQ
         tPgRFmw/u9scdcDker00ry5O/nCmZzb3wuCp8PcrMQDFZwoWbjg0+xfSHdbFjVO75LfM
         sJA0M0jAMwlhw9lCcAUGSA1hxu3E6FmxNYmKDLFB3+VxRkzfr8K65kff0TCjgEdDCUqJ
         r+QJkxCfcorZJynBwf2LX3dlaq2BUVmPbqSqiaYooXg+wTg4VGggZZSCKUhBuItenmTJ
         0Jkg==
X-Forwarded-Encrypted: i=1; AJvYcCUJHo00HHgBMHWKkeBbcBHHHWn9eDZctwI64CWs9KsSVNMkJrsNlxypSOvkFXuqr7hmm8Z3h9rw3qOzsHMI@vger.kernel.org
X-Gm-Message-State: AOJu0YylzinymYu42P1WMmxc3J8IptAsbWHlwejj3XpSuYukbU9K9CHX
	lPxHKBrSGkvIS9Y9vKyvCY5ZL6WCiGI0w32xIbrCE6HDikzBPIRKGiWccq9v/ECEIY6f4QoAQaI
	S43fMP5kMJXP3YuAuCKZTPwP12bOlN5PHlEKsJT7tyEuZsu0gzDRVmCrqkqjGuTrpncmr2nQNrG
	iAkuqxJB9NOdUD0XtsGCv6PJBd62AqY89qeyeXoScpXSvzjYzzF+h35w==
X-Gm-Gg: ASbGncuHzOaZbpm9bbdRDrw2ilYvT09Y0lp4KZGciDUD3e+UOkKrYxZNAO0P9rz7x4t
	wVZHSetJ1IzD6lr/BedomotK6Nur5YwCidIVyblHzcPtVV0CaXwz0O0D8iIgFpXKfPoHwp9thC8
	I3JuOfKJCaZpq3yPlUb69M8icMdxDir1ITWremWVozilIhovaQI9Xj
X-Received: by 2002:a05:6808:188e:b0:407:a0ea:a233 with SMTP id 5614622812f47-43587d4aefbmr1086824b6e.10.1754523510878;
        Wed, 06 Aug 2025 16:38:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEajvgQwj0cA40SDmJZi443/ZvRJrXgIh9b0IEiCevFL8xUX1afj5QQsW7XjUX+4Vja9Yolv8KBFejgkt9sl+0=
X-Received: by 2002:a05:6808:188e:b0:407:a0ea:a233 with SMTP id
 5614622812f47-43587d4aefbmr1086811b6e.10.1754523510491; Wed, 06 Aug 2025
 16:38:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250805225557.593192-1-sashal@kernel.org>
In-Reply-To: <20250805225557.593192-1-sashal@kernel.org>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Wed, 6 Aug 2025 16:38:19 -0700
X-Gm-Features: Ac12FXzyXnGkvSc4Rh5FVrwgztoGD-i80tBzbFVH33Tmk6r1gudt7__afChJygA
Message-ID: <CACSVV02Z=4Saw=-MA6zz-Dsye8T=AcARWs1AhUbWnyA8sY7fdQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Fix objtool warning in submit_lock_objects()
To: Sasha Levin <sashal@kernel.org>
Cc: lumag@kernel.org, abhinav.kumar@linux.dev, jessica.zhang@oss.qualcomm.com,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, antomani103@gmail.com, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Vbz3PEp9 c=1 sm=1 tr=0 ts=6893e778 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=VwQbUJbxAAAA:8 a=QLtsSAfmF_M2AFDG84kA:9 a=QEXdDO2ut3YA:10
 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-ORIG-GUID: ediJxFe-acBrTbEhf95fCRPKE8Wnj-GN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOCBTYWx0ZWRfX03s/LFe8m0Yo
 OkdGqgJgZAcTYgWxsnSIhcC1CKZMegOKSCKPx3a+7fyXW/LHqRcNz+5JTdKTyOP5HjK7mH/1mfr
 Xzmbldp78LMB68A2bFR38VMunwJxobxlGlyMSkjWA6jLmcTxTiE2y3pyQKREsmM9w9gtdj3QwB+
 N3oCgh5TZUr4isQ0E4OPEFX3HHvCD60UzyjXgcnupzURFMcFFj+HJGo4Kse30RgC5dTMl8slpv+
 bdhYofaLj8Cx29I+gItxkucehktpaRnK5y3E8/yLEgIukILqmpRqDNgKqojrOGw7pVrtYHCLwxw
 rotSYCTvGC8V81Lqbr8a0rWZpl81LpWSAJ4B1qB3v50JA5Tfp7DoyKZs3FvwoFryOdtrPv6GFRk
 tuymIoaF
X-Proofpoint-GUID: ediJxFe-acBrTbEhf95fCRPKE8Wnj-GN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_05,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060008

On Tue, Aug 5, 2025 at 3:56=E2=80=AFPM Sasha Levin <sashal@kernel.org> wrot=
e:
>
> Restructure submit_lock_objects() to use a single loop with break
> statements to fix objtool warning:
>
>   drivers/gpu/drm/msm/msm.o: warning: objtool: submit_lock_objects+0x451:
>   sibling call from callable instruction with modified stack frame
>
> The drm_exec_until_all_locked() macro uses computed gotos internally
> for its retry loop. Having return statements inside this macro, or
> immediately after it in certain code paths, confuses objtool's static
> analysis of stack frames, causing it to incorrectly flag tail call
> optimizations.

Maybe we should instead just split out a separate
submit_lock_objects_vmbind() and restore the error path 'goto error'
instead of returning from within the loop?  Ie. basically revert
submit_lock_objects to the way it was before commit 92395af63a99
("drm/msm: Add VM_BIND submitqueue"), and then move the rest into a
new fxn (with 'goto error' instead of 'return ret'?  In retrospect the
vmbind case is kinda just shoehorned into the existing fxn.

I can type up this version if you have better things to do.

BR,
-R

> Fixes: 92395af63a99 ("drm/msm: Add VM_BIND submitqueue")
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  drivers/gpu/drm/msm/msm_gem_submit.c | 43 ++++++++++++----------------
>  1 file changed, 19 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/m=
sm_gem_submit.c
> index 5f8e939a5906..253347b6e328 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -276,46 +276,41 @@ static int submit_lock_objects(struct msm_gem_submi=
t *submit)
>  {
>         unsigned flags =3D DRM_EXEC_INTERRUPTIBLE_WAIT;
>         struct drm_exec *exec =3D &submit->exec;
> -       int ret;
> +       int ret =3D 0;
>
> -       if (msm_context_is_vmbind(submit->queue->ctx)) {
> +       if (msm_context_is_vmbind(submit->queue->ctx))
>                 flags |=3D DRM_EXEC_IGNORE_DUPLICATES;
>
> -               drm_exec_init(&submit->exec, flags, submit->nr_bos);
> +       drm_exec_init(&submit->exec, flags, submit->nr_bos);
>
> -               drm_exec_until_all_locked (&submit->exec) {
> +       drm_exec_until_all_locked (&submit->exec) {
> +               if (msm_context_is_vmbind(submit->queue->ctx)) {
>                         ret =3D drm_gpuvm_prepare_vm(submit->vm, exec, 1)=
;
>                         drm_exec_retry_on_contention(exec);
>                         if (ret)
> -                               return ret;
> +                               break;
>
>                         ret =3D drm_gpuvm_prepare_objects(submit->vm, exe=
c, 1);
>                         drm_exec_retry_on_contention(exec);
>                         if (ret)
> -                               return ret;
> -               }
> -
> -               return 0;
> -       }
> -
> -       drm_exec_init(&submit->exec, flags, submit->nr_bos);
> -
> -       drm_exec_until_all_locked (&submit->exec) {
> -               ret =3D drm_exec_lock_obj(&submit->exec,
> -                                       drm_gpuvm_resv_obj(submit->vm));
> -               drm_exec_retry_on_contention(&submit->exec);
> -               if (ret)
> -                       return ret;
> -               for (unsigned i =3D 0; i < submit->nr_bos; i++) {
> -                       struct drm_gem_object *obj =3D submit->bos[i].obj=
;
> -                       ret =3D drm_exec_prepare_obj(&submit->exec, obj, =
1);
> +                               break;
> +               } else {
> +                       ret =3D drm_exec_lock_obj(&submit->exec,
> +                                               drm_gpuvm_resv_obj(submit=
->vm));
>                         drm_exec_retry_on_contention(&submit->exec);
>                         if (ret)
> -                               return ret;
> +                               break;
> +                       for (unsigned i =3D 0; i < submit->nr_bos; i++) {
> +                               struct drm_gem_object *obj =3D submit->bo=
s[i].obj;
> +                               ret =3D drm_exec_prepare_obj(&submit->exe=
c, obj, 1);
> +                               drm_exec_retry_on_contention(&submit->exe=
c);
> +                               if (ret)
> +                                       break;
> +                       }
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

