Return-Path: <linux-arm-msm+bounces-66270-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D97F2B0F0ED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 13:12:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E56C188444C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 11:12:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C04B1DF756;
	Wed, 23 Jul 2025 11:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UJdXaofc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79AC92D77EF
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 11:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753269120; cv=none; b=sY57vSZjjgVWqvWsa5slFZi1N1jJg+WTdDQVyvxoSvs/Z/9QL6ctbWgJHMBdTFtkaHyQzfzJ8uHizuzTPM60wFYEvDAbN9OiSe1/y8tEP1KZinM8PlbnL6iwWmWhgRtGtPo6og/FhrhQXNCf5nE6rVB/1McrQ+tXjVgnLIFehDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753269120; c=relaxed/simple;
	bh=hkdvBYSna1oG7Wdu8iY66NJUXKxJm4xL6CepgrPl/gA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=upUMAgmr+rcJTeeqp90RbrnH/k232oOHqKVxi2HihW78eNkWdIF1G34Q0BxkugVIXWCd0Sa6eNf7ms2/fmuc6p2zxQeR9GgsLJZJRFKKeKIqIaWPqFi0ufc7/sKCm4UAvqMTxWlQUa4L4SBmb7cODXIwfab72LFqLZB/MXPm3Ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UJdXaofc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N9UGVO007900
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 11:11:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j0VjeMPx+hhfBKfjETGJRw+SMh95RYSVHKRWrlXnn5U=; b=UJdXaofcZgDwAeKu
	407OxHvK8Hn4sEdJ/xm62+w+A/vqZJjj7WeKbRoDIKYBpH6yrBJ79INmCWRN/80H
	ZQiKvYfq7RnY9QSNnZpOSflOEXo85aHY/SxxUFxIIhsbUHhs8MOumIhNgU8JWR9h
	1K6fjbW9z4jH3vmktzwu61nA0KuCMCb+HxDbySZm4BcMVFWi04/zmBv0IDmKYY3z
	Nlrr1Zolhc610X7RjsFzLV+N7ph+fU4cQGUCai/dvfVeHiTJTi/ax9A3mMWH8Cd4
	bFU3MtqYgZPIxTDfJRI9pVGmpl71uwXOjBMiyxyQky6B/go1jjYinFO4R7eNdgTq
	FGgpXg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 482d3htxpd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 11:11:57 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7e269587d8eso1115475685a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 04:11:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753269116; x=1753873916;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j0VjeMPx+hhfBKfjETGJRw+SMh95RYSVHKRWrlXnn5U=;
        b=BNkQkeKgQVSVHZVPP/slKXAYNXTbTroA0gzySevpruXYTMibeBS8qwhgJTo2uQI21o
         7RYRSCuTpupExlyYvydbC4hRqj8lqknJYPRJl40jFSDDQiPOCkyXXzoSiUsR0yp7ayc/
         SM0jgm1mvL/iAZPUYEvYiQLNhK7nPHhSxSQdPB5G4ys9hjwWOf3PuCkBBCtZWZgYWZTK
         saWH30IADbJqITte4Gmiru1I1pJq52+B3jql++M/wqzy9k3C4/hYXK3fb1tNMU3Lsd1H
         NLVpEdh5QTMb91mGxGKx1tRBWIp610SWXXABLb/VTC4ARWsuAIG4eJ8dzTW0POoF5OJN
         ioUg==
X-Forwarded-Encrypted: i=1; AJvYcCUYU+4F19WE9H9jK23zsDJmWK2F2lIRA1Pt4tSdvqb8LUde+21cDgClIbOg3M8PUrlD5TtTxMyG0q/jKz7Q@vger.kernel.org
X-Gm-Message-State: AOJu0YwdAKzrbfQR2tFdXj/mRL+omMu1Mq2CUD/ykyqWEsoNDScNM0hT
	lEj7fqLdzOY6sSsIs5jNvHkL7HYseQcDIJAe/8gNAIm0JlmFS8YRsDU0GKzByQgrwUQV5dsl3xe
	uwhQw4iVEulkRi/aHNeTN5ZCaJ1wB4CiYIlgixwbVZJJ29l9NPZGm+QcMOYhrULKdBy1/
