Return-Path: <linux-arm-msm+bounces-55756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFC5A9D272
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 21:54:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 622DD1B67DF4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 19:54:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8B6E22068B;
	Fri, 25 Apr 2025 19:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JfnAGp7G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EABF21D585;
	Fri, 25 Apr 2025 19:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745610825; cv=none; b=Uf6cmYghsoC0VCxUjIpPZ2YPHneEuGbjp1FdJpZUbOLe3OTTTymtLg6L+mxjsZnTEep8L8GdHScNFacjr1qqJ4iMzxulQFxkTDlzajNWFxVWQw1tX/xBPyF6JcyqjDwugdW2/PDVRxsTNuGJ4UwmOp9l8QfR/1e5P7ciUlU5Q8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745610825; c=relaxed/simple;
	bh=GVGGFFFuWMrC31pbYOtXO9+xDJL3kkM9HwlStBuetMw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Lj2vkEhT/SqUKyrUpwakkxM+EQyXeQSKfTMrfc7YqNbQtBxLimi7nL3tjdicj9ZchSruLmJUqAn2dfgOpbbNt9Z/QIB6VHh79QbLnUUvhzBqyvaHALRU6yscWle2UGoVmxj23t251sYZLwVfcCBL12izzVi0zAJOjXeMibxRvME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JfnAGp7G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJtdh001325;
	Fri, 25 Apr 2025 19:53:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b0GdekIXLJ52YLpPBRj9ry6Fbx5J+mnDMdK4sylhJ94=; b=JfnAGp7Gh4YZFLQs
	dBpinHfmtrdMeu2vftxLZLr4gtLM7+b0u6v38oULBGZeLeL8urpkplw0uyqn08NX
	qDEtGYGbqXB9EBxxmLK+5PnT+nUdNzgVzjxuaO7AP1W+KaIwY9hZD+v4KA2GfpEH
	ijJcUMEEkRDt9MVaaKdYSvGdThq7p8kpdl+w0LElwm1pe4aUUfxzH9myezdte0hh
	BdM+F5HcVs2trivLTUHWdcguRckLuHq1iauK7jw+5CHdGzqHGO1MPwVRuQaQkOHc
	qzdh+1kQv6bj6EbxF+M9d3j55TeAXnLvOZaVIs9qMN25yQeLe3sgL1LnzwH+Fof0
	u0p26w==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3j63f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Apr 2025 19:53:29 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53PJrShV019405
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Apr 2025 19:53:28 GMT
Received: from [10.110.43.17] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 25 Apr
 2025 12:53:26 -0700
Message-ID: <7568f022-405e-4289-8448-f74d519066a1@quicinc.com>
Date: Fri, 25 Apr 2025 12:53:25 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/7] drm/msm/mdp4: register the LVDS PLL as a clock
 provider
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark
	<robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        "Sean
 Paul" <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard
	<mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>
References: <20250425-fd-mdp4-lvds-v4-0-6b212160b44c@oss.qualcomm.com>
 <20250425-fd-mdp4-lvds-v4-3-6b212160b44c@oss.qualcomm.com>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20250425-fd-mdp4-lvds-v4-3-6b212160b44c@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDE0MSBTYWx0ZWRfX1Kf0p/AQlxrP 5iLf1rH1B9B32awo6prxpSCOFR2Y6fk/pPQe5kf8vnIZsLwb/izbKYJZWOljY0AmLrUfIS+aOWo uhmd++df/2MlrmFqy0LOpQ/xWsf73zmWPdujXtY/5X501jO1cpGa7svUfZ9dsLyfkETPnL5SIRw
 y4Q4oYH0D0ysR/vBpXGsddJn0AmaUzSpdkGnQXV+vCqauL9iUxcesBwGvyunh1u5scztFyjAHSi oBMpRjKofM/+qqZ/2wxx7fzYkGy/WoQXOYssctrf0Jr1oaI/A9oNtKQQ1tgfVLaPWyBC5nn5ODV isyxt+cNlXSFo654pad6lzKLsaH4OLi8lrd/Hvq50tzGhikx4bpYKLEn3XNWyhM4HEsiDbdF7z/
 abQxVv/AQ4pVjrwP0K8IDe+p+1PIzKtM91U0tXw907pONrDYSLKm1OOt3ipbEX+OLwSwXUmG
X-Authority-Analysis: v=2.4 cv=bs1MBFai c=1 sm=1 tr=0 ts=680be839 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=E5NuDijkP8XiyeSWTxoA:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: wx5v8QicgcKWlg6eKtaXH9O5WxHPlOfy
X-Proofpoint-GUID: wx5v8QicgcKWlg6eKtaXH9O5WxHPlOfy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=931 mlxscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250141



On 4/25/2025 2:51 AM, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> The LVDS/LCDC controller uses pixel clock coming from the multimedia
> controller (mmcc) rather than using the PLL directly. Stop using LVDS
> PLL directly and register it as a clock provider. Use lcdc_clk as a
> pixel clock for the LCDC.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h          |  2 +-
>   drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c |  3 +-
>   drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c     | 45 ++++++++++++++++-------
>   3 files changed, 34 insertions(+), 16 deletions(-)
> 


Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

