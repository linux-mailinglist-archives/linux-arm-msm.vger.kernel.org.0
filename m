Return-Path: <linux-arm-msm+bounces-114237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MBR1NL6qOmqWDAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 17:48:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D206B86C1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 17:48:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=SeFNXrTb;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NddsDcRx;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114237-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114237-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C79C23010CE3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 15:48:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EB6721255A;
	Tue, 23 Jun 2026 15:48:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D862F272E6D
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 15:48:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782229688; cv=none; b=usbo2B+h4J/7hiZEPkbM4wfYCX9meDg0lXMujewEZzQwwKTe62CH5t3zMhcYcBt6TCrw/LIT4y4aEFoDvTXER6EunT6sJK9Y5wYCiEZV2N37Zx7wNWHL8RxjVLXw6JCdfgW2E5EJq48fkiqoj9PrJ9VFQIwHHmqvuSSk1w5w+4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782229688; c=relaxed/simple;
	bh=BpThCkBXjZBhx8M8F0BUDiZsLcu4WgQQ7DXbv1cN7R0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DuiqLhaAUHdm6PAbsgY2qC3FFJuEiPbMqPgu39qRNtdH6BrVrq4y+i24L8fL72gRB1kwL/g8yg0Mn0YgWQu/aLNtBEBr4JjD5n9dbvGN8sbVN4SQ6gbatJ73P28VnPd7nsvZ/ypyvjWiuQdaU9xfqdyM5RsKFw7yDxEHw4pHrvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SeFNXrTb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NddsDcRx; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBZp354053103
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 15:48:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lRAHD2dQC71qI+sdJjmGJW9ARXziUgn1C+t8q52zArg=; b=SeFNXrTbH/MryWh8
	7ZbjwBZhpX94sgDqC6K8dVQO3Tcg4gUnhIaMAplEBMu6uttCQ1rVAZBNM3+F4n8D
	FJYGknl5lf2C3oLzNddSWAhJ46UMJAcGgFWAeZPRssd3jpsFaI1SmoGd/sb020bv
	cuwIrHeWL12AmJUrr01nSsVCYbNJoekzK25zhVBWh9KGGj3vKgqyJJchjg+Jz9KV
	H2BIlz9rSaAs8FN6Jn3h8HmzquIKYjQZaiuwPa0k6JY7zZQVkbcU1EMoRCD6xocC
	TUs4/INOc9/+1QoQnAEpqt4N0eWfOA8tZWI7A6+ps7yRSepV3onCYDevmIhJ/npH
	Ylesew==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyr9ysb0g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 15:48:05 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-966caf13891so43510241.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 08:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782229685; x=1782834485; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lRAHD2dQC71qI+sdJjmGJW9ARXziUgn1C+t8q52zArg=;
        b=NddsDcRx4b+KWwuLTOmINm/2wjf3P7da/+gHnzncF9yfVFjbH9K/ekrmMeosxaHlX4
         Dlji0gQPERZJUwRPKj1p6ROmok8WXcqEi8p7OeHdk5ssbkqHnyzTB9KytBvdZpSchlY1
         BERNsZoYCudTxs/J9w1akJ6LJGOwY14yHxwr4lZyCRNgV2ukG4Gr54sg1xbKEO/Bqo9X
         77/0STSL0Z8uzF+l3nBeXwFPvVI35NXsOLoyf5M2QUgIvtNzb0KdrnxWHtxMMWGl0mNl
         vJshxN/9nErax/YFKVJnrO/2ABUDWVLwSmKhOlKXNsDHtyb6zt5WO3UHDn+EmraCPwFf
         ZOsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782229685; x=1782834485;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lRAHD2dQC71qI+sdJjmGJW9ARXziUgn1C+t8q52zArg=;
        b=syqOqgpocDZ1MlYhlja3RP/ZbeTDfDzhhip6xHGQHuvnoGyXIsMv6qyaryOSc68FOW
         rDz6gFhbMg5I5bZ9/LTiM3ThC6BWl8u4h0fnbQoTn8LTRD31RwoTunra0O1Qg4EZJgd7
         9wEhPzGIsR3JVPRovGIFTsMdfJqvSx8L7iVADAq+xFBkOEZAXENsMDEUxHJsLSEP8fnN
         nyz2E36PuNtJqZ0TlotO2m3FtCU33pjmFK+DK/F1C4BUx9ZvvFDRDrSoLYVkig5G7iiv
         8D2uKZBjsCWWeeYnZ2VOtedoeJ8UG8LlnY/WO5lUy7zoQyHPKu1jiZlmcfl0/8C85Rko
         hbdw==
