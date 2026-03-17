Return-Path: <linux-arm-msm+bounces-98067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qAjJHF/muGlulAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 06:27:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7612A3F92
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 06:27:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C4E7830027BE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 05:27:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F68030EF6F;
	Tue, 17 Mar 2026 05:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VBZGQ7MD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E1qOjw8h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D2D7081E
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 05:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773725277; cv=none; b=IVWdIGYTbmYK4uvuqNpMNcd8v+KsQkX0efxNzeJsgLj0x4WCttTRALcThr8nPrOi0Axmx0jjAA0ynrH/93MO6uXnHrMI9ZQp4Foa90NirZsw9hSiIXIShKYw/NVeFOn7U/XOdxsYDDKTLF2GyBgnBhvZr22drZE/kNv/LCauxk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773725277; c=relaxed/simple;
	bh=oLN/kVlfSxwbOWn5YqOBUNzBd5KMlbrmgR65un0P0C8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jt7pyOtc8SrGlmlpc1L0Y8jvmSc536eV8GfJtQ0N7Nwm0GwpcxHUYCXc0rOu7cp2OCSvNhjZyGRbDlj5eGKTvX6t43e/SUL4CmUJV5O1U18HA3WDPXRxhVCLv/a12hbNOqhqWywh4GznC/PdNBvK6iejticHOPVpuLUSgTn9I9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VBZGQ7MD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E1qOjw8h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GM1nhG2375054
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 05:27:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NJ4Dm26PgUHHxAqegK0ORGtS5RM3siTPO7DahKF9/4I=; b=VBZGQ7MDa3G4SSvJ
	D+r5o0YIaq4XhjiRnAjjcJ0XxwslLcUTScNLs9ERd7sTWf/YiFKpjNB8xWp4g5ZB
	YGRHTL11bfhFHmE5I/99ziG9OuG3flinhHu2J8ocrv+rT8RHKm+yfX5tmC7D7/te
	i7QQDwY3gRTj1Q7XEyXCdiYnpkDpkCgwXWgwF5dOJ2Ie2KWq6TlOG3BVxs6WWCUe
	qQrzTbSToWG3OQ7KxUZUNP/O0jxFzFEhRO+LxdaIalsJXbrzEkiRtYv0KIrxQBOO
	r4mt1qigwC59LqsUSMvQ/3fNaU+GEUS83KHMTHaLkPjOCdxPCB2C60k4uY4UgrYw
	5aXUbA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxkby2qff-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 05:27:55 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3594620fe97so39662532a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 22:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773725274; x=1774330074; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NJ4Dm26PgUHHxAqegK0ORGtS5RM3siTPO7DahKF9/4I=;
        b=E1qOjw8hux1T1iepEBJ8kArzNOPhzehqP9eIb7IS1drdbVV6M/wXnSZWgilML96mi2
         cPZk3HSnIKjvYDKVRWUq3XudA741iAEN2kP8blYMHyyhJ42YTHjr09/HOmCbUxC4IHX6
         brMN8LIozKTOqYdxAL+mL0VhOkbOAkgW9yPE2uwq2B8ffY3JumzWLK2/RfW6QNAGn4dx
         sfpjXdTXmm8wIEe4q15ExTQSju4EeCFd51kLXyqi46jNvATPZpg+nQONM14qsszD8hEu
         yvSiFos9iXFyXbL8BEF/aMYuLJ5v5xt+maj8MaKSjHAsP3qDlQb8DhIRPmiS31xkwmxf
         xcjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773725274; x=1774330074;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NJ4Dm26PgUHHxAqegK0ORGtS5RM3siTPO7DahKF9/4I=;
        b=n2ZBgIuQD8STWOLtXuwcPGfcJ9Qj/a61AzX2BzOrX2HK7yNqCs5scHtGlqd4a11hLd
         Wh/oXEFXxcla+X8nSlN76KY6ZvmYu16K/ktSZsJa/iszHQmEHVlpLh4bwBbiJ1iKqvbM
         Ha5QhooLCmv8FR4lgpiC8nchOaY3p9VWRUBZXXonU/wzk1GFEET/VavQxI09+n1iLN90
         I6UeNL2aj4XhvBWPGSJYlbCV91gajeijQE5V2rrJDWSyIh8mawCNGYjnDd8btPCnWe+w
         me9XwoL7SBHrbWzFnQAMO1l8ZS4dE9jpUcRwQzBfIj13Ecw3s6r2OE1ha5MzC20L2q/N
         ks4w==
