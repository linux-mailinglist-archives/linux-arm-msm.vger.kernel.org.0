Return-Path: <linux-arm-msm+bounces-91006-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2ufHLDsAemnq1QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91006-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 13:25:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C85EA12B6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 13:25:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 03A49300B77D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 12:25:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52AB121CC44;
	Wed, 28 Jan 2026 12:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BRzoc5hl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vi7Lv0Cm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F903382CD
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 12:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769603129; cv=none; b=cvTBTv7yCbaKMMsPKyIf++dbkDFB53jbXXKk3emDeaINJlvciS41pnR85MoNi8b3su80ZrkNpqEcVmZeXcaO9+Ef184nxMUC5aTQrNTnHmh1eSNisZbhXqLTjZTAkn1WOF6lQnSlmTMqeJ2cKpA/XAazlMdZl4gsbpB/1TNNDhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769603129; c=relaxed/simple;
	bh=AqP/zwq+oXAw8KKNd8XZEmpJoCL0qLyclSPxceHYiNY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oW0M5WPzvlhPP+QTCsbGE5KWoAJyKLccj2f+NkOKPAdqYm4RxYJ76xHe6quPqwKp1En3TAKYKrzm+2HM2aQc5YKHgzvGmYY3/5K/3U5aDYPcj95AlqJLx7Vipj9J5QmjQO4iLxMfq8bWmdvFPF42yC/n4cVFTK3Lcb1OzG2B/Ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BRzoc5hl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vi7Lv0Cm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S929cG320354
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 12:25:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ogspLhPEqRXF9cBYprMX74TpQ1dQLaEIE4qIsambE6k=; b=BRzoc5hlLHv7Muc9
	sIGgAIAOqhFablO2Caj8QoHdNXonnt8cLl4Ii3r4XIvG4p6FZFuT5WaCkLj9FoV0
	PfAl+4cdqE2HO7BOqakIRd1iznimutWhdUN/w36tW++g0dwgI23f9ADWSFdrnvZ6
	r5UOBC8fVu5fCTYo0fcqQExm42o1n4wc6ppAgJf0x5C6CF5Wgls7ezZxXBvkryHw
	oZh4zBak9IttOQjs7TwR1kGsSXqluEVJeR4rp1yp5C1iSh3mcOC+KAqwrYJvhFDL
	GR6/ybC1BomnCg3E/nhS6H7fvMGe+eBkCl2b+CzA68f7Dey2S+MjIYxk123r6ZnS
	2iaQ+w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by4sjtq5d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 12:25:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c710279d57so49913785a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 04:25:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769603126; x=1770207926; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ogspLhPEqRXF9cBYprMX74TpQ1dQLaEIE4qIsambE6k=;
        b=Vi7Lv0CmaLSjjffSOS4Br53RFN2eSfPfGoSJl0NDvQymw7GG/MTEpHnLxEyVozDDeo
         56J7QpIwOdeIHUdmROtViaSgEeGxev7nP1gTn67sK2uDxkcg7nwyohxtTklWfJJyfcVK
         lMRg6e++36gzmYJtYOVWNskie+y2GarS8MAAhpHyPWeidGAwPXk547JnZ9qcePTyZuzZ
         NcqGtNRIdYkgFehP4y3D89BP5MHAYHz2rOZ2r+A/nkwrDyLzd7byhdrtJat3p5IZvLyZ
         uyQfEle0boC0W11qimZGRqzWse6pTANHoXVIQHQZ5WEpqnd+F5wqddxFm2s48DiKxTSQ
         pCIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769603126; x=1770207926;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ogspLhPEqRXF9cBYprMX74TpQ1dQLaEIE4qIsambE6k=;
        b=fDIYFm64mCyiiobZ7MndEgN97Ai7aJRMbsXjwKuMpW0mblYLlMTTnBmnxWw0GFAdF9
         xq5/l00DQvRxB2V88Rp8+NXdzfWOO+KiJu1j9LelNRbVuY9+AH18aClCSwC30+/jUWJT
         UH9/7C/gWixqJTNJVPRIwQmwirt4jmemBTmGOMAiKxkaF4UgYZZ3rh79F4xDfQ9wN/5S
         ryd5OVBo6OFooA3c7cAI6PpkWUwwBSXWsrpVXusogswEm9coz7lpDeS9OYMqUxEP2k82
         uYO81CRCMr7nUdnDIvxPKfddOuQFQGxBX5dmkS/gGTMhLTLBkYyawLX8L5ykyQi05LOb
         sy6A==
