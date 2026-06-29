Return-Path: <linux-arm-msm+bounces-114825-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id roQrAdb5QWqKxgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114825-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 06:51:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 554BB6D5EE7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 06:51:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=bqYWQPJN;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=TeMox3Da;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114825-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114825-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5EEEB300F10B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 04:51:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B332282F38;
	Mon, 29 Jun 2026 04:51:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C5B280A56
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 04:51:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782708686; cv=none; b=hcU41rQob7dkkY/lF2lXmWYTAv/EAYwtIpVDjb8lzQnuzxUAMPKuoutzrRWtr627GNvYTRzegiLT/1g9rPI52yu3Soa2HN/2+RBvG3TKYUz6sYom1mZUI+ueSncJ5arbA8LW3ByCWbMr6HMJVTlt/WqSaxm1LbUWiiNAVdVmZWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782708686; c=relaxed/simple;
	bh=T2k769MKZqT5yEUVpWFWxieUNhOvc2eKWBo5shbADlw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TsMWpoTGZfubmxOqTqLgUf0V7Rh7i52xMGVLBb8bgV+ynLItmgmFzvr+80Or6UPgEuBh/MD84wuy5OdhecgybHX01ClP8dcbg4ojoliktsACoZ1ML+hw07FCZ1aWVH3WerJoDUbi3ocVYpqdT5bIQ1LDoE1xR+ByoziknrBU3TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bqYWQPJN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TeMox3Da; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NH3p1771431
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 04:51:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	STdw/jIr7I775vO0I2+wfAaDmJDdKjY7SxCC86PcJqQ=; b=bqYWQPJN1syE/CZK
	0d9/ly4zI0dILjUJPETN891MR7IZkedrfQt/jb4uPx47H9mM6MBgw62ElYGketeZ
	bdpOY/G2jVuVGe0NNLcMRXHneieD1Pvnhv6eGxl4jBymULCkYrSk693DqePdjHgg
	EcdwAXo+RxRVoWo9ZsEz3rOTiVtA5kbD1DtW1BCHSH/E49W1NuCcKxWHlpKaIXnD
	mRMA0kEgWZsSgMtCdTWHuW1LTbOZaWJlRY7cMkc8RXvN8UruyKv+wWkZKvoWs1kw
	TuezOHjzPuIxF9hOlGHtSRARvjo/BF/oK4GrzYJ1roxiR+flDf6VuBN89OvgU1TP
	+XHirg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26tumekn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 04:51:24 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-13980b6561dso7465761c88.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 21:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782708683; x=1783313483; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=STdw/jIr7I775vO0I2+wfAaDmJDdKjY7SxCC86PcJqQ=;
        b=TeMox3DafRuu8g0nMGV1LuCo7V0XURRN+rhY2CLsPFquyX3zzTo8S5spn1MdsY9DTP
         YAINA9+1k6nWDferdqTeZxEm2bzPBF/XDlOBwIYD6RtFawlTaezMMcnimnfpyS/OXlkr
         Az6Od+7T4HHU8phq5SIag78HmNxto9LRQHHd+uhIKt30w//byFnpaXS06qfkCKj3ayby
         51V8ReudhkxkuDQkw6JOa2jqgqpKjTX62zXnKjBnEKIRV5Tdx9cryEY6Mi0Ucnctw9xd
         PxHsOCnjj8X6gWQYwdcExgn0sqiIjh/VbMCUiPcsLnd6fVzW9n9JLvhU0HFyEU7IeKLG
         8mqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782708683; x=1783313483;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=STdw/jIr7I775vO0I2+wfAaDmJDdKjY7SxCC86PcJqQ=;
        b=NwtjyFAc9KLZC9/rFk81nwsgGK7TPBwzCp2ukCV/zarW9bHaec9Uhu/AuXXYF9B3w3
         fzVZqTh3BoAB8GxvMKbar6fgFa6N5uytz6GaVOKZgxoQSgXlooctmsfQHou+bfk2YH6l
         2DAq1y2Mea3EYo2rlLUmeN+j6LTmoCkryrKc1S0TOE4GX3CV9wmYuNkfXn+sr8RJ5i90
         m8hQlHfZk8xNjH6c5RtQVEEsPP8QVq5uyt5q/FZ3NhvpbO4xomEA8USt9TAfxbumgSWd
         A8RGE6ByEGYg8pvfdUBzFzZNC/T0zUxF+Bp+VC/PeE9Qpz/9QKQpsgCJeYry+7lP+CdQ
         68Fg==
X-Forwarded-Encrypted: i=1; AHgh+RrdMyOVvd6KSl6sxmuRDT5r1ra/kdTS9LVKSHlNJa/D08VLFQb+oOs6hry0xEzW6d0e8f9+WDWl4yK2thle@vger.kernel.org
X-Gm-Message-State: AOJu0YwQt9c/M6oeYkMHF0tPoKiPutwDU42FBCV7OyRvtQmfh3j/HmoN
	MB5vHO//jLHkPE/J5rEbWtyfq13qvTM9AkL0k5r+rtSLRPflvscjBwEZwXqSOsbVUWE8VN8HqcI
	QTZanjb9IwIQO6WefoWcQfzTKQe8x5tStYjY5OI0TNxhuBf7xF1fGCDpQymxe6mpbyipp
