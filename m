Return-Path: <linux-arm-msm+bounces-29266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F3695B32B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 12:47:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7DCE01F224DA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 10:47:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 165C717F4EC;
	Thu, 22 Aug 2024 10:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lxnHzB6g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADFC558BB;
	Thu, 22 Aug 2024 10:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724323658; cv=none; b=aQInq6s7cjqPs1KExfzyODVsKzwEJ+hi791nhda82ucnEw19VYnOdAQvEbopbwk0DSknuxUqGvwdw6ofP6nwkmgpYyuoNXnS5bjZtPQFX26a6+OGJsvWkyxwDB9OkcxMJKxn7XX9ackpYwUr42mul4R1Mn5W22d4s4Rj4o7YLTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724323658; c=relaxed/simple;
	bh=8FE+Slja7T2opibI3fLh7zUjj7kDj46Q+C35YeibAS8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=tOCh/vRqjrk37sME3jlAOoBXc/n0waUK4R22UrKqnKofEaGACmuK20dq07g5ffotqO5rkzgSihmKKvGLfYuxsFjTExi53HC28SU5ueRDag6vHGBUTGZp+cYgdkEQVcUPHjkwW9i8KcKp6r9ivzIyeq1Qmln1jdWp6yiTbmwkav4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lxnHzB6g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47MAJ8Yf001040;
	Thu, 22 Aug 2024 10:47:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9KwZVggQh6/ZFCFEZQZLa7LN9QDjViyAbeRFxV/gUJY=; b=lxnHzB6g/TfhW7+7
	eVArbArMRuQKz0Gko29aXOgJtNodIX+7kK014x+q40F/tapCJADPcehxFAmg9eEQ
	2phidq1YBOzYifEbUCRN3m1Pe3s7YfEHRT2jgUjUoeS2Xz7/cJjtTvAxZmwo3xqg
	EToUp1+cjjz4YBHwErN40T/e1sSMttRW9t8ZwD9dAJyQxruDNCNeSr9fI1+GSKH3
	iMn2hE8UdU5pIf+iuMBurF/lVCiOg7cm+yZ6Ft1DrZqIQDif7abIhAGsnWaN8uOk
	T4xgRjrbYKkREChA7NwKzPbD6FV+lVLk86YdFteoJmRfY/mZOUzY9N8VBcMqQqYk
	KAWCEA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 415nrrt28b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Aug 2024 10:47:33 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47MAlXLO022093
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Aug 2024 10:47:33 GMT
Received: from [10.152.201.37] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 22 Aug
 2024 03:47:29 -0700
Message-ID: <2b6b43b3-c99b-4aac-b1fb-24f6e5e562ce@quicinc.com>
Date: Thu, 22 Aug 2024 16:17:25 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Gokul Sriram P <quic_gokulsri@quicinc.com>
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: qcom: document hexagon based
 WCSS secure PIL
To: Krzysztof Kozlowski <krzk@kernel.org>,
	<q@krzk-bin.smtp.subspace.kernel.org>
CC: <andersson@kernel.org>, <krzk+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_viswanat@quicinc.com>, <quic_mmanikan@quicinc.com>,
        <quic_varada@quicinc.com>, <quic_srichara@quicinc.com>
References: <20240820085517.435566-1-quic_gokulsri@quicinc.com>
 <20240820085517.435566-2-quic_gokulsri@quicinc.com>
 <ticwyyycqlk2uqpiqckoqqnapqatw74s6f6tjqmmyt2d6siqqt@xxe2qdtr4c2c>
Content-Language: en-US
In-Reply-To: <ticwyyycqlk2uqpiqckoqqnapqatw74s6f6tjqmmyt2d6siqqt@xxe2qdtr4c2c>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: z5L7TtWNtUYYUZB1Jw_vRjI0AjdX2aQN
X-Proofpoint-GUID: z5L7TtWNtUYYUZB1Jw_vRjI0AjdX2aQN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-22_03,2024-08-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=999
 bulkscore=0 lowpriorityscore=0 mlxscore=0 phishscore=0 malwarescore=0
 suspectscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2408220080


