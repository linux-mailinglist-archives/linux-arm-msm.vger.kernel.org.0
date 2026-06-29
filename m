Return-Path: <linux-arm-msm+bounces-114986-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id d5aLIb1PQmpo4gkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114986-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:58:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F7B6D91F7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:58:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=INzYJgpF;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=cgqNTOBl;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114986-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114986-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 037AC3039031
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 10:54:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A51823644C1;
	Mon, 29 Jun 2026 10:54:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68AA63630BA
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:54:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782730493; cv=none; b=lr8sg4H/t82HFxbvlhEaDoTgSk/iTOwlvUkxSMR29irXsP0a7j3Q+8on6uO+7rizYffs4vap9XKF84V3mjgSc1bqOOtrrgtTEmUJiUebaLnC8ei228NaPfl0WOg7j6bsvsQb0u80pahP//ILuLCweB4bFde/+YB9AsHdSdfjAvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782730493; c=relaxed/simple;
	bh=Bq5JxmM2ATw+jC5PkN78dIYvyr7OSaJ+wBoWkgB/pmA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nlEp1m+yWp08CLxaz/mDIvj1ycNUGiaui9qMCecQdqvBGJ6HXq5Z8YCTyhEMyp8KVXdQIdDjfKWOPgLu8yn/RBT4culHEy0TWXQukQ69SoMYe2EJxN7PWEsvsYv22jX9n59s/MxhOAcTvhfNN178LGwocdZJa0TM0WIxPTzIfVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=INzYJgpF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cgqNTOBl; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TASu0m2640872
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:54:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZIVU6P4VYTSnD8r2ghOco7OpX+x7/XaQf8n6G5cWtwA=; b=INzYJgpF+O8Og3B6
	z0H938EDIuxpBCm8TQAGFrSY/RhptvpFmBtLjDDKZHlXAwe4AVUqcOZFDf3nuryH
	1O26WdsmEYNsAhtDa5rPobbeTquWX6njyPUXfy+dbIh5QPSLH8uxQYIKUocxZ1rf
	QKJKEqmMSk9uIVEb+4/P0Covx3PZUCXCKMLQ6RrrL/rb1nZV09O/SeYz37XYt3gI
	yIiAnCeWrWKaPaPea4Oxe2Nyv0zxlLktOmF0IKHo1SqvTl7Hkx6yUYxdwaYlkBcF
	fH/RWn//w6pobD57fcjzKB+jIQbrpa1ZjP00MAXznrCLtYVEwm8GO/p/1swQwrj0
	DgA0bg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3n5s0m00-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:54:51 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c890bac374eso3527597a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 03:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782730491; x=1783335291; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZIVU6P4VYTSnD8r2ghOco7OpX+x7/XaQf8n6G5cWtwA=;
        b=cgqNTOBlP1hpfO29/eR/o+pMmKeB2VRZeQ+MOms1g152HHInbD/qFnzFPguhHFCl89
         jXEPORZPhwrs7nPYmxQUqVPrUZ13bljrA0JkRdaTvxcun7ZFmf60IyQu14Gkojm0BFVZ
         btNED4ZV3z0udMYMPj2a6QO7Ov8oGkJ5kLvpjsyZwr4Fn4rlb2bsGH7wRMAywj0p+54T
         8Gj3S+08dlVu+uG3u9txlyjA4HO9NsmWEBFzF6w3fRB57E66oFH19eVLRP5O5skMfDGH
         oAH9bM97ijjj+V3fPyxTcgikbo4pWR8CFb4B/Tn/t0JXh66JsCzm7ZaAAxzN2KMRTroS
         jZHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782730491; x=1783335291;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZIVU6P4VYTSnD8r2ghOco7OpX+x7/XaQf8n6G5cWtwA=;
        b=dz+iqO+QjGPsX5PwWWjk72S6hfa4qtQhyJeLpjxxaBimaz8zqhuSsC4Ud55Q/dLe+s
         pDLFqbBJUrrEAIGA7iHH+GOqqSRoJYvP1VazokJ7RmeHghfQDjOksXoqfRV27Y+UB5MP
         fiL5LASXzmjnIngUR9/589f0OCC/qJdGA/2EvYnKrFdzYPR/AKVILBKceM6GG1Cj0yBl
         7BtxawUpjThfClDTW/J9nUd5UCeyBIcW68f2R4RxMZW6b14bIe34zYzlvY3U6v9Jyl6k
         npFZ9tBsBV0zh+I2ed6QJCWY2PZ3WekhFqMBnmRZIop9x9dDXlQc334J6YH4WbxMGGWn
         HrqQ==