X-Gm-Gg: AfdE7cm7UKq0u86pgUmlfkqUPPG3dac/+F0f3NfV+tyCn5UFxJXYjTYed4VQDmtfdDi
	jWyK0oSfDV9l2yb1YP3rvQaMlVJwNZ3g9kUmpD4RD922GH5PxMK2dqj/05jsIQ/hSFjPC8IBP/n
	wCVTawe6NZ15LMq9vC/ja7swXZaK6R6nAY0p2LVxys9anfdq8/J0Oxpjuh5ibgz7GeTbjwRoPWD
	9EMoDT6dZa5STdePIxWnuV9HS7qf+rugvT69rJleI2XjEmColbOCDdHeNsNaNbCr7URfoH8Psen
	wzBNPdIqm1+qxK4eziNx5bMlay82QHSU4xywC74brP7iGMKzR/2pEsU5ymuPokjMwMrWonBYWPy
	XsakHhh7L/UfeqoD3BApACRF0wh3Kr7qTfsH9+Xl6BaYGNgK16g==
X-Received: by 2002:a05:7300:2152:b0:30c:43fb:3a69 with SMTP id 5a478bee46e88-30c84d9b4eemr14897181eec.6.1782708683577;
        Sun, 28 Jun 2026 21:51:23 -0700 (PDT)
X-Received: by 2002:a05:7300:2152:b0:30c:43fb:3a69 with SMTP id 5a478bee46e88-30c84d9b4eemr14897168eec.6.1782708683084;
        Sun, 28 Jun 2026 21:51:23 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7ca87caasm39793578eec.27.2026.06.28.21.51.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 21:51:22 -0700 (PDT)
Message-ID: <4228e2c6-e5d6-4173-a0ad-4fd82854dcfe@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 10:21:17 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] ASoC: qcom: lpass-rx-macro: Add shikra compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260608172023.2965292-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260608172023.2965292-3-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260609-pretty-coral-weasel-e951ef@quoll>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <20260609-pretty-coral-weasel-e951ef@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: TrXKP_sso2gw2xlhhGceoiSlb0pse4ho
X-Authority-Analysis: v=2.4 cv=A8Rc+aWG c=1 sm=1 tr=0 ts=6a41f9cc cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=r26TJLN4OFIrFanpHjAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: TrXKP_sso2gw2xlhhGceoiSlb0pse4ho
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDAzOCBTYWx0ZWRfX14B8+opdf4X/
 2wdIuk+xeqba7GQyPSB0pueetLcpsFwSB5uAgTHnJdkB+62EvMLeRWWQi7C6zULzyi8tUM5NV/o
 26VvzwG8kgTmGKWXZbrWHAGer+cTFG4qGlJXslYwOyYMQ2CTYRPapD/xuamlnPe0MgrXo/ftZG6
 BTp7D8gz5c8bfAmfhFkFQatvu4ExyjyuqOOF83gc1o0rv/MLhD58CEDF2wQN/4RTgY3Ksu11dWD
 ICQLBrNvyP7cJ05CRG9Ehbq19x1iQqLOyn3X18hxtwkIKl/zujYHku3MG3ajvrlyrm8xrg3e4Mr
 yjBQeZAEVgAR4rco0PSA3epWevT5ANGG1lrvl+JDQQr3RxAxqYG3kd7oe/SiO/On4I4/Fjp5D2y
 yz14/FFN+16TrsYB5Py3HAMqjMMPFKk0W44280l0m7JdiQCRw3Q/2380lFS48gvHTv5TW7bgQTw
 RNif3dinHdsVW0XakIg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDAzOCBTYWx0ZWRfX2iEW/2yOvTEg
 QlHXb9rQ7Iy/6s9mi8akim4gWk3oiYEcxjTAAErE+EbfDyZxSPwzXGkEXtch51pDLDBY98LjJlL
 qx2TOfM8kkf8huU5YsQCAPn0IdEKq1A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290038
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
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-114825-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 554BB6D5EE7



On 6/9/2026 12:58 PM, Krzysztof Kozlowski wrote:
> On Mon, Jun 08, 2026 at 10:50:22PM +0530, Mohammad Rafi Shaik wrote:
>> @@ -3648,6 +3655,7 @@ static int rx_macro_component_probe(struct snd_soc_component *component)
>>   	case LPASS_CODEC_VERSION_2_6:
>>   	case LPASS_CODEC_VERSION_2_7:
>>   	case LPASS_CODEC_VERSION_2_8:
>> +	case LPASS_CODEC_VERSION_4_0:
>>   		controls = rx_macro_2_5_snd_controls;
>>   		num_controls = ARRAY_SIZE(rx_macro_2_5_snd_controls);
>>   		widgets = rx_macro_2_5_dapm_widgets;
>> @@ -3809,6 +3817,7 @@ static int rx_macro_probe(struct platform_device *pdev)
>>   		return PTR_ERR(base);
>>   
>>   	rx->codec_version = lpass_macro_get_codec_version();
>> +	rx->bypass_fs_control = !!(flags & LPASS_MACRO_FLAG_BYPASS_FS_CONTROL);
> 
> Is this specific to Shikra or LPASS v4 codec version? Commit msg
> suggests latter, so detectable from version, no?
> 

Agree, this should not be Shikra-specific.

The behavior is tied to the LPASS codec version, so it’s better to 
configure it based on the detected version rather than flags.

I’ll update the implementation accordingly in the next revision.


Thanks & Regards,
Rafi.

>>   	struct reg_default *reg_defaults __free(kfree) = NULL;
>>   
>>   	switch (rx->codec_version) {
>> @@ -3831,6 +3840,7 @@ static int rx_macro_probe(struct platform_device *pdev)
>>   	case LPASS_CODEC_VERSION_2_6:
>>   	case LPASS_CODEC_VERSION_2_7:
>>   	case LPASS_CODEC_VERSION_2_8:
>> +	case LPASS_CODEC_VERSION_4_0:
> 
> Best regards,
> Krzysztof
> 


