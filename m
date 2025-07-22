Return-Path: <linux-arm-msm+bounces-66132-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 695E7B0E0B5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 17:38:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 158E6AC0BE7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 15:38:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAEFF279780;
	Tue, 22 Jul 2025 15:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DWBVwOIA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF7625C833
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 15:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753198712; cv=none; b=aaKO3Mx8HJLjtZUvbuZYjfmcxAc5oSnuLQRn9C11V0ObvelqNIxqAMrKbWmReJcLZR6clOu93LPqwb3ijwok3Uk7+Vw27hLH8LsVvT8mEnsLqb4wwOGlsuqMa4UFPDEeTrOf56eOypCI825PXP61yCPOqbCtc0DcwQl158tfnIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753198712; c=relaxed/simple;
	bh=Se1qNxd0/PJHDHrQnmbz978qyVDnEVYemj1tOhBLP/E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sJrw4eHWgTwBcTu5ISebczvYArMGm32f+KVI0yUy4coZ0lgHFG2HfoW0LmO8DHnjRkteTT/SSgmD11XNk6kYdEOQ/WgSeYlCN77ESd3eJu4QmuWDc7Zs9KRdH+lcr9SY5LZrGtBHAVRR4pS3RCOF+LyzuHsPiXa7xCC4rInyciQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DWBVwOIA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MEgAMG009366
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 15:38:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=5v7ZQEbIAiB0+2jIBiZJ/zlAz5qzyamJW6N+8IwXK2g=; b=DW
	BVwOIAfZamAYOhpztOGGNnXgLreZMfJCH5mBPagIOcmoQtv0nLI8Pa0HO0quJCLN
	6Wi5edUrWF31LX6kjoCOtQuQhE43+E0HUqaXGGKjot+d3RpcjeDgjnf4lxKYGK/J
	MlP643aCQbvi0Adpa3rW9FFu9ZiNWV06gvJGXWAwV96fJ65UGvl8y6WxC/IKl38u
	JDbG08GBvw5qD1ohkOR1YoJVUFd6qD9vS0dlCal0awFo4rMqfifnEVS9g45Gfbq3
	tpjwgde6iVAr6OIro43Q73w/4iatt9HgaWmod/QXC7tPo3x1ua6DEDlDm201eHMm
	OfX1PfU/HsHKvQzByM/w==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48045w0bwp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 15:38:28 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-41d9efce29cso4297783b6e.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 08:38:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753198708; x=1753803508;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5v7ZQEbIAiB0+2jIBiZJ/zlAz5qzyamJW6N+8IwXK2g=;
        b=J2IZeSVWePD6StYtvPVRL2FjaeyoWcM7TQEqkluLVueUnZ741Tox9LesYnLU7JD+iq
         wEGj+z4CCYmok3m0mpWNIVtHSXgr/ZAZCbL2Cherxs4r4MsYfC7pH3mn6YgZxx/0jcxM
         /OguE7OOxad3lZGA5xxEN5UEBwY/NFNvX/IgSIGh7ixIt/ySCN0Ohzz4qnrbcBNFPjA3
         du/os/5WRhB1VKNl7Z1bxVzGbRGF6JFU8Qu75YCsXRnY/O0qsUkwoneWr4XGsd5S8Mjs
         UhOvy5VagVIffpM993vYjLT9nIzBC+I2w6+2gHBW21W2iIcTqq2OZI6lTOIYxkne14j5
         wbNA==
X-Forwarded-Encrypted: i=1; AJvYcCXjMPUBLeAtKbn54tSLbTiPu6X0ZL/rHVTTbMerWLGmah4LnRtfhGkfYpQI2dR4pm+iICqMKSbC8FD4NzDQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyNZ3U2vHE/4J0JX65/MjHohzZHzawhKK2oc007zpCrYcpkf/IB
	YQ8gghVVIQMGmwBXNeDW7G4UE66qJbgsCxY6EdcEdFIDbobTTHmCBp8wVdQ9Ge+XCsn+5sudxVL
	vLngYbSFi9Ad3mj0NkTqQGKgOdSdtQBa0kbbMhmxwPT2jfrYVem4vIZ+UdlMJRmnq76Z2J8+n+1
	CSW49rA0ZvubhJBNT1QYndMOyvApBAOve88+9MzDAOsEQ=
X-Gm-Gg: ASbGnct8XSO/QztR1LZJr46tJNOcr2UtB4dXhH+bzkfkDj2TsL++YCrgENkTJGALIYD
	cz62G0fJggpkmX5bofhZNuwnTFoM/KjBFPl+NJr9/H8m44rCyEQx63+vjcjyLxedmxt2S6ZhP17
	JF7F/vZa2+g3qQ9DMCf7/o2eiMvk71MYfZt2XYFFE4Xf8EDv5lIReE
X-Received: by 2002:a05:6808:680a:b0:40b:2566:9569 with SMTP id 5614622812f47-41d04c92c9cmr13430201b6e.24.1753198707609;
        Tue, 22 Jul 2025 08:38:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1GJFYfKEf/2vfcM24SVmmRuQ+5KIZBxPBd7aDQfDJlhTZLhTkv+JowWe/tlkItYgNDaaLaguNHER2f1sJAMA=
