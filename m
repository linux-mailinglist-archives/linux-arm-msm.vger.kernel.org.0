Return-Path: <linux-arm-msm+bounces-114691-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QX8KKFybPmrWIwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114691-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 17:31:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C8F6CE810
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 17:31:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kAZ9mCzH;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=PlaZvS9u;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114691-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114691-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7DB583040C66
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 15:18:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 186D73BA22E;
	Fri, 26 Jun 2026 15:18:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC3E388E51
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 15:18:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782487110; cv=none; b=UXUd6Qx2w6kRILrGd3ovmz58hG60QqQPA8gJy3H96r7v4Die/Q4Yac0MczRTFbzFdSNiZfTZdvjlUR7BOqvLzhRmMxSAmIh+jNi7s5DF0h+7XinWRbKji6OOtH+vxGPSpcCLuBpvZnGRpID7nK/Ihy4L3YCG10WlCpdUvuMw6Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782487110; c=relaxed/simple;
	bh=T3qXbzmDv7ZShLGSjVqPtOhzkb+ITriPGNwUsyKRFuI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UoCmayS8J7oJwu+lpY3/hD3Zs3AjlaH9qMakFTpmw6393P7H5SV6NDn69vUUfc5X+4/Q7T6sb7CasZcxz83yfLPAeuIqQJBC7xvQtu/KNU7MBXr6xRnFev1DuAkesWHZle5TblOePkn47+p6ltL+Pa7PxiLh+wbEfCyHZcADdRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kAZ9mCzH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PlaZvS9u; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QF470E1733519
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 15:18:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nSr+X2cN+chbZ1Kgz/n5kJYhUFjvUZy9dsF/AYkHna0=; b=kAZ9mCzHreAtQLjl
	FON2+t3WD5Dta7QsFF8E9ZW91QDn/kOj8D7Xf6Ima8fRuy6fb5pHp5Q1ofN6oKBE
	H64isH6ozhDTFl5fCKnmKRp+6UQcdVLKYsEILbNSr9jSI4Ifl2wtSy+hhsGropqV
	mEyq5bMcd25R+DcGlhTsXEjlPty6/LlN2cZWjurRZYFl4Q3S6E6rvdMLMrNx2Itw
	jKIa3tma1RWAD5Ur44sUP5fdxumaHDBoubqCkIK7WfvIwhrJAy85LxII4DN+15A8
	zaAC80YQfmAkgSp/HJ2xZ4LEJ3e+TETra4xbUQEAIaOtyMf1meV5g1I3eKHZBiiR
	Cz4WdQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1eewb9vs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 15:18:26 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51a8adbea03so127971cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 08:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782487106; x=1783091906; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nSr+X2cN+chbZ1Kgz/n5kJYhUFjvUZy9dsF/AYkHna0=;
        b=PlaZvS9u3E19knCJ8w/wRiYGACSz79V7AHXvGBELgxtcYeVMztFK/RgjBcrCOWJwkF
         wUi3kv5wsWlx+jgkaRdmITd8ptaeODBzdQffbgcnqs+ayX5ItgBGJ2OQF8pXMSxYxfyN
         grFgqy0OPZ6H0aPSlAepmQUK6AGQ6Fw/Rb2OYrotvTzVT1FaIcyLd3TXRAENboi5S1qU
         sxEDY0dJ1QCWqH7KMxfgCAPciWc8wGU5+VJXjcc+3q3moSBhARxko+zHbSZPKCPhLJo5
         9vpS+VBdZJKfJmrSEAVSNRzzM+L1jzS5r/lYWYiXRl1EwpfQfF9GJiN7kY9eqdNB3auI
         KIcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782487106; x=1783091906;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nSr+X2cN+chbZ1Kgz/n5kJYhUFjvUZy9dsF/AYkHna0=;
        b=s2M0KAbZ1TWsjBrSkYy/7Jk3/1AD3NhF71CKACnJz/qeZvz0Cxma7CjEGOifkY7/CL
         VYOcPjYq+kNpdpgAIPpP5oiqOQRWgtU9XRjpWjHWRz7jkvxX4XCTW1f0iv5oGmLYIkD9
         Xk9gsfalPK9QyhxrUlgPANqutWHgMYTNnIi79LR3lV8N8q2xvyY2uk4GVbl5eRbSDWDe
         A0/PDgHFRFHOR+4danDVGHsRqzH2FXP7nmoeMNdITzLNckVAjb3TQNSoiILMbn5zfy4E
         qc+DC59eIFJQuhjOxDBG+0b/j/p8x4wyP6J6ipCPuDR2GiNZ1lOEcm8dKHMKlGp1bdci
         NFEg==
X-Forwarded-Encrypted: i=1; AFNElJ9qVI6v6g6INTz7dCbHxT4TlT/I2pJZ59jACw7akWDkepGkpCeh9QooYhxht7Vx12cVN7quBjZGifMXkAKH@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv/7SNV+ZZN3JE/pK9LfJemjhV4zCugBauJRQXdzwSu46BtLLd
	YAzQPdblDJKIDpfdXRfhe/jmtCZ8iqwMe0lNJiVpSSpT/nsjWZqEmSPFP6rA8H8+YQv7PuCkGqD
	sak8De0toFdOymLEz/0xRStjokakWAWtOoBY3UhMVf42FGxHOD2MW0HXi/jfeVoGpDkQP
