Return-Path: <linux-arm-msm+bounces-113409-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id J5kMDQdEMWrMfgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113409-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 14:39:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BDCD68F6D6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 14:39:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=evrZHDgq;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=F8mHeY3w;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113409-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113409-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8A8213015A77
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 12:37:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B917C2C3248;
	Tue, 16 Jun 2026 12:37:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D541FFC59
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 12:37:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781613440; cv=none; b=kzWZkWQC4vqakfoxLiSMUBX601grU3mT770HQXhuVFBC5rdC5Y1F0HJ1I7hdVPcuTa/aV4LTZTk/8tkKtBKNTtCQ17wtFfVi1ZO9VDvTdFbAFhdTXq7zodmDfRiDgGvMua6SFd/l01FKxxKGKeKtmgMxiuhHf9cP2EShNtBSzJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781613440; c=relaxed/simple;
	bh=ZUKAmdu7SA4Z/fH5vfjt1yDsTtcQZWO2kRL/RQErU/c=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=DFss5MX/OyailYYBHhEqG+Ain6oz8UuISS5/Cv6DrF1tjS3ojz3Z+8EZlbRWxvFAXzwB8MygGo9jcZ4hVTHvDt6vgdTL8uFGNqv298JeG9vx/SKpGKZ2e9/eQ0bMEP71dHaMqxAaT3Cx7EqwpYY/LP/88X/2njtccm4UjruO8g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=evrZHDgq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F8mHeY3w; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GAC1Ed3256227
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 12:37:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VXzotvMtmJL96WvoN/75Xemtw+q8uV6JsSIbWf0ZLqU=; b=evrZHDgqMBI20KDj
	GuceyVt3+aJoiNhuAIJWMvF7LqTHO5u9dHDFpvkH2GtoMJq1EusVElJ+YcFTAXFI
	rrPrVG8fvbL1m/4GVQi+kMihOU0s5wt5QIGwO0vivpjag5WmgKt81pLeLMhSzvLa
	XeSsZoEQnxCNz383My3B8gFt3JDcuIBp1lB3YejtOp6SwQIt8zst3zyRZif5IKAp
	oaG/u4Gc1dR29Y7FHUeKG4lF2KyC2rycIFfI8247bTAKdBhBnCJtL4abRE1jo7mT
	pSoyd/tzNBY8Y461wVRkUEOCzwD01kt8qDqt5zXMK/pOzRlIE5Cq6QjCxtNhmKoV
	+scqrw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu09k9r5k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 12:37:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9156dc90fdaso105760585a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 05:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781613438; x=1782218238; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VXzotvMtmJL96WvoN/75Xemtw+q8uV6JsSIbWf0ZLqU=;
        b=F8mHeY3wXufAfnG1q0Ya90N+TZaQU3A6U+cI/1dS1i5fR92xSa8n6jU/P69LArzLaJ
         GYmvEbkSSeQctjdU6fpHeh69wnx55WXLo/mX1G0w/eDiiMBxo5auTadHx1JSlz6MTI3a
         ecB4kgPtXlZSgWKcIuJSNbn/3YbhhuKPSsoI1qMs8OurUBPIM3MTjpfhB3E5W+QqP1Ey
         DLOGSeudNnDSKmt0xjGQHllEY5y5TCQo604Aw90IFymMss61Lh5xZlx053KAmvHSwak8
         1iV78+pLOJciYk9bU6vaMBTre40AtCHAnKVpZZi8CuixdYGxtqW2StrDFQT2We7pGxp9
         uPoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781613438; x=1782218238;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VXzotvMtmJL96WvoN/75Xemtw+q8uV6JsSIbWf0ZLqU=;
        b=J7av7yHQhzTb3KAOzjeSBSTs0s+jVYXDB6ZYr/aP+L3q20A1xGzVPcH5s0YSlaDGut
         1+nDq3GbTE80V/nUieK+UUhRTbYvDJ3Zlp/9WdtqXSf2CiPSBDXzOtTHcjts9X/46+ax
         AU+gPDSTWGEEGb3DyKuv4gl/sdCFzFw+a+LjXpOKurYgsLQ2VeMmoM1g5/Qzn8csnLVm
         ZeSNovvNDt4nNHir88lJ+/YiPTnonT2Uz/RHn8nEAiwz16iE4i0r3uRCW58CEoVYSaKT
         AVtQW6llGruf1ZSta4iJuNPwrGHYY/r1gQzt8gyv9hnM12YBN5R5Rhu4dkUvA8ereFtw
         hPkQ==
