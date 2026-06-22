Return-Path: <linux-arm-msm+bounces-114040-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xeNYH1VROWoYqgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114040-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 17:14:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 10AAF6B0A19
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 17:14:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=R7n+Ofjw;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XLb2+fDP;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114040-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114040-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 36B65302D5F9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 15:11:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 005B5331230;
	Mon, 22 Jun 2026 15:11:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6560330B15
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 15:11:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782141091; cv=none; b=qd+24bnDynIB+wwTalX4LS8NNDKYEbEZkUdyq33hlHv7JtnEta1dXoqLBuyQVkWKfSMVOlhJx6gAu0hYqbPL9gHh+oKWfoZgjmZbNHnbFDGIYW/T2GuQF1GkYJpj6gCFnh2x2XtCignKVZmYxNbK5Djx/V893MsUblwbHsDUIfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782141091; c=relaxed/simple;
	bh=5TOax/FcPl473BwB62zs13y+Z4q1fMt0Z6E3J+ZzaMI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SzJefohAoSKQC7m7tcd5issBN64juKwJ78IEIPZ20RbNT14eS6HY5shhgoN/i2HIQf73XRirthcm86pMbCe5bgVMUJ/DXSO/S2MIGYC4nx4/wd4v7q9zfVWEldJF0aySG/vFjK2NCin4hqTGSUaSLgsFghUoGN0/XzeZhVyGbK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R7n+Ofjw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XLb2+fDP; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MDFlTB3533387
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 15:11:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	htKbuZhzlRPYjkFPiuqoTZ0KiMQ3XGNYDjU5yi/M/b4=; b=R7n+OfjwHVa3wUO1
	iJRAda8FuWuXwd4sQBZNFVfQzd/ZpG3qF1h2Xu+rjm2w9mQupT6yG0rMx5YdnZP9
	osBJjTdkZN6h6nXz9ANeLBzZ64YLXDvdEdr4APPWC/mKjbFZ2emR+C7AxbORgVie
	0Be6zez7KfXdYIrNObUHaPiWOufDhQhkNJYb8ePxA5bCWfQVRta6XMubIRF+W2GB
	u8N1ET6Mlk1fSelnzJy0po/KG6XqAWjjG/Yadz9KiGzO1h3L22DM79IGfyWxiFG8
	j6iJU+Txx7dMA3+hDoS4OnidkO4qD1YWoH1w+LJUJ42pA+VsG9VP8nj0e3Nnn6JJ
	GrvCig==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey2yhs27w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 15:11:29 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8422ca754d8so3264051b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 08:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782141088; x=1782745888; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=htKbuZhzlRPYjkFPiuqoTZ0KiMQ3XGNYDjU5yi/M/b4=;
        b=XLb2+fDPCyFAj5nkwM7P0yP2k186wBxbC3PsnfRW1HycUr8gHXdjcRjgsKtq+gHpE2
         snT3GKlnNK0uZ+E/3gk57eQZUn/Tl0MtOlFYyyos0gLgsmki5KE32nz6ppJWWrfRrPSf
         7ZjKSA5HU7AJ6KQRmtV6FlefnY/Li8Ga/C/omkJ7jPbJwK2T90Uw3V5Dr/ZuLsW5SmEa
         vt8Sf6xAiG97yq6GMtS99Nz3l53yB/zddJXREiEPTn7lvcgptLhTlvjitGiF3+WST4RZ
         2GxWCG85CMVuWz8xD0G77G7vaM6PBLkPgnRESjXapHyoC0z2KABuPLExJmSIqDSMdf8g
         1FEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782141088; x=1782745888;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=htKbuZhzlRPYjkFPiuqoTZ0KiMQ3XGNYDjU5yi/M/b4=;
        b=FelwnljSqoAn/KSYbaacXXXYn/1EFgSgMFAlEoOalWEVgIy7RWOZfVtSsRW81SfYRJ
         KJ59i89vc2+JTHmaNxx8EWkefXcLh76TvPElhEH+2Ay3ZmeN5ifbjKyWeUa1eFP+0oNu
         VGpYlq7yDYhgHC11XlLQmVjkGsbslDCrbGKSOYHRsOk9wY3w52oDF+HONr+k4vCDm0U1
         K/PoGHMveAoxj7rpBpXs2Wuse5SG73owe5mzbIXe6rhh0oitFlT/M4YZAcgb9A9J2Bwl
         9kwi50dMfgIw301S+py8bbh8dw3pKtE0IGOx8s33iF9lADSHkoFSZ3dXiB8bXz97yqtj
         9Arw==
