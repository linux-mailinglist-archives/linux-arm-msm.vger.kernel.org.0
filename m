Return-Path: <linux-arm-msm+bounces-108470-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJ/dEQZMDGrjdQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108470-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 13:39:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DA357DCD8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 13:39:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 61F3630309E3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 11:12:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74B7D351C30;
	Tue, 19 May 2026 11:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TIUL1VHQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CeCwX4ND"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8620349218A
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 11:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779189164; cv=none; b=OCaqAGm6wz3eLrzoMAIr7b7LjTDEJ9ony7F1s/Jmm3bGKZ9aozpFy02wVLm2kBcAw7VGForlSCJ3MjfehXCGXMztDKThR+kwi7QuqPA4NRJ+2EX0XPyzy7/mx/iOElyjhxZrBX2T0lyN5ge/7FJMaNnRntITRIPVLy1Wh4ZhWeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779189164; c=relaxed/simple;
	bh=lN4ebmOI56ySsRA5WjpBi796VYIXOpn2IRp3wLpyJiI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dgnIzCvCGMinvhS22XJWIgkMYeI6GDqwx/DpHzqZ9jFYhnxmS2pxVTjT3oNsXSPLExoAVCuBnfAEevt5fS0zqKxx3IAWPEKf28wW4vZPnm1eBgRSe60WiOgcB8JxIPOTx0AtLzpiSiC6M1RPij3KeL2ee+8emlOsjTeTqWPw/jU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TIUL1VHQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CeCwX4ND; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J7d5GG2975550
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 11:12:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a1XQr65IlqltbgM6x08wrUNNZlwpTYCCV54Ti+76Ka4=; b=TIUL1VHQ6SnO0XV+
	770eD2QJ5MlJ6irBsXZ27TInp9WnSdW1wyPZByNyEINog+Dva/c0um2m939AL08y
	nvlGxJh6VV67lRRsdFufJEVOQ+Ke4RezketMKdFt60vWEL90qnpM3ulFV2TjGIa6
	jFwjStJ9z3zN6AB4dTtKjLM3BBwsILgODdloGC5bJoroAYoq3DML4Cz7k35mb3km
	jotEC/6xHI5aSXjUdU9ffOB+LSJXznOPF235WHbK9NJ4QFg10/6+n2TWruhlV88G
	lzzv4MJvCLVkluUNLjmk+OcMl9En8rJfYz/qNnHNJOW/ONpBIwbxEm8boVng3rc6
	YhrJ9w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e84v4c5ut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 11:12:40 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50e62562b6aso11450561cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 04:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779189159; x=1779793959; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a1XQr65IlqltbgM6x08wrUNNZlwpTYCCV54Ti+76Ka4=;
        b=CeCwX4NDlX/EaqiPim9rRpw/H0baTGqlzRZpfw2zKNj2U4Qn+cxR5ZUDBZ1uw/pLeE
         eUuHDzBhRg14jaRkDy710/H6bbbU4UJNaA45lxAPzNSlvntMHIG+Dd0V9eYqzRpKxSK2
         9pULmE+CslJ/1NGXub6BTV/NjurE9v2C4VfYfUtLeULfasrGenHQzl9sZ3WuzhNu4tfY
         32uJpRSV0cKED4be/f4xp64BCuUn8JPpYluucPcswnLJnuh6fBBPxBtFDzlOgn9Qdxf2
         vu5mPyXuKcYiSHRWB9ikH41GCUN6m9jpq9TzUzBBMyM6VvYmbFiWpnX+cT1dWRbAMKc3
         iniw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779189159; x=1779793959;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a1XQr65IlqltbgM6x08wrUNNZlwpTYCCV54Ti+76Ka4=;
        b=ql04jStkim/upPsGW7AY0qD1+yaT7xsb2/rK02PM25CPCtOlNNtfzKw6Ay4lt9tL06
         eL6VWxhpvORhWhcDJoBmu1face1T4tlL+q05Zyi8jm6XDLinMyKiRBAzSseRj4tdurm3
         I/7wu/wozNPLnwMVkew7UQ6h+52/04iE5SzNSllshrraejJSfuSPFpfOtH0N0JXbW8c2
         1iLdKGIN5a7XCn436Ds6pB8coNZVTBvXxJCPbeqA0sizn5SlUY2rrU6FO3QtSncokU9a
         4j30GmdqoToseX4AmMoH6GfN/adgpfhEa9Q6yzBaTpOljHiY6dO5MM8IpRh9mHijlHUh
         irlQ==
X-Forwarded-Encrypted: i=1; AFNElJ+euVOu9ugJYJKHI2zlHUC8qH9tFR0+Hw0I3itu+3RL57NIfsm7HhOPWLOFQvOL9a5/TQXkpQ4UXi++ym1j@vger.kernel.org
X-Gm-Message-State: AOJu0YwPpeauru/ivrLFTVetYwDF6bmU+fN9vGJt9xkttetQrdSlNvZa
	SjaTtym07AzvwtC6xFKABGCnXP0tcmKUXHcplJG+MVz2MtuzGTGDAFOMjfDI6YgBgT1XQEAF9yz
	UK4tpju0DZh5BZJLnxasC5bk0L+q21+wpjzuvi2eViwAFa+9tWh7D1GTjnZBIfMjCZWBY