X-Forwarded-Encrypted: i=1; AFNElJ/jqywHLnypcG6rHKwjFnsk0/2GNUGfNzifKIISMjzBbYrr6GNlvIHBj6NLNP+fpxd2qOAa6w4Bi0zD6tb5@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+0Ogpg02qGsD3ZAq6VeIFCgzpl/VaqZyFVUQcbK0lS+GXn0qR
	emRvwWzmWuQV5JNGNtq5zWKMY20dKSQgpn3ZhXIroAsBxR1fU31xomxF4gAkywju8gGFF/o5sKh
	8RaXKmpRxpOB5biVaXn+dZojKZOUQJIaqt9TvOW6CvFerBKqQ2WLyLym7WnuzgH5iU12U
X-Gm-Gg: Acq92OFOMoaFvvdYJApHqb3iotAcm5OW9de0FDSPP2i7ZbQlNnLB9xwF/hm0HdbZoFj
	e3bnUGkDZv+HQ8ofTHpkRNX14hGjyOSc9SIAnm4Fu65ezOYtS2hO+VIRz8dFMuPxY58ccsn5y/d
	6JNSYhFnx4RtNSgMRHv3N7vRzyKkCEUEKE4gp4yfD6TTlmYmNa+j0Y93HxYwh8rZyiZej5sU41a
	LzVluWe7FIVWst+lLGg17/TrGjGdjWsa+5AbNIQgtIPMFri7fTtBq3OwPEuzNyxYk8O6QyxzTFC
	WspufL+mJM/iGkHPCkA0DCRLrG2TBbAUpixGGdm44Dia7aI/nwDsaDzPjKCieMRZup1j2xzyKrp
	v4hXnrHIVTh/uXF6GHMrm0V+F7pDp6oQ8goPf2dJCMIOi9g==
X-Received: by 2002:a05:620a:280c:b0:915:4ca0:11f9 with SMTP id af79cd13be357-9161bd2835fmr1772201485a.7.1781613437574;
        Tue, 16 Jun 2026 05:37:17 -0700 (PDT)
X-Received: by 2002:a05:620a:280c:b0:915:4ca0:11f9 with SMTP id af79cd13be357-9161bd2835fmr1772197085a.7.1781613437120;
        Tue, 16 Jun 2026 05:37:17 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb7b6de98sm642143266b.30.2026.06.16.05.37.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 05:37:16 -0700 (PDT)
Message-ID: <593b7024-e986-484d-8837-17f08990575e@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 14:37:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: Add HONOR MagicBook Art 14
 device tree
To: Konstantin Shabanov <mail@etehtsea.me>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260515172926.16597-1-mail@etehtsea.me>
 <20260515172926.16597-4-mail@etehtsea.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260515172926.16597-4-mail@etehtsea.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDEyOCBTYWx0ZWRfX3d5hGmjFN+9Q
 3SD+ty23AeEUfkE13t3l81kKXVyP4xSpWZhPyvuz1AqhKXgbw/jwPX2coDQrMW+pWPpVz7uO7wZ
 81iRwns3APsBcRX5ZA3iHXskvZEppig=
