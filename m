Return-Path: <linux-arm-msm+bounces-8497-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1C383E54B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 23:24:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 03BFD285B85
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 22:24:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6E7325545;
	Fri, 26 Jan 2024 22:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ivuosyhh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3323A45960
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jan 2024 22:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706307821; cv=none; b=X3pwNkoGxRq1I4pFrgt9MfI+HIOb8s/sdT+j2S4fBljF8xuGwgvkMH37wpf2OiY55AMs6K6mZtC+VWNFLwvMNOoJ+5Bj9RLGvibkDlE6jP0bC5byrg+y1NQFs8XiKDP+divLzBhV2lb0hP10gTregIrw4YPmlSvCaga23AcC8wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706307821; c=relaxed/simple;
	bh=XjQPEV0qYmS+r8SfBCAX9ofxP52qCLNwg8OLEt2/5Y0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=PXoOBaxzNc8NSaFN0V5kU1BaBxFAJKbkCwRIczpYYnyufIQ01KM620/oSoIUEgjKZLLpghRlYsp55oKhpI7l1Rm2BpdgFzbMoMaKs9NE+1fcPaf6J8zg3eAw6XAXK9ohPUddaYWYBctEXTsTiIjCByPoLy8J2c5IX71drofbOgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ivuosyhh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40QM60VU011309;
	Fri, 26 Jan 2024 22:23:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=fP6CSpqED3D3tINkiDuOp56e/y7uxfVbWmAT956xukg=; b=iv
	uosyhhAcwtHS6w16U1DfbdLeTV1ybHAMGqcr1CDXwNUtmEqdE9rCul0nFFf4aME1
	th8uwRuQjc7eTMnlPIiHVGtKsTzxuAFAp4js89aTGohqLxN3puKPp7DRXpCL5Evp
	vR3st59R/dnw1/FzgrlARi29JRjWeEwGtTglWLEU7lEGr3Vi6nI+WsaOhCerX/fH
	M8MoexlVuWjMUQ5tr5WDK/F6p2AUeVyVWe1i12KkkF/etCut3UwWqwpPNKRxX6aL
	mf4MC02gn2Qv44/PsSvKMHTc51A4jkPOpATinxPOypiCtAPIY5fanbpZ2ZjaXRPC
	CANPyxpQ1DbOXe376qaQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vvgy8gj9e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jan 2024 22:23:31 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40QMNUU8024940
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jan 2024 22:23:30 GMT
Received: from [10.110.48.234] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 26 Jan
 2024 14:23:29 -0800
Message-ID: <983c508a-f2f3-6765-5cbf-649479cf2ff6@quicinc.com>
Date: Fri, 26 Jan 2024 14:23:28 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH RESEND v3 10/15] drm/msm/dp: remove PHY handling from
 dp_catalog.c
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul
	<sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        "David
 Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Stephen Boyd
	<swboyd@chromium.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20240126-dp-power-parser-cleanup-v3-0-098d5f581dd3@linaro.org>
 <20240126-dp-power-parser-cleanup-v3-10-098d5f581dd3@linaro.org>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <20240126-dp-power-parser-cleanup-v3-10-098d5f581dd3@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 0zUYq7UJe9SJUR4D2Wv_be8Vvd_m_fyg
X-Proofpoint-ORIG-GUID: 0zUYq7UJe9SJUR4D2Wv_be8Vvd_m_fyg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 impostorscore=0
 mlxscore=0 phishscore=0 spamscore=0 adultscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401260164


