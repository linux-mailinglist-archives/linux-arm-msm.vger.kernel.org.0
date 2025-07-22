Return-Path: <linux-arm-msm+bounces-66157-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B66A7B0E49E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 22:14:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 377081C24044
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 20:14:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80BC2285071;
	Tue, 22 Jul 2025 20:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="abEMxOQl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B911B28504F
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 20:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753215248; cv=none; b=atY2UN5mqrxtvbIQloVMNTGruDXwcSAmoqhmiFOaME/wsk3iOE8f5wo41J72bfx9xuc2SjQpAEBNSwag1VipEyYdXSK0S4CnEXvqF6siHAKsjQVxbjUpuGZzaDFHDHe+lVRSt8NOsbGW0DKquo1SkV5h77iihM5s+fAJuAfu/vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753215248; c=relaxed/simple;
	bh=nG3j+TKBEBa0wv2W3QoXKtILsgLTnZbud3R5SU9tZt0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tr5GsiEFUClPIy871ncJHpN8JYcwXMZlZexRHpNAT2Oebb3ei8/8zWuVgTwCxZ4gVGgKDFfW06VPUFuuyS6IoHrGBEPTpyv3a6nQgqT7OZFo8AZ/d8LmftN6aa8O9RS3XTZhxQOhtLDBWbvjpe7P8DfV0me1n8GvF/ZMJLdyog0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=abEMxOQl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MJJsbW016268
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 20:14:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=8stxXKOwM0cdX2+Hk7JZb+wP6e0PjVEkB1BIKQ6OkUU=; b=ab
	EMxOQlbIye5IyDYIVRYHKHyrh7d0fIUPvDupUlUSzKRJqQ2pKh0IUoYZw8fAqN9R
	fwF0uvNqCOMHssewh0YxGnzxy+OvtAVvj+oUwlCTSJzlhKdJCS1Ms+9a2XcQLOd7
	mK5vW7Qnk5gsXqP1tQJy2tNFbOQCQhh5Fmyl8D89I97h3f5eA7+M7ecwqO89uAJJ
	AzUHah4KylF1a9SUW4aVd2D5Pp/xvDzhdPt6dAU15H7coBQUwNpR7QFrNRJwNA2H
	7WwFz8y0FFW6VNfy7sBxpc7yDStp7Efj2eHzhtve0odiSO0VtVGDjh4nawq4EKnQ
	PYH9N43+QAjpYovmPXFg==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048s2u6t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 20:14:05 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-615b53266bfso3511795eaf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 13:14:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753215244; x=1753820044;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8stxXKOwM0cdX2+Hk7JZb+wP6e0PjVEkB1BIKQ6OkUU=;
        b=BZR7b463kx1BsfyM30847BMW2ypKNPpAI4LYbA9FS7PafGoAaHUq5hqrqvz9rpEmrb
         xFbEJbA/l1p4QPaBnIP4oAoio4ZchR89CqnikoxEz3bVnjwaIV1iYkhXEm2lbheR3yvb
         pQpGJ+mgdwsIVWURlpb7pzz9JK7P0iTIEqv/70rc0siomxV1JiY2FfUV0cZELTcjMnhU
         Mn24aXioJGGzfl71cEuaC6+c0rQd9fhApZ3pzPJe0TeGgEJ1PX1X600o4i2g0KqQCKw5
         le1uZ/JNdL/uSv/HM71JOyMcGz08ZR/lI4T4mo1Xn110jUYEUtuyeU+FK69ojbvlywcS
         Ahsw==
X-Forwarded-Encrypted: i=1; AJvYcCVeVMFV4+iRV64ymM0Th3HgQvdKyutqSTsX6dWvAXXBO91662jSUA7zCpdkj0i6L/cWMNZzotN6YRtpWOKa@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq/rmMe329BUEpzE4Wjnxsi4wDOAOfS7+iwdHRiPU0+fA1VS3m
	a2fm+ZTpIkJ8bIo/sh2hR/FfZgVmJnWJPBy7EXkd6zD+sro7HLV+5d7knAfPKqpmYsihhW44BhZ
	JG84FqEHHWgYRGc9dK8jnqSYjWE1O5Bl/8przD1/eSt3iOlt9lXjVN13wX8iD2yUR4fanU8mDIB
	1ouf14JgML60RdHjV06JKcy2W9IdqjuxTtYIw8QV1ve44=
