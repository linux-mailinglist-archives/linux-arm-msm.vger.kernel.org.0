Return-Path: <linux-arm-msm+bounces-113162-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IaalFm3nL2otIwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113162-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 13:52:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E0EBC685D68
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 13:52:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hi31+O1Q;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="J2p/Mdci";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113162-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113162-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 328D83022F96
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 11:51:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AF9F3E51EF;
	Mon, 15 Jun 2026 11:51:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4998337D10F
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 11:51:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781524272; cv=none; b=TLA7TDdVfM4OfYqL2ttyPdeDnbKUV/rC061g/scuaNoSDOtuNPZtAKhQtX8/LEuCQBvCk+o69dFXYaIDT5sFdLzRXxdW9XL5L0u5L3o3sRsbBdbpxmK98ZeYCufVczLE9p37R5qvgd64+pD9Kps1KQVtJiNM/g+q/NlwluQePIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781524272; c=relaxed/simple;
	bh=nw0aLHpnQA82rpkW00XD2SysA11uS6WrfAfwEDYy+hs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XzxaqITGRCbhHlk6rsRRvE+fquG+R0CFMMezfye/8bt3tRewIc1zESqsABJTbw3qUJO6G1jRkn9HzNk5juxlGO+VB2nB9D34ZS6Qi19PdLotPu9H+vC8UYb85m9YXRhiNhHxqHxSd2V5j4DXsiW9+nuLQtESq3MrN0VL9ZWYHkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hi31+O1Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J2p/Mdci; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FApgEi151839
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 11:51:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F9+0CHJoUk41lmBjkCxpmQ8baT4Z++KJbPbqneNDOMk=; b=hi31+O1Q1fJWWGvd
	WBb/zC47cDiZJa0rABSRBcEP335MOSjT9TJ90FAGGnKXBZKIXXJmEcUZY+AjK/jw
	oKaEEUVJfvIiHbGQQAirLD9+aTuXfwfW4rX5rHJ83W/SWDAA5I8Ts+NHLE5ElePc
	373Df6aA9tcLSnbMALzSwoCl194thq7kbmae2LEqDAP/FlPPs7X+DAyaRS4knUsP
	+l24M9/sfhAI4GW3j499korQi189eUPdWGnRieJFdOCgzUDSnwsB6WnyYPyrK4JS
	TF4L5Cx85s8HezwU8chb26kmWoLwjKwh2SIC7VJf6YuGHyNVKBYmJEWIpqzAfRYC
	euz95Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etetf0gph-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 11:51:10 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51759082206so9109991cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 04:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781524269; x=1782129069; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F9+0CHJoUk41lmBjkCxpmQ8baT4Z++KJbPbqneNDOMk=;
        b=J2p/MdciV6ngazU9MfEhw/1bzNDbo9Jh9T3XGWgEn+J3dChfkaPlD8Sg+9m9zhtNcT
         R01vtEjCyQ0InfWnHNd8Qi5AKYGI/4eKxAL6I5tcBrq/fHofR8urRrsiXClFVljUkbYn
         xvmg9AQF52Xcw6EdrHKGJ/mO8ciFX85W/r8O6YEvQD8fr8A2zRJt1ryx2jdcLkoomJXy
         1nzLdNzx23ycoBnM8bzuixmsITiGwj41/UJSAFSPHm28XSiQ6cAChYRvp//i6dEwKYa5
         pKvSiI5SSx1c/wiB754l1ewu2UWCqtjpOKYPx7MOasfis0bZY4iVnFzSVf8dhWqzD5Oo
         ft7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781524269; x=1782129069;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F9+0CHJoUk41lmBjkCxpmQ8baT4Z++KJbPbqneNDOMk=;
        b=SmyrcYzNSEUETzsrutefNCWzI2ky7ErIfzOGyefhlM5GrSK5loakCcOy0WdbTLB8TO
         RbCiozSv96bGk7n5o2GzfEFLzfkhhUK0/4Ky1KO7bpIBj329oJXp8D7acudv3xEixRBj
         iG1Ji61BcYaBbDr3MMK9R8P+TRxLFNi08RXNAAbB3h9QAu4kuBbB8lc6vWZk1/SUmChY
         ekcj1ZGV6grg+Hj9e1yDDO7pI2zSlPftq6jou+r/FAPTNKnBH0f5mHWUvKXE5Fd8awwj
         nuGb7Ca6yZTGUJOe7xCNUbPxOvBB2vFYhjIHLjYtH/D2TXtdJqc9t/cUPa17g3claYUg
         j2kQ==
