Return-Path: <linux-arm-msm+bounces-113177-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EZN4FIP1L2o8KAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113177-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 14:52:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A280686690
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 14:52:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=puuLkSRZ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=O+IiuNUW;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113177-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113177-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D56A130FEA2C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 12:40:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEB7C3F1AD5;
	Mon, 15 Jun 2026 12:38:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10D53F0A8C
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 12:38:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781527082; cv=none; b=F2E72ZLYQpvd9+SI+HLd7+MijlOsBw03PWj0DDXktOus59nh4lCZzeNuURYbp9ToXqHeR9eB9pV7KVV0AyICh0hO1XIFYFhzJMs8orFhSmZL/P1RDDU3KE/i1bzzJ/3Cz7r/rU6Kbb93go59sfkf6IfAwVCVLcoEFr1D7ISX5oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781527082; c=relaxed/simple;
	bh=shm6+/batjeGGoSvU/eroLSTAR66/jZMHoh9s93je3E=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=RhxSXQdiribSQNGJfZExGJ8U5JfsHqa2olzi8eiI/rqHe7Z6+uRjIFO4Q0kqX46o6yctKjDTr8KoozvMCKOjwdhMGaihnP4ZJXO2BitwfR2I5ATP7ZCSQyMHlQ5fRj1fJygQyc0q3WHEU+cQwAH4lMS1UVZ5/pTzgIxGxWoyBa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=puuLkSRZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O+IiuNUW; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FCaucO366583
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 12:37:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7qS3qUEtztPgmxfbaeaqpV7S1LQRALWWl/ZUML3/0rk=; b=puuLkSRZv3e9ztMB
	BH+vmD6//mTiQRCJMltHoLzFNdxUk7qDL73GclbN/ffeQ1U+BdqPBi2fEkuvv6/n
	OTwOhvdBgh9s2slP63SVvYmnDvzLwoHpQ3w6iMJqNv+jrDg77Rbd8LQPetRuGmPy
	672ePlTEiAbC3ndyOzvOxLhSwthelpQZCPiC+3u2v9l1rcDPuQI1lU4TmulDsGjS
	CPK3/in5yDusw3HFK4AahQSBC6lFI9zDlixQlV5vqjssBVb4QphWuGBt0RE/xZMq
	EQQSiamyTgVLeKW6ZfBcQ6nUB1S+gcPh8U7s9/wpV0TJ51fzqIONtjbRw1le1/Pc
	fLi7KQ==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etevx0n9r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 12:37:59 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-7dbe4c01345so58009387b3.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 05:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781527079; x=1782131879; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7qS3qUEtztPgmxfbaeaqpV7S1LQRALWWl/ZUML3/0rk=;
        b=O+IiuNUWK1G72jMU/6ZCDWVozkeT+ScqSjLdqAuT1pdylsSwswVZsZoJJBtI18/qrm
         qESftYud74BmJWYSJ/0Mmt49ffK68aza9OPC3dme6i0TSR8do8L0T0c9S1vOaSEf2a3b
         effnYJq970ih2a9y4DEUfPv8o6s5tobshkNFvZD5LIgnwhD2+Pgc9xhNpNsd1OLv4P93
         pru+BhgagbGsuZou2gsi36k/tQbUDhV7vaWJ9pfC4LPHWAhpEyX0+WHlMCQKWJC8191e
         LYSXeUlaDKJmc1vjalsG9EPr2MWzm+zP6ipojSGdhfd+0fmfkjh99Ah/XuAb3tTgTQ1M
         AeoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781527079; x=1782131879;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7qS3qUEtztPgmxfbaeaqpV7S1LQRALWWl/ZUML3/0rk=;
        b=RoEPphMya2Fn/EDXRNL841HbipBqHzZ+JbAVPywAcJ5pwxFIMOTbkZGzcgKYd52iN9
         Ca8ZvexqBunD/qUqrpJDd11sPEU37AIxmXSCKg/gME1O86n0/U0XlKabrqj/nYlNkKBz
         YbvKtX0oW+h9NxTO3uI9papBq3mjXmLa/umZVYRxHGWDojnzxjzajvBNZGRd6Tvn1C5K
         2pla+7mrdzC+npwxIUCfRz1Bqd0grAoDZUTOjcb+VLs9ZtjzC97uRmn7LxOIP8p04tAE
         ukgbaerVsyK7DUR7dRJwZsdqg/F2WZ/zI3gJCg36ARlQcjJXa74GyEXCpQuTFDEiuB4F
         01oA==