X-Forwarded-Encrypted: i=1; AJvYcCXkA+QzqJMKVdXOseSn6YquRVH5FqBD+KgToEWWtb41yX8L6davvQGahzVeqioH5epGrhNyT90K/Uiq6j/D@vger.kernel.org
X-Gm-Message-State: AOJu0YyQL0f4KVyvNhIi7zyhM5zwENsNJJ6lKzUgPv+uF0T1thBgci9z
	343z7fGGucCy5vsUjy9Dmee5BoFHZ5y8OzeWANRL0BnNhURo/W7jIs4UfjkW98/waGAFqiiyetp
	9rh6B9dSZTEfkDkoIwt5av9IZiCCEn/dB85avYzI7Bgyu5b5k+vVrd/U+dLvcHYHueWNq40UDSA
	Xn
X-Gm-Gg: ATEYQzylWsW2r3Ed8SKGhXktzB2fw8By2mlNI00UdamkyvlnHUw6yNyhpSsoMQtpa7g
	u17dMoY36fKknc50LUPA2EqCo2UXFA3omh7Nz/dUm1g8YaZECQZbGSotVYpEdr7gAufBJGpkyzy
	+sgxLTWvVw2MHBh+1/LxVzskxzkS+wvecczxdRpkHolL7aiwDSrzBnneoxGjmlcCVWp7k6V1VK8
	3fM+JoT+yQVlUbEQ+AJkMFyqeUcJ3mA8nsGCA/6MmpTdKeKSB2L2a2RyKewRhRFVKno+gAACJnl
	rgd3T9Sp8YMRLwGUhPkaEvoV+z9ysEovqo8IpEjlmrQpvmQuH51IrmsPr7L2ngBIx+Gwv0JQJyx
	C7UQX1LrLo8XSdd9aNUqSbABSWsCYJVcx/YTNdAeyiYkeWYrWfQtWxtjgYAH6
X-Received: by 2002:a17:90b:1d49:b0:356:24f0:af0c with SMTP id 98e67ed59e1d1-35a22003a84mr13527390a91.17.1773725274186;
        Mon, 16 Mar 2026 22:27:54 -0700 (PDT)
X-Received: by 2002:a17:90b:1d49:b0:356:24f0:af0c with SMTP id 98e67ed59e1d1-35a22003a84mr13527341a91.17.1773725273695;
        Mon, 16 Mar 2026 22:27:53 -0700 (PDT)
Received: from [10.83.99.36] ([106.192.46.228])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bada470d2sm1845295a91.7.2026.03.16.22.27.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 22:27:53 -0700 (PDT)
Message-ID: <a7e7f32e-e365-4504-8ce9-1aada01bc52c@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 10:57:44 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] ASoC: dt-bindings: qcom,q6apm-lpass-dais: Document
 DAI subnode
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
References: <20260309111300.2484262-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260309111300.2484262-2-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260310-crazy-screeching-angelfish-297bab@quoll>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <20260310-crazy-screeching-angelfish-297bab@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: oBnPIyKCaAZLFHEMTIx5Xj2XprjXg_GC
X-Proofpoint-ORIG-GUID: oBnPIyKCaAZLFHEMTIx5Xj2XprjXg_GC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDA0NCBTYWx0ZWRfX8BZb1FJUUfsL
 E+/Mwf5EG3sAKzcovC6IXnsAiLVeRYMlvOeTbGmSorCJBRlmIA6e0HelUxKFvv8NiBhBxI+m9Bf
 Xnsbt3DBMqjIASagxncRoxh9eZVNcTUekozbVCEseeLf97d/xi2V+9TtcK9aMNQSmm+znZ7Q/1p
 zCMiKY7kF80gYadRen1gk4QYvlFWx4je1uBmOhndkkojp8I9aAEYGwVQuDLe8tJ3EBcUAwXk7/Y
 DjZ9qJMgDmk4nQuW8hbW3Vcefs0H9E3E5yf9AAkz5gleazZIYgWWtuN/tne3kfMI5ANW1m2IM5K
 BjvaTU0bw2JXF7vPt8Ph1LhKY1MSjIPsE76sqB33TJVO5LE6gaESJbvorfcGuTXbbbPUqqM6eHj
 TPm7mx6EgM+oHpqTBx0yHpC+xTr6gUo3qVp1nvnbjKQYqQBXhTr8NRRgT1olm3EoIZq3aHK1f1u
 QC8r4F9nGdn4sN0LYWQ==
