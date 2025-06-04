Return-Path: <linux-arm-msm+bounces-60213-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2EAACDC7A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 13:26:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 02F0C189576E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 11:27:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F55C28E607;
	Wed,  4 Jun 2025 11:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XgNsJO2t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B29C28E611;
	Wed,  4 Jun 2025 11:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749036401; cv=none; b=lgDI2RfcQiqn3p6RJ0zTA3ax52ZWu5AtjCVF/KGXJR0XZ9LPPl6RDgs0AnnaQdXiEm3FGoF1Md0Us2XCsue7JrgyMNc6/pmBB1dlXMcAIUxUU69K3JlTQDIITGe/je/S1PB98PxtCX9DMMHbAo8OZDzHgLl9qFryTQVtkCJQoio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749036401; c=relaxed/simple;
	bh=E84Gx9daW4oGLDSIvgjc8THpf725mJjQEx4bw6Z0Be8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qC82U4dMos/WLqvpLVkvq5B0+AbekvHJc+SFdi4uqPb8MRWHnlf5KaDsOyg9SC1rSTLZg344iBvdE/iodbDIit7iIV++SkjkDuUeEWTlS3Py1d8sB/kcxslnFe17JY68AJ4A22ZnhUiNCbxX2I5d4oxE6JbNFlj0+/Ql6ewkQn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XgNsJO2t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5549ugSE014378;
	Wed, 4 Jun 2025 11:26:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VHGAL1P7Wq3Zkiic8U0OX71CgaWKBP0Jugo1QllVrGU=; b=XgNsJO2tg9TijcCu
	+SurFLfaSK1bEMAQG1wEM1q9k+U+ldq/Tm9CRJzuHTti05sIj58i4vkjER0WR9Js
	ZinXkSoWquqowuMxLgurx0ti9VIOBNWK37VqgdiMtDHX+SOMBbyyD7vEmbxIQsR7
	2lNayyKNyjNWfowcVPC/YIIMvtJpuqZceaVEf7DyzQgTIAuzyxpNlMVeVXlYyVwi
	QlzqjLQ+4vlwQ1jDrYHZD5cFZCd2StMrLYEZa7w+3I9Vk6M7xh3O6PEhcBLieWgt
	y16O2MmM4S53suwandT8gTLclTTJbVkRaYTtOlMNbWIlFi1o/sDqAuI/Copimh58
	6IT8kg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 472be81je6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jun 2025 11:26:32 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 554BQVCj014741
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Jun 2025 11:26:31 GMT
Received: from [10.217.219.221] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 4 Jun 2025
 04:26:27 -0700
Message-ID: <80b21999-f69a-4546-8b8a-2acb59df3fa1@quicinc.com>
Date: Wed, 4 Jun 2025 16:55:34 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] phy: qcom: qmp-combo: introduce QPHY_MODE
To: Neil Armstrong <neil.armstrong@linaro.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240527-topic-sm8x50-upstream-phy-combo-typec-mux-v2-0-a03e68d7b8fc@linaro.org>
 <20240527-topic-sm8x50-upstream-phy-combo-typec-mux-v2-3-a03e68d7b8fc@linaro.org>
Content-Language: en-US
From: Udipto Goswami <quic_ugoswami@quicinc.com>
In-Reply-To: <20240527-topic-sm8x50-upstream-phy-combo-typec-mux-v2-3-a03e68d7b8fc@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=bNYWIO+Z c=1 sm=1 tr=0 ts=68402d68 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=RblEnPfGN_9KTdTLSikA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: t9hUoPdx06CgKfI_iLyS4mLnRWnXttXj
X-Proofpoint-ORIG-GUID: t9hUoPdx06CgKfI_iLyS4mLnRWnXttXj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDA4NyBTYWx0ZWRfXwQgi2ygkPGdH
 v4sTBD8JayKDcj6BWZoU8l8/FGSAsa9wFt7FCbk8UXqgfNTSR/Imp6yHgH0MZGLvWyBYXhpdmYp
 IqZpA67fpTIRRxyTfhHU+lhqBF8S/sY1xTq35m0rdlUcshODxHS4pPa1Ale+RUIY7Je9AmZtF51
 ylWEue9EOKbtafLZPm2r3Vyu/Xh4JHuaCqckUk7NqOt5oIRnE0uGd2dI01BBPKA9fYtc7qx0OiK
 Ghk4bHI8SaqHK51aE85TJJWUJvtV4+4dF/zgcD88xyw1iXL+YXJWmmBt5oUk6XlJ2zc3+x7cCkP
 qIboMcJ3hEpVTDwLqM5UnF7yAnBgpirOjmOnHu4f7FiyuvqNxY6Am/lnMt1NPiXYl2Volzwl/Hh
 vXPFjCWgNUlJkPPiXza9sgygtO77D4IfYb9oLz7ltwZlrdR/xfE0rh/HkRN8kUWmq4IQu8vU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_03,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 suspectscore=0 mlxscore=0 impostorscore=0 spamscore=0 clxscore=1011
 mlxlogscore=999 adultscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506040087



