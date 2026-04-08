Return-Path: <linux-arm-msm+bounces-102302-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4KQEA5Am1mnYBQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102302-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 11:57:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3953BA29F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 11:57:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 692F230269C8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2026 09:57:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CF5B3B47D8;
	Wed,  8 Apr 2026 09:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GUlM9nOx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="itxHdmcI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7A13B3C0D
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Apr 2026 09:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775642252; cv=none; b=YsW0QFeP/XPCakt9BSIivQkssyHmRL/IfhSIdIW46Q4lN12Khw9QlD7KCxlMoxrlLjRh+uhfhEg/niCTHn/EpvbOcCzh/BmPWJHtKouGVKoBYSWuYTM6V6f3vvqe1PhWj+2EhPjI9lCPhYznLJzPgK5vtPbLvq3zCT6Nu4VkGJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775642252; c=relaxed/simple;
	bh=NoIm8krg9jh1SqK5nLMSLbS+BKP3R9lVQkw0L9N4lwg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UwKjeBNgMNPtieW/6s6amHlKcGc/H4yXuKDizZF8ksbempjWgyhraVlEgr99+qS4D3PGR+eilA1/bAQrI3aqgj6ysRb7nVY7dWYOEwNQtjaKsRiN0Ye6w9fXjGmGZMakyR104nkDS+5i0wqtBHcQeTDUdJqFvWmls+VeV1KtCEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GUlM9nOx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=itxHdmcI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6385ePbU3363716
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Apr 2026 09:57:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8siExC2LFuLzbzXih4f3s4VK+lHb8ea8rN79TCW1Cbg=; b=GUlM9nOx7tmCii4K
	9pkwZpUlIIUY3jlh7kg4xnSF9qJ1GQdZR46baq7Uw8ODMpqs0VKxTdVS6GHr4NbF
	MIXjF19loWUyWCU+4zNnF5gQT4tOOutDfYZ+Kxdmr5qbGV8QScSzbKQFRS3+BnLh
	19lT0IeW2NRR/1hD1c8SfWiFkBibGYtaQCCNiNd5qJjwoalCfgXM64+ZMkXe0sxW
	XKGwf75+Td2CgBCHM1UTSYI42FAczRLyVeYDs6ObyrL4lGNdBUMvNZYefvSrNKA7
	iLZsO9UfULBcmSOpzk4Bd2q3VnVtPLNuyWfpQG/R4JaXyQ71LnrNbNbLeEvhAJug
	YEciXg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd7tkjq1n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 09:57:23 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8a016b99579so25943996d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 02:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775642242; x=1776247042; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8siExC2LFuLzbzXih4f3s4VK+lHb8ea8rN79TCW1Cbg=;
        b=itxHdmcI/LT0MAP0M80ixmNUoXfE6qNcSGWuj13TdK8yzHAeCAgmgMUCslA9wLWqPu
         enq0U5wa+qdzB6z2oQFgmJpxXfi2GZIi5Ofx18PzxZY6pE5TYdd4/Xmjui8dQ7VzQh9O
         aOMaUMEkzSFGqM09BZsmhIsbGiOhExiZkw7TCLHAUSwbsGETGmLwSXqLQUE8+W2gfvNs
         9SK6998Y5eJKgZQc6iPFlh+cVIXbiM5xFjno6opluD2gUrL2RgyjCCd1SHjr69hcrm+u
         vL4g7LK7Uo/WYSxO/vcVWnx1FQPQ1thQMiZC66W7aTyXFRbws8WCua+XmwT/QZyWqfrz
         hHqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775642242; x=1776247042;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8siExC2LFuLzbzXih4f3s4VK+lHb8ea8rN79TCW1Cbg=;
        b=oVpN/swVzdl/snjLNKQoo/yK39clcsQnINMfM9DlSfNlMvbqt5AaOzZxx3LoN3Gnx2
         vmNPcB1mwsHpdgtnJur1T6QWLmqXO8DIr/xHgmw/Bj9mSj3lAv7vO0641afPxf8m3r2e
         G+plcTfVS5jOA/TYIC8otUAgy3lsrKUtqEFBn9oGaMv2NrTMNfyS3BapAIkKBPkadcNP
         XrCcp27JtaE9ar9BiZMg4zwvj2N87rAG700GKo706OjRuwlBnZy2Zs74c0bemRr0cAev
         stN9gZ797jNfWw9JQDBzVhQIxoIj3yk7sGxqcTgglO6x9x3EeZCdSGStIDqb/UiG47RO
         iE0A==
