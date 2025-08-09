Return-Path: <linux-arm-msm+bounces-68157-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1965EB1F2B3
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 09:05:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8BBD74E0246
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 07:05:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 399CE14F125;
	Sat,  9 Aug 2025 07:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Iko2mYdc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46959E56A
	for <linux-arm-msm@vger.kernel.org>; Sat,  9 Aug 2025 07:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754723111; cv=none; b=QMyyipP5iR6goNxI8bhxe7O/xXonc6cOZL6xgjAcdB1FQJKC+ycMB19FzJRmb4o4wu7Yn/+eND/WKC4U8zydeFa7ZzIKPkkOAhh5rPWsFsaDoA4LlyVboW0AWA+VUwp1+ib2G3lPzBbaFDGJaxVH9SUHGLdRVyYElz5HxD+pKtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754723111; c=relaxed/simple;
	bh=sYTSmcJkotvTu7QZEe4XTS5l8zwe6QRkj63he5GVBp8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uJDUzQpeaEH+QQ/CjfxDWKNckU8Epu9BG+F+zPn8rsYrzlOuPfilGEzAjV6o9Nls2Vct5mQgaH3lceRR8kYEK+3VpIqR2hLnSxh4JVS5sIuhB3080/CLtldFnVABTwK2cxbWS3V9+uE+Lh0ZJv3JrRwzaKD10CUmIpcIhfaT0lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Iko2mYdc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5793V8Bn003579
	for <linux-arm-msm@vger.kernel.org>; Sat, 9 Aug 2025 07:05:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IdFPyk/N0CqFnry8GnZ1yS0v
	H+o/NnXQEhDzbjaO9KM=; b=Iko2mYdcetNqFKayH5eT3RdzEPnJG/nYw8E3uM2r
	OUMObJ0dH/D154RKzggug591bnw+OQYMyDvFjCNwA+hjZ3TJjStenuZC2Z0gr51N
	o6u3VQ7xHPPky5ppQO+0OXu5V4cyYhcs63KsvNvz9IQl9Gkou3fvL8zm0rjsUloN
	RxVS0ijVhth2DS5yeFTTAyP8eJJiQhroMQhnujjiOSHmw1qO2PgUJ4zyeeBvKpaN
	DO2YPITuNPnMkc/6Lnn3yy0EChKLV7uCAuH18mQdd8EK/6wVwNtQy83J1B5hmf3/
	uYk1r65W7jtBsA093zmoba8lOS7gZ+RzFIt/+ITSpg+zuQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dwb70agu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 09 Aug 2025 07:05:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7e7ffe84278so563989685a.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 09 Aug 2025 00:05:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754723107; x=1755327907;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IdFPyk/N0CqFnry8GnZ1yS0vH+o/NnXQEhDzbjaO9KM=;
        b=TrR0mxwvg9phRIa29lSgFMvoZXcLcXrhS4zFuWd6irelj8hX3mv42hPiMTAk53FPot
         x9V3bpQD2A5fXY+xdCuOfcbWJks5q3GwXoe3eqkzH4dyL9qj93NjYpr+0eCOyxEmATF6
         GOtr7bQdcyx0oOxAni5mY1QRVUDpykNm/0NYjQEmpG7A1XT2ZGJBcpgUhV7aO5wXJeCo
         YhK/RXxMvSKHK0qGWt/lKL454/e0k3mBuJH3IPaIN25Ve0YUNAWl+SpIG2T5liTPOYYf
         10TxiyDM7ruJ8D2UzfM9N5aWI8efPnLrgmDKLC5oTrQ8pnnrEY3/bLDWCPMHa1uvXpjn
         YKQA==
X-Forwarded-Encrypted: i=1; AJvYcCWdGev1eywJ7jqkfXzXhprFhMthFr2pSrUk55GSblOQF83uDbusm2+qBSnurFMBhRLbKoQGo9RjoQesYbZW@vger.kernel.org
X-Gm-Message-State: AOJu0YwysGxrMtQdipZJqh1sjQLErlbYj4tRh5jpf43cjS/KHMqfIgfp
	oWX8DNrJ6sptb8w3GTcs7JHrflcgIEnoJC/lgoc2/D2PRw64/g3GUvzLv28AKhp4EjuZEtRaFID
	V/pMo4oJ+Hl+jzeujoV0C3Mm3QMbeAI5R7jonJQZ4LrLWled7oRx13+M654T7wnRmhGOe