X-Forwarded-Encrypted: i=1; AFNElJ/VN5JFVpquwQffBaPiQ/8egyHQS+HTCha2EwxY1p9WiOqTD94sCRnxEsF6GcP/nHC/IdC0sH7q7EUWG/Vd@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1+DyzdYh4LlCqDsmqZO/GJQC3DH7hheAE+1A7+wcKZfuwrGp6
	AE+wcFYFKrS5Lc7uEQJQGwdbEDDy5gE1tU6ifv1ZX6vmnUXl9OgxtrpWlRmqglSCDPwBrkTcZM4
	I9mhNGmhn6uevFuDKDXLVBwK2PWWiVhHb0nj85VbFqMmjb3ezvw9mJMJ0xN7r0RwXmHIM
X-Gm-Gg: AfdE7ckRP5nmSHKqpXYRhx+qU+6GcjcAHbXd5OLKXZiwUq5tWALlAA2fmEA4O+7Tp2E
	T30K/hKJziLKfcRf9v+NwGszvOxDN9s9ivaUmt9E+bczMUEJ7/xUEMpjZX9Y0wBxJ6tEKJGV3ps
	71vpkz5xdJJnGEKw6r6ISEizgMdQ63+uMZyn8EE1lDBoZePFaLAuPOH8afnPo1wTuL9TLQbj7Lg
	tM1eYmD8tLWoAqrWFX3PcALeImmkwP72ufr3hdeebaE67v/sK7giWbGGXNjSdPQ9ha90aGha1Qf
	0IpplRDqmnRsQvr9lJFwn3T1/n8SvbmNSSzntLylaWXcS7banyLGstd//0+/oRYLCqE2t36dkzD
	FeIiHMaA0DdW9oiLPMWjtU1kJRjupnRM//4c=
X-Received: by 2002:a05:6102:5246:b0:729:5cd5:8cc4 with SMTP id ada2fe7eead31-72b161702acmr3691511137.4.1782229685146;
        Tue, 23 Jun 2026 08:48:05 -0700 (PDT)
X-Received: by 2002:a05:6102:5246:b0:729:5cd5:8cc4 with SMTP id ada2fe7eead31-72b161702acmr3691503137.4.1782229684724;
        Tue, 23 Jun 2026 08:48:04 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6977be32083sm5011680a12.14.2026.06.23.08.48.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 08:48:03 -0700 (PDT)
Message-ID: <7948feb4-9eca-48f2-944e-ec982b6823dd@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 17:48:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/13] dt-bindings: sound: Add Qualcomm QAIF binding
To: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260605103739.3557573-1-harendra.gautam@oss.qualcomm.com>
 <20260605103739.3557573-3-harendra.gautam@oss.qualcomm.com>
 <3da8b668-1504-450e-bde2-b383d63090a8@oss.qualcomm.com>
 <CAC-tS8CuhED2dvne=cuTBUcrL93WXPjNB-nDUYHWNtFF9oVVjQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAC-tS8CuhED2dvne=cuTBUcrL93WXPjNB-nDUYHWNtFF9oVVjQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=JYSMa0KV c=1 sm=1 tr=0 ts=6a3aaab5 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=J2pCh71u1A4b4KVnFjsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: dXg73EkJPKu9C3BRrvjnpdKvCPhB0u-M
