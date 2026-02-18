Return-Path: <linux-arm-msm+bounces-93258-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CK1uO4iXlWk1SgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93258-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 11:42:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6886015592A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 11:42:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 04E9430156D8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 10:42:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02CA2301486;
	Wed, 18 Feb 2026 10:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HOCrC2tk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Is7JdY86"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8AF2BE7A7
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 10:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771411331; cv=none; b=rlAcLGzhzQ9tZhTUGx/ThgvX6jDk3iWisGTwRs0Vu3Fz7soL48qYDyHwm/DvDHGz/IJF6FRi3AiQ8h8JY2oVVdG4IsZxMWALzoAMth6jJXgXfMSxkvkxoilIkcFxL1L8uHFtFPbKVorbpToQgUs7JS8P7/fAUvyNDQw+CHZDYvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771411331; c=relaxed/simple;
	bh=j05/cxfltucXRwON8QSfjH8144PoGhffNAKPXlMCtjw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kfu9TCBnuc2vzTwvSGXNYUzQZDv9jeUBIaZk7GY76WMXHc6hQOokZuNkKuLVq/6Mr/c2LAd6SCu0KkHv2JtfSrO7n7yJMEadxgWjy0wtABljuYMfr8ZPqwOR6w0EEynRDfX9o8kfmn3xqIgRoIozyCW69IdmGZ92cnUvFdN/gjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HOCrC2tk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Is7JdY86; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61I8XDb53379857
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 10:42:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	50M2aZYa0M5or/awTAHouzvOMiiz02HpR0Cx2PU+naE=; b=HOCrC2tkGG1ZYOe6
	HcTDt/NxHg+C+q40RhtuyEMR4htzanaDOvS0TmE+6C+329+7zJaLMz5Rj03kJeUt
	gn3QiqoR+N5lzFpqWffPx7hVigKzjPhXjbqdyKWZtapUHfJhGjEBUJGOHrQCDdjx
	Nn55OJK4ajp1uEQH8Ayg6zOqSarnTqk1iCCw694m/apy11YDdds9wO58WjOt7bQ2
	QE0Z/sugrrfjJrdPF6wlZYNdL9/4fdWQVU3DiJU2hqn6ZsnZSW9E9JoA514DOngS
	RpKaD+vZf34hd+z8VFFEuhSCPgvyMYIJwjxJcxkToOg5ycjWQlRM3sfdWgJYMLzF
	USrYdA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ccxnyj3cm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 10:42:08 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89547ddf32bso39948856d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 02:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771411327; x=1772016127; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=50M2aZYa0M5or/awTAHouzvOMiiz02HpR0Cx2PU+naE=;
        b=Is7JdY868+ymInNH88zQ8rJdWpjC/5tKZH/ca+LXNRZGHorimOCg8fa1jEjI8jd8Z6
         3GmqN6GPOJsH0ITx75rbcWTSqe7fBEqIITMVb691g6fH6rCOdDjTm6PJN5BCgFEAHMtN
         y2U5Osu3JRgjBjmF08KyxRB3NYFE3XFzjFq5Eoh+HnolhH0qKERTjeW9OB7C1SpxfyoT
         Zf3YRCDj57UK8lPkf3cxuZXnHnqqsL1JAMtmZIcp5eGXK8i1/1AIjBIz9pfo98HGBKWc
         KWu/tmhJpHJq9UNZDBGb+hB9tkbgO0F5tGL6yKmPv5IF1xmodG8gNRIWSUXkRfTvZFXV
         osLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771411327; x=1772016127;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=50M2aZYa0M5or/awTAHouzvOMiiz02HpR0Cx2PU+naE=;
        b=U0RRaiSrcCrsVmsrz9MSpi5XY7KCNOvItFkKLxjvpV7YsGJoay11HEnNFRuWWmwizo
         JVIKL8WYciVglpHFt3Cq5xcUBVbtceUtEIOw9rNgSEufZvv6s0vrRkusblkDE/gzs/m7
         jyeYz4bxeSiSdP2Vc482vYgUwsYjnZRzsSTyTwfEMCUvk3kxCNgzMWt2ptCn/FveiEW0
         Pb4qTtRw+t7DHDBH6TRAsMTycssemDHK4j8AxPtdsPj9UDhyJte50xi+Y/+zG1S3594L
         jbkbF1GIL9Iqk2i5gt6MSc5OTHsWhIqa/bqALXCHk314ma4uVUPySAOg0TZFHfZMZ/Jh
         30aQ==
