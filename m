Return-Path: <linux-arm-msm+bounces-91492-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +FyFIISEgGnE8wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91492-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 12:03:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A77C1CB6D0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 12:03:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 798093001050
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 11:03:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47F3535EDAA;
	Mon,  2 Feb 2026 11:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IEJMaWhl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dKdntOhU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839A435DD19
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 11:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770030196; cv=none; b=ji64K7amcPr5wqCDkDfHZ4q4zQIMcylIongJaHNxnqyBPoaG3oUjRju++ZmpyAYn9MRdthJI6nQFWVUjw8/OPB9vM4LY+Wg2hm92vnLDV52FlNfzwD3zDp2AcjsA+Iyf9GvXTZ/kLbfeZZuKJaY4r9dtXsi2eIfTFui8PJxtigc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770030196; c=relaxed/simple;
	bh=ZoHT2X0+QvQ8zCJ3HO2LuvlEtbnfqKt+TG48smM9Xh4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m3/x4wc3XAJlZhsmfUksbXnK9kGhnRy1+kS5LqkJ3HXT+OwUhLX0pV7fTusiTc90s+ipCwScd1OiGGY6D7pfdVkiYJLGz5wDOUKHnutgZnJMQ9Cn5GwduGs/3WnwWXHr/7yOyxKbZJGTMaJwNQAyG9zf+fDdre+8QeA1DGrhd1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IEJMaWhl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dKdntOhU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61287RVx721506
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 11:03:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EU833LKChgISNL/htkFr48l7qcug469mq9IdafE2GVs=; b=IEJMaWhl3c5b5apc
	xO8FumxU4AhT2KLyQuN0i0m/Wgu+7TP/69wyRbal5+7lQOv/gcedJfP9jlk7biB6
	YN5RORsYaUsCq1AGyQ44TRs55iuGpqSR2HKl4RroB5+FzNhUvT1AVTfnZI0JSw+1
	Wz7JJ/uYkKVTcjZvm9rZSh4SS0n+7Z3dCF9+hBhRP8W6hpMspsP2rQ7MOW1udpTu
	e4u2UlNJl7waz4lWoeJygkZLQJ4AvzT/s9RTOHIZNkDBUxlQnlMU4AKv4l4saKb0
	9wx1Z4ru3ZSHQ//jjQUzZyC30cTo+XScJ05y7CMFVcKaWhEpgyF3UIHsiGsnaeAd
	PmNADg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1ared3t1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 11:03:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c52de12a65so74861385a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 03:03:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770030192; x=1770634992; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EU833LKChgISNL/htkFr48l7qcug469mq9IdafE2GVs=;
        b=dKdntOhUx5B5GI04zPS5A/OHjcMIs5JhCv+QPAKdYhcNXZ3T9ddf1KpZWIzowlNx1S
         tsY34xDBDvqAmyA55SPtx7mY1exk74oxU9l7wIG01sf3ws+sgy8wpZ0PjX5mVrril6ow
         hmyTZkdacN9V33GCfQS9F6qUDus60mAhML0k+Uw7qwFqucblTzpCI4qmUsvWj71nHY7L
         InzOPW6O6CyPrRAEF6E+016ygDdSQsreIT4mi+/dhfYwGYslZsGT2QkZTWj6SQbAWqKQ
         oviUkeT9k23DjHJomD4Kvk1QVyEd5qaF9MhkYbB2UlPH0CmCs2O4ju0Hdk9Hy8hceF2M
         mgkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770030192; x=1770634992;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EU833LKChgISNL/htkFr48l7qcug469mq9IdafE2GVs=;
        b=OABTIAPBhSTI5pBImcFMABFgMp48Wfx+PTUidJgLZTxa03PCYaPx48tz7y3De2uS3m
         YlOsfJVbUoyDWb587fbLwjTeGzbP1y8pR+zP/qsiFZHoZsbvr6xXhPEKgvCZc5wHuAx5
         Rzy9BoT8byPoUOcgldJ/ZXCV8PK5Ye/Xy07DTKQACkWat+GsfuZOcgVeUohPLUTYFdWL
         epoTeVsMaRFHWa1X4zz0A1PPnZM7ae08+qJPlxjXXelgLsDLB6ymrVrVg5Rardh84J2E
         /Uk66hWa/+vWtGWzYDf8ORMbx2P4A1qBq0G39SHjjuuZ8WIgRWhaYYyRJSBf/MFZcIqc
         6gUQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8do/oOVhBWQItPM3gLiY8P2gnkRulWkL67MWoVC3ZEAs/EUfGmrAP1YpDzinRo/HjSz5NMFLzMyxlpCtJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7rEBvLh4mbZOMFBGJxY4UmQPkf6RvZI1/fJuyUfIf8OLNxZ94
	ODJVR3MZ1R1R7iBT9WdirxV162qDh7y2L9DPuHNGHqM0w/prrSAF94IMUJjKR+9jK7NcoUyIz40
	9nkZIEMyZsQXO2wBDPdCSMqoQAcjVWNmPgZ6MSgzLJV8BpeOC1nkGtSNl0ricAQQPZLhp
