Return-Path: <linux-arm-msm+bounces-91813-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UMd0MkJSg2mJlQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91813-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 15:05:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B1BE6D79
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 15:05:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 269CD3011F55
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Feb 2026 14:02:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F167286430;
	Wed,  4 Feb 2026 14:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZiLZOMYR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DEjpiicE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB15280A3B
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Feb 2026 14:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770213704; cv=none; b=kLgGe5vwctI579hIkJmhbm8CzHRZ+HNArAIIfIHrpP9k+qv6tbt3ESYlQQYsYO4RkdVsQSG81+qgzIt5lwuXztE0mGdwKOOa2NYgPqsnE4B9P8YrrZsnZ9yRMMnwaMpyGqw3D0tTuo7+t9OiUwsFP0x9TocOvTU+OJb3+9M4J3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770213704; c=relaxed/simple;
	bh=emMy13JrIEWGGb4Yj1Obm5OPqROR8LK+7EP9jth9dqs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VTiCvTNVosXVysAnxPIy3sMaRtVJKtUpuLqb+aKo3gTWH9eJ3VS3eZqg52XqY06/152jsMEo65e9lPwtUtweOGq14p5qTI5S2m4zVvOo/V6p45nDZrYbJ0iJfxN8BbbVSuVpqj0bk0m0B26ZflxWzfA1Hu5g/INpDxSsRfW+/0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZiLZOMYR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DEjpiicE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 614CIWY5792900
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Feb 2026 14:01:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iS4JnPBI/eXVdO62TuwXvtzIoHIazcuTqGQx24R1EVo=; b=ZiLZOMYRu9h4C6Tb
	h1jNhopo271rF10/GFM3clK1wupFoWU83A/Fy744Gh7fbDSjMW/KGAMPsmz53Bmy
	Nz9+sATEiw3LgAgIclcQqFXucWRw+z1936yAcwxccfnQcMSSMbCXvrHCAkOEgdVC
	80qbUBPLoYGLu/chJlPYbVQ3FkNFCXRJ8RZBvqyRMxndRxNt6GDmRyQK6a7WK0UI
	rmKFPMzWuS+PsXwU8hbrG4QBma6FqJGDbhUS5u693dpAyjqS13N8C3OXOqmbAdZW
	+4FfgpRKiQQeXbftpqosHUbIV+d+d6Uo2p5exwB8cyvJ+dfk5A6j3dMfgfd1wQyi
	3wzp8A==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c43uxgpx9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 14:01:42 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-948bf3b2158so970229241.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 06:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770213702; x=1770818502; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iS4JnPBI/eXVdO62TuwXvtzIoHIazcuTqGQx24R1EVo=;
        b=DEjpiicEWGT//yAP8SRvNI5w1sCp9DydCHosB0Cg3/ovY/eSVbpth+iSoucyFX52q1
         1bdpvq0GNlbJ3hwfsl3ea3ZxKQ2dCriZQG/18iVQyGuXpkAF4TcZh6iEWnoPCo/8RfpB
         gjgdnIr74Mhh3xMLNHpNjCzXSGyV+6NbbdwadTiMjUdGhuqYPydfI6Ro9QBWzd/SZ1MT
         7i3K7ZC1x0wf/92BsdTCpuDYGHCAxA1zDWaEB9/6nCW9ZR2itvbYxEfVqPe2Z9SewwTL
         G8osy1/M3fTpUfwxhAd6wXPvIgBnTOWXdYKMhL2Rh+ydqRvMtGm35o9u8w/9ASJ7Sp3E
         +sig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770213702; x=1770818502;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iS4JnPBI/eXVdO62TuwXvtzIoHIazcuTqGQx24R1EVo=;
        b=h/1bm0G7bFKSKK1jMJK4UygjtqdaYX87qp8aB2U4F1sbI011T3L9armaVKAFf+zIEk
         8vgT0yRJxvjqUXtscYXmRr2tsw860+v1trY4K4Bgiy3ZHuMZJBH2nsKdkPnTRAAycCih
         tIdvEmcpxOvTFeIE3oAxxzmrB9uCJO4gbKOt7jQ2FdW1V1jiPMm6PxarEbUBzaatMgqr
         1AK7i1owSupIWgaForaZVdrz21wg9hVPUBdUDmUlVA0rM2GLhyfj47MHmp1vfaGlXe67
         CA4x/JhcWBuVAzZgP2USAwtTkCscoWeroLhHL/BWDBvfsmYKEzXSjxf8sNqOXYY3in53
         lKKg==