X-Proofpoint-ORIG-GUID: dXg73EkJPKu9C3BRrvjnpdKvCPhB0u-M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEyOSBTYWx0ZWRfX6p7DqgeQitD2
 xdskUH6T+j9QeVu1eO4NGEncMYz4k/UaYqrbTI51W1nh6kmTrUpwK1GgpGSvwy4P9ogeRgiZU1S
 /iwUJz7gXJitg7jKrZexfpX887Z2cydpCCYmeIroxR1dm8jC/3Gdaz3HNmdbtrR4FeISUpVgq9v
 5TX+qpF+BpbV9aVpwnbTOGZBx4FkGQ8EpabQnKvT12BwZH/SL8T4ep0Kacc3o9xYUkRofHcJQWe
 WH2sPhjMlsB1yBpoKv0ACnwO6RC0zbqDnqqnq47fz8l9cCtorD80GM1g9ACZEc0ch7Z+GJiYmi0
 jev0X4qX2TugjqT0wczvkbVt6msgeGIGNUrAwgCxcvjk2Uua1tig16onozuPC5zWKjI9RKDX04O
 FdwKdwxpyx4vprAEyvEAXWZnIk5jP72y9iE/g8I2996zO8kQLhS2SHSwc3cc04q+Rkk3B/whm3r
 Arscb1PMJNIkScWuIVA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEyOSBTYWx0ZWRfXy3UFXkAZOO4G
 e/ZZXM/OBCWtHbn30QpG7CR8PN1H4RuuJjYouLbo/HHGLlDrzQbL/V7062EYcbKH2X9WuqeQ55n
 azxZWxJr8wMDLvjYxkxeWdHFabfMx+U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230129
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-114237-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:harendra.gautam@oss.qualcomm.com,m:srini@kernel.org,m:broonie@kernel.org,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C0D206B86C1

On 6/23/26 2:26 PM, Harendra Gautam wrote:
> On Tue, Jun 9, 2026 at 3:27 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 6/5/26 12:37 PM, Harendra Gautam wrote:
>>> Add a Devicetree binding for the Qualcomm Audio Interface (QAIF) CPU DAI
>>> controller used on the Shikra audio platform.
>>>
>>> QAIF moves PCM data between system memory and external serial audio
>>> interfaces through the AIF path, and between memory and the internal Bolero
>>> digital codec through the CIF path. The controller needs a binding so
>>> platform Devicetree files can describe its MMIO region, DMA IOMMU stream,
>>> clocks, interrupt, DAI cells and per-interface AIF configuration.
>>>
>>> Describe the single register region, one EE interrupt, the required GCC
>>> LPASS and audio core clocks, the DMA IOMMU mapping, and 'aif-interface@N'
>>> child nodes used for static PCM, TDM or MI2S configuration.
>>>
>>> Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>> +  clock-names:
>>> +    items:
>>> +      - const: lpass_config_clk
>>> +      - const: lpass_core_axim_clk
>>> +      - const: aud_dma_clk
>>> +      - const: aud_dma_mem_clk
>>> +      - const: bus_clk
>>> +      - const: aif_if0_ebit_clk
>>> +      - const: aif_if0_ibit_clk
>>> +      - const: aif_if1_ebit_clk
>>> +      - const: aif_if1_ibit_clk
>>> +      - const: aif_if2_ebit_clk
>>> +      - const: aif_if2_ibit_clk
>>> +      - const: aif_if3_ebit_clk
>>> +      - const: aif_if3_ibit_clk
>>> +      - const: ext_mclka_clk
>>> +      - const: ext_mclkb_clk
>>
>> Drop the _clk suffix, we already know they are clocks, as they are
>> listed under the clocks property
> Okay, will correct.
>>
>> [...]
>>
>>> +      qcom,qaif-aif-sync-mode:
>>> +        $ref: /schemas/types.yaml#/definitions/uint32
>>> +        description:
>>> +          Sync mode. Use QAIF_AIF_SYNC_MODE_SHORT (0) for short (pulse)
>>> +          sync or QAIF_AIF_SYNC_MODE_LONG (1) for long (level) sync.
>>> +      qcom,qaif-aif-sync-src:
>>> +        $ref: /schemas/types.yaml#/definitions/uint32
>>> +        description:
>>> +          Sync source. Use QAIF_AIF_SYNC_SRC_SLAVE (0) for slave mode
>>> +          or QAIF_AIF_SYNC_SRC_MASTER (1) for master mode.
>>
>> Should these be boolean flags then?
> It should not be, the intention is to define explicitly, for better
> readability I can rename these flags as EXTERNAL/INTERNAL, Please
> suggest.

Are all 4 combinations of them being present/absent valid on shikra?

Konrad

