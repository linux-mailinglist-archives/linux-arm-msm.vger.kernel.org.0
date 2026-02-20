Return-Path: <linux-arm-msm+bounces-93498-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2ACqNhROmGmbFwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93498-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 13:05:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C0C1676B7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 13:05:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 05713302DE50
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 12:05:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4449B342CB4;
	Fri, 20 Feb 2026 12:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iJfMgScC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h2YacQR4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE791342C8B
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 12:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771589138; cv=none; b=njP+XKL+rz5CI7UO6WUpC004OsVYLPzj5cmXUDdduYgD5ZhwpS+P4u6+Fo25BoEjr0/eveOj9rt+q1v90lmoK5fAcn9ueTeDuEefCO0HPjG66/jCQlTv5h+JuQuOW8gur1n70XOVRl/cGWgLUzBMgFoAuec9cdqXveE/W92mJHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771589138; c=relaxed/simple;
	bh=5589XGveaJrFKM4G0yJEEpKgPGLdvmNfSulvySaX48E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pm1S+NSqmi59THjaq45oW5uH6U0/fh5uSdpb0JUhZKnlnpyfoGWCYvcDhBzDYx/PRIOMXny9fVJLgNQ0LMHLyK+w7Z/JcH4pKo/WSwSaQL0DNSpyU1Yiq+ycQPgvlzRFxIhtWMBpNv8pT2rGRVJk3eQzC5aCoLe1oJ/DI2sFmxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iJfMgScC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h2YacQR4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61K5SWvV1852131
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 12:05:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4AnohYpFd1eVw3fRCn/zigCbPOyIedqoq/xhotPnpRo=; b=iJfMgScC9lLge0T1
	Ys7GRai8CsZdJ61P77O48Q7QYtxDCjGNfCSz/3KSWXQAVASzFH2EkHo4XBhOo57g
	gt0z1xriQZc+z82YiH1GhuzlNxXFslZfnh0+BjDIPYxY3OqFjUjG/z3Os5QG2lsL
	SZ2LXbUg/ilzbuoDhqTSPU24NVPsxXT/rrx7F6suJXbOSIUXKkqugzSlbIWSDLQh
	vV1dMjr4MuJ4xdhETVGCZu0qJZrFluEPeg7c4Qi8myL8e2Da4H4aLK7+pbjaBxDB
	tlBbrdBpOK0Q/5oqDmBZzsXWsKUUt6+dWic99FbDPqf6lQgJssaYexhUqXimCYcH
	A6n8tw==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ce9nga2fj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 12:05:35 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6798921eff4so23379787eaf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 04:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771589135; x=1772193935; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4AnohYpFd1eVw3fRCn/zigCbPOyIedqoq/xhotPnpRo=;
        b=h2YacQR4F/Qc6WaJOzkLJ/26uQUa1KklKuXJdFgF59fRBp4mExL8S/esryo3tFmeUc
         hDcwSK+G6RINO9q6NexEiYY9W5g3al4mrQk/i6cPCo7wtdtkb//kL6jERhuZjzFGi1qN
         BQvRPFmhT1/pZQniCJUXMR5YYKK2ULxZ9dEYvRZEoybHswiWmT7BEjvaPxaFtjl+UXL1
         7kIgmpYjihJtewaEUfZpBNfU4T8WVCmlUZCwLwUbH0XvUkUblO6VBOC9TGfhMmVU6JRN
         QbszHPHElu/HKk4IIMU0gP9VfTqDLro+hz67WUFX2pNPWLFIblCaHCtK5whv8CV7j+QO
         y63w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771589135; x=1772193935;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4AnohYpFd1eVw3fRCn/zigCbPOyIedqoq/xhotPnpRo=;
        b=t39iwPF0fx/0AjfCVbgvDgrkXvmQGWGEDE5cJAdLcqQAKwqYVun0mvBYkHsUNLaIu3
         pzCWG/xPwFEdRti8NNc5bk5x5TZrar5vNgU1gJfYPKcoIjxF3Z0tBt7E3IwkoJkdHlXa
         aSViqOpJCs7zM6pEZzzlAUxU+h50t20kit7taUZZMWKrHdiXnII7Mgk5G7LIeFOu4YQi
         LOMevfMtStGk/gyK4LwsGb2SaVcqB1TOEXOXodgwpDC8B0o106hYDmDpxHcez63vVLyJ
         Zwf5uT6iLHfVU6TSMNpMabpACwomy22BWIn35O7lyOJDy8vHt6oZdxkuAHv5ICVVl5/v
         4oMw==
