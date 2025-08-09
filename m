Return-Path: <linux-arm-msm+bounces-68151-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F8BB1F1BA
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 02:45:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9F3651C247FB
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 00:45:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7700221FC7;
	Sat,  9 Aug 2025 00:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bBvuEjws"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CDC31A5BA4
	for <linux-arm-msm@vger.kernel.org>; Sat,  9 Aug 2025 00:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754700331; cv=none; b=UTstFrpwb3W+Th58rfgwS3O81/6pjazolPo5IgOoN+3YTTGZfPRl2QVbSOQM0oHozaYoHCXt3M4AjTK6lK1nXH52xq4gXCwZxY5xqmVUJd9d4OM/1kOqkhbN0XspZng/8MrBqayjQWdDkT7m1K0J+mTaUgfqJFcId0LilOiZWqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754700331; c=relaxed/simple;
	bh=2vsLgS26yFMejf/z5b0FmAu6mvHHLVIqHOFBtaF9nAw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tnMz7nDkPDI+YLLmRy50SLhevZxAV+j4Xf8y34qO9QJXGTP/BdnM9RnNoah8fg4UsTt9UuSsEmXyXv9rXglgINk9YHLj3QUXkGOE9NiBqBhkqBqDIQ3YHQo5xvmHXZYq881tNMF33l7ltm96d+cKfb81bc3GHJAcDrwXnvLhD24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bBvuEjws; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 578DkIGS022553
	for <linux-arm-msm@vger.kernel.org>; Sat, 9 Aug 2025 00:45:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+SdmD8y1mIxLj5DFoiniCJvWmuKL4tKZkoBsj7bVLx4=; b=bBvuEjwsd1/kxE2D
	ZDXgvJfxNQCPttMaRWVcjiODIqCxZdVCSSpeaPAL5y3oE/RF5yYvvLIBa4nE7ZDO
	o6s8aRij5d3v9ZeXxITxp2fjw62faOGIiDjghxKg6GRUQcNKT8qf/ZGzKf0iC9zX
	mAw/g+nQX6nCJcHmJYEQYiq8sem9vb1zoPkFtzH9RFYgUxqPgTR9BeqR8CpgVQc9
	pjU2ZXAHpJVB2tDAcp2K5aO+bBA3EpMb9O+nbANZHwtetKBcc3GznisbOvqGHPcC
	6JsWYTFOMjSS7HnlltjidLxb4dTuTLxVsGBOcIG/3ktdGD9fW8+KAO6fFHPlMoNI
	50leHQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48cs5nduf0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 09 Aug 2025 00:45:29 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4af199d0facso76718521cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Aug 2025 17:45:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754700328; x=1755305128;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+SdmD8y1mIxLj5DFoiniCJvWmuKL4tKZkoBsj7bVLx4=;
        b=T03QY1dKOuYf3KmSGHk74G3iH8V0D54kIZAOLZgO8SE2eqUgwtpRulfr4+SjWkOpln
         ufEiuonEyAu92HripQao7HRxCUJxlEYswAiups91w1ZuERJghxKQfCe3B36++v6eixVV
         HbOkzfw124ueZn1Wz4AHEsu3FcYmijf0qmLLz8ENorrUqytOeXaTsli77RWdM7ojcvkh
         odOLP8+dR322ezyfGrANieWfNbS34xY5TdoVptX4K5jJE3wFG6kp+y65T7ttmJ+aDtlT
         bNZbP6hiZDyiGpl0X+vTd/7HK1ssSRAF46y6/yd5uR7/4f/LQeXTw7QsVKVfT9d1PwfO
         AAaw==
X-Gm-Message-State: AOJu0YzG/T4wHW6z2zV9N2uHJkub27KgmVt14IOdS2fl7siC561YoUYv
	lppo8X/h43Vpzblqh2f5FiBZ3QY1QgGiF++X7iKj406qUBlNU/PToy432XmWQFOdJ0UgZESW/mY
	/FgqaCTbSKitcSycqk82DKZTM/VdiSykAUCihxVkFyGG2hsa5fsMg6LA5iWBIZ4W2nFXA
X-Gm-Gg: ASbGnctO4aAKy2XsmTZ1qzNh45nUoAlPi+xHdIeHlmFP4o13HtqDSRnC9emdTYOUib/
	49CMtZk6LG0AoFevrJNbbn7He4FDPbYcD0G+Npb3L8SXxaB3RPBiDTlP8H9r98Iu8EWp6n6xgTk
	yx5KBGLhnASEpB6dVOj7UNt4rJNvdHVrYL/03FIkxUnFM9HyTK8eB5INpEUsE+1/nt5YVqyJSp1
	iwu3sfTuL9du08wPHKNOQlQaHYcYDOmY+vLsklZTZWK+WvgkzkL5hkbOSHc9yCQLxrbCeD9U53x
	9eQRDJxTGuQCYKnd9TISzI93mzYBH7HiWIh+TzBxyPH4gmd/dkZwvA4uQHfztiTM4ViypN1plDN
	O6VNLQPMSJIdSbBN3EcdFeSe9BetuA2uMeOcQ6+P+pio=