X-Gm-Message-State: AOJu0YzkW2g4SP2ZOaTrEACN0Ktxom8Zi8wuF9wPmtYD+lQiF3KdNe9p
	jWRbg5UqBQALAh5l4j8MCVPXU5u/mIFE851lj0BADhjS1N+WQFwaOdY/rUpt7sA8aB3FFR9qXhq
	qulXoMB1XkKtlM61Vb6S73yJGviJv1o5suygWElwTXsXRyOWNyZadhaHKTLsxGdO4ZPjE
X-Gm-Gg: AZuq6aI2SUqh3O4qDXBGok5ZuBMatpJ01aR7O/pPcJazf0yRnLryu2l/D+cURmKFxnp
	b+hQjmYBuMNW1qiGaOH5gwWIbEE7sVg8tdgTfo71GOcSCNzIVP/0QOODpKdKlvTJSof8mBGzIJs
	XCYR0856tpxzlWOtdWCucvs1OS5Y5rWeXv/AB4/XvDgr1leUTJncrg4EhSsm0VxDgzAVHUW/His
	AQZh3SdkAf1hsRZ+/9SQg2hIzE+ZMH4QZZMzsScQ1/jvlnQzicvsL2qxSOeO+garfwESWrZPxdY
	5Y0HSyF60bCOolK2dTpX3KKWZCfVxLcFP/R34QK2JFYhYwR3mBccNYDaMAqxSJGer3y+5cv1DPJ
	OGP1hmlXkD2qpiGow/ZcpsB4PWsIteuom+UVUwaNOKKBBrvMNaQYlXxr+8cQ3fp0QMPXy0nafwx
	mOjmc=
X-Received: by 2002:a0c:e002:0:b0:895:3b2c:7708 with SMTP id 6a1803df08f44-897346241b8mr173741496d6.0.1771411327294;
        Wed, 18 Feb 2026 02:42:07 -0800 (PST)
X-Received: by 2002:a0c:e002:0:b0:895:3b2c:7708 with SMTP id 6a1803df08f44-897346241b8mr173741416d6.0.1771411326901;
        Wed, 18 Feb 2026 02:42:06 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65bad3e390bsm2923880a12.17.2026.02.18.02.42.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Feb 2026 02:42:06 -0800 (PST)
Message-ID: <b96b9752-6432-419f-b49b-a34416e691a8@oss.qualcomm.com>
Date: Wed, 18 Feb 2026 11:42:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: add device tree for SDM845-HDK
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260217-sdm845-hdk-v1-0-866f1965fef7@oss.qualcomm.com>
 <20260217-sdm845-hdk-v1-4-866f1965fef7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260217-sdm845-hdk-v1-4-866f1965fef7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: fEh-d_ZR2k7p1iweyaFuZi47i4K6Tkp6
