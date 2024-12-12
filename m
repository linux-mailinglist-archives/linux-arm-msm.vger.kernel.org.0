Return-Path: <linux-arm-msm+bounces-41658-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CBF9EDFC2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 08:00:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6654F286765
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 07:00:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A6EF1D8A0B;
	Thu, 12 Dec 2024 07:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZTxInMDC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B383288DA;
	Thu, 12 Dec 2024 07:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733986844; cv=none; b=bTVCiA2+7P4fIjYE55tZ5JuzOCorfLEivCoySMOQMwJrnNpa2z5d0axdSd9gEayKGXVU3QLcBlzFnIQ+xOHWHOYoPQ9bKvrQMS+rS6c3FYR0rFA4vqAZeRDO3eNxtvF4eqW/8KUZzvP6dJUi2+Wgcxi3IFiOGHZgw19Eek8TVHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733986844; c=relaxed/simple;
	bh=tr3H9l9bGW6ozzkXMOSie+z2ipjQ3UPuQLVoO3W9s64=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=BjRwxsh1cogknKad1bxgg4tCbnS8dyCMwlNMN5fAdpRlPo/ZZkl1ZBhS4vRbjxLhGN5elbYLZl+gjgAK3MFvNpE40fTOeo1rngMd/8PxpDsujI8MZKgqkQ1ney5I+v40CxZq3zmLiITlldlg8DNoRvBRbprxjwEto+bbX3PF6p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZTxInMDC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BBHD9T0027283;
	Thu, 12 Dec 2024 07:00:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	542Z1YhSgDVb8yaviufnRA8DzBabzMl5pL3RWJoYS64=; b=ZTxInMDC9O01VbaD
	pTAj7Kuff0O/thuJ+0syDGjLbK+UsqBrklpnDBvK7QI0H+z2zakGNEGUjCAGvtdN
	Tm1e8j1Mq0N7O6M5HaowNemZJ4tffMH3vvSynuIEUfuscsZPhlXzL076mth+PpVq
	/xtImtoKqXSfrsn4hzs7UaU+IHloUt35TozWPo4j6zPpcUKf5q0IxP8xCScXFlaF
	rpZI5OQEwsFtir4JkSSnFEyKHjCUrA15S35Up/bfOTG0UMzG+spfFZtMMkLZFyBc
	RQjr4WxDfEx7VIhp3jirE8mPjMXJw/z9eo4U8+atbL3KLSAQ24ReIOgEwP/tr+q5
	EMbmdg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43etn8w9yu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 07:00:38 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BC70bmw000595
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 07:00:37 GMT
Received: from [10.50.15.152] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 11 Dec
 2024 23:00:32 -0800
Message-ID: <2b0a4a87-b67c-4d24-9091-4a1d0c434815@quicinc.com>
Date: Thu, 12 Dec 2024 12:30:29 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 RESEND 1/2] dt-bindings: clock: Add Qualcomm SM6115
 LPASS clock controller
To: Alexey Klimov <alexey.klimov@linaro.org>, <andersson@kernel.org>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>, <krzk+dt@kernel.org>
CC: <konradybcio@kernel.org>, <konrad.dybcio@oss.qualcomm.com>,
        <robh@kernel.org>, <conor+dt@kernel.org>,
        <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20241212002551.2902954-1-alexey.klimov@linaro.org>
 <20241212002551.2902954-2-alexey.klimov@linaro.org>
Content-Language: en-US
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
In-Reply-To: <20241212002551.2902954-2-alexey.klimov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: SXzxlJepK6j9VJZMM5FkPzJanUtT3e8Y
X-Proofpoint-GUID: SXzxlJepK6j9VJZMM5FkPzJanUtT3e8Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120046



On 12/12/2024 5:55 AM, Alexey Klimov wrote:
> From: Konrad Dybcio <konrad.dybcio@linaro.org>
> 
> SM6115 (and its derivatives or similar SoCs) has an LPASS clock
> controller block which provides audio-related resets.
> 
> Add bindings for it.
> 
> Cc: Konrad Dybcio <konradybcio@kernel.org>
> Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> [alexey.klimov] slightly changed the commit message
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  .../bindings/clock/qcom,sm6115-lpasscc.yaml   | 46 +++++++++++++++++++
>  .../dt-bindings/clock/qcom,sm6115-lpasscc.h   | 15 ++++++
>  2 files changed, 61 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm6115-lpasscc.yaml
>  create mode 100644 include/dt-bindings/clock/qcom,sm6115-lpasscc.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm6115-lpasscc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm6115-lpasscc.yaml
> new file mode 100644
> index 000000000000..247b6b0a9f5a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm6115-lpasscc.yaml
> @@ -0,0 +1,46 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,sm6115-lpasscc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm LPASS Core & Audio Clock Controller on SM6115
> +
> +maintainers:
> +  - Konrad Dybcio <konrad.dybcio@linaro.org>

Please check the mail id.

> +  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> +
> +description: |
> +  Qualcomm LPASS core and audio clock controllers provide audio-related resets
> +  on SM6115 and its derivatives.
> +
> +  See also::
> +    include/dt-bindings/clock/qcom,sm6115-lpasscc.h
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,sm6115-lpassaudiocc
> +      - qcom,sm6115-lpasscc
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#reset-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#reset-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    lpass_audiocc: clock-controller@a6a9000 {
> +        compatible = "qcom,sm6115-lpassaudiocc";
> +        reg = <0x0a6a9000 0x1000>;
> +        #reset-cells = <1>;
> +    };
> +...
> diff --git a/include/dt-bindings/clock/qcom,sm6115-lpasscc.h b/include/dt-bindings/clock/qcom,sm6115-lpasscc.h
> new file mode 100644
> index 000000000000..799274517c9a
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,sm6115-lpasscc.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (c) 2023, Linaro Ltd.
> + */

Do we need to update the Copyright year?

Thanks & Regards,
Manikanta.

