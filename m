Return-Path: <linux-arm-msm+bounces-114337-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id b8W+EHzJO2qKdAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114337-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 14:11:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 998D66BE023
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 14:11:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=LRzC8JcG;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fP+0hIxl;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114337-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114337-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1935F300F51E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 12:10:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C153134676F;
	Wed, 24 Jun 2026 12:10:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8EA2D8DCA
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 12:10:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782303016; cv=none; b=EvEMiUX29pJ0TpgUR4E0isZI0np6taCb/YKaMh62faFvPPbxq3Jol+pBw8UpB/XO2tSmgsRA0cTEXpmR7dfE1OueST/Ads42uRlfnSAwToZkoQYYLvvHIIDzPIywLWh+q4g6wP/P0ljg2KuRUTvYL4l36ERn2zyu7iYyzsKqqcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782303016; c=relaxed/simple;
	bh=2HZp2JT9DhRDsJHSxYxJaK9WQOpNgY3tItvlO3AM2L8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ieFl5OQ825zkiExyiEM3BIbpZ1L19iBDWnRU9zADqRZFKmjH679d2YbHGXxP3jiAxyyHJ1Rp9NI9IJBi7Cdql2AfjACMDi1l1zbtHRW51mcSMy0Iwy4ukQLPRNsyv207Rr/rXeaQ53Hf8U46g8tqb/H9CtEQV5eUuobcPHa1vNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LRzC8JcG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fP+0hIxl; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OANaA32583055
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 12:10:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Svb2pofDTe/NUHQV6a8z7yIDtgbyrcfcpozTS755gfU=; b=LRzC8JcG1/q1Rtda
	FFrgDWx/lkeAfrDPvm85ZYBQH/rKin1tAvlb45wtqlLVbDFHhQm/CblfdKSDpME3
	nQxAeIUIzVN8ZWPpYBNSV2NOrqFz9sJCTDFfE1Ot2JMLPUEgkK2h/ZHrEyO3q8pT
	HqzqQGIFG6sIhy4KrqXYAsqr58tu64rO1WzVjxSB+advWQ7c0khm6detfr5UDqAv
	MRNkXkGlJk/YBmq/nPlRJU+Y5kH30w5x5FMi4Fi3at7611KRo50hSPGhHgNbYd1n
	46sKFt6VoLL7fROw109cDikRL/6HOHjCaG3Vo3ps64hfjT24fiopQj6bhaUKbXXp
	miHiBQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f00evb064-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 12:10:14 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-915ccc2d4d2so25700585a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 05:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782303014; x=1782907814; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Svb2pofDTe/NUHQV6a8z7yIDtgbyrcfcpozTS755gfU=;
        b=fP+0hIxlSj4SsHHJEqTgkSpwHJy8195VBkK5MbJTGv1T29p/8qsaE0A0UaWS/uSfUB
         K54xgxxPgsrBz/G0KxYdidIplmpmWTGq3+CBbxoKYPtSOsRs7ZR0yaP1OI4W5CP+aGAp
         8lXcOr3Y4peMqOITdEbeWaXK8ARiylBbRa0HLKLue3m+JMhVD/Dh9fgTEaS8umsLieXv
         8FOXjhpXqLs7a3yVMXnDDSWCFxjPd6XwKGrlqjpQzguFpsNAo4QWeVBVmrF+B0pDhrsK
         cE/NO/fhnuodq0UR4NcL4BAu3ZuCQmsWg+gy1q/3p+k4dXn+Mu3z5adLB2GI6gpBFSgB
         INPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782303014; x=1782907814;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Svb2pofDTe/NUHQV6a8z7yIDtgbyrcfcpozTS755gfU=;
        b=EkFArm2NiOO0TKm8V3y9JaT3I/mW/q0lBhvF2jSzx8mLlufIwfa5s4r8eNPFgfs9iC
         smP+nI7XWmtTWUsxPRDJEYx+f3vEXwYxCIr3kY5FQCspFHXYmQi9TPYI75MlPIZsxLDc
         d+EM/4N+Ma++Vf8g59Bm7Tyb+l5yFRN8S5MNY4koqfqkG2gQW4XlOE5b7tIaH9BC3V7I
         q5yehBQhpBQsTcVOZ3sW/6AwqcnQHcE1eIG/z7+y5U8y2L0QCRg3J41VXVXLYC1dqJ4r
         xSmwzt/kEA0IrkS64x+lDWhIahe5O/PzNFZmbZwhy1RXiZhwunONWsB7e416vyfzJdoQ
         F4yA==
X-Gm-Message-State: AOJu0YzM5/U2ugejARW7fVUhgQWFmU8IoOKZuI/KUR3rS+XeHDub1MwC
	RbjxWMq1Bdd+rhZMCYHPJxK1Ge9B+fnskUCJCDTFpNOcmvl0XBjplCwJnV3DLNqGzEJgG/0i9Qx
	stiist62SpEKWsEMSe9uyDevAvYLl6YfaCR+10xpInPKnTj3O5ZwQFjOG2Tz1QxPUq7OV
