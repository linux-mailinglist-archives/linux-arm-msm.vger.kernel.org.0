Return-Path: <linux-arm-msm+bounces-92731-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6DaHMSI3jmkhBAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92731-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 21:25:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA56130EC6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 21:25:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5F468303D2CC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 20:25:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09DCC30C611;
	Thu, 12 Feb 2026 20:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BV3Z6Ppn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R10hHf98"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E61F9C0
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 20:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770927899; cv=none; b=KZqN0ORYxDubvlL/rr3CZl6CkBcUGijPaf076E5eN2/04kO0vI2bvAogVVVW1haUrli9BveSXIhD8BVkhOvHArie5xR/6qF2BGZgc3YIJvC3F8yOUHx/frd0yedO2HERZaQNS/zXoHHiaMCjg2DShSArqFQsyzBQF7BgcAth4xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770927899; c=relaxed/simple;
	bh=z0MqLM9tPrQBVm9SriOBamLQ+piTfSlt5beztrKO9Dk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D0i1qH0nnKWJENN7ihHzcnamw+cZehbmI0EyIbfQo8hZ0mAZ+X3ySA2B43404QhQWjxiHP4xmFh/zc2p2yEauqE57A9VK6PCWTKXieZc7U8GQkTMA5twK7rAKiWMJNbTZnOD8JFTIsuWf+dKfKgw5Jqb1v/wwuH/DF82K+ZkJ/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BV3Z6Ppn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R10hHf98; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CDRlxN588852
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 20:24:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uKYdLADorOb0aef85RQYXnUPOkx+7cAVnEN0Fv//BAA=; b=BV3Z6Ppn6qugW25e
	7pp+UYLeo+UAGAajAXEOUfhmef4hrEFoxN2cEbljoY04rAw2pOa0ajI4hlY5dI6W
	It9SxApZLQQc+1aCXKbWw87HMI7WozngBFgIOAJ+TycEvNEbJ/IUFdWDk6tKDvE9
	+/2A3f/vYpwr5gTy8CalsQNU4GN3XkZOash1Tje8WcZd8V+v+Aho5GxEKQvkZMyv
	MPZ4bXyJZzAH3RNNiAn+HkMBbninH5NfZVVL/p8lb76fcqWKUZLOf5FXD1nqqbrI
	1IPc/fS4Dkh7T8bApxKCs3S8OknOh8z1AD5gyY87GyAvIl1z2VmPwbKgKC6Vs86a
	Quz7pw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c93snkst7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 20:24:56 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b630b4d8d52so107273a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 12:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770927896; x=1771532696; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uKYdLADorOb0aef85RQYXnUPOkx+7cAVnEN0Fv//BAA=;
        b=R10hHf98BriXgOSKYgQK/3lvScIJUgQYgXij2FKmU1ERT0IZFYEEb09PnKzseJm/5R
         CtEewR9mUd5Xg4M4HFNZvscta8vMq31MqkEOZq4VSoOLIYekZQPClSn+GEKOivm0NxGA
         TaC/2vUIDOtQioEm+j0RdWK5Bu5bS6bMjGOUzwbqtq7CgbmdRgqnFxP4YbfORStYYEGG
         2iaB6SuRIoJNYjA805x0u5tI2zKxS/clrF+5sCnne7BRQZCqdzd68gPYmuYKaZPFyz7L
         C7grhdPkQsd2V5aqSvf+TXejR+AwSHmcQTC0GaF3dEaerE9LTmj4Gs8mpdEtmNW168iJ
         OL1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770927896; x=1771532696;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uKYdLADorOb0aef85RQYXnUPOkx+7cAVnEN0Fv//BAA=;
        b=wPsCyH/UZCS/+xL7Us/EQicY87RPhO1OURkvd0tflf1weGdwblJWgYi6vj+8uTUkgL
         aYeOfO8M4kFB06NqgNcuyfnRWzTLMR1dYO+a0VfS59W0R4HmTkVNvNaQ2UgpHwMuw0Uq
         NyU56LQp3Gn1VoIA079oxZBaUyH3vAkC/H3MedIywpHYdE0apUvDpfjxVitm5vQN/Cdt
         L5ObgJ5T+hzK3ZVtrAOOgUDEAV2ONlZ4LOoqv0KIQ/5tAFa0vZ9rB6pC8RvhAgE3dGR3
         HWI3dAMVyIlH6mEeUrqTj5w4PlqwIrigv3KXyncOSUHcDQgW7tOS4sVBHa2VmncIUSum
         QqVQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4ALnsYkzGZP0ma5uidx8PM3V9vbSQYM6BCeyMSkUfFCHNs7xdRJzveWWkSwzRENc75HwkCgW0JUpHFjdN@vger.kernel.org
X-Gm-Message-State: AOJu0YxooOluIlvxgx8g2nA7OoqBNEh+m8YqAvE0WBBm8VyOwiDJtF9b
	KWUXUkk9qMiuTeEqEm+kyzBVa7QmhmlO12y6J7RPGc8NZl7z6H+qLk32vxo1ji+ddNPC/HC3w4l
	pALkxTUHDzNulQveVw6E3eKkFaKxx0FKYfGAWkfUQ0J1FSjsHVjhZcaXu7JRXAXXZPj9+
