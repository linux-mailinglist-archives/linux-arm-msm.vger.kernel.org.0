Return-Path: <linux-arm-msm+bounces-108915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2NztAp2bDmqTAgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 07:43:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F9559F2A4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 07:43:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 922803054EBB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 05:43:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBD5F38B7D8;
	Thu, 21 May 2026 05:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IL5yV/Cw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="heWFrRSH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F632D0603
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 05:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779342229; cv=none; b=AclQ8ZGmeXdRI17njDcZKN2cexqus9Am9VS3Ga5Zp6IINYcUpTRPp1YqIs6QD6dyYWz83diywdvBhkzp08WJ9Ja9NqmLFjfR/Lp1ahnTiHAwsi2PzRkw70TwASLqa46AGIcgueyfi8fZE5C8F7uWCIyj5HfA+zXJxGz7KcaBucw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779342229; c=relaxed/simple;
	bh=UX9mPeVXdPlTrdlral1b8cH24Evvjas7dfYJnZiHGPI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uASJ2O1M2gjmypBNlPQAFJuyI72UKO7b79gKl7WIivt+gmsCWpqitb2FNxdirKqzc+GJyOWRZNrqst+8U887NzXzWCkuVjlu0vchnOEdK/IjzCU4F57GUIuYn7Fdb5+2J2DjTgDMh7R4sLtOIQjtQL//u89wPhyR4TcC1Q5wQP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IL5yV/Cw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=heWFrRSH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L26tTP448311
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 05:43:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qKpUrY9c+Nt+cLeu7+AnKXbXJe0Cc0NQbiZYl9VY2Jg=; b=IL5yV/CwcYMQyn5m
	/h6sydk6UgX2c8dXRHHLGCn7K8tGjGWz1X/c5y9XU/j0iGBBbKhV04rPGTcwAP8y
	JJXtojBzBmZQ/teID7+GZYBJqs+gI9xj1P81cHzqzoApwL3BioWHf0LDFYouXdVQ
	VkLKM7SUpjMY8NOuxGmyxNV9QSievzjbg5GZ9STPRBUuHjgT2/Ja6kO3X2vz+80y
	YMUd7FLzr0uCg1j88gBE5faMQ3MqE/skHkr/+spAD4ZKZtg/bRZKIE8tKG9j10bv
	CS+7bIxLBNGwHHUkOAcRxJPzeDFWezqh7z4XE5E/oT/YQvI3XKZw8uNOABPaKNdM
	+7tiyg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9anrm7jq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 05:43:46 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b9b8137828so58748375ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 22:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779342225; x=1779947025; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qKpUrY9c+Nt+cLeu7+AnKXbXJe0Cc0NQbiZYl9VY2Jg=;
        b=heWFrRSH2PE/j9sDoaQPEgyVF2/btdTuzvdMELSlJMaNXGx2X9672vTwHYqsw41MDH
         Qj7eEv0MPae2gi94Y4dKVr6dgNb+kOcAHrEcet8m+TYK29EnbQrqlaAj4+RJ3p7yzp4T
         SopAAlbdPAmh1BWrtY2qKAAbZ+Kx8lFN7aDQ20yTzHlF0n8pYedhvCJ+HgcfTLgcGfAZ
         sI4pn9ynCAQNw045reJMcjWM3hBn2sk+jD61z6LYHrW8ND/xHJGRfEooVtyfS0+pBLhB
         apvkvhgvc1A1uqKfj0TmxPBF/PV6DxgbiXhjFI623rbpZOSBc83eTWsMW6BtHXcRQruh
         rxmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779342225; x=1779947025;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qKpUrY9c+Nt+cLeu7+AnKXbXJe0Cc0NQbiZYl9VY2Jg=;
        b=kh0VlpdBgEiNVdWJBUXpejiy/UZ2q7l96NO0JVIixFaPUqpTtMqNICKYyBIE+LO8Xo
         TkqhcK3Y9vdTNbih7MEpkQaZlDcfo2hCJgctBNUY0Sdv1fsdfflXIwTJvb571p6Ht8QX
         i6+tf9p7q7S8OJwoyhyJR/5w8b0PTwZUeWQ50gykXWOeW+4JW0RpvgpBZqkRxy7Imreh
         lVQJx29sQtTwFw508PiartVSqCDPBmTH5RdwviNobjNK9AD+gEC67K+Ddez9yqSKrMOg
         YTuZXzQgBTFtk07ompfSEb4RS5caJu7THsFewBd4rFqncnL98lOYIcarXYMcrmoSxQ2P
         46Nw==
X-Forwarded-Encrypted: i=1; AFNElJ8GfEFbqNX2bp7Xlh+CmyIsuGecAeC4CsCpAdKyrRbzAvjyEDoISEIHOBFQrxcD3C1eNd2FajllgEJxBudk@vger.kernel.org
X-Gm-Message-State: AOJu0YxPsu7aQ5AUy8gi2a/LmrUl1dZP7oLE4W9xQ7RyFLeLpxEvV3Ay
	ssa3IqqiX3HTw37JdZ5/6Z3PrCPMmq49/x5d8SfShUcAscJPoNqxIT1KQqN/pIr9EHFsfYAsxCs
	sRCuwju+fLGfP5nXmMWkmjeP/zKJ5kyxbQu2ghcVvGHqkz/HTsvocIw3gBt/ufewjUwBF
