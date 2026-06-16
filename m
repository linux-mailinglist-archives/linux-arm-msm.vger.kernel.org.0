Return-Path: <linux-arm-msm+bounces-113380-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wn1cCjAuMWqadQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113380-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 13:06:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A6E68EA0B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 13:06:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ZkRnSBjm;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="Xj1KJG/D";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113380-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113380-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ED51B30557C0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 11:02:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42941388E4F;
	Tue, 16 Jun 2026 11:02:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75613B8BCF
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 11:02:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781607734; cv=none; b=rs8znQF6DKzwjCLMvwm+/zgJqCJhkbp40ndUprigaX8v6dmEfUV+38nnuXCvnj1qPyAmbzPyij0ZhbWPuJVKhuR1waAN2FcfPLsqUkkPB+8Q/OoVDZgeGN4qmjq4YiygQRtv8qLiaeOBqrbCh8nR6RQGUvP4/MA0KHMMDmWeZg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781607734; c=relaxed/simple;
	bh=kj9ICbrByWaOlIToQUaQzYGm0Ti3zSuSC7HqDM1vfj8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MfpYU9XadhjXPkGZv3r7bOyXJnp4aQ7McWoCjJpODi4W4e4EDJtlSEtRZpvPTf06pUr+oBMlNqzjPenUETda64gr7oJhLdYU+YyQKt3Tx99hkDcsqkwbreAkkVt20XFcCqw1bHZGPntmugrvcDQMpk4QQXOz+DVEDQPwK/qNhnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZkRnSBjm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xj1KJG/D; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GACWX73474774
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 11:02:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G94LMmeu4eZmksKIZ433voX4OApuflSFpNGDq5tGOoI=; b=ZkRnSBjmxjtNbFsc
	L+g4pmn8spfT0lilsFz1VmWx/dM6SYSYdmeeRSEYCq2eu4l9oP4+bEZzh3BDBOSB
	VYL7VpQDnSY6MycclA7CzpqDtI0S1YvRri5UKQV9SvVx0SofoMA+/uI30PtJoN4k
	MsuGKS8K5H4rIK3cMZFcvy8yYV1sLLgOJhF4uSQ/gGuQEw5PBxEmgGhINz+D/tG+
	egn3n5NC9T4weeKgskemTTQbiNdPXE+Qci9kk8eTy+z56EsnhdS6VAbJtrwkwM7D
	dDRvxsFuEghR27IBw/pGlnDXUjeMMoUo0TprCV2DeBLbqgGnRAU3dKdHMBghrbSI
	Ul4pKw==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ety52sn5x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 11:02:10 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-43b86e87334so141866fac.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 04:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781607730; x=1782212530; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G94LMmeu4eZmksKIZ433voX4OApuflSFpNGDq5tGOoI=;
        b=Xj1KJG/DMpYVxI7/M8s5ebG8rkyzMOimhQM868PJZcK1Eyh4HrsOVvA/GgRSQBwXVA
         EHorR5x5b8oZV1nwLTtNcSNbBHOF6av5fvUzV1BJq11xbXoKNo1Kne2ltj1425wTily4
         Q1IieHSCFAokBFpT4mv84VBIR8qkKF+5Y9rtyjsD1cUIDARAdZCbf2Nr8nS3EJczcng+
         SzJj7EloLCVVc8yq/Mi8airJ82LJinajx+Ikse7qdIXYz2c3rQlBISRebEsPPcBI1RHw
         jI32omC4L+ZyqhLHr07tSUyVY6f2cbeVug3NcWjjeFUYbfvorPYSXDPas8zwF09p3IIU
         lgMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781607730; x=1782212530;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G94LMmeu4eZmksKIZ433voX4OApuflSFpNGDq5tGOoI=;
        b=WaEHNdLRox8PPaLm+FRL4RQ4zGRs4Gy9we8AwEnuNk3Qwj1o2u9H3x3XAiCpA5ZD5z
         tyZ5DOFAhuPtDVS+/3f67qqF9Zg1jnPVyQybUKzdn57ZaB7fufYlT0WFMPIwE+nzrsOm
         GJcse0zskqNDE0ezFEAT9Pa27uaukM2kzEbFAK/gAYIUXbgIz3NPqpDHVCGPHKiQbbWW
         TL+n9lot1XNBqm3rDnH37rzlP24QhMj1DYvrmXfY29qOvWVT+fWxpCUfm5PPl5kjl6RL
         g3IMemfvJfZzo9+olKfT427ehbJC93MW/Vz8D+u90SsuRNlgSdDpr//+LB/sIs2e9l71
         qr/w==
X-Forwarded-Encrypted: i=1; AFNElJ+2CnQ2PpUrrMhwv1gYlaRR6oqjGjvlUQc/lW6dL3akT2GKodqb4h98uIgvChvnVVjFVM2X53lKKSEE9C5J@vger.kernel.org
X-Gm-Message-State: AOJu0YxUWgpUsAIJ2YYcc1Fh0zUh/BSd5FmRzF7fEk5DzVXxARHYyN31
	/02VOIxW2Rw4DAX39jDRIHEeE4cTSMclRuG0BH70kTACR116BKUbEMAt1F0RVWns3xy5+U6lEjZ
	aoEvYW4Fr2+e1fQZ2n9QrCUvytosy/ruXBewiupSkKN1qoaNN607fP+WLvO5gjyATIhIT
