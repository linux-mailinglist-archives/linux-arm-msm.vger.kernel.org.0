Return-Path: <linux-arm-msm+bounces-100672-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mNj3Cisdymmu5QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100672-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 08:50:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id AF00F35613A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 08:50:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BCE3E3004DD1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 06:50:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F1201A6836;
	Mon, 30 Mar 2026 06:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k90y3EVZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RXxHuo46"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996EF396596
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 06:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774853416; cv=none; b=IbTZFgTVOw7X2dHDrzZUhcQuPE7Pi8jWXqbKgf/RZuT3YsHpI6eqw+OcoKVk3B1/8jESXamTBhqducZY+bleUb+7gqTtVsi4ytjH/5Y5gwaIEZv1xbADDlTnArS4AqcCGHLk/SeFFg/QYJQwEAoxmZ7CoV6b2O7RkcMu9B3us54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774853416; c=relaxed/simple;
	bh=je6osE2miB0U5fNQUle/gyUsHF8QHGaoopvitfw3pDI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rt6RYAPpvbR5uhMkEy+dp3Au0kSu8RRYNxBdaf0ZKY5DPjPgB6vYS2aAtkYaHFFA+0H+eu8xmB0MXgjRX0dsXdCjJ6Y4CgP1+oiIIiHjLXEnd3FGPipfu1tLG+hX2mCQn3ThChD7pWRqEmupkpQK/iJIYiclKDqJDM+Z6LZ5zaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k90y3EVZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RXxHuo46; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62TNdZGe332215
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 06:50:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n8EzE5ONVAec5XrV//KBWMuylVYq1TDy1dmOy2l/5uE=; b=k90y3EVZTYdm7rKs
	KzwjtwXk17gkGy7VI5GG36G2JC2x81EF+92em8EN6w7oNAqdaMRLOVzOeJI+UnZa
	56mcdaf2EdxWtgM2HZHcZbwfWEgKQWhwzorOo/5POWWJIcQaNuvtnQqn0WnE6ky+
	VXITVfJZtx8DCL/pDaxqmxjiGlTnyem5nCN3kb8atEbEDV4RXrkEDyXIKz5jdaEO
	jCpbynL4vOroGGJUuaDg6h1b9UUbsdGxZM1Se8IWYbqHXAzKTWFaYmU6Jf5Lup38
	v0Bx08Sgks8B8BgBnHGZuwj1UezdwHoOfxKjliMM3kgBi2Pw24gMg2AuvEAv2PF0
	58Vprg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6wqejqvs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 06:50:11 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b23eb4f94fso12495805ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 23:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774853411; x=1775458211; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n8EzE5ONVAec5XrV//KBWMuylVYq1TDy1dmOy2l/5uE=;
        b=RXxHuo46daNGT7GY+8Yvct6JesLqA1hMLHitFeMHUq4Qml9eYi//ti1SvFu2t7pS59
         yrX4oQPIN8NKdqi1mWzlZJLeLwboLduz2IYkMsNCLlxOCaDNM4Bo0UTFHZlpe/Zm6ERj
         jpFD1ph7OGsFv/JbWKzG0HwoIpWqwhbEwgU4A25tPgxLNrPCL0KtKe5Mieyf8Fhw/9yR
         l8EWsz8JFOnc8m+iPa1KnCDZTFKerGgbLQI3ezbMcpMdzElFP0vfS1tA8oreikUnOXEh
         +o9koj2ikQ5XpCx8v23DfjvbzCSLK7lgbYzXqdfiVlrqbGqtrmAghHrI+1cfwQRl6PBv
         PPbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774853411; x=1775458211;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n8EzE5ONVAec5XrV//KBWMuylVYq1TDy1dmOy2l/5uE=;
        b=Iri4QgXyJbHKFZ/ZtrD+8Vv1nO2uEhZ7owE5HQax0rgneyS5nfjTwIZLiGNlKm1Z4T
         Q9C7EfLx4Ykm+EI0upnvMg9Uy7NldQptjw91iQfAtxZQljNqGHe26x94Ktl6YbQfhPvg
         9tjN8IGtriRO+jFheNpLcIo8MVTSo5CFBW2kOHcM2ldxFNl5eHtKIczw4Uo1BhQrGESw
         p1qSn3bUpGajzlE0B9x/bkqLlNa8LhN5f4FdlckwWQk/1/1pcvIQ9Yn2KNUtAiE3HYQJ
         yrocibGYT9bcTCh9ZyNU1RnV4yFm65P9NYxE5McBmn1TLxKbNx1xJQEq6SH5vOyKKpWf
         VLkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQIemO++KigUWT6IvSmpKbW54UlQVezhSnxyIJTVbKAs8iBVe34nDKrAycpog6HQM+AoaRe4dU8bM1n8/s@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+a8BVqM1782/hLPAqx1tm5SfORzPzZkUeRVgjUZtDGrRuOeyj
	kV50X2FQ5ugDRCGtOM+DdXcLm6D4Lg4pAQ8/WkPocyDdRFJ/6UycJ/uRZpmHg4aZuhokpL1swwW
	YXIEpXHdNVHyHzN58xx2CjT2wlIC4nuk1El+cmV0oPzFrvBREp4/g00e/HT07LQAQ+uEV