X-Gm-Gg: ASbGncv68skKG5XMjlrT1ZhL28R/S/7LdybTYsgjyVSh3HfuWnamVy0FicAVSmuKPLn
	GKWpPhPCB5JuMkEqcjOAyvWeNQZayjUGvbqc4slXB9KcjO0GYPep4JOYL/fYoi98iPpoMBialGP
	/PmFcZS64mjFMc8QhNxPPdidaelEGFpaXExC70vADULQkK2+XVi3rjGILsVBrUpMcgBJsqinD9u
	xhBdjh7rqjSJh1TbcpHnacqstGFyJEJN13AuOHnMqWKsCqInc3njvVDpA9ttCS3/fitVUThzXUQ
	RZNnfvPoD4fvaet3s6D3DdlxBm87iMto1/4fKhNz3bVnKLEnVAayUyPbbJQXsAE12yTHmRIVeT4
	gqjY0qSnjmigipKkLBLB9uykbBsa3U30e7fHafccpGufZ1Ww7jbNo
X-Received: by 2002:a05:6214:202e:b0:6fa:d9de:a3fc with SMTP id 6a1803df08f44-70700722b9bmr33142686d6.34.1753269115987;
        Wed, 23 Jul 2025 04:11:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFAliv5sNvk+3b+28VgVbpH434Z10+GwNfxjx4Yw8Dl6zlfkQH4ukDRejh6Shv9GMsLPiMb9Q==
X-Received: by 2002:a05:6214:202e:b0:6fa:d9de:a3fc with SMTP id 6a1803df08f44-70700722b9bmr33142086d6.34.1753269115418;
        Wed, 23 Jul 2025 04:11:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55a31d7c54asm2285330e87.100.2025.07.23.04.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 04:11:54 -0700 (PDT)
Date: Wed, 23 Jul 2025 14:11:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: rob.clark@oss.qualcomm.com, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/17] drm/msm/a6xx: Fix PDC sleep sequence
Message-ID: <rr6zxamm5oqebfc3zq7qzfjt327owlsjvh3todjzfzkqn6cd2b@sgsrdg7kfqa4>
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-5-9347aa5bcbd6@oss.qualcomm.com>
 <avni4utnzdmmafc2mf7aqgva3osbhuiqtia7gdngqswk5cmtn6@zo65ir7gyj6y>
 <CACSVV0346j2y-1Jkj=wasekYy5syax_E495AQZv0bvrrqwCSRw@mail.gmail.com>
 <f1070069-7220-4351-845a-2929d1e65a71@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f1070069-7220-4351-845a-2929d1e65a71@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=G8UcE8k5 c=1 sm=1 tr=0 ts=6880c37d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=wNNrqZBiHP9T-vZZJccA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDA5NCBTYWx0ZWRfX+grVRv5Fzfd2
 D/9DIYapdfr+B5wNn1l9Zrv7Qx3YX+R/kXMELaxiVpylck4u7ubRVla+S1oZQq7tWNcz7lCycr3
 JVatdV6sKrNX0w0e07g8PIbtt2fgI/gaXwrRjKGXAmvEaKhmLYbuNEJBKHtx6+DSstRMp3Z08Ym
 JDWvAPXh6WANRlYkrpebZEzZPHW+oC/Pu8G1X55m5hm+Fw9dKW/BtLY6qslvg5bDuZau0sL4V4O
 u5I3S+BeoZjWMs9k2xbybQpjODa8A0AptbpuhgbyPEyunbZcR+/STCZohHFxoBO0zzZ69sW5FrY
 REWZ0KSI4ZUAe8xDunSr8zMPYIgnfWskjCX38shQ8lf7sIYS8KU6e05j0PBS3KNKxLZgA8JAjCJ
 WRc/JyP0EFRo+7YVlnwhTvfXy15U9phfmUuI13ICEFXJPZfctOkJBefpEzYjuGBaqX7VNlnP