X-Gm-Message-State: AOJu0YwNqsEWNendDpWRRdjS3fx6ZIWpqXyT7Ag501K+vFIiCIOFrQqc
	vhPa6ZMykve/MDnTOAiXTqoJQHCEaqOroNaplAdE01Avf+O9t7m2/JqcbBNs9R6sRzQFToO2ir/
	x73O1nfGSxzYIM8xj82WdGMmgdU1RlW62Hn7tNvBHzRS69W+YJrTZOC94xZGRZnvxeZxY
X-Gm-Gg: AeBDietGPCzbMYonh9bwWFHJtgLUTF/CHREHIqNmqh8W+4Id12Y4fjxgxC1BOHQRbKN
	68RryL2nnylbFeAhUg+z6dtdyqv2uVqwJy+DOQZpNnPnPHkSn1dL/aBHGReLUK9DnojY3TyQwFX
	9ND8Nvfy6NbSHWv5b5pZCWk61DJSsaUlH5j5BZWyLCwRKKSWq93ABSffAIHsdkukTv+XkslJHdh
	rTA8rD2GQHuJ2vFOzu0Yke2iWEjDaWEZRsB/kuPna9cxNnh1RfxhuKT4iQt3foka74CeqrdRHFk
	AQS4XmCjbxu4sgVJKU+Drry0OLek7sfLVrp5cvdE1Blr9GGMrHX/PgrXSq2QhVt1kd1fsn3s2p9
	pBoGNSiQOmWc4kaLUBeEIM8aN1Rwk+730582gcNzz1EFQ4NwUFbN6S/ovGBIQAwlEu7rOWPEM1L
	WTLBQ=
X-Received: by 2002:a05:622a:250a:b0:50b:2972:4bec with SMTP id d75a77b69052e-50db017eeaamr33913801cf.3.1775642242055;
        Wed, 08 Apr 2026 02:57:22 -0700 (PDT)
X-Received: by 2002:a05:622a:250a:b0:50b:2972:4bec with SMTP id d75a77b69052e-50db017eeaamr33913611cf.3.1775642241626;
        Wed, 08 Apr 2026 02:57:21 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e02f389absm4833458a12.13.2026.04.08.02.57.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 02:57:20 -0700 (PDT)
Message-ID: <4359bb07-d848-4b77-b1a9-f1c6f53caa10@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 11:57:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: qcs8550: add QCS8550 RB5Gen2
 board support
To: jsandom@axon.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260407-rb5gen2-dts-v2-0-d0c7f447ee73@axon.com>
 <20260407-rb5gen2-dts-v2-5-d0c7f447ee73@axon.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260407-rb5gen2-dts-v2-5-d0c7f447ee73@axon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=drPrzVg4 c=1 sm=1 tr=0 ts=69d62683 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=h77gEMGJAAAA:8 a=HSvSKgW-rJGLGYoCqIMA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=PYyYjrCoJcZo81GydsRF:22
X-Proofpoint-ORIG-GUID: hYbFpgvncjqvSjNuOOfwVKkH7lMIndwG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA5MCBTYWx0ZWRfXz654SSpXeKcX
 Dd9Un5Pm4s0J9ywlDBdV3+gUPtDx9c7wCPl7NPlcUAUj/0NlpM0Ob85kAR+qjMUqzw8Et+7th5p
 VeS1JGnMqiNHSY2q4GVAc8859dJEwles/G3C3gkI4DKGynJb4++ajcgybE3GdPt16c2rfN+xH5c
 OKzEAG0z+vjcgfnXSfanlvpnPDldAgA+GxknjAXejB57u3a/7cXEiwYXfVK1euz8UCnu2PPMyno
 ARMo6ml1qK9fm/mfMFvc1xBhLMLLHY/SHANjd665RjcJWUWGkRJ5sbLTPxbelBs62upTdJ+xblp
 ImW8s7Y+EVzp02zfP6haMXQRSRWRu2DmMsDogocEmtZu+G0J7kabDQDGdWazxrl02fYUVyhk/gZ
 AK/4WMFKkfMRZBntgfiICa7/n6UqCX7tV5MmnPeRzbdO0mnUfrZMCPALvDRdTl8vpZjGXMz6ysw
 /H965ljuzry1RkfaXKg==