On 1/26/2024 10:26 AM, Dmitry Baryshkov wrote:
> Inline dp_catalog_aux_update_cfg() and call phy_calibrate() from dp_aux
> functions directly.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Tested-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
Reviewed-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_aux.c     |  9 +++++++--
>   drivers/gpu/drm/msm/dp/dp_aux.h     |  1 +
>   drivers/gpu/drm/msm/dp/dp_catalog.c | 12 ------------
>   drivers/gpu/drm/msm/dp/dp_catalog.h |  1 -
>   drivers/gpu/drm/msm/dp/dp_display.c |  4 +++-
>   5 files changed, 11 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
> index 03f4951c49f4..adbd5a367395 100644
> --- a/drivers/gpu/drm/msm/dp/dp_aux.c
> +++ b/drivers/gpu/drm/msm/dp/dp_aux.c
> @@ -4,6 +4,7 @@
>    */
>   
>   #include <linux/delay.h>
> +#include <linux/phy/phy.h>
>   #include <drm/drm_print.h>
>   
>   #include "dp_reg.h"
> @@ -23,6 +24,8 @@ struct dp_aux_private {
>   	struct device *dev;
>   	struct dp_catalog *catalog;
>   
> +	struct phy *phy;
> +
>   	struct mutex mutex;
>   	struct completion comp;
>   
> @@ -336,7 +339,7 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
>   		if (aux->native) {
>   			aux->retry_cnt++;
>   			if (!(aux->retry_cnt % MAX_AUX_RETRIES))
> -				dp_catalog_aux_update_cfg(aux->catalog);
> +				phy_calibrate(aux->phy);
>   		}
>   		/* reset aux if link is in connected state */
>   		if (dp_catalog_link_is_connected(aux->catalog))
> @@ -439,7 +442,7 @@ void dp_aux_reconfig(struct drm_dp_aux *dp_aux)
>   
>   	aux = container_of(dp_aux, struct dp_aux_private, dp_aux);
>   
> -	dp_catalog_aux_update_cfg(aux->catalog);
> +	phy_calibrate(aux->phy);
>   	dp_catalog_aux_reset(aux->catalog);
>   }
>   
> @@ -517,6 +520,7 @@ static int dp_wait_hpd_asserted(struct drm_dp_aux *dp_aux,
>   }
>   
>   struct drm_dp_aux *dp_aux_get(struct device *dev, struct dp_catalog *catalog,
> +			      struct phy *phy,
>   			      bool is_edp)
>   {
>   	struct dp_aux_private *aux;
> @@ -537,6 +541,7 @@ struct drm_dp_aux *dp_aux_get(struct device *dev, struct dp_catalog *catalog,
>   
>   	aux->dev = dev;
>   	aux->catalog = catalog;
> +	aux->phy = phy;
>   	aux->retry_cnt = 0;
>   
>   	/*
> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.h b/drivers/gpu/drm/msm/dp/dp_aux.h
> index 511305da4f66..16d9b1758748 100644
> --- a/drivers/gpu/drm/msm/dp/dp_aux.h
> +++ b/drivers/gpu/drm/msm/dp/dp_aux.h
> @@ -17,6 +17,7 @@ void dp_aux_deinit(struct drm_dp_aux *dp_aux);
>   void dp_aux_reconfig(struct drm_dp_aux *dp_aux);
>   
>   struct drm_dp_aux *dp_aux_get(struct device *dev, struct dp_catalog *catalog,
> +			      struct phy *phy,
>   			      bool is_edp);
>   void dp_aux_put(struct drm_dp_aux *aux);
>   
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
> index e07651768805..4c6207797c99 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> @@ -7,8 +7,6 @@
>   
>   #include <linux/delay.h>
>   #include <linux/iopoll.h>
> -#include <linux/phy/phy.h>
> -#include <linux/phy/phy-dp.h>
>   #include <linux/rational.h>
>   #include <drm/display/drm_dp_helper.h>
>   #include <drm/drm_print.h>
> @@ -243,16 +241,6 @@ void dp_catalog_aux_enable(struct dp_catalog *dp_catalog, bool enable)
>   	dp_write_aux(catalog, REG_DP_AUX_CTRL, aux_ctrl);
>   }
>   
> -void dp_catalog_aux_update_cfg(struct dp_catalog *dp_catalog)
> -{
> -	struct dp_catalog_private *catalog = container_of(dp_catalog,
> -				struct dp_catalog_private, dp_catalog);
> -	struct dp_io *dp_io = catalog->io;
> -	struct phy *phy = dp_io->phy;
> -
> -	phy_calibrate(phy);
> -}
> -
>   int dp_catalog_aux_wait_for_hpd_connect_state(struct dp_catalog *dp_catalog)
>   {
>   	u32 state;
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
> index ba7c62ba7ca3..1f3f58d4b8de 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.h
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
> @@ -84,7 +84,6 @@ int dp_catalog_aux_clear_trans(struct dp_catalog *dp_catalog, bool read);
>   int dp_catalog_aux_clear_hw_interrupts(struct dp_catalog *dp_catalog);
>   void dp_catalog_aux_reset(struct dp_catalog *dp_catalog);
>   void dp_catalog_aux_enable(struct dp_catalog *dp_catalog, bool enable);
> -void dp_catalog_aux_update_cfg(struct dp_catalog *dp_catalog);
>   int dp_catalog_aux_wait_for_hpd_connect_state(struct dp_catalog *dp_catalog);
>   u32 dp_catalog_aux_get_irq(struct dp_catalog *dp_catalog);
>   
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 6fbbd0f93d13..c1a51c498e01 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -729,7 +729,9 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
>   		goto error;
>   	}
>   
> -	dp->aux = dp_aux_get(dev, dp->catalog, dp->dp_display.is_edp);
> +	dp->aux = dp_aux_get(dev, dp->catalog,
> +			     dp->parser->io.phy,
> +			     dp->dp_display.is_edp);
>   	if (IS_ERR(dp->aux)) {
>   		rc = PTR_ERR(dp->aux);
>   		DRM_ERROR("failed to initialize aux, rc = %d\n", rc);
>