X-Gm-Gg: ATEYQzztp3wQ4apfZpfYWaePg5PUo+EPZntKDOfd5LhOw9JRyyoKebYzk01WuHDt+GO
	F2ag5L6uFx4FRjgMjZwpDJ9rjeTNtVcM/PBxB779HD/qgLajyXOapP8j48jQSL9zaoNWMyarsaA
	oQSZz6TzPn7VAW3WTeEY0daJ3aoGMIldyme01FWiLhJ5GJpfTqlHQQnERrmktCnEzR02f9rniUb
	ZpKgbCkqAMe9XZiKx7Ak7/E4AHVch+ROJr73UesQMIV7qeXqMtKdQr2oZBCjYT6WIUOcuhWWQGk
	1jn26xeZGCHFPp/FzWGtJJsoWiA9nppDelKKdu3mbbeT2cBPD+OFHGxUjC3n28uClhgrbVXPyys
	AwYwn5QL7gTriaA7r7BiOUdIl9XpUzxpiPLj70mKphWQDD9xzMg==
X-Received: by 2002:a17:902:d4c5:b0:2ae:54b2:27d9 with SMTP id d9443c01a7336-2b0cdcfb268mr73421505ad.7.1774853410955;
        Sun, 29 Mar 2026 23:50:10 -0700 (PDT)
X-Received: by 2002:a17:902:d4c5:b0:2ae:54b2:27d9 with SMTP id d9443c01a7336-2b0cdcfb268mr73421295ad.7.1774853410461;
        Sun, 29 Mar 2026 23:50:10 -0700 (PDT)
Received: from [10.218.41.33] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24264224esm69967945ad.15.2026.03.29.23.50.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Mar 2026 23:50:10 -0700 (PDT)
Message-ID: <f7e63fa7-2579-4dce-974a-8c81a1aee00f@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 12:20:05 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: Add monaco-evk-ac-sku support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260328-monaco-evk-ac-sku-v1-0-79d166fa5571@oss.qualcomm.com>
 <20260328-monaco-evk-ac-sku-v1-1-79d166fa5571@oss.qualcomm.com>
 <20260329-accelerated-pigeon-of-joy-c6c903@quoll>
Content-Language: en-US
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
In-Reply-To: <20260329-accelerated-pigeon-of-joy-c6c903@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Jo78bc4C c=1 sm=1 tr=0 ts=69ca1d23 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=Shnu4zvgYbmvQT2Ik1EA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: B57Y0KcjToyzZdGk8cldcPD0OqzSvqJg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA1MiBTYWx0ZWRfXzRXT96XVZcyB
 iLUY/MvqFWTaFyVFI+z7vgir5frHRz+O4oTEGcfx1yNVaqByxvYeJvf7Ks6tDr2lAZTAhCE33gd
 fIm0bg9tGmcS+NLi8b7NuabdBb9keDDDQfOvWHOjm+Y01j5ITik3VilOZ/FEKQ0tNyy3Rnu/Jf/
 LlKtHVTbccuipYCtjblKZF7+SbAiNJFQkQNL4jZmKEWfyKaN+8IOEqPoxQoDlIjD2VhNCXOF+i8
 hW5W08IGgKMyNK2jdtcLeBLsVHfAIsI/MXIA71vSaog9dYgJqAxGHy2TAM1WdSmLZ5DuwV5xsu3
 RAVHnzOrArjS808tlJLieljSkjLvgLovXKLgOgufoBR33Dw7MgzQ2qCflFkCaKcOaAIdOWC7eft
 OzksivElU7CpSaMurp4lhqsk86AfGn+5g9ic0g6eNQlxRnWMUk8+L668EKnjaXz3MF3spLOgvYM
 T8mxM3+QyOwzE9qom2A==
X-Proofpoint-ORIG-GUID: B57Y0KcjToyzZdGk8cldcPD0OqzSvqJg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300052
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,bootlin.com:url];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100672-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[umang.chheda@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AF00F35613A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello Krzysztof,

On 3/29/2026 3:22 PM, Krzysztof Kozlowski wrote:
> On Sat, Mar 28, 2026 at 05:11:17PM +0530, Umang Chheda wrote:
>> Introduce new bindings for the monaco-evk-ac-sku,
>> an IoT board based on the QCS8300-AC variant SoC.
> Please wrap commit message according to Linux coding style / submission
> process (neither too early nor over the limit):
> https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597


Ack

>
>> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
>> ---
>>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
>> index ca880c105f3b..07053cc2ac1c 100644
>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>> @@ -918,6 +918,7 @@ properties:
>>            - enum:
>>                - arduino,monza
>>                - qcom,monaco-evk
>> +              - qcom,monaco-evk-ac-sku
> Why adding name 'sku' to the compatible? What's the meaning here?


Monaco SoC has 2 variants  - monaco-aa and monaco-ac -- "monaco-evk" board uses monaco-aa variant of SoC and this new
introduced board uses the monaco-ac variant SoC. Hence added the compatible as "monaco-evk-ac-sku" to differentiate it from
monaco-evk board.

>
> Best regards,
> Krzysztof


Thanks,
Umang


