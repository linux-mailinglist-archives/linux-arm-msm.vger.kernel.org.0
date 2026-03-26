Return-Path: <linux-arm-msm+bounces-100076-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yFCxNRsGxWmz5gQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100076-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 11:10:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5D733304B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 11:10:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8E43F318E7DA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 10:01:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EE053C5DA6;
	Thu, 26 Mar 2026 09:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KTlF0Y+1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jH2GIaC1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D403BED1B
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 09:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774519073; cv=none; b=EkWuZnpQmwYSP/3N+9NtUxW+kVFVsljTqEMfJzfIaOUeRunWYY+m2tgtPRLNChE5kBW8phDFSE3ZGSbCZiwAFlvTBPooZ6Qu/wrXEW7X1npk38TfizI34DOe8Yjf4vV8l71KgXjwPzjtCPhuiiL2cSdV4uIyToOzmEHmXHcLyqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774519073; c=relaxed/simple;
	bh=G8iFVkQIQOWoh67cWw2X2M0NwrofOnROz1waXWnqZqw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ni5cGqe33BtvSRbjS0vWtCr0Je+9v9fhrasfeYxIUdPylJigAvqQHQmsfZ3lrCi2Sx6HvWQ29Ue3xWkRx32oBRLc8Vo8PjMHFDHnCfoinDYpqNRc7sHGn8egGAKPoVj3oAy0pbwOnIx/bHMQ16m+kazlCdmfEtAZi/dfcmZrFOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KTlF0Y+1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jH2GIaC1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q6wKH11060683
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 09:57:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0IH2zWDhZtj2Lmu9xTpGVFHEGsRxfhKdYvqx8fhAnfU=; b=KTlF0Y+1VDqNgtCn
	NqY0DDmn5F3/wdu4TqzizvUt/F6ye3Ttq/GHE3N1oAfKKmv+rnl9BljNmK8VaN2o
	W4ayAorlHEox3lGXR5ft7ObasGj4KrqHBMfLyUAWZd9W8Jo7a4jzvVBCwTUK7XuM
	nBB77OusiXCOuR7JoqUZIsDGZBpNxwpQa5xBItDyGXwtoDBtO7y4/n2/Szk40PlB
	UelVuHz8kGXVT9Ok0TnBlGPVxN5C8RfhVXvFwijoP/M2bNGp+TSEhxR2lb9kFn10
	+/cOzG/wbyoEkwCE58wMjD4A5ehFC3ugyXCShVWfDOB8DwoxUctB7QyZORLIiWTz
	HdkSsQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4qkst539-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 09:57:50 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b079b4a8c3so28167205ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 02:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774519069; x=1775123869; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0IH2zWDhZtj2Lmu9xTpGVFHEGsRxfhKdYvqx8fhAnfU=;
        b=jH2GIaC134A3rw4FghdvBcr/BALmi0RGkEo2cy4bbYNOSkAplJXwnbqNXFjOISTaQO
         YicjCf7P1bFIdi8iDZh9///KCfQD9GwVcB31UbMpf90yPoli/mpA5I940RpWcmr3GaoU
         3eWrsTO/JsVrKb9++9DA0FZc4qzgu9DtUv/AX3CRybI1rtIvhWjaCKxcxRuVXiSr2Jx6
         n+ZIN5SkFcRdXt5RjGn/acLkbClxXj2vmG4uUlf0YK5O/Wpv6yT6z4MsHBlsRGi3QuOX
         oaVBLeiacN//RguVwQ6RTG35+aYOqN6NVs170yHreef8c2gd2MZcfEkM6XSU2QQUR7wE
         ADCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774519069; x=1775123869;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0IH2zWDhZtj2Lmu9xTpGVFHEGsRxfhKdYvqx8fhAnfU=;
        b=j1+6Cqa5yqmykgm3SoR+AxBOxAbxjvWLl1byN1arOLWUU3SpVpqYrXIX7jt+rh/QuN
         q9pjClj6tl+KXwEpSkIKHuGfmU8MUenE8ukpgufJycUUpsuaCfLN8mhV+PqI7oMPCwyG
         eI0SdjPtyiTpVqXYzZzI/EjVFQ/qcuSCLTuTf3roTVI+VcD46idZXmT5G16ERPWkdSXA
         PkgSOtWKl8DOkfE06muA0S2doySJnst1YbJlsTcso8GDn2d+yPgGN33AvHBW9IaVq4Py
         uiKCxU8NDKBQrajLq8sxv4rL2D0Hp5HP2L9hLRH50lUtuTKXCzewnno7eSeu9vSGngOm
         TJFw==
