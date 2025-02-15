Return-Path: <linux-arm-msm+bounces-48119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF91A36FE0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Feb 2025 18:40:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE77017093E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Feb 2025 17:39:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 980C71EA7EA;
	Sat, 15 Feb 2025 17:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mlXBe70A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1A41DF982;
	Sat, 15 Feb 2025 17:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739641161; cv=none; b=sbtRSCprqq5hkopokcS2Uj8ZIYznttR9lsS4PAqqESXurfmrKn7y02JA4bYsuMWf+EmgCzjwfsQFQMNAlWE6B+vwM/lj3IIa/pTIIU03BpHWu7Q42dG7FLnPpv5E/UEucxCbq7ASZY9uUF5+Ju+HHy0wnyrh4IOxOiLoBiVGwFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739641161; c=relaxed/simple;
	bh=koP42/xza1rCJMzVMQLmKoBJJiA+K14i8sccKzYlG2k=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=XS7yB16wwD7XrVNzLz2M8yc2jD3zT9rhd9h8Eqmo2D2S9OYU1ObKVA21xc/xqIF6EP8VkV8hdeB7zk1HyTjJFCFNUdBZjn8ZqSly1az5TX0gEz9z21YDWqXu4MCIeQowgWJjXkgTi+CiW0NjB07ajHHYe8zx7ya3Ry3rZR1/68g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mlXBe70A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51FCMBPv005643;
	Sat, 15 Feb 2025 17:39:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lL3F6NTRsxNg/W5zKbfqSWlz3nIoOs1dKvIGPBZmTIw=; b=mlXBe70AqVx2E7Os
	XmSy4ia7+JcQE8TuOuysj5tqow7ItjVWJsl2lE59ywZj3xmjzCpLKNHxFq0jqtMv
	1GSTZnUhy2b7xnYDzPgJSNaPcxXvLRBMSNaMxWYmjyYqJKd21qHvy8QdycZf6rvq
	P0Z3Vi8ifpgLWm80h5Tiob1IhghkuPZkBIPZ/rurJu8C4RVRimdkr5PYkuxJNCHq
	32VnhCsyS3y84XH7B52ZfVyb/ooL6ydEWY72L6VsrQQTh3tBnhvVjp6KDXXwzsWK
	Rf5T9ztwb2AOyltAbmmEFhU0wgDlINzrywt/7xvtuY6hU7+QoBiZM6iRIyN6fY8r
	l/ULqg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44tkqprunq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 15 Feb 2025 17:39:09 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51FHd8DZ005596
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 15 Feb 2025 17:39:08 GMT
Received: from [10.110.17.177] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 15 Feb
 2025 09:39:06 -0800
Message-ID: <c39b8879-0a43-4a54-8084-d11ca3ede518@quicinc.com>
Date: Sat, 15 Feb 2025 09:39:05 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] drm/msm/dsi/phy: Protect PHY_CMN_CLK_CFG1 against
 clock driver
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean
 Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek
	<jonathan@marek.ca>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        Rob Clark
	<robdclark@chromium.org>
References: <20250214-drm-msm-phy-pll-cfg-reg-v3-0-0943b850722c@linaro.org>
 <20250214-drm-msm-phy-pll-cfg-reg-v3-2-0943b850722c@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20250214-drm-msm-phy-pll-cfg-reg-v3-2-0943b850722c@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: WUlfAvVviish0lS28D6VDcl93wIp_zkE
X-Proofpoint-ORIG-GUID: WUlfAvVviish0lS28D6VDcl93wIp_zkE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-15_07,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 mlxscore=0 clxscore=1015 priorityscore=1501
 mlxlogscore=722 phishscore=0 spamscore=0 adultscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502150156



On 2/14/2025 7:08 AM, Krzysztof Kozlowski wrote:
> PHY_CMN_CLK_CFG1 register is updated by the PHY driver and by a mux
> clock from Common Clock Framework:
> devm_clk_hw_register_mux_parent_hws().  There could be a path leading to
> concurrent and conflicting updates between PHY driver and clock
> framework, e.g. changing the mux and enabling PLL clocks.
> 
> Add dedicated spinlock to be sure all PHY_CMN_CLK_CFG1 updates are
> synchronized.
> 
> While shuffling the code, define and use PHY_CMN_CLK_CFG1 bitfields to
> make the code more readable and obvious.
> 
> Fixes: 1ef7c99d145c ("drm/msm/dsi: add support for 7nm DSI PHY/PLL")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v3:
> 1. Define bitfields (move here parts from patch #4)
> 
> Changes in v2:
> 1. Store BIT(4) and BIT(5) in local var in dsi_pll_enable_global_clk()
> ---
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          | 35 ++++++++++++++--------
>   .../gpu/drm/msm/registers/display/dsi_phy_7nm.xml  |  5 +++-
>   2 files changed, 26 insertions(+), 14 deletions(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

