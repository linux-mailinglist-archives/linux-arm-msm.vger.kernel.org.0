Return-Path: <linux-arm-msm+bounces-115016-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Y/s3HU9aQmoW5QkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115016-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 13:43:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E28316D990B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 13:43:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=oVRVM9tO;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=AQBi+otD;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115016-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115016-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7361A305F3C6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 11:39:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89AF3367B98;
	Mon, 29 Jun 2026 11:39:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6B33E1D01
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 11:39:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782733168; cv=none; b=Vg44dfUw79xwuPH2+dZ743xMj5GQZt7PdZGi7VzFkzKT+Oz3P/df89Mh8o2ibQdz5tdy3VgdAWmm/QzjUyKPAQBUvD/74DrolpsKRfiXeRcrEiUcYFz6C82tDpRPVSb+yNHPHYuCMor8rHMP9ciwP56MwWBKdPB97A12u4m/4B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782733168; c=relaxed/simple;
	bh=J0XiClPXF/GruK7GbwNvB/VtTanY8jzcS0ooQKpc7Ug=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l8qMhieYHNawCYbX55UgzF1KHvK6CSthLVyiC7pitvswwgGakQBjQ+cYT8ffNdxKf4R7y3Y5TF/bOYXSw+8iX1/vBzb1cjyZ02iEm4gBBajd/pgSHVDcr9mlWlaptG+0/oIPk3E+RcfE0R8uK5rVGTcKoYkA6Gfuxo1HkwXIbpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oVRVM9tO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AQBi+otD; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TASwLE2641481
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 11:39:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6R/KYOAgAacKor/IUNB4vBHVYiEq5b+dXGG95mHRtvA=; b=oVRVM9tOF16idNaG
	B4DQiE5aHsTo0A6PYZtdyI0VrJQFEIhECEMSAmob4OEIxuF85uvu4ka0jJ9/7F+T
	ozDUTE5XVaCA9KdMp7K3owSTbhFspQ/j6/FXQ3vai5buimqEekc+WsF0yB8B08m4
	VhmDWsTmCf9EBTuEv0F7eBXD+U1Ufzw1gH+3J4bI3KUAdu3NlycJv1c2TZ/TMT7A
	zntElCKvs2ztjqkWfzl14A3vHnzvS2j/g3Lyn1qpbiKNqg1yZ0Ld1oW69oPvQe6s
	kihIhohDzqwfNdkZ1YJSdXkyam3nF6sGhPPysna5yMM2+jd3ciCy2wkycn0AYypD
	bMaquQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nperkhy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 11:39:26 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-845bdb194ccso3466337b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 04:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782733166; x=1783337966; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6R/KYOAgAacKor/IUNB4vBHVYiEq5b+dXGG95mHRtvA=;
        b=AQBi+otDvCluMDv5OXDsVVkYbdklgPtjGjNazOpavCuI641/mooMk/vNCOsA/SEWY1
         wEoKl6G1+iCB27Qgj/IHt15qlH44Ia4COkhIh9ItxR468Hw6ugmcVVCPtP4ELm5+WsJd
         lSct3J7LP9oRA2P9mFB1dTpHS6rhONZF1LCBNUX0dIkHmseMMfIIwp4K99/JDVm3AzWN
         FKh6vAmU5KopR0jGyyCOsNCXJsUmglHiyfMaOIl7LcPgoePYNYuRe9R768ope6SaIduH
         0zKcEit0Z1SWvfJFmo5ad6zbBphOh/OJuSO17Us3Nd134o52mIB9/QKZvwVjlQ4a6vRc
         7l9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782733166; x=1783337966;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6R/KYOAgAacKor/IUNB4vBHVYiEq5b+dXGG95mHRtvA=;
        b=cj9kZO7EahnkTzoxF7vRC2KO8uQXFLtu4Z+uOjTdMFkAd9eapgZMbqPSIjYT1u5pyY
         UUyQAPNwHV9AIiaj2dVs9IfjaVIGwGLse/tC8XVBEbB6kUF+R6Mp57sKtK99+J51hf5z
         Lm7p6s17Qj4EmnLhX5yOXxSt7iD3JazJo8TEUZ9ltLFKNxxQvuX4IsmdusQiIqchyU3+
         DbZ8pBqmrBGSxuLeNf6AOxpPLR/3oofZOpJv05wALbdXXd2LWUSdo2oBWjplljACcABr
         lHQrsYJY+EE9OrS1z1MFjjT5zQt0dG/wh9Fm/ysWHauUiX3w3aqRbEInvei4T8942qzY
         ucWg==
