Return-Path: <linux-arm-msm+bounces-113436-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oACfF3BbMWq+hwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113436-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 16:19:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC85C690655
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 16:19:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=I1B9pZnw;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="BaQsH/Rs";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113436-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113436-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AA91D326251B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 14:10:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D63C44E02A;
	Tue, 16 Jun 2026 14:09:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC2044E02C
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 14:09:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781618961; cv=none; b=nAJk+JkK9YRmau/6jrTFJn2Yt41DB5jjcWsAMRZ3t3bTdagRRC8752RI0/0uSo1IHAny7G85XW4nwb2T14oxf6cONVRYNZ0U6ruAIaIsCnTBALC05tNk4oeY/96bf2NY0rlPYMo7S4wDgCcVE1dt8y5LpggDgoXDSjAIhBa6yL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781618961; c=relaxed/simple;
	bh=HiUkKbB68+cZ6cUApFyv9kZ5xwG4w4rZ6kimXeuV73M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PC6OWFyxsRVId2jeD41qlIR3JqPn/R9NfqkYJoL20argUbcRIqJcq9Vtt34gXFfvvXu29nJWTwecO8scmcsT210eaYZyL39Rxam+fhbyRXiUJoOjj7EL7T7oF2eGJ8bgeqJDWvDGj3AapF5sH+WPDlk3IboTjsY/Fvu/LPR81fY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I1B9pZnw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BaQsH/Rs; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GDxlZQ3894589
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 14:09:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MRVejRmG+rwlzMAPiJBU0ONVq9PptIShWVpCuWLNbO8=; b=I1B9pZnwbdojQkb9
	/L/I7WO2NkUR0R8AsjVJOcwYcZZzVeTD9LO0yRE86q2xwqmryCw5suC4Ktphx1EA
	P9xD09O/RNHntvmfMfhbX+eqdTWLYvv31qz6A4jmJn5xJm09B4nLNafqMQrEltxV
	Phm9iXxHlIYflMI9IF87kFHEoSliG0VibRFaOdxp3YfJtMjoC995ygsYffuZIhqr
	muCnVeeONe1qMx7xBrNmaOL+i0WFIM4s2BnhakmZrQytsU9rEcWuYfSiHl+SMVBd
	po01K3Vdg4r3T6AS/iO8QdzNF5/vYE33PgNGF1C/s9PJM1gZifW82SDuPgaCSlsc
	AlVznA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu1ep9v2c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 14:09:17 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6c59b44054cso182255137.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 07:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781618957; x=1782223757; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MRVejRmG+rwlzMAPiJBU0ONVq9PptIShWVpCuWLNbO8=;
        b=BaQsH/RsiGVDCYNlvRSrN3xEWVcKqk9M/orlJu35rGR+eEO+hwATBEvPmIhAKGgxQP
         V5jPIz/aN80E/kd61RHPfz28EEoIDBLrnghizBWBqAWNDyJXO3ZcoPoyo/CqTDq7RcUI
         zK0G6Xc9/1jam/SEvOU8Sy7RiZeJUspcjrHaEFgvaxAJEKvSNCdxyd35xYmogVAmbdrc
         0EXdiNsLC75iH134M3WKDuz49AhSQiiQ6MJYHTuA+Llzei2Hj6tpCyJGvyVC58e1LrNT
         JlG+b2E3unDIm0Ad4AFFNtEVG41+rxjlEeyy0CYiZs+7GrxeuzkIqgwAue5zcZYn3KE0
         +t9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781618957; x=1782223757;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MRVejRmG+rwlzMAPiJBU0ONVq9PptIShWVpCuWLNbO8=;
        b=NBQw0wQ8J+aec/keH94OTZUG/BT3M+ukql4kiISZJOeSkjTeDZfvv9T7wAhrxJkJzO
         aZnYQnb2Yh/Cy5KwQ7yxrbtbh1nM9HkWIpK7W0LPnykitbjRYMONcfnSxLf2ufov7eBl
         gDO6vExftMAA0KQD0Rc1DrqYeInnSQAEzwrBBNGYZj8xSBeK766WQgoEN/WehxIe6kDr
         gxo6+AQPu1XA1BKdDme7kSEyesLZMDYHv8XlxOvhRTaRfqcapY2LBk6v+7UVDY9f2dx7
         tWNiciTW55/ZIZoElBpe2TYGfEja5susLb9IGzYPwhL5u7uXhsIPktxbOuPm7lETpZku
         9+gw==
X-Gm-Message-State: AOJu0YzuaClMvsWZlc+XgdBzG9HcajuJ9rCRS5d+0X69w7PIei1iSAo0
	lZppYywBYcMDSLd2mxHF7RxUIUv81+BkbVD6I0k6FGAKLfJAg+QMEGqz3KDRN/f2NYGBIbzcST4
	TltHubgu2gWYGY8Qiic4BUowfTZUk0HmqblU1fcvOJDHho1wYKyIr+YCgVTP7+YlYz+bA
