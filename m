Return-Path: <linux-arm-msm+bounces-116257-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id J/xDF46BR2omZwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116257-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 11:31:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E4E700AB5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 11:31:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=YN3VGnrQ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="V/KjpE5a";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116257-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116257-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2B5263025089
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 09:31:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B93C9374A03;
	Fri,  3 Jul 2026 09:31:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D84C37E2EB
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 09:30:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783071060; cv=none; b=bTkrhSRaQ1gHEVnWi3sj36TF1UYfPHLZMtBo4zaDdGpg0fQ/9dFTlyezTpC7/DZGghM3QxB4Z7pNLcJqy66R7PCNQLcwFg0dCrASBpmiEoZH5m3/qN9eneoUwiKhHEEfFESWMnF4GbxJZeUevniWTKTU9OsmtNvyJvoMoCwZd4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783071060; c=relaxed/simple;
	bh=PW1Gn2ZDRUx5qmvoCMyRof05YepCvm5bLOu2Pluzkug=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=U15a7/j20MqI3x/t1liVj3xxIEF5mPhen32r3K/Xu/Mzgfu/keeApaFlbuRVS2sVsGrl/SJgsj0x4Ia2poe/olYMiPp+qSt4pAv65ARcooeakbzxNzSsC5YnpUn8K1BCaOY2pFNV1jM5l9OM13q+kLkweAs32RNlWDS9oCswBNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YN3VGnrQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V/KjpE5a; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6639BoWC3694364
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 09:30:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GgPcbKZq7cX2hR1BeKwBwVw/MUN21wkcUNYYxdi2Loc=; b=YN3VGnrQ8VkV3le+
	NY0sCWKe3WFHuyO9eBWaJ+3D+VC1r+sfVNdalQPp4ez1Vvx1r0da+ou3RcaQQiXy
	fvIqZcZ16Ohkek53MErE5qVT+ZfZImedOfPseQvdgDJ2Onnw7Sr2n09Gdvtwucvt
	cvE9TLwGTP0G8zsgGhJPYT1hXe4SOp8LuACUJB+CZ2y1llqyv+klB2yyNB+F3DcN
	ExKdqw2UfTwiqlazNsJD8TCYaOoZ12cDXB+Q2iTfW4YRra75oZMBZI4Qmz10vYA9
	cMGAL0dw9jd1CgqWU1th75Y5hdGXKEWwKKAyPx5+HaCTQYfTms1R+78JCdrjw2kn
	zcF41w==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6a84826p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 09:30:58 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c88d7a75507so737698a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 02:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783071057; x=1783675857; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GgPcbKZq7cX2hR1BeKwBwVw/MUN21wkcUNYYxdi2Loc=;
        b=V/KjpE5aK6UVdji2tuyWeRo5F8HZRd0H/mWgPKLM9zX6jqV17rEygXq20Yvvy3bbL0
         8iISGW4vmjOF9HUHsql0tKPZMCZICpo4X7xNv93k83G+xhK/eXVCdnf4hlWEb8taApzd
         QWpLwvGhVACTpyFfWuLpaifUUGDwnFYgRMr3igjLY7eyM4aIpCX21jIAKLiq5lzQqRoH
         AiczMVNJq9QhixYb81oJ2Dnmc9C6tUjuD2sioU0iUMmOoFO9rAyexRPn+1VtTLvLRy/Z
         qgG+U0XmkYczNMuDWITBlNmE2pa23jcTsP9b8b0ttC8JQuHx5aOlSHLAgyw2q7hvvL41
         DvlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783071057; x=1783675857;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GgPcbKZq7cX2hR1BeKwBwVw/MUN21wkcUNYYxdi2Loc=;
        b=GuMsjC9Xy37C0b1YiUKbYRjzG4c8HH4pZIKHibLYsChwmpGuJJ3Qa2++0EqpHp4t8a
         PwKUgmWpqWAgR442WUio98gINs7xKiWlH4CrUoSRES7qxmWbEQgHsDrQKr6C4AnitEyR
         UaMLFqcJdSyxcFf1YQv7Hf7BJWkIKjl4cPK1cI9J9Twk4Ii+0OT4ZK+3HQ8E9pzUgWLJ
         V3m+RouUrf9zZP0bxg93X5iK6P27tBYvAJJ8vQDEzBPbLMMG4YdWS+f7cClpDZJtuSNT
         P84YZBD0TQGVphjRR/0RC3H39dh+hsqkpTved7p96Q3ntSrKDmVRaPBdoilXRI+VqtNV
         stQA==
X-Gm-Message-State: AOJu0Yzr8hQU7qtJh8dALNItoE4c9/ua6xI3HovY5H7k5s4FWUcq8JCR
	OarPZeTMjq+b51stlK/PbJB9TusVRmwVuRA67MC09aeXdmoYasbyuYCh5+ZSXMpT8xf0/HzkXX8
	Xz356wPjU7taqU8oVIYQjF8s8uqcR2VhWLPvJlw9LPR43JtfvHcs9B+biWGtW0Un94LAs