X-Gm-Gg: AfdE7cm5OzC1nY3kJM/jjxkYL2HEcPsZmSUODe5kflQv9P/IbU5xjR9iV7aTKdr/REa
	RVyOjJmEhXudEfy1roXwgCHxK9i4+fxIyOtBfazlaTtlNRY0jwY751RJfxXLGIDvtDN8yIiJE9k
	NJlifEwSUbNZpNK1QW/53QQs8KjF7q7D0ZcWem0kM6VH2Bwp9uTntK4gC/L8XU4gFd7RSR2yuYm
	rcXlsW/tud8miJsRnAY03vQ/cMnhXPFSvjPkpsnuyypzaJgBoCgqWuxMz9tXyqdUQRk/3gPmdQ9
	APnwaUAQlCbyeA1AecnuKPj4UX+4BdDdNUFrwVjiduG+Ze2fQzBTIJJuXVP0eRc5LuCDvraY4VY
	ayTWX+MPRHmF32v3dplG2eJ32vuod+SdOZKc=
X-Received: by 2002:ac8:5ac3:0:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-51a7277e873mr64259781cf.2.1782487105429;
        Fri, 26 Jun 2026 08:18:25 -0700 (PDT)
X-Received: by 2002:ac8:5ac3:0:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-51a7277e873mr64258561cf.2.1782487103486;
        Fri, 26 Jun 2026 08:18:23 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ad31a81adsm11177701fa.28.2026.06.26.08.18.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 08:18:22 -0700 (PDT)
Message-ID: <8afbc9f9-15ff-4b60-9a0f-845f903d3c9a@oss.qualcomm.com>
Date: Fri, 26 Jun 2026 17:18:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] arm64: dts: qcom: Add IMDT QCS8550 SBC
To: William Bright <william.bright@imd-tec.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260610-imdt-qcs8550-sbc-rfc-v4-0-358e71d606bc@imd-tec.com>
 <20260610-imdt-qcs8550-sbc-rfc-v4-4-358e71d606bc@imd-tec.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260610-imdt-qcs8550-sbc-rfc-v4-4-358e71d606bc@imd-tec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDEyNiBTYWx0ZWRfX6XbA0f8e1nxH
 gvvG+997AgNU2iiceTnVRzFUzQHRW3DL8b5DLCo+vPIXq37g7LxPeIqg7PnmslqjZdjlfYrLP/d
 TFonVDft0/TzacPXdpVxnOO/nxuaqzg=
X-Proofpoint-GUID: xYCylSdb_cjGghPLhavg6rJHx52X-VI7
X-Proofpoint-ORIG-GUID: xYCylSdb_cjGghPLhavg6rJHx52X-VI7
X-Authority-Analysis: v=2.4 cv=P7UKQCAu c=1 sm=1 tr=0 ts=6a3e9842 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=ee_2aqc6AAAA:8 a=Ukjwcb9SPc-JsOuqNkUA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDEyNiBTYWx0ZWRfX4hQoUR0iqLQv
 0Jfs3Covk78j2ERpa6xKiV3Ti0RS5JUhHe97Ji62QWtlnlxFAjDk2npLoFpWCORwwjeEAsddHLI
 HyMuTw72fa1qJV3DyCI4lS8h7nNIAj8hmSoorCDRlR+aeZdK+PY0hNxUiq+g7KaySoXVdmhTHYt
 G3wDrs3LvXjtIFKvDbGpbOCwUc9cGSK9DBw5XKnQl5xF31nybNVUA9XFSMoxzc/9JiBucdx8XvG
 HVVy0c5X45up15R3q8sjku4cKfxnVTKYjwrjSJbJ3dJj/RqwATQVqMToS/QofD5h2URNxv7sG0G
 VOyl1hAkxiCvgmbtv1p/TugLJusPbWBQsFVDgSX/tIc6TZ1kW/ZkKpRdV1Sog6E0bgzrF1Dmvve
 Hspcevi9Ni2yh5Vdrw4lxtg1EXg0VuKjaInoQU1CKuYVqYYkjllusleWnqemJYv/MObFOiEP69p
 lYzsNNJzGM3VQZvvFLg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 spamscore=0
 impostorscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606260126
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-114691-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:william.bright@imd-tec.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 96C8F6CE810

On 6/10/26 10:57 AM, William Bright wrote:
> The IMDT QCS8550 SBC is a two-board design from IMD Technologies Ltd
> built around the Qualcomm QCS8550 SoC. An IMDT QCS8550 SoM is soldered
> onto the IMDT QCS8550 carrier board that supplies VPH_PWR and exposes
> the off-module peripherals.

[...]