X-Gm-Gg: Acq92OH8Ojs8z6pet8qREr4vrOzBilB3JyBFC6JcD3moAqQ4HAJ00Gq46CUROLFbJ7p
	N5ZyyymSakPkMAxmtOxUrp0VQ8UcPjYD7UUFP7wS9CD7bTtST2CFzlHUNc7XBqitGy98bFOfjek
	Et4Tgt3bhffJVcnDU5osXyUNO+wxlbML06RygPnZG8hyrZWUm94SR5clZBDDsw7pz8vzQ13GAip
	loeBFafXyz6aNzaXp7P9HuSg+liUNVcq6yGVl2b2lcHPJsuycNbB+px+PwXfy5bZoGv0D0nahma
	g4SCjHWihucBeRnEplm8RqvgXdKQsxxyc2zrgszndzWn31UXt2e9zU7taouYt3+EmwQH0hkDyr8
	MsE3Td0Bfg650FDfZXXxQS3ZObBoaYkcoLkOV4B8V/PbxOSfG3MbZ0A9Fpxn+1em6yOtd7r8OtE
	JTxaThIxbfDR7aAQ==
X-Received: by 2002:ac8:7f10:0:b0:50d:ec32:b84f with SMTP id d75a77b69052e-5165a0c922dmr185565621cf.3.1779189158948;
        Tue, 19 May 2026 04:12:38 -0700 (PDT)
X-Received: by 2002:ac8:7f10:0:b0:50d:ec32:b84f with SMTP id d75a77b69052e-5165a0c922dmr185565191cf.3.1779189158412;
        Tue, 19 May 2026 04:12:38 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4c631e2sm679135166b.28.2026.05.19.04.12.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 04:12:37 -0700 (PDT)
Message-ID: <d9b2e38e-ce6c-4ce9-961b-aeab7e63a10b@oss.qualcomm.com>
Date: Tue, 19 May 2026 13:12:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] usb: typec: add Qualcomm PMI8998 USB Type-C
 role-switch support
To: taygoth <taygoth@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Casey Connolly <casey.connolly@linaro.org>
References: <cover.1779127507.git.taygoth@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <cover.1779127507.git.taygoth@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VJPtWdPX c=1 sm=1 tr=0 ts=6a0c45a8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=A-Mz9B4pz0Xx8zSY_0oA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: z9D4PTZ22gRReqJhT7SsN26v2gpE4XqT
X-Proofpoint-GUID: z9D4PTZ22gRReqJhT7SsN26v2gpE4XqT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDExMCBTYWx0ZWRfX7W4cFiZaEYju
 cqNKzjo+avwlLaG5rnDxYXW6Kyzw+rdwV9fQJGtYICg+6vwCkYKJdHCwCNo9bM1yCk6TpbW08FK
 svIg34Fo8qXWrow5xADMCVVR2gJukgBl89YESwXTCI54HLSksevs2r8+jP6L3CaFixc+3F5X0zn
 qk9LQ6GRFtL4IV7zsWTh7XHhsCnLOBWkfwbOjS3Xw0Dqs88Rv0XBGJN8i5PGOluIqg84SAQHzSh
 BLCaKlSQXupYkZIOWsgfcj018AEEmNfTzBBQ/kOoxf342GmIXRazxKCnRnKDT65XUHYBE9/HL0b
 xQqQzSvOpsuCmcfTkPpbMNrHNreZa7moG1LuJEZUmIhIGB5/brcE6+Jngs84reMHcEfeQYf8Vjo
 94Y+AbgT7yIBkhVQgh1FOZF2v7+QzTHReXnzN5oSSXuqKWvjSLGljwz5jFjPhEQcfljXxLcEpAH
 Tojymp1nActCktquVUQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190110
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108470-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,quicinc.com,linuxfoundation.org,linux.intel.com,linaro.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B5DA357DCD8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/18/26 10:22 PM, taygoth wrote:
> This series adds USB Type-C role-switch support for the PMI8998 PMIC
> used on SDM845 phones (OnePlus 6/6T, Xiaomi Poco F1, SHIFT 6mq), which
> have been locked to USB peripheral mode under mainline kernels until
> now.
> 
> The PMI8998 SMB2 charger block integrates a Type-C detection unit at
> SPMI offset 0x1300 that performs CC sensing, debounce and Rp/Rd
> resolution entirely in hardware. The state is exposed through the
> TYPE_C_STATUS_4 register and reported via a single consolidated
> "type-c-change" interrupt. The new driver reads that status on every
> interrupt and pushes the negotiated role to a usb_role_switch consumer
> (dwc3), enabling automatic peripheral/host switching on cable change.
> Because the hardware handles the Type-C state machine natively, no
> software TCPM port manager is required.
> 
> The Type-C block shares the SMB2 USBIN region with the already
> mainlined qcom_pmi8998-charger driver. The two coexist on the shared
> SPMI regmap without write conflict: the typec driver only reads
> TYPE_C_STATUS_* and touches the IRQ enable bits at offsets
> 0x130b-0x130f and 0x1367-0x1368.
> 
> The PMI8998 USB OTG VBUS boost converter at offset 0x1100 has the
> same CMD_OTG / OTG_CFG / OTG_CURRENT_LIMIT register layout as PM8150B,
> so the existing drivers/regulator/qcom_usb_vbus-regulator can drive it
> through a compatible cascade -- only the DT binding needs the new
> compatible string added.
> 
> Power Delivery is not implemented. The PMI8998 PDPHY block at offset
> 0x1700 is register-identical to PM8150B and could be wired through
> the existing drivers/usb/typec/tcpm/qcom code in a follow-up if PD
> negotiation becomes a requirement.
> 
> Tested-on: OnePlus 6T (sdm845-oneplus-fajita) running Mobian
> 6.12-sdm845.

FWIW 6.12 has been released 2 years ago and the sdm845 fork contains
a lot of unrelated changes. Please give this a test on linux-next/master

Konrad

