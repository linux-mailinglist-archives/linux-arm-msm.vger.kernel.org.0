Return-Path: <linux-arm-msm+bounces-68158-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D47D9B1F2BF
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 09:09:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CEC8E561D68
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 07:09:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19B5D202F65;
	Sat,  9 Aug 2025 07:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LCOAK239"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BE9275AED
	for <linux-arm-msm@vger.kernel.org>; Sat,  9 Aug 2025 07:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754723333; cv=none; b=QcoPqcuxHtWhW+KVi/TW0J9KaQDufl1dUuCRDSploaZigEit0lhmKgSY6OcGGLK4wfxe/wFuXxL5eck35oNy2me7Nke9FLE6pAZc1gLs0hJita81dQx/4PBhvQKvv19Fci9pwVRxeDqGT20oIghn0FDwO956kKSu7tSjt6L9yQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754723333; c=relaxed/simple;
	bh=V0FOk+/4CYmA2QmJysBtDIECntIMdzGMQhyW5Qi9l1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PFupIa3CsnIHf1IWHaxWbFDglBKcjUGvBFVOkpguSBZfKdD97/zn9yIhaUGG/bXiKhQHpJd6101qf0X/r/mtPsUPDBgj2pOI9sEofXAMnAoJYPXrZH+ta2zBJuVr/SYC5sSPmhyZu96RLn3M/nv0ppBv1FTmrRX5y9Gj5WwPn+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LCOAK239; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5794tTqb021356
	for <linux-arm-msm@vger.kernel.org>; Sat, 9 Aug 2025 07:08:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1bsHJYnJmFvom+9HtBvTOjPh
	UjVkGPYSuK9wLv+UdRE=; b=LCOAK2390Ji3B2txb8jPNckHXkCWed6zqhefftUK
	bD5YaGapCahCvYaTMU8VxaunTCl009NbjBlOCtyXn4m9DU1FI9+/l4cFBprpipsX
	jUfL6PQGHBFZEzTJ1bWEer4rNFFbjOfiZcOXXwvXCiZkSnaQKQw33z+Ds30Q/35h
	0OJyALAL1S/GGZe8UNVE09Tpf9nMLxD9EfD0pfIMMJpEoMSEbzV+Cwd4WnaSxaf/
	s8aZ4XMC/lhBtpD4OKzo/yRh8COM4FjLwL1+vXOP877YIYx4HGMoyZIOajr6wBix
	ya9T67lt1Fkr3mC2XF0uH20Urx6qbnTJ4cH148zZxvPt4A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dw9sgbcf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 09 Aug 2025 07:08:50 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b08a2b3e83so79938251cf.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 09 Aug 2025 00:08:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754723329; x=1755328129;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1bsHJYnJmFvom+9HtBvTOjPhUjVkGPYSuK9wLv+UdRE=;
        b=wMAfyavmaG3IFivJNvUoWLP1IHBuHjIWO8EyHwZEv75DKFf/fKetKr3uXRilStlIKW
         dRT73UIUuvz+bCcfAJ3ww0u1CDY2w4NE8FFg06DHjI7ZXYyRwyd12/9O/fAZ/OUDa2QV
         X0a9MT5ORlEY4iuM2G8BIQYrwvlWP8CtXmJu1+MHGf4sxpFO1ogFvkO/WkOZoSXUJUKg
         sx1cqC1jo2NVrtLmpzACfpXvG7citfJKywYASoIKJuKIacNB+PzkJgohHm1iqe/N52u3
         dMde4OmYbQHQ3t7vte1sKASlp5YxJXkAC+mEDLlj79a/aH5oeFuf5gJHP9t/Enjr4cNL
         WH0g==
X-Forwarded-Encrypted: i=1; AJvYcCWVk8pXiwUTg4tgOfBY8tYhmILEptmsnN7bkx6KJjzy0SkoxlmzxI9SbzpLQv7OlrAKF2DCydTuJTQ89mp7@vger.kernel.org
X-Gm-Message-State: AOJu0YwYGiyoV++O/qwf8YxWPi2h6AdnQyOmh3Rtd7N05tF1IMf7pWPJ
	SzLmP/OgDqQL5HR/j/FqExVYYSUH0RYIcD4zZwjyFdLTP3tBn43BzXzQGht5VGlVIDH62kU3mvl
	cWRVnr9Bg6IOYh6dt9Eo6EsRQNdh6bUF4KPJ/Ho0ZUXOooi3MDtxrFRTUd4L84jXBBXu+