On 5/27/2024 2:12 PM, Neil Armstrong wrote:
> Introduce an enum for the QMP Combo PHY modes, use it in the
> QMP commmon phy init function and default to COMBO mode.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 41 +++++++++++++++++++++++++++----
>   1 file changed, 36 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> index 183cd9cd1884..788e4c05eaf2 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> @@ -61,6 +61,12 @@
>   
>   #define PHY_INIT_COMPLETE_TIMEOUT		10000
>   
> +enum qphy_mode {
> +	QPHY_MODE_COMBO = 0,

Hi Neil,

I have a doubt here, shouldn't this be aligned with what typec_altmode has ?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/linux/usb/typec_altmode.h?h=v6.15#n113

This patch marks COMBO mode as 0
when the mux_set when called from pmic_glink_altmode.c
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/soc/qcom/pmic_glink_altmode.c?h=v6.15#n160

the state will start from 2 if i'm not wrong ?

For the similar implmentation I referring to fsa4480.c which seems to be 
using the enums from typec_altmode.c therefore asking.


Thanks,
-Udipto

> +	QPHY_MODE_DP_ONLY,
> +	QPHY_MODE_USB_ONLY,
> +};
> +
>   /* set of registers with offsets different per-PHY */
>   enum qphy_reg_layout {
>   	/* PCS registers */
> @@ -1503,6 +1509,7 @@ struct qmp_combo {
>   
>   	struct mutex phy_mutex;
>   	int init_count;
> +	enum qphy_mode init_mode;
>   
>   	struct phy *usb_phy;
>   	enum phy_mode mode;
> @@ -2589,12 +2596,33 @@ static int qmp_combo_com_init(struct qmp_combo *qmp, bool force)
>   	if (qmp->orientation == TYPEC_ORIENTATION_REVERSE)
>   		val |= SW_PORTSELECT_VAL;
>   	writel(val, com + QPHY_V3_DP_COM_TYPEC_CTRL);
> -	writel(USB3_MODE | DP_MODE, com + QPHY_V3_DP_COM_PHY_MODE_CTRL);
>   
> -	/* bring both QMP USB and QMP DP PHYs PCS block out of reset */
> -	qphy_clrbits(com, QPHY_V3_DP_COM_RESET_OVRD_CTRL,
> -			SW_DPPHY_RESET_MUX | SW_DPPHY_RESET |
> -			SW_USB3PHY_RESET_MUX | SW_USB3PHY_RESET);
> +	switch (qmp->init_mode) {
> +	case QPHY_MODE_COMBO:
> +		writel(USB3_MODE | DP_MODE, com + QPHY_V3_DP_COM_PHY_MODE_CTRL);
> +
> +		/* bring both QMP USB and QMP DP PHYs PCS block out of reset */
> +		qphy_clrbits(com, QPHY_V3_DP_COM_RESET_OVRD_CTRL,
> +				SW_DPPHY_RESET_MUX | SW_DPPHY_RESET |
> +				SW_USB3PHY_RESET_MUX | SW_USB3PHY_RESET);
> +		break;
> +
> +	case QPHY_MODE_DP_ONLY:
> +		writel(DP_MODE, com + QPHY_V3_DP_COM_PHY_MODE_CTRL);
> +
> +		/* bring QMP DP PHY PCS block out of reset */
> +		qphy_clrbits(com, QPHY_V3_DP_COM_RESET_OVRD_CTRL,
> +				SW_DPPHY_RESET_MUX | SW_DPPHY_RESET);
> +		break;
> +
> +	case QPHY_MODE_USB_ONLY:
> +		writel(USB3_MODE, com + QPHY_V3_DP_COM_PHY_MODE_CTRL);
> +
> +		/* bring QMP USB PHY PCS block out of reset */
> +		qphy_clrbits(com, QPHY_V3_DP_COM_RESET_OVRD_CTRL,
> +				SW_USB3PHY_RESET_MUX | SW_USB3PHY_RESET);
> +		break;
> +	}
>   
>   	qphy_clrbits(com, QPHY_V3_DP_COM_SWI_CTRL, 0x03);
>   	qphy_clrbits(com, QPHY_V3_DP_COM_SW_RESET, SW_RESET);
> @@ -3603,6 +3631,9 @@ static int qmp_combo_probe(struct platform_device *pdev)
>   	if (ret)
>   		goto err_node_put;
>   
> +	/* Set PHY_MODE as combo by default */
> +	qmp->init_mode = QPHY_MODE_COMBO;
> +
>   	qmp->usb_phy = devm_phy_create(dev, usb_np, &qmp_combo_usb_phy_ops);
>   	if (IS_ERR(qmp->usb_phy)) {
>   		ret = PTR_ERR(qmp->usb_phy);
> 