X-Forwarded-Encrypted: i=1; AHgh+Ro8JV14qaIEQL0a1ImpDeA6sV4croLua5CkIF9TnqJ+py1SDmCmbV16tHwbRkFKnXfIn5kjhQd3Nt4YaULq@vger.kernel.org
X-Gm-Message-State: AOJu0YyFIrLKTrn3CSQ20B+Xfd1jBJescD0KSX8svqZfRzsQHUhOm/uG
	R65wCnRGV68iM3wzx1RpR+FHxKUOlcxC1Myw2U7sbPL9mqRkCAToVm4XCkaAskCa6QrLsW4grNp
	N3qSPJ3TJoIA+IaJRgEC0vVfU5fPZXTyI5kqU8+4+DIri4Ae5pXX6jPiKNVlOTn7Yo/C2Kxllw1
	Rc
X-Gm-Gg: AfdE7clDLRd3CXEMxItOni1h8QGhQiOp17dTXlM40TwMBPXXXdYg8GhQrcVxpQKhHB6
	2uaSapku99LIcIG+zl7XQ6rt/v6lMAxn8sIW1cfs0wfmsL4vyLqLQYorGABqsa3ylranbfqBxa9
	QwgDX0WfWC4K3dqWI3DwlTBzEtVo3C0k8MBYYiLYngxglMMJ+LUDo8Ona9cEcfKzwxREiGvkc0U
	6spppKiVUwLvU6swmR0yjeKNd9gta4iNElWm821OtK9Fr0zz7xcdi+AGQGMmVRYOVLTTEIBOcVS
	DqKobjWnZn1MNKkPKsprSVVrbQ0J9CS1bDm6LLX2VBq4oLHxxIpJbeBdzQJMOewW8ZsbpOZLyv/
	aA7rFa1lekZm25Z9O5BMGF2LbifoNVGCDpGCJAnHT
X-Received: by 2002:a05:6a00:2d2a:b0:845:c662:2be with SMTP id d2e1a72fcca58-845c66204d9mr11620953b3a.42.1782733165876;
        Mon, 29 Jun 2026 04:39:25 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d2a:b0:845:c662:2be with SMTP id d2e1a72fcca58-845c66204d9mr11620926b3a.42.1782733165387;
        Mon, 29 Jun 2026 04:39:25 -0700 (PDT)
Received: from [10.206.100.243] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a40d23ccsm12360132b3a.36.2026.06.29.04.39.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 04:39:24 -0700 (PDT)
Message-ID: <d1433484-f793-4e03-ae91-097f8d48fa53@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 17:09:19 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: shikra-cqs-evk: Enable display and
 add ili7807s panel
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mohit.dsor@oss.qualcomm.com
References: <20260627-shikra-dt-changes-v1-0-449a402673d0@oss.qualcomm.com>
 <20260627-shikra-dt-changes-v1-4-449a402673d0@oss.qualcomm.com>
 <6qf7fau4yfmyl7qaecwxbj6kegyawq6euovi7ewwuki57gtepv@57vioqyiladd>