X-Forwarded-Encrypted: i=1; AHgh+RrMrz9jAuSLaHZdJXnr1gP0kulk90phQSmGq9tXtOJdTxpcSHqjn5VC1plDDJHId2p0jd4YkYoPeNu8UqTO@vger.kernel.org
X-Gm-Message-State: AOJu0YzbSMy61m8rY6M2S28/0an4jfSdonF9vQr8FQVgArso2TZtR48U
	dwu0dFTgI4A1FHpXW+3NpB7xKDoQP1DupH24ANkE20KRRmVnhVO4EvXncYrW+gxWlmn1YzRK/qH
	SZAHJi/nNtmpnWZEjaIhlqxSMfq6Z4ksdWYm9POFV3YOC2+oi48lNZ2rU1JdcE3KEIyCM
X-Gm-Gg: AfdE7clBprMSvCxP4Le1t9K56eclc3rFUtQuRQMj45GqFJ2UvJ0WoKE248QsmCQckEk
	Wgd8Vthuf4toTbTB+HTE8v91CsLJab3KrTb+/jUQf8gVAVL/CR52buJw3LOswe6hJmOh3CepI/h
	+MkQuok8ZCcaLE8D+/hGsHogUNX26aPVDsa/NYFu/385esmi+ktOkOBALg1sEp9XA/dwd8eK+fj
	C3kSIo1vCHMhwVF4IsSCl2/lDEZ6SKxFpSZqp84bHmTAaE3O11Kv4Q+bxuS2pHCST50d7JtKWat
	jK8vdN090APP7qBh2kKFyG4VpJz2hy5iKkpfcEk+d3PUhzIx1kPeCAhomiPpipOkLVBEosL165F
	4fV4vKN2J7LUWhHoDXTotKTqn/EkBwIwkYG3PCx4Y
X-Received: by 2002:a05:6a00:6c88:b0:845:d111:c68f with SMTP id d2e1a72fcca58-845d111d3f3mr8346124b3a.1.1782730490893;
        Mon, 29 Jun 2026 03:54:50 -0700 (PDT)
X-Received: by 2002:a05:6a00:6c88:b0:845:d111:c68f with SMTP id d2e1a72fcca58-845d111d3f3mr8346100b3a.1.1782730490354;
        Mon, 29 Jun 2026 03:54:50 -0700 (PDT)
Received: from [10.206.100.243] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84781063884sm2108200b3a.24.2026.06.29.03.54.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 03:54:49 -0700 (PDT)
Message-ID: <f46b78cb-cee7-46ea-985c-6fb1c2f21071@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 16:24:44 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] arm64: dts: qcom: shikra-cqm-evk: Enable display and
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
 <20260627-shikra-dt-changes-v1-2-449a402673d0@oss.qualcomm.com>
 <ypic3vctnnci7mkv4bg62n5xsgzpd4e3mam5kt2nvt7dxzyim4@zdzpup6uydtl>
Content-Language: en-US
From: Arpit Saini <arpit.saini@oss.qualcomm.com>
In-Reply-To: <ypic3vctnnci7mkv4bg62n5xsgzpd4e3mam5kt2nvt7dxzyim4@zdzpup6uydtl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4OCBTYWx0ZWRfX1pnzeELkJrRS
 +lARDVIDROT8ocZln5n7aG+1ZklYF5BUk64goft736kIYPOLc0OZFYbnaw5qirhG0LZsabYt6fN
 irWR9wQaXbE3TP9MFAG3KFIivuEF1lQ=
X-Proofpoint-ORIG-GUID: ChkVUElLhZzC4sXNuxRMY8oQs_GCrBi0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4OCBTYWx0ZWRfXxkjKn8HlksQ1
 kRzzHwRDq58/nks/olS1FSWt4rvCpCfMe3ox3ROvr+KIfL4YlA6qfvPFpMX0ToQbHnPybxKTKwz
 ZqiYg47F9o0cVt1p2CdTwgokUJw7S7eKYf1drNM6sv1Iug+yWZK6cV7D9UHQZ7LLSK8TGbFvIf2
 X08FttH//khUvzGYrPgc35rx4Nk4xKs8crk4hQzbblwbd/P/hrDqi0I/1yafMa3VNuGJVSbKByS
 t4UHl1v8c+sEgosrmPbvqYQKpuIGPxB894RKRchcab5/fbUf3mLEWQKVNP9Adtg6uX/03KRh1i8
 RqR3neBCBYHS5+Zo0o4Civ0OEb2FboBxzIeROe6dzRHFz3OcdDft8hMSfZBnld7fl6OWCMjaH5d
 8+pLUrBkNOdxkxeYGNL4GkhCPDO6IVzuARsPOuaHc+NoJJXvk2bWu6/tU7N8Wxg9/N2WiKe/U93
 t8O22WKHMZ9W11+KY5A==