X-Received: by 2002:a05:6808:680a:b0:40b:2566:9569 with SMTP id
 5614622812f47-41d04c92c9cmr13430177b6e.24.1753198707155; Tue, 22 Jul 2025
 08:38:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-12-9347aa5bcbd6@oss.qualcomm.com> <vng6tut4sv3zfbwogsb74omqsbqutpeskqdnezbs4ftsanqyb4@nv35r7mqmcva>
In-Reply-To: <vng6tut4sv3zfbwogsb74omqsbqutpeskqdnezbs4ftsanqyb4@nv35r7mqmcva>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 22 Jul 2025 08:38:16 -0700
X-Gm-Features: Ac12FXyqViKjRhthyqXadlDIINRduJGIQgMSW9SK6xnSnnCzfXGivfqsWQaTERE
Message-ID: <CACSVV01EhWWohUDQ8n=FQeDuaDcgmYnMBJDMJ8D1Gist1NR4QQ@mail.gmail.com>
Subject: Re: [PATCH 12/17] drm/msm: Skip devfreq IDLE when possible
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=LL1mQIW9 c=1 sm=1 tr=0 ts=687fb074 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=19W1w_CfSDR24Ta8X3MA:9 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-GUID: OBZzcl_T1n-nm6A6v-e-uoqV3zlQKqpG
X-Proofpoint-ORIG-GUID: OBZzcl_T1n-nm6A6v-e-uoqV3zlQKqpG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDEzMSBTYWx0ZWRfX4bNZcpUfJH15
 FlOqw+nPoDN/GY4PZUigQ9MjNZKFr4YRXDw8TRELL+uP94nNMVE/M06DtnB/MJKDs8ADNxsFXZL
 kRcLLLlSqoqK6AWgN4kUATgOAmubRJCH79VzX/3Njq9n+l5A7v2waU2RBn1m+LhG6HvgrgTtcdF
 yDg1dl3/vuXHJPGiG1Yelh/17yqqLby9SM1236brAPEZcwTIQfz6pRGmHEAntrqeQq7JD/vb8om
 9XU43BqP5UspVzwqfOPOU4b0HP1fThGsheEJej0dhr88OadfSFznIrGqmUAHRcjN+3U1t72IqLN
 pj8/yuOtAStTUAoRrxYorCiBpRImSMN5QtdETC3EswuH8LvLRVZ3d0gN891bWawkr+0PBIHYkbF
 O0o35l08G+MDAD+GeM7AGcO1NO0tAV7P+rvZWf1f+yl9P6Zy/Z/3sbLUm2O++LCC2u4zrLE1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxlogscore=999 clxscore=1015 mlxscore=0 adultscore=0
 suspectscore=0 spamscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220131

On Tue, Jul 22, 2025 at 6:50=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Sun, Jul 20, 2025 at 05:46:13PM +0530, Akhil P Oommen wrote:
> > When IFPC is supported, devfreq idling is redundant and adds
> > unnecessary pm suspend/wake latency. So skip it when IFPC is
> > supported.
>
> With this in place we have a dummy devfreq instance which does nothing.
> Wouldn't it be better to skip registering devfreq if IFPC is supported
> on the platform?

devfreq is still scaling the freq.  What is being bypassed is
essentially a CPU based version of IFPC (because on sc7180 we didn't
have IFPC

Currently only a618 and 7c3 enable gpu_clamp_to_idle.. if at some
point those grew IFPC support we could remove the trickery to drop GPU
to min freq when it is idle altogether.

BR,
-R

> >
> > Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/msm_gpu_devfreq.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/ms=
m/msm_gpu_devfreq.c
> > index 2e1d5c3432728cde15d91f69da22bb915588fe86..53ef2add5047e7d6b6371af=
949cab36ce8409372 100644
> > --- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> > +++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> > @@ -4,6 +4,7 @@
> >   * Author: Rob Clark <robdclark@gmail.com>
> >   */
> >
> > +#include "adreno/adreno_gpu.h"
> >  #include "msm_gpu.h"
> >  #include "msm_gpu_trace.h"
> >
> > @@ -300,6 +301,8 @@ void msm_devfreq_active(struct msm_gpu *gpu)
> >       if (!has_devfreq(gpu))
> >               return;
> >
> > +     if (to_adreno_gpu(gpu)->info->quirks & ADRENO_QUIRK_IFPC)
> > +             return;
> >       /*
> >        * Cancel any pending transition to idle frequency:
> >        */
> > @@ -370,6 +373,9 @@ void msm_devfreq_idle(struct msm_gpu *gpu)
> >       if (!has_devfreq(gpu))
> >               return;
> >
> > +     if (to_adreno_gpu(gpu)->info->quirks & ADRENO_QUIRK_IFPC)
> > +             return;
> > +
> >       msm_hrtimer_queue_work(&df->idle_work, ms_to_ktime(1),
> >                              HRTIMER_MODE_REL);
> >  }
> >
> > --
> > 2.50.1
> >
>
> --
> With best wishes
> Dmitry