X-Gm-Gg: AfdE7cn/rBuDqZ7fxbwx+7Dm5mPQxvqBoiBJgK2xUHS4LgcC9vxzNXXg3u4CB0ofywG
	otvXO8dHN6vQeczjG3FsL3fjuOj411gNFlIvMs7ujxKqs3vsyx6fNxBHpirQDSiUTxEnIeAFhiF
	kc//B6vC9iAuSo0OhCYU0bMRItCE3egOhkXVOJ/a+PgQJg4CxHRQTmNb2oJA7M+6rhzvBpHFrky
	WgL6Fz7hmNQoP7eVKaZvd4e0eEwY2KPpvVqDSxFoRPTmhUZ2/eaN3DtWC1AvlUQpYlnrY8lq91S
	0bY50qwxdKYf3SP1TNOMCuv7HSRntzNDdeWD4elSaa9cpWv+Gi4cm1cAb1yGnWCO/lELhoC5wNZ
	Cu8ayoVQ4W/Sa2R+uzMaxOuC6NIfq6jdJk/M=
X-Received: by 2002:a05:622a:1813:b0:517:71b8:ee37 with SMTP id d75a77b69052e-51a4f371215mr90458331cf.0.1782303013744;
        Wed, 24 Jun 2026 05:10:13 -0700 (PDT)
X-Received: by 2002:a05:622a:1813:b0:517:71b8:ee37 with SMTP id d75a77b69052e-51a4f371215mr90457751cf.0.1782303013008;
        Wed, 24 Jun 2026 05:10:13 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c610e5275sm639417266b.45.2026.06.24.05.10.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 05:10:12 -0700 (PDT)
Message-ID: <2aed327e-abf6-401a-a05b-ba3f4a5cd7f3@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 14:10:10 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: Add HONOR MagicBook Art 14
 device tree
To: Konstantin Shabanov <mail@etehtsea.me>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260620175210.19563-1-mail@etehtsea.me>
 <20260620175210.19563-4-mail@etehtsea.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260620175210.19563-4-mail@etehtsea.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA5OSBTYWx0ZWRfX6gwiLLGZowH5
 UOBlIRRo09pDCkMap/BNE7RzY7qeH1f6CJN+h/j5dP+whPwhWiS14ykah9SQFekjhr+LE5BOvLW
 C5nj5wTbLrZdYfQ0To7RujS6nzI3YMhMkG2yLT7qj1ybONWjsUFQST+WwtUBsXz6GodnGJ2GyF0
 PopmyEHp3HMFXDmd6SSgaqiKXAEyRFuefGzZQtXPzXzLokPdqfWN7hjiRM/hZugyML8MihzwpPv
 eFOXkIw02b2/1kaaVEOoWLEeCSWm93y3TC1fDG18bOEQfsVvQE/fHmcu667dJUDYBjckKB41NGf
 xqlmq0kZoIh6pcN2IHEXBcXjWMPJtAL1vpGovwhVfHizpZn6FHqH72eIv2KutSUwOXEcklI98lD
 fxYv9Jba6A/WNYcCLITvqR5N5GzjzBaWs+Lqxh46HlqmAbAmPAUUiAsJ6/SEjwI5ZOE6wIHx86l
 6dDDbX5T5BC3tjAFKSA==
X-Proofpoint-ORIG-GUID: xYxAlfxBwf2tXIVYqYFfRtrgUK3RNKOb
X-Proofpoint-GUID: xYxAlfxBwf2tXIVYqYFfRtrgUK3RNKOb
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA5OSBTYWx0ZWRfX5tvbmP14U5lB
 NwRKRfs6S4art77KEKU/OY8SqlT5y4UidZkYlKeijz/xV2gti/XFp4v7fGyZ+MjxCuemFEfpQu3
 WdRg2hEcdjaR0IAwvu+EzeBMh6vwStA=
X-Authority-Analysis: v=2.4 cv=JbaMa0KV c=1 sm=1 tr=0 ts=6a3bc926 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=4Qiz8VOyNOBCKGrP_ZoA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 suspectscore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606240099
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-114337-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:mail@etehtsea.me,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 998D66BE023

On 6/20/26 7:51 PM, Konstantin Shabanov wrote:
> Introduce support for the HONOR MagicBook Art 14 laptop.
> This version is based on the initial work by Kirill A. Korinsky [1]
> and Valentin Manea [2].

[...]

> +&iris {
> +	firmware-name = "qcom/x1e80100/HONOR/MRO-XXX/qcvss8380.mbn";

Is that a model name, or a placeholder?

[...]

> +&tlmm {
> +	gpio-reserved-ranges = <34 2>, /* Unused */
> +			       <44 4>; /* SPI (TPM) */
> +
> +	hall_int_n_default: hall-int-n-state {
> +		pins = "gpio92";
> +		function = "gpio";
> +		bias-disable;
> +	};

nit: pins would be best sorted by their pin index

[...]

> +	ts0_default: ts0-default-state {
> +		int-n-pins {
> +			pins = "gpio51";
> +			function = "gpio";
> +			bias-disable;
> +		};
> +
> +		reset-n-pins {
> +			pins = "gpio48";
> +			function = "gpio";
> +			output-high;

not a nit: drop output-foo properties from TLMM pins, the
driver that consumes them should take care of setting their state

[...]

> +/* MP0 goes to the USB-A port(USB3) and FPC */

ultra nit: add a space before '(', please

Konrad

