Return-Path: <linux-arm-msm+bounces-98726-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJFgMIjhu2lXpQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98726-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 12:44:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3922E2CA83B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 12:44:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4B66A30836FA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 11:41:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B28F3BED1E;
	Thu, 19 Mar 2026 11:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DHbrJsk4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q0lU6r31"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3AA3CA49A
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 11:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773920441; cv=none; b=qfKHQtJZaK2oBDWtGwrgJFt7AQmQOu4fObgeYGPckMnqT9NXhzNJI/Mq77B7wnwQJReuq6cCaDR/uslXisEFVP71k2IYrROFw385kitvrmxIDG1vDjSqwoflHoUKtaMRwpr05UjlSKSAefN1yjK1DZ0yCIoeEub3N09tYo2RZtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773920441; c=relaxed/simple;
	bh=8lvV+05AjlYqBRAnsrePyYBoV0IAotltEMTqGo97B70=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CUm2Rx5uA5QBElVfH0PUeJMhTDAwFt/78rGHIwYDCh8WeujnoTedfSSNDIgQ3B3ZPKebaqqJ/cJYBZ2f9cj2pMWLnngphecKVHcfwBnuO6ZSf5xQnfX+RgB4VQqYwrQe89ADvsLW2uDJk6vqbSIEzCejQn7GSzD6wzq44rDUaTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DHbrJsk4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q0lU6r31; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J73v363771096
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 11:40:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/pd4kfXQuTMgtemwulqYBe2gk/xcEWWLvTi2fWAaQ48=; b=DHbrJsk4P+gG48u0
	Gl13B3CVu++m3kks+dwIes8uGTLH3/vXUjscG57yArDDOo7qVUEnW2SRcY3zvHfm
	6mQMg1WbplKIu9+LgKSIHmzWnoEbJtR7pN2/Wkh5gLkWZxP3kdAHzQhzJNWcYMCt
	vwoGw+yU7SkT+WFKgwl9JtqAG2dLjHNI8cWJoWoOb1FmDCsRfwcJuEscYu/pCo3g
	mdKq7F4CngIJHI8aT+yPg7Jr4hFZ1ccEXcj0rr/9PoA6zxeeqMZNlrgn8KsLaMu5
	sGqTuP7VR3VFKsl8lgaz4uZ3rWh2lz9q9lpnPVlC/bcu4FFlCMIw70xzY+yxsXsr
	POUDhg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d083r9jba-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 11:40:29 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89c6717b74dso6870316d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 04:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773920428; x=1774525228; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/pd4kfXQuTMgtemwulqYBe2gk/xcEWWLvTi2fWAaQ48=;
        b=Q0lU6r31dfQDpVCCugcqTGJDeb2iLzduA3aObrOn0j7osxBkYX17wfnMj9888Vi6Au
         IBO8QJ9CnTmbfq4c+zs6o9ZXqGmxh3S2HccpCCHd8oXne7ERGbklmRF5ngQ/cgQ0KNCg
         pBDe2Ab9K+pIiRMLENKxSKFNJ2k3S9Aylx/kT4UqEoS/se4ViSFs6jXnaIUpqRVo4Czw
         gRsyg+oxa8au6BHMXirRNbiQRhBhvvbLvoZ/q5FNyJCTHoQV7V+RTsuVIIkZw+ArmqHH
         csSLhYiaOkTKKlaF6N13nH6PbRjn/ZZZQ1ZRFXbZrjdPfAuHS0WP0pTu43teVArEBJgt
         UilQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773920428; x=1774525228;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/pd4kfXQuTMgtemwulqYBe2gk/xcEWWLvTi2fWAaQ48=;
        b=gI9NIV1fQrRpI7RI9nFKI+Xj+nTuGr2Gbap9PiHVhjqrTQRYP/XHvR/75K872fHvbK
         CR9zaHtME490hvPP0Dub9q+SCSfRj82imAzuUUfrvk17FhHPCXJ0mB2a3YHtYPrqRIYT
         kp1w3n7GgPQL3zPxYGmsu7wZGD+5XA7/W9wlKk/TTHdy+A8q+aQaoQvcf0HokqJCu4dW
         i1rHMv2gkIe2ypZqP44x0/aS/4MBn6LC/k8M9rl1UMr8XwKgoCzESVZLj0ZUDl4OO0Y3
         k4Vuuu1qdXep2SGYFSUed+LTS7ME3+eRqhLw4ka+3QtEnzjzLWtCdszy/ziQwThMFBPG
         4Mgw==
