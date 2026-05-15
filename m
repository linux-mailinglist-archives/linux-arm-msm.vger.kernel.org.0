Return-Path: <linux-arm-msm+bounces-107822-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Hu/EnsAB2qVqgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107822-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:16:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D65D54E3B5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:16:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F0EC031D110F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 11:00:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D572444DB95;
	Fri, 15 May 2026 11:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iNGw18Dc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZxMwWH99"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BCE4472794
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778842806; cv=none; b=ogPXm8AWlXwX82/8YelZGG6BJ7ns1fhesrnLGB5SLbEvRQHiLqGC96Wcffg2OqW/nunMbN9vgEYZMx9J/Tr5Ne9DeJKt5IXTx5mQVnJ9UhASGUL+T+qt/viU8p/DTYIm9WBp7IaCqWfSz3Xo8OQ0fMYlJ6OdQENoxZjYnbbZl74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778842806; c=relaxed/simple;
	bh=d9svSVoC/0gprbIsZjbMSKlYwm8aJHtknx9JJuoaBvs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dc4sU4ZpKbGpty84frcxEcIeKj3YVllZqTusD5XO6OzVaTNcmGmFmLnAh8lxDYJxzSbKVjceZHt3PmNeT+T+61T52f6pGHUs9Udn49dK2xQ3NSljTRCODsboQcGD7eBuXmj7Ghn+ElI0P7IhYkXQu/A4SBHXh69+kEfoiDQRIX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iNGw18Dc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZxMwWH99; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FAX48n3199809
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:00:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FwNED0X7bSPnXywU7V8jXrxjWzkV7IGyIrfFiq5v23Q=; b=iNGw18DcdHVN353m
	smOCqTh1rnRO5lSLkR+Jx+ypQMSh6IGS486rufTU/fmcjKDWFOLeb/qlRCRfhE+H
	lWMSYOelSVyPNQQSSFPXSVTL3x4P0Zh/mw3sTp3a2jS6j5fLyli70WuKADVhC+k5
	g3QVunX6/nfu/PWXaIGznoL5aP7Q9kuIjGP39cQNeOLpPgZasC9+AMkKoRF9fk8D
	juOMjpogTFVWXMk1ub0+axeuk2OYZu0/s9RrSTo2Wz8oaWKnhxBufxD8XpGb+1et
	BcpCvkb7fNWnvHuemdN/ev8T4Q5d74QxMZHSmi3tFUaxroaTNXsSYxQumdhc64/W
	xYzGUA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1qtw3e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:00:04 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-95ccc6c5b49so359325241.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 04:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778842804; x=1779447604; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FwNED0X7bSPnXywU7V8jXrxjWzkV7IGyIrfFiq5v23Q=;
        b=ZxMwWH995lSORndW3M2AYe160ovA1XCVNwg3VKQyAprouzpPtonGcr3kCOtSamCDUE
         uCXZPFFInxlE1j8mr7g//EiZZ73Cqbnf71LaZYnOm0a6ejXeena3fbVNa1j6kmEN8vHW
         oHmOQ4nWb06ncLXqtXXVDfu3P9lKxXRsJ0+W9FRx0xZfld44VdqVNAlem5J8Li3X2+7z
         0L2gFTtgngKjNUMJ8jNhv+5lNDBbGoM7y7iKUHa4e3mswpe+M6blVGnE5zWbqqcx78FP
         wbq0GvWxyvX4LOu+/K7963lA1yU4ROnUrHUep1Eok1WEcvnGWMtjbmoyONwRnZcx3w83
         pFRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778842804; x=1779447604;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FwNED0X7bSPnXywU7V8jXrxjWzkV7IGyIrfFiq5v23Q=;
        b=rp+9Rnk0lJGFKFJXyV5mwMQHbtzVK10h7I+4ZVgqQFf5emhQxJ0y4PrOXdSGIiBtlr
         9DnECctk1rNAepKy1IoBPOJyhQtydI4mbwNITyZXpYEFvYzJYE9aYOkH5TPITRnaKmbw
         IqAKguBhdtoIY6FJ0UutGD/BVJQtTbtsLB8h+OCJfDHSoWpFZwfhaTBDJYYaHy0kkPvl
         hEMQQ1oP2Mv8kXi8iyrdqlGoRKmul9nxZaAZsFtBw3W4nrsP/N/+WWEHwn8vOjcAo/xs
         5CnYSYh+bMD9ASgVyYC9ug1PLY9I6Nquh6PoP6mdfKo0673urEuT5Z5AXrenKZJ3ecD5
         1Q7Q==
X-Forwarded-Encrypted: i=1; AFNElJ8uUrZ1Y8vmcae0s/LQmgUTTe0Vd/nxdrQ5pi6r8sESuxpBw5qeJpzCqUTZ3xaEaPtP2RmbRYepj1kzLPzr@vger.kernel.org
X-Gm-Message-State: AOJu0YxLzpJ+HbxNnixgTcdOqGEPo4iwmbufDv7cjh5tuGTBofFHkOIo
	+JTEo1s1QoTc/ip5PILXicYkigpc2IlykiN9XOdzUJjKBFTf5j3CoKErRBD+lSj81fbEqNR+Z+N
	MpAdqTqH7L34B10eam5oygg8t5gq/QXej6BIMTPY8ctEHe7LdgGDOFHPLudC3F3BVqEia
