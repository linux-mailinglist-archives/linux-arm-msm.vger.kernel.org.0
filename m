Return-Path: <linux-arm-msm+bounces-47503-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A44FBA30122
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 02:51:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 656843A3295
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 01:51:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1335426BD8B;
	Tue, 11 Feb 2025 01:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gvUlKOym"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4409C22318;
	Tue, 11 Feb 2025 01:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739238701; cv=none; b=ZLGr69CE5fxP0vJPCcwHee3G3VlrZIP1MztqviBzbf75ROtei7v7Zu3Bo+nIPV/U+2n0eKo/0DYBYAVbnBSDrGwWinZ5WtEAtKFQX823NWKkv6jGCAXvBoL/fSdehNfsxC06L/J0OC20t73y3jJiKuxdRtnoAOhXQTGjWZ2tfm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739238701; c=relaxed/simple;
	bh=nCIiUV1jtuHcR3eWZYKD3letQjclk1G0r5X/zLiu3Y8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=CQSFlv5HBBohAm2U9RnDzCl8RQToML8m9ngQrsBwXyjKcza6c5fyiHGfXKP+DM9LUAlkfiRC6L10AnaSHFbvFvPGLlnfT7CFouopw/2z5l2eoSOU50XiB8xe0fckPIIHzQkssfYAARqvUsRtYtXUVhp7R7eSr4YlDMU5n4QXWDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gvUlKOym; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51AHtKVL006114;
	Tue, 11 Feb 2025 01:51:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1ggmpUlEH9eixLyKpXlpoLJ8PIqcM2pSQEaa1a9t2qg=; b=gvUlKOym++NFtjDO
	dtj9SjXES6RMjChSYtntdYhOmTZuXZ5HL7yz3QcL7Qb7yva6Nfm26B+UdysJN2gD
	t+Ei+WtfyF+7lmbnnFmb5eOlHwcAWc9Z3wg6LqyypHv/i7qf3JkPKMYNXyhhXVeo
	+BHlNd8vC+QUBV8ngmn1SPRD+G8n2ImYt97UN/vR/DTuDWPE5avmXPDUDA3Od12k
	9P7lvFUJnML75hq9G1L588F7LQjzblF5lMRUrIHRd0SsWbSPnkg39VoEHOIwTpXv
	wx5r9Nlmu9JQMUdoqGAUVrP/5cIhizZ7V2pcnIa/nMcEtEH4icX2cVfZiX//WE12
	VrlvzA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qe5mtg1w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 01:51:24 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51B1pNme021339
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 01:51:23 GMT
Received: from [10.134.70.212] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 10 Feb
 2025 17:51:23 -0800
Message-ID: <887a8c60-ef53-4f46-9dd1-c74f266f8bb2@quicinc.com>
Date: Mon, 10 Feb 2025 17:51:07 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] drm/msm/dsi: Use existing per-interface slice
 count in DSC timing
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Clark
	<robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, "David
 Airlie" <airlied@gmail.com>,
        Vinod Koul <vkoul@kernel.org>, Simona Vetter
	<simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        "Jordan
 Crouse" <jordan@cosmicpenguin.net>,
        <~postmarketos/upstreaming@lists.sr.ht>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        "Martin
 Botka" <martin.botka@somainline.org>,
        Jami Kettunen
	<jami.kettunen@somainline.org>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>
References: <20250209-drm-msm-initial-dualpipe-dsc-fixes-v2-0-9a60184fdc36@somainline.org>
 <20250209-drm-msm-initial-dualpipe-dsc-fixes-v2-1-9a60184fdc36@somainline.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20250209-drm-msm-initial-dualpipe-dsc-fixes-v2-1-9a60184fdc36@somainline.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: WVlzP2eybIJaV7B7JPZcca6eFxe4rx8v
X-Proofpoint-ORIG-GUID: WVlzP2eybIJaV7B7JPZcca6eFxe4rx8v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_01,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 clxscore=1011 suspectscore=0 mlxscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502110009