X-Proofpoint-GUID: GRl_lAHwwrvP558n8_D8eXrntbiEjAJC
X-Proofpoint-ORIG-GUID: GRl_lAHwwrvP558n8_D8eXrntbiEjAJC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=999 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230094

On Wed, Jul 23, 2025 at 02:35:31AM +0530, Akhil P Oommen wrote:
> On 7/22/2025 10:56 PM, Rob Clark wrote:
> > On Tue, Jul 22, 2025 at 6:33 AM Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >>
> >> On Sun, Jul 20, 2025 at 05:46:06PM +0530, Akhil P Oommen wrote:
> >>> Since the PDC resides out of the GPU subsystem and cannot be reset in
> >>> case it enters bad state, utmost care must be taken to trigger the PDC
> >>> wake/sleep routines in the correct order.
> >>>
> >>> The PDC wake sequence can be exercised only after a PDC sleep sequence.
> >>> Additionally, GMU firmware should initialize a few registers before the
> >>> KMD can trigger a PDC sleep sequence. So PDC sleep can't be done if the
> >>
> >> s/KMD/the driver/
> > 
> > IMHO for gpu things "KMD" makes sense, to differentiate between kernel
> > and user mode (UMD).. this is perhaps different from other areas where
> > there isn't a userspace component to the driver stack
> 
> Ack
> 
> > 
> > BR,
> > -R
> > 
> >>> GMU firmware has not initialized. Track these dependencies using a new
> >>> status variable and trigger PDC sleep/wake sequences appropriately.
> >>
> >> Again, it looks like there should be a Fixes tag here.
> 
> Ack. I guess it is not a bad idea to backport this one too.

Please add cc:stable to the patches that need to be backported and make
sure that all Fixes are at the start of the series.

