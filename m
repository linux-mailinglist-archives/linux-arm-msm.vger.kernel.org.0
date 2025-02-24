Return-Path: <linux-arm-msm+bounces-49131-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 39244A417BE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 09:48:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F32F189152D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 08:48:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88C7E191F6D;
	Mon, 24 Feb 2025 08:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kKW0J4Cu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6FF23C393;
	Mon, 24 Feb 2025 08:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740386882; cv=none; b=kcihlGtYl/qdfRl0OkCM4xnGV8F96TcXJpS1aS36oe4o9D/AheuuxQM24bQQf7SRY5WeGHbyW6qvAbk5uWsr6BIgqP6Eqr50NnKNUJjX00RNrBtFoyfvvV2/4VTbF188Y11FCoiupS350neBN4ODB1knk1sHcafgJVY2TQCpAAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740386882; c=relaxed/simple;
	bh=pDTOGwORtLPgQhFUOH/4VYNkvXuKFRWo1tnwWehTIwc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=d4F5ZqIsU+P/ZtW8LXe90GfXGUYQ/5sf00ZQ8tIuLi/BHv6ipzp07yR66BEIA0a5DZEzWZlggpgqeFRSpzo0lG4LrKH/AVb8tIuP1/QcOP3u1wLQg36p8FB7/nQmwhc0EOM9VGmad6NB5mTO10HYjtYN3GpM1PBD/oLmS72mBXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kKW0J4Cu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51NNIEDD012818;
	Mon, 24 Feb 2025 08:47:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w0b1xqWe4sX2E8x1lbqQchpiv1HmY+V+Mse1J6myL14=; b=kKW0J4Cu/+Ynzbvk
	aHj5utqKjJb8dODTZoI/2uqnWHh9Zjc3FDHmDcnOPmMoaaAY97cyuxjWM3Cbppps
	NUiKliLQ76dfjX54jZ4k3XLtVKlH5TAEcyGh7kTmE4dRQrwNlSqKU1ZxgYAzQOg7
	M1MjZNs+yzpSX/+L9rRipiuK6UycmXsr7BndFQuHUZqG9QtXZKgCw2e9jenPNrEv
	0XiyMB0io9Q6UDDFnL1dIJzUoXLe6nyDLk2Yj5VrO1Q3tgEpqITy7SaJn9CspDQC
	BgJOX/eaR2lW3tUbsackkMcrJ2FkChukj6qtDaywVKl01XaEXWOx4ftfuct7hUSY
	i1xMcA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y7v9c2nn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Feb 2025 08:47:56 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51O8luL7014916
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Feb 2025 08:47:56 GMT
Received: from [10.216.5.175] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 24 Feb
 2025 00:47:52 -0800
Message-ID: <f3349d2a-7eba-4865-9b58-0b2e7e57cc92@quicinc.com>
Date: Mon, 24 Feb 2025 14:17:31 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] dt-bindings: qcom: geni-se: Rename qcom,geni-se.yaml
 to qcom,geni-se-qup.yaml
To: Krzysztof Kozlowski <krzk@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <quic_msavaliy@quicinc.com>, <quic_anupkulk@quicinc.com>
References: <20250221085439.235821-1-quic_vdadhani@quicinc.com>
 <49fc59ed-9d09-46bd-9ca6-99d3445221f7@kernel.org>
Content-Language: en-US
From: Viken Dadhaniya <quic_vdadhani@quicinc.com>
In-Reply-To: <49fc59ed-9d09-46bd-9ca6-99d3445221f7@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: exGbrHwgtzBIhAIOgGKdavBjV23LUldw
X-Proofpoint-ORIG-GUID: exGbrHwgtzBIhAIOgGKdavBjV23LUldw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-24_03,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 suspectscore=0 mlxscore=0 mlxlogscore=878 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502240064



On 2/21/2025 5:05 PM, Krzysztof Kozlowski wrote:
> On 21/02/2025 09:54, Viken Dadhaniya wrote:
>> The qcom,geni-se.yaml file describes the Qualcomm Universal Peripheral
>> (QUP) wrapper and the common entities required by QUP to run any Serial
>> Engine (SE) as I2C, SPI, UART, or I3C protocol.
>>
>> Rename qcom,geni-se.yaml to qcom,geni-se-qup.yaml to better reflect its
>> association with QUP (Qualcomm Universal Peripheral) and the compatible
>> string.
>>
>> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
>> ---
>>   .../soc/qcom/{qcom,geni-se.yaml => qcom,geni-se-qup.yaml}       | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>   rename Documentation/devicetree/bindings/soc/qcom/{qcom,geni-se.yaml => qcom,geni-se-qup.yaml} (98%)
>>
> 
> That's just churn for no real gain. Not even tested churn.

That's just churn for no real gain.

We made this change based on below plan, we think this will be helpful.

1. Rename qcom,geni-se.yaml to qcom,geni-se-qup.yaml. Reason at 2 below.
2. Create qcom,geni-se.yaml with shared properties for SE-protocol (spi, 
i2c, uart) nodes. This will be helpful for the shared schema in the 
ongoing changes 
https://lore.kernel.org/linux-arm-msm/f090d637-1ef1-4967-b5bc-6bfce3d7130e@kernel.org/T/.

Not even tested churn.

Sorry, we realized other SPI drivers also needs to be adjusted too. We 
have validated dt_binding_check for i2c, spi, uart, and geni-se YAML 
files but missed checking make refcheckdocs.

Please let us know if any command/step is missing in further validation, 
that will help us.

> 
> Best regards,
> Krzysztof

