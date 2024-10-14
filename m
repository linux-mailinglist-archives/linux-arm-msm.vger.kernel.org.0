Return-Path: <linux-arm-msm+bounces-34232-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DC09399BE06
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 05:12:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 934241F22575
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 03:12:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FD0860DCF;
	Mon, 14 Oct 2024 03:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="G7G9SQ/r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E13136337;
	Mon, 14 Oct 2024 03:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728875524; cv=none; b=TJjF9hiuFHigaZ4CqczA/L0oBYZjmK5UXLAE0rigjifhnzbmF5J3AlW+Ne9xAl9+DvWlVcKGDsd5ewuaT21l1SHUUjTDgYqw0LqjClb5bXGWNQB1kL34j4yEKzM34hUz6o3bgEhGk8NNp6lcT70lJVqe7oTlftp/RQriWp5CPws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728875524; c=relaxed/simple;
	bh=osLUIGcTUGLnGtF6jz02mpc30y5uXcEXJJevGQuOm0k=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=U4zIC96iP5eD8m6HqOOT1JlM4fi+xKRWLGVpN3bsPdVh7sRslpUp/zlhWYoqKbcC84RZ1RAjTdDB9yx2CIedQROUj5tWH3WKIQVDLczdR3ujjrMARPqbv21ebenPQGJKJe/Mob6iWomHZ1D8oRg4s/QezPUClsbxoO8uhp+I2FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=G7G9SQ/r; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49DLLmeC029717;
	Mon, 14 Oct 2024 03:11:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lK+4L43tekwYpi0ByT6IrkcLhfm6NaMEtLp3C6MG/BI=; b=G7G9SQ/rWYIJSxcx
	B+XoJNoAjjY/pH8PueIDhYdp54bkFxE98OZpD2wjMw8TJ9tvUJ6gjVyX6BhriC4i
	CNUHQlwIpujKVqi6C9mNEHKOgIXW6Q39UW2v19vqc9CrRyWgCILvCuUj0+4V99/a
	Jeyzp8uP5V2gM64b4BSiiCogkuSv3cd2WhXZG0RE0doCVgAOsJGmacPgThbDdGiR
	WJG4gjQ7Gee1zwiWfHUOp6QywwovTJ/Ie7y6CcYkVkszxSdChZPEBqy9QVYqXHDD
	fzgKs53RNOhiEKageAQLVAxAuY40Kj3rnO5DFXqTImYIybP3CCqDIQP3Hfux11Lw
	/HLilQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 427h6tu46y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 03:11:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49E3BeFu009597
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 03:11:40 GMT
Received: from [10.110.109.95] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 13 Oct
 2024 20:11:39 -0700
Message-ID: <741111f4-a5de-4c87-9278-c91fc92480ca@quicinc.com>
Date: Sun, 13 Oct 2024 20:11:38 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/msm: add another DRM_DISPLAY_DSC_HELPER selection
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Lucas De Marchi
	<lucas.demarchi@intel.com>,
        =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
	<thomas.hellstrom@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard
	<mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <freedreno@lists.freedesktop.org>, kernel test robot <lkp@intel.com>
References: <20240905-fix-dsc-helpers-v1-0-3ae4b5900f89@linaro.org>
 <20240905-fix-dsc-helpers-v1-2-3ae4b5900f89@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240905-fix-dsc-helpers-v1-2-3ae4b5900f89@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: SPiWo8SxN_Yc9h7y8nsDzNACjnWQEco3
X-Proofpoint-ORIG-GUID: SPiWo8SxN_Yc9h7y8nsDzNACjnWQEco3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 mlxlogscore=999 malwarescore=0 lowpriorityscore=0 mlxscore=0 adultscore=0
 spamscore=0 suspectscore=0 clxscore=1011 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410140022



On 9/4/2024 8:08 PM, Dmitry Baryshkov wrote:
> In the drm/msm driver both DSI and DPU subdrivers use drm_dsc_*
> functions, but only DSI selects DRM_DISPLAY_DSC_HELPER symbol. Add
> missing select to the DPU subdriver too.
> 
> Fixes: ca097d4d94d8 ("drm/display: split DSC helpers from DP helpers")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202409040129.rqhtRTeC-lkp@intel.com/
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 

Change LGTM, hence

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

But, ca097d4d94d8 ("drm/display: split DSC helpers from DP helpers") is 
not yet merged, so I will not be able to pick this up for this cycle?

> diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> index 94d3ed4f7761..c8dda0ebd043 100644
> --- a/drivers/gpu/drm/msm/Kconfig
> +++ b/drivers/gpu/drm/msm/Kconfig
> @@ -92,6 +92,7 @@ config DRM_MSM_DPU
>   	bool "Enable DPU support in MSM DRM driver"
>   	depends on DRM_MSM
>   	select DRM_MSM_MDSS
> +	select DRM_DISPLAY_DSC_HELPER
>   	default y
>   	help
>   	  Compile in support for the Display Processing Unit in
> 