X-Gm-Gg: Acq92OFL/HKCpHzeQiahhwffd3GBXv+kdmPxxWf/b+mi8wqrJMxcuVdrVE+Suzrugk/
	VmddDW/ClOAktPBy3xZsjoH9HpoG/Cm1aWGDsKc7ONegvKSN84xr4FJlmcEygeYel3cpFoLIlAn
	fESQzy4DYWVgtfUw2OGN6p2tDWMTLBcD2+WmIvV5Kym1wGo1xRCzSBUV9VCesQaEf3t31/G8CNi
	n7KZSV5IiiI9zLRmR68awcT+XbQmqUsu/K1rRFIaAL2RLPIPFyDMjQrgKAP7fyfYtwKvhiKT9Q8
	PRa5pPSY9QJOpeK8vFsLQ7P/Nlw1KseyW+hq4mP8fEAnf4+OtupZbGKrxKlFrHw2gpsVQihu6Jd
	FZDJHuqwURE3M9TzT1vNRE+O2aiMiDEZdjcWwPA83Qzx74Q==
X-Received: by 2002:a05:6102:f07:b0:631:2be3:b6e8 with SMTP id ada2fe7eead31-71e88dd8cd2mr2931510137.6.1781618957337;
        Tue, 16 Jun 2026 07:09:17 -0700 (PDT)
X-Received: by 2002:a05:6102:f07:b0:631:2be3:b6e8 with SMTP id ada2fe7eead31-71e88dd8cd2mr2931465137.6.1781618956771;
        Tue, 16 Jun 2026 07:09:16 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb83420e9sm638282066b.45.2026.06.16.07.09.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 07:09:16 -0700 (PDT)
Message-ID: <eb5ace9e-543e-4258-b3d5-50be84c1be05@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 16:09:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: interrupt-controller: qcom,pdc:
 Document Purwa PDC
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260616-purwa-pdc-v2-0-8dda7ef25ce5@oss.qualcomm.com>
 <20260616-purwa-pdc-v2-1-8dda7ef25ce5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260616-purwa-pdc-v2-1-8dda7ef25ce5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=I/ZVgtgg c=1 sm=1 tr=0 ts=6a31590e cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=px_f_vAfgXbzbh29wf4A:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDE0NCBTYWx0ZWRfXxfgwQzedJO9K
 MkCD4ueyxiD4eumtkT8akMy1C8/g7pmETlPT0v7/3bfTg0fM5pwIOwaUIBUPdx5paLLPe2YKbMU
 ZmjJ3a9yAUOuBe3O8MvX7R+Ts83/T0k=
X-Proofpoint-ORIG-GUID: 5EHGbmJRKjfvrTi8z9xLOEZs9rjINdnm
X-Proofpoint-GUID: 5EHGbmJRKjfvrTi8z9xLOEZs9rjINdnm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDE0NCBTYWx0ZWRfX3aQom5wbUAQl
 drqbrHAxPnZCIF1hM0Z0uVRJVO/rKypDwvmpl3/Yfh1I2xh8HVvdp/oWN74keRcb1HHnE16PXR2
 65iQctwxgFppDIgAYDONtWnC4sJi7SdHf5z/UYerDxQpF3zEC31WQzSaSAoc2TNn56KpjccYufR
 w6AbcXdMFohYZDOvX5ZS2I6iwSTCioB7w+8QvGUU+52pqoYmE6ImFbMiGznnKGbHggzhbY5rtlS
 VS2nFzIj5/u81IKH4DSaw35LcJC/s8p9RP/g9aubGjiT4vQzN9MHGShudSoCl5bP0m5ik69+yTm
 iXGM/Wig0ThlpZYk8VoRmaJqbiz6Kv/vkGrivSxYmuGkdldUD+sg0Oxdh9M9m0c4DIY9B6sPQYe
 XocYJ2IKGqHJnzqB5AUWEPXzNfMOVQPoKVsD/Va5zDE47mMcZA0VcUK5PR9cfkpIJ3VMWOQGKkK
 KgNDR8wakBpR2tjGs/w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_04,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0
 malwarescore=0 spamscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160144
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-113436-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:maulik.shah@oss.qualcomm.com,m:tglx@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AC85C690655

On 6/16/26 12:27 PM, Maulik Shah wrote:
> X1P42100 (Purwa) shares the X1E80100 (Hamoa) PDC device, but the hardware
> register bug addressed in commit e9a48ea4d90b ("irqchip/qcom-pdc:
> Workaround hardware register bug on X1E80100") is already fixed in
> X1P42100 silicon.
> 
> X1E80100 compatible forces the software workaround. Add PDC compatible
> for purwa as "qcom,x1p42100-pdc" to remove the workaround from Purwa.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