X-Forwarded-Encrypted: i=1; AFNElJ8ccQ+kGaiUblWjmCs+xt1oR3tMmBPSXEnUwOpgGOzI452nrcLws4NRTVdy2x2xXgW7fynReEcnYLNUnFi3@vger.kernel.org
X-Gm-Message-State: AOJu0YxaYAmJE1LuCYGV04bJ46DeSeaLi+64Og86R2vK27jewP3QIvmo
	DMd7xsbv0avH+hJXNga1Kv1iwX0Zeg22xcSk2+lEb/HKW02ExR99SPQfj7UUP9B46X1ecvYlgOh
	YKLX6Mv8yI7/SeAH4fYL1/tHEdD7fftWsKJq3j7epuf2PTtRjKPmcAofDOSEKwgXxmA47
X-Gm-Gg: AfdE7ckod003ya0BglV/bLvzV/enZDyAO7Od0O52qKdBpUQi3JHOyqlQsU3OTmsdMRe
	csQ4qwbUsy7suHthYA2+44pDrKBn3GxSiSmkH5j3PBnDEw6I7cdN8fFVqgRtG6fkH9SAmb2Uhd3
	wzOkvfAlKuI5Z38bFpkHhScALc3C++tH7chvnDQu5Q1Fw2lWERLxqPFQ1XHmp7AbC2NwoPKiATI
	C86dpSNGPLesFqFMq2CM038iGbCgrWzWUpip6u/CaotuvIWPErGkZJLhiQJ3YUEotZYuMbsnGfi
	DI/PecOfYVGjEHl0H3PeYx79snrCxNkiwN8YWqn8X7MXU02FQ/LFp+1Zw+6FYDyJUZTAw7wW3qA
	5QXexGh6UDgzOg7CgrOlzZoQvrCa1YmqrMrK0SLPTev4=
X-Received: by 2002:a05:6a00:1745:b0:83f:2568:d466 with SMTP id d2e1a72fcca58-8456255d210mr11000509b3a.31.1782141088461;
        Mon, 22 Jun 2026 08:11:28 -0700 (PDT)
X-Received: by 2002:a05:6a00:1745:b0:83f:2568:d466 with SMTP id d2e1a72fcca58-8456255d210mr11000469b3a.31.1782141087893;
        Mon, 22 Jun 2026 08:11:27 -0700 (PDT)
