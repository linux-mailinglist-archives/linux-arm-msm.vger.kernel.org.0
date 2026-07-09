Return-Path: <linux-arm-msm+bounces-118077-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id t0UwI9PlT2qepwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118077-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 20:17:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 044407342F1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 20:17:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=eLRPVel3;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XZtLc95s;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118077-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118077-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5D5E8301D314
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 18:17:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01AC64DB546;
	Thu,  9 Jul 2026 18:17:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCA13876B3
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 18:17:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783621024; cv=none; b=CMlK9l6MoPM88UBAQ74kgRSJNs3hO9xSiW1uOTD7n+gokyvzy0sjuCmN8RuYR7dyBs1JLG9vzS96fYYQ38+P7x0qPe7ITCic0JkSejNn4MC+LNsXD6yZHJBUyP52YwftGV+qs1TB2cYyMWdT9shXHA3BmfYITQfHf4kw91KgpEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783621024; c=relaxed/simple;
	bh=1TwrHJALVemOdWqPWInxD1rzKRkbLpWIAC6sBRbz/54=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eVg3XzIx2wWsC7UgOquvUx6g8mDzdw8WrJ8wMIYV1tx6KxpBZzUOjx2TOrIM3AwjoI0lufCEFOGgbfY0aaTcYv1xJspw4Zk90+b3HOsOPeC1x8eeVUiHTyVgCT+Sl0vGV/goLAyx5KiRraaKJkwmlqskAT0QmIfesifuBODrGEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eLRPVel3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XZtLc95s; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HXNKC2506343
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 18:17:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UGjdfApLUPZZEfiPZI9k22tEfoB4RKgXjIaUHpRLtfM=; b=eLRPVel3BG08+nQu
	8ORvn+sTGCeH+2/bd78WUotRqrv7lz1bSww8PsImzDnjWwn0Psw6+Df70rPuL+ES
	yyt79QsAPSLZ5gIMYMY8Lmv19XrjZKvePGIJHp7jxXZUz2rc+6vfucPGPwtRT3kc
	tvoMsxU/BNK1ut2O3bE5DAZIAgDQ3jv4YTqdopRCaNkIpllfHz+p5l/f77/YQG6l
	KlFGB3edkDr0dnQCWlcMiOmqf2q6JuLFwKSOCpyuciRyWVVTzIe5sdbOCh2NO8sY
	59HUYdJhTpCa1JzZZ0Q4GS01ZDSOhedYheuYr3Ieo6XbDKXcKDZgkwebWdXaVG9a
	yRuxfQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa6p3u98q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 18:17:03 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e661ce1dcso2747485a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 11:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783621022; x=1784225822; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UGjdfApLUPZZEfiPZI9k22tEfoB4RKgXjIaUHpRLtfM=;
        b=XZtLc95s5KosYJYncHuLubOzNP0pFxmpABKr5OSGtoH3Nfeo58KuMmnRNgindVy0Fi
         rsy5ZwOzWCd/JS5MavAHiubejAbHNXLaqUivBtA7alQV5kh7zm+etclmugrx8FhsxhVu
         sPMSgXICxjI6/VoueMN3WU2MJkM7+FOWRf+C4kBnrkRJ8UWU2CptEbsjwoaTLZaz7L/A
         v9TaaMCvmX0ZV9ndKz4miC9IwJC4BmhKhjcOGd6ZH63iiuRmSn9yoRDVwc5/Uwrkz9fs
         /HsxXY+hftIrFzuryrR682mzxqG8C+g1k5J3aqdL5XZUVzVq0nXHFyHP7P9/LIT5a9np
         B81w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783621022; x=1784225822;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UGjdfApLUPZZEfiPZI9k22tEfoB4RKgXjIaUHpRLtfM=;
        b=nuF9KYDxjZfUxpDQR+VGNgYzp/6poa0oIszsFT5Qi9So+JsP1xJSVSIrDoLaIZf2kU
         1nlO8pM0QgJ/m7fftRIEqTNIbKpv8jJ5qkv0me7hGUt2JDUCbzQVdV1mftGxH6B2n3GW
         onRvWwDrMhGtL5gl/Lb4X0c+EmBvdTNTjcKcKavgP8TheBLXkxdwqR6NXBoTwyQaA9iW
         Je3sttzqUjm4wBkzY/NrVL9kVYwtnpjO5lxzffsBdpnNDr9BFuh329NgxVAL5bynwPBP
         YwR7S9wDchL+WWcFgu5qtwfMsDP0dBaPwVHhlEHllx6Y0tlie9KMF317IiaiNiRDpUZS
         Jubg==
X-Gm-Message-State: AOJu0YxmCQ/1IbF0GSyXueqMfHF8+rGLITrNZcrMblbs+oYfELt+4G4F
	GQbHk8vfzMxFdQrnXw9mf3oxqsu5zTA/4I31IfVq+kl4rE3iPzPBJ9mLMVpxIYpMP+4aPZ8qjZH
	7Yhj0OC421dpgkr9jfX/gC3jorJO6zvgAzypspzR5BDwhDKaFZCaLHVq3hdfzZHm8Q7hKMaDqmf
	DX