X-Gm-Gg: Acq92OFUaSKizW7HzT6bA0YxkWReVTsbY/tvbH+h9s0g9bASMI6DIirjBD/ByHUJVXO
	H/2qTKXGYMETYWp0DTY5265hzL8+bkJxmbl54yy+mwhTKg2F/PTmfnBSN1nQgUU/d/Od51QxqJ7
	HFBBClVfuZjVeVQRh9XRl8nU1oadAlHJU/4VFa63I3wmGo4W9WBUiTP0DyorhBoHxr8Vl+6lxhI
	Ev22le8MCf88i2jsHkLKVSPDVoB+cc4rYOfMPw6JY4/J+JEXpsVTBP8Cq6Rah9DviF3jnxuG6k3
	1Mi3SSvvlfozDYzSJ6BCBJfYbHWWNizNfu4iYZEeCr5SB786U6NI2uldMMHRHCAiX2xPXfUK4UM
	NppWAgmkSlWb8eauuO6x43OplmSwaJbA72UJEYYAqC3Buhoe6qg==
X-Received: by 2002:a17:902:f60b:b0:2b2:ebed:7af8 with SMTP id d9443c01a7336-2bea2fa2c4fmr14909105ad.1.1779342225214;
        Wed, 20 May 2026 22:43:45 -0700 (PDT)
X-Received: by 2002:a17:902:f60b:b0:2b2:ebed:7af8 with SMTP id d9443c01a7336-2bea2fa2c4fmr14908675ad.1.1779342224666;
        Wed, 20 May 2026 22:43:44 -0700 (PDT)
Received: from [10.92.215.233] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd5f30bsm273593915ad.16.2026.05.20.22.43.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 22:43:44 -0700 (PDT)
Message-ID: <10674bd3-d98b-44d6-9846-37bf5a22f583@oss.qualcomm.com>
Date: Thu, 21 May 2026 11:12:57 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: cpufreq: qcom-hw: Document Shikra
 CPUFREQ Hardware
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260519-shikra-cpufreq-scaling-v2-0-2b09f0e1c9d8@oss.qualcomm.com>
 <20260519-shikra-cpufreq-scaling-v2-1-2b09f0e1c9d8@oss.qualcomm.com>
 <20260520-hissing-rook-of-penetration-b4d6c5@quoll>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20260520-hissing-rook-of-penetration-b4d6c5@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: HsHQ4aFn8JO19Jdao9UC0YxqzcP2Cz5A
X-Proofpoint-ORIG-GUID: HsHQ4aFn8JO19Jdao9UC0YxqzcP2Cz5A
X-Authority-Analysis: v=2.4 cv=UuJT8ewB c=1 sm=1 tr=0 ts=6a0e9b92 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=DFSuKv5auc15g7BGkicA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA1MiBTYWx0ZWRfXzwpoavS4YvjP
 SR8z1KSkyiIIYs3zOL2rksY0HEEC+rRXF4pv7AruF42klVUtuavo42mDJraDy8YUxm8BVW5uTQI
 BZulC8GgI9/3+y9dWgQaamKVSCb1aHiiADWpsS+uqvKHn6myjKinzH1gpuylv0QRGIcg6t0f+VH
 tsXzGQY8Cctt7B0WtXhsspagyhGU3OUuhk4yb16WxwBuOsCl4qoEyW98FS42H5QkFyNY4iCvJ61
 WWkITx4K5uIeoGLhcIftmiEz6ruZ2LamlYOGY4eoKd3WOZnXJrReaRBJcIcy8iQJSUjKw/vyxSC
 P40frbtm4VMxuzSl07+jdDuG7bvqzseVONSZNExceh+DMEoXYAlKzCHkJQBUoVfwInhElBe06mb
 aqXqmp45CFaatsq1fkB8Y2Huhtm8oa02wTRUybPdzrZN0+RLhDsdMgQqaYXGttqHl7+ol1vK1m/
 7d6JYoqXD/i/67i39ew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210052
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-108915-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.1.44:email,0.0.0.0:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,0.0.0.200:email,0.0.0.100:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 76F9559F2A4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 20-05-2026 03:50 pm, Krzysztof Kozlowski wrote:
> On Tue, May 19, 2026 at 10:58:03PM +0530, Imran Shaik wrote:
>> The Qualcomm Shikra cpufreq hardware is functionally identical to EPSS,
>> but supports only up to 12 frequency lookup table (LUT) entries. Introduce
>> Shikra specific bindings to represent this constrained EPSS variant.
>>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
>>   .../bindings/cpufreq/shikra-cpufreq-qcom-hw.yaml   | 133 +++++++++++++++++++++
> 
> Filename must match compatible. Please read writing-bindings doc.
> 