X-Forwarded-Encrypted: i=1; AJvYcCUerDuoFcy6Oi6xssP2ID/HnP77fDmpUhwe0JT9cTGM+PsXatr+Np9uhrEuVn+56DUz3jovttjM45/AjV8L@vger.kernel.org
X-Gm-Message-State: AOJu0YyfXmnlPMRXz9MjgwrCZNi+ST1lAsZWPB0UUW2DOxxko/P7Pi0H
	IUxGwtdDw2JyYnHV2QLj64B/L0knPj66fmpm/Uzkqd5k3N3aQRiFzYdbYA3i8ukF+QoXKvQG12L
	9DzpcoJpxxBRTJ+txLiDkDolu1KhQEfTzPsGvlDcXc9RRw795jczDERSGv7rVTn1bRPUh
X-Gm-Gg: ATEYQzwQofZL9ruWWxYbPNFcyczuVAAzpPuIQnnUvphIqWviH7Y42sFNG4lj6WxhY+c
	Umzyn1GR2kmTREXNyTF+IG+LhSSvLTul35FUM3oFPds0S/nm7kW+lu8+zsL90OP+Q/IO0UOP65o
	IitCPI2qNBqIugjEfofYL2Qw+u+naF/2be1jhhENNg5zXyqEh8TV5o4ZAZwcW+PzyUz2y/4VKu6
	+YJ5f6yBtZImLNE9mHdWy4H7ZANrwFnlg67dAtuiT4g8qUD6FJqvYtnhj0dx5962rE0iqr1h7Dt
	lcHGIJpO61nWL813yBXppE10lDDcJbOdQvMlxxL/u9C72+yKdg1VftuYrDvGyi1sPIc6kr3IPbx
	t17+ewzqhwWFf9jxwFWCA16IRx1HtB74AiWVrqRZKlFpD4Rzfab1r05IfyfZL
X-Received: by 2002:a17:902:d581:b0:2b0:b325:748a with SMTP id d9443c01a7336-2b0b3257b59mr69142335ad.22.1774519069071;
        Thu, 26 Mar 2026 02:57:49 -0700 (PDT)
X-Received: by 2002:a17:902:d581:b0:2b0:b325:748a with SMTP id d9443c01a7336-2b0b3257b59mr69142055ad.22.1774519068585;
        Thu, 26 Mar 2026 02:57:48 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc87e4e4sm23399665ad.38.2026.03.26.02.57.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 02:57:48 -0700 (PDT)
Message-ID: <138dee9e-56e7-43a0-bcbd-0e4db4d5b5af@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 15:27:42 +0530
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
 <a7e7f32e-e365-4504-8ce9-1aada01bc52c@oss.qualcomm.com>
 <fc9e0399-dc24-48c4-99db-f9e39a79cda7@kernel.org>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <fc9e0399-dc24-48c4-99db-f9e39a79cda7@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA2OSBTYWx0ZWRfXx6Q9MHMX92zQ
 CSjTol7pmBcuzxzuPPPg12tfHGUaxQmX/WLpUOhu9NLSHPBTuAbwwd9J4mjly+AudJqN0MT80tB
 upIHXn+3oDLBIORpJHDCi9KyVVGUjvgrp2R51/xxKBMxv8hc7iN2ikPbxOaWuDLjadSnWYqT672
 p06uc5UJTadjWddtuod63/vtjfAbe473NADfOJmrEJkWHmBN8BrdxtjbnnNjS0I0UNs7w+DeiPv
 cFQr0lzh80E1Kllm1P19RIXGzZQERBVT/Mn/WGhL64qdRgy/qx6LyM1UsVi+1zPYxxZX++yCQ1O
 e9tTZXEx7I/3MkM+bHPkPV+pdwPFCZ0zZTGncajXDhsEaOoOaqdRo2uXUT/45KXda84mAoChHle
 gNve2ixAQi4OHVRXJitG/2l8yuJW1zKoEx6n8TTvmdqtXiuEENQ3YME9jc8F+Q7uA/EoLf5lOXm
 s0vVwWEsDeXXl9Vw3TA==
