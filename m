Return-Path: <linux-arm-msm+bounces-2163-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C08297FACEB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 23:00:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6349CB20DBB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 22:00:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D749546554;
	Mon, 27 Nov 2023 22:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jwLthgM2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30D1B1AE
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Nov 2023 14:00:33 -0800 (PST)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3ARDXQdh017651;
	Mon, 27 Nov 2023 22:00:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=7GK+UFCb/bkmZuxc3nUiz7pizg5pEY+odEEXV6nB+MM=;
 b=jwLthgM2hLoXMbCKv3jbLJNnRWmrtmLV4XFp8DCoMJ9ciup0aVMVUScMe61534QBfUAf
 RiQ8fyJVWSa1K47PPb5OyFQKHGTbZ92UhNIAl7DMAxBguqCPhCZ1LU8QYGtwwGiq/viT
 xKkdXSmaMrk/Xal2Sa739bNEWK6e/MFEB6DQkajqUTIOlJ1G9H7lZ8JPeK0pw3BYZcXq
 /SqrQJtI9NIqJ+J9AfEnu8Fp8jpYNtAzrkJZu3Mf/vrfJq4WfxnxkfgzVkY8WGfFrf3f
 anTY5duOGjNbHx/n3R23IOg3B6Gv9gEFTc0Gc67JrZzQDDwyejK1dbXupZyoJCf+pV+n uA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uk69udweb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Nov 2023 22:00:21 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3ARM0KmH009640
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Nov 2023 22:00:20 GMT
Received: from [10.110.19.196] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 27 Nov
 2023 14:00:20 -0800
Message-ID: <60dc2b72-188f-7b6e-4e14-b90f10997a44@quicinc.com>
Date: Mon, 27 Nov 2023 14:00:13 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/msm/mdp4: flush vblank event on disable
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>
CC: Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20231127215401.4064128-1-dmitry.baryshkov@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20231127215401.4064128-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: H1ooETqjWvclYxS9Oik1WLkSrSCDcNJH
X-Proofpoint-GUID: H1ooETqjWvclYxS9Oik1WLkSrSCDcNJH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-27_19,2023-11-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 adultscore=0 spamscore=0 mlxlogscore=782 mlxscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311270152



On 11/27/2023 1:54 PM, Dmitry Baryshkov wrote:
> Flush queued events when disabling the crtc. This avoids timeouts when
> we come back and wait for dependencies (like the previous frame's
> flip_done).
> 
> Fixes: c8afe684c95c ("drm/msm: basic KMS driver for snapdragon")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
> index 169f9de4a12a..3100957225a7 100644
> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
> @@ -269,6 +269,7 @@ static void mdp4_crtc_atomic_disable(struct drm_crtc *crtc,
>   {
>   	struct mdp4_crtc *mdp4_crtc = to_mdp4_crtc(crtc);
>   	struct mdp4_kms *mdp4_kms = get_kms(crtc);
> +	unsigned long flags;
>   
>   	DBG("%s", mdp4_crtc->name);
>   
> @@ -281,6 +282,14 @@ static void mdp4_crtc_atomic_disable(struct drm_crtc *crtc,
>   	mdp_irq_unregister(&mdp4_kms->base, &mdp4_crtc->err);
>   	mdp4_disable(mdp4_kms);
>   
> +	if (crtc->state->event && !crtc->state->active) {
> +		WARN_ON(mdp4_crtc->event);

Do you need a WARN_ON() here? Just wondering how often this might happen 
and spam.

otherwise LGTM.

> +		spin_lock_irqsave(&mdp4_kms->dev->event_lock, flags);
> +		drm_crtc_send_vblank_event(crtc, crtc->state->event);
> +		crtc->state->event = NULL;
> +		spin_unlock_irqrestore(&mdp4_kms->dev->event_lock, flags);
> +	}
> +
>   	mdp4_crtc->enabled = false;
>   }
>   

