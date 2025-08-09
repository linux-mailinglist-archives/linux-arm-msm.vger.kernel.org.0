Return-Path: <linux-arm-msm+bounces-68152-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB42B1F1C2
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 02:51:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 540EBA071EA
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 00:51:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D90126658F;
	Sat,  9 Aug 2025 00:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SjDZdxC1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ABE526560C
	for <linux-arm-msm@vger.kernel.org>; Sat,  9 Aug 2025 00:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754700683; cv=none; b=gKLM/l9xm5NwyeOOMlLxc0Mkq2DgRMILdkUVp2JxKZwyHPoUbeISU29+/wvDZgHhdaBBYiEGlwRlap41kOZCCyFyK9DASy+WP0eFgzFAAbR8j3l4DCypGnNmPziFVUVIUJQv3URh5CMnHH6teVOwWO3kigw0FFep9EsWlRTpo/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754700683; c=relaxed/simple;
	bh=iu4Ybvml72DCjeYe+gkpRfB8TpgjwkqBkssTQJjn2jo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XsHKXi9RAjZMnzAq4Ep21iKiudyo4kXmdv5N7EEVfZEsxHzk7jIy2BRCqm2dYA2eHuSs6HORZF5xMd50RCWUBg5wLrxB56CTohpA8TZLdEgM2KfNB3vLDIFE9Ag0aBIjiY2nqFS0ACnUzpQnqqbiDG/R7Ald140bk6ZhgLYytj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SjDZdxC1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 578NFTh0021332
	for <linux-arm-msm@vger.kernel.org>; Sat, 9 Aug 2025 00:51:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hoY+FkRGPvkEWeTlAjY+LGALIacEK+UKYHyKEaey/U0=; b=SjDZdxC1B2ihfoPV
	zJAtoPipUXkKb9YvMUdmfZBd2sq8xucQF1NTwsjKMkMVf0fV5kwBpGW0A/CQ3176
	kQ7cKSeB10YCLn0QYM9H2lhzJhinXEOq+PIocIugDPcCO6qS3TSccJqkGDqtrQTP
	fqeDz4OR+5Ih7n6reDWAK4e+ts4LdA+mkqL6xeZ3YqgeekY9rjretjbHRREnbZgb
	rTTGDjAcJ1l0DaRxBwMRcy8qlXRa6WJihdvoaMXV7lSYjYWPCE4NbnIph4DzmnS8
	Z69XxojM+rCFAhHfWXrMXhrKP70vNfBHnwAVGOZ6P5reSlqPozzsisDW/9V6s2pG
	2lU+Aw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ddkkt6fx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 09 Aug 2025 00:51:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7e686308729so656291185a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Aug 2025 17:51:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754700680; x=1755305480;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hoY+FkRGPvkEWeTlAjY+LGALIacEK+UKYHyKEaey/U0=;
        b=FPV3Phjuq8tlj5+RHMo9iDL+SZADmOaC4YMPYncL6c396mCfU9qqiPC+ZqdYZdmRJp
         xrvMrnYbkpK4257hgQFARUOpLlFjTobIhnt6SmMwScsKTqeVU4ivZ+hR4kcX5dY4bfjp
         r79aKXV1kpBlv+BRZFvjp5KZNuBPpaSZfkZWFkM+9gIl84y1zAWtAFuilqkAH2jEzVXE
         ChjMz7SMqOlmP2Zuf+PnYTTV29a4UFWdn83A55ikS9eacltN0gqeWrXzk1WpMxtwAr11
         sO6Xydb039dq/zBty0VegaKIpOur72uFY/gJTlI+NwIPURDUA5l7tDHXMtd84tyyhZqq
         LsSg==
X-Gm-Message-State: AOJu0YyunNR1KcGOMTTIHqi72Rd0u7s39ZpWX5UrEtaQQC6JadtuwShz
	4dfRl03MYoh6s10Mtfl+7j22HXH3CSiXBlj+jDjNZfeRHPa44Djjuy80iHH+pGeVhR3YDv7Rlxo
	vXQ03WrEE48SV5q+5qKGnELpq/8rrd+pjJI2s+XvdZlrytEjbfnYnB07ZxhYQZSEWjQRb
