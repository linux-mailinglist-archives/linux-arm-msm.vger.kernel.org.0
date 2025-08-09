Return-Path: <linux-arm-msm+bounces-68150-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF8FB1F1B5
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 02:44:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 87D8558712C
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 00:44:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FC422459E3;
	Sat,  9 Aug 2025 00:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sp0P3qmt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA622459E1
	for <linux-arm-msm@vger.kernel.org>; Sat,  9 Aug 2025 00:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754700282; cv=none; b=Zw9qYCHx05OrSgGf7P6nheMO2DTgY6fqubPTXOve6WHH/3w9s+zyUSNe1woJFUtYKoTbngxGnSyG6yZeGX71P2tf9I94W2Ewbt0EcV4OMLfXChuwDezqugB2Mp7SUzW+stnQoLkC+EGzJvkuEHF8cq30b1LH7Y5+N4ya+l1lJeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754700282; c=relaxed/simple;
	bh=CprPIvMUEFV6t3GFhtB1siP6EgRbTU3tEnS7qIl1p5A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JOlkX82Btz2zbREpkn1mS5w+3Jmo8b0oVwiT4EQZTvGsYAYXghmirAR6OP+T3q7eumZcEb0M7Q/x7JMim+NyqooBeEMOR8WpYwvDNZ6xzUkfKiz2yKYWcHbfTC7UoPHibA4dzBYfeHYbiwCNT3+k8MDpU8rjK7kOnOcL42wHUUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sp0P3qmt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 578FARJT003513
	for <linux-arm-msm@vger.kernel.org>; Sat, 9 Aug 2025 00:44:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BimyYxqwpniYNzfnCwL2spGT2aViDo1PZ8XTpYNqG48=; b=Sp0P3qmtKmXQpe/f
	QURhN4ZELDF+WJ/NVpssSy2nmarjSvBTWdPm0ekw85HtSc1PH2RY/KgN27K2S08C
	1ho1KwKgvqMXatZq2kd6yYiag20RzLZ+VNDIPoasyceY4Zj5g7WV3g4kl41/1JkR
	0tzZvb77iHcxsMMG9kQb6aOdurg2NmUpGKTOFwblePP3Gpw/5+65Nxso2uteK8f8
	i/9FOypktjXygWRseP+c9VtvSooiDXc8qUw4ep8miwb7pVw1a7hePRA+6QzPkL5v
	pE85Z1JULGR3l4T4s2PYmW1m/Mnw/25XrCRd/bGiKdGQg7BzK+559HwxZBPMJalZ
	vHOtGA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpw03pf7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 09 Aug 2025 00:44:39 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b07bf0783bso69580631cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Aug 2025 17:44:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754700279; x=1755305079;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BimyYxqwpniYNzfnCwL2spGT2aViDo1PZ8XTpYNqG48=;
        b=xCeFsZ08kw9ofVUGxNXiJx9jBo0X8Fenu88sbiDEpxzWnRH/PCXZLSgEjiHPRdzkKD
         bkeG28cGGmjmZuRVNoCM5uwCuck1G5vaops7QUu0too5MpHWi7X6fiWgIST1CebAG0uZ
         tmRtjQLBxLIuhwnfadE6XNyFZWqAJ5ZSQURtULCYHuIF1ijhzSx5r5+VQGLrtosPzWT1
         uXEbXV9XQ6MGOyMmvPTxYfT4GZ1e6tuIzfbkOJH3ewHHFP/n3aWzYKsk/yFovN0nU5P1
         ZDjV7IyTAPTcf7ZWMyyPSbsMGEHcGErfHDTe6ig1Y1//jw+OQBr9C/Zdp7JbNYii4xDT
         Ootg==
X-Gm-Message-State: AOJu0Yzfyj9Zi//lqcUO/NXkOXaK0G7SU0NcuPKOBkmzSNQnOx0Uo+o9
	0R9ahOnzdfVR0hrieAj/BC7z77JfJ0Le7dd4lV+uj5PcwiUw/B0Ze9ld2pGVP4I7TUZldgGQLTa
	txfkDlUEElG0QPDQe32eXiVfrhS/x8dgkuTnsZm0fbrKpcz9MjJMFR7gZWpSmF0vlKGuH