X-Gm-Gg: ASbGncsTNXilNYjahTXtTFcGHFRr6NGMMYUxsx2fEb4yxcDIag+/wkBhCi6RC0toPao
	uF6PN7DN/i8p0q0iq92qPZKU2WqhxC8TMLNESW+OICI641qtgqJliSikE39flDtjaj2XNEZl5UA
	Xx9khiIlaFUlL03QvZrJHcwxlyw1lE/s/6a71+CJRdLmkDFG9ocF5NhLD9eonJMsaC/d8sJA3yn
	wBLM+sxJe6GMN3JeuFdeVH5wu3pPPAVCpFFZOutWg56lhvD4dtYdg4Kx/rak1+D1YG3k4lczZjX
	NkHfWLBHLZFLFkETuFp6s24R6dTL01H4wWGKwLN7zWPHvBD1+wHSZEQ8hl1w9SCdUMtuYkUZvaP
	Y383QXeoUiLPAx3PMHk8e1oT2USQgex0kVq669dlNB1doZxCtaBvs
X-Received: by 2002:a05:622a:130e:b0:4af:22a7:7f28 with SMTP id d75a77b69052e-4b0aee5a5f9mr89036431cf.55.1754723329081;
        Sat, 09 Aug 2025 00:08:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFd77jpE87+TbXeQWe379IfpTrsjh4cN7UjqdULffX0AnSqtEs8zUbIXZlkMRkW/x5/6Zjgw==
X-Received: by 2002:a05:622a:130e:b0:4af:22a7:7f28 with SMTP id d75a77b69052e-4b0aee5a5f9mr89035981cf.55.1754723328489;
        Sat, 09 Aug 2025 00:08:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b88c98ab8sm3277301e87.79.2025.08.09.00.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Aug 2025 00:08:46 -0700 (PDT)
Date: Sat, 9 Aug 2025 10:08:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Yongxing Mou <quic_yongmou@quicinc.com>
Subject: Re: [PATCH v2 08/12] drm/msm/dp: Drop event waitqueue
Message-ID: <yqgfdii3fk3kcwdcvbl2bv4bt4yitu2fl2gvjpp6xncv3tdgl4@266uq3yejcll>
References: <20250808-hpd-refactor-v2-0-7f4e1e741aa3@oss.qualcomm.com>
 <20250808-hpd-refactor-v2-8-7f4e1e741aa3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250808-hpd-refactor-v2-8-7f4e1e741aa3@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=J+Wq7BnS c=1 sm=1 tr=0 ts=6896f402 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=3asoBNdhdsPQsZxcHcwA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: tDev0Dr2Bo0ZZEzKgr8wr0m70w0Sv0Iv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxNSBTYWx0ZWRfX7Km0i2CNVj6i
 BJPE9ql3SDuQfCs489NaYAnSTfwWzLJyz2TtGhl22aEJUCRWMdIYGyv+iW8R5sJCEDwkWGKKteg
 RAmSloB1BAXP54D4q1OlInkAqYTs36ALVBtlaPFxk2wsSbW/C3xDDY5jppCNvEsqvA6Zz2z7v+A
 W8NMrv0SZI6xZz5iChRhgXYrkLn5LqhGtLANnm7+Z91MtjSOldyav/H5l5d0Ws0hvTjpibMPN3c
 eH6Vg2SvdzisPQWpyUOYOhtPkzT/+I02OxUmVLS6aS/UJ4Dy2XNHhbSd+nMUt70v8o/AhviDVfh
 k9zX8F9kFdDtaVQJz4xgVgqM0DO1mCXYNadUVajh1Tgas73CKmu/F3NH4zbBWFivkYFrViZv33G
 th7rZOrN
X-Proofpoint-GUID: tDev0Dr2Bo0ZZEzKgr8wr0m70w0Sv0Iv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-09_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090015