X-Gm-Gg: ASbGncvaxNPm/4ufDygG8/aZzJIux+OBAGGokyKWeio1ZxNQ4xXhgQKxlebVM5ywRlH
	vTi637607cFyl1d5SJ52b4jyEfW3/n+J+OVgXhMoikySGyKi+ce31JtBygCJB4Ad2YF31wBRPhV
	tgQWhrhtpq2G58F2YXKA01AMxVIzihra8YMFxBMeLgaU3jq4YEX/ZT
X-Received: by 2002:a05:6820:a0b:b0:615:ac59:7613 with SMTP id 006d021491bc7-6187d8bb150mr216588eaf.5.1753215244317;
        Tue, 22 Jul 2025 13:14:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRLfuP1mZvVGnFE90xA1qN98KJGEEZE/W+UJS6YZQ2+JoDxvhTQ5iyKIyEb8QPf1XuzCh9CdlUZbBrwge/XuA=
X-Received: by 2002:a05:6820:a0b:b0:615:ac59:7613 with SMTP id
 006d021491bc7-6187d8bb150mr216565eaf.5.1753215243967; Tue, 22 Jul 2025
 13:14:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-12-9347aa5bcbd6@oss.qualcomm.com>
 <vng6tut4sv3zfbwogsb74omqsbqutpeskqdnezbs4ftsanqyb4@nv35r7mqmcva>
 <CACSVV01EhWWohUDQ8n=FQeDuaDcgmYnMBJDMJ8D1Gist1NR4QQ@mail.gmail.com> <800f8c9d-5586-46a7-aa83-dfb3b97633e0@oss.qualcomm.com>
In-Reply-To: <800f8c9d-5586-46a7-aa83-dfb3b97633e0@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 22 Jul 2025 13:13:53 -0700
X-Gm-Features: Ac12FXxPdajDniaWioq_6FbnrOl577Rcgtye0_PYpxo5MDWq0dAn_9MbJWgKs3E
Message-ID: <CACSVV00d4rbNDOLVZJTBNRmUsGyY6Tkwzv0cHRomeYyMXWHZVA@mail.gmail.com>
Subject: Re: [PATCH 12/17] drm/msm: Skip devfreq IDLE when possible
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDE3NCBTYWx0ZWRfXyOH7Xo6nuId8
 LMXw2hTywbH9X3ZGJ3wI9ctr4IOJVRQU9WCAxeOjLnnmw8PM/mOq+G+nP/mAOtJe0BNpzfDm7fk
 j3ComykLClXbDr49odJehrv+Rb5jT1DJMSyne00Nl9XEsPiQYcxURYnqyw/umASUcUKogS+k7a2
 XbgcO5EIR1V/fB1Vuucq7m2PE6eIhCL5N55qVgRTI0zvAhKVvr1LWSc7JY1jKmowAPZLTLp6dXO
 UFaLYNnsWjjmF63Lev33gqEinY1Y5VKu9ZLu7Feszv8ANIe/fgXjlUwo84RtlVivq8BbV6WWpA6
 VxHez/UTbTN4iAmumRaWewPN0+rq2pBjuvgFZaEaRsVDV1FCvEr5RI4sAvSbkNWSqxu/Xgv62cA
 v9ttlrNnLrs+fOWbfeX6R4tp7NvXxcZyvZqreqfMDMBNn9T8R67ZjMi8j0sWfFxKn/RoSPNm
X-Proofpoint-ORIG-GUID: BJQ1CddPOtcXr1vajR4ITOT8bUn3613D
X-Proofpoint-GUID: BJQ1CddPOtcXr1vajR4ITOT8bUn3613D
X-Authority-Analysis: v=2.4 cv=OPUn3TaB c=1 sm=1 tr=0 ts=687ff10d cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=DNA1iQAdpGljtBPL7O4A:9 a=QEXdDO2ut3YA:10
 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 mlxlogscore=999 lowpriorityscore=0 suspectscore=0
 spamscore=0 mlxscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507220174

