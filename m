Return-Path: <linux-arm-msm+bounces-106865-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGijIPuhAWpKgwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106865-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 11:31:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B3250AED7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 11:31:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6D75430AB089
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 09:20:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E0ED3BADB6;
	Mon, 11 May 2026 09:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JZHzioRb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AjIpo1Vo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855A63B27D0
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 09:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778491202; cv=none; b=LwCnK2+gwyvsN22tN4l/wDEa2QjPw4Fze1LR4kGA8i4CtbVp5CR/IPQ1yg3anrUv7Lk195PyPAxc6uSgqW22YdbzLL7BU/nNP7vLV7OZK3o/lV76gFB4+Y41KeCYj0odnj3R7uPmuiEN/Z/AFz54oQbsI63HtMoVs7NOXpRy7JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778491202; c=relaxed/simple;
	bh=5rJvbkYU1Cds+pHnp8IhQ0uuKul2+jUK58aooICkDOY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SnLtbHPoEK+/c4rQYLd5hCoas5AfzdbcN9y878truIVvT1jszp2W/wlUX3RsOno3OOdhSNJjWk1nOzLHR9FLdsw/Zedqpn5qZdHNQSijvBoJ5HymXde/lh1/oFuPfLpoBVcsZT1rQkTDt4d+tyv9rz3Ab7jcrIn3sCbW7CsiLDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JZHzioRb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AjIpo1Vo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B7APdL453387
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 09:19:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OH6IOw4LvlPC74wSQTZMRd3GjpTaSP1yMTLUPKXvH+A=; b=JZHzioRbuAdW9A+A
	F8Hse+myv4NsfFt4YYPguntfOc31JpA5/rXKY2ZSr14eAYLwBBNZTjxGk5VEFRNb
	5QreiuMHN9TZznIVfGMlorc75WzcmQMWhuZHRDkcFVfhmE67EgjyOuSIazEzztpv
	0Ton3xKyBzU04DEO3a+ib67bZiWbEfUhPwXvhZifAHlCJ+uCR8axVWt3feBDv/2S
	CNVULKaRCbhmJ61mAP6kRU/qDfTobp3IQRxdD2iuRfQI9t/jJrrDILBmdYKefj3F
	TOag/2UVn7V2ZYA8fx3fcLUO8L4lcZP/T93YRbkPRU8BtfQlentk/DQlN+0N1FHV
	jdgWCw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3ag6gewa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 09:19:59 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6337c4cd5e7so22923137.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 02:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778491199; x=1779095999; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OH6IOw4LvlPC74wSQTZMRd3GjpTaSP1yMTLUPKXvH+A=;
        b=AjIpo1VoXcvPjfFQwctha8aFjGC7/7PaAOSCxd09raSbZLle9DwxGu/iuID3d+VRI9
         HoAh3PDkfGPfl84Wiah9W5pK9ITSaY75Vo+7t4EoGElrjDF9onJstPlEiiaPqgouG19b
         vhTOzjvDOdikRUQ+ne+KGzh5xHEQ6ijbKC5KGs/bn/iO+Sz8FJO2aZY9GXXN1PJnqylz
         InhDGK3omjZdEu/dkrr7F6kzYMkiszXPVRWVRRHXAuLLz8WY8l0b9QBVGpcAlymDlv1+
         K77OgMipZ/eLO9BJvWfliKlouJsY230gWzpzkHwdmE0hC37yPPp3zCIDdr3Ey1xmZX/d
         ovpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778491199; x=1779095999;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OH6IOw4LvlPC74wSQTZMRd3GjpTaSP1yMTLUPKXvH+A=;
        b=bJXbrjhPyvVAfsAH1NHlwZUUY8aEgmsKThHkK26Ea/NFrgZKQefOU0win0oJr55LS2
         mgVEEqBHXBeoIuurzo2BxzEPwVD8UtUrP9z+9W7AHdCgYxyK12chlWXJQPZNVJGBfxdq
         REsLlBI3sKisfP08q3oDwy3ABnJZ2t3a354SV3WYnOqpt2an1eV70+3o77H+I5UdjqW4
         eiJa3aExW1ctYMj/zt7r7SjjrAGT5LjXvISYFfMMyytlFwVdZSPK8psSTV8QS8XCV5SQ
         owc7lKvQkRbiZ7MCK4f969/+o9cmz0aAG7hACfibN/jx9STjJT5oYoX6y1b5P9VquU7v
         bnwg==
X-Gm-Message-State: AOJu0Yyx+i7Z6v1hGekARNwi2BPjOk6fFTITuUyKSeWilNw1FfRm6c1n
	Xr7aEh3kWiWuMqb3fsgMarO0J7lKkOL6zoSIunbushobnMeQJz9GKJlwGYqQAoKP/yKkVi6Nhzf
	b7LMxcGK04OjdaMvB0ZYfAob3J6a2yS+XuOHnr3c1wyKZJXg4IRfxFRRpy5Dird6+gdS9