X-Gm-Gg: ASbGncu0BOXHEdAcARJNOONL4Ip5BLI5lGLmltN0GBrIxo7l9djlrd+j8S41udeayzR
	K4qLz42KEC7i67U1agGJ8UYwGc2fbB60UBIYX6Aey56WjDNh8kKmwTZH/7qJK0DOvOoEZ4WWmqW
	Vm2pYlH7sk924JsCoY4EWNIFmfmbcQ5rON5WQzepNSUxCvLJaDdHKqCyjrS3iQYtb5/0UEUDYnB
	kNkAFc2MyWwIpi71TmSbLuDA1FEphD6jGm1GsAQWCFsJe72i6k4UYMn6Tgo8B88clbk8ul81QYy
	A4el+sGdkOOCcfmRToRyKW1e9NlFib8TTGeRJ+kBFeMqQQCV7nqUckjS71qWSFE8OiSAkJH0ng3
	RN+VVE0Ls22qowsH0CCxuEZsYooZbXMjNjjIjIw1SyBk=
X-Received: by 2002:ac8:598e:0:b0:4b0:7b3a:5301 with SMTP id d75a77b69052e-4b0aed6356amr68264461cf.46.1754700279084;
        Fri, 08 Aug 2025 17:44:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGztjJ9/tKVCY5VSQ/JjsHMYVrDuTUfZGB4dEQs28y5gyOkr+EEh8mAop45dGh/F3eQP/56BQ==
X-Received: by 2002:ac8:598e:0:b0:4b0:7b3a:5301 with SMTP id d75a77b69052e-4b0aed6356amr68264071cf.46.1754700278515;
        Fri, 08 Aug 2025 17:44:38 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0c3:3a00::4c9? (2001-14ba-a0c3-3a00--4c9.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::4c9])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b88c99078sm3171328e87.102.2025.08.08.17.44.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Aug 2025 17:44:37 -0700 (PDT)
Message-ID: <365288c5-f1ba-4875-bf6b-59a34ed52ac7@oss.qualcomm.com>
Date: Sat, 9 Aug 2025 03:44:35 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/12] drm/msm/dp: Read DPCD and sink count in bridge
 detect()
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
 <20250808-hpd-refactor-v2-3-7f4e1e741aa3@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250808-hpd-refactor-v2-3-7f4e1e741aa3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: zrTQLwAbEmA-AV27hWJFJzdyXLq_vnvp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX1JgMcX6bfv9Y
 4DBRZq3NbEKeddqem+1K/JXKmnLeMmaQ6fjYOEzAgla4Bb5Kmd2jBZlXQJ9jMX019in21cW1svh
 qSA/KO/z5bPS9QGTl+ZszBzxFT1fw3uOXSxZaIjqAPvkJswKcVb1AEW44jc1+4f2ZGBKLFuaagV
 5Bi3YttwTjk/zejvrDGENiRnSkDXSw8gDtQsZZ5y7KPcx/J+hr6gdmGUcs/SHBQBYo+qaZTsvF8
 X2jQfTqucP8oMs95PZp9qv3GwQ+BSst2fP8PrW0mYARZfLeFOhuMtwACRFNP1Fubgnz9g0ev8vC
 oPr3FhNJgA6Ozxltd2/ZdZ62GqRGkV7Uxo3p/q4KCeRc3LQ1UBNloZzUAKtbsqeJvUpiwwRuwv8
 OArOxSr1
X-Proofpoint-ORIG-GUID: zrTQLwAbEmA-AV27hWJFJzdyXLq_vnvp
X-Authority-Analysis: v=2.4 cv=NsLRc9dJ c=1 sm=1 tr=0 ts=689699f7 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=iK85lhrOwLHDTm4cRBAA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_08,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009

