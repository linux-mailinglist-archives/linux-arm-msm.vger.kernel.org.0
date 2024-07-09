Return-Path: <linux-arm-msm+bounces-25611-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C6992B5F4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 12:53:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E3C9281AC5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 10:53:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D41B156F4A;
	Tue,  9 Jul 2024 10:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dz1Ut3IP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBE3155A32;
	Tue,  9 Jul 2024 10:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720522412; cv=none; b=VWEq1m6fJYu9bBMJosdeSGv5TOxBJL4exAmekkxC+VTVEeubMLvcoWLNI9589q7fKdSvJNKXf6X3nMw07SAq1jheA0S3Y3cfYG4jEYrl0QQOlcLLVpn74he07oCCHTksGKBII7Me36xYFalTDvlhL2hd/onC6rILmd6IwZkvRAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720522412; c=relaxed/simple;
	bh=pIqgM0I63dv/6ROqyRSUSyPFvwaqeI08mBfC0FvgxLo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=IJ374ncYPyhfEtF96joJzMpNwJatx1VxR5eTIxvpIC+DxMSzFJM+dDZjojERkkAAcYbC4H2GPSFsgVoeJ+C9Ud9uRswhfTXb2vCqP+DhespW/hkeO7gW4gXiAbDM6CVUjLZThHsvs8kqVRPu/wpnkkd6Zth8q0+VJZe1vuAWav0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dz1Ut3IP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4692hGYp001740;
	Tue, 9 Jul 2024 10:53:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/euPaJ1QNQG5WE6S0Cz/dk+2m+OJnJosBxThmLtDPAY=; b=dz1Ut3IPUxKutabd
	pDdHDQXb5pgkm7hD0E/4bU2hgF4fVj+IimwgCTo2Fooi5jz6iEXC6sFuLv4X1a01
	It+2zPJ7RUPAs6IE7mIrMs3JWY5hote2fX+VXgexr/r+A1Xwz6DgckuWj7CSRVHo
	QJIvE8HH33L5KqCvAIxnWQtJZv69QPMf8YlK9zwjPfd5dKIqLzW8OT7SLPQRuR4B
	1idlNBVs4A4c29ro5BonA8VemHAzAwk6GIO4GRN8IBvZ2c2X5RNYrBUsjzIG2Qxz
	7WhKcpkZq6CV2dsK8IiOjfICme+hHbF7wKJdM1o8zXKp9QV5TTL8Yf/v/iq24TEP
	502G5A==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406we8x3qd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jul 2024 10:53:12 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 469ArBaX025483
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Jul 2024 10:53:11 GMT
Received: from [10.216.26.146] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 9 Jul 2024
 03:53:04 -0700
Message-ID: <15bc3966-0934-47db-71b6-be534cdc57c7@quicinc.com>
Date: Tue, 9 Jul 2024 16:23:01 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 4/6] dt-bindings: clock: qcom: Add SM8150 camera clock
 controller
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Abhishek Sahu <absahu@codeaurora.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stephen Boyd <sboyd@codeaurora.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>,
        "Imran
 Shaik" <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
References: <20240702-camcc-support-sm8150-v2-0-4baf54ec7333@quicinc.com>
 <20240702-camcc-support-sm8150-v2-4-4baf54ec7333@quicinc.com>
 <b6nci7iepcoxtdqnrkp3ti3xnm3fxr37q22kqy5wvwapssm3vo@twsyw3cjsruw>
From: "Satya Priya Kakitapalli (Temp)" <quic_skakitap@quicinc.com>
In-Reply-To: <b6nci7iepcoxtdqnrkp3ti3xnm3fxr37q22kqy5wvwapssm3vo@twsyw3cjsruw>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 66S7A503hMW8ImJTDrUS23MUmz74yKCl
X-Proofpoint-GUID: 66S7A503hMW8ImJTDrUS23MUmz74yKCl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-09_02,2024-07-08_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 mlxlogscore=999 malwarescore=0 mlxscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2407090074


On 7/3/2024 3:44 PM, Dmitry Baryshkov wrote:
> On Tue, Jul 02, 2024 at 09:20:42PM GMT, Satya Priya Kakitapalli wrote:
>> Add device tree bindings for the camera clock controller on
>> Qualcomm SM8150 platform.
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
>> ---
>>   .../bindings/clock/qcom,sm8150-camcc.yaml          |  77 ++++++++++++
>>   include/dt-bindings/clock/qcom,sm8150-camcc.h      | 135 +++++++++++++++++++++
>>   2 files changed, 212 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8150-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8150-camcc.yaml
>> new file mode 100644
>> index 000000000000..8fc27ba4be4b
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8150-camcc.yaml
>> @@ -0,0 +1,77 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/qcom,sm8150-camcc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Camera Clock & Reset Controller on SM8150
>> +
>> +maintainers:
>> +  - Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
>> +
>> +description: |
>> +  Qualcomm camera clock control module provides the clocks, resets and
>> +  power domains on SM8150.
>> +
>> +  See also:: include/dt-bindings/clock/qcom,sm8150-camcc.h
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,sm8150-camcc
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    items:
>> +      - description: Board XO source
>> +      - description: Camera AHB clock from GCC
> No sleep clock?


No, for sm8150 there is no need of sleep clock. It is not used for any 
of the camcc clocks.