X-Gm-Gg: AfdE7ckE0j9yEUGQUObQQKDY7IGk6pRjKZk9oHX5l0YjBLrN65riI4Ug5XPzDuF7yl0
	xS2Q0VoLdKgIyb/AsWtmR5/6dwo5batpoSp3E8jEsQRWAIDb84/2NuRBWS3xgjn9ybywN8uhFv7
	apz6F76zS/qbkFIl8zNCOdlpQoXMWEQ2WPMSWuNq7TADfkeXQk/vw6XbzM/1OHw/TIw8ckvtIuq
	WD2t2aag6T/NfcViUwtGBhau1zZ7nO5HMYvtqfdIBZzeDv/coLA1ecx9GQ2+alJK51Wm/qn547J
	r0mo5H1PH6lX4g9CzcHzyAdq9vF6FauVoOAmCaZzdERgCF+dAYlPZRAYllx4sqiQdsyhBPeGt+X
	9W1FTKiAUAZ/bpP+yd3DKllBsPmkHSe5WEMWyV8A3
X-Received: by 2002:a05:6300:6701:b0:3bf:d487:4b42 with SMTP id adf61e73a8af0-3bfed471dc5mr12533794637.35.1783071057530;
        Fri, 03 Jul 2026 02:30:57 -0700 (PDT)
X-Received: by 2002:a05:6300:6701:b0:3bf:d487:4b42 with SMTP id adf61e73a8af0-3bfed471dc5mr12533759637.35.1783071057123;
        Fri, 03 Jul 2026 02:30:57 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e926a6e85sm2291087a12.27.2026.07.03.02.30.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 02:30:56 -0700 (PDT)
Message-ID: <20a98312-be6e-4743-b2c2-46cc084653fd@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 15:00:51 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/8] x1e80100: Enable PDC wake GPIOs and deepest idle
 state
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
References: <20260616-hamoa_pdc_v3-v3-0-4d8e1504ea75@oss.qualcomm.com>
 <439b81a5-b13c-4f1a-9c55-a8b0b56a4de6@packett.cool>
Content-Language: en-US
In-Reply-To: <439b81a5-b13c-4f1a-9c55-a8b0b56a4de6@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 9RGhLr4WolNqYujwHB_u74DhQFaTQ8a9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA5MCBTYWx0ZWRfX1PATL2bhFjd0
 rDkPN5v72rULC4eByjTd3Iu8ucaRTbuAKjceQke1zi0307voC1d3gj2uEjNiq+MExRnKxdSnUCh
 FytjDFo0EuFJ7+pInuUKmJv2r223MXE=
X-Authority-Analysis: v=2.4 cv=a6QAM0SF c=1 sm=1 tr=0 ts=6a478152 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=CzlgM8hXaGG7tx5CzA4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA5MCBTYWx0ZWRfX/bPtuNxSWet1
 Ps+5OgyHVKn02sp1DZDgmYaX8kLfWGPBwvTs9+gCW7AXNuJyxDiX6m211MH5WtmWb62AJkqNBf1
 nE3ydW8FW86kL+P4eDIhvDHFYWC+URNsQEAG+JxSOAIqfdaiuwqFPrY6jv6ooSU7Sg9A83LIO1b
 SYXJ9DJPJJDadgnxy4hIvucgJt3dkeMSqSkWbaapBQhbKuAzWbRaRM2DzH+gYb+QBhGfNztRkVj
 OIzKPTmeThmIOzMbgOvjp9DDIF7Qr5J1lfh3zcMZOOTGIunTE602tj5cQnQer+wobI21L6eZW0L
 TGXmHujY8wGLwWknBdMezsY7LmnAvUwKO5RMpvlZWyNxZbwl9L2jvuw71QbKPuzIWDZmKOpX/VQ
 k5jSPvFGbSyjTfC2UNDI84HTqmUG7cvk14NSPXgQTMg1ySdNTu5SbSoOYFamsyOK8majbxxLfce
 2w9u5VwvpNYz6F2JKLA==
X-Proofpoint-ORIG-GUID: 9RGhLr4WolNqYujwHB_u74DhQFaTQ8a9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030090
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116257-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:val@packett.cool,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tglx@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:stephan.gerhold@linaro.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C3E4E700AB5



On 6/29/2026 12:09 AM, Val Packett wrote:
> 
> On 6/16/26 6:25 AM, Maulik Shah wrote:
>> [..]
>> ---
>> Maulik Shah (7):
>>        irqchip/qcom-pdc: restructure version support
>>        irqchip/qcom-pdc: Move all statics to struct pdc_desc
>>        irqchip/qcom-pdc: Remove pdc_enable_intr() wrapper
>>        irqchip/qcom-pdc: Differentiate between direct SPI and GPIO as SPI
>>        irqchip/qcom-pdc: Configure PDC to pass through mode
>>        Revert "pinctrl: qcom: x1e80100: Bypass PDC wakeup parent for now"
>>        arm64: dts: qcom: x1e80100: Add deepest idle state
>>
>> Stephan Gerhold (1):
>>        pinctrl: qcom: Acknowledge IRQs for PDC interrupt controller
>>
>> [..]
> 
> Something about this series breaks the touchscreen interrupt (<&tlmm 81 IRQ_TYPE_LEVEL_LOW>) on sm7325-motorola-dubai :(
> 
> With this series, that interrupt only happens once (stuck at 1 in /proc/interrupts) so events are not reported. Something something level triggered..??
> 

Hi Val,

Thanks for reporting this. This seems likely because patch 6 of the series adding IRQCHIP_EOI_THREADED flag for gpio irqchip.
In v4, removing this flag and modifying .irq_mask/irq_unmask callback for secondary chip to have similar functionality as IRQCHIP_EOI_THREADED.

Thanks,
Maulik

