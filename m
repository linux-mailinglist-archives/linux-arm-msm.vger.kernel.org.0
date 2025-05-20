Return-Path: <linux-arm-msm+bounces-58813-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC009ABE688
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 23:55:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 052077A75AF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 21:53:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 122D625E836;
	Tue, 20 May 2025 21:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="flLTWdxL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4102A182BC;
	Tue, 20 May 2025 21:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747777950; cv=none; b=PjmykCHhj5oIM1mO06uY0RoldoHZPOxkna/yFAfknVH0JePLomu688NGKqAVn1V+Ck1tRg8HoIM3iBSaRPYev8v5KfUGS2sf0fiSXGye7k1FYbx+KAUDRNVM8Eb5nW2Regf/zHDz/h7WW7Qvt1IiL/67Gxz453F0hMA1dzOQ+Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747777950; c=relaxed/simple;
	bh=HvHgMGgxm/W+KZ86qzOu51KrxSkXL4F7Sp/d538HrUY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=KaoWYY28Rbv2LHJWWD6XuQdcdDmD3pWO8eFc8XpmbGZ8Oo2MVtguTw9+05JXllipKkq4fmDrDTJwefDcDvonAKO4gcCbYagckXeDwBRJ+w/2t07lqq4WCQJ5Q9TpzAZHD95Wm0GF5ktmLnRNJOwyoO6NXHtu73jBRWoxC8GS61Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=flLTWdxL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KGdtU6000685;
	Tue, 20 May 2025 21:52:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pW8YOKuNJ9jQH/jVDDW931xr0P8H6V7K5yxi5nI4vgk=; b=flLTWdxLMK5cuxcY
	Mi3dTdo5GHdlkxHOgR8ZHrLPzFcGf6Iqa1GnIskeE/gOkglXs7TA4RsHb4iR4VCL
	JUKzDPk2R/47jsGO2U3Xg5EAsciMGlb1pL6dvFBIOpDC/kGLuUG3Mnpn2CLI3B30
	EutqovXlFmZStVt/0D1begFvECLOZvJAO8BZXK6R47n+j0AcSgDFohKAZKqNkVVo
	IyBY6nCyIlXYoFt3Yr7dGfZcUKCNYWjOJfM3wLd5E/28YcUrk6MNjs1+SUnRzKqX
	uYPzk5iENX9pa8bcKEj4DZPzmbUpWQq6sHSPKpIkJcXb5309EHxH44J4x7HIx7uI
	ZFZtJQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf0gqbw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 21:52:23 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54KLqMIN018697
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 21:52:22 GMT
Received: from [10.110.114.7] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 20 May
 2025 14:52:22 -0700
Message-ID: <468b3de4-d0cd-42ef-8cf8-6b46953193f9@quicinc.com>
Date: Tue, 20 May 2025 14:52:22 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] clk: qcom: dispcc-sm8750: Fix setting rate byte and
 pixel clocks
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen
 Boyd <sboyd@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <stable@vger.kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
References: <20250520090741.45820-2-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20250520090741.45820-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: sAOS467AxhfPokfjPNqXpQLQ1hKeeO63
X-Authority-Analysis: v=2.4 cv=J/Sq7BnS c=1 sm=1 tr=0 ts=682cf997 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=aWsuURs6-mZru1054d4A:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: sAOS467AxhfPokfjPNqXpQLQ1hKeeO63
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDE3NiBTYWx0ZWRfX11sk1UtksMp4
 2VVuZyKT6uVnB0Z7SXwOmf523E5C4P1qGJPCbbaYzEVHW7Gv/yUMBujKwSogPtS6WiBgEdixul2
 EitrY8F2kOewPbnZMrp78XXZDhsJWQZSnAMXt5w295vyUKFdT1HE6v78U92GdEBscn9tmcPU+00
 NLmszJKCFAMp45dqgEPDLbYlS9CRMvgbnEpflrTrYOmebKLQCdhks742UIDJrHNCq8RjCqyriFz
 4va3DyfPksHUufE3i7RD6uCIZ3rueZAay9YFXjTiPGGJsjbOMtedz0ryX87qzw2U4LmOdvSGZ4y
 5Oia7xu5awFotV/FZizGr3+R448OI3Wm5qHldf6qneZG2s5WQgerVF6jcNB0pDQ8OvFgoDqlKDI
 Wy9RiuWkU7SDqL1IqQTJuYXl3GLeofcboQg2MgjDgEJujrTxmONMAxq4hNZHmR9CF5mgq6vT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_10,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 mlxlogscore=597 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505200176



On 5/20/2025 2:07 AM, Krzysztof Kozlowski wrote:
> On SM8750 the setting rate of pixel and byte clocks, while the parent
> DSI PHY PLL, fails with:
> 
>    disp_cc_mdss_byte0_clk_src: rcg didn't update its configuration.
> 
> DSI PHY PLL has to be unprepared and its "PLL Power Down" bits in
> CMN_CTRL_0 asserted.
> 
> Mark these clocks with CLK_OPS_PARENT_ENABLE to ensure the parent is
> enabled during rate changes.
> 
> Cc: <stable@vger.kernel.org>
> Fixes: f1080d8dab0f ("clk: qcom: dispcc-sm8750: Add SM8750 Display clock controller")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v6:
> 1. Add CLK_OPS_PARENT_ENABLE also to pclk1, pclk2 and byte1.
> 2. Add Fixes tag and cc-stable
> 
> Previously part of v5 (thus b4 diff might not work nice here):
> https://lore.kernel.org/r/20250430-b4-sm8750-display-v5-6-8cab30c3e4df@linaro.org/
> 
> Changes in v5:
> 1. New patch in above patchset.
> 
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <lumag@kernel.org>
> ---
>   drivers/clk/qcom/dispcc-sm8750.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>