X-Gm-Gg: Acq92OEVGesnaxBIqqVmMLuybfDRN79FVehUZy++lTtqFrkKPh53n/GVaoBE7acXm0/
	K/V93tX5ti1mVfvX95jX2bNAoOFgvOnD7lS+loH1QcQNqxnTPa0LPP+/MBT8YySeyd8MkTbuf8q
	J68do1c8KAydsFv22l5WLjrir42Zfpk7/04DIEGIJzC3P+bdCJ6QAwPoTMur+lbwgQ2NePZTZ7K
	PxxHaEuQ8qgnnsv1Y8aUnOCmHX9aP5DzYT6BA9yTEhcC6s4vEqKUuR+WkLusd+/xCePjm8FLDuA
	/JneeGKPjamlBZbvWL+b55k1oXpl8sxZuMChbWINLEHJR88c57c44LVWad0fN6eTuMMBzKZH9WM
	H6oNl4P9zpW/4ZR0MBNEO0IABTWL/I+fnzAK/HX/13qQ97Q==
X-Received: by 2002:a05:6830:2706:b0:7e5:68be:ee7d with SMTP id 46e09a7af769-7e7847a4867mr8582245a34.6.1781607730110;
        Tue, 16 Jun 2026 04:02:10 -0700 (PDT)
X-Received: by 2002:a05:6830:2706:b0:7e5:68be:ee7d with SMTP id 46e09a7af769-7e7847a4867mr8582196a34.6.1781607729642;
        Tue, 16 Jun 2026 04:02:09 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb4b240bbsm640579366b.18.2026.06.16.04.02.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 04:02:08 -0700 (PDT)
Message-ID: <65995138-0d0b-4b8f-ac13-8daeb82d1767@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 13:02:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 RESEND 5/5] arm64: dts: qcom: Add device tree for
 SA8797P Ride board
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260526051300.1669201-1-shengchao.guo@oss.qualcomm.com>
 <20260526051300.1669201-6-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260526051300.1669201-6-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDExMSBTYWx0ZWRfX9vmfvR6yGqEm
 l6dnCRRNaSoBN6R8mnYg0vqLf5Jk+kn5tk535G5Ry3m8+Xdvk41NiBHWwkL6cDZ5tBMBIVeONce
 Dv2xTIwV07v2K8KMx59yMjvW/wTCWbE=
X-Authority-Analysis: v=2.4 cv=FJwrAeos c=1 sm=1 tr=0 ts=6a312d32 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=P5_WXVEU6eqHpsoIjFUA:9 a=QEXdDO2ut3YA:10
 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDExMSBTYWx0ZWRfX1KDgL/2Ss0Q4
 MrQN2aU1Y9pYqruQrf4Nu2DicmTc/o4fGwqAlxuIvTUYGFgs+L7hK45hpO2amxBsvWDERkf5RfT
 mP61A421obzi5QVBE3QtxDCv1W1LWAzLcKRSzvw1EcuIdKHaCghZ17u1SCdUzU1WZwniFJRhQc9
 WYT1F3FzJh3gsGqNYCkGb17WGTKNkyormQ4i3uzdfUKJhLzNlLYOO/ViDHRG//RKjeObf6mxiKn
 CxT1vMK8giUE3w3ECDwJUUIqw9XkYtPxrULRpS7KmH9zG6j9ezZG2/6qP3uDpSrcu9MgBzFk7s1
 99YLC+jftU40g5MLFGJ7JtoBu9aW1qZhzPspjSYrBAXIQQZgpWqZDHW8ehMtU7XQPYDn1k+9zq7
 eJ+r5czeMdC3zLjtU/wCDlONKLIufYMWXSp6zMJuS9om9cSf3F8DWYf90qAGtmbpPQpfMnnLgMq
 mLLoxgSMYwM9oFmOq9A==
X-Proofpoint-ORIG-GUID: 1GESQUJmF2yzRloCpS185qDlmW1J3top
X-Proofpoint-GUID: 1GESQUJmF2yzRloCpS185qDlmW1J3top
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0
 impostorscore=0 adultscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160111
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113380-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:shengchao.guo@oss.qualcomm.com,m:andersson@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:lumag@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:deepti.jaggi@oss.qualcomm.com,m:harshal.dev@oss.qualcomm.com,m:herbert@gondor.apana.org.au,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 74A6E68EA0B

On 5/26/26 7:13 AM, Shawn Guo wrote:
> From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> 
> Add initial device tree for the Qualcomm SA8797P Ride reference board.
> 
>  - Configure UART15 as the primary console and UART4 as the secondary
>    serial port
>  - Enable UFS storage support
>  - Define thermal zones for PMIC dies, UFS, and two SDRAM sensors,
>    all sourced from SCMI sensor protocol on channel 23
> 
> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

[...]

> +&thermal_zones {
> +	pm_kobra_thermal: pm-a-die-thermal {
> +		polling-delay-passive = <100>;
> +		polling-delay = <0>;

0 is the default value, you can drop these lines

[...]

> +	pm_kai_0_thermal: pm-e-die-thermal {

s/pm/pmic

> +		polling-delay-passive = <100>;
> +		polling-delay = <0>;
> +		thermal-sensors = <&scmi23_sensor 4>;
> +
> +		trips {
> +			trip0 {
> +				temperature = <115000>;
> +				hysteresis = <5000>;
> +				type = "passive";
> +			};
> +
> +			trip1 {
> +				temperature = <135000>;
> +				hysteresis = <5000>;
> +				type = "passive";
> +			};

Do we need two passive trip points?

Konrad