X-Gm-Gg: AZuq6aIjL/VdQi//Yth5rz+C8oZcUQNVuP5Q3F9D0s2AY0iSc3BjfU7T/9ByeILi8nS
	RVB5rfKB+6Fd/yK2+QhRgvmakx+zWcNkUz7oKp5tStOigrW8Kx/BNCFYaCvgAYhIKtn/OFvOjVC
	LT/WgPK3A6xqpo860odEQrf6UNEO/CppMRnYinFvGkw3fsChjiJhn1k3z1tz3MBS8X4k5haRTqv
	sMsQYgsayvJoT6OQHGo/ac6rT/yXiSEHtXlT70PoB5k/dt2vf3ZysRUylalXTzfjdEQ81mF0NkE
	AIUR9BrW1Gpp9iQY3rjFgxoNwlr9FZBiYAaN9JxKeRr86pRDaW5neoXyV3VvHS00ck0Oe+ftMJ4
	vyMz9+FAHsTXktNyyOa+jBpXi9MX+XMIIX7u/0rhr5S8eXj92IFew/co=
X-Received: by 2002:a05:6a21:150b:b0:366:14b0:4b03 with SMTP id adf61e73a8af0-394672af719mr16685637.63.1770927895628;
        Thu, 12 Feb 2026 12:24:55 -0800 (PST)
X-Received: by 2002:a05:6a21:150b:b0:366:14b0:4b03 with SMTP id adf61e73a8af0-394672af719mr16666637.63.1770927894991;
        Thu, 12 Feb 2026 12:24:54 -0800 (PST)
Received: from [192.168.2.5] ([49.204.20.221])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-356a88a04a5sm19658a91.13.2026.02.12.12.24.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 12:24:54 -0800 (PST)
Message-ID: <b286f784-1246-464a-a678-dcdcf3350f3d@oss.qualcomm.com>
Date: Fri, 13 Feb 2026 01:54:48 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: hwmon: Add qcom,bcl-hwmon yaml bindings
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, amit.kucheria@oss.qualcomm.com,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260206-qcom-bcl-hwmon-v1-0-7b426f0b77a1@oss.qualcomm.com>
 <20260206-qcom-bcl-hwmon-v1-1-7b426f0b77a1@oss.qualcomm.com>
 <20260206-tricky-funky-bison-ffafa3@quoll>
Content-Language: en-US
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
In-Reply-To: <20260206-tricky-funky-bison-ffafa3@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDE1NyBTYWx0ZWRfX3uz4KZJLmycx
 FJhqZ+cKhaCTdxFakPswSsFdH9RVteSpLx5NuqPRRrdXO8oez8bvKd2Zvzt3JBg0LQgb1uF6naV
 bMgs85m8kLwm9ezKxf0SoSyeYV8xzWKF3R1o4WG2IvGTDwoKvoI6927gRaNMKuTKjfIuaS7cHmV
 c8gAWFX716X9vpt8Lb5kLzflamaGOVSWdzp188/QmohKeoVr8aAuGZLiiGT9i0I0B6BHcpIeNed
 gFOQJAvNq8dUkV+Z9buiaNCl0fvq8DwU5Jz8KhGjFURA+jNHIOgfES3rJuqonkVayv0Dqm6dw6P
 GrtX18vERLkJJ8WuHkZkKOVF89G0Sxn2X3QsV6qfWBCBwU8sl5vX4oDgUZ9+Z0Xf22KNB7JJi5r
 vA/ItyurjkxAMdP/zoDcepbSpvsj8ce4K7nauVS6+id54a/Da+d5qBkR0aSvwvuUTHqji5F4xMv
 nDL3luM087U9FkIWjfA==
X-Proofpoint-ORIG-GUID: WFJrP71KOH31eMv2RnLQgoJfV6NIPvI9
X-Authority-Analysis: v=2.4 cv=dLCrWeZb c=1 sm=1 tr=0 ts=698e3718 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=vFtg0H/HDnVpo/8TLRRAnA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=gEfo2CItAAAA:8 a=UXIAUNObAAAA:8 a=EUspDBNiAAAA:8 a=GuN8W3Bbd2OushFT6gEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=a1s67YnXd6TbAZZNj1wK:22
X-Proofpoint-GUID: WFJrP71KOH31eMv2RnLQgoJfV6NIPvI9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_05,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602120157
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92731-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,devicetree-specification.readthedocs.io:url,qualcomm.com:email,qualcomm.com:dkim,1d00:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manaf.pallikunhi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3AA56130EC6
X-Rspamd-Action: no action

Hi Krzysztof,


