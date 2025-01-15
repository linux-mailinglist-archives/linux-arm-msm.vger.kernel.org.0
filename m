Return-Path: <linux-arm-msm+bounces-45165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 65558A12D79
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 22:15:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 89FDE165CB8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 21:15:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 141AD1D7E3E;
	Wed, 15 Jan 2025 21:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GnQxberT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544A3160799;
	Wed, 15 Jan 2025 21:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736975738; cv=none; b=WrBavgCGA4aEIKRrIvoNIU39Z7NMyJ3EnM3ah2lrgPe52AMj+atG+Dq8y5u1amXGiV/11625QhoynyL4W5/swYkDQhKJZ/N3jO02TlNWyM+CfP2qr+K6o4SQ6Ng/BltIHyb1nPk6rJGLe9ewV5cdtfAZlL2+gchIVaDLPSvfhis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736975738; c=relaxed/simple;
	bh=rDjaybGQZF23E1WyDmv0W3reB4jepPv08OKHB4KxGAM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=VamVeu3tFx/BOCYWfwlBMS6IYkrJCRg/qEHjaVMkMdQr0PhKnagrKx03DzCbufsHw3JMdFHnv+4V+eUE13U9c4On0jYwHOL3blewG6CUOXKLj2rWPAeWe3W6aSi1/TzbIZpXkChz8wE3c+cQNMvNIQtcgq7lsOojIn6oVS+iWzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GnQxberT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50FGnPss023940;
	Wed, 15 Jan 2025 21:15:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W3nTy/lcFyHXXQbO1F0oZHribXSjAbymZq95+TFMwUg=; b=GnQxberTyf5IVELT
	XROb9DGhzc7DhOYL64L8GfhnsTLupHbO7HLBAdE9yMRqC+vVVLUZ0R8JVcKL3JmJ
	RRWHZoiHqbspGrJfsTEF2LoLxQabSzm+ygITzGZ4b/sj8Q5AsSanMrj+wESRqVl5
	LPQ8QgqzRaoHSwTwXALpyEWXi83yEQmDXDS9rs6YAqAyFAXtErcJWNLzGzZz05JH
	JD+tbn/nFT243hLLlnHwC0EFz5PFYmlmzgfspy0tc9FhfaWJ3Mt85LeTIuh46xnX
	iIfXTOdDFXrm1iC5bNWchG+o60MV3SPDFkuCFqOW3rMdEN5EsE97ccJGM96Q+k2j
	XD9UFw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 446fpcgth2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jan 2025 21:15:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50FLFR9h002386
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jan 2025 21:15:27 GMT
Received: from [10.71.108.79] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 15 Jan
 2025 13:15:26 -0800
Message-ID: <b2f8e0b4-b8f1-4e90-be2d-715fbd89a1e3@quicinc.com>
Date: Wed, 15 Jan 2025 13:15:26 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: Use str_enable_disable-like helpers
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean
 Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20250114191724.861601-1-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20250114191724.861601-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: QstY7v729ZTJ7B2fNWKnZV4XNfEP87PM
X-Proofpoint-ORIG-GUID: QstY7v729ZTJ7B2fNWKnZV4XNfEP87PM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-15_09,2025-01-15_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=779 clxscore=1015 suspectscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501150152



On 1/14/2025 11:17 AM, Krzysztof Kozlowski wrote:
> Replace ternary (condition ? "enable" : "disable") syntax with helpers
> from string_choices.h because:
> 1. Simple function call with one argument is easier to read.  Ternary
>     operator has three arguments and with wrapping might lead to quite
>     long code.
> 2. Is slightly shorter thus also easier to read.
> 3. It brings uniformity in the text - same string.
> 4. Allows deduping by the linker, which results in a smaller binary
>     file.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  |  5 ++--
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c      |  3 ++-
>   drivers/gpu/drm/msm/dp/dp_ctrl.c              | 25 ++++++++++---------
>   drivers/gpu/drm/msm/dp/dp_display.c           |  4 +--
>   drivers/gpu/drm/msm/dp/dp_drm.c               |  5 ++--
>   5 files changed, 23 insertions(+), 19 deletions(-)
> 

Interesting helper str_true_false :)

LGTM,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

