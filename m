Return-Path: <linux-arm-msm+bounces-112465-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZXeLHfdhKWouWAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112465-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:09:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D1666999B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:09:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=eXBnBGoM;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=BJFLIf73;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112465-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112465-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ACD8530A5B04
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 13:02:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06C8140682D;
	Wed, 10 Jun 2026 13:01:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A843A1A3164
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:01:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781096518; cv=none; b=Clr37f2ewjyzPpt1Adl43Q2h9/guvmUHQdRIiAYf1nseSjxSpZRlMV5Ww6dlUdClVMyvuawPtdL34qveO6o8iTNrI+ad4W9zR+y2HwC5zRImmupUiBrSxVKo2frf0+3dUVFojE4Djux54P8WrAgVUecuReFyGf8MXXOvnD8aKJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781096518; c=relaxed/simple;
	bh=okMsujna9JJfzimgePHNP1r+SJyV9s1mfYXKGRXRj/I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I7wVCCmrMjn4x+fSpzAwkz4uKe3nDP4U7FV3/ZoUa9eKxKKd9SshWy0mQfpt6I6zLqaRVs+j0bitBYJZIf+8x6pmzWgLAFx3vHkqQTn52Au3OzkDj1TG3xYZoNJcmcFefE0tqjSoKYxLHhmbU9s8ywBQ1OazFvKARLc/M1ZMlGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eXBnBGoM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BJFLIf73; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACBjad1137730
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:01:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P4oi/ADBZvkBBoAhp6aJh8JuOUiWJGJWcTxsjS16AuE=; b=eXBnBGoM1iagNaxF
	ENa1krqrbFWOIMIsmTXTP9ETW16oJ97epqYJoWMrwDD2yHv/2b+i0dPG0cjy9nZF
	Jno5eiBaesQD1/6fqNUoBLQS601Omy2zhfMCaFqUfaag0ldOLYzmsQ/UPQEii35I
	VuVuzUtbxXp8f0ePEaYj6zy2gGXHi59AnRGf1U9k2wyLiZtijEXrjFDZKb4sqPzt
	c4oeaXCYulI7YKUs3sGNJlXjygG/KBDZ/mCVL7mWo+9VnsIYX4YP4Qg03M9sNtKf
	ARHlQZepnr3IXSrjMFWWqnn9Wg/eFLmFf5P+6t3pJv4fITE8L9wMzYPy1RgKWU+G
	7aV0og==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnh2jvb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:01:55 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-915a4ca0a4aso201755885a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 06:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781096515; x=1781701315; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P4oi/ADBZvkBBoAhp6aJh8JuOUiWJGJWcTxsjS16AuE=;
        b=BJFLIf73q82Bsmay1VpEJvVI+a30wL5W/bUCGSRucvFueKYlpAvSOTk5YXreAvAfuR
         ZeJR24NKhc4dVU1sCHyQKNSaJo9KmOWvV10hMX3N1vXu6cD/6hjRIK9usmL34eCdgdNe
         SOu/Hcmci4OroDqMtsUY/aeZsyZVO27PasQBgXEwzw18CRDt50zhPcd8W4SFIvVPbKXj
         IDlvftdsTVAa38guEsF2xbF2KqS9Wt72jByiJ4f5Euo76bINBNrpqy5C9RlXwqZxNGpL
         omsjOc709x6Ig/voaQ4QpjTPXMvYt0Cv1iG3QroA57O/wJd9BGdbZuaCnBOr62b6Ci2R
         8Vjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781096515; x=1781701315;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P4oi/ADBZvkBBoAhp6aJh8JuOUiWJGJWcTxsjS16AuE=;
        b=OngRzMy8tpqMc7i3aBy01pQ7YcQ2mpSQ3W6NJjZArNxTorXmZza05ZIJC2TV9sTxT4
         MPoXv+UTm0kWXU6cLhODGGnhRd1NEALmPqNt5oKba6C1jGK1yy1+tmdwnQvZYV4fATmB
         zovXtv6pETzdeMtYB8laPUqJElaPEBsQg+beabXbCTEdgOk/4MfPHUMDP0bAqTbAqmCK
         kjm3lfjOmgA8eppdTHvh2kQx0/YNxk0/pW21JXH5Zq8ZXwgSiZOHYUF8umzf1jKJ6ahu
         gCHs9k3cBqlSbSKbbLY4qgHiPp2i6VTWFKz5rkGVL3UrgIxDxirw9lbYPEg5zFf85l+B
         yRFw==
X-Forwarded-Encrypted: i=1; AFNElJ/Tl1Q0hoPwayluHuZHmIzsnAHlbVB4xsajlyhcOnCKnEO9Bh/BysFm52g+0QfoBiKy/Dk6zhfYGzw9WPbD@vger.kernel.org
X-Gm-Message-State: AOJu0YzlwdfErAD8+xSuA4PNWXf2X0WtYAufNovAZDEL8uNC7LBOPImo
	wORwyrzj1ESk7pmd2R1F4wjEKQq2+qbBR9Z/sMRCAyrHg9VSMTdYrVJG2EdGerTkKl5wVY948EU
	IYlxkkAA91jiuu7AC99ViQ5z0zYCBxDSV6tLLzd1K/nJpDLWtBTJEsrajGaioF2HGQl4T
