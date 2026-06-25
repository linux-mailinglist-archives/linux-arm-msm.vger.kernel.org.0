Return-Path: <linux-arm-msm+bounces-114457-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XMEKDZnaPGpvtQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114457-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 09:36:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2666C364F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 09:36:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=GSUGFZuS;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=BhsmMtc1;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114457-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114457-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 41F6F3029E55
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 07:36:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0C4037AA97;
	Thu, 25 Jun 2026 07:36:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7778B379C24
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 07:36:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782373014; cv=none; b=KNAAdF6gILEAf3AwtxmO9b3K6VuHfnUiol+tpDxR8owwwVFpiZsZ6aI0c8pNOgv8HVtZByCG3JSmfDMcbCHFC3aFNaqh15mrftK2ADJd/QolbgPSxWyvQTEDCd8b8f5zo535sZWhbsCDjkv2bZDv/nk+rgSAMdu5ZHSGxSbYHDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782373014; c=relaxed/simple;
	bh=a8LlYyp3Iz1nyWVPv0kBR79YykpbSiZ5HxSJbixBaIQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RAogm3c87qxjOtbGfw2nkl2u1RswHhx0Ka7HjlRoGVASB4IMjbQM/GXil/aob/Nt3WKsQYhsKtxQ1+LF51zJXL2MZEqU3TDwrAhk9iLLybLBE4PTdulsLxfbbfOpGAueBaFxpimMYeXSht+fHv1w9kSLsWAi6tUbenAFRZwL5YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GSUGFZuS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BhsmMtc1; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P3eEt4904482
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 07:36:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i/g2z6S4UyNyvA2VwtSLOaDO3I/HgkYGv9hdKRgZsBA=; b=GSUGFZuS6UZ4eWQ/
	WknD/a8T+dctpKkPDKJTOJTMNWn0T6gAlaSzlsl5MvIyb7S4y3TcFlOt8W/8tlQS
	i/eKln6AlUmI+eq4miihoRslJATBy0CCnofdcrs43u9UJezXkTzHHWRAR4sgec3D
	JyaXkeAr/XEYWKHt7DtBkGuFMDmlXtXxxXz+bA29P5AIZIcatR0Khyj3mcgrRwdp
	GziDPEUWRf7A8XdA5abU2j9jyROynrjtMuArClxnXRcTobWV9d25pZqPA+uVoD0G
	NQ7Y4Raso+zGblqO5z+ADBSHY/ZTz1YNqysAdGjCUIrjC7MMxl8+bbc5VtkcOYS3
	P16Zxg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0j7du6nf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 07:36:52 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c88da04b71dso1227659a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 00:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782373011; x=1782977811; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i/g2z6S4UyNyvA2VwtSLOaDO3I/HgkYGv9hdKRgZsBA=;
        b=BhsmMtc1w8It6V94STRybSCBLpHVrTZPhJQ7aPkqR85yDmQy/V4bGIJMt0X9q9o23z
         SPJxx5RMreCqn1vTEouelREirqVWq7ZWe4pjoC3uCQEoLNPzjxNXgvBOtF2t1grlX9rH
         /d6U4js7j5gaRKv3NJXNmU/cIIoP3ll9c5E7NxfbaTS74N7JH49lQx0wS2IyvUhwzHHJ
         AJ9L6M0LIDsjTalutMYB1j152K8luq0KimEyCezGpyLEJZPzpB7+pYUyT6I7o84NYG7f
         7LmjSkf4LRcwOVkWDDchYMQNJmzOxpAam06hMklTLvxctySQRNeG5+f3Qcuh6c0ue+Ra
         dR2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782373011; x=1782977811;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i/g2z6S4UyNyvA2VwtSLOaDO3I/HgkYGv9hdKRgZsBA=;
        b=Yo3ZMI5INdp53L/JGKxIBBwYOwbdRBtEex7WOyFwkyv86+xudcWVZ2QKeAw1DQOlYU
         0Vk8O4voAgGaMQtFnC2r889UA8qKgKk/VDnyDSUZlozBbQ6GrfiJ3/DmUkQp5xE1Bv9r
         +61fG7PutZ0/QXngKRbUsEK1TgmnWyojIRaTkCl8wB5wXNX4uuUXz+K/qM4HvwZ7icMd
         VUV8EusWYT/xyX3aOPp0uL59tgFemlG93aNmmgeu5JigR4jfRDIwvR9EtDxlfeYOfd3d
         MMdgP7e1SOvHHxidYCHlcdR9WTIf+o6dsp3ZNi827E7pC5nHAMDJXNtcVOejLe7ga0dm
         3DSg==
X-Forwarded-Encrypted: i=1; AFNElJ/k3osSM3oL900Uo+l50ny0tTYfhoLJo/yhLh6qrU7wGb+0IOlI6KDhf7tALL5BlqrBJh7kLx0ZmENbaF2q@vger.kernel.org
X-Gm-Message-State: AOJu0YwxUoYBllbjw/XZ96ifIfyBs+feJ4xOhRzkYDMhFlQIEx1WZ9dg
	uo7AoSlAf6/eDJyYUHtdk/Bx6sqKhNwF5DAxVPjBk63ciOyrY4HTIlazX8K7Ml8+ab+pz3Q0wLL
	lEkGYX7DEGElwt/cnOufX3lsDZwWaC0eSVoGVUw1taeJZ9KyWN7W/Efi4kA5mEesHjGug
