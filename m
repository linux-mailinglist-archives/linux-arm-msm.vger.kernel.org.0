Return-Path: <linux-arm-msm+bounces-56053-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA5CAA05B4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 10:27:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B038A8449DE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 08:24:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80F2F280A52;
	Tue, 29 Apr 2025 08:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="p8tLJXsA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A552222CF;
	Tue, 29 Apr 2025 08:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745915078; cv=none; b=i6p0T3rS05/e6LUHoOC0Z4g8LXTSS5inQSLP7hV7uxwbgqCdoQqLtR+p4Tn0MRJJ4bEjSaZIv3H66cn3g4q4rhGJM9ZdwOIjLnrrhAKpIJGMqDbeKrDYbVw5GF/mIvSF/vxqIh637N5K7v0Z7HZPy8xkUbwK80cr5o4BI9PwDLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745915078; c=relaxed/simple;
	bh=Zi1wuknYw1VFbk/DBuTb0zboIQo1+fYwJIqPBN1Xans=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rNtfICcWg76kqSwJbfy3rNzjNUg9XeP4kjyH9CJGm2vU3nWdhB0dcxAym4/I/iBc6InyIlC4UQdEqNGkWQx1wllPOMqZBZ2NYHCp7C0UUSIop8NAoWe1prZTPO90vr0rpYl8vkxvZOqv532P9UbBxoIXlYCLhGQBkgY7+mJH1gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=p8tLJXsA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53T86111028068;
	Tue, 29 Apr 2025 08:24:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9fQR9meQutjblSLbJONQI/dFhf8KfiYCydP9hn7Oxus=; b=p8tLJXsADwi67NzI
	JV38DIxAVlwD0kqP8QJa493ejLTGjJhiSV3yJ1gYr88O7VMZ//SkNwuJHXxff4U2
	vYqx2O766uGGI7sgsy6CNJVMW5cWVMflypPjvSTYWMkQ0LA5fvJUQ+/hk7vZh+y4
	46f+hmnvZYH8QOdHBPke0SUchj7QHAS+LJq69f+RkWH6FWCoIPM8A9bCROa10e81
	TTFV5zElpWcegB1H5r8zTQz0LE5G/6+jRr8xziXumEJlgf99Iuw212gybuUBkJYt
	yU8G9T3hsJlHlOeBO69NHo1wZvupYnRwcYi+WyiWL+N3VQIfwb/cRAqNkqPJyHvO
	NpQ5GA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468muqm0g0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 08:24:25 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53T8OOef015164
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 08:24:24 GMT
Received: from [10.239.29.178] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 29 Apr
 2025 01:24:21 -0700
Message-ID: <f44722a5-25b5-409c-baec-13d19af61d43@quicinc.com>
Date: Tue, 29 Apr 2025 16:24:19 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: qcom: qmp-pcie: drop bogus x1e80100 qref supply
To: Johan Hovold <johan+linaro@kernel.org>, Vinod Koul <vkoul@kernel.org>
CC: Kishon Vijay Abraham I <kishon@kernel.org>,
        Dmitry Baryshkov
	<lumag@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Abel Vesa
	<abel.vesa@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <20250429075440.19901-1-johan+linaro@kernel.org>
Content-Language: en-US
From: Qiang Yu <quic_qianyu@quicinc.com>
In-Reply-To: <20250429075440.19901-1-johan+linaro@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA2MiBTYWx0ZWRfX59sHWB4IckPG 3/F5gKpawQX9FbguZnwIRoJQI5HJrFCrrF8RYQb1ARL9ownoQDQ4yhfa7OtghIj5FKtz281WqRd VLY/fSvGviUExHNVqXYPnpEurnh5hBB1cmINyXY7bok2ofJ2eI3i+ykjsEPQzMPjWSVC4eBzm1m
 U8G8M95XQ1Jl+WBOextSdd4VKde7PB/A0bfjy0Trcfiye7owKSDlAOM168leG74/Am2b93UZLx2 HzWu9OQbOjYz+1AtQgDQ9SQef9FNf2YfIErJrNYRlOcKSw8FboP5t4WNJMbVd/i3ofdl+lS8WIg 07Hlnn3lC2AmIhvcJL7leTd73ZTv+hjlqun160oQrVT+mW076gshgA7rvKYdtOMy6wrj2Bnpaz+
 +Px393SUVgg1pBWAJ7nxwjUyPVnLySqrQYnHvwZxOLgPYLL775fV8N0xr4SfvYHK4Et3jiJ6
X-Proofpoint-GUID: dhowlwmHCW6P3TOz1bGJt9SdELdlJJEg
X-Proofpoint-ORIG-GUID: dhowlwmHCW6P3TOz1bGJt9SdELdlJJEg
X-Authority-Analysis: v=2.4 cv=M/5NKzws c=1 sm=1 tr=0 ts=68108cb9 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8 a=Pr32Oli86lQI5KhXujMA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxscore=0 spamscore=0 malwarescore=0 mlxlogscore=898
 adultscore=0 bulkscore=0 phishscore=0 clxscore=1011 lowpriorityscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290062


On 4/29/2025 3:54 PM, Johan Hovold wrote:
> The PCIe PHYs on x1e80100 do not a have a qref supply so stop requesting
> one. This also avoids the follow warning at boot:
>
> 	qcom-qmp-pcie-phy 1be0000.phy: supply vdda-qref not found, using dummy regulator
>
> Fixes: e961ec81a39b ("phy: qcom: qmp: Add phy register and clk setting for x1e80100 PCIe3")
> Cc: Qiang Yu <quic_qianyu@quicinc.com>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
We have QREF for each PCIe port on the X1E80100, all of which consume 
the regulator L3J. Although the PCIe PHY uses QREF indirectly, this 
creates a dependency, right? If PCIe doesn't vote for it, how can the 
PMIC driver decide when to disable L3J during system suspend or runtime 
suspend? Is there a chance that L3J could be disabled while PCIe still 
requires it?
>   drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> index c232b8fe9846..e5277ce9c136 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> @@ -4233,8 +4233,8 @@ static const struct qmp_phy_cfg x1e80100_qmp_gen4x8_pciephy_cfg = {
>   
>   	.reset_list		= sdm845_pciephy_reset_l,
>   	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
> -	.vreg_list		= sm8550_qmp_phy_vreg_l,
> -	.num_vregs		= ARRAY_SIZE(sm8550_qmp_phy_vreg_l),
> +	.vreg_list		= qmp_phy_vreg_l,
> +	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
>   	.regs			= pciephy_v6_regs_layout,
>   
>   	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,

-- 
With best wishes
Qiang Yu