On 8/20/2024 4:50 PM, Krzysztof Kozlowski wrote:
> On Tue, Aug 20, 2024 at 02:25:14PM +0530, Gokul Sriram Palanisamy wrote:
>> From: Manikanta Mylavarapu<quic_mmanikan@quicinc.com>
>>
>> Add new binding document for hexagon based WCSS secure PIL remoteproc.
>> IPQ5332, IPQ9574 follows secure PIL remoteproc.
>>
>> Signed-off-by: Manikanta Mylavarapu<quic_mmanikan@quicinc.com>
>> Signed-off-by: Gokul Sriram Palanisamy<quic_gokulsri@quicinc.com>
>> ---
>>   .../remoteproc/qcom,wcss-sec-pil.yaml         | 125 ++++++++++++++++++
>>   1 file changed, 125 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,wcss-sec-pil.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,wcss-sec-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,wcss-sec-pil.yaml
>> new file mode 100644
>> index 000000000000..c69401b6cec1
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,wcss-sec-pil.yaml
>> @@ -0,0 +1,125 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id:http://devicetree.org/schemas/remoteproc/qcom,wcss-sec-pil.yaml#
>> +$schema:http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm WCSS Secure Peripheral Image Loader
> ...
>
>> +
>> +maintainers:
>> +  - Manikanta Mylavarapu<quic_mmanikan@quicinc.com>
>> +
>> +description:
>> +  WCSS Secure Peripheral Image Loader loads firmware and power up QDSP6
> What is WCSS? Don't add random acronyms without any explanation.

WCSS/WCNSS - Wireless Connectivity subsystem.

will update.

>> +  remoteproc's on the Qualcomm IPQ9574, IPQ5332 SoC.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,ipq5332-wcss-sec-pil
>> +      - qcom,ipq9574-wcss-sec-pil
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  firmware-name:
>> +    $ref: /schemas/types.yaml#/definitions/string
>> +    description: Firmware name for the Hexagon core
> No, look how other bindings are doing it.
>
> It looks like you develop patches on some old kernel, so please start
> from scratch on newest kernel.
will update.
>> +
>> +  interrupts:
>> +    items:
>> +      - description: Watchdog interrupt
>> +      - description: Fatal interrupt
>> +      - description: Ready interrupt
>> +      - description: Handover interrupt
>> +      - description: Stop acknowledge interrupt
>> +
>> +  interrupt-names:
>> +    items:
>> +      - const: wdog
>> +      - const: fatal
>> +      - const: ready
>> +      - const: handover
>> +      - const: stop-ack
>> +
>> +  clocks:
>> +    items:
>> +      - description: IM SLEEP clock
> What is IM? Explain all acronyms.
>
> What is SLEEP?

IM_SLEEP_CLK - Internal Module sleep clock needed for Q6 reset.

SLEEP is not an acronym here.

>> +
>> +  clock-names:
>> +    items:
>> +      - const: im_sleep
> sleep? Are there different sleep clocks here?

We have different branches of sleep clk each enabled separately.

im_sleep is one of those branches that q6 uses.

>> +
>> +  qcom,smem-states:
>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>> +    description: States used by the AP to signal the remote processor
>> +    items:
>> +      - description: Shutdown Q6
>> +      - description: Stop Q6
>> +
> Do not introduce other order. First stop, then shutdown.
will update
>> +  qcom,smem-state-names:
>> +    description:
>> +      Names of the states used by the AP to signal the remote processor
>> +    items:
>> +      - const: shutdown
>> +      - const: stop
> The same.
will update.
>> +
>> +  memory-region:
>> +    items:
>> +      - description: Q6 reserved region
>> +
>> +  glink-edge:
>> +    $ref: /schemas/remoteproc/qcom,glink-edge.yaml#
>> +    description:
>> +      Qualcomm G-Link subnode which represents communication edge, channels
>> +      and devices related to the Modem.
>> +    unevaluatedProperties: false
>> +
>> +required:
>> +  - compatible
>> +  - firmware-name
>> +  - reg
>> +  - interrupts
>> +  - interrupt-names
>> +  - qcom,smem-states
>> +  - qcom,smem-state-names
>> +  - memory-region
> Keep the same order as in properties.
ok.
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/clock/qcom,ipq5332-gcc.h>
>> +    q6v5_wcss: remoteproc@d100000 {
> Drop unused label.

ok.

Regards,

Gokul

>> +      compatible = "qcom,ipq5332-wcss-sec-pil";
>> +      reg = <0xd100000 0x4040>;
>> +      firmware-name = "ath12k/IPQ5332/hw1.0/q6_fw0.mdt";
>> +      interrupts-extended = <&intc GIC_SPI 291 IRQ_TYPE_EDGE_RISING>,
>> +                            <&wcss_smp2p_in 0 IRQ_TYPE_NONE>,
>> +                            <&wcss_smp2p_in 1 IRQ_TYPE_NONE>,
> Best regards,
> Krzysztof
>