X-Gm-Gg: ASbGncvWsAAu54/Gl671IbNCx87Q3p+Auja3VHmtFUv6IXWOI9EOpC8IdzWxb+CNIIy
	wlZQZ8iFl0Gfh4lyEfHKjdBxyA6MN2gEvS4rlTNl4r7ExkhpXJYN14JwtjFy0IGY97TCEloKfZ1
	1M/Btjxx4lAmxyeLt5N5QcBlhrAzKx0Kj//UM/mqsAFvTZAdQCR+rj7rMPCSfDVYxGq4pJOAg+D
	xnnTB83vxkt60jjd2QIIw8c+/Ciq3LMiEXbRM/4dMwHKneKm6aaeMVpLCpsuMeCAdV4UKQYfHdM
	zBbZCBo6ogBhG3LgaAPsmALkq1rXS2PgaYYZ4/PRKpuGESViH2BMc1uUS29V6QNNbwS3IOMh0G6
	UTNdd6GH/dXo/uM/oefhMEQY2l1VWS4CgDDRrPmcueeQlBCW4ee6A
X-Received: by 2002:a05:622a:19a2:b0:4b0:6bbd:d308 with SMTP id d75a77b69052e-4b0aedd8496mr80508841cf.28.1754723107130;
        Sat, 09 Aug 2025 00:05:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IElD8QkE3zUFgI76VPbPQqM6aKAIc4EivMafbCs3REjKQy/hcieyPP9hwVpo8pvPQk5cyycMw==
X-Received: by 2002:a05:622a:19a2:b0:4b0:6bbd:d308 with SMTP id d75a77b69052e-4b0aedd8496mr80508451cf.28.1754723106513;
        Sat, 09 Aug 2025 00:05:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b88ca40f8sm3336245e87.139.2025.08.09.00.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Aug 2025 00:05:05 -0700 (PDT)
Date: Sat, 9 Aug 2025 10:05:03 +0300
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
Subject: Re: [PATCH v2 07/12] drm/msm/dp: Handle internal HPD IRQ in
 hpd_notify()
Message-ID: <qxb2tqsnrjybml3iiarndqiov7qczdaubzckghzeyr7urnq7i4@lupcydmgxrqq>
References: <20250808-hpd-refactor-v2-0-7f4e1e741aa3@oss.qualcomm.com>
 <20250808-hpd-refactor-v2-7-7f4e1e741aa3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250808-hpd-refactor-v2-7-7f4e1e741aa3@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=K6oiHzWI c=1 sm=1 tr=0 ts=6896f324 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=3-P-7CXywdz3aMBc3EMA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: syPizCVJXGU44MMbDK41Xb0M-3tGNgs0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxMyBTYWx0ZWRfX81vN7NC3s22E
 HwV4emKHe581xkwqx6+iu9Uvw1Q/sl2ULUswye1ttSdUwiQGO+A5Y1MLjWpPbxS5OgZyZu+/s1U
 T58jM+Wiudzfbh/phpg2MSn5uhhQi5jc/Kmcdue2UBl3zm2mmPtyGlmz6+JV3HbHhNDbkJdNI5x
 5zoRMxo9cdZy/m489JDpZN1L29FaSZZgFTyKDwggYhMJ0XiF8MKVVt+S2HQrxJc92yWCDpqncQF
 Yl9nUbnqFvJZ3Unetmqmea6DydsVq3e4r/mECWS+3zxA5Mahu+oqdGqTrNv9ROf+vCDVLChNE7Z
 nywfQNuDqHh00SZPq0xgEDSvyJcHxvaVg9y+UpwOGmwA/oOXil7/sAmpgLa640xSlgffCwm82eg
 +fqtrNGS
X-Proofpoint-ORIG-GUID: syPizCVJXGU44MMbDK41Xb0M-3tGNgs0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-09_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508090013

On Fri, Aug 08, 2025 at 05:35:19PM -0700, Jessica Zhang wrote:
> Switch to using a threaded IRQ to handle HPD IRQ events and moving
> handling of internal HPD IRQ events to hpd_notify().
> 
> This will simplify the handling of HPD events by unifying the handling
> of both external and internal HPD events in hpd_notify(). Also, having
> internal HPD IRQ use the DRM framework calls removes the need for msm_dp
> to track the HPD state internally.

You should describe, why are you splitting the handler into two parts
rather than just moving existing handler to be a threaded handler.

> 
> Note: The setting of linked ready is moved out of
> *_send_hpd_notification() as it should only be set after the plug/unplug
> handling has been completed.

Unrelated

