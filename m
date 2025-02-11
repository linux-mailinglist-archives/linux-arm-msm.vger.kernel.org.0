Return-Path: <linux-arm-msm+bounces-47500-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFB2A2FF0F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 01:26:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D5BA23A52C3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 00:26:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ABC61EA65;
	Tue, 11 Feb 2025 00:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Ls10v3uy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96F828F5;
	Tue, 11 Feb 2025 00:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739233578; cv=none; b=DKIREyciyqOEBj89yMe+u5QbnTGtYd3gyPRF+CrmVvCNBbPTrQOiHtlxnTzHW4wqKpsepwM2wrw5ALUtrrTbrxTydaYEf+XyIsGl/ZhEwg2vItmFOzz+Aajd6YKdp3sVs6akU/Ohnlt6kY3X61H6Pi+/Lp9PYuXfE4CcScR0Ayw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739233578; c=relaxed/simple;
	bh=z2OeqFCBfb8QsgdfefgfDDetS3DZRmFPDxCvjSpTvjk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=O32SjVyqji5CJR5bXqrUguRmFC/b8cYl3VsuK9CoqtfNO8ITWPzX2ZsOR/rm7rwhhKDK9pNZFMxt0hbNNeOuWIwMLtA66poRqFxlc14zUTt0Jvc/JcZYIboP2VnHewFScqWVt6SzB3pUKfaAkUW/GM+dg1la7LxOpLVbUWcv0Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Ls10v3uy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51AI3ceE006115;
	Tue, 11 Feb 2025 00:26:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fykXzZ7ZNKsI71mE5Dgav629B7mqYSKgM2IeldXiYSg=; b=Ls10v3uyko+xs6Mr
	ARcQuVmqaRga+rr2ycPq7iNUveiSiMwRLZf920AUxsVl6+iPgPQyomrMfsy1gt3H
	Af9t+KJiARJFhTv0Z/A6PWPeEPN115ET1pzoefUHDVl/67v8BwIySyaOKSwDd0H1
	t+wwovahK+LcjEEv60T31VNtxXikK01Nqy/iOibUi8SFbco+AyIGoFHKMPaDJyWU
	EoQ5hjW6DOg/pSjgaG1Q1j7JJLSKBMQ5QpzUN7TrdQFWc033G4m0oqBC2MVJZTQd
	6Qx6nOXHGXeZNmz1GvC3JEO/NQBR4faH3KVun7r1rV5SBxDN5S7jnUfNQqNitRNq
	7QyiHA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qe5mtar1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 00:26:09 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51B0Q8h4029026
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 00:26:08 GMT
Received: from [10.71.110.136] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 10 Feb
 2025 16:26:07 -0800
Message-ID: <ef6b4d5c-df4c-478f-8544-7dacd90b88bf@quicinc.com>
Date: Mon, 10 Feb 2025 16:26:06 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] drm/msm/dsi/phy: Protect PHY_CMN_CLK_CFG0 updated
 from driver side
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean
 Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20250203-drm-msm-phy-pll-cfg-reg-v2-0-862b136c5d22@linaro.org>
 <20250203-drm-msm-phy-pll-cfg-reg-v2-1-862b136c5d22@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20250203-drm-msm-phy-pll-cfg-reg-v2-1-862b136c5d22@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Ux8XyDGsldKWABFEwHyztXvO7Qac-Ged
X-Proofpoint-ORIG-GUID: Ux8XyDGsldKWABFEwHyztXvO7Qac-Ged
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_12,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 mlxscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0
 mlxlogscore=985 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502100180



On 2/3/2025 9:29 AM, Krzysztof Kozlowski wrote:
> PHY_CMN_CLK_CFG0 register is updated by the PHY driver and by two
> divider clocks from Common Clock Framework:
> devm_clk_hw_register_divider_parent_hw().  Concurrent access by the
> clocks side is protected with spinlock, however driver's side in
> restoring state is not.  Restoring state is called from
> msm_dsi_phy_enable(), so there could be a path leading to concurrent and
> conflicting updates with clock framework.
> 
> Add missing lock usage on the PHY driver side, encapsulated in its own
> function so the code will be still readable.
> 
> Fixes: 1ef7c99d145c ("drm/msm/dsi: add support for 7nm DSI PHY/PLL")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 13 +++++++++++--
>   1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index 031446c87daec0af3f81df324158311f5a80014e..c164f845653816291ad96c863257f75462ef58e7 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -372,6 +372,15 @@ static void dsi_pll_enable_pll_bias(struct dsi_pll_7nm *pll)
>   	ndelay(250);
>   }
>   

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