On Tue, Jul 22, 2025 at 12:23=E2=80=AFPM Akhil P Oommen
<akhilpo@oss.qualcomm.com> wrote:
>
> On 7/22/2025 9:08 PM, Rob Clark wrote:
> > On Tue, Jul 22, 2025 at 6:50=E2=80=AFAM Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >>
> >> On Sun, Jul 20, 2025 at 05:46:13PM +0530, Akhil P Oommen wrote:
> >>> When IFPC is supported, devfreq idling is redundant and adds
> >>> unnecessary pm suspend/wake latency. So skip it when IFPC is
> >>> supported.
> >>
> >> With this in place we have a dummy devfreq instance which does nothing=
.
> >> Wouldn't it be better to skip registering devfreq if IFPC is supported
> >> on the platform?
> >
> > devfreq is still scaling the freq.  What is being bypassed is
> > essentially a CPU based version of IFPC (because on sc7180 we didn't
> > have IFPC
> >
> > Currently only a618 and 7c3 enable gpu_clamp_to_idle.. if at some
> > point those grew IFPC support we could remove the trickery to drop GPU
> > to min freq when it is idle altogether.
>
> There are 2 functionalities here:
> 1. Clamp-to-idle: enabled only on a618/7c3
> 2. boost-after-idle: Enabled for all GPUs.
>
> With this patch, we are skipping both when IFPC is supported. In the
> absence of latency due to clamp-to-idle, do you think a618 (relatively
> weaker GPU) would require boost-after-idle to keep with the
> UI/composition workload for its typical configuration (1080p@60hz)? If
> yes, I should probably create a quirk to disable boost-after-idle for
> premium tier GPUs, instead of tying it to IFPC feature.

Hmm, yeah.. I suppose _this_ patch should only skip clamp-to-idle.  It
is a different topic, boost-after-idle.

BR,
-R

> -Akhil.
>
> >
> > BR,
> > -R
> >
> >>>
> >>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> >>> ---
> >>>  drivers/gpu/drm/msm/msm_gpu_devfreq.c | 6 ++++++
> >>>  1 file changed, 6 insertions(+)
> >>>
> >>> diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/=
msm/msm_gpu_devfreq.c
> >>> index 2e1d5c3432728cde15d91f69da22bb915588fe86..53ef2add5047e7d6b6371=
af949cab36ce8409372 100644
> >>> --- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> >>> +++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> >>> @@ -4,6 +4,7 @@
> >>>   * Author: Rob Clark <robdclark@gmail.com>
> >>>   */
> >>>
> >>> +#include "adreno/adreno_gpu.h"
> >>>  #include "msm_gpu.h"
> >>>  #include "msm_gpu_trace.h"
> >>>
> >>> @@ -300,6 +301,8 @@ void msm_devfreq_active(struct msm_gpu *gpu)
> >>>       if (!has_devfreq(gpu))
> >>>               return;
> >>>
> >>> +     if (to_adreno_gpu(gpu)->info->quirks & ADRENO_QUIRK_IFPC)
> >>> +             return;
> >>>       /*
> >>>        * Cancel any pending transition to idle frequency:
> >>>        */
> >>> @@ -370,6 +373,9 @@ void msm_devfreq_idle(struct msm_gpu *gpu)
> >>>       if (!has_devfreq(gpu))
> >>>               return;
> >>>
> >>> +     if (to_adreno_gpu(gpu)->info->quirks & ADRENO_QUIRK_IFPC)
> >>> +             return;
> >>> +
> >>>       msm_hrtimer_queue_work(&df->idle_work, ms_to_ktime(1),
> >>>                              HRTIMER_MODE_REL);
> >>>  }
> >>>
> >>> --
> >>> 2.50.1
> >>>
> >>
> >> --
> >> With best wishes
> >> Dmitry
>

