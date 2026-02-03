Return-Path: <linux-arm-msm+bounces-91679-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MFDrB8L5gWk7NQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91679-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 14:36:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 93980D9F1C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 14:36:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B5D6130929EF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 13:35:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA76739E19B;
	Tue,  3 Feb 2026 13:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F1X4xgzf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CZ8o1RmR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E94339E6CC
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 13:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770125738; cv=none; b=dCZELbSSKlsupjsnVIJw2avDP1lvN1DtJlF5HoEs0jHifBPk+8hct/ivur1T5Te1fNtYoczDQyIR+NZ/bHqAWoHAEddtcP0FcE+sYH767YQX5uwz2F4WySHmacJ1lnSKIkY6GBv78/6/52uY+Pv6C+Os6WMKlkId8EgXrYGg5VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770125738; c=relaxed/simple;
	bh=yhkPRi0ykYv+/r6lZRFmlj13ldSW6PPkSFHE4XNFCw4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NLDiJjRigXZRl3G9kyS2n9HGgKWxb/nUHQT0pqZv3ejNz3Az8Lulh9Mhxw4gAYgJ+tp+KodkEIguVN0MCtIcOmeOQxid/gTm91dceVyNoI97Q5RbtLR2nliCeNtqpOodUDkCejjVxgR7oQgDfbX36B3RVWQjISwHA04O2qSOq+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F1X4xgzf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CZ8o1RmR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613CAMmd1192573
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 13:35:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hJLSOlCwUoSC3zdBMUZ/I2OvP6LPIYSpZBcnJOK9LSc=; b=F1X4xgzfCqVUpMMw
	FRtiUiHWxSNr45rvSIlaCSLWroD3NQNZ+JlprQWsvskqibLreC7pMaGHxS9fI5CF
	opBgesQsC/Wby75TkJBphc2eWR2tvl3dx12lzTQ+upb/4GJxGywyhc7d6xYnokzM
	lxCI9dwqbek0BBk5NSozDg7jgVmqZKJKqx69hq42DTrp2ubGcag4iqXvszZdJ271
	BKOB05XL0uDtRADAU08MkImOMXPbH5IJH/AxTYheJwFSqS1T63ldSsp9M39s1WCg
	zOk7uZh3kZqG/t2XydueSSZWeJPdxfMetudK6DQkveTjagTVkmmn81S4xYCrb3F4
	wg1IKA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3gsr07et-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 13:35:35 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c533f07450so145350385a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 05:35:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770125735; x=1770730535; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hJLSOlCwUoSC3zdBMUZ/I2OvP6LPIYSpZBcnJOK9LSc=;
        b=CZ8o1RmRPQ2faiOQdtiI3EuOvLZKBHwW1lA4h7DWQXesJLi7vsIb0QmITnEM2fDp7Y
         suhV4WkQSFEsN7SiuVuNEY7iQiFrTtnDZHvIiDPAxId/iMmLP5y6Nm0i0e8xm45LljJe
         czZJoEG6ii2wHHSIc/xgNcpLInInX1HcBnmAG81mHUWvzX9pjxjtK9wHs9dEgt2k0kZq
         eP1rAzEDOZ2ftZHkj3Tkn1bizEwGIqFiyZ9eesDPgokcW4HhHUmQMzx+6jRmgK4ewEbF
         KO9rzs3C8wBvHlGI0wGUQYebnVPkx6FK3Ha7Dofw8fMRDMuzHkkAF+IJ2GiwJZQUjhub
         xxvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770125735; x=1770730535;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hJLSOlCwUoSC3zdBMUZ/I2OvP6LPIYSpZBcnJOK9LSc=;
        b=FFc59Y06XIQmGJfubldGVcb6WDKfXxKjuPndIaRljh9Y0IFunzLjJtZPeKxuYXYqer
         4xxxbUyKm3vW3aWddyqz8v4i5yi5VlBY8KyRoDWQJA75EZAZVtsoJSBc3zU/sPcobm1W
         j7Sqv2u5TU52eonRIQhZZVjv1FAeSnyrZKm+tcdNKP2H9gA3zcU56WTzPuRizXkkg3YX
         l8fRvtAhyGW2Xf3dwIVietsnCXGPkafLYOPc6ADmxXmE5fY6Ive79CzVfvfILWK3liaW
         vRzH5splXaFm79n9jTzrcvzcDfy36d/pe8tV4QjxqEOFVe/fIjuJWw4ynM82BVvW/FwU
         C9hQ==