X-Forwarded-Encrypted: i=1; AFNElJ+kZmYTW7uwP2/uK5wUgTvcJ6R/sfvDSd/DZ1bJ1riVlSvt4dir07tFP0rqsteGrdBrfXrlWNY1FvCjeGtA@vger.kernel.org
X-Gm-Message-State: AOJu0Yzzx9ncr5A2x59WV5PO/Afv7jGzkO+D5okruoTH01X9wjs9SK2z
	5eiOfPBVr3F4jR3jk629mu4/herACnlEhZfcUU08e7fOnzO2/04vo+wN+J/U/aaFeyNB809Bi5a
	R6tw93Tnv/zps7KpqFa4BsKAuRIG2YKVTNof0K9Gr5z5oGBOMYWodQFgDGQSGTY7c9caG
X-Gm-Gg: Acq92OHCFpC5XfhwKkV1XYPTOrRAI1iBMAfbj/uKp090MNMjYnM7Sjmc97bJ8yA+cGl
	/vsRbFmoyuupFWGBoNjk7z1VVlc0+BwG7jiErBSZQs77Vw20tDFZ8Sihkthwj0zWiHdbbwUwG18
	vhSwUaIiuefsqvxWj/gQibew3LC8u1MyZtKXcjzLkExpYUbF3ZEYxe9Hs1fs9tnuv4qYjanYPoQ
	n98Vl72/q+1OvUB0toqMVgDe9FxcCv/DwuRqnqzmh1eof7DNgt3N6e/wd8GyB0CPeMiuDUSRHmY
	Fl2MODpB+U4MmXHzaWsnY7mixchkj59AYfbNKboVkQvbUdI4/9gBep1Td0Cf9kvYM/ePf62R7jM
	ab9Sy8mA9eQOHbl5TJ8ja0SCy0vBW1mbI6MYNJJXedd1YFe8xrg81Cqf/omK3
X-Received: by 2002:a05:690c:3a0:b0:7db:d527:b8c5 with SMTP id 00721157ae682-7f797da207amr127680437b3.16.1781527079254;
        Mon, 15 Jun 2026 05:37:59 -0700 (PDT)
X-Received: by 2002:a05:690c:3a0:b0:7db:d527:b8c5 with SMTP id 00721157ae682-7f797da207amr127680107b3.16.1781527078865;
        Mon, 15 Jun 2026 05:37:58 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7f76e2b5564sm46351087b3.6.2026.06.15.05.37.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 05:37:58 -0700 (PDT)
Message-ID: <dde8920a-40a1-498e-a7f7-a6e3b225d725@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 18:07:50 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: soundwire: qcom: add
 qcom,swr-master-ee-val property
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Rao Mandadapu <quic_srivasam@quicinc.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
References: <20260608175345.3118060-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260608175345.3118060-2-mohammad.rafi.shaik@oss.qualcomm.com>
 <66c097e8-8b5f-4b78-910d-799bc0a488b0@kernel.org>