X-Authority-Analysis: v=2.4 cv=Do5bOW/+ c=1 sm=1 tr=0 ts=69959780 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=-UWIQ00ppj3yYQeD8CsA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: fEh-d_ZR2k7p1iweyaFuZi47i4K6Tkp6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDA5NSBTYWx0ZWRfX+GkfsM2dvtsV
 HjgfXIc8ctGe1qdzBsoj/hhyiaOgCsNa1yEFyrGtSxv4qe2KBzMuufwMgT6SQWoGcySkQlPC6iQ
 2KBGNxKniy2/TdtPoDUOzhU7ethghEDyoVuz4btoXr1NL18CamvlOrLI0Ky/608JcILRcrNRf0T
 /EmmJmMW0Mybk0IZOfpRe9zEAZdv9A8Y6Za4vBAi7YOF+gVFmoiD7glEGt7eAZcGyo8LpR1QuO/
 7saSCO/atnB8g/ycTIy0crfyPPXcEsh+P2dHlRX8RSzOQKwVWtpJDgiK64oehXqvd+rgmm5N5Qo
 h3D09RE/WsjLqpcx9fAF19G9ECHv3MXqGlcULl9YLUSDHrEBkypGqX37iqldfg9KWFTud21Cq5/
 E+cxuL4k/fqGzHczP3Rm8bwZdKRjbn+e+NLGxb8DEPz+QmreFoFJ5ZKm8mbr+t/32Wyuiy6+W+q
 /OZ0G3tBlg6uHfq33EA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-18_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602180095
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93258-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.4:email,0.0.0.3:email,0.0.0.5:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6886015592A
X-Rspamd-Action: no action

On 2/17/26 10:20 PM, Dmitry Baryshkov wrote:
> Add device tree for the Qualcomm / Lantronix SDM845 HDK. It is the
> development platform using the modem-less (SDA845) SoC, optional onboard
> DSI panel and a rich set of connectors.
> 
> Working:
> - HDMI display
> - uSD, UFS, USB
> - DSPs, WiFi, BT
> - Buttons, LEDs
> 
> Not working or not tested:
> - DisplayPort - TCPM not supported for this PMIC
> - WiGig - requires power sequencing driver, doesn't work with the
>   current in-kernel driver
> - Audio
> - FingerPrint
> - USIM
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

[...]

> +	gpio-keys {
> +		compatible = "gpio-keys";
> +		autorepeat;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&home_pin_a>, <&vol_up_pin_a>;

property-n
property-names

in this order, file-wide, please

[...]

> +&cluster_sleep_0 {
> +	/* default, 0x4100c244, kills the board */
> +	arm,psci-suspend-param = <0x41008244>;
> +};

Does crashdump say anything interesting?

[...]

> +&mdss_dsi1_phy {
> +	vdds-supply = <&vreg_s6a_0p8>;
> +	status = "okay";

Let's uniformly keep a \n above 'status'

[...]

> +&pm8998_gpios {
> +	home_pin_a: home-active-state {
> +		pins = "gpio6";

gpio5 here

[...]

> +&pmi8998_lpg {
> +	status = "okay";
> +
> +	qcom,power-source = <1>;
> +
> +	led@3 {
> +		reg = <3>;
> +		color = <LED_COLOR_ID_BLUE>;
> +		function = LED_FUNCTION_BLUETOOTH;
> +		linux,default-trigger = "bluetooth-power";
> +	};
> +
> +	led@4 {
> +		reg = <4>;
> +		color = <LED_COLOR_ID_GREEN>;
> +		function = LED_FUNCTION_HEARTBEAT;
> +		linux,default-trigger = "heartbeat";
> +		function-enumerator = <2>;

function-enumerators only seem necessary when the same color&func
combo is registered multiple times

> +	};
> +
> +	led@5 {
> +		reg = <5>;
> +		color = <LED_COLOR_ID_RED>;
> +		function = LED_FUNCTION_INDICATOR;
> +		function-enumerator = <1>;

panic-indicator?

> +	};
> +};
> +
> +&pmi8998_wled {
> +	status = "disabled";
> +};

It's already disabled

> +
> +&qupv3_id_0 {
> +	status = "okay";
> +};
> +
> +&qupv3_id_1 {
> +	status = "okay";
> +};
> +
> +&sdhc_2 {
> +	status = "okay";

last, please (there's more occurences below)


> +	pcie0_default_state: pcie0-default-state {
> +		clkreq-pins {
> +			pins = "gpio36";
> +			function = "pci_e0";
> +			bias-pull-up;
> +		};
> +
> +		perst-n-pins {
> +			pins = "gpio35";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-pull-down;

bias-disable?

Konrad