X-Gm-Gg: AfdE7cl2E0ulLYBSd97Gyjr/R4RE4S1xvkVPg7gofIBkmnRjxhsN/SCEU3fHtC97Aar
	OTi54gvFbcREGPbpEJsvX4cJJ5/LJTRc90PI+0pE8aDGMzdp4TFKsXcfspBxx3kzWPEFXvdGNfC
	N9iBQusemoZutkkjdNy0grOczzyqhtFRDsmWLS1DvXWejIPqYNY87hhA8B5hNs6xhAAIhvOVL0/
	7msDOCpcBsk+555NlEE2QgM27YgHfK9uIU/efQX4ZOS6GT2788Nn7/nmZuEPViswxI7eb7asxn8
	cGuhm7sIIzEQ7pW3RCN2F4AOvFTdTUqYc2C65pIC3LfDl76tu35uOCDj6Kqhr3U7oj1YKi/NTcQ
	40V2KRNLwMmXOzHVRjOhuy3Qg/zAEZGlD6sI=
X-Received: by 2002:a05:620a:1722:b0:92e:d1e1:8300 with SMTP id af79cd13be357-92ed7964e63mr433312585a.3.1783621021910;
        Thu, 09 Jul 2026 11:17:01 -0700 (PDT)
X-Received: by 2002:a05:620a:1722:b0:92e:d1e1:8300 with SMTP id af79cd13be357-92ed7964e63mr433308085a.3.1783621021398;
        Thu, 09 Jul 2026 11:17:01 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15bc428775sm441974366b.6.2026.07.09.11.16.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 11:17:00 -0700 (PDT)
Message-ID: <db6c35f7-b2d2-490b-b2ed-4805eb0a967b@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 20:16:57 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/6] arm64: dts: qcom: ipq5018: add node required for
 Bluetooth support
To: george.moussalem@outlook.com, Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260709-ipq5018-bluetooth-v5-0-e476c41f03b8@outlook.com>
 <20260709-ipq5018-bluetooth-v5-5-e476c41f03b8@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260709-ipq5018-bluetooth-v5-5-e476c41f03b8@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: gyFy4xseCxSMPDiapfH4DfmwCXeDv9qW
X-Proofpoint-GUID: gyFy4xseCxSMPDiapfH4DfmwCXeDv9qW
X-Authority-Analysis: v=2.4 cv=TPh1jVla c=1 sm=1 tr=0 ts=6a4fe59f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=mz1jdwAY7f1nGK1u_T4A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE3OSBTYWx0ZWRfXxoKq6Mvf1GQ4
 GicLo8ytcc/D0GGSMHjQ86raR5yfWGRyhlqQQpwjSMFGEwlD6h4v4icjsgsi3A922WY9ZPCczH7
 xR6+vTHml3St9TqvjqUH5Wzk2Q9/pRw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE3OSBTYWx0ZWRfX8ySOodjMxME/
 58xm1MGDlPOExCoOEfLb0szRs+bEmbfpm57t+3gBKO3+JmHOtW1Lxb7N4E12QCEOC9NP6eYotR/
 H6oOeyKG5DijMNtQME/BMcRWzkFWxnnVXrxg7CaqTFwsrbr9phMsI4YcmnnAmKUkgW1dsd5nQDY
 FXgUUXt3BmGXrYe4X0yNBc0hrCBN+LXxr12iCcsQB1TF7+9J8eyJT7v7c/kO7Uwqv1ZDN5ndRyc
 2u/37W9TJkCkqkPyQma8oRGCoytd1PA2TXk5cLx93q1oBIz6cOiDeU5gIi8gbToG1fBdSLPol01
 cExZTbVQrTpN5Hlkud6JXkBcePaQBtOIUg9VrL5A9oLcqKFkrdkr78wJnMiJHu/Ifsvi1g1DGzs
 tgPx2hHYy3+tTuraPmjcrYi5bqIbsRnOZbiK/nJpwC9n8N9+POMPHAA+rZKtKpOr6PmyHxff9Xf
 LLBNX4qZlxCV/SyiyIg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090179
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-118077-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[outlook.com,kernel.org,holtmann.org,gmail.com,pengutronix.de];
	FORGED_RECIPIENTS(0.00)[m:george.moussalem@outlook.com,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:p.zabel@pengutronix.de,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:luizdentz@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,outlook.com:email];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
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
X-Rspamd-Queue-Id: 044407342F1

On 7/9/26 11:18 AM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Add node to enable Bluetooth support on the IPQ5018 platform.
> 
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5018.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> index 6f8004a22a1f..8c252fa3ff5b 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> @@ -453,6 +453,22 @@ tcsr: syscon@1937000 {
>  			reg = <0x01937000 0x21000>;
>  		};
>  
> +		bluetooth: bluetooth@7000000 {
> +			compatible = "qcom,ipq5018-bt";
> +			reg = <0x07000000 0x58000>;
> +
> +			firmware-name = "qca/bt_fw_patch.mbn";
> +
> +			clocks = <&gcc GCC_BTSS_LPO_CLK>;
> +			clock-names = "lpo";
> +			resets = <&gcc GCC_BTSS_BCR>;
> +
> +			qcom,ipc = <&apcs_glb 8 23>;
> +			interrupts = <GIC_SPI 162 IRQ_TYPE_EDGE_RISING>;
> +
> +			status = "disabled";

Since the firmware is unsigned, I think it could make sense to
enable this by default

any which way

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