Sure, kept it aligned with the existing epss file name. Will rename it 
to match the Shikra compatible name.

>>   1 file changed, 133 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/cpufreq/shikra-cpufreq-qcom-hw.yaml b/Documentation/devicetree/bindings/cpufreq/shikra-cpufreq-qcom-hw.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..52079ed661671554fcca8677409ee11199f5727b
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/cpufreq/shikra-cpufreq-qcom-hw.yaml
>> @@ -0,0 +1,133 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/cpufreq/shikra-cpufreq-qcom-hw.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: CPUFREQ HW for Qualcomm Shikra SoC
>> +
>> +maintainers:
>> +  - Imran Shaik <imran.shaik@oss.qualcomm.com>
>> +  - Taniya Das <taniya.das@oss.qualcomm.com>
>> +
>> +description: |
>> +
> 
> Drop blank line
> 

Sure.

>> +  CPUFREQ HW is a hardware engine used by some Qualcomm SoCs to manage
>> +  frequency in hardware. It is capable of controlling frequency for
>> +  multiple clusters.
>> +
>> +  The Qualcomm Shikra CPUFREQ HW supports up to 12 frequency lookup table
>> +  (LUT) entries.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,shikra-cpufreq-epss
> 
> cpufreq is Linux term. How the device called in manual? EPSS? cpufreq?
> cpufreq-epss?
> 

Its EPSS. Will update the compatible name as qcom,shikra-epss.

>> +
>> +  reg:
>> +    items:
>> +      - description: Frequency domain 0 register region
>> +      - description: Frequency domain 1 register region
>> +
>> +  reg-names:
>> +    items:
>> +      - const: freq-domain0
>> +      - const: freq-domain1
>> +
>> +  clocks:
>> +    items:
>> +      - description: XO Clock
>> +      - description: GPLL0 Clock
>> +
>> +  clock-names:
>> +    items:
>> +      - const: xo
>> +      - const: alternate
>> +
>> +  interrupts:
>> +    items:
>> +      - description: IRQ line for DCVSH 0
>> +      - description: IRQ line for DCVSH 1
>> +
>> +  interrupt-names:
>> +    items:
>> +      - const: dcvsh-irq-0
>> +      - const: dcvsh-irq-1
>> +
>> +  '#freq-domain-cells':
>> +    const: 1
>> +
>> +  '#clock-cells':
>> +    const: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +  - '#freq-domain-cells'
> 
> Why interrupts are not required?
> 
> Why clock-cells are missing? The device is a clock provider, no? Does it
> differ per each board?
> 

I will add clock-cells also to required list.

>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/qcom,rpmcc.h>
>> +
>> +      cpus {
>> +        #address-cells = <2>;
>> +        #size-cells = <0>;
>> +
>> +        cpu0: cpu@0 {
>> +          device_type = "cpu";
>> +          compatible = "arm,cortex-a55";
>> +          reg = <0x0 0x0>;
>> +          enable-method = "psci";
>> +          qcom,freq-domain = <&cpufreq_hw 0>;
>> +          clocks = <&cpufreq_hw 0>;
>> +        };
>> +
>> +        cpu1: cpu@100 {
>> +          device_type = "cpu";
>> +          compatible = "arm,cortex-a55";
>> +          reg = <0x0 0x100>;
>> +          enable-method = "psci";
>> +          qcom,freq-domain = <&cpufreq_hw 0>;
>> +          clocks = <&cpufreq_hw 0>;
>> +        };
>> +
>> +        cpu2: cpu@200 {
>> +          device_type = "cpu";
>> +          compatible = "arm,cortex-a55";
>> +          reg = <0x0 0x200>;
>> +          enable-method = "psci";
>> +          qcom,freq-domain = <&cpufreq_hw 0>;
>> +          clocks = <&cpufreq_hw 0>;
>> +        };
>> +
>> +        cpu3: cpu@300 {
>> +          device_type = "cpu";
>> +          compatible = "arm,cortex-a78c";
>> +          reg = <0x0 0x300>;
>> +          enable-method = "psci";
>> +          qcom,freq-domain = <&cpufreq_hw 1>;
>> +          clocks = <&cpufreq_hw 1>;
>> +        };
>> +      };
> 
> Drop all nodes above.
> 

Sure, will drop in next series.

>> +
>> +    soc {
>> +      #address-cells = <1>;
>> +      #size-cells = <1>;
>> +
>> +      cpufreq@fd91000 {
>> +        compatible = "qcom,shikra-cpufreq-epss";
>> +        reg = <0x0fd91000 0x1000>, <0x0fd92000 0x1000>;
>> +        reg-names = "freq-domain0", "freq-domain1";
>> +
>> +        clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>, <&gpll0>;
>> +        clock-names = "xo", "alternate";
> 
> Incomplete example.
> 

Sure, will update with IRQ details as well in next series.

Thanks,
Imran

>> +
>> +        #freq-domain-cells = <1>;
>> +        #clock-cells = <1>;
>> +      };
>> +    };
>> +...
>>
>> -- 
>> 2.34.1
>>