X-Forwarded-Encrypted: i=1; AJvYcCXJ/0wAL1sbxwttYbG06EODwMKl7cTG3ZWafKo7O1/l97euar1BQixFm31L/QqlP9dHtIURiq91RgnnXIiM@vger.kernel.org
X-Gm-Message-State: AOJu0YyRDSgMlNQmMJ4QlwqiZQq75CWiCt9bLAd452U9LA/PS7x3jCjp
	SMJS/X2ckc76de2rdD8O3fneYGYZMVAPROK4U0UI6wXWtVuza/g1dgAytU9qrij7DwLiiMMYsno
	BVi0PO8GJYXvIESu0ufYPGgh/ZCW9MOkrMTq9RsnBPlV7RQLfEgGZxbt3rJEg92HfGKR/
X-Gm-Gg: AZuq6aK7KRP1+5F7q77/kTDQYCq7Vu0pu7ObLDipyXFl4l7hsALrleRBzdvHotx6O98
	ZAwM5ul7mnhbDX8A8KnnGYm9ve4Di6o/ah8w/wUZYFV9I1r3xCmwtKZc1VKnto4R2qAxmAImiIO
	ca/oFuve2S7sYPWZ7fis3sdNbhcecQPpTK2MTFekSNEaFZlpguqvDc9iZ+wQfPbTRbFMjBMTrwr
	jxit6wwmdPdQTZmkemtpHGSyG5uTjZOx3frTJtMG32Q3PSXlZcdEUOrWCvag3C0qgJ+1h5EvFUR
	kdmNRrdCzTFPOuIXlPyh+LBGrCE+rt00iSs6usTUTgomsbtLAi+pSlPIHgGuCl+zBD6VpJGt1a5
	sq77Ab4hl4GsPHRXlv99h5ucexI4a4X32OvZcZrF3EjYYeXU+O1zrLmVQW5LyEVmZhRs=
X-Received: by 2002:a05:620a:2988:b0:8b9:fa81:5282 with SMTP id af79cd13be357-8c714b60d57mr133379085a.3.1769603125756;
        Wed, 28 Jan 2026 04:25:25 -0800 (PST)
X-Received: by 2002:a05:620a:2988:b0:8b9:fa81:5282 with SMTP id af79cd13be357-8c714b60d57mr133375985a.3.1769603125161;
        Wed, 28 Jan 2026 04:25:25 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf2ed6f8sm118426366b.65.2026.01.28.04.25.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 04:25:24 -0800 (PST)
Message-ID: <033aebad-b148-4cb9-9259-8f6e65dfc39d@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 13:25:22 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: add Acer Swift SFA14-11 device
 tree