X-Gm-Gg: Acq92OHhPjxHbWkqYrg3BULDEvNU+T6SRi5danCh//Ctcf6phv5v7AVo5hujHV5LOPa
	5yRww9q+KdFENJtrC4fQkkIfhnBZdRysPknqhNl1HN/W+juy+QMqPeVJXNixJWCF4U2kz+eAdXu
	JsdHgEG+jRgDubVGxQSEpYJdj8Ci2KDthgyoo85EriFkS2quetVu2pw/rbCEN7UF2MnEsj3hn9D
	tNGuhqTBazzuKOvUfvxtaqhCpTM3/tEyxTQymlhYXbEslw15zCrg/7PiEd69e89+sQfpIpGH/8Z
	f528PrOTAUcsX+3orXE/X/hSuRHhwlf3sjnk1uuFPIkXd+Ve0nwyXULRkPzG9lppq4O+POVFxKW
	kYEYe0Ml+SDGZvGGpeucsqVEJZk/6J4Mi0cySnh8X4H6bbhkr94DukdMs5dJF1psl0uUmh9ARyW
	68hoo=
X-Received: by 2002:a05:6102:5112:b0:632:c8af:8a8c with SMTP id ada2fe7eead31-632c8af8ef7mr977098137.2.1778491198799;
        Mon, 11 May 2026 02:19:58 -0700 (PDT)
X-Received: by 2002:a05:6102:5112:b0:632:c8af:8a8c with SMTP id ada2fe7eead31-632c8af8ef7mr977090137.2.1778491198360;
        Mon, 11 May 2026 02:19:58 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcac3a7fe13sm462890566b.31.2026.05.11.02.19.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 02:19:57 -0700 (PDT)
Message-ID: <846c41a5-8f6c-468a-bcc1-d8140051d0de@oss.qualcomm.com>
Date: Mon, 11 May 2026 11:19:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: add basic devicetree for Ayaneo
 Pocket DS gaming console
To: azkali.limited@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Teguh Sobirin <teguh@sobir.in>
References: <20260510-pocketds-v1-0-cf05acec06af@gmail.com>
 <20260510-pocketds-v1-2-cf05acec06af@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260510-pocketds-v1-2-cf05acec06af@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fOsJG5ae c=1 sm=1 tr=0 ts=6a019f3f cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=UeHltZ2LXldOZfv8U84A:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDEwMiBTYWx0ZWRfX4NWZQxtwXadD
 Q2KAdS0ZaYE0kKbHndqxNmou1xeFScM/BmN/Xh4BR7NNok/smpa/6Ze8DkvxwdvEZ4xl3u86Swc
 sooHy797bzGyyBVZi3BzZ8b+J+3BOtVOWJwRTOuE72LVwPO4N1rAZxAwn+mJNuAT6XO6gaLKqIX
 sN44ovlTwvY66mOXdW3je2B9uw1H1ISiu9KrYuCSbnhqou1fwCkE9vFH3aFJ9OMBRyxXC1jwQbY
 VnBefxaydcpt66PjeUtb4AfEXRyoN64MGsrdO5MIamX1cGuRS7LS0W7KqxODoJFCPLpoDMPZelz
 j1QBH9rogaNcPWXycMhcR/5TkvE0kxbUWpgcd5narXZ99dwWVm5gdLdnyk3FlICl++Ip6H3wxsh
 BQAJ5zyBE0ia2uvsJSvvhpnzYjdKg/bViKiJHKcE5SfAf88s0xjBnwvUgVYtfAO7D0PA1sa5gWy
 F8SZ94q7BZbP1DVzmqw==
X-Proofpoint-GUID: wfwDX2-ymEpV4pLq04UqpTsCw1M4Joxj
X-Proofpoint-ORIG-GUID: wfwDX2-ymEpV4pLq04UqpTsCw1M4Joxj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110102
X-Rspamd-Queue-Id: 06B3250AED7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-106865-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,b8000000:email,qualcomm.com:dkim,5d:email];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/10/26 6:05 PM, Alexandre Hamamdjian via B4 Relay wrote:
> From: Teguh Sobirin <teguh@sobir.in>
> 
> Add initial device tree support for the Ayaneo Pocket DS gaming
> console based on the Qualcomm QCS8550 platform.
> 
> The board file is split into qcs8550-ayaneo-pocket-common.dtsi and
> qcs8550-ayaneo-pocketds.dts in anticipation of additional boards in
> the same family that share the QCS8550 base. Only the Pocket DS has
> been verified on hardware so far; the shared dtsi is intended to pick
> up sibling boards as they are submitted.
> 
> Co-developed-by: Alexandre Hamamdjian <azkali.limited@gmail.com>
> Signed-off-by: Alexandre Hamamdjian <azkali.limited@gmail.com>
> Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> ---