Content-Language: en-US
From: Arpit Saini <arpit.saini@oss.qualcomm.com>
In-Reply-To: <6qf7fau4yfmyl7qaecwxbj6kegyawq6euovi7ewwuki57gtepv@57vioqyiladd>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA5NSBTYWx0ZWRfX4+xQk9rNUFis
 n0Ze4m6fU8jEypbQoSvVnrGSi25ryQg4bOvlMdAV6s4EZw6NfDt+RWB09IEY0SMQgAicvPd44m7
 9PuzIfBd8zSgc46VvFpCDaOKVeKJU1fhkI7lEYTOu2qS3i6UlkaW1NbLDnxzkL9rM/L3FEKWmcF
 6VVL1LJBRWbgA+Str78929swsZzk9hLyobZZBMnntcOfejUkrIXXJK1mflXYTMW7UO5SIe3I1qZ
 gIBerPQjfE8pTXrWZSwJQtcyggQiK84yxWK01vre+JAFYpfnKLr6UyseplkYzSPkB9TNBrZGL5J
 2RFWjHbQnkHtjiJPBFQ1QXlOzbacKxYTHT1e3RMRIjwHw1MJ/HfUuu3vLjI+Qb8CwI3ALh9Ck0d
 ZfznHTsfVcC/ceeSScYVNR5oxEOn/WvlPdhq3IYCY1L//CLGdO1rXb5qcRU7KyA3js1D5j50MP7
 5zmtamyw9gL9JrbLkKw==
X-Proofpoint-ORIG-GUID: oyP6oPY0mk3k_atjgshzIIj5m6mDUBOl
X-Authority-Analysis: v=2.4 cv=T6q8ifKQ c=1 sm=1 tr=0 ts=6a42596e cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=m8bqIFIvbyN3laQ-QhcA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA5NSBTYWx0ZWRfX7GuxMFS7eSlw
 NGNDB1a+gFb2fRGgIDK+safT9Repc89SC9x6P4Ja8Z4kTEo5DekMSVUKs02trjDbvT6wns5LHOc
 kgHIX5AmOmhtRZ3KOpQGHerYxh6Ce6g=
X-Proofpoint-GUID: oyP6oPY0mk3k_atjgshzIIj5m6mDUBOl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290095
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-115016-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[arpit.saini@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:nabige.aala@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mohit.dsor@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arpit.saini@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E28316D990B

Hi Dmitry,

On 6/28/2026 6:06 PM, Dmitry Baryshkov wrote:
> On Sat, Jun 27, 2026 at 03:31:38PM +0530, Nabige Aala wrote:
>> From: Arpit Saini <arpit.saini@oss.qualcomm.com>
>>
>> Enable the Shikra MDSS display subsystem on the Shikra CQS EVK
>> board and add the DLC0697 MIPI DSI display panel node.
>>
>> Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
> Missing SoB.

Ack.


>> ---
>>   arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 104 ++++++++++++++++++++++++++++
>>   1 file changed, 104 insertions(+)
>>
>> +&mdss_dsi0 {
>> +	vdda-supply = <&pm4125_l5>;
>> +	status = "okay";
>> +
>> +	panel@0 {
>> +		compatible = "dlc,dlc0697", "ilitek,ili7807s";
>> +		reg = <0>;
>> +
>> +		reset-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
>> +
>> +		vddi-supply = <&pm4125_l15>;
>> +		avdd-supply = <&lcd_bias>;
>> +		avee-supply = <&lcd_bias>;
> The same question regardin AVEE supply.
Ack, will update as two separate regulators.
>> +
>> +		pinctrl-0 = <&panel_bl_en &panel_rst_n &panel_te_pin>;
>> +		pinctrl-1 = <&panel_bl_en_suspend &panel_rst_n_suspend>;
>> +		pinctrl-names = "default", "sleep";
>> +
>> +		port {
>> +			panel_in: endpoint {
>> +				remote-endpoint = <&mdss_dsi0_out>;
>> +			};
>> +		};
>> +	};
>> +};
>> +
>> @@ -116,3 +174,49 @@ &wifi {
>>   
>>   	status = "okay";
>>   };
>> +
>> +&tlmm {
>> +	lcd_bias_en: lcd-bias-en-state {
>> +		pins = "gpio151";
>> +		function = "gpio";
>> +		drive-strength = <2>;
>> +		bias-disable;
>> +	};
> Order by the pin number.

Ack.

Thanks

Arpit


>
>> +
>> +	panel_bl_en: panel-bl-en-state {
>> +		pins = "gpio91";
>> +		function = "gpio";
>> +		drive-strength = <2>;
>> +		bias-disable;
>> +		output-high;
>> +	};
>> +