X-Forwarded-Encrypted: i=1; AFNElJ/fBdTL/MHzR59JRBVFIuaEnq+34uqgY4CP+pVxmL48GZoWV20OcdksYg+Ak7knHAk8hBYwdDEr/PYUT8d2@vger.kernel.org
X-Gm-Message-State: AOJu0YyIx8yEcb3+RjJAh5hjgg1WPdFF5556cLYIVORLZwgqjd+cl5Qw
	5JY9bu+9OyavS+Rs6jDpfG+/0jjlkGYZ5enncKfHVv1hfMW1zsig4WEOZ6bXt7tswJVGyQ7e5tY
	ZcKOwXk6fJ3QXAdwA+TBae0vxh48BObwJjUhEM2g4j5Q/K84GnZrrNNjcFQvwzIlbWWUV
X-Gm-Gg: Acq92OGl5wARh70EYEGoDAEWf1i1IYfj8CsKj7MnUnnTYe4jTPsRFq8kpm6u2OBICij
	XL9vphXjzDmApoxwX4PR+4UwZKCqVcxOpaA641utuLeL0nPIxj4E+f3/nMz6ovMdxrsfjd31Z+z
	Hr5e79wNJW5UdoasYLx3dppSn3CJySfbX+5xtdgmapkU7lFr3XSwB230avYjcyQiq51XYmwcZ5f
	CyhfCYHo2LIlC9iaa9e9lKYBTGyM1i0AfUB/UI7gibQFqmbjSN0fGzd6DtgMjkgzw+46vSAD84H
	XoVINivP7rVojafN/WJXajUNKEKdQWd7FCM9Zdfaz10fHdqyUDXIY/JxzKG95XvlnPTcbob9Pi4
	ML33oqZeZLM0Vk6xyocxU5rxPuotaM7akLkCvSAtBrXxflQ==
X-Received: by 2002:ac8:598e:0:b0:517:62f4:e3d1 with SMTP id d75a77b69052e-517fde8985amr128656091cf.2.1781524269511;
        Mon, 15 Jun 2026 04:51:09 -0700 (PDT)
X-Received: by 2002:ac8:598e:0:b0:517:62f4:e3d1 with SMTP id d75a77b69052e-517fde8985amr128655771cf.2.1781524269081;
        Mon, 15 Jun 2026 04:51:09 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-693794b36d7sm3525875a12.31.2026.06.15.04.51.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 04:51:07 -0700 (PDT)
Message-ID: <0a8f987a-3792-4bd1-a07f-04a37bd59fc8@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 13:51:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: monaco-arduino-monza: add ina232
 power sensor
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260611-monza-ina232-v2-0-e4375ce652d0@oss.qualcomm.com>
 <20260611-monza-ina232-v2-3-e4375ce652d0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260611-monza-ina232-v2-3-e4375ce652d0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=adxRWxot c=1 sm=1 tr=0 ts=6a2fe72e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=vtxEUVkT7waMBiOsAPUA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: o4ylCt0rpYROQbV2jngiTcViTXDpDEYK
X-Proofpoint-ORIG-GUID: o4ylCt0rpYROQbV2jngiTcViTXDpDEYK
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDEyNSBTYWx0ZWRfXwtnXvOksLLEW
 xdtwGqLgaOI40dJhe4D5kF9h3p2axJh5D16DOzV6NzjsuE2M4bjvIe43e/CG8+7W0OHIu0I432g
 WXrG5qmZnAMdtQRA8psymukX5Wibz0Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDEyNSBTYWx0ZWRfXxePps7lgRUcI
 25KWG5idm6zsEXqIYIkGkP99CV4XzcrQ+T4EPzc72Jf6ptHsbpQuY69KY8HO54iLk8qJeGl170H
 Jyn86aQYgvPNS1vT2s9NIhNtp3Wu8qLfEw2XKlIUfb+YBKDVYd+/vJb8MnafWwEJNVZoN8Y0V8Z
 l2fyLwsXdTB5SsK6nnQAGzhaXf8wIdikMZlLFITyUl2jUNRMBM/L7Lbv3vKZD+07qq26YGvwGn8
 OPBLBTh9leoP6FRGBO7rLdQvC71WHktlfZUkdBpINho9A8D7QJLqRcDpz+LFPoPOQPaPRi205TB
 vC2BztJ5rNYvi0dn59H2bgeB1m1GlLPBjEznq61dD5p8u05DvrXQL5HzMmnEtLTQhzNZTdF5VxF
 EG9Ppssxn3iAN/2atf+yuvd0GWx4UT6d2+LGHPdpJqL/xlD6yt+cCfAMBsoXs5XeOcffRrP8ELu
 C+l9XYtAub295iswZqg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_03,2026-06-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150125
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113162-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:loic.poulain@oss.qualcomm.com,m:linux@roeck-us.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:krzk@kernel.org,m:linux-hwmon@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E0EBC685D68

On 6/11/26 4:05 PM, Loic Poulain wrote:
> The Arduino Monza board has a TI INA232 current/power monitor connected
> on I2C12 at address 0x40. It is used to measure the board supply current
> through a 2 milliohms shunt resistor.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

