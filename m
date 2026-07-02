Return-Path: <linux-arm-msm+bounces-116038-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Hxo3Ko1pRmpnTgsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116038-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 15:37:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 121A46F86C2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 15:37:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=X4VR7ffB;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=EMsWFrj3;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116038-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116038-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 73FF53096834
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 13:35:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 117F24A33EF;
	Thu,  2 Jul 2026 13:35:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DCA1244675
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 13:35:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782999328; cv=none; b=ax+VV3LEwgjrHoHYnpCHU1+vOnGhncKArpYQDgGP2LE5vRuicfiUpAr1pgzkGd5u/0uF+G8scR8G3aYxiQ+7y/Tf7Qt/tw4ianSUjHhgZ7nGlaL+9bPYhMgsnjq3jkPsk/90jf5tUBX88SEnSVL2CBy3v3VXkaujBkn7g3LacX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782999328; c=relaxed/simple;
	bh=E1/9DIDIMVTroh6AZSTdy0KhiA6AI5YzqTm9giWRgZE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rL2+6kuUfv3b+rgZhnuXSe14je0zkOG8L/us4FC6mW0oZJUZGPs2f8bLB6sqoI1WmsQ1dS96u9VHgYmWTKrsxKVIhvK5wak4J3qh8efHue8Z2NlqOFl+2bGCJ8NPu8WBPLS+D1Xl/P2SO+zR8gOvEMuwHwmIDAn1QW1K4b6kwFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X4VR7ffB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EMsWFrj3; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662D0XOj527915
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 13:35:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iP2L90DYVRpyRK2MWL9L9i4kUeULtc7huFI/8WNOEOU=; b=X4VR7ffBpKxKPjAV
	GAgRko8DSXI4y62ewp/0IhUfj/Yvv6lsC8NLfTDi8rf7PAqyoUnqgtL8IpQpbGF5
	heHLgxa7V37vo+/RfGsoF+choyY4DWvUK3evZ+KSO3pLOvyziTpRiMAuvcLzA7/x
	X02PzURiKbChtswGdXkxMJnmOx0qE0rY5AVxklDJQmVdFGbrEmdPw4U11URLWkB0
	+gk5utfZanMaK9xEcxoyPJYbAF0HbV44bbL6v9ViZrJ9FJTOC+WbR7nQ1o8SVbSl
	tMqreavqMJq55igFmCbwuAvkYfEY6oMo0ifFAyRyXCP1LKtniX7nM/Uc0vOAE63/
	BdY1XQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5h7n9y5n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 13:35:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e73fc29bfso289603185a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 06:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782999324; x=1783604124; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iP2L90DYVRpyRK2MWL9L9i4kUeULtc7huFI/8WNOEOU=;
        b=EMsWFrj3i0JcZ0hs3z+3/zxo0co42g5COc1dGKSdR7YGuJicZ7iWEb6v1nwJBDAibI
         P+W+HLEEsxoBDUSx6Wmw6zOGJdcLzhYEgH+HFLUJyvH+amR10hF7Y13awXk8a8+y8Y2Q
         venSReUDCG04u5f9q+Cxek+9Uh6ckt13Kt+cjByYjCcO9LEW1xb8g5l3SGHRR07IqgQV
         xHKO/5myr5d3zN6QEb3nBNsbIqIJbGqV7G+CrGlDnyqGJkof2e+x1rLHMy+CdpWZNs0V
         9rrqWRdXBxTthwrKz/D4Bao1z99x4RLZpc+Rib8DuYs0lUaRbCspRKI+39hKgUj9NR5K
         p9mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782999324; x=1783604124;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iP2L90DYVRpyRK2MWL9L9i4kUeULtc7huFI/8WNOEOU=;
        b=q9oMCSNIHtoh5eHyA2OvPKJ+C+/JrSu+lJhT3ZZRLMwS3rbhara3InZh0mmy8D5Z6G
         g1Zt4lHq4aZ0UCxPjjPOeKyk0XnoSsbwukVJ02a8huXPYq+Ui9bXu1nDJgjijMmc3Zrp
         Issnn7nVK5QJ8mJ06xtRfNaP5qVWMSShr7p7lSk0Y0i8/wBG7Zg3gA1PQahUGvQqYt+o
         uydYvizn/9eOo1Phl/PktKU/Ll4mz5XfD5dEGg4tDlTeOg7CtNP5PuQwj92yOmTxPlBZ
         rAXk50cZFLzejmCN12PO/ACmwjWFgAaUdgBTtZO2RLSpAqLUmlOij9DMFOju8gg3yB0K
         nXWw==
X-Forwarded-Encrypted: i=1; AFNElJ/fKoCJyNXOuujyzsFI2bMpGlvamudhEb+rE+E+/FA1HEk7bstLpfqYDx/y/Q+JG6hcvx4YqFwi0nPl1kYj@vger.kernel.org
X-Gm-Message-State: AOJu0YyDClj82mvSq2HTqrV7js4Nr+PLkLSBginTlKLM4Gx4yQ0a4GKl
	wrX1/yenQwcSxK2jm2dNFPs5rtgwxM/FrIY0TvU+seckji2YL64WXRFp1x786eQCM4np3K5Bx6p
	YxCEj1y93/Pr9u2SdrXd1lj7AzgYysZMgXl4mCbCytBUikcFzGl+S2NVWCYhxzfeJLdYQ
