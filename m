Return-Path: <linux-arm-msm+bounces-42382-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BEE9F3A1E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 20:46:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6533A1645FA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 19:46:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFB6D2063F7;
	Mon, 16 Dec 2024 19:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KvftCxGn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1263514A4D4;
	Mon, 16 Dec 2024 19:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734378393; cv=none; b=HIpAcvjAMMuJtIPPkH2JL0Gq8CyPpveO5UzJ2Ao89MGy89QA3Adjp4ZFZZ5YMd+FQMoHjYTsW31J2zU8CV0nadOHpifJWkwk8RUtYk5aWPRqhuANnyuQuvGi3LgP4cYztJ7sqLyKLW7X5nEgRH3U5x7+XyhTQmU9e1h62yFTxzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734378393; c=relaxed/simple;
	bh=RLUntgJcAtM8NP7THRlyqK5g3ipxcNtp7E3Czb/3EgY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=HEcI+tDVg1LvgdJ9rPskYYZLQOFYNALCijAP/YPHmXI/v72cZyIueHk4OiIsy0hf5D60JISsKrssyw0fhnjuj2MhnIETN6tDklfnugTQWiNqygBPhF55xIqeEucD5L23p+NEesIt2r/22ZGCYZyyfD+MWAhjG6I6Kb5bYw8n0hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KvftCxGn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGFgVke015402;
	Mon, 16 Dec 2024 19:46:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EZX1kqIMLz6GdpHdIEmLG54+LmHa25JfHQjG5BAGSMM=; b=KvftCxGnxFlSx1yh
	rHIZsr2++G/odbS0eRoCbSU9G0JpbmUFji0PBhIcU7uB+A5DuS+ZbxmtgKKnARMI
	xJIh7IgLTd81qfj2K1acU8D6ZMki2qDInB4okt/wyPotWF68pLpXoE3u/nVTTftS
	En+EsTN6P17vD1G/qCdI2khjrknHQsqMUgLVgiAT9umgPzfFVgt2VJPan5Fqw66i
	dC5AE3XUEbpKCaoe9F6oYI+nOYBGK9rvZbpImaFOaur15J5KtrsApxQXQOfM0qJg
	GM2qVVb1DHunyg9lV3vo72ANZ88hGMYAwIc/QRZOv9mCczx6UqeRi3uC2aEfsY5V
	dl2TRA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43jq350m91-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 19:46:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BGJkOsC005915
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 19:46:24 GMT
Received: from [10.110.88.253] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 16 Dec
 2024 11:46:22 -0800
Message-ID: <9fb5986b-f375-4300-b50c-92bb9c0b4399@quicinc.com>
Date: Mon, 16 Dec 2024 11:46:21 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/16] drm/msm/dp: split MMSS_DP_DSC_DTO register write
 to a separate function
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>,
        Paloma Arellano <quic_parellan@quicinc.com>
CC: Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd
	<swboyd@chromium.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>
References: <20241216-fd-dp-audio-fixup-v4-0-f8d1961cf22f@linaro.org>
 <20241216-fd-dp-audio-fixup-v4-6-f8d1961cf22f@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20241216-fd-dp-audio-fixup-v4-6-f8d1961cf22f@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: EvqjYVgfZqa5_ucbbtS9wEPbQs__TbEy
X-Proofpoint-ORIG-GUID: EvqjYVgfZqa5_ucbbtS9wEPbQs__TbEy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 malwarescore=0 clxscore=1015 mlxlogscore=999 impostorscore=0
 mlxscore=0 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412160163



On 12/15/2024 2:44 PM, Dmitry Baryshkov wrote:
> It's the dp_panel's duty to clear the MMSS_DP_DSC_DTO register. Once DP
> driver gets DSC support, it will handle that register in other places
> too. Split a call to write 0x0 to that register to a separate function.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/dp/dp_catalog.c | 8 ++++++++
>   drivers/gpu/drm/msm/dp/dp_catalog.h | 2 ++
>   drivers/gpu/drm/msm/dp/dp_ctrl.c    | 2 ++
>   3 files changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
> index 7b7eadb2f83b169d8df27ee93589abe05b38f3ae..354ec834f9357c4797fc08a4532e69acc67b4317 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> @@ -1039,6 +1039,14 @@ void msm_dp_catalog_panel_tpg_disable(struct msm_dp_catalog *msm_dp_catalog)
>   	msm_dp_write_p0(catalog, MMSS_DP_TIMING_ENGINE_EN, 0x0);
>   }
>   
> +void msm_dp_catalog_panel_clear_dsc_dto(struct msm_dp_catalog *msm_dp_catalog)
> +{
> +	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
> +				struct msm_dp_catalog_private, msm_dp_catalog);
> +
> +	msm_dp_write_p0(catalog, MMSS_DP_DSC_DTO, 0x0);
> +}

This is already done msm_dp_catalog_ctrl_config_msa(), this is either a 
duplicate or redundant.

void msm_dp_catalog_ctrl_config_msa(..........)
{
	**********
         msm_dp_write_link(catalog, REG_DP_SOFTWARE_NVID, nvid);
         msm_dp_write_p0(catalog, MMSS_DP_DSC_DTO, 0x0);
}

> +
>   static void __iomem *msm_dp_ioremap(struct platform_device *pdev, int idx, size_t *len)
>   {
>   	struct resource *res;
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
> index 6678b0ac9a67881244884d59487fa288d33d1be7..08bb42e91b779633875dbeb4130bc55a6571cfb1 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.h
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
> @@ -92,6 +92,8 @@ void msm_dp_catalog_panel_tpg_enable(struct msm_dp_catalog *msm_dp_catalog,
>   				struct drm_display_mode *drm_mode);
>   void msm_dp_catalog_panel_tpg_disable(struct msm_dp_catalog *msm_dp_catalog);
>   
> +void msm_dp_catalog_panel_clear_dsc_dto(struct msm_dp_catalog *msm_dp_catalog);
> +
>   struct msm_dp_catalog *msm_dp_catalog_get(struct device *dev);
>   
>   /* DP Audio APIs */
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 9c463ae2f8fae916661fef1c7e225f55c1026478..b9c461fee96f8fae9259ce03a32e1155b42d17bb 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -2011,6 +2011,8 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train
>   		pixel_rate_orig,
>   		ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420);
>   
> +	msm_dp_catalog_panel_clear_dsc_dto(ctrl->catalog);
> +
>   	msm_dp_ctrl_setup_tr_unit(ctrl);
>   
>   	msm_dp_catalog_ctrl_state_ctrl(ctrl->catalog, DP_STATE_CTRL_SEND_VIDEO);
> 