X-Forwarded-Encrypted: i=1; AJvYcCVzXURVOtqkfZbqxFpQesXP6xaF1m515q7xXCZ/PmGY7ouIBeXdXhvwwwhOjAphXPZpH/N5uRyj8Ow+x4X7@vger.kernel.org
X-Gm-Message-State: AOJu0YzBIVFLXF6Dq0de/SxcrUHTQSeuAl5OAhNW63galgmx3OgrvwYi
	eqcxLb1hnQ2pdeTXC1bqk+UWzvNQ0poZm4NFffaLZ9y7xJ3EMQvwGdT+BQ4IMjPAmakyrSf2zDO
	qV5xNlXoBfk6ZYTh9BDPYaNtx4bLB7ZdtVvUiFvlLUuB1NhbpGjjtFW8mZjcYNrJygWk0
X-Gm-Gg: AZuq6aK/5PUpUSkCs0TePIbTDoQdzTtX6cXby2+82C4cf0ufJZId4WBV8GXHaDYXfN0
	mOBnwr5CMZICx1QtxOCIaS5R2WaH1vARHWrPQh/SPo+71A73P+9NWxn25/6azKGVP7AWqlyIDxe
	5Ba+RT9Yfw0MTS9MKUfNZ9QysMjmFEhZLUW/TN75YMGuB5J3OWvqkbnCOqCbGlqgY5ltfY6ZLOS
	z/hZr66d85fWWlenBnjkeGrura+jGsZDCNUAtUlyN8YzD8W+VBpmPn+ZVk1cEYqSsE13Zku6ZSf
	7vlvhz/FQoy3U/Jd5VRFDpyMES40m2J96rBk+GAhNtFJXc1pik1zjtkOH9A3Zc7nm17h66jDyjc
	ax5k/DkiQjU4wCtoU1s/ihdayBx8Q98F8xYgjQ2zo2Mo6bGf9d40=
X-Received: by 2002:a05:6820:129:b0:679:88ee:e3f8 with SMTP id 006d021491bc7-67988eee8d2mr7916319eaf.68.1771589134903;
        Fri, 20 Feb 2026 04:05:34 -0800 (PST)
X-Received: by 2002:a05:6820:129:b0:679:88ee:e3f8 with SMTP id 006d021491bc7-67988eee8d2mr7916308eaf.68.1771589134515;
        Fri, 20 Feb 2026 04:05:34 -0800 (PST)
Received: from [192.168.29.235] ([49.37.133.168])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6799801b2cfsm8075610eaf.15.2026.02.20.04.05.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Feb 2026 04:05:34 -0800 (PST)
Message-ID: <55b6051f-dee6-4f05-96ac-e24752030d4c@oss.qualcomm.com>
Date: Fri, 20 Feb 2026 17:35:24 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] dt-bindings: bluetooth: qcom,qcc2072-bt: add
 bindings for QCC2072
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann
 <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>
Cc: quic_mohamull@quicinc.com, quic_hbandi@quicinc.com,
        janaki.thota@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260218114955.3970974-1-vivek.sahu@oss.qualcomm.com>
 <20260218114955.3970974-2-vivek.sahu@oss.qualcomm.com>
 <af950713-4a0d-43ec-8000-3400f546acbd@kernel.org>
Content-Language: en-US
From: Vivek Sahu <vivek.sahu@oss.qualcomm.com>
In-Reply-To: <af950713-4a0d-43ec-8000-3400f546acbd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIwMDEwNSBTYWx0ZWRfX4eBYGtyLfWlP
 MRhzseOuj+mbWgJ7JYH7OynoL2RHqkKRtfXdd9SyKD4PeuUxrNBNNYMFENp6JKga1Wbf/nZxrVO
 9DRdlqCK93tQqiAmqdfbm7t/usbrqqokqVheFeukiORraVjAaL+C5asQKjD8ZJl3cvyx9ZePQlc
 bbYP1Klwu4UoS2G8bgPm4e+Gm5yplx27KSzMZwtuB0wMZdQtuZZIiAzWCXLTNLZ+UbyHOFpLoO/
 rv2uZuyHnDnIJFBoyiDb93cA33+RtiofGQCXC4jtHvtmd7ydXlCWb8vBKmeLsP9BmFq2gAGeMaz
 YGSnREDTybQ1dKHX75BFBuOF5r6/7e66Jxu7qcOamIccflOlIBIniEWXKzyQJOgJmhOw1RFQq3b
 /GmNmreQ9V5z1o9MtdJb9LIaiZT/jYMgiy2AqMZFJkfJXABV5ZUAnRsiEfdKb3S+lCp+6DqZnkQ
 Xs2oUV8Xq+6jVvjYH1w==