> +	/* Enables 5V_PER, 3V3_PER and 1V8_PER rails. These rails
> +	 * aren't used by anything within the device-tree but are used
> +	 * for on board logic level conversion and as rails for
> +	 * pull-ups.
> +	 */
> +	per_pwr: regulator-per-pwr {
> +		compatible = "regulator-fixed";
> +		regulator-name = "per_pwr";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pwr_per_en_default>;

style nit:

property-n
property-names

file-wide

[...]

> +&apps_rsc {
> +	regulators-0 {

This way of overriding that is super shaky - instead, use a label,
like:

--- som.dtsi
pm8550_rpmh_regulators: regulators-0 {
...

--- sbc.dts
&pm8550_rpmh_regulators {
	foo = bar;
};

[...]

> +&gpu_zap_shader {
> +	firmware-name = "qcom/sm8550/a740_zap.mbn";
> +	/* Zap shader doesn't load so is disabled */

If your SoC is production fused, you must provide your own ZAP firmware
that's signed by you. Conversely, if you have a software stack that
does not include the Gunyah hypervisor, this is likely not necessary
> +	status = "disabled";
> +};
> +
> +&i2c_master_hub_0 {
> +	status = "okay";
> +};
> +
> +&i2c_hub_2 {
> +	clock-frequency = <400000>;
> +	status = "okay";

nit: let's keep a \n before status, everywhere

[...]

> +&pcie0 {
> +	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
> +	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
> +
> +	/*
> +	 * pcie0 hosts the M.2 Key-E slot. Apply the SDIO
> +	 * reset de-assert here so any module's chip enable is settled
> +	 * before pcie0 trains its link.
> +	 */

We now have:

Documentation/devicetree/bindings/connector/pcie-m2-e-connector.yaml

which may come in useful here

[...]

> +&pcie1 {
> +	wake-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
> +	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
> +
> +	/*
> +	 * pcie_switch_sel_default and gbe_reset_default are board-init
> +	 * lines that must be stable before pcie1 trains its link: the
> +	 * PCIe switch needs its mode-select strap settled, and the
> +	 * downstream LAN743x must be out of reset to enumerate.
> +	 * Applying them via pcie1's pinctrl-0 fires them during
> +	 * qcom-pcie probe, before bus enumeration.
> +	 */
> +	pinctrl-0 = <&pcie1_default_state>,
> +		    <&pcie_switch_sel_default>,
> +		    <&gbe_reset_default>;
> +	pinctrl-names = "default";
> +
> +	status = "okay";
> +};

[...]

> +	pwr_per_en_default: pwr-per-en-default-state {
> +		pwr-per-en-pins {
> +			pins = "gpio142";
> +			function = "gpio";
> +			drive-strength = <16>;
> +			bias-disable;
> +		};
> +	};

For single-group pin state definitions, you can skip the inner
level and define the properties directly under the -state {} node


> +
> +	sd_vset_default: sd-vset-default-state {
> +		sd-vset-pins {
> +			pins = "gpio4";
> +			function = "gpio";
> +			drive-strength = <16>;
> +			bias-disable;
> +		};
> +	};
> +
> +	/*
> +	 * Drive LAN743x reset high (de-asserted) when pcie1 probes,
> +	 * so the PHY enumerates on the bus.
> +	 */
> +	gbe_reset_default: gbe-reset-default-state {
> +		pins = "gpio138";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +		output-high;
> +	};
> +
> +	/*
> +	 * We drive this GPIO physically high on the M2 Key-E connector
> +	 * to make sure the module is enabled. An M2 Key-E module could
> +	 * be using this pin as a chip enable.
> +	 */
> +	m2e_sdio_resetn_default: m2e-sdio-resetn-default-state {
> +		pins = "gpio41";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +		output-high;
> +	};
> +
> +	/* Force the on-board PCIe switch to select the GbE upstream
> +	 * port.
> +	 */
> +	pcie_switch_sel_default: pcie-switch-sel-default-state {
> +		pins = "gpio16";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +		output-low;
> +	};

Normally this would be handled via an actual driver - see e.g.

Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml
https://lore.kernel.org/linux-arm-msm/20260605010022.968612-1-elder@riscstar.com/

Konrad

> +};
> +
> +&uart7 {
> +	status = "okay";
> +};
> +
> +&ufs_mem_hc {
> +	reset-gpios = <&tlmm 210 GPIO_ACTIVE_LOW>;
> +
> +	vcc-supply = <&vreg_l17b_2p5>;
> +	vcc-max-microamp = <1300000>;
> +	vccq-supply = <&vreg_l1g_1p2>;
> +	vccq-max-microamp = <1200000>;
> +	vdd-hba-supply = <&vreg_l3g_1p2>;
> +
> +	status = "okay";
> +};
> +
> +&ufs_mem_phy {
> +	vdda-phy-supply = <&vreg_l1d_0p88>;
> +	vdda-pll-supply = <&vreg_l3e_1p2>;
> +
> +	status = "okay";
> +};
> +
> +&usb_1 {
> +	/delete-property/ usb-role-switch;
> +	dr_mode = "peripheral";

Is it really peripheral-only?

Konrad