X-Gm-Message-State: AOJu0YwwmgNnxTNvgBHej1kQdVeGoax5Xl9SaosaLytteI5e//FYDXtK
	4lYnH3ZShvhTK3KM5s42kxKZ90GWXiFwEJmzJYW7dzzIRVzOOeoXlqBddHcw8kTfoL4tLTa7IxI
	01OQLWN0nfTI9V9T1jvngb4ZIcjf6uA6No1l67WZfRGAiDzG6QAhHZPGyJwi81LpLXMFc
X-Gm-Gg: ATEYQzwWMPqPGpbPTFujltSu+VYXTujgRdKtLCKLDVOuj50uVseqDSFwrB1L+RBPHWv
	2gFYsz0vfgLNor0KiNs36p9WgYaTQcoU5qe5KdyqqldJ4cvbVCCXjzmfxZlbQ3tX57RL8zWeEYF
	+Uj09IqtyzgMC55qbLPka6gACqZ2V1qbbdrDLs9jJNxM9GqSkTB/FyInv434dSusz6c8QChc2L4
	3syxAjc8ko9YevbTDCCY6n6xoWfcAVAb54umQpwpTd5flxnuA4oOdmIawJY97s7oGVK5LfIXos9
	NmAuHVuhzD14V8X5vag5a7M6sR/6mLi0mlqHcHDhJGoJQMs+KY0SCx3njTNIJMOZWj1fHGrDYEr
	oElHlMTaXhHA1UBze6UMrrJIFZWdJWAC5E7dY0+6JFYtMWibgen5ORTb5f5HNUIJOqS19K/3CEw
	V87Xs=
X-Received: by 2002:ad4:594c:0:b0:89c:4aae:408f with SMTP id 6a1803df08f44-89c6b580401mr79493246d6.5.1773920428093;
        Thu, 19 Mar 2026 04:40:28 -0700 (PDT)
X-Received: by 2002:ad4:594c:0:b0:89c:4aae:408f with SMTP id 6a1803df08f44-89c6b580401mr79492886d6.5.1773920427675;
        Thu, 19 Mar 2026 04:40:27 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f142adf1sm430583866b.16.2026.03.19.04.40.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 04:40:26 -0700 (PDT)
Message-ID: <c464d106-8e7b-41a5-b76c-ed5e7a82fb37@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 12:40:25 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] arm64: dts: qcom: Add AYN QCS8550 Common
To: webgeek1234@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Teguh Sobirin <teguh@sobir.in>
References: <20260311-ayn-qcs8550-v2-0-e66986e0f0cb@gmail.com>
 <20260311-ayn-qcs8550-v2-2-e66986e0f0cb@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260311-ayn-qcs8550-v2-2-e66986e0f0cb@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: QyVaiGznh8cBkpmrHdig8syYb-ncc493
X-Proofpoint-ORIG-GUID: QyVaiGznh8cBkpmrHdig8syYb-ncc493
X-Authority-Analysis: v=2.4 cv=ApTjHe9P c=1 sm=1 tr=0 ts=69bbe0ad cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=B-J4ztEYYRmK9Gd1W5QA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA5NCBTYWx0ZWRfX+z+7f/X+HOo7
 iYIjyWcRpTirZaHbpoYcLhPb+wjwPqiWbauHsTTSijA+tSErDhTrBvksRFsgWWrIwbD4auna29T
 AeYWERyzXjmr0d9/wReMD2v3exZR8KUcdnMR5kWegcyPFHcC1uWCZF/YaIKGEznMv0vShM2YGyd
 jUbXsxXOrkzc/XP9l1kzryGksMOio7h58RMkQhAbYnHnF0Uf8uQPvRl0Nt1s/O8BnNlNKrBLqZW
 aicSBqSF03EFqBhABTI10SgE1hq2gRwfPSpsRbOz7Avm3/hgUUjcHnjK2LBCDgjHLpSSJS1ovHX
 A1q+1jujIzIrSEJ0ZpzzXHNspmokhWrLnqVfJxC2iuGtH43plwJsPnvu1Dv67TBaDqWp5iMYPo7
 KmiT/SlDmhxghA/0H3LoB4qkWQ0jjkRLa4cw45zSrQ9xIMiCECq5XhJEveNolCMVwuVfakLAk8i
 5gP6cPkDnMU56BCpDVg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190094
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-98726-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sobir.in:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.0.0.0:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.34:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3922E2CA83B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/11/26 6:44 PM, Aaron Kling via B4 Relay wrote:
> From: Teguh Sobirin <teguh@sobir.in>
> 
> This adds a base dtb of everything common between the AYN QCS8550
> devices. It is intended to be extended by device specific overlays.
> 
> Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> Co-developed-by: Aaron Kling <webgeek1234@gmail.com>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---