X-Proofpoint-GUID: hYbFpgvncjqvSjNuOOfwVKkH7lMIndwG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080090
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,axon.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102302-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7C3953BA29F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/7/26 5:46 PM, Joe Sandom via B4 Relay wrote:
> From: Joe Sandom <jsandom@axon.com>
> 
> The RB5gen2 is an embedded development platform for the
> QCS8550, based on the Snapdragon 8 Gen 2 SoC (SM8550).

[...]


> +	/* Lontium LT9611UXC fails FW upgrade and has timeouts with geni-i2c */
> +	/* Workaround is to use bit-banged I2C */

Interesting.. I was under the impression that it was only an issue on
RB1 and RB2 boards.. perhaps we're missing some magic register write..


[...]

> +		pinctrl-names = "default";
> +		pinctrl-0 = <&wlan_en>, <&bt_default>, <&sw_ctrl_default>,
> +			    <&pmk8550_sleep_clk>;

nit: let's keep the order of

property-n
property-names

file-wide

[...]

> +&sdhc_2 {
> +	cd-gpios = <&pm8550_gpios 12 GPIO_ACTIVE_LOW>;
> +
> +	pinctrl-0 = <&sdc2_default>, <&sdc2_card_det_n>;
> +	pinctrl-1 = <&sdc2_sleep>, <&sdc2_card_det_n>;
> +	pinctrl-names = "default", "sleep";
> +
> +	vmmc-supply = <&vreg_l9b_2p9>;
> +	vqmmc-supply = <&vreg_l8b_1p8>;
> +
> +	max-sd-hs-hz = <37000000>;

Are you sure you want to overwrite that? The value in the SoC DTSI is
set to half a MHz higher


> +
> +	no-sdio;
> +	no-mmc;
> +
> +	status = "okay";
> +};
> +
> +&sleep_clk {
> +	clock-frequency = <32764>;
> +};
> +
> +&spi11 {
> +	status = "okay";
> +
> +	can@0 {
> +		compatible = "microchip,mcp2518fd";
> +		reg = <0>;
> +		interrupts-extended = <&tlmm 55 IRQ_TYPE_LEVEL_LOW>;
> +		clocks = <&clk40m>;
> +		spi-max-frequency = <10000000>;
> +		vdd-supply = <&vreg_l14b_3p2>;
> +		xceiver-supply = <&vreg_l14b_3p2>;

It may be that for this chip to actually be able to communiate with devices
on the bus, you need to set the new 'microchip,xstbyen' property

see:

https://lore.kernel.org/linux-arm-msm/20260321135031.3107408-1-viken.dadhaniya@oss.qualcomm.com/

[...]

> +&tlmm {
> +	gpio-reserved-ranges = <32 8>;

Would you happen to know what these pins are connected to, and if
so, add a comment (like in arch/arm64/boot/dts/qcom/x1-crd.dtsi)?



> +
> +	bt_default: bt-default-state {
> +		pins = "gpio81";

It would be best to keep these entries ordered by pin idx

> +		function = "gpio";
> +		drive-strength = <16>;
> +		bias-disable;
> +	};
> +
> +	sw_ctrl_default: sw-ctrl-default-state {
> +		pins = "gpio82";
> +		function = "gpio";
> +		bias-pull-down;
> +	};
> +
> +	lt9611_irq_pin: lt9611-irq-state {
> +		pins = "gpio40";
> +		function = "gpio";
> +		bias-disable;
> +	};
> +
> +	lt9611_rst_pin: lt9611-rst-state {
> +		pins = "gpio7";
> +		function = "gpio";
> +		output-high;

You shouldn't need to assert the GPIO state in the pin entry node
- the driver should take care of that

 
> +	};
> +
> +	ntn0_en: ntn0-en-state {
> +		pins = "gpio67";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	ntn1_en: ntn1-en-state {
> +		pins = "gpio42";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	upd_1p05_en: upd-1p05-en-state {
> +		pins = "gpio179";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-up;
> +	};

I don't know if pulling up an active-high pin is what you want
(there's some more occurences)

Konrad