[...]

> +		splash_region: splash_region@b8000000 {

underscores in node names are frowned  upon

> +			reg = <0x0 0xb8000000 0x0 0x2b00000>;
> +			label = "cont_splash_region";

Is this label any useful?

> +			no-map;
> +		};
> +	};
> +
> +	sound {
> +		status = "okay";

It's already 'okay' if previously not disabled, please drop this line


> +		compatible = "qcom,sm8550-sndcard", "qcom,sm8450-sndcard";
> +		model = "SM8550-APS";
> +		audio-routing = "SpkrLeft IN", "WSA_SPK1 OUT",
> +				"SpkrRight IN", "WSA_SPK2 OUT",
> +				"VA DMIC0", "vdd-micb",
> +				"VA DMIC1", "vdd-micb";
> +
> +		wsa-dai-link {
> +			link-name = "WSA Playback";
> +
> +			cpu {

'co'dec < 'cp'u < 'p'latform

> +				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
> +			};
> +
> +			codec {
> +				sound-dai = <&spk_amp_l>,
> +					<&spk_amp_r>,
> +					<&swr0 0>,
> +					<&lpass_wsamacro 0>;

Please align these entries

[...]

> +	thermal-zones {
> +		cpuss0-thermal {

You should really be overriding nodes by &labels, this is fragile as-is,
since even if someone deletes the thermal zone nodes, DTC will happily
compile this (and it won't work)

> +			polling-delay = <200>;
> +			trips {

Let's add an \n between the last property and the followng subnodes

> +				cpuss0_fan0: trip-point2 {
> +					temperature = <40000>;
> +					hysteresis = <3000>;
> +					type = "passive";
> +					};

Please remove the extra \t here and separate subsequent nodes
with a \n

[...]

> +	vdd_fan_5v0: vdd-fan-5v0-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vdd_fan_5v0";
> +
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +
> +		gpio = <&tlmm 31 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&fan_pwr_active>;

property-n
property-names

file-wide, please

> +
> +		regulator-state-mem {
> +			regulator-off-in-suspend;
> +		};
> +	};
> +
> +	vph_pwr: regulator-vph-pwr {
> +		compatible = "regulator-fixed";
> +		regulator-name = "  vph_pwr";

stray spaces after "


> +&gpu {
> +	status = "okay";
> +
> +	zap-shader {

Please use the &gpu_zap_shader label to override

> +		firmware-name = "qcom/sm8550/a740_zap.mbn";
> +	};
> +};
> +
> +&gpu_opp_table {
> +	/* Additional speedbin for Adreno A32
> +	 *	719000000  RPMH_REGULATOR_LEVEL_SVS_L2
> +	 *	746000000 RPMH_REGULATOR_LEVEL_NOM
> +	 *	794000000 RPMH_REGULATOR_LEVEL_NOM_L1
> +	 *	827000000 RPMH_REGULATOR_LEVEL_TURBO
> +	 *	860000000 RPMH_REGULATOR_LEVEL_TURBO_L1
> +	 *	1000000000 RPMH_REGULATOR_LEVEL_TURBO_L2
> +	 */
> +	opp-719000000 {
> +		opp-hz = /bits/ 64 <719000000>;
> +		opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
> +		opp-peak-kBps = <10687500>; // Level 7

Let's drop these inline comments

[...]

> +&mdss_dsi0 {
> +	vdda-supply = <&vreg_l3e_1p2>;
> +	status = "okay";

Please keep an \n before 'status'

[...]

> +&mdss_dp0_out {
> +	data-lanes = <0 1>;
> +};

Only 2 lanes? Are the other 2 not wired up?


> +
> +&pcie0 {
> +	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
> +	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
> +
> +	max-link-speed = <2>;

Are there issues with Gen3-speed links?

[...]

> +&i2c2 {
> +	clock-frequency = <400000>;
> +	status = "okay";
> +
> +	touchscreen@5d {
> +		reg = <0x5d>;
> +		compatible = "goodix,gt911";
> +
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <39 IRQ_TYPE_EDGE_FALLING>;
> +
> +		reset-gpios = <&tlmm 38 GPIO_ACTIVE_HIGH>;
> +		irq-gpios = <&tlmm 39 GPIO_ACTIVE_HIGH>;
> +		VDDIO-supply = <&vdd_ts>;
> +
> +		touchscreen-size-x = <768>;
> +		touchscreen-size-y = <1024>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&ts2_reset>, <&ts2_irq>;
> +
> +	};

Stray \n above

Does userspace somehow map these touchpanels to the right display,
or do you need to bind them somehow?

Konrad