X-Gm-Gg: Acq92OH77PIw3N/L8mk0ej/vGWiJaG8cZeDcqND1cD66vR7zGu9cyjedyA5563u7l0U
	BYw6pak1EHy6hIFqQeOuMi4Fhi86toQDMju8vxaev5+YvipBnxecuh6XCJAyNgGKSH1o6zvbXQa
	H0n9dL2jnYvxe+lD9O+bFLkWG6fbkD8xYjNqXdbF8ihcLBG5T5igUItOAvss/I8TkKrFlPoMnZT
	7pyZrImOxLlt0cpu7+/fZPEvHOSmtGASQYalCPidmjIlS7172au80+dbh12txCOM7T2yK2qpja9
	ECN0hB6GkvqU9rGjz5TdszfBIlirAqeKa0VbN/J0+IftnOzhEYwKgrHh7FmqMSOGWY+2FeciweS
	sSri/fupJU0OG2Izvaj5oJwM72F4W/fYBA4un3OjFfWYthV9uKUfNbcYPWiCZ5dnKvkDSIsnbW2
	VWQvw=
X-Received: by 2002:a05:6102:2245:b0:631:3ccc:42df with SMTP id ada2fe7eead31-63a3fa98b68mr411878137.3.1778842803529;
        Fri, 15 May 2026 04:00:03 -0700 (PDT)
X-Received: by 2002:a05:6102:2245:b0:631:3ccc:42df with SMTP id ada2fe7eead31-63a3fa98b68mr411874137.3.1778842803119;
        Fri, 15 May 2026 04:00:03 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4bd0a40sm207292666b.12.2026.05.15.04.00.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 04:00:02 -0700 (PDT)
Message-ID: <57696ca6-42ce-46d6-9b30-cd5ad4378e25@oss.qualcomm.com>
Date: Fri, 15 May 2026 13:00:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm850-lenovo-yoga-c630: lower PSCI
 cluster idle
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260428-c630-fix-idle-v1-1-29d0da326eb3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260428-c630-fix-idle-v1-1-29d0da326eb3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HbkkiCE8 c=1 sm=1 tr=0 ts=6a06fcb4 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=9Tg3tFWD4DZn8JD1CIcA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: 92VVXl7PdIBtqZFmYnzr8j4iqYuI_S_3
X-Proofpoint-ORIG-GUID: 92VVXl7PdIBtqZFmYnzr8j4iqYuI_S_3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExMCBTYWx0ZWRfX0I6Q/OP5dLYH
 GDpyrcKtmIAj/s8kL0mNq4O0neceKDLwzPmpGf8v7VlB4Za+d7uM/ZCL1RsuCG9TgncOvyg/rdF
 IDyf1ecf5YCYwtCJQt/SaecLyxHDOwprKqzNkCjg8MIhUw5d4xrFu4lV/TPekFACzIWm/Cph1T9
 YulNT1uB4MzQ/mV8VbvgCWwx67V1iHF/lWERejmwpbjfyAQR+YbAjZeRj14UP1bGtHDtosqTNRh
 5T2nx9f1GNFiuE641Q3fPcfrdPsy+IAnltKq59Nob+XhMLc+mwJiPvuqX7WyEJg0smy3MsGrrkg
 JGogKK5t0wAXDHab8XaR7sltynyS47uu7KmDhkILIN8cSMsYKHT4asfp99HTXsQGD+VzLrMhfbg
 0KK1IgXYXgk8lftIDPvUD5Nf2A2LpefRaMwLVvjLgXPNr3SJRNM6yPvxCWUIfPxv1hQW+SY7wg5
 mg//AnP8aN8+8ZKh8og==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150110
X-Rspamd-Queue-Id: 9D65D54E3B5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107822-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 4/28/26 9:36 PM, Dmitry Baryshkov wrote:
> With the default PSCI suspend value for cluster idle state Lenovo Yoga
> C630 isn't stable enough. For example it might reset if display device
> isn't probed early enough. Drop one of the bits from the PSCI suspend
> value to make C630 work in stable way.
> 
> Fixes: a1ade6cac5a2 ("arm64: dts: qcom: sdm845: Switch PSCI cpu idle states from PC to OSI")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> index e41200839dbe..e6c67016552a 100644
> --- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> @@ -347,6 +347,10 @@ &cdsp_pas {
>  	status = "okay";
>  };
>  
> +&cluster_sleep_0 {
> +	arm,psci-suspend-param = <0x41003244>;
> +};

Is it better if you do hack in a

qmp_send(qmp, "{class: cx_mol, res: cx, val: mol}");

somewhere?

Konrad