X-Gm-Gg: AZuq6aLM7Mid5i+Zef7ST4hSdzTenT2vmmntukrnS7Dg+Ka8+xLwL6igHuOlFZGrOyV
	/AAuTKbSozHdZxgtru9rGQJlKc6g41L+98cuYDLx1N9ndWSWy4Zy1bOCr0a4NXP8myC+4Eztpjs
	lnI1Crex58H6OVxaCxU/VytzQ8Gm/24RTq1e47uXuJD1pYL/Y+zj9gxkFbDSuEsjivygXnrPr9w
	oOjHd/iGQQ9rCbRnAhVNbQ6rdUQgsAcHNMchOJHtqoQW08TrKXWewMiTw79eWeOtmvNTv2vJFrN
	GD/7YXQbgsjNYkayfHo5oCm61bErqiEYnH506n2TqWk5BVBrvRpdKlOp2Gm235w4GcdU6mZbHGp
	He6z7h2xig28L9wiQGf/a9jZAaeaeKW85IaWJUJMq4hsi5ToOcpKPV3x9jTrsuGpdRdQ=
X-Received: by 2002:a05:620a:17aa:b0:8c6:ab77:f95e with SMTP id af79cd13be357-8c9eb352ba1mr1019640785a.11.1770030191778;
        Mon, 02 Feb 2026 03:03:11 -0800 (PST)
X-Received: by 2002:a05:620a:17aa:b0:8c6:ab77:f95e with SMTP id af79cd13be357-8c9eb352ba1mr1019636785a.11.1770030191117;
        Mon, 02 Feb 2026 03:03:11 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8e04be76afsm533984866b.36.2026.02.02.03.03.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 03:03:10 -0800 (PST)
Message-ID: <b37e6569-61e9-4998-8fc0-603b83edfa2a@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 12:03:07 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: interconnect: qcom,qcs615-rpmh: add
 clocks property to enable QoS
To: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
References: <20260202070534.1281652-1-odelu.kukatla@oss.qualcomm.com>
 <20260202070534.1281652-2-odelu.kukatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260202070534.1281652-2-odelu.kukatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NNfYOk6g c=1 sm=1 tr=0 ts=69808470 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=34g_aVeATRGB19fa1OcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 6mwVliMACaUAfbex683jRoOj84cxNorP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA4OCBTYWx0ZWRfX3LQreWSUAy20
 Hz3ojplcoFW99aD2XzNpMem5KE0YUxK+wTLwGhVt3YGwb4HGkEFo6gizmSiHsD4BAjzTsra2PRw
 jbhG/IeMBKvKsuju1P0qehtn6lDQCciGU/r4x081L/fCIIvLgWoPmUf44OvfAR2oBZtkQb6s4pI
 UuxwrJed9CowUyyZ73Qw4Y4JIQ5XL2P9mUnxJRwSFjaqmFW57kkztcQ7PAZTL89HUZkG+wPs38a
 v0xduv0qC3Gdc9sGFarrS9veWdl7UAdnZnVg2TQ4rs0u+Uoh7QFJwOG9zoUHUQiofUzysYk9U+z
 NGO3Ebwda5kuP5WkImKzb3NUJQTaJP5QJ7NVnQ2QrScrztILXvmwe//zQnZ8j7od2+5EpHfMrtb
 tPcGkg13zgeWIyVPU/J4QPepko6OaG4KRz/mV6HAhufAUmbRcZwMEEoUnEWbLu60CcJ3BZVrl8l
 PmWWYJWob3dC1xImUjg==
X-Proofpoint-ORIG-GUID: 6mwVliMACaUAfbex683jRoOj84cxNorP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020088
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91492-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A77C1CB6D0
X-Rspamd-Action: no action

On 2/2/26 8:05 AM, Odelu Kukatla wrote:
> Aggre1-noc interconnect node on QCS615 has QoS registers located
> inside a block whose interface is clock-gated. For that node,
> driver must enable the corresponding clock(s) before accessing
> the registers. Add the 'clocks' property so the driver can obtain
> and enable the required clock(s).
> 
> Only interconnects that have clock‑gated QoS register interface
> use this property; it is not applicable to all interconnect nodes.
> 
> Signed-off-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
> ---
>  .../interconnect/qcom,qcs615-rpmh.yaml        | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/interconnect/qcom,qcs615-rpmh.yaml b/Documentation/devicetree/bindings/interconnect/qcom,qcs615-rpmh.yaml
> index e06404828824..096a9064cc01 100644
> --- a/Documentation/devicetree/bindings/interconnect/qcom,qcs615-rpmh.yaml
> +++ b/Documentation/devicetree/bindings/interconnect/qcom,qcs615-rpmh.yaml
> @@ -34,6 +34,10 @@ properties:
>    reg:
>      maxItems: 1
>  
> +  clocks:
> +    minItems: 3
> +    maxItems: 3
> +
>  required:
>    - compatible
>  
> @@ -53,6 +57,36 @@ allOf:
>        required:
>          - reg
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,qcs615-aggre1-noc
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: aggre UFS PHY AXI clock
> +            - description: aggre USB2 SEC AXI clock
> +            - description: aggre USB3 PRIM AXI clock

Should we also include the IPA clock here?

Konrad