X-Authority-Analysis: v=2.4 cv=ZpLg6t7G c=1 sm=1 tr=0 ts=69b8e65b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=dEIGAuP7kbcW1LL0Y9bFPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=l86ZLHr8ISoCRvqyY7AA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603170044
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,vger.kernel.org,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98067-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DC7612A3F92
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/10/2026 3:25 PM, Krzysztof Kozlowski wrote:
> On Mon, Mar 09, 2026 at 04:42:57PM +0530, Mohammad Rafi Shaik wrote:
>> Extend the qcom,q6apm-lpass-dais device tree binding to explicitly
>> describe Digital Audio Interface (DAI) child nodes.
>>
>> Add #address-cells and #size-cells to allow representation of multiple
>> DAI instances as child nodes, and define a dai@<id> pattern to document
>> per-DAI properties such as the interface ID and associated clocks.
>>
>> Qualcomm platforms like talos integrate third-party audio codecs or use
>> different external audio paths. These designs often require additional
>> configuration such as explicit MI2S MCLK settings for audio to work.
>>
>> Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> ---
>>   .../bindings/sound/qcom,q6apm-lpass-dais.yaml | 41 ++++++++++++++++++-
>>   1 file changed, 40 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
>> index 2fb95544d..1d770cbcb 100644
>> --- a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
>> +++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
>> @@ -21,6 +21,34 @@ properties:
>>     '#sound-dai-cells':
>>       const: 1
>>   
>> +  '#address-cells':
>> +    const: 1
>> +
>> +  '#size-cells':
>> +    const: 0
>> +
>> +# Digital Audio Interfaces
>> +patternProperties:
>> +  '^dai@[0-9]+$':
>> +    type: object
>> +    description:
>> +      Q6DSP Digital Audio Interfaces.
>> +
>> +    properties:
>> +      reg:
>> +        description:
>> +          Digital Audio Interface ID
>> +
>> +      clocks:
>> +        minItems: 1
>> +        maxItems: 3
>> +
>> +      clock-names:
>> +        minItems: 1
>> +        maxItems: 3
> 
> No, this is just way too generic. There is no such syntax in the kernel
> and this should stop you right there. You are not allowed to add your
> own style.
> 
> I don't think DAI is here a separate device needing its own resources
> expressed in DT. This is still part of ADSP so you just described in DT
> internal routing between two services on ADSP.
> 

Thanks for reviewing.

I’d like to clarify that this is not intended to model the DAI as a 
separate physical device or to describe internal ADSP routing.

Requirement is to allow the kernel to send clock‑voting requests to the 
ADSP. LPASS MCLK routing is not enabled by default on the ADSP, so the 
kernel must explicitly request the ADSP to enable the relevant LPASS 
MCLKs, which is a real hardware control requirement.

These clocks are LPASS‑owned, and driving them via a third‑party codec 
is not appropriate. The intent of adding clock capabilities at the DAI 
level is to allow the kernel to associate LPASS clock votes with a 
specific DAI instance during stream activity.

While the DAI itself is not a physical device, some DT representation is 
required to describe per‑DAI LPASS clock requirements.

I’m open to considering alternative representations, but removing this 
entirely would leave no generic way for the kernel to handle correct 
LPASS MCLK voting.

>> +
>> +    additionalProperties: false
>> +
>>   required:
>>     - compatible
>>     - '#sound-dai-cells'
>> @@ -29,7 +57,18 @@ unevaluatedProperties: false
>>   
>>   examples:
>>     - |
>> -    dais {
> 
> Why?
> 

I renamed the example node to bedais to mirror the node naming used in 
Actual DT (q6apmbedai: bedais { ... }).

However, I understand the binding does not require any specific node 
name; only the compatible and required properties/child nodes matter.

The rename was done purely to align the actual DT node naming used in 
practice and improve cross-referencing clarity.

>> +    #include <dt-bindings/sound/qcom,q6afe.h>
>> +
>> +    bedais {
>>           compatible = "qcom,q6apm-lpass-dais";
>>           #sound-dai-cells = <1>;
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        dai@16 {
>> +           reg = <PRIMARY_MI2S_RX>;
>> +           clocks = <&q6prmcc LPASS_CLK_ID_MCLK_1
>> +                              LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
> 
> So one entry, not three.
> 

ACK,

I will add three clock entries for better clarity.


Best Regards,
Rafi.

>> +           clock-names = "mclk";
>> +        };
>>       };
>> -- 
>> 2.34.1
>>


