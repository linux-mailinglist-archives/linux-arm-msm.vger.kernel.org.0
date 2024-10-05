Return-Path: <linux-arm-msm+bounces-33187-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8645C99184F
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Oct 2024 18:31:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A3C4B1C20FFF
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Oct 2024 16:31:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9D2F288B1;
	Sat,  5 Oct 2024 16:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VPXOk3ZP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2F417C69
	for <linux-arm-msm@vger.kernel.org>; Sat,  5 Oct 2024 16:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728145878; cv=none; b=nOJLet+VFEJ5V/J5deRjWP0ewf/mO9j00pgGQYoKpYoR4am5B/L1w16oxmuD3kpw4yGT1WUSEbE2I08ejW/U+cxHuskFvf6N5Mb9m2/kHgjQ5t5F2UbDfReDQBXHxyI5RAGck3bOGVkoObK7R63H+JlsfBpPnbqCRiG+6dXZkqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728145878; c=relaxed/simple;
	bh=SPLDvAIKA2wal1cbyk5bpbu0Yow0nPLmaGDY1ntAsVc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ihovEO3wA6Ef6DyZWR2Z3G0h03ltfa9J3+8+7vqnaFQcSAV9eRe4qL5Rdk22APpVdBPcKVaEj63i1o9WQ3IJNOy5JvPDlywgf9jZ9Mrgnxg7a5mQi/eJMzmdYSkWk3TA7bzodjxuNbwT9GcDGwGwIJldl2semSCmuTwCCYpQVko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VPXOk3ZP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 495FoMPK002229
	for <linux-arm-msm@vger.kernel.org>; Sat, 5 Oct 2024 16:31:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g1DrUfZua4F6fDsbCUaZ1sAuO6WCHxhZhRBSszMS84c=; b=VPXOk3ZPzZzKL5Xu
	x2ArITegt7t/KEzJ7o53fqvESvVYd8hD6WfPZCknFiwD3Uj9hcOKn6Qxmffj2CxG
	Rsax4DHC0DkXUlamSz20UXv1tr/nOoZ6PchIw1WU9uHlXl/4427UHagxFvsnh6yt
	9m38xrE73TW7PmAY12roZ20kM93bZdTIN1HCAZmd6tTWTJtjv/c09R9w/4VLwZNh
	Oc8n1mHE4S28hs1JvoxPh3IzxQBeli0x8yXfng3eg00sHcnjKduZrvAKQHR7KO5Q
	a9i5Bwzl4laVZt+Tvfy9N2QkY8TLuORF8azL3RDpXEllNZ+qfeen80IdEIKpsURX
	ILm7eg==
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 422xsngtm9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 05 Oct 2024 16:31:15 +0000 (GMT)
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-5c8755c4cd2so332004a12.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 05 Oct 2024 09:31:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728145874; x=1728750674;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g1DrUfZua4F6fDsbCUaZ1sAuO6WCHxhZhRBSszMS84c=;
        b=DzDc/jHwfN8zPcicYjmycOyPyj+Z/n3iVG/AUAzp841xdw3o8+tKMbqa0pEU2xOpTt
         knOmMjxeFdrZ/jHXsaqzfVdXPqCW++Mu00fB4NmwaKzwmpDQQYOQm4Ea2CfA00ZTBM5M
         SxK6oBe/jEMdFor8Bk8RC/EyCpdXYqsS0FHd3gP4UoPBlsyM1BXRojGqvGGAPxUODqc0
         SrGYYxhJFCEgOkq6t3X57jd0FD6HjBz1b1gnWrAUKOZ/KuI5oK49T02sz9OUMBno6Hi7
         liMPsXHH53UlPdCuDbqIj0Vg0RXY+GcfZAyexNOTYiH23hcUgjwneCNgTqJhNHYlu+Df
         9H8w==
X-Forwarded-Encrypted: i=1; AJvYcCW+/DTR9ADU7BNLaTDlT8T6XxEJbEN/EU4J/oVla+kcboNfIxCW5ksmrRJ+1pnnRTNdNGjxoEwKyEWec8As@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4cwdbHUukMHJ34zsKtnqOXadlFb0YEG1P2Xipcf+Khdh8WmyZ
	vx6i3swQJESorBeilMSdFiQL7v8hTgTC+m9lqMe1tYbl72nWvOaXHA1MA6zL3W4onJcjIuyC7Jh
	n61hoDjM22FulpupK7VmP6twNmvEJeQ03aPoUsZxv/a54t957mCAVCfFoxuKg5/sX
X-Received: by 2002:a05:6402:34d0:b0:5c8:8381:c17b with SMTP id 4fb4d7f45d1cf-5c8d2d02685mr2360051a12.2.1728145874128;
        Sat, 05 Oct 2024 09:31:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDDW6XxiZgpQtH+HswqMKcQG1qf3+CFB/WbtT35s7v9ACQdUKD14uAlsycQAjBffPIhQy/3g==
X-Received: by 2002:a05:6402:34d0:b0:5c8:8381:c17b with SMTP id 4fb4d7f45d1cf-5c8d2d02685mr2360018a12.2.1728145873125;
        Sat, 05 Oct 2024 09:31:13 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c8e05eb4b9sm1157579a12.75.2024.10.05.09.31.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Oct 2024 09:31:11 -0700 (PDT)
Message-ID: <ba56c822-cf3d-4d62-86d4-e04551e443c6@oss.qualcomm.com>
Date: Sat, 5 Oct 2024 18:31:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/msm/dsi: improve/fix dsc pclk calculation
To: Jonathan Marek <jonathan@marek.ca>, freedreno@lists.freedesktop.org
Cc: Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar
 <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "open list:DRM DRIVER for Qualcomm display hardware"
 <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER for Qualcomm display hardware"
 <dri-devel@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20241005143818.2036-1-jonathan@marek.ca>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241005143818.2036-1-jonathan@marek.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: nEKfq90vNq6G4DkbNeoE4hkMtIgH6LBJ
X-Proofpoint-ORIG-GUID: nEKfq90vNq6G4DkbNeoE4hkMtIgH6LBJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=943 clxscore=1015 malwarescore=0 priorityscore=1501 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410050122

On 5.10.2024 4:38 PM, Jonathan Marek wrote:
> drm_mode_vrefresh() can introduce a large rounding error, avoid it.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 185d7de0bf376..1205aa398e445 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -542,7 +542,7 @@ static unsigned long dsi_adjust_pclk_for_compression(const struct drm_display_mo
>  
>  	int new_htotal = mode->htotal - mode->hdisplay + new_hdisplay;
>  
> -	return new_htotal * mode->vtotal * drm_mode_vrefresh(mode);
> +	return mult_frac(mode->clock * 1000u, new_htotal, mode->htotal);

This seems to ignore mult/div by two on certain mode flags.. is that
intended?

Konrad