X-Authority-Analysis: v=2.4 cv=NZzWEWD4 c=1 sm=1 tr=0 ts=6a424efb cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=ygE_Ldiqm4PXnjN6XKYA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: ChkVUElLhZzC4sXNuxRMY8oQs_GCrBi0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290088
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-114986-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[arpit.saini@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:nabige.aala@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mohit.dsor@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arpit.saini@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D7F7B6D91F7

Hi Dmitry,

On 6/28/2026 6:00 PM, Dmitry Baryshkov wrote:
> On Sat, Jun 27, 2026 at 03:31:36PM +0530, Nabige Aala wrote:
>> From: Arpit Saini <arpit.saini@oss.qualcomm.com>
>>
>> Enable the Shikra MDSS display subsystem on the Shikra CQM EVK
>> board and add the DLC0697 MIPI DSI display panel node.
>> Pin pm4125_l5 to 1.232V with regulator-allow-set-load
>> for DSI PHY PLL stability.
>>
>> Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 104 ++++++++++++++++++++++++++++
>>   1 file changed, 104 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
>> index 683b5245923b..c9ea093cd8ca 100644
>> --- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
>> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
>> @@ -23,6 +23,18 @@ chosen {
>>   		stdout-path = "serial0:115200n8";
>>   	};
>>   
>> +	lcd_bias: regulator-lcd-bias {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "lcd_bias";
>> +		regulator-min-microvolt = <3300000>;
>> +		regulator-max-microvolt = <3300000>;
>> +		vin-supply = <&pm4125_l17>;
>> +		gpio = <&tlmm 151 GPIO_ACTIVE_HIGH>;
>> +		enable-active-high;
>> +		pinctrl-0 = <&lcd_bias_en>;
>> +		pinctrl-names = "default";
>> +	};
>> +
>>   	wcn3988-pmu {
>>   		compatible = "qcom,wcn3988-pmu";
>>   
>> @@ -60,6 +72,52 @@ vreg_pmu_ch1: ldo4 {
>>   	};
>>   };
>>   
>> +&mdss {
>> +	status = "okay";
>> +};
>> +
>> +&mdss_dsi0 {
>> +	vdda-supply = <&pm4125_l5>;
>> +	status = "okay";
> Empty lines before the status property, please.

Ack, will update.


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
> AVEE is typically the negative / ground supply. How can it be supplied
> by the same regulator as AVDD?

Ack , I will update this using two seperate regulator-fixed nodes, 
vreg_disp_p and vreg_disp_n

as defined in schematics.

Thanks for pointing out.

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
>> +&mdss_dsi0_out {
>> +	remote-endpoint = <&panel_in>;
>> +	data-lanes = <0 1 2 3>;
>> +};
>> +
>> +&mdss_dsi0_phy {
>> +	status = "okay";
>> +};
>> +
>> +&pm4125_l5 {
>> +	/* DSI VDDA - must be at NOM voltage for PHY PLL lock */
>> +	regulator-min-microvolt = <1232000>;
>> +	regulator-max-microvolt = <1232000>;
>> +	regulator-allow-set-load;
>> +};
>> +
>>   &remoteproc_cdsp {
>>   	firmware-name = "qcom/shikra/cdsp.mbn";
>>   
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
>> +
>> +	panel_bl_en: panel-bl-en-state {
>> +		pins = "gpio91";
>> +		function = "gpio";
>> +		drive-strength = <2>;
>> +		bias-disable;
>> +		output-high;
> I think, recent recommendation is to sort these entries by the pin
> number.

Ack, will update.


>> +	};
>> +
>> +	panel_bl_en_suspend: panel-bl-en-suspend-state {
>> +		pins = "gpio91";
>> +		function = "gpio";
>> +		drive-strength = <2>;
>> +		bias-pull-down;
>> +		output-low;
>> +	};
>> +
>> +	panel_rst_n: panel-rst-n-state {
>> +		pins = "gpio3";
>> +		function = "gpio";
>> +		drive-strength = <8>;
>> +		bias-disable;
>> +	};
>> +
>> +	panel_rst_n_suspend: panel-rst-n-suspend-state {
>> +		pins = "gpio3";
>> +		function = "gpio";
>> +		drive-strength = <2>;
>> +		bias-pull-down;
>> +	};
>> +
>> +	panel_te_pin: panel-te-pin-state {
>> +		pins = "gpio86";
>> +		function = "mdp_vsync_p";
>> +		drive-strength = <2>;
>> +		bias-pull-down;
>> +	};
>> +};
>>
>> -- 
>> 2.34.1
>>