Received: from [192.168.2.2] ([49.204.16.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564eca7fcsm7906357b3a.52.2026.06.22.08.11.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 08:11:27 -0700 (PDT)
Message-ID: <83a3fc03-f873-4bba-90a6-d8147ab64710@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 20:41:20 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: power: limits: Describe Qualcomm SPEL
 hardware
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
References: <20260620-qcom_spel_driver_upstream-v2-0-a3ee6837c18f@oss.qualcomm.com>
 <20260620-qcom_spel_driver_upstream-v2-1-a3ee6837c18f@oss.qualcomm.com>
 <50d92653-b403-402d-af82-a037114c3aab@oss.qualcomm.com>
Content-Language: en-US
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
In-Reply-To: <50d92653-b403-402d-af82-a037114c3aab@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDE1MCBTYWx0ZWRfX72saKhhSvpiO
 b8V9DPk41GNlVDDWDw0Pfw8zUn0yybAwsxfi+P+tRIbDjiQwFuboqGPkOyndXganzG/1Iqujf72
 1avR8obZWXfzXshlic0A+d/2YslfBAI=
X-Proofpoint-ORIG-GUID: ytkQLnGa1DTj-FhERYOwayng6Cd6znLZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDE1MCBTYWx0ZWRfX3xy2hbLV3z3M
 jPBIyAj+WEmiqq+j2XN+gf+vAzGW6FuggDru1og3rquW6npHFlZ7bkbUc6rx9u3S++XP2NAPecq
 iqv/VN8PVYkO1RkpPj3XhwTy1dhtbUm5u8mFygVgqRnGlFAgIaEEznwUM3yrACMZnJmsAkqVCr+
 Z5Wf0Q2cIV8kLD8a7r0B6Sn0706SE6ClXUPcBJON+l7qKydBv0J1iPRhAMvijWflEs8fneNG/68
 BECOhvxHVDOYBdTlNzJwPpOPuIq4Fh8bith6XEhG5terGLa0N4jQLy29he+Qeemb+J2t1/Valsd
 rRAuOFqxY7eNbHS0ArUBiGwOEevGShWlC1X0lsBbbZwqQTwRGxBL8d7zv1uK5bZFhAylMFxrrh7
 XecUklb5tj6PM3AyGi4DwULw6TLvKpHp6nLC4w/OjZ6GKkw2PNJLpvW2TCaAeG4Ha1XZtdqIFCG
 hgF7NKxOxHhrBJsrqeQ==
X-Proofpoint-GUID: ytkQLnGa1DTj-FhERYOwayng6Cd6znLZ
X-Authority-Analysis: v=2.4 cv=cKbQdFeN c=1 sm=1 tr=0 ts=6a3950a1 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=V0wrQAR20Q1u/UIyJlYVXA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=ZBGX7F9o7YTsjpKyWPIA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606220150
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114040-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rafael@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:daniel.lezcano@oss.qualcomm.com,m:gaurav.kohli@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[manaf.pallikunhi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,devicetree.org:url,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manaf.pallikunhi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 10AAF6B0A19

Hi Konrad,


On 6/22/2026 4:32 PM, Konrad Dybcio wrote:
> On 6/19/26 10:39 PM, Manaf Meethalavalappu Pallikunhi wrote:
>> The Qualcomm SoC Power and Electrical Limits (SPEL) provides hardware
>> based power monitoring and limiting capabilities for various domains.
>>
>> Add a DeviceTree binding to describe the SPEL block on Qualcomm's SoC.
>>
>> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>> ---
>>   .../bindings/power/limits/qcom,spel.yaml           | 47 ++++++++++++++++++++++
>>   MAINTAINERS                                        |  6 +++
>>   2 files changed, 53 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/power/limits/qcom,spel.yaml b/Documentation/devicetree/bindings/power/limits/qcom,spel.yaml
>> new file mode 100644
>> index 000000000000..4c6e6cbfbfe4
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/power/limits/qcom,spel.yaml
>> @@ -0,0 +1,47 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/power/limits/qcom,spel.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm SoC Power and Electrical Limits (SPEL)
>> +
>> +maintainers:
>> +  - Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>> +
>> +description:
>> +  The Qualcomm SPEL (SoC Power and Electrical Limits) provides hardware-based
>> +  power monitoring and limiting capabilities for various power domains in
>> +  Qualcomm SoCs.
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,glymur-spel
>> +
>> +  reg:
>> +    maxItems: 3
>> +
>> +  reg-names:
>> +    items:
>> +      - const: config
>> +      - const: constraints
>> +      - const: nodes
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - reg-names
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    power-limits@ef3b000 {
>> +        compatible = "qcom,glymur-spel";
>> +        reg = <0x0ef3b000 0x1000>,
>> +              <0x0ef3d000 0x1000>,
> 
> Don't we need the range inbetween these two (base=0xef3c000)?
>

No, it is consumed by firmware.

Thanks,
Manaf
> Konrad