X-Received: by 2002:a05:622a:115:b0:4af:21a0:c65b with SMTP id d75a77b69052e-4b0a074ef32mr134768241cf.13.1754700327989;
        Fri, 08 Aug 2025 17:45:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfQjmXMV853672JK0fEpKkYRjhS8uwOvkShC3Xw9ZNKFNAKoVWBbGdYfzTQ4X2DquHWVzT1A==
X-Received: by 2002:a05:622a:115:b0:4af:21a0:c65b with SMTP id d75a77b69052e-4b0a074ef32mr134767951cf.13.1754700327474;
        Fri, 08 Aug 2025 17:45:27 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0c3:3a00::4c9? (2001-14ba-a0c3-3a00--4c9.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::4c9])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-33238271bdfsm31713131fa.6.2025.08.08.17.45.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Aug 2025 17:45:25 -0700 (PDT)
Message-ID: <e217fb72-36e4-4222-b5da-9608af57c665@oss.qualcomm.com>
Date: Sat, 9 Aug 2025 03:45:22 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/12] drm/msm/dp: Move link training to
 atomic_enable()
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Dmitry Baryshkov
 <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <quic_yongmou@quicinc.com>
References: <20250808-hpd-refactor-v2-0-7f4e1e741aa3@oss.qualcomm.com>
 <20250808-hpd-refactor-v2-4-7f4e1e741aa3@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250808-hpd-refactor-v2-4-7f4e1e741aa3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Q+XS452a c=1 sm=1 tr=0 ts=68969a29 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=tir8h9pnGiVj9xZly-MA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: LUtiAgdsPuLkdLgMRSBDH8OMzNhHonuq
X-Proofpoint-ORIG-GUID: LUtiAgdsPuLkdLgMRSBDH8OMzNhHonuq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA3MDA2OSBTYWx0ZWRfX56bSpSnN7vXA
 ONJ9bqdr+nB8m/rri4WcCy0I335ByGGN9xoc/P0Sgvl+ReidH8fN0FXtRxhrpIcGuzrefjOOuP+
 ZMrXpPBbxVn47SCfDQ4HZ0lnrO0PzfIO82Yy5ddM+TdRpUB0zX9WGUMQlg548oXOKogefPVUBLq
 YHJfrspPdcqcrKb3FUsfrhqO1rPme9aWOLakBsriG+upDKejvtBWx9SdTgQB7tNkzW54w08Mto4
 AUzweh03P68E8Bt4y6/j+NQUkj1XQFkZRH2VY3/tm2qvE3P+CZiMaNz7riZinCGuiC0TihvcspF
 mqDxootvkJjupI4VoNGitIqfoYNByo0JkFI90M2kYzeIrpXvL5dOtVcSReQtb5cXtT4xANlVJdd
 EHReJ0qC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_08,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0
 impostorscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508070069

On 09/08/2025 03:35, Jessica Zhang wrote:
> Currently, the DP link training is being done during HPD. Move
> link training to atomic_enable() in accordance with the atomic_enable()
> documentation.
> 
> Link disabling is already done in atomic_post_disable() (as part of the
> dp_ctrl_off_link_stream() helper).
> 
> Finally, call the plug/unplug handlers directly in hpd_notify() instead
> of queueing them in the event thread so that they aren't preempted by
> other events.

This feels like two unrelated changes.

> 
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_display.c | 15 ++++++++-------
>   1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index e2556de99894..c849befe58f0 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -427,11 +427,6 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>   	msm_dp_link_psm_config(dp->link, &dp->panel->link_info, false);
>   
>   	msm_dp_link_reset_phy_params_vx_px(dp->link);
> -	rc = msm_dp_ctrl_on_link(dp->ctrl);
> -	if (rc) {
> -		DRM_ERROR("failed to complete DP link training\n");
> -		goto end;
> -	}
>   
>   	msm_dp_add_event(dp, EV_USER_NOTIFICATION, true, 0);
>   
> @@ -1680,6 +1675,12 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
>   		force_link_train = true;
>   	}
>   
> +	rc = msm_dp_ctrl_on_link(msm_dp_display->ctrl);
> +	if (rc) {
> +		DRM_ERROR("Failed link training (rc=%d)\n", rc);
> +		dp->connector->state->link_status = DRM_LINK_STATUS_BAD;
> +	}
> +
>   	msm_dp_display_enable(msm_dp_display, force_link_train);
>   
>   	rc = msm_dp_display_post_enable(dp);
> @@ -1839,7 +1840,7 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
>   		return;
>   
>   	if (!msm_dp_display->link_ready && status == connector_status_connected)
> -		msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
> +		msm_dp_hpd_plug_handle(dp, 0);
>   	else if (msm_dp_display->link_ready && status == connector_status_disconnected)
> -		msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
> +		msm_dp_hpd_unplug_handle(dp, 0);
>   }
> 


-- 
With best wishes
Dmitry

