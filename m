Return-Path: <linux-arm-msm+bounces-8490-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CA85283E525
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 23:20:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EFC5E1C210D8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 22:20:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D19E250E8;
	Fri, 26 Jan 2024 22:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dUfuz6O4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1972511A
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jan 2024 22:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706307599; cv=none; b=G+AQtNThYRRv1IRQbQWnvCNAHe+dFM53a6zLx9cVujHBYIZ5ov2JqFnaXczJ7JBIOAuXmtuSW5j+GsUCHGh54nc3VhetH0hyA8WfLZl3cYum79uEz6Ded/Z1RiHNZJzCC/jtlExG/w64nBNcvMJVOu3GOwJcGHYCo/OT2bwSb5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706307599; c=relaxed/simple;
	bh=t+vCk/BATwe4zpb+iIgOaEyT0lK1y9w7fW2u8jJnCng=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ZQJmraY0bovCWbEpA6Zl7QP7ldydXq5tzRniTBPXlo2/yaBPWJRpxPxm2Crt/v5q/XB72tmjwK2VEfryY9HJHpC0Hcn2ou8/8kA5mV6EDwU8V2syrmh83mNEdqbLs9RMMUtdOFHX6UD++Fs8dpEjQ+BZ7krt6F5Qj8edKm3Y+2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dUfuz6O4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40QLZ2tJ012653;
	Fri, 26 Jan 2024 22:19:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=ReOgMzSAJJLVYBzHVGwZo9ygciS6OjYZll3/JunpGU8=; b=dU
	fuz6O4bSEdpEEsU6pnijpn9AuTd/Po6PrZ26pZBcYd5H4XTKxZVAAlZp5ddMw/JN
	ZhffQ9Z3my3tN8YzIeSGG0qOjIPkNxsZTo9pDauvJbrfw7Abw28YSLvR52yDvh+P
	JpnhGWQm8F6TxOplhj+xdo2ZKSx3XQu+LfWyAsSAdXqxnc5u7wLNCEeIOuEKg81h
	YLVi0eRTmoa4cg0vhOXFyNI1nvevUZ8kDXVS5vFXbXqb3c9cS/4ev5q9bLdfDhrK
	mFfZev3b6UkGN6qb6/xxbd5JT28537r8fdDuf2u4UuN1YQZUmBx6PrW1Wl+Frs3w
	0Ku09yr8uAvcSFRV+Hqg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vvgy8gj2d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jan 2024 22:19:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40QMJk2v001394
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jan 2024 22:19:46 GMT
Received: from [10.110.48.234] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 26 Jan
 2024 14:19:45 -0800
Message-ID: <2ee64275-6cb9-a969-8d28-f2b36481da6e@quicinc.com>
Date: Fri, 26 Jan 2024 14:19:45 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH RESEND v3 03/15] drm/msm/dp: parse DT from dp_parser_get
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
 <20240126-dp-power-parser-cleanup-v3-3-098d5f581dd3@linaro.org>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <20240126-dp-power-parser-cleanup-v3-3-098d5f581dd3@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: urLB6pBTfKIWy_oi5j3e1RcbCG8eW0s6
X-Proofpoint-ORIG-GUID: urLB6pBTfKIWy_oi5j3e1RcbCG8eW0s6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 impostorscore=0
 mlxscore=0 phishscore=0 spamscore=0 adultscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401260163


On 1/26/2024 10:26 AM, Dmitry Baryshkov wrote:
> It makes little sense to split the submodule get and actual DT parsing.
> Call dp_parser_parse() directly from dp_parser_get(), so that the parser
> data is fully initialised once it is returned to the caller.
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Tested-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
Reviewed-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_display.c | 6 ------
>   drivers/gpu/drm/msm/dp/dp_parser.c  | 8 +++++++-
>   drivers/gpu/drm/msm/dp/dp_parser.h  | 3 ---
>   3 files changed, 7 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index d37d599aec27..67b48f0a6c83 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1266,12 +1266,6 @@ static int dp_display_probe(struct platform_device *pdev)
>   		return -EPROBE_DEFER;
>   	}
>   
> -	rc = dp->parser->parse(dp->parser);
> -	if (rc) {
> -		DRM_ERROR("device tree parsing failed\n");
> -		goto err;
> -	}
> -
>   	rc = dp_power_client_init(dp->power);
>   	if (rc) {
>   		DRM_ERROR("Power client create failed\n");
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
> index 7032dcc8842b..2d9d126c119b 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.c
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.c
> @@ -315,13 +315,19 @@ static int dp_parser_parse(struct dp_parser *parser)
>   struct dp_parser *dp_parser_get(struct platform_device *pdev)
>   {
>   	struct dp_parser *parser;
> +	int ret;
>   
>   	parser = devm_kzalloc(&pdev->dev, sizeof(*parser), GFP_KERNEL);
>   	if (!parser)
>   		return ERR_PTR(-ENOMEM);
>   
> -	parser->parse = dp_parser_parse;
>   	parser->pdev = pdev;
>   
> +	ret = dp_parser_parse(parser);
> +	if (ret) {
> +		dev_err(&pdev->dev, "device tree parsing failed\n");
> +		return ERR_PTR(ret);
> +	}
> +
>   	return parser;
>   }
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
> index 90a2cdbbe344..4ccc432b4142 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.h
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.h
> @@ -67,7 +67,6 @@ struct dss_module_power {
>    *
>    * @pdev: platform data of the client
>    * @mp: gpio, regulator and clock related data
> - * @parse: function to be called by client to parse device tree.
>    */
>   struct dp_parser {
>   	struct platform_device *pdev;
> @@ -76,8 +75,6 @@ struct dp_parser {
>   	u32 max_dp_lanes;
>   	u32 max_dp_link_rate;
>   	struct drm_bridge *next_bridge;
> -
> -	int (*parse)(struct dp_parser *parser);
>   };
>   
>   /**
>