On 09/08/2025 03:35, Jessica Zhang wrote:
> Instead of relying on the link_ready flag to specify if DP is connected,
> read the DPCD bits and get the sink count to accurately detect if DP is
> connected.
> 
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_display.c | 54 +++++++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/msm/dp/dp_drm.c     | 18 -------------
>   drivers/gpu/drm/msm/dp/dp_drm.h     |  1 +
>   3 files changed, 55 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index bfcb39ff89e0..e2556de99894 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1142,6 +1142,60 @@ static int msm_dp_hpd_event_thread_start(struct msm_dp_display_private *msm_dp_p
>   	return 0;
>   }
>   
> +/**
> + * msm_dp_bridge_detect - callback to determine if connector is connected
> + * @bridge: Pointer to drm bridge structure
> + * Returns: Bridge's 'is connected' status
> + */
> +enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge)
> +{
> +	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(bridge);
> +	struct msm_dp *dp = msm_dp_bridge->msm_dp_display;
> +	struct msm_dp_display_private *priv;
> +	int ret = 0, sink_count = 0;
> +	int status = connector_status_disconnected;
> +	u8 dpcd[DP_RECEIVER_CAP_SIZE];
> +
> +	dp = to_dp_bridge(bridge)->msm_dp_display;
> +
> +	priv = container_of(dp, struct msm_dp_display_private, msm_dp_display);
> +
> +	if (!dp->link_ready)
> +		return status;
> +
> +	msm_dp_aux_enable_xfers(priv->aux, true);
> +
> +	ret = pm_runtime_resume_and_get(&dp->pdev->dev);
> +	if (ret) {
> +		DRM_ERROR("failed to pm_runtime_resume\n");
> +		msm_dp_aux_enable_xfers(priv->aux, false);
> +		return status;
> +	}
> +
> +	ret = msm_dp_aux_is_link_connected(priv->aux);
> +	if (dp->internal_hpd && !ret)
> +		goto end;
> +
> +	ret = drm_dp_read_dpcd_caps(priv->aux, dpcd);
> +	if (ret)
> +		goto end;
> +
> +	sink_count = drm_dp_read_sink_count(priv->aux);

Should be guarded by drm_dp_read_sink_count_cap()

> +
> +	drm_dbg_dp(dp->drm_dev, "is_branch = %s, sink_count = %d\n",
> +		   str_true_false(drm_dp_is_branch(dpcd)),
> +		   sink_count);
> +
> +	if (drm_dp_is_branch(dpcd) && sink_count == 0)
> +		status = connector_status_disconnected;
> +	else
> +		status = connector_status_connected;
> +
> +end:
> +	pm_runtime_put_sync(&dp->pdev->dev);
> +	return status;
> +}
> +
>   static irqreturn_t msm_dp_display_irq_handler(int irq, void *dev_id)
>   {
>   	struct msm_dp_display_private *dp = dev_id;
> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
> index f222d7ccaa88..e4622c85fb66 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> @@ -15,24 +15,6 @@
>   #include "dp_audio.h"
>   #include "dp_drm.h"
>   
> -/**
> - * msm_dp_bridge_detect - callback to determine if connector is connected
> - * @bridge: Pointer to drm bridge structure
> - * Returns: Bridge's 'is connected' status
> - */
> -static enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge)
> -{
> -	struct msm_dp *dp;
> -
> -	dp = to_dp_bridge(bridge)->msm_dp_display;
> -
> -	drm_dbg_dp(dp->drm_dev, "link_ready = %s\n",
> -		str_true_false(dp->link_ready));
> -
> -	return (dp->link_ready) ? connector_status_connected :
> -					connector_status_disconnected;
> -}
> -
>   static int msm_dp_bridge_atomic_check(struct drm_bridge *bridge,
>   			    struct drm_bridge_state *bridge_state,
>   			    struct drm_crtc_state *crtc_state,
> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
> index d8c9b905f8bf..0f0d4bacb194 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.h
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.h
> @@ -25,6 +25,7 @@ int msm_dp_bridge_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
>   		   struct drm_encoder *encoder,
>   		   bool yuv_supported);
>   
> +enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge);
>   void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
>   				 struct drm_atomic_state *state);
>   void msm_dp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
> 


-- 
With best wishes
Dmitry