> 
> >>
> >>>
> >>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> >>> ---
> >>>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 30 +++++++++++++++++++-----------
> >>>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  6 ++++++
> >>>  2 files changed, 25 insertions(+), 11 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> >>> index 3bebb6dd7059782ceca29f2efd2acee24d3fc930..4d6c70735e0892ed87d6a68d64f24bda844e5e16 100644
> >>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> >>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> >>> @@ -279,6 +279,8 @@ static int a6xx_gmu_start(struct a6xx_gmu *gmu)
> >>>       if (ret)
> >>>               DRM_DEV_ERROR(gmu->dev, "GMU firmware initialization timed out\n");
> >>>
> >>> +     set_bit(GMU_STATUS_FW_START, &gmu->status);
> >>> +
> >>>       return ret;
> >>>  }
> >>>
> >>> @@ -528,6 +530,9 @@ static int a6xx_rpmh_start(struct a6xx_gmu *gmu)
> >>>       int ret;
> >>>       u32 val;
> >>>
> >>> +     if (!test_and_clear_bit(GMU_STATUS_PDC_SLEEP, &gmu->status))
> >>> +             return 0;
> >>> +
> >>>       gmu_write(gmu, REG_A6XX_GMU_RSCC_CONTROL_REQ, BIT(1));
> >>>
> >>>       ret = gmu_poll_timeout(gmu, REG_A6XX_GMU_RSCC_CONTROL_ACK, val,
> >>> @@ -555,6 +560,11 @@ static void a6xx_rpmh_stop(struct a6xx_gmu *gmu)
> >>>       int ret;
> >>>       u32 val;
> >>>
> >>> +     if (test_and_clear_bit(GMU_STATUS_FW_START, &gmu->status))
> >>> +             return;
> >>> +
> >>> +     /* TODO: should we skip if IFPC is not enabled */
> >>
> >> Is this a question or a statement?
> 
> It was a reminder to myself which I forgot to revisit later. Will
> addresss this in the next revision.
> 
> -Akhil.
> 
> >>
> >>> +
> >>>       gmu_write(gmu, REG_A6XX_GMU_RSCC_CONTROL_REQ, 1);
> >>>
> >>>       ret = gmu_poll_timeout_rscc(gmu, REG_A6XX_GPU_RSCC_RSC_STATUS0_DRV0,
> >>> @@ -563,6 +573,8 @@ static void a6xx_rpmh_stop(struct a6xx_gmu *gmu)
> >>>               DRM_DEV_ERROR(gmu->dev, "Unable to power off the GPU RSC\n");
> >>>
> >>>       gmu_write(gmu, REG_A6XX_GMU_RSCC_CONTROL_REQ, 0);
> >>> +
> >>> +     set_bit(GMU_STATUS_PDC_SLEEP, &gmu->status);
> >>>  }
> >>>
> >>>  static inline void pdc_write(void __iomem *ptr, u32 offset, u32 value)
> >>> @@ -691,8 +703,6 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
> >>>       /* ensure no writes happen before the uCode is fully written */
> >>>       wmb();
> >>>
> >>> -     a6xx_rpmh_stop(gmu);
> >>> -
> >>>  err:
> >>>       if (!IS_ERR_OR_NULL(pdcptr))
> >>>               iounmap(pdcptr);
> >>> @@ -852,19 +862,15 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
> >>>       else
> >>>               gmu_write(gmu, REG_A6XX_GMU_GENERAL_7, 1);
> >>>
> >>> -     if (state == GMU_WARM_BOOT) {
> >>> -             ret = a6xx_rpmh_start(gmu);
> >>> -             if (ret)
> >>> -                     return ret;
> >>> -     } else {
> >>> +     ret = a6xx_rpmh_start(gmu);
> >>> +     if (ret)
> >>> +             return ret;
> >>> +
> >>> +     if (state == GMU_COLD_BOOT) {
> >>>               if (WARN(!adreno_gpu->fw[ADRENO_FW_GMU],
> >>>                       "GMU firmware is not loaded\n"))
> >>>                       return -ENOENT;
> >>>
> >>> -             ret = a6xx_rpmh_start(gmu);
> >>> -             if (ret)
> >>> -                     return ret;
> >>> -
> >>>               ret = a6xx_gmu_fw_load(gmu);
> >>>               if (ret)
> >>>                       return ret;
> >>> @@ -1046,6 +1052,8 @@ static void a6xx_gmu_force_off(struct a6xx_gmu *gmu)
> >>>
> >>>       /* Reset GPU core blocks */
> >>>       a6xx_gpu_sw_reset(gpu, true);
> >>> +
> >>> +     a6xx_rpmh_stop(gmu);
> >>>  }
> >>>
> >>>  static void a6xx_gmu_set_initial_freq(struct msm_gpu *gpu, struct a6xx_gmu *gmu)
> >>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> >>> index b2d4489b40249b1916ab4a42c89e3f4bdc5c4af9..034f1b4e5a3fb9cd601bfbe6d06d64e5ace3b6e7 100644
> >>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> >>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> >>> @@ -117,6 +117,12 @@ struct a6xx_gmu {
> >>>
> >>>       struct qmp *qmp;
> >>>       struct a6xx_hfi_msg_bw_table *bw_table;
> >>> +
> >>> +/* To check if we can trigger sleep seq at PDC. Cleared in a6xx_rpmh_stop() */
> >>> +#define GMU_STATUS_FW_START  0
> >>> +/* To track if PDC sleep seq was done */
> >>> +#define GMU_STATUS_PDC_SLEEP 1
> >>> +     unsigned long status;
> >>>  };
> >>>
> >>>  static inline u32 gmu_read(struct a6xx_gmu *gmu, u32 offset)
> >>>
> >>> --
> >>> 2.50.1
> >>>
> >>
> >> --
> >> With best wishes
> >> Dmitry
> 

-- 
With best wishes
Dmitry