X-Gm-Message-State: AOJu0Yy0/LE3DDe7iIZ928MqXL/4+CeF4GDJmvLlvu8m4WoCJ3taAVPP
	eB1hDNYHYADxstZNC5Jz7DGdOb49tDB+77sa6WHaBCDJd2oIhFutXU5ioo5Pc1LTmSiTfOe9dg8
	XM1zIyYgdOpAnrPi8/qAj3JB1eNBcJBQRLFDjMWgMZcTIpqv8U9THi00qOrRrtCdAAd3B
X-Gm-Gg: AZuq6aLU172nzxFM0UocwozoxlVaLAjeemsjIrurZBzcItIcdtJf8XW9Pu+fqnxIuSY
	guPby9Kkk1ZgwYUx2x3w3IYnd1KKIb/AiLjQkARPWljKFkU7If7CnLycY/YOAQUjup/Zzk8NImo
	vEPlUCwebNoyypa8fIhVdgpAFK4OK/LHdKI/KfiLFBrRYRRWZMr5NQ8CK5O1Qrq50q1zTg/xf5s
	M3+BU3cGNXgUSc8c0UYv245EreKHBeBc2BoKbSKOC5NSvno4w5ElRl8aFpy/ti41RpdOvPntSC3
	B0ESJVBjjeSiHqyHiahIcgaXeO8saX53t0HPvgzxO0S//uRKvvCWQ71cKtpy96fvwAjYbsnPpsH
	sB6zG6pwqvkmK6d7ufuHSfu2gMXcQeppuWisb9ORc0HfMiq17E1BdjCDNTV93u6DteF0=
X-Received: by 2002:a05:620a:4141:b0:8a3:d644:6930 with SMTP id af79cd13be357-8c9eb2b920amr1467182285a.5.1770125735231;
        Tue, 03 Feb 2026 05:35:35 -0800 (PST)
X-Received: by 2002:a05:620a:4141:b0:8a3:d644:6930 with SMTP id af79cd13be357-8c9eb2b920amr1467179585a.5.1770125734777;
        Tue, 03 Feb 2026 05:35:34 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbefc56e8sm1036415766b.15.2026.02.03.05.35.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 05:35:33 -0800 (PST)
Message-ID: <a61eab24-a5d9-4253-b27d-89961b62665d@oss.qualcomm.com>
Date: Tue, 3 Feb 2026 14:35:30 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/9] dt-bindings: soc: qcom: eud: Restructure to model
 multi-path hardware
To: Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260126233830.2193816-1-elson.serrao@oss.qualcomm.com>
 <20260126233830.2193816-2-elson.serrao@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260126233830.2193816-2-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=A+9h/qWG c=1 sm=1 tr=0 ts=6981f9a7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=JfHo2pUdUrpnrbDD1w4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: xN9H0GrpLrBoB_9oK_a3a7p76aIl_mNZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDEwOCBTYWx0ZWRfX3cPRw5nIZa/O
 1RLL+7HqqJVhqCEfWfzR/6BkWdkEEvraMvFvw2g102SBSovOkq2xDNRRaGgBj2oHxANneb82dc8
 sfqT1LMx/XQSMeabOyIpxCJTBm1zgGJzIKgeDfj4RCkcKWhDf+XpubTN09y7AsHw6XlJQWqcnrV
 yRqnceN0YdV7inUumj7OgoRwGsAkvENOoWYQ+konrpTM8ONz8H2CGqgJYP3471E/mfqbxrjg9VB
 TTCAZdFElgzT8GVwncNemgjbKanAASMHNtDZxVTAAYXeX1aqHmayuU4QKQS1ifftRHit34qm6qr
 uy9J7AWUkIySiosIX8jUIo8Sa476NxZoXDcMglvicZSfkXQSl+5uakLNxrVzIhengC41/8rjKyC
 /gUA3lcBAU/G1aeO6bxRG9pO6k7cIz8xQukExKTHTGxahhdRCiJk6D/2WTLEMcOW74xZE5RO4fN
 0LppakNkqU3W7cVcKRg==
