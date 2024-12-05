Return-Path: <linux-arm-msm+bounces-40611-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 945E19E5DCA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 19:00:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 54690286CB8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 18:00:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55C4E221476;
	Thu,  5 Dec 2024 18:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FI43LJmA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89EE217F3C;
	Thu,  5 Dec 2024 18:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733421633; cv=none; b=aja2hlJHwljYWE6XtAj7xY7R4EEmmOl6LkiMhGWoiOo27aStuf0woIJ3lEctVb9ERXK/JblCUEBteEy4mzPFYr2xf4mpujUHRXjCk22raCKl4ceaD9NP768p41YAQGvSPimeLSkU9J+QrEqzy2Hd9dvN0/2OfRsMvaOPoThbMSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733421633; c=relaxed/simple;
	bh=DoE5xA9xyi5p2e98u9ZbaYAK68xpaq+1Bs3+aldkt5Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rl0uKp0qabOh0OpzKcLExKEimu+f0lcdxGzw2WKHUhTe1q/g7qzVJMG+PV+PQuMVNydEJqyGFLtesbHMk0PTSPdXISZXRPk9Us8lq3uFGSAFHyZ/lRjF/bVvfojbN7lFRl/ZfxED7pHDx51VnRDm04BZJ6gB74T2S+n9vSavx3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FI43LJmA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5HaWL9007445;
	Thu, 5 Dec 2024 18:00:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7ZYlfxZKV+ppmVXJGBfOMTmVD1CYCHv0LcoKCzf3A6Y=; b=FI43LJmAZ4ELiHhT
	AIJeED6ddo6kdXywLI0LG/IrwK6DRQxm4noQ1EtzdI+NIKhXNvVqdgjP8MmuTM+k
	tvMFpg5I5kamJGtWOf39dcpZPS+qyaHRLmLnObT5Sv6vrNPETgC3yIMUtDWHTzQR
	5cog6SVX3pylQthlQvjqTAU3fT2OrN/ECyD9nXWzR+A8kkf4xp23vuGk61bvW8ZF
	qLARkHqxFc/ZIDoBhy7+YtMeaE4N4jgBLpzXoE0VL9wl/gvkzOz/bIAMouJfHjTz
	eD62tGefpi5zqTdtVXKQjj0v32DmvKEak6RP8KFblvSYqvkzhkHWmtH4deLEPpnX
	jsLt6g==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ben88g3q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Dec 2024 18:00:27 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B5I0QHZ029550
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Dec 2024 18:00:26 GMT
Received: from [10.71.111.113] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 5 Dec 2024
 10:00:26 -0800
Message-ID: <affbe506-6a74-4822-ad83-9db5faa60cf6@quicinc.com>
Date: Thu, 5 Dec 2024 10:00:25 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/8] dt-bindings: clock: qcom: Add SM8750 GCC
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20241204-sm8750_master_clks-v3-0-1a8f31a53a86@quicinc.com>
 <20241204-sm8750_master_clks-v3-5-1a8f31a53a86@quicinc.com>
 <lgkjp7aocv2sij6tiectv5vm3yygcfnaguj4nomxu27scvtggu@uwzvgbvm44nn>
Content-Language: en-US
From: Melody Olvera <quic_molvera@quicinc.com>
In-Reply-To: <lgkjp7aocv2sij6tiectv5vm3yygcfnaguj4nomxu27scvtggu@uwzvgbvm44nn>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: qt6cIDWZyLdFd-N4y8m6xA7IJVU2AqSR
X-Proofpoint-GUID: qt6cIDWZyLdFd-N4y8m6xA7IJVU2AqSR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=999 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412050132



On 12/5/2024 1:28 AM, Krzysztof Kozlowski wrote:
> On Wed, Dec 04, 2024 at 11:37:17AM -0800, Melody Olvera wrote:
>> From: Taniya Das <quic_tdas@quicinc.com>
>>
>> Add device tree bindings for the global clock controller on Qualcomm
>> SM8750 platform.
>>
>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
>> ---
>>   .../devicetree/bindings/clock/qcom,sm8750-gcc.yaml |  62 ++++++
>>   include/dt-bindings/clock/qcom,sm8750-gcc.h        | 226 +++++++++++++++++++++
>>   2 files changed, 288 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8750-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8750-gcc.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..aab7039fd28db2f4e2a6b9b7a6340d17ad05156d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8750-gcc.yaml
>> @@ -0,0 +1,62 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/qcom,sm8750-gcc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Global Clock & Reset Controller on SM8750
>> +
>> +maintainers:
>> +  - Taniya Das <quic_tdas@quicinc.com>
>> +
>> +description: |
>> +  Qualcomm global clock control module provides the clocks, resets and power
>> +  domains on SM8750
>> +
>> +  See also: include/dt-bindings/clock/qcom,sm8750-gcc.h
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,sm8750-gcc
>> +
>> +  clocks:
>> +    items:
>> +      - description: Board XO source
>> +      - description: Board Always On XO source
>> +      - description: Sleep clock source
>> +      - description: PCIE 0 Pipe clock source
> Are you absolutely sure there is no PCIE 1 Pipe clock? List will only be
> able to grow at the end, breaking the order, if it turns out there is
> such clock input.

Yes; I've checked all our dts and documentation and as far as I can 
tell, there's
no PCIE 1 pipe clk.

Thanks,
Melody

> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>


