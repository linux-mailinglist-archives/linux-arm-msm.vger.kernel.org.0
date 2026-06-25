Return-Path: <linux-arm-msm+bounces-114486-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SnCFJjb2PGo6vAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114486-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 11:34:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EB13C6C4462
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 11:34:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=NOXp3fKt;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jGdezW1H;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114486-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114486-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2C5C73041485
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 09:30:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC0F5387363;
	Thu, 25 Jun 2026 09:30:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FDFD34C124
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 09:30:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782379855; cv=none; b=dp4Pvn3R30KAhWCNxwQTsO1tKU3MD7T0N+7LKCBWPRdOKPKN2ViC+weHiZJMe4z8nDkDSCv0T8wP4vZ17ioEYD0uW3eI9X4Lw3mkkQ68ZqM7qPStFs+IjGVd/y53sDyw3HEmxc0pNbts0PNfFVM/XqCcjAZOWwo8Umtoe2FnY+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782379855; c=relaxed/simple;
	bh=Ti2vyQS/TU5C7wIgQY3ivFIxKmWrKEzhF5JB+whcpls=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f6qI0EUMWneuC42S0S9FH7k2+QbOdvB7F0J2IacisJHIGOvcSqZe6CrdL8ARdKetV+eot5SavMC5pyHmV9TRg47hbQbRnuCP6cAGZV5NFb/2nQZ53PS1PZzKu4+qwU1x6P4iFzvldoYQIclc76Ykqm8n8TKQJAWMXyB3MU/0ZdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NOXp3fKt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jGdezW1H; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P8p68O1921056
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 09:30:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9kiNU5eCrBUsFdtzJac4egp5/e+quc8h+dzXJz3unbU=; b=NOXp3fKtefJwbSdd
	yHYqPtuwEHf3CCcnxnnbqQmEVagIiBVZMLB5WpZykx51jYJg1ceemLXFOyTob2Y/
	0cRXoCQshJRvJYTnPcASBMs0Ug5LbqGe4f1M6HAC54zNfVUA/d9A8HQnnSX7PK0t
	7HQbkGnvsy0vILul1aTvqGxi7TOZdEzKDIS/8vXFASdNAYevX3YYGUgZxUqyxvfI
	D8WDTR4ljYE9Zglu8DdawiyMuX53BMk+ACAkt5DD7cb1TvYS3nkzoUS/xF6wGbzJ
	Wl94fo52XyULlju2r0KzFlyky1zyBWFG4LoXwySTDSUR6dIHJg58ApOUZJsb0ZPr
	SEZgmw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0uyqhd9n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 09:30:53 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-517796be724so4059311cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 02:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782379852; x=1782984652; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9kiNU5eCrBUsFdtzJac4egp5/e+quc8h+dzXJz3unbU=;
        b=jGdezW1HHPrZRvroJJlQZR+jiYpeeVWHBf08/jboWGAP55KxnfUtqPhRPwiB2CLisT
         EZQMFgFRvEgsAE3pfPBore+6/0WeYRcjiwvurXtVQBsEgnA20fhaZLfmUm02Itc+gZxY
         JqwdpYlfB7sPw/SxP0VldvaPTSKawnjmhO55I/6xGeE7YOU3mOWp4rnzTGhdzwCkEaFa
         4ORn4s4Xo4MjmjddEHl9VM9iEQwofOQ+wC5DaaZJY98j/Y3kRTlWGk4bdNU/IgFf8UqM
         fPw/6NR5fUkTJ6f3EZ5Kq8ZTQ2fuzDhzYjaaKk1W1/visUB9oan77fskNmWvxaiK6x5a
         U3HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782379852; x=1782984652;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9kiNU5eCrBUsFdtzJac4egp5/e+quc8h+dzXJz3unbU=;
        b=G31FbMBEw51KIXbKjPcN3prtF0RIxs1zhA0bxjgbhyYazDm/zC0beJe7bJxV1IvzFk
         jT1C2bSirwb7Ho31RRut+E4C4W39eiKwvaeCyi0aASro8xegJy9ECuyRRE/P/Fje19Ue
         gUqy1WCq2EHz0cr0g0IECzNN61g5mx+V6jxWMdFaf1AQf51iuU2LJl67pfLTurn8eMHm
         gR4SdAMCSW2rTroXxAcYMCuc8aQ/lEctTSFgb1hQY7xqYVjtS37Odqk4Uxu8NRjjup93
         yf876caXg1b22SIVfkvr1kOiSLVF2aCP2H9iaQUG3uZ1qvIBip2R8AyQRwdpeX4jNPwf
         d3lg==
X-Gm-Message-State: AOJu0YynPDAPI6WnfPQqnpLUDm+kFsJvUk5haw/5TkmKmhLkcxS1defG
	kgqc6c1y++MdEZSbZne5MSSw8VkO8/FVgw0E/UZPlaUVg4BiOt9OSyQk9wYkByLcudmvj87+MI0
	POWaUFbkG/C/A+hnHyN9x4kkDbxymrAVUC1uRRDJaCA7AcdL+rIeYxdNoT+EGQPR46z0h