X-Proofpoint-GUID: xN9H0GrpLrBoB_9oK_a3a7p76aIl_mNZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_04,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030108
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
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91679-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.0.0.0:email,qualcomm.com:email,qualcomm.com:dkim,0.0.0.1:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 93980D9F1C
X-Rspamd-Action: no action

On 1/27/26 12:38 AM, Elson Serrao wrote:
> The Qualcomm Embedded USB Debugger (EUD) can intercept one or two
> independent High-Speed UTMI paths, depending on the SoC. Each path is
> distinct with its own HS-PHY interface, connector/controller wiring, and
> UTMI routing behavior. The EUD hardware sits between the USB2 PHY and
> the USB controller on each path.
> 
> The existing binding models only a single UTMI path and does not provide
> a way to associate the required High-Speed USB PHY. EUD relies on the
> HS-PHY on the selected UTMI path for link signalling and correct operation
> of the hardware.
> 
> Historically, EUD has worked on platforms that use a single UTMI path
> because the USB controller maintains ownership of the PHY during
> enumeration and normal operation. This implicit relationship allowed
> EUD to function even though the dependency on the PHY was not described
> in the binding. However, this behavior is not guaranteed by hardware.
> The current binding description is not sufficient for SoCs that expose
> two independent UTMI paths, where the PHY association and port wiring
> must be explicitly described.
> 
> Introduce per-path eud-path child nodes so each UTMI path can describe
> its HS-PHY, port connections, and the role‑switching capability of its
> associated USB port.
> 
> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
> ---

[...]

> +patternProperties:
> +  "^eud-path@[0-1]$":

I can't quite put it into words why I don't like this name, but I
don't like this name.. That said I don't really have any clever ideas
for a better one, so I'm not going to object, suppose I just needed
to vent my ramblings

> +    type: object
>      description:
> -      These ports is to be attached to the endpoint of the DWC3 controller node
> -      and type C connector node. The controller has the "usb-role-switch"
> -      property.
> +      Represents one High-Speed UTMI path that EUD intercepts. This node models
> +      the physical data path intercepted by EUD and provides graph endpoints to
> +      link the USB controller and the external connector associated with this path.
>  
>      properties:
> -      port@0:
> -        $ref: /schemas/graph.yaml#/properties/port
> -        description: This port is to be attached to the DWC3 controller.
> +      reg:
> +        maxItems: 1
> +        description: Path number
> +
> +      phys:
> +        maxItems: 1
> +        description: High-Speed USB PHY associated with this data path.
> +
> +      usb-role-switch:
> +        type: boolean
> +        description:
> +          Set this property if the USB port on this path is role switch capable.

This doesn't quite sound right. The EUD acts/can act as a rolesw no matter
what's connected to it.

> +          In device role, debug mode inserts the EUD hub into the UTMI path. In
> +          host role, the EUD hub is bypassed and UTMI traffic flows directly
> +          between the PHY and the USB controller.

The rest of this paragraph is good stuff, explaining the reasoning

> +
> +      ports:
> +        $ref: /schemas/graph.yaml#/properties/ports
> +        description:
> +          These ports are to be attached to the endpoint of the USB controller node
> +          and USB connector node.
> +
> +        properties:
> +          port@0:
> +            $ref: /schemas/graph.yaml#/properties/port
> +            description: This port is to be attached to the USB controller.
>  
> -      port@1:
> -        $ref: /schemas/graph.yaml#/properties/port
> -        description: This port is to be attached to the type C connector.

nit: "Type-C"

Konrad