Content-Language: en-US
In-Reply-To: <66c097e8-8b5f-4b78-910d-799bc0a488b0@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: aqNOJhHd1ln2pdms1ZLHsVhupN796iDn
X-Proofpoint-GUID: aqNOJhHd1ln2pdms1ZLHsVhupN796iDn
X-Authority-Analysis: v=2.4 cv=f8t4wuyM c=1 sm=1 tr=0 ts=6a2ff227 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=7Kj_pnbzCi8ss0lAJesA:9 a=QEXdDO2ut3YA:10
 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDEzMyBTYWx0ZWRfXxQzvOt4qGw6E
 gaQpXH1JlGZRB0t91SK5/hJUmdi9Vg5KxY7y6p0g53jKP/J3pBzJSFFE45+QasIoFzKNp+aff8c
 IaGEJOboyyhkFhByyUDnViE89VoE28A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDEzMyBTYWx0ZWRfXwegcQHBOL/mz
 sOP1DtichKR5sRSvqVsNHcsG/KBr7sjuV4Tl+GVRZdOwe8O87IccSvkWxTInMLTJz1E/pRl4j+P
 F0YXCtsROIpO0RAXCqpcS74C+j5aTPlu7MjtQsoXwF+xu6AfVSTXvwBtODuxPyNPoa5qgK2YaEe
 jcogQ9MS3B6mLtjTpQdNjC7xDF9txL2uG7MvXQkgwfFawMWACd+f012+oKqe8tA67SxVsgBC/hz
 Z8eKyzN6+6t0HhYZxQr3VK5CrgUfyYcCIJlIzkNcMHpPvOyEw41XFdLPR8+unqmzCyDJQuimg8t
 vHewTx+LvBBp5kLWNx08k2+EG0+6/vh8LWTw+zupPIuTx9vDb7Q5UWuyt5Sg98zhC7Zw1wqdt3F
 LGWmLN0S9St6Pjxozmb+YZ71w/CNo7beDMr0NuBqtmAksgDqIdTEqIDLzmbLlyDGMvyd3EfKCQ/
 Q2dW/8BukpcCL9d6bnQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_03,2026-06-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 clxscore=1015 spamscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150133
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113177-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:srini@kernel.org,m:vkoul@kernel.org,m:yung-chuan.liao@linux.intel.com,m:quic_srivasam@quicinc.com,m:pierre-louis.bossart@linux.dev,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-sound@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4A280686690



On 6/9/2026 1:16 AM, Krzysztof Kozlowski wrote:
> On 08/06/2026 19:53, Mohammad Rafi Shaik wrote:
>> Add documentation for the qcom,swr-master-ee-val Device Tree property
>> used by Qualcomm SoundWire masters to describe the execution-environment
>> value for interrupt routing.
>>
>> This property allows platform DTs to specify the EE value used to direct
> 
> Please describe more what this EE value is for.
> 

sure, will add more description what this EE value and why we need this.

>> SoundWire master interrupts to the appropriate CPU target.
> 
> Interrupt affinity defines where the interrupts are routed. Not custom
> properties.
> 

Yes, I noticed a recent change in the SoC Device Tree where a fourth 
cell (Interrupt Affinity / Target CPU Mask) has been added.

interrupts = <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH 0>;

I will try using the same configuration and verify the behavior.


>>
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/soundwire/qcom,soundwire.yaml       | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
>> index 9447a2f37..5b06cc1a5 100644
>> --- a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
>> +++ b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
>> @@ -215,6 +215,12 @@ properties:
>>             maximum: 4
>>           - const: 0xff
>>   
>> +  qcom,swr-master-ee-val:
> 
> Aren't there existing properties for execution context? I think Qualcomm
> has something, so you should not come with a new property. Assuming this
> stays in the first place...
> 

Thanks for pointing out.

i see "qcom,ee" already exist in qcom,spmi-pmic-arb-common.yaml.

will use same.

> 
>> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> 
> Missing constraints.
> 

Ack, will fix in next version.

Thanks & regards,
Rafi.

>> +    description:
>> +      Execution-environment value used to route SoundWire master
>> +      interrupts to CPU0 or CPU1.
>> +
>>     label:
>>       maxItems: 1
>>   
> 
> 
> Best regards,
> Krzysztof


