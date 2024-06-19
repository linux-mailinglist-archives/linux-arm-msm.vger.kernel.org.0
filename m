Return-Path: <linux-arm-msm+bounces-23253-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6195890F5C7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 20:11:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D23261F2255E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 18:11:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29DA8156F39;
	Wed, 19 Jun 2024 18:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lpke3Ls2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983E7156F25;
	Wed, 19 Jun 2024 18:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718820673; cv=none; b=FX/EiPjq0XKLFhBS4J9RAYcXZbnMPiWLyWpTCqwtb5XX6A4fyHPlz4br8/Ig6vqzIuje+A2ocbViAmRiQAZusJsJ5vZYXlYNiH8Rvo6DQeiL7yY3kglTmtz1LDOLJdGbM3zEKdE10WxlQ3qwMI7W0QUWKecx+uqWbnCwFzwcHKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718820673; c=relaxed/simple;
	bh=ZXaP/pLvA4RqHZqae0ADsqFdPqlsMqC79xUjriiSz3s=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Y8O74M/mgBjhyxaMl1MgTpwSHR+t9qPOFg28KuAGXFPnl6RsYoSV2UVq++MgTZ43iYbgZDZ648F5Q7dqrfk9L2M7dBuR+Stq4Al5dQyLtOSHi6u6/1FFaj8QMcMz/eNDVcczqAQUVTrVpseMoaqGytOhEvpxfE49BZenlZP+yd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lpke3Ls2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45J9Bsmi010717;
	Wed, 19 Jun 2024 18:11:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CrVbCF7GLKxDvvXz4Jh+wVm6bfs1xvQ++zSF7apYK6Q=; b=lpke3Ls2dBvxbY//
	o19kEGp0j1sKEwMZM1cuwEYk/v3BWGN1HpivolMxN7i3YIgJonkGpDhV9yOxDPrM
	tCUv+TJRGEpgeXxgkZyIkOYgoYsvGq7DiqOh8YTQLcqnu0KlfLF8MRdtuESmtq4U
	cyk+HFxaHWfPBgmeB7HMf2Cukiv8Wo2c5bl7sbscAmKV2B6YQp9va3bplQ2sam2G
	yexf0mrOV2ecy2otBmJB6lYBF3EklvzxYu9vW7bIVUkFnH3+wcaS/Vlxp2TBCW5l
	XtaexCO1stmyLiav/rExp2Qrj3HPpVyUkl9uTJawks7/abXb8zNDCZ/uEbd4BnKe
	idt5/A==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yuj9tjgaf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jun 2024 18:11:04 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45JIB3K0011391
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jun 2024 18:11:03 GMT
Received: from [10.71.108.229] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 19 Jun
 2024 11:11:02 -0700
Message-ID: <74679ab7-da92-43bc-96e8-5c6e3a1dee62@quicinc.com>
Date: Wed, 19 Jun 2024 11:11:02 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/14] drm/msm/hdmi: expand the HDMI_CFG macro
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul
	<sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        "David
 Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20240522-fd-hdmi-hpd-v2-0-c30bdb7c5c7e@linaro.org>
 <20240522-fd-hdmi-hpd-v2-11-c30bdb7c5c7e@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20240522-fd-hdmi-hpd-v2-11-c30bdb7c5c7e@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ah9FMWTw14ldEQO3f1xzZYNURm3aTeLD
X-Proofpoint-ORIG-GUID: ah9FMWTw14ldEQO3f1xzZYNURm3aTeLD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-19_02,2024-06-19_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 spamscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406190137



On 5/22/2024 3:51 AM, Dmitry Baryshkov wrote:
> Expand the HDMI_CFG() macro in HDMI config description. It has no added
> value other than hiding some boilerplate declarations.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

> ---
>   drivers/gpu/drm/msm/hdmi/hdmi.c | 16 ++++++++--------
>   drivers/gpu/drm/msm/hdmi/hdmi.h |  2 +-
>   2 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
> index c39a1f3a7505..e160a23e962e 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
> @@ -223,24 +223,24 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
>    * The hdmi device:
>    */
>   
> -#define HDMI_CFG(item, entry) \
> -	.item ## _names = item ##_names_ ## entry, \
> -	.item ## _cnt   = ARRAY_SIZE(item ## _names_ ## entry)
> -
>   static const char *pwr_reg_names_8960[] = {"core-vdda"};
>   static const char *pwr_clk_names_8960[] = {"core", "master_iface", "slave_iface"};
>   
>   static const struct hdmi_platform_config hdmi_tx_8960_config = {
> -		HDMI_CFG(pwr_reg, 8960),
> -		HDMI_CFG(pwr_clk, 8960),
> +	.pwr_reg_names = pwr_reg_names_8960,
> +	.pwr_reg_cnt = ARRAY_SIZE(pwr_reg_names_8960),
> +	.pwr_clk_names = pwr_clk_names_8960,
> +	.pwr_clk_cnt = ARRAY_SIZE(pwr_clk_names_8960),
>   };
>   
>   static const char *pwr_reg_names_8x74[] = {"core-vdda", "core-vcc"};
>   static const char *pwr_clk_names_8x74[] = {"iface", "core", "mdp_core", "alt_iface"};
>   
>   static const struct hdmi_platform_config hdmi_tx_8974_config = {
> -		HDMI_CFG(pwr_reg, 8x74),
> -		HDMI_CFG(pwr_clk, 8x74),
> +	.pwr_reg_names = pwr_reg_names_8x74,
> +	.pwr_reg_cnt = ARRAY_SIZE(pwr_reg_names_8x74),
> +	.pwr_clk_names = pwr_clk_names_8x74,
> +	.pwr_clk_cnt = ARRAY_SIZE(pwr_clk_names_8x74),
>   };
>   
>   /*
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
> index 1e346e697f8e..2a98efa8b6bd 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi.h
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
> @@ -89,7 +89,7 @@ struct hdmi_platform_config {
>   	const char **pwr_reg_names;
>   	int pwr_reg_cnt;
>   
> -	/* clks that need to be on for hpd: */
> +	/* clks that need to be on: */
>   	const char **pwr_clk_names;
>   	int pwr_clk_cnt;
>   };
> 
> -- 
> 2.39.2
> 