X-Gm-Gg: AfdE7cmfhXPju3K3HWLgg6tN7Mtg7uQKBn/tKOrCEw0bjwTKvLVr2Xb3neZGE5wboxS
	/1/Q9vq8bPyDqs7hKfm6ClUuHeGlYXF7SnQAjhFLbTQTq1fXp/IwlffVKPSrOL/FK1FtjDLdkXc
	XtTqcb80OXwSV9oHOeX8GR6woz8umTYzCTX16poRglgVq+heJUK9mEX2G5HD+aYa4KoKVxNkNxu
	ZbDrfH3eHGTpPzWdGzjnwWQr24HOCeJmGZqHznxKgMgQIXvwU1iKBaojwRDhpLsHx1aZRgvSWbe
	1S5/3Aqe96guvTcTJ2k+4QNAOekHq/d3HnvSZD0UYpkcwCs4fw4k9dQatmjmYHVEAdY6k8NVYZ5
	bcGdjs7qO7oVNvNReyqHg+KbWnmrTIdcaTSA0gUgQgIKcpfeBLOywbrnt1vJ42kU1rQn4lT28Cw
	==
X-Received: by 2002:a05:620a:2a12:b0:91c:d0b6:13f5 with SMTP id af79cd13be357-92e782408a0mr785675885a.19.1782999323817;
        Thu, 02 Jul 2026 06:35:23 -0700 (PDT)
X-Received: by 2002:a05:620a:2a12:b0:91c:d0b6:13f5 with SMTP id af79cd13be357-92e782408a0mr785670185a.19.1782999323377;
        Thu, 02 Jul 2026 06:35:23 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7? ([2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c635c41dsm95373005e9.5.2026.07.02.06.35.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 06:35:22 -0700 (PDT)
Message-ID: <2b51d68d-9f13-4b21-a0cd-32b78ceb5755@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 15:35:21 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: x1e78100-t14s: Add thermal zones
 for keyboard skin and charging sensors
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, sre@kernel.org,
        hansg@kernel.org, ilpo.jarvinen@linux.intel.com, linux@roeck-us.net,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260701103714.22583-1-daniel.lezcano@oss.qualcomm.com>
 <20260701103714.22583-3-daniel.lezcano@oss.qualcomm.com>
 <6bcfcd62-d831-4262-9ce9-66e12a72b3f2@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <6bcfcd62-d831-4262-9ce9-66e12a72b3f2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE0MiBTYWx0ZWRfX1m4NfZzFW3hT
 rBP/831/UxrnBaXTnfexK47xD7U/OekRBNiHC7OZvqYpbKb2Rj3nun/15vA0erdU3TP9IdUbrex
 cThTjUGBfTNCMxtbuMW3GSKTZ+Ko+iwmvo5Wh/B49B8G1zKmBaTrb6PVB9PptGZP6B70FVgBelr
 V+VU9V3tmYDLGXAuPK6cD68aCrW8y5tZFvpXP5cjzq7oHm8YWovobvCDXpFgWCR/os8RbDL/Jib
 +XyLlRWZQk3uO5bFzC1JzwEZjqFl/sSWHs4uXDO7JDG5e1Vji8rnc5l/4MZ11cKLDV82PcWBLZn
 eCDfeo45bFhNdIA278ib9ucoCVtOkPgT1fMDxqh2r1OwuI47m/iQjx140WOn83RM8f0drlI9zqV
 OlkBBD3XIEipSPBl8K98iWbJeAY7Ovk+IG3VSyMhTBADb96NUTw05s3kQV1uIxq2v59r4fframf
 IpR19EtBMwmUSsMxi5g==
X-Proofpoint-ORIG-GUID: Fof1jMp_LDxyMzD4ZQdeWcZjP6ntgig3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE0MiBTYWx0ZWRfX3Zg1bS7WhTBS
 QZmJsULXfZ+rf+laC4K4g4hbAnA9Du+bOCEJsCJMR7Ps2txECxDm8iwczYBxo1GE41F/WqCuYYC
 DCDaaGkKD6+uBI5oSU7kqtzX+jSysLI=
X-Proofpoint-GUID: Fof1jMp_LDxyMzD4ZQdeWcZjP6ntgig3
X-Authority-Analysis: v=2.4 cv=WMBPmHsR c=1 sm=1 tr=0 ts=6a46691c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=3fF9mxJG-zv1VSP5w2IA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020142
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116038-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:sre@kernel.org,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:linux@roeck-us.net,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bryan.odonoghue@linaro.org,m:platform-driver-x86@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 121A46F86C2

On 7/2/26 14:17, Konrad Dybcio wrote:
> On 7/1/26 12:37 PM, Daniel Lezcano wrote:
>> The Lenovo ThinkPad T14s embedded controller exposes several platform
>> temperature sensors that are already used by the firmware for thermal
>> management.
>>
>> Expose the EC as a thermal sensor provider and describe the keyboard
>> skin and charging circuitry sensors as thermal zones in the device
>> tree.
> 
> [...]
> 
>> +&thermal_zones {
>> +	ec-keyboard-thermal {
>> +		polling-delay = <5000>;
>> +		polling-delay-passive = <1000>;
>> +
>> +		thermal-sensors = <&ec 1>;
> 
> Do you think it'd be worth to add dt-bindings defines to avoid raw
> numbers here?

No it is not worth. Usually we put raw numbers and they are untouched.

> [...]
> 
>> +		cooling-maps {
>> +			map0 {
>> +				trip = <&ec_charging_psv0>;
>> +				cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +						 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +						 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +						 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +						 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +						 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +						 <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +						 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +						 <&cpu8 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +						 <&cpu9 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +						 <&cpu10 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +						 <&cpu11 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
>> +			};
>> +		};
>> +
>> +	};
> 
> Stray \n above
> 
> Otherwise:
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Thanks for your review