X-Gm-Gg: AfdE7ckZ+MSvw5JdCsUXmAIsPBQ3/P+batlzooj/on+oWyqb3I6xjtKprd7dPnyoisn
	sl8B4/72HgI0nrDltr0ilAK0I1Hn8LM9aQl4JS4UrGHO8ytwS3at8EFS4Fa0lk+0LkSzhX6xT3A
	eiTwwcE8iSug83PSSlpISFG+wEGnSNV26Mfwu23batJeqHM8ytk9qcqXcmEKoPJN1FaopSp9oMi
	Dj7FngcERH8+w5+wXQhZRKUUGIHrfmOw528gl811ntT2tDsL9RvU0SpuNCYpbpiuO3QzJvtFySy
	h4UydKouHghn9jmTFCU+Tbx8yeTDipmYrLMAYQ0jd/Z/l+0nhgy7e9YABQJJZcLfqRZfIIrDmlt
	O7Oe7Zjh838IXBeVhOAzagLZE+zlKQcfhy0b4jh9nu80+y2zBqZpSvlEqQ5fqeSYLYfYiAVdFUw
	ul
X-Received: by 2002:a05:6a21:3991:b0:3b3:1a00:1f4a with SMTP id adf61e73a8af0-3bd4b01fc54mr1907837637.43.1782373011208;
        Thu, 25 Jun 2026 00:36:51 -0700 (PDT)
X-Received: by 2002:a05:6a21:3991:b0:3b3:1a00:1f4a with SMTP id adf61e73a8af0-3bd4b01fc54mr1907800637.43.1782373010634;
        Thu, 25 Jun 2026 00:36:50 -0700 (PDT)
Received: from [10.133.33.237] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c92b9dc216csm1180072a12.9.2026.06.25.00.36.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 00:36:50 -0700 (PDT)
Message-ID: <e7fa9d40-8efc-4b1f-97ed-cd1e98ffdd2c@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 15:36:42 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: qcom,coresight-tnoc: allow
 arm,primecell-periphid
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
References: <20260624-fix-tracenoc-probe-issue-v2-0-786520f62f21@oss.qualcomm.com>
 <20260624-fix-tracenoc-probe-issue-v2-1-786520f62f21@oss.qualcomm.com>
 <20260625-strong-daft-pudu-21471f@quoll>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260625-strong-daft-pudu-21471f@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: nzamkmYunXB-m6DTcFuEDIacn1lZOay5
X-Authority-Analysis: v=2.4 cv=NvHhtcdJ c=1 sm=1 tr=0 ts=6a3cda94 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=6mFE72AEMYK6sz6dviEA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA2NCBTYWx0ZWRfX7l4CoXMj2ylf
 pPgZd7Q/jvtFSusLxSgTjdk4p4vL4FvdVnoROcWEW/rWHaweTpSb9LbpxHuGqs+O8MXX3FbfJhF
 sDZqdZrOUVUk9+78sRvXH86asRcVjBk=
X-Proofpoint-ORIG-GUID: nzamkmYunXB-m6DTcFuEDIacn1lZOay5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA2NCBTYWx0ZWRfX65cQZe2991M5
 zpVitmMsgYIwzdZ92iBiqAj3IqMXeYWCg7SQyPhncBxxrUyg4YQQ6HSxcBJa0YeynIDlTBM8beO
 pMZSR/pwu5T7RQM3lkfkuhDQclC1QT1xC7RkHwIytjiITlKVYYnY2sybRsV+l+LjFakx2M2MEtN
 XPvGcmZxWO5PBaUDuV0FE5mWToUav+Jzl14VPBB+tG2LiIyrZAbqENCYbKPi3bphMPG7hwWTcMD
 9HPK6pYAjco7gK3GbPLptIRmsNIHbmmzVUT1oRUrFPzayXhgTYuUT0hDyPY6zPDjLrL1SgHCVnl
 x+8LUGb4LQv/kWNvsQ05X1oB6NSk07UfZSBBZmegPEZTJmJZ2RrWigseN66AMJibwsIFF2eMGCU
 8kc1SSobnr06PfvmmoCPWwcjcxcEe4MbPEHzrt1PzFhSKU0EKjWhjwhV2+EDQBvaLQHRQ3LCt1S
 CUxMME0uuAhuo40FiYA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0
 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250064
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114457-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:jingyi.wang@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:suzuki.poulose@arm.com,m:mike.leach@arm.com,m:james.clark@linaro.org,m:leo.yan@arm.com,m:yuanfang.zhang@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7A2666C364F



On 6/25/2026 3:24 PM, Krzysztof Kozlowski wrote:
> On Wed, Jun 24, 2026 at 05:49:25PM +0800, Jie Gan wrote:
>> The TNOC device is an AMBA primecell and may carry the standard
>> arm,primecell-periphid property, which is used to supply the
>> peripheral ID when it cannot be read from the device registers.
>>
>> Reference primecell.yaml and set additionalProperties to true so the
>> binding accepts arm,primecell-periphid along with the other common
>> primecell properties.
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
>> index ef648a15b806..9624fc0adfdc 100644
>> --- a/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
>> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
>> @@ -32,6 +32,9 @@ select:
>>     required:
>>       - compatible
>>   
>> +allOf:
>> +  - $ref: /schemas/arm/primecell.yaml#
>> +
>>   properties:
>>     $nodename:
>>       pattern: "^tn(@[0-9a-f]+)$"
>> @@ -78,7 +81,7 @@ required:
>>     - in-ports
>>     - out-ports
>>   
>> -additionalProperties: false
>> +additionalProperties: true
> 
> Nope, it is not allowed. Explicitly mentioned in writing bindings and
> all DT introductory talks by me.

Yes, I am totally wrong with this and I should add:
unevaluatedProperties: false

and remove
additionalProperties: false

Thanks,
Jie

> 
> Best regards,
> Krzysztof
> 