> 
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 127 +++++++++++++++++++++++++-----------
>  1 file changed, 90 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 8779bcd1b27c..b9e2e368c4a8 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -96,6 +96,10 @@ struct msm_dp_display_private {
>  	/* wait for audio signaling */
>  	struct completion audio_comp;
>  
> +	/* HPD IRQ handling */
> +	spinlock_t irq_thread_lock;
> +	u32 hpd_isr_status;
> +
>  	/* event related only access by event thread */
>  	struct mutex event_mutex;
>  	wait_queue_head_t event_q;
> @@ -345,14 +349,8 @@ static int msm_dp_display_send_hpd_notification(struct msm_dp_display_private *d
>  	/* reset video pattern flag on disconnect */
>  	if (!hpd) {
>  		dp->panel->video_test = false;
> -		if (!dp->msm_dp_display.is_edp)
> -			drm_dp_set_subconnector_property(dp->msm_dp_display.connector,
> -							 connector_status_disconnected,
> -							 dp->panel->dpcd,
> -							 dp->panel->downstream_ports);
>  	}
>  
> -	dp->msm_dp_display.link_ready = hpd;
>  
>  	drm_dbg_dp(dp->drm_dev, "type=%d hpd=%d\n",
>  			dp->msm_dp_display.connector_type, hpd);
> @@ -407,6 +405,8 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>  						 dp->panel->dpcd,
>  						 dp->panel->downstream_ports);
>  
> +	dp->msm_dp_display.link_ready = true;
> +
>  	dp->msm_dp_display.psr_supported = dp->panel->psr_cap.version && psr_enabled;
>  
>  	dp->audio_supported = info->has_audio;
> @@ -420,7 +420,8 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>  
>  	msm_dp_link_reset_phy_params_vx_px(dp->link);
>  
> -	msm_dp_display_send_hpd_notification(dp, true);
> +	if (!dp->msm_dp_display.internal_hpd)

Why?

> +		msm_dp_display_send_hpd_notification(dp, true);
>  
>  end:
>  	return rc;
> @@ -489,7 +490,16 @@ static int msm_dp_display_notify_disconnect(struct device *dev)
>  {
>  	struct msm_dp_display_private *dp = dev_get_dp_display_private(dev);
>  
> -	msm_dp_display_send_hpd_notification(dp, false);
> +	if (!dp->msm_dp_display.is_edp)
> +		drm_dp_set_subconnector_property(dp->msm_dp_display.connector,
> +						 connector_status_disconnected,
> +						 dp->panel->dpcd,
> +						 dp->panel->downstream_ports);
> +
> +	dp->msm_dp_display.link_ready = false;
> +
> +	if (!dp->msm_dp_display.internal_hpd)
> +		msm_dp_display_send_hpd_notification(dp, false);
>  
>  	return 0;
>  }
> @@ -1182,40 +1192,56 @@ enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge)
>  static irqreturn_t msm_dp_display_irq_handler(int irq, void *dev_id)
>  {
>  	struct msm_dp_display_private *dp = dev_id;
> -	irqreturn_t ret = IRQ_NONE;
>  	u32 hpd_isr_status;
> -
> -	if (!dp) {
> -		DRM_ERROR("invalid data\n");
> -		return IRQ_NONE;
> -	}
> +	unsigned long flags;
> +	irqreturn_t ret = IRQ_HANDLED;
>  
>  	hpd_isr_status = msm_dp_aux_get_hpd_intr_status(dp->aux);
>  
>  	if (hpd_isr_status & 0x0F) {
>  		drm_dbg_dp(dp->drm_dev, "type=%d isr=0x%x\n",
>  			dp->msm_dp_display.connector_type, hpd_isr_status);
> -		/* hpd related interrupts */
> -		if (hpd_isr_status & DP_DP_HPD_PLUG_INT_MASK)
> -			msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
>  
> -		if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK) {
> -			msm_dp_add_event(dp, EV_IRQ_HPD_INT, 0, 0);
> -		}
> +		spin_lock_irqsave(&dp->irq_thread_lock, flags);
> +		dp->hpd_isr_status |= hpd_isr_status;
> +		ret = IRQ_WAKE_THREAD;
> +		spin_unlock_irqrestore(&dp->irq_thread_lock, flags);
> +	}
>  
> -		if (hpd_isr_status & DP_DP_HPD_REPLUG_INT_MASK) {
> -			msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
> -			msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0, 3);
> -		}
> +	/* DP controller isr */
> +	ret |= msm_dp_ctrl_isr(dp->ctrl);
>  
> -		if (hpd_isr_status & DP_DP_HPD_UNPLUG_INT_MASK)
> -			msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
> +	return ret;
> +}
>  
> -		ret = IRQ_HANDLED;
> +static irqreturn_t msm_dp_display_irq_thread(int irq, void *dev_id)
> +{
> +	struct msm_dp_display_private *dp = dev_id;
> +	irqreturn_t ret = IRQ_NONE;
> +	unsigned long flags;
> +	u32 hpd_isr_status;
> +
> +	if (!dp) {
> +		DRM_ERROR("invalid data\n");
> +		return IRQ_NONE;
>  	}
>  
> -	/* DP controller isr */
> -	ret |= msm_dp_ctrl_isr(dp->ctrl);
> +	spin_lock_irqsave(&dp->irq_thread_lock, flags);

You don't need to save/restore flags in the IRQ handler.

> +	hpd_isr_status = dp->hpd_isr_status;
> +	dp->hpd_isr_status = 0;
> +	spin_unlock_irqrestore(&dp->irq_thread_lock, flags);
> +
> +	/* hpd related interrupts */
> +	if (hpd_isr_status & DP_DP_HPD_PLUG_INT_MASK)
> +		msm_dp_display_send_hpd_notification(dp, true);
> +
> +	if (hpd_isr_status & DP_DP_HPD_UNPLUG_INT_MASK)
> +		msm_dp_display_send_hpd_notification(dp, false);
> +
> +	if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK)
> +		msm_dp_display_send_hpd_notification(dp, true);
> +
> +	ret = IRQ_HANDLED;
>  
>  	return ret;
>  }
> @@ -1231,9 +1257,13 @@ static int msm_dp_display_request_irq(struct msm_dp_display_private *dp)
>  		return dp->irq;
>  	}
>  
> -	rc = devm_request_irq(&pdev->dev, dp->irq, msm_dp_display_irq_handler,
> -			      IRQF_TRIGGER_HIGH|IRQF_NO_AUTOEN,
> -			      "dp_display_isr", dp);
> +	spin_lock_init(&dp->irq_thread_lock);
> +	irq_set_status_flags(dp->irq, IRQ_NOAUTOEN);
> +	rc = devm_request_threaded_irq(&pdev->dev, dp->irq,
> +				       msm_dp_display_irq_handler,
> +				       msm_dp_display_irq_thread,
> +				       IRQ_TYPE_LEVEL_HIGH,
> +				       "dp_display_isr", dp);
>  
>  	if (rc < 0) {
>  		DRM_ERROR("failed to request IRQ%u: %d\n",
> @@ -1413,6 +1443,7 @@ static int msm_dp_display_probe(struct platform_device *pdev)
>  	dp->wide_bus_supported = desc->wide_bus_supported;
>  	dp->msm_dp_display.is_edp =
>  		(dp->msm_dp_display.connector_type == DRM_MODE_CONNECTOR_eDP);
> +	dp->hpd_isr_status = 0;
>  
>  	rc = msm_dp_display_get_io(dp);
>  	if (rc)
> @@ -1822,13 +1853,35 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
>  	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(bridge);
>  	struct msm_dp *msm_dp_display = msm_dp_bridge->msm_dp_display;
>  	struct msm_dp_display_private *dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
> +	u32 hpd_link_status = 0;
>  
> -	/* Without next_bridge interrupts are handled by the DP core directly */
> -	if (msm_dp_display->internal_hpd)
> -		return;
> +	if (msm_dp_display->internal_hpd) {

Why? The .internal_hpd should be gone completely, there should be no
difference between those two paths.

> +		if (pm_runtime_resume_and_get(&msm_dp_display->pdev->dev)) {
> +			DRM_ERROR("failed to pm_runtime_resume\n");
> +			return;
> +		}
> +
> +		hpd_link_status = msm_dp_aux_is_link_connected(dp->aux);
> +	}
>  
> -	if (!msm_dp_display->link_ready && status == connector_status_connected)
> +	drm_dbg_dp(dp->drm_dev, "type=%d link connected=0x%x, link_ready=%d, status=%d\n",
> +		   msm_dp_display->connector_type, hpd_link_status,
> +		   msm_dp_display->link_ready, status);
> +
> +	if ((!msm_dp_display->internal_hpd || hpd_link_status == ISR_CONNECTED) &&
> +	    status == connector_status_connected)
> +		msm_dp_hpd_plug_handle(dp, 0);
> +	else if ((hpd_link_status == ISR_IRQ_HPD_PULSE_COUNT) &&
> +	    status == connector_status_connected)

wrong indentation

> +		msm_dp_irq_hpd_handle(dp, 0);
> +	else if (hpd_link_status == ISR_HPD_REPLUG_COUNT) {
>  		msm_dp_hpd_plug_handle(dp, 0);
> -	else if (msm_dp_display->link_ready && status == connector_status_disconnected)
>  		msm_dp_hpd_unplug_handle(dp, 0);
> +	} else if ((!msm_dp_display->internal_hpd ||
> +		    hpd_link_status == ISR_DISCONNECTED) &&
> +		 status == connector_status_disconnected)
> +		msm_dp_hpd_unplug_handle(dp, 0);
> +
> +	if (msm_dp_display->internal_hpd)
> +		pm_runtime_put_sync(&msm_dp_display->pdev->dev);
>  }
> 
> -- 
> 2.50.1
> 

-- 
With best wishes
Dmitry