X-Proofpoint-ORIG-GUID: C8XYigw9cHBFTRSrZ_f9az1wIguTrxpZ
X-Authority-Analysis: v=2.4 cv=Sbj6t/Ru c=1 sm=1 tr=0 ts=69984e0f cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=b6EVmk5gcm51ODEEWK3PtA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=P-IC7800AAAA:8 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=2jaMIRPpbWfr_bONL7wA:9 a=QEXdDO2ut3YA:10 a=WZGXeFmKUf7gPmL3hEjn:22
 a=d3PnA9EDa4IxuAV0gXij:22 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: C8XYigw9cHBFTRSrZ_f9az1wIguTrxpZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-20_01,2026-02-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602200105
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93498-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[kernel.org,holtmann.org,gmail.com,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vivek.sahu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 54C0C1676B7
X-Rspamd-Action: no action



On 2/18/2026 5:23 PM, Krzysztof Kozlowski wrote:
> On 18/02/2026 12:49, Vivek Sahu wrote:
>> QCC2072 is a WiFi/BT connectivity radios which exposes
>> UART as an interface for Bluetooth part.
>> It requires different configuartions and firmware, so
> 
> different than what?
> 
> Also typo configurations.
> 
>> document it as a new compatible string.
> 
> Please wrap commit message according to Linux coding style / submission
> process (neither too early nor over the limit):
> https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597
> 

Different configurations like interrupts GPIOs, firmware binaries, 
compat string. Commit msg, I'll correct it in next patch of this commit.

>>
>> Signed-off-by: Vivek Sahu <vivek.sahu@oss.qualcomm.com>
>> ---
>>   .../net/bluetooth/qcom,qcc2072-bt.yaml        | 47 +++++++++++++++++++
>>   1 file changed, 47 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/net/bluetooth/qcom,qcc2072-bt.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/net/bluetooth/qcom,qcc2072-bt.yaml b/Documentation/devicetree/bindings/net/bluetooth/qcom,qcc2072-bt.yaml
>> new file mode 100644
>> index 000000000000..7b27c2c651fa
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/net/bluetooth/qcom,qcc2072-bt.yaml
>> @@ -0,0 +1,47 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/net/bluetooth/qcom,qcc2072-bt.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm QCC2072 Bluetooth
>> +
>> +maintainers:
>> +  - Balakrishna Godavarthi <quic_bgodavar@quicinc.com>
>> +  - Rocky Liao <quic_rjliao@quicinc.com>
>> +
>> +description:
>> +  Qualcomm QCC2072 is a UART-based Bluetooth controller.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,qcc2072-bt
>> +
> 
> Where are clocks?
> 
> Where are supplies?
> 
QCC2072 exposes M.2 UART as an interface for Bluetooth part. It doesn't 
require clocks and voltage regulators to power it up.

>> +  enable-gpios:
>> +    maxItems: 1
>> +    description: GPIO specifier for the chip interrupt.
> 
> Interrupt? No, it cannot be interrupt. This can be only enable pin and
> then description is redundant. Look at other bindings.
> 
> Looks like matching QCA2066, except missing clocks, or like other QCA
> devices with proper supplies.
> 
> I don't believe that Bluetooth device works without power.
> 
It is an interrupt to the HOST. I'll make it more comprehensive in the 
next patch of this commit. QCC2072 exposes M.2 UART as an interface for 
Bluetooth part. It doesn't require clocks and voltage regulators to 
power it up.

>> +
>> +required:
>> +  - compatible
>> +  - enable-gpios
>> +
>> +allOf:
>> +  - $ref: bluetooth-controller.yaml#
>> +  - $ref: qcom,bluetooth-common.yaml
>> +  - $ref: /schemas/serial/serial-peripheral-props.yaml#
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/gpio/gpio.h>
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +
>> +    serial {
>> +        bluetooth {
>> +            compatible = "qcom,qcc2072-bt";
>> +            enable-gpios = <&tlmm 19 IRQ_TYPE_EDGE_FALLING>;
>> +            max-speed = <3200000>;
> 
> No firmware?
> 

Firmware is required, it is just I've not added all the fields in the 
example.

> Best regards,
> Krzysztof