X-Gm-Gg: Acq92OHg3d4BLPqwDuIJO+y152uaDOILvn+O/wJDKZq4UHrI0c7x6o1ECOvv70VlJmX
	euHifSmn4HIvBT3/kgIt5Pu1a3VF0uh4Rh9/u5Xvk7NOwXXPX1a7byBhSbJrG3JwkwfMFlqe/hU
	Oy3QOCDmfBgXCT/7/nEmFiJngOpiBKipWzdFU2prOGQh2pZ6eXGcmlUuSLj/M6rVZg7rLPVChul
	yVDvnX/mxkP4rHKvqlsBRvd8LXXAynCtp5+YNGEEgK5IyY7Bs0r8AAkYWfKYYtHgG1fFXoPkNyR
	YrwYtkqY1p3kmGH7oAsHaj6nELV7A3q1vYyxi1GuZxTpIn9jGDtP8+Yel7XgujT5I5Y4ElUFvkG
	DBAqMjCEeGxiFCTAK+GGY/uauGc424b/X7yVmWVZgaGamiv1oa9UvCPW4
X-Received: by 2002:a05:620a:1a06:b0:915:79da:a898 with SMTP id af79cd13be357-915a9e33362mr2276736685a.8.1781096514543;
        Wed, 10 Jun 2026 06:01:54 -0700 (PDT)
X-Received: by 2002:a05:620a:1a06:b0:915:79da:a898 with SMTP id af79cd13be357-915a9e33362mr2276723685a.8.1781096512405;
        Wed, 10 Jun 2026 06:01:52 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6914f3b583bsm5866907a12.29.2026.06.10.06.01.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 06:01:51 -0700 (PDT)
Message-ID: <cc48189f-421c-4d04-945a-5905fa52357c@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 15:01:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: Add Vicharak Axon Mini
To: Ajit Singh <blfizzyy@gmail.com>, Bjorn Andersson <andersson@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260607113658.25117-1-blfizzyy@gmail.com>
 <20260607113658.25117-4-blfizzyy@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260607113658.25117-4-blfizzyy@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEyNCBTYWx0ZWRfX5yVpZIJ7dsGN
 /qXXbFysohTA9Lwj9FWA3s46XvvJMRIu39RRWpw+A6+aJI2qUb0Au+Wmv0mNSn7XfXO8yOY23pv
 Jzekjenn6moF29Po8ed/1Pyt8kFuxVMqTUuIDM74YkBhKVkVJjurIy3TQP6qNgFJ6OeS2MrMUbP
 CIMeK8E/NvSD8zItK3nO7g/yqt++czhdf9bjBuXG2KDc+5V0uHQd2D//ktpNBPuOksT23KkBNYh
 iDYXCeQw7A4rxjftU/aBQ/dpuEyfeF9M+zQIzGkbRwKS5nXlH5GdgcRNR0tt6/QouGQRnC2iQwg
 z3spgAJ+nKN2cCIFpyoEDt9vg9493pvGMh5JfajZAROa32X2Ekpfi86lpLmG/a8bD1fKia6dkfo
 Xy95I25GwhOPa43+seLK/JMokQwwvDk4XMESZyq2LPWBRowgA6gxZXWV+m5S59upu0nTwyj27cv
 KK1hVkJ5IQ9pKPkCVXQ==
X-Authority-Analysis: v=2.4 cv=Xce5Co55 c=1 sm=1 tr=0 ts=6a296044 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=i4oUUBczqS0nELP1pzMA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: IUPSmqKkLGZuvtXMhsmHhN89ygzNT8Vn
X-Proofpoint-GUID: IUPSmqKkLGZuvtXMhsmHhN89ygzNT8Vn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100124
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112465-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:blfizzyy@gmail.com,m:andersson@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D8D1666999B

On 6/7/26 1:36 PM, Ajit Singh wrote:
> Add DTS for the Vicharak Axon Mini board based on the Qualcomm
> QCS6490 SoC.
> 
> This adds debug UART, eMMC, UFS, SDIO WLAN, USB 2.0 host, PCIe
> support along with regulators.
> 
> The UFS ICE block is kept disabled because enabling it currently causes
> an SError during qcom_ice_create() on this board. UFS works without ICE.
> 
> Signed-off-by: Ajit Singh <blfizzyy@gmail.com>
> ---

[...]

> +		vreg_l16b_1p1: ldo16 {
> +			regulator-name = "vreg_l16b_1p1";
> +			regulator-min-microvolt = <1100000>;
> +			regulator-max-microvolt = <1300000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +
> +			regulator-always-on;
> +			regulator-boot-on;
> +		};
> +
> +		vreg_l17b_1p7: ldo17 {
> +			regulator-name = "vreg_l17b_1p7";
> +			regulator-min-microvolt = <1700000>;
> +			regulator-max-microvolt = <1900000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +
> +			regulator-always-on;
> +			regulator-boot-on;
> +		};

Any reason for these two to be always-on?

[...]

> +&usb_2 {
> +	/* Routed to an onboard USB hub for two USB-A host ports. */
> +	dr_mode = "host";

Do they need to be powered/power sequenced in any way?
see drivers/usb/misc/onboard_usb_dev.c and e.g. qcs6490-rb3gen2.dts
-> usb5e3,610

Konrad

