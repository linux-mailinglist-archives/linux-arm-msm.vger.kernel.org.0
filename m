Return-Path: <linux-arm-msm+bounces-39225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D24339D9D0F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2024 19:03:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A0E3163A9C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2024 18:03:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E5741DAC92;
	Tue, 26 Nov 2024 18:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QQQqCRPe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A906BBA3F;
	Tue, 26 Nov 2024 18:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732644195; cv=none; b=YHpBQNu64wNbWvgUQ4d1QVQU0DyYsktE3A4MdSe8M8yKtOdGVj1j9BSv4nLZIXi3zM/z2bKuMlBBY/rlHkBT3FPQJtn6AGFWqUp7dFlw5izlsO4VBNCTZHtLDfxykwcFgUaXEjkI9u9kVCqp2MeF3PyQa7tBeuebDj4x2wrRFQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732644195; c=relaxed/simple;
	bh=5PqnkY0UT/Y8RerUW9AMiSamToUq+LkOdwsrcV1qTrY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=X3WMSi1MREBM/CGA5b4Eku+scjMnIjQdHLppjO7x+DmOOtjjQWcd5ABgnyni9TImorU2VCkUZ31kZVuKBCnEf6kdASSZswu0zbXMnfc6hBvtJKK0a4ScCNpe0GxOkKsX2jchp0UrRIAiJNvqN/QAIWLlwbZYKm1w/6GSiLHpMlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QQQqCRPe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AQGNRVh014563;
	Tue, 26 Nov 2024 18:03:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eLFfmwMNX8oACc1OcseR0boZkSPFH7gQpMUdOiOOJSc=; b=QQQqCRPeEDNqE9c4
	bpVe7DaFJ/sRgOp3FJtvlqDqGdwzeINRNoKX03RfVS65xNUPEgcg5qnP+UHAnfz1
	BI+B2CSjaOizS+KU2ByvM0CCsed5/YfvZklV4kPTEYg2OvAIOVbgP2CSNyWoyDOQ
	fEyWRnXM4PhPs72JFkPpC1AoZ+TyDAqyy+QAJsBfbHg4raq+Ai3Ii0lTNCpt6xf4
	ZHQGK+OkU1j5In4Z6xTEdt0sMMNyRqQ1r2a/BKx/UKcoxYSrFp/lWm3JU+j7H7lC
	A+P9jalBPzwn9nscnnaC1JHjZr8TcRWnO2lXA3zV02ohvLLHlYHL1y72TWmewxhq
	HbBWvA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 434nyg52gy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Nov 2024 18:03:09 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AQI38Nu017639
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Nov 2024 18:03:08 GMT
Received: from [10.216.42.0] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 26 Nov
 2024 10:03:04 -0800
Message-ID: <ff7c9b83-0ac7-43a0-a86a-2fed66728a32@quicinc.com>
Date: Tue, 26 Nov 2024 23:32:59 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] arm64: dts: qcom: sar2130p: add support for
 SAR2130P
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Konrad Dybcio
	<konradybcio@kernel.org>
References: <20241102-sar2130p-dt-v4-0-60b7220fd0dd@linaro.org>
 <20241102-sar2130p-dt-v4-2-60b7220fd0dd@linaro.org>
Content-Language: en-US
From: Krishna Kurapati <quic_kriskura@quicinc.com>
In-Reply-To: <20241102-sar2130p-dt-v4-2-60b7220fd0dd@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: rAmCluWhWbtDopzYsEijdRKagTKcDR2Y
X-Proofpoint-ORIG-GUID: rAmCluWhWbtDopzYsEijdRKagTKcDR2Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 mlxlogscore=999 clxscore=1015 mlxscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411260143



On 11/2/2024 8:33 AM, Dmitry Baryshkov wrote:
> Add DT file for the Qualcomm SAR2130P platform.
> 
> Co-developed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sar2130p.dtsi | 3123 ++++++++++++++++++++++++++++++++
>   1 file changed, 3123 insertions(+)
> 

[...]

> +		usb_dp_qmpphy: phy@88e8000 {
> +			compatible = "qcom,sar2130p-qmp-usb3-dp-phy";
> +			reg = <0x0 0x088e8000 0x0 0x3000>;
> +
> +			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK>,
> +				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
> +				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
> +			clock-names = "aux", "ref", "com_aux", "usb3_pipe";
> +
> +			power-domains = <&gcc USB3_PHY_GDSC>;
> +
> +			resets = <&gcc GCC_USB3_PHY_PRIM_BCR>,
> +				 <&gcc GCC_USB3_DP_PHY_PRIM_BCR>;
> +			reset-names = "phy", "common";
> +
> +			#clock-cells = <1>;
> +			#phy-cells = <1>;
> +
> +			orientation-switch;
> +
> +			status = "disabled";
> +

Hi Dmitry,

  Sorry for asking this question after code got merged. I forgot about 
asking this last time when I commented on your patch and provided the HS 
Phy IRQ value.

  In SAR2130P, I remember that the lane orientation is reversed. As in 
on normal targets, if the orientatin GPIO reads "0" it means LANE_A but 
on SAR2130 it means LANE_B. Can you confirm if superspeed was tested 
only in one orientation only.

  I can push code for setting orienation properly for this target if you 
can confirm that orienation is read reverse on SAR2130P.

Regards,
Krishna,