X-Gm-Gg: ASbGncvRYFl17is2iWwS2pwWAjYBrL304xPtcvMDFhQo8VEV37udk9X6WnR9iB70WpN
	WsNT4S2zm3PmvnOPaqevxr15Aq7GGCvALfitTthOFHwr5vs0KrF368fAKuPqfhVOtDGWqDCwqHN
	08TbVatsRe8ynKV4YwqPqkW77Yquj4tFm/qo1rL7N5E71l8xKnl2ukKW8OiM/MIENPY2nhf0OZH
	pUQ+/q5lecQ2HwpWLKUC/56koTLyLKhpo4wwu/bQfk6hQnhRN+6yXObWk+Qhcra7L5O30tXBqBL
	BsN1+q1sQ+5ERAGL7q52L65iJ3RXBokjHqr6clGF1ZenklJvIgyeNNK8PSfUt8Ot7ziQSH7k/Mb
	fUIjMfmLl5ZQSKNE0i7lhXItq7VE339vjHt5sW3aPYaU=
X-Received: by 2002:a05:620a:25ce:b0:7e6:2f6a:5bae with SMTP id af79cd13be357-7e82c7e299fmr653881585a.62.1754700680406;
        Fri, 08 Aug 2025 17:51:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPoGDX+jX9Hh/iCn+TDzNM/k/SOiIlgU5Ry8cmMIkFdfpBCLAzWw1Nb92a+F2Yl2/QRzGpgg==
X-Received: by 2002:a05:620a:25ce:b0:7e6:2f6a:5bae with SMTP id af79cd13be357-7e82c7e299fmr653879285a.62.1754700679888;
        Fri, 08 Aug 2025 17:51:19 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0c3:3a00::4c9? (2001-14ba-a0c3-3a00--4c9.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::4c9])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-33238272dd4sm31445181fa.17.2025.08.08.17.51.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Aug 2025 17:51:17 -0700 (PDT)
Message-ID: <8f59ad23-4f86-4006-8163-a1feca3ae346@oss.qualcomm.com>
Date: Sat, 9 Aug 2025 03:51:14 +0300
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA4MDA2NiBTYWx0ZWRfXx4MOxgoaEFtt
 ersUVCDeT7rmz85zfAwBiMM4I6IsAMgMNiQEFYrWQV4aBvAGBBcefq3WJyaE6LSSLKrb8VLhoMA
 pzsPDDoBEnmCu0Zy6LdPwR4pzGQKHMx28BT1P4Y/K4TWH3IaDCezBLLFCXaUMaJ3YVZXGEkXy3A
 g9lOjwxp5twjL6z5NHKF2rS6vFnicWy+XCrXCqsEAWqunVNCD3l/kIUbRXIXveohlNOT8xomoWv
 Tpl2IUf5WGTvguEs67inG1RuGZDWToUc5Q5JN1DpvCcaJ+gxEqacI5TTHjbEC0HZXSVf/n05wBL
 We0BGD4BdNlw7uKYanKDl4J0ZRblTLs+kUiMotP5jU/uZTc6OLypxgyv7NgCvR/If/tzxQJ9609
 D1uFwOfN
X-Proofpoint-GUID: pSFZzShinNi_1Vxt-8bJUKSgY20MUDTj
X-Proofpoint-ORIG-GUID: pSFZzShinNi_1Vxt-8bJUKSgY20MUDTj
X-Authority-Analysis: v=2.4 cv=Xpv6OUF9 c=1 sm=1 tr=0 ts=68969b89 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=tir8h9pnGiVj9xZly-MA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_08,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 phishscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508080066

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

Also at this point we enqueue event, which will set link_ready to true 
(which is obviously incorrect).

>   
> @@ -1680,6 +1675,12 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
>   		force_link_train = true;
>   	}
>   
> +	rc = msm_dp_ctrl_on_link(msm_dp_display->ctrl);
> +	if (rc) {
> +		DRM_ERROR("Failed link training (rc=%d)\n", rc);
> +		dp->connector->state->link_status = DRM_LINK_STATUS_BAD;

Add a comment why it's set directly rather than through 
drm_connector_set_link_status_property().


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