X-Gm-Message-State: AOJu0Ywp//kNk0/bSmkMyfx/LJl+zjVQtbWI1qyC4BXlJ6kNT1eVEoeb
	kamHVPoaTWv1zJy3YHZjfXNIrKKIujIcvRWHEsRNWpUhMCaSoiieI/AA4ihsgg8jAioaHN2gxBP
	By7jYbapWkC76TJLRG/VfbLOLfPgXwIZSDRUK9WtkQUmIw5qNxwqhuddReGQ+X0BGqDO4
X-Gm-Gg: AZuq6aIazPxM8Keyefd0dVOtKFv56nZNZW26Ki4yD8qdFcF++XykW9DrTYA4fpqMrIr
	yILlku8QPEFvPUtcrDTdAhRTQQCpFQJz4NM4ZLHBYYvfo5toJ8l1Bzc4ruXA+xWPa54DGowN1XV
	CssRu1VK27KQzmDwQAohl8xhIsbQiBZeruamrdBapl1+bGnfEV+JZZDott4408MhytZNd/jARLx
	zm5RMRV+h5LxrS4tzH9BHs9OXBXu+gcKRntjlYlL+gJMsj1/lX9vxpqz7ILxzBmORwdsM3DNioX
	X6hDuQiWm21ad1ZjWUXWqdfdMF6l998D1U038oavQXhz9i3tW1dT5s/EXVDz7jtqCh/RIQwkPt5
	MxBBVhOOGD4ayI626q2tDxB4WpFBh26g77oVfPAJgfA1sRfxCiOd9CRjn0G6EluOxSL0=
X-Received: by 2002:a05:6122:1306:b0:55b:1668:8a76 with SMTP id 71dfb90a1353d-566e808afb3mr556368e0c.2.1770213698854;
        Wed, 04 Feb 2026 06:01:38 -0800 (PST)
X-Received: by 2002:a05:6122:1306:b0:55b:1668:8a76 with SMTP id 71dfb90a1353d-566e808afb3mr555907e0c.2.1770213694155;
        Wed, 04 Feb 2026 06:01:34 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8e9fcd8f17sm128981866b.12.2026.02.04.06.01.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 06:01:33 -0800 (PST)
Message-ID: <a16563a6-b338-42b0-8e04-b1ec56145175@oss.qualcomm.com>
Date: Wed, 4 Feb 2026 15:01:29 +0100
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
X-Authority-Analysis: v=2.4 cv=StqdKfO0 c=1 sm=1 tr=0 ts=69835146 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=1VuqB2ABKDwlP82YmI0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: MAMmqd8zHDOF-Cz9ReAMoeVOR3pqA8Ro
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDEwNiBTYWx0ZWRfX5eYRtiyvHThL
 J9Iru2I0g9YshpvHN6sZB4ogoy7GNTdYImpB+KQy6Q9oAVYpaplaGy/Zd0XCDmk48LN6VBob8uc
 bKRnd6va8aw6ZLgUuXvU/BuWHbOWSac5MaxK6jPCd3UdW5m7S0AZ3GXT4YA7GvX5A2eiP3rpjec
 5yOuTkM6Mc30/HU3ZFU44ZbkyiIme+/uxwCXeoG3jqAUcuYHK2e6h/ECxsbXULlTiVMY+TE4SQM
 xZnpUVjeO7kbTcY7eRtZAIlTzlEifL5FMZEMpodiZ/39TL2X5xrBMWkLr41gCbhIqOEjJoRvJMd
 EvBGhflI7od8vENEUP8HJ2MfVLNAbe9zIcqgkSHv6tnJ99Gixqjq6uk8qYLjfHy9sPXbXTbFgoT
 5RpBhaGCtbR+815SQFj23WuwPR6P9tzfKf789NDgnUMVOkHg4WyJOn07rVXYRttMMJQbXWLglUJ
 OC/TgVt3JzIb9ZX7khw==
X-Proofpoint-ORIG-GUID: MAMmqd8zHDOF-Cz9ReAMoeVOR3pqA8Ro
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-04_04,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040106
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91813-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D5B1BE6D79
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

At least a since instance of this should be 'required'

Konrad