X-Gm-Gg: AfdE7ckrClgK0zQGViLx5AeNtv/9btBd6qyst51vz53QaLp6TldmA4Rb2tOaxHcE+62
	yUiIzvjnd+UD9dQnVAVjoJrYna/kP0ZUZXcZDQXb5iDrT6xOuTKmtiJIJ4RrrpjXt+KfzVR3HAh
	uUVuGv2acK7rY8/bYmh3IWsjvpEQ/rTIQ7ile6T9UWqka59LJ5PRpFBz2In4+HImmLuo1gDRjoh
	yoFO5vz/Z1pjQMQ16AwnL658pH/JXECtaYtWRxL4zT4Lyb1FNeB4KvwyLpbonHoqIrpBhyZSALG
	SS3l+pq7HccCvtY3+yBZpMzOgW6wEvaPoLh4nwwyXH2q9ImVzprCQNXmWcp6xsoOBmnGJfn2iFn
	8dLokD1SnuzCTbckYu6vdyDpx91eQZnodgg4=
X-Received: by 2002:ac8:57c5:0:b0:517:6162:daf5 with SMTP id d75a77b69052e-51a72a47ba5mr12397631cf.3.1782379852404;
        Thu, 25 Jun 2026 02:30:52 -0700 (PDT)
X-Received: by 2002:ac8:57c5:0:b0:517:6162:daf5 with SMTP id d75a77b69052e-51a72a47ba5mr12397371cf.3.1782379851814;
        Thu, 25 Jun 2026 02:30:51 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c120dcc55besm26167866b.44.2026.06.25.02.30.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 02:30:50 -0700 (PDT)
Message-ID: <a4073f5a-1965-4a6c-ba39-c236429e2db7@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 11:30:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490-rubikpi3: Enable cameras
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, rosh@debian.org
References: <20260616-rubikpi-next-20260615-v1-1-3d96b89397ff@thundersoft.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260616-rubikpi-next-20260615-v1-1-3d96b89397ff@thundersoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: DHfh1IoZhrhCjXc2XgGAn4Rby1nuBNxD
X-Proofpoint-ORIG-GUID: DHfh1IoZhrhCjXc2XgGAn4Rby1nuBNxD
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA4MCBTYWx0ZWRfX5KC54zQvS/3/
 8aBQnYi37z2gL28y9pqR+u+iIHacIbDpHq3iMJ8+yVCwc1Wz/XjrYKi38EU57+Hzi4hjavNZ+Yq
 VK5XzvFsavz9mncil39jTXoppqMCuz4=
X-Authority-Analysis: v=2.4 cv=EsLiaycA c=1 sm=1 tr=0 ts=6a3cf54d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=Wdb1h0LgAAAA:8 a=_exkqQx61WUZkfqn73kA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=j5gyrzqu0rbr1vhfHjzO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA4MCBTYWx0ZWRfXwSdLR/1elNAU
 6kTDLJ0Z5QO7MCPnAwlSkNFDL1GdMd8h63BnLcgl8ZGXjmMgeoalJ4wzMYmzoRvkFEyrarXp5xH
 rhlct579VMyoTulSUtjDsUxIS2HEsgMTxHDYB5QTf/woy2NGJkhVJZEbNTIPnOuW5MASlseds/v
 PBxYPeSFOfLc5V2T5wAHlS64UfgY8wHSsnKnCl0AD7oZTYiJtu9SQGE9JfiEn3nApXM7lC2K4zC
 JDdWC20s9dHUKGV8uL+vkGq42UZSIye/aMCehUkYRZjP8sfOtxPkwkg9zVbS4a/P0Ivoa/x5Eq4
 ValfkMxhgAksCCfzST5PjigoVY1jW2leUwmm/sVb5zRwcx/OZRLGdOtMY005MjtXutht9e0WnZk
 w0Kqchv6vxMu3IrD98QDfXPJKUGGTR4vnqW1YUf5iPu9mk3SsdXnDb2FR/hKkK+vZMMyVuuXA9A
 jXxR1PN0/YDAu2UPp/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 adultscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250080
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114486-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_RECIPIENTS(0.00)[m:hongyang.zhao@thundersoft.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:rosh@debian.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EB13C6C4462

On 6/16/26 9:29 AM, Hongyang Zhao wrote:
> Enable the two Raspberry Pi camera connectors on RubikPi 3 with
> IMX219 sensors. CAM1 is connected to CCI1 and CSIPHY1, while CAM2
> is connected to CCI0 and CSIPHY4.
> 
> Add the shared 24 MHz camera oscillator, camera power enable
> regulators, CAMSS endpoints, CCI sensor nodes and privacy LED GPIOs.
> 
> Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> ---

[...]

> +	vreg_cam1_pwr: regulator-camera1-pwr {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "vreg_camera1_pwr";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&tlmm 57 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&cam1_pwr_en>;
> +		pinctrl-names = "default";
> +
> +		vin-supply = <&vreg_vcc3v3_output>;
> +	};
> +
> +	vreg_cam2_pwr: regulator-camera2-pwr {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "vreg_camera2_pwr";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&tlmm 58 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&cam2_pwr_en>;
> +		pinctrl-names = "default";
> +
> +		vin-supply = <&vreg_vcc3v3_output>;
> +	};

Are these supplies part of the baseboard?

[...]

> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		/* CAM1 is routed to CSI1 / CSIPHY1. */

I believe these comments are self-explanatory given the names of the labels

[...]

> +	cam1_privacy_led_state: cam1-privacy-led-state {
> +		pins = "gpio18";
> +		function = "gpio";
> +		drive-strength = <8>;
> +		output-low;

Please drop the output-foo properties from TLMM pins, the GPIO
state will be controlled by the driver

Konrad