On 2/9/2025 1:42 PM, Marijn Suijten wrote:
> When configuring the timing of DSI hosts (interfaces) in
> dsi_timing_setup() all values written to registers are taking
> bonded-mode into account by dividing the original mode width by 2
> (half the data is sent over each of the two DSI hosts), but the full
> width instead of the interface width is passed as hdisplay parameter to
> dsi_update_dsc_timing().
> 
> Currently only msm_dsc_get_slices_per_intf() is called within
> dsi_update_dsc_timing() with the `hdisplay` argument which clearly
> documents that it wants the width of a single interface (which, again,
> in bonded DSI mode is half the total width of the mode) resulting in all
> subsequent values to be completely off.
> 
> However, as soon as we start to pass the halved hdisplay
> into dsi_update_dsc_timing() we might as well discard
> msm_dsc_get_slices_per_intf() since the value it calculates is already
> available in dsc->slice_count which is per-interface by the current
> design of MSM DPU/DSI implementations and their use of the DRM DSC
> helpers.
> 
> Fixes: 08802f515c3c ("drm/msm/dsi: Add support for DSC configuration")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>

Hi Marijn,

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Thanks,

Jessica Zhang

> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c   |  8 ++++----
>   drivers/gpu/drm/msm/msm_dsc_helper.h | 11 -----------
>   2 files changed, 4 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 007311c21fdaa0462b05d53cd8a2aad0269b1727..42e100a8adca09d7b55afce0e2553e76d898744f 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -846,7 +846,7 @@ static void dsi_ctrl_enable(struct msm_dsi_host *msm_host,
>   		dsi_write(msm_host, REG_DSI_CPHY_MODE_CTRL, BIT(0));
>   }
>   
> -static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mode, u32 hdisplay)
> +static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mode)
>   {
>   	struct drm_dsc_config *dsc = msm_host->dsc;
>   	u32 reg, reg_ctrl, reg_ctrl2;
> @@ -858,7 +858,7 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
>   	/* first calculate dsc parameters and then program
>   	 * compress mode registers
>   	 */
> -	slice_per_intf = msm_dsc_get_slices_per_intf(dsc, hdisplay);
> +	slice_per_intf = dsc->slice_count;
>   
>   	total_bytes_per_intf = dsc->slice_chunk_size * slice_per_intf;
>   	bytes_per_pkt = dsc->slice_chunk_size; /* * slice_per_pkt; */
> @@ -991,7 +991,7 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>   
>   	if (msm_host->mode_flags & MIPI_DSI_MODE_VIDEO) {
>   		if (msm_host->dsc)
> -			dsi_update_dsc_timing(msm_host, false, mode->hdisplay);
> +			dsi_update_dsc_timing(msm_host, false);
>   
>   		dsi_write(msm_host, REG_DSI_ACTIVE_H,
>   			DSI_ACTIVE_H_START(ha_start) |
> @@ -1012,7 +1012,7 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>   			DSI_ACTIVE_VSYNC_VPOS_END(vs_end));
>   	} else {		/* command mode */
>   		if (msm_host->dsc)
> -			dsi_update_dsc_timing(msm_host, true, mode->hdisplay);
> +			dsi_update_dsc_timing(msm_host, true);
>   
>   		/* image data and 1 byte write_memory_start cmd */
>   		if (!msm_host->dsc)
> diff --git a/drivers/gpu/drm/msm/msm_dsc_helper.h b/drivers/gpu/drm/msm/msm_dsc_helper.h
> index b9049fe1e2790703a6f42dd7e6cd3fa5eea29389..63f95523b2cbb48f822210ac47cdd3526f231a89 100644
> --- a/drivers/gpu/drm/msm/msm_dsc_helper.h
> +++ b/drivers/gpu/drm/msm/msm_dsc_helper.h
> @@ -12,17 +12,6 @@
>   #include <linux/math.h>
>   #include <drm/display/drm_dsc_helper.h>
>   
> -/**
> - * msm_dsc_get_slices_per_intf() - calculate number of slices per interface
> - * @dsc: Pointer to drm dsc config struct
> - * @intf_width: interface width in pixels
> - * Returns: Integer representing the number of slices for the given interface
> - */
> -static inline u32 msm_dsc_get_slices_per_intf(const struct drm_dsc_config *dsc, u32 intf_width)
> -{
> -	return DIV_ROUND_UP(intf_width, dsc->slice_width);
> -}
> -
>   /**
>    * msm_dsc_get_bytes_per_line() - calculate bytes per line
>    * @dsc: Pointer to drm dsc config struct
> 
> -- 
> 2.48.1
> 
> 