[...]

> +	pwm_fan: pwm-fan {
> +		compatible = "pwm-fan";
> +
> +		fan-supply = <&vdd_fan_5v0>;
> +		pwms = <&pm8550_pwm 3 50000>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&fan_pwm_active>, <&fan_int>;

property-n
property-names

in this order, everywhere, please

> +
> +		pulses-per-revolution = <4>;
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <13 IRQ_TYPE_EDGE_FALLING>;

interrupts-extended = <&tlmm 13 IRQ_...>;

[...]

> +		model = "AYN-Odin2";
> +		audio-routing =
> +				"IN1_HPHL", "HPHL_OUT",

Let's drop this empty linebreak


> +				"IN2_HPHR", "HPHR_OUT",
> +				"AMIC2", "MIC BIAS2",
> +				"TX SWR_INPUT1", "ADC2_OUTPUT";
> +
> +		speaker-i2s-dai-link {
> +			link-name = "Primary MI2S Playback";
> +
> +			cpu {
> +				sound-dai = <&q6apmbedai PRIMARY_MI2S_RX>;
> +			};

'co'dec < 'cp'u, please resort

[...]

> +	vdd_fan_5v0: vdd-fan-5v0-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vdd_fan_5v0";
> +
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +
> +		gpio = <&tlmm 109 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&fan_pwr_active>;
> +
> +		regulator-state-mem {
> +			regulator-off-in-suspend;
> +		};

oh, I didn't know this binding existed.. but it seems valid indeed!

[...]

> +&i2c12 {
> +	clock-frequency = <400000>;
> +	status = "okay";

Let's uniformly keep a \n before status

> +};
> +
> +&i2c_master_hub_0 {
> +	status = "okay";

Please add a clock-frequency
(you can read it back at runtime running a vendor kernel if you don't have a
better source)

[...]

> +	spk_amp_l: spk_amp_l@34 {

underscores are no bueno in node names (between ':' and '@'), and they should
be generic, let's try amplifier@

[...]

> +&iris {
> +	status = "okay";

firmware-name?

[...]

> +&sdhc_2 {
> +	cd-gpios = <&pm8550_gpios 12 GPIO_ACTIVE_LOW>;
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&sdc2_default &sdc2_card_det_n>;
> +	pinctrl-1 = <&sdc2_sleep &sdc2_card_det_n>;
> +	vmmc-supply = <&vreg_l9b_2p9>;
> +	vqmmc-supply = <&vreg_l8b_1p8>;
> +	max-sd-hs-hz = <37500000>;

It's already in 8550.dtsi, you can drop it

> +	no-sdio;
> +	no-mmc;
> +
> +	qcom,dll-config = <0x0007442c>;

Is that changed in your downstream tree?


[...]

> +&swr1 {
> +	status = "okay";
> +	wcd_rx: codec@0,4 {

Let's keep a \n between properties and the subsequent subnodes,
also file-wide

[...]

> +&tlmm {
> +	gpio-reserved-ranges = <32 8>;
> +
> +	dsi_p_rst_active: dsi-p-rst-active-state {
> +		pins = "gpio133";

https://docs.kernel.org/devicetree/bindings/dts-coding-style.html

Let's order them by the pin index (it's a fairly new development so other
8550 devices don't really have that)

[...]

> +&usb_dp_qmpphy {
> +	vdda-phy-supply = <&vreg_l3e_1p2>;
> +	vdda-pll-supply = <&vreg_l3f_0p88>;
> +
> +	mode-switch;

Already present in sm8550.dtsi

Konrad