On Fri, Aug 08, 2025 at 05:35:20PM -0700, Jessica Zhang wrote:
> Since the HPD IRQ handler directly notifies DRM core for hotplug events,
> there is no need to maintain a separate event waitqueue.
> 
> Drop the event waitqueue and all related structs and helpers.
> 
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 255 +-----------------------------------
>  1 file changed, 7 insertions(+), 248 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index b9e2e368c4a8..eabd6e6981fb 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -52,27 +52,6 @@ enum {
>  	ST_DISPLAY_OFF,
>  };
>  
> -enum {
> -	EV_NO_EVENT,
> -	/* hpd events */
> -	EV_HPD_PLUG_INT,
> -	EV_IRQ_HPD_INT,
> -	EV_HPD_UNPLUG_INT,
> -};
> -
> -#define EVENT_TIMEOUT	(HZ/10)	/* 100ms */
> -#define DP_EVENT_Q_MAX	8
> -
> -#define DP_TIMEOUT_NONE		0
> -
> -#define WAIT_FOR_RESUME_TIMEOUT_JIFFIES (HZ / 2)
> -
> -struct msm_dp_event {
> -	u32 event_id;
> -	u32 data;
> -	u32 delay;
> -};
> -
>  struct msm_dp_display_private {
>  	int irq;
>  
> @@ -100,16 +79,7 @@ struct msm_dp_display_private {
>  	spinlock_t irq_thread_lock;
>  	u32 hpd_isr_status;
>  
> -	/* event related only access by event thread */
> -	struct mutex event_mutex;
> -	wait_queue_head_t event_q;
>  	u32 hpd_state;
> -	u32 event_pndx;
> -	u32 event_gndx;
> -	struct task_struct *ev_tsk;
> -	struct msm_dp_event event_list[DP_EVENT_Q_MAX];
> -	spinlock_t event_lock;
> -
>  	bool wide_bus_supported;
>  
>  	struct msm_dp_audio *audio;
> @@ -212,60 +182,6 @@ static struct msm_dp_display_private *dev_get_dp_display_private(struct device *
>  	return container_of(dp, struct msm_dp_display_private, msm_dp_display);
>  }
>  
> -static int msm_dp_add_event(struct msm_dp_display_private *msm_dp_priv, u32 event,
> -						u32 data, u32 delay)
> -{
> -	unsigned long flag;
> -	struct msm_dp_event *todo;
> -	int pndx;
> -
> -	spin_lock_irqsave(&msm_dp_priv->event_lock, flag);
> -	pndx = msm_dp_priv->event_pndx + 1;
> -	pndx %= DP_EVENT_Q_MAX;
> -	if (pndx == msm_dp_priv->event_gndx) {
> -		pr_err("event_q is full: pndx=%d gndx=%d\n",
> -			msm_dp_priv->event_pndx, msm_dp_priv->event_gndx);
> -		spin_unlock_irqrestore(&msm_dp_priv->event_lock, flag);
> -		return -EPERM;
> -	}
> -	todo = &msm_dp_priv->event_list[msm_dp_priv->event_pndx++];
> -	msm_dp_priv->event_pndx %= DP_EVENT_Q_MAX;
> -	todo->event_id = event;
> -	todo->data = data;
> -	todo->delay = delay;
> -	wake_up(&msm_dp_priv->event_q);
> -	spin_unlock_irqrestore(&msm_dp_priv->event_lock, flag);
> -
> -	return 0;
> -}
> -
> -static int msm_dp_del_event(struct msm_dp_display_private *msm_dp_priv, u32 event)
> -{
> -	unsigned long flag;
> -	struct msm_dp_event *todo;
> -	u32	gndx;
> -
> -	spin_lock_irqsave(&msm_dp_priv->event_lock, flag);
> -	if (msm_dp_priv->event_pndx == msm_dp_priv->event_gndx) {
> -		spin_unlock_irqrestore(&msm_dp_priv->event_lock, flag);
> -		return -ENOENT;
> -	}
> -
> -	gndx = msm_dp_priv->event_gndx;
> -	while (msm_dp_priv->event_pndx != gndx) {
> -		todo = &msm_dp_priv->event_list[gndx];
> -		if (todo->event_id == event) {
> -			todo->event_id = EV_NO_EVENT;	/* deleted */
> -			todo->delay = 0;
> -		}
> -		gndx++;
> -		gndx %= DP_EVENT_Q_MAX;
> -	}
> -	spin_unlock_irqrestore(&msm_dp_priv->event_lock, flag);
> -
> -	return 0;
> -}
> -
>  void msm_dp_display_signal_audio_start(struct msm_dp *msm_dp_display)
>  {
>  	struct msm_dp_display_private *dp;
> @@ -284,8 +200,6 @@ void msm_dp_display_signal_audio_complete(struct msm_dp *msm_dp_display)
>  	complete_all(&dp->audio_comp);
>  }
>  
> -static int msm_dp_hpd_event_thread_start(struct msm_dp_display_private *msm_dp_priv);
> -
>  static int msm_dp_display_bind(struct device *dev, struct device *master,
>  			   void *data)
>  {
> @@ -305,12 +219,6 @@ static int msm_dp_display_bind(struct device *dev, struct device *master,
>  		goto end;
>  	}
>  
> -	rc = msm_dp_hpd_event_thread_start(dp);
> -	if (rc) {
> -		DRM_ERROR("Event thread create failed\n");
> -		goto end;
> -	}
> -
>  	return 0;
>  end:
>  	return rc;
> @@ -322,8 +230,6 @@ static void msm_dp_display_unbind(struct device *dev, struct device *master,
>  	struct msm_dp_display_private *dp = dev_get_dp_display_private(dev);
>  	struct msm_drm_private *priv = dev_get_drvdata(master);
>  
> -	kthread_stop(dp->ev_tsk);
> -
>  	of_dp_aux_depopulate_bus(dp->aux);
>  
>  	msm_dp_aux_unregister(dp->aux);
> @@ -585,33 +491,22 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp, u32 data)
>  
>  	msm_dp_aux_enable_xfers(dp->aux, true);
>  
> -	mutex_lock(&dp->event_mutex);

I think the event_mutex should be kept as is. Otherwise we don't have
protection against delivering the next event while we still process the
previous one.

> -
>  	state =  dp->hpd_state;
>  	drm_dbg_dp(dp->drm_dev, "Before, type=%d hpd_state=%d\n",
>  			dp->msm_dp_display.connector_type, state);
>  

-- 
With best wishes
Dmitry