On 2/6/2026 1:39 PM, Krzysztof Kozlowski wrote:
> On Fri, Feb 06, 2026 at 02:44:05AM +0530, Manaf Meethalavalappu Pallikunhi wrote:
>> Add devicetree binding documentation for Qualcomm PMIC Battery Current
> Subject - You almost hit bingo of what not to do. You miss the third one.
> When you hit the bingo, get in touch for a beer.
>
> And before, read the docs, because this was repeated SO MANY TIMES.
Sure, I will update in next revision
>
>
>> Limiting (BCL) hardware monitor. The BCL hardware provides monitoring
>> and alarm functionality for battery overcurrent and battery/system
>> under voltage conditions.
>>
>> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/hwmon/qcom,bcl-hwmon.yaml  | 128 +++++++++++++++++++++
>>   1 file changed, 128 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/hwmon/qcom,bcl-hwmon.yaml b/Documentation/devicetree/bindings/hwmon/qcom,bcl-hwmon.yaml
>> new file mode 100644
>> index 000000000000..a0e8eaf13eec
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/hwmon/qcom,bcl-hwmon.yaml
>> @@ -0,0 +1,128 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/hwmon/qcom,bcl-hwmon.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm SPMI PMIC Battery Current Limiting (BCL) Hardware Monitor
>> +
>> +maintainers:
>> +  - Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>> +
>> +description: |
> Do not need '|' unless you need to preserve formatting.
ACK
>
>> +  SPMI PMIC Battery Current Limiting (BCL) hardware provides monitoring and
>> +  alarm functionality for battery overcurrent and battery or system under
>> +  voltage conditions. It monitors battery voltage and current, and
>> +  can trigger interrupts when configurable thresholds are exceeded.
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - description: v1 based BCL
>> +        items:
>> +          - enum:
>> +              - qcom,pm7250b-bcl
>> +              - qcom,pm8250b-bcl
>> +          - const: qcom,bcl-v1
> Drop all bcl fallbacks. Pointless, incorrect and misleading.
ACK
>
>> +
>> +      - description: v2 based BCL
>> +        items:
>> +          - enum:
>> +              - qcom,pm8350b-bcl
>> +              - qcom,pm8350c-bcl
>> +          - const: qcom,bcl-v2
>> +
>> +      - description: v3 bmx based BCL
>> +        items:
>> +          - enum:
>> +              - qcom,pm8550b-bcl
>> +              - qcom,pm7550ba-bcl
>> +          - const: qcom,bcl-v3-bmx
>> +
>> +      - description: v3 core based BCL
>> +        items:
>> +          - enum:
>> +              - qcom,pm8550-bc0l
>> +              - qcom,pm7550-bcl
>> +          - const: qcom,bcl-v3-core
>> +
>> +      - description: v3 wb based BCL
>> +        items:
>> +          - enum:
>> +              - qcom,pmw5100-bcl
>> +          - const: qcom,bcl-v3-wb
>> +
>> +      - description: v4 bmx based BCL
>> +        items:
>> +          - enum:
>> +              - qcom,pmih010-bcl
>> +          - const: qcom,bcl-v4-bmx
>> +
>> +      - description: v4 bmx with different scale based BCL
>> +        items:
>> +          - enum:
>> +              - qcom,pmv010-bcl
>> +          - const: qcom,bcl-v4-pmv010
>> +
>> +      - description: v4 core based BCL
>> +        items:
>> +          - enum:
>> +              - qcom,pmh010-bcl
>> +          - const: qcom,bcl-v4-core
>> +
>> +      - description: v4 wb based BCL
>> +        items:
>> +          - enum:
>> +              - qcom,pmw6100-bcl
>> +          - const: qcom,bcl-v4-wb
> I really do not get what you are expressing here but all this is wrong.
>
>> +
>> +  reg:
>> +    maxItems: 1
>> +    description: BCL base address in the SPMI PMIC register map
> Bus defines it. Drop descrip=tion.
ACK
>
>> +
>> +  interrupts:
>> +    minItems: 2
> Drop.
ACK
>
>> +    maxItems: 2
>> +    description:
>> +      BCL alarm interrupts for different threshold levels
> Drop
ACK
>
>> +
>> +  interrupt-names:
>> +    items:
>> +      - const: bcl-max-min
>> +      - const: bcl-critical
> Drop bcl
ACK
>
>> +
>> +  overcurrent-thresholds-milliamp:
>> +    description:
>> +      Current thresholds in milliamperes for the two configurable current
>> +      alarm levels (max and critical). These values are used to override
>> +      default thresholds if a platform has different battery ocp specification.
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> No, please read basic guides or presentations about DT bindings. The
> suffix already defines this.
ACK
>
>> +    minItems: 2
>> +    maxItems: 2
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - interrupt-names
>> +
>> +unevaluatedProperties: false
> You did not bother to read the docs prior to posting this.
>
> You are supposed to do internal review first. Did it happen? I checked
> and cannot find anything. It's not acceptable to use the community
> instead of your internal review.
>
> NAK
My understanding is, it is optional. I will send v2 for internal review.
>
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +
>> +    pmic {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        bcl@1d00 {
> Node names should be generic. See also an explanation and list of
> examples (not exhaustive) in DT specification:
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
> If you cannot find a name matching your device, please check in kernel
> sources for similar cases or you can grow the spec (via pull request to
> DT spec repo).

ACK, Will use  node name as  sensor

Thanks,

Manaf

>
> Best regards,
> Krzysztof
>