To: weifu wu <wwfu06@163.com>, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260121112721.2981491-1-wwfu06@163.com>
 <20260121112721.2981491-3-wwfu06@163.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260121112721.2981491-3-wwfu06@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDEwMiBTYWx0ZWRfX3mBEbm6KqkI8
 Xb2u9DWoT8C3dGjLnJRA5Gm1eZmk1g16Y8QqsRg2CcqeOg8jEh0QiuYjc2cLM9+uqLGSE9wqttH
 oaa6Nk/T6PZLvPrVnNjLkGO1moXVLogUdm4CdP2EucIPOkDDexVtt7pcxqd5NZnCpnPg/K3iiLs
 V67RmxKV3nYI6YoaamRlhGlaF2WaLGgksBKw7pe7ME4zc7e0qqkA3+a6rHF/ncr8Xztx77bqDNQ
 8AsF7RrWxhTPwr11f6vxiQssQurcffrUTGPfovsutFMj4e84WnLT/TJX7xy9AhMAw3aUufKk6NM
 V4LoiwIVUUyOuP9oP4LPmb9mW9vR/VSUwN99nwQvi8ienrTLbPq+rY1FII4PuaCW4Q+jKRs2ovc
 nokygFD9oYzxl8w89TfKQ4iJolr8iv+N4IuVW8FEX5OLoTiOXboD3kXdWlKx9hNEQvLzYK3sGVo
 EftL+rdpOaLduFpX4PA==