X-Proofpoint-GUID: mdmuu1bCgnpZJ0U4HTC-2-ESb75Ye-Nn
X-Authority-Analysis: v=2.4 cv=DoZmPm/+ c=1 sm=1 tr=0 ts=6a31437e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=4SG1UvOAAAAA:20 a=NEAV23lmAAAA:8 a=UwPxW2lQh7-G_fGdwzUA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: mdmuu1bCgnpZJ0U4HTC-2-ESb75Ye-Nn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDEyOCBTYWx0ZWRfX4IOPdfMcRERt
 BW2lMMmTo3hZIS+cGwvZml7ooxUZ3fKjTaLqr/cGWZP0R7hbQ97kOp52SotlKofffoS4nxr1ZC/
 Cpp2mRB4atPBJY/iMTtj/dfz4NTU+lt50LL1e0RA3dNbfRKCuqzu8263Fgm481ReCnU75Mrctg7
 K4DlfrX5vQmtZULw2/J0o/PaSO8IrMa6qUDnIEC2oXASyfc5tf1+8WDheVWmReS3usWkK6AAZ7a
 BXfzpjBwWV9PAdXQ7Kf/f7USLGj6jhtSAD9TL73/GjlMWvX3ETn4PVfzEloIqKX3ClZCt8l3ca4
 YnZ4yMkIWc0Cd3VIsgIvTKGoEQ2ib2oG4YoUeIFFF1T5CaPwZq+SOxSUTCOozo71CPhrSmGhoKL
 /n843gYsi7ilQRD+b4m7huWJg96/JD/Xep3dLGcXiMgbZddcANSCEujJPLZXlTMREqJekCyVJ28
 CgiwawvJzx74NeCEkHg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160128
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-113409-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:mail@etehtsea.me,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[etehtsea.me:email,vger.kernel.org:from_smtp,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9BDCD68F6D6

On 5/15/26 7:29 PM, Konstantin Shabanov wrote:
> Introduce support for the HONOR MagicBook Art 14 laptop.
> This version is based on the initial work by Kirill A. Korinsky [1]
> and Valentin Manea [2].
> 
> Supported:
> 
> - Sound (with alsa-ucm-conf config [3])
>   - Speakers
>   - Headphone jack
> - Bluetooth
> - Battery
> - HDMI
> - Touchpad
> - Keyboard (with backlight)
> - Touchscreen
> - WiFi
> - USB-C ports
> - USB-A port
> - UFS
> - H/W accel
> - DP over USB-C
> 
> Untested:
> 
> - Camera
> - Fingerprint reader
> - Sleep/Suspend
> 
> Broken:
> 
> - eDP
> 
> [1]: https://lore.kernel.org/all/871px910m1.wl-kirill@korins.ky/
> [2]: https://github.com/vamanea/linux-magicbook/blob/x1e80100-magicbook-6.19/arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts
> [3]: https://github.com/alsa-project/alsa-ucm-conf/pull/755
> 
> Signed-off-by: Konstantin Shabanov <mail@etehtsea.me>
> ---

[...]

> +	sound {
> +		compatible = "qcom,x1e80100-sndcard";
> +		model = "X1E80100-CRD";

This should point to the actual name of the board, then you can make a
""symlink"" in ALSA UCM (there's a file that binds compatible soundcards
in there)

[...]

> +		wcd-playback-dai-link {
> +			link-name = "WCD Playback";
> +
> +			cpu {
> +				sound-dai = <&q6apmbedai RX_CODEC_DMA_RX_0>;
> +			};
> +
> +			codec {
> +				sound-dai = <&wcd938x 0>, <&swr1 0>, <&lpass_rxmacro 0>;
> +			};

'co'dec < 'cp'u

[...]

> +	vreg_misc_3p3: regulator-misc-3p3 {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_MISC_3P3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&pm8550ve_8_gpios 6 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&misc_3p3_reg_en>;

property-n
property-names

in this order, please

[...]

> +&iris {
> +	status = "okay";
> +	firmware-name = "qcom/x1e80100/HONOR/MRO-XXX/qcvss8380.mbn";

status should be the last property, and it would be neat to keep a \n before it

[...]

> +&mdss_dp0_out {
> +	data-lanes = <0 1>;

If you change this to <0 1 2 3>, you should get 4-lane DP working

[...]

> +	eusb5_reset_n: eusb5-reset-n-state {
> +		pins = "gpio7";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +		output-low;
> +	};
> +
> +	eusb6_reset_n: eusb6-reset-n-state {
> +		pins = "gpio184";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +		output-low;
> +	};

drop the output-foo properties from these two, they are controlled
by the driver

[...]


> +	wcd_default: wcd-reset-n-active-state {
> +		pins = "gpio191";
> +		function = "gpio";
> +		drive-strength = <16>;
> +		bias-disable;
> +		output-low;

ditto

[...]

> +/* usb1 covers left side typec ports */
> +/* back (towards the display) typec port */

This is already described in a comment near pmic-glink {}

[...]

> +/* MP0 goes to the USB-A port(USB3) and FPC */

"MP0" refers to the first USB3+USB2 port on the multiport controller.
Is there a hub inbetween? Should we describe it? Do we know if VBUS on
the USB-A port is controllable?

[...]

> +&usb_2_hsphy {

"usb_2" < "usb_mp"
> +	vdd-supply = <&vreg_l3j_0p8>;
> +	vdda12-supply = <&vreg_l2j_1p2>;
> +	phys = <&eusb5_repeater>;
> +	status = "okay";

Let's keep an \n before status

Konrad

