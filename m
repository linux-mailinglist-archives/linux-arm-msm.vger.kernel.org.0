Return-Path: <linux-arm-msm+bounces-23154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE9A90DF8B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 01:03:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9BE5BB211C9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 23:02:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0482E16DC17;
	Tue, 18 Jun 2024 23:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="h1atyNwS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8752014D44D;
	Tue, 18 Jun 2024 23:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718751772; cv=none; b=tJ13dqc1RlZIore4Jix3Gm27zKbsrYsyaW1ho3bsPBzkBVm475faP6ti+RJgbKKowg/EBDcHIQsjoRzhfzjaiZniaVetotWzwxEsxL3ClexImd01dO/afcDm76HrFhVTEjBbBpHg5oh0Tx9zWLeLE82VKKugbWWFAuhkXHs9h4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718751772; c=relaxed/simple;
	bh=wGlyPICsPKE9PE4FG2HJPoYWAfqOKwZosTXlPTYNRlA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=RLvYJjccj976dRiO6qMyVpaRqOzvoF4aKshIUUeuK3YiY1XgEmbsohvlmRhVkNcq6nZHycztJBNsM0mmlEMN2p3ldzSN8/B5vr74pBuQpE1fPEoOUU7tT+n4oI2oK7e61uCO3q070zTo56/0AXRMVBp2mEWB0F5VXAKy2gGF+MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=h1atyNwS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45ILaOPn010843;
	Tue, 18 Jun 2024 23:02:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OqqHrua9arZuM1QP7wr//VxcSAWtoOVDR656DBaoAaQ=; b=h1atyNwSkHrGlz5f
	igQ+V1qHfnqwLvfc1dGc3B7AH6Fj124AJapVuYwLBHFenWH/MqzMpuCtKLiIW4GN
	/OqUX8NK73H26xPLpmryu0FDCMC3n7s8UtTOKUEgP5HjQiKRu3WTbct7MVSV6HUu
	odX2npgFvM3f8wpEUvNspJ8abf8hQdyKlgtiF267JpPysWbh6KfDUfT1fT5+RThg
	PWclutsHJjuWlqpBhMBBaqfxfIuQjwx74rRWfxLcizp8TCZGkf/wrMUr9yYY88Qa
	fgvAi7ZL4aIQPbnYi4r1ZhCBIsdDpAAkUiZAiiGULy8Ug6TxMsIwRvdXhDyDFVlk
	5q5OoA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yuja2g4e7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 23:02:44 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45IN2g9j012376
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 23:02:42 GMT
Received: from [10.71.108.229] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 18 Jun
 2024 16:02:42 -0700
Message-ID: <fb66bdcc-2bc7-4558-9c96-b41619c44021@quicinc.com>
Date: Tue, 18 Jun 2024 16:02:32 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/14] drm/msm/hdmi: drop clock frequency assignment
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
 <20240522-fd-hdmi-hpd-v2-5-c30bdb7c5c7e@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20240522-fd-hdmi-hpd-v2-5-c30bdb7c5c7e@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ari14C3QHLXDbu57MSHaI0wRRzXCBkan
X-Proofpoint-ORIG-GUID: ari14C3QHLXDbu57MSHaI0wRRzXCBkan
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-18_06,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999
 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406180169



On 5/22/2024 3:50 AM, Dmitry Baryshkov wrote:
> The only clock which has frequency being set through hpd_freqs is the
> "core" aka MDSS_HDMI_CLK clock. It always has the specified frequency,
> so we can drop corresponding clk_set_rate() call together with the
> hpd_freq infrastructure.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

> ---
>   drivers/gpu/drm/msm/hdmi/hdmi.c     | 2 --
>   drivers/gpu/drm/msm/hdmi/hdmi.h     | 1 -
>   drivers/gpu/drm/msm/hdmi/hdmi_hpd.c | 9 ---------
>   3 files changed, 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
> index 681265e29aa0..c14e009f38b1 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
> @@ -236,12 +236,10 @@ static const struct hdmi_platform_config hdmi_tx_8960_config = {
>   
>   static const char *pwr_reg_names_8x74[] = {"core-vdda", "core-vcc"};
>   static const char *hpd_clk_names_8x74[] = {"iface", "core", "mdp_core", "alt_iface"};
> -static unsigned long hpd_clk_freq_8x74[] = {0, 19200000, 0, 0};
>   
>   static const struct hdmi_platform_config hdmi_tx_8974_config = {
>   		HDMI_CFG(pwr_reg, 8x74),
>   		HDMI_CFG(hpd_clk, 8x74),
> -		.hpd_freq      = hpd_clk_freq_8x74,
>   };
>   
>   /*
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
> index abdbe4779cf9..c0d60ed23b75 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi.h
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
> @@ -96,7 +96,6 @@ struct hdmi_platform_config {
>   
>   	/* clks that need to be on for hpd: */
>   	const char **hpd_clk_names;
> -	const long unsigned *hpd_freq;
>   	int hpd_clk_cnt;
>   };
>   
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
> index 9ce0ffa35417..7ae69b14e953 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
> @@ -68,15 +68,6 @@ static void enable_hpd_clocks(struct hdmi *hdmi, bool enable)
>   
>   	if (enable) {
>   		for (i = 0; i < config->hpd_clk_cnt; i++) {
> -			if (config->hpd_freq && config->hpd_freq[i]) {
> -				ret = clk_set_rate(hdmi->hpd_clks[i],
> -						   config->hpd_freq[i]);
> -				if (ret)
> -					dev_warn(dev,
> -						 "failed to set clk %s (%d)\n",
> -						 config->hpd_clk_names[i], ret);
> -			}
> -
>   			ret = clk_prepare_enable(hdmi->hpd_clks[i]);
>   			if (ret) {
>   				DRM_DEV_ERROR(dev,
> 
> -- 
> 2.39.2
> 