X-Proofpoint-ORIG-GUID: nLMRSvO2vTfLqre_v2R0x-AZP-VId3FL
X-Authority-Analysis: v=2.4 cv=KezfcAYD c=1 sm=1 tr=0 ts=697a0036 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Byx-y9mGAAAA:8 a=4EuywBWWGzNydUJ_w04A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: nLMRSvO2vTfLqre_v2R0x-AZP-VId3FL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280102
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[163.com,kernel.org];
	TAGGED_FROM(0.00)[bounces-91006-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,0.0.0.15:email,qualcomm.com:dkim,0.0.0.47:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.10:email,0.0.0.0:email,0.0.0.43:email,0.0.0.28:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0C85EA12B6
X-Rspamd-Action: no action

On 1/21/26 12:27 PM, weifu wu wrote:
> Add initial device tree for Acer Swift SFA14-11 laptop based on Qualcomm X1E78100 SoC.
> 
> Generated based on x1e78100-lenovo-thinkpad-t14s.dts.
> 
> Adjusted node ordering according to review feedback.
> 
> Passed format checks and successfully built without errors.
> 
> Signed-off-by: weifu wu <wwfu06@163.com>
> ---

[...]

> +#include "hamoa.dtsi"
> +#include "hamoa-pmics.dtsi"
> +
> +/ {
> +	model = "Acer Swift 14 Go Pro AI (SFA14-11)";
> +	compatible = "acer,swift-sfa14-11", "lenovo,thinkpad-t14s", "qcom,x1e78100", "qcom,x1e80100";

The lenovo part needs to go

[...]


> +	/* two muxes together support CTIA and OMTP switching */
> +	us_euro_mux_ctrl: mux-controller {
> +		compatible = "gpio-mux";
> +		pinctrl-0 = <&us_euro_hs_sel>;
> +		pinctrl-names = "default";
> +		mux-supply = <&vreg_l16b_2p5>;
> +		#mux-control-cells = <0>;
> +		mux-gpios = <&tlmm 68 GPIO_ACTIVE_HIGH>;
> +	};

Are you sure this is present on the Acer as well?

[...]

> +&i2c0 {
> +	clock-frequency = <400000>;
> +
> +	pinctrl-0 = <&qup_i2c0_data_clk>, <&tpad_default>;
> +	pinctrl-names = "default";
> +
> +	status = "okay";
> +
> +	/* ELAN06E2 or ELAN06E3 */
> +	touchpad@15 {
> +		compatible = "hid-over-i2c";
> +		reg = <0x15>;
> +
> +		hid-descr-addr = <0x1>;
> +		interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
> +
> +		vdd-supply = <&vreg_misc_3p3>;
> +		vddl-supply = <&vreg_l12b_1p2>;
> +
> +		wakeup-source;
> +	};
> +
> +	/* SYNA8022 or SYNA8024 */
> +	touchpad@2c {
> +		compatible = "hid-over-i2c";
> +		reg = <0x2c>;
> +
> +		hid-descr-addr = <0x20>;
> +		interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
> +
> +		vdd-supply = <&vreg_misc_3p3>;
> +		vddl-supply = <&vreg_l12b_1p2>;
> +
> +		wakeup-source;
> +	};
> +
> +	/* ELAN06F1 or SYNA06F2 */

These look directly copypasted from the Lenovo DT, so I have concerns
about their validity

[...]

> +&i2c5 {
> +	clock-frequency = <400000>;
> +
> +	status = "okay";
> +
> +	eusb5_repeater: redriver@43 {
> +		compatible = "nxp,ptn3222";
> +		reg = <0x43>;
> +		#phy-cells = <0>;
> +
> +		vdd3v3-supply = <&vreg_l13b_3p0>;
> +		vdd1v8-supply = <&vreg_l4b_1p8>;
> +
> +		reset-gpios = <&tlmm 7 GPIO_ACTIVE_LOW>;
> +
> +		pinctrl-0 = <&eusb5_reset_n>;
> +		pinctrl-names = "default";
> +	};
> +
> +	eusb3_repeater: redriver@47 {
> +		compatible = "nxp,ptn3222";
> +		reg = <0x47>;
> +		#phy-cells = <0>;
> +
> +		vdd3v3-supply = <&vreg_l13b_3p0>;
> +		vdd1v8-supply = <&vreg_l4b_1p8>;
> +
> +		reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
> +
> +		pinctrl-0 = <&eusb3_reset_n>;
> +		pinctrl-names = "default";
> +	};
> +
> +	eusb6_repeater: redriver@4f {
> +		compatible = "nxp,ptn3222";
> +		reg = <0x4f>;
> +		#phy-cells = <0>;
> +
> +		vdd3v3-supply = <&vreg_l13b_3p0>;
> +		vdd1v8-supply = <&vreg_l4b_1p8>;
> +
> +		reset-gpios = <&tlmm 184 GPIO_ACTIVE_LOW>;
> +
> +		pinctrl-0 = <&eusb6_reset_n>;
> +		pinctrl-names = "default";
> +	};

This laptop seems to have 2 USB-A ports and no fingerprint/SDCard reader,
are you sure all of these are present onboard?

> +};
> +
> +&i2c6 {
> +	clock-frequency = <400000>;
> +
> +	status = "okay";
> +
> +	embedded-controller@28 {
> +		compatible = "lenovo,thinkpad-t14s-ec";

I highly doubt this is the case

[...]

> +&i2c8 {
> +	clock-frequency = <400000>;
> +
> +	status = "okay";
> +
> +	/* ILIT2911 or GTCH1563 */
> +	touchscreen@10 {
> +		compatible = "hid-over-i2c";
> +		reg = <0x10>;
> +
> +		hid-descr-addr = <0x1>;
> +		interrupts-extended = <&tlmm 51 IRQ_TYPE_LEVEL_LOW>;
> +
> +		vdd-supply = <&vreg_misc_3p3>;
> +		vddl-supply = <&vreg_l15b_1p8>;
> +
> +		pinctrl-0 = <&ts0_default>;
> +		pinctrl-names = "default";
> +	};
> +
> +	/* TODO: second-sourced touchscreen @ 0x41 */

This again looks directly copypasted

[...]

> +&usb_1_ss2_qmpphy {
> +	vdda-phy-supply = <&vreg_l2j_1p2>;
> +	vdda-pll-supply = <&vreg_l2d_0p9>;
> +
> +	/delete-property/ mode-switch;
> +	/delete-property/ orientation-switch;
> +
> +	status = "okay";
> +
> +	ports {
> +		port@0 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			/delete-node/ endpoint;
> +
> +			usb_1_ss2_qmpphy_out_dp: endpoint@0 {
> +				reg = <0>;
> +
> +				data-lanes = <3 2 1 0>;
> +				remote-endpoint = <&hdmi_bridge_dp_in>;

I don't see a HDMI port on this laptop

Moreover, I'm highly concerned about the regulator settings, which
differ between boards and may lead to permanent hardware damage if
misconfigured. If you took the values from the T14s DT as-is, you
may be doing yourself a bad favor..

Konrad