X-Proofpoint-ORIG-GUID: 0LkE9zX6hWXbrcRtmQDxKP0a3wIo18yY
X-Authority-Analysis: v=2.4 cv=eOMeTXp1 c=1 sm=1 tr=0 ts=69c5031e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=qPg06tCIB400QNJGJh4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 0LkE9zX6hWXbrcRtmQDxKP0a3wIo18yY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260069
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,vger.kernel.org,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-100076-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4A5D733304B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/17/2026 12:41 PM, Krzysztof Kozlowski wrote:
> On 17/03/2026 06:27, Mohammad Rafi Shaik wrote:
>>
>>
>> On 3/10/2026 3:25 PM, Krzysztof Kozlowski wrote:
>>> On Mon, Mar 09, 2026 at 04:42:57PM +0530, Mohammad Rafi Shaik wrote:
>>>> Extend the qcom,q6apm-lpass-dais device tree binding to explicitly
>>>> describe Digital Audio Interface (DAI) child nodes.
>>>>
>>>> Add #address-cells and #size-cells to allow representation of multiple
>>>> DAI instances as child nodes, and define a dai@<id> pattern to document
>>>> per-DAI properties such as the interface ID and associated clocks.
>>>>
>>>> Qualcomm platforms like talos integrate third-party audio codecs or use
>>>> different external audio paths. These designs often require additional
>>>> configuration such as explicit MI2S MCLK settings for audio to work.
>>>>
>>>> Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>>>> ---
>>>>    .../bindings/sound/qcom,q6apm-lpass-dais.yaml | 41 ++++++++++++++++++-
>>>>    1 file changed, 40 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
>>>> index 2fb95544d..1d770cbcb 100644
>>>> --- a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
>>>> +++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
>>>> @@ -21,6 +21,34 @@ properties:
>>>>      '#sound-dai-cells':
>>>>        const: 1
>>>>    
>>>> +  '#address-cells':
>>>> +    const: 1
>>>> +
>>>> +  '#size-cells':
>>>> +    const: 0
>>>> +
>>>> +# Digital Audio Interfaces
>>>> +patternProperties:
>>>> +  '^dai@[0-9]+$':
>>>> +    type: object
>>>> +    description:
>>>> +      Q6DSP Digital Audio Interfaces.
>>>> +
>>>> +    properties:
>>>> +      reg:
>>>> +        description:
>>>> +          Digital Audio Interface ID
>>>> +
>>>> +      clocks:
>>>> +        minItems: 1
>>>> +        maxItems: 3
>>>> +
>>>> +      clock-names:
>>>> +        minItems: 1
>>>> +        maxItems: 3
>>>
>>> No, this is just way too generic. There is no such syntax in the kernel
>>> and this should stop you right there. You are not allowed to add your
>>> own style.
>>>
>>> I don't think DAI is here a separate device needing its own resources
>>> expressed in DT. This is still part of ADSP so you just described in DT
>>> internal routing between two services on ADSP.
>>>
>>
>> Thanks for reviewing.
>>
>> I’d like to clarify that this is not intended to model the DAI as a
>> separate physical device or to describe internal ADSP routing.
> 
> If you do not want to represent the physical device, then I don't think
> it should be represented at all.
> 
>>
>> Requirement is to allow the kernel to send clock‑voting requests to the
>> ADSP. LPASS MCLK routing is not enabled by default on the ADSP, so the
>> kernel must explicitly request the ADSP to enable the relevant LPASS
>> MCLKs, which is a real hardware control requirement.
>>
>> These clocks are LPASS‑owned, and driving them via a third‑party codec
>> is not appropriate. The intent of adding clock capabilities at the DAI
>> level is to allow the kernel to associate LPASS clock votes with a
>> specific DAI instance during stream activity.
>>
>> While the DAI itself is not a physical device, some DT representation is
>> required to describe per‑DAI LPASS clock requirements.
> 
> DT's purpose is not to describe software constructs, thus DT is not the
> answer to your requirement of mapping clocks to specific DAI needs.
> Every person adding software properties made "some DT representation is
> required" claim.
> 
>>
>> I’m open to considering alternative representations, but removing this
>> entirely would leave no generic way for the kernel to handle correct
>> LPASS MCLK voting.
> 
> I imagine that, since this is software construct, the software knows
> which DAI needs which clock. Clocks are strictly defined, thus driver
> should handle all this.
> 

No, the MCLK connection is not fixed to a specific DAI.

The LPASS MCLKs
LPASS_CLK_ID_MCLK_1 … LPASS_CLK_ID_MCLK_5

are hard‑wired connection, each physically routed to an external codec 
on the board.

Because of this, the clock that must be voted depends purely on the 
hardware wiring, not on which DAI (Primary/Secondary/Tertiary/Quaternary 
MI2S) is used.

In other words, DAI ↔ MCLK is not a fixed mapping.

Examples:
On Talos‑EVK, the speaker is connected via Primary MI2S, but the 
corresponding MCLK line wired to the codec is LPASS_CLK_ID_MCLK_2.

On Kodiak, the customer connected an SGTL5000 codec via Quaternary MI2S, 
yet the required MCLK is still LPASS_CLK_ID_MCLK_2.

Instead, the kernel must vote for the MCLK that is physically connected 
to the external codec on that specific board.


Thanks & Regards,
Rafi.

> 
> Best regards,
> Krzysztof


