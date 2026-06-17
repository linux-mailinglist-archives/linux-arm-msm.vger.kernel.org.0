Return-Path: <linux-arm-msm+bounces-113538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eeHCFGJ4MmrX0QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 12:35:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B2969889A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 12:35:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Yf2ZnN6g;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=f2Ocn41t;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113538-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113538-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 794AD3004063
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 10:23:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F0E53F0751;
	Wed, 17 Jun 2026 10:23:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F83F3B6BF1
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 10:23:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781691800; cv=none; b=QqqPl6XUhMHrLgcWVZTqBkDZS1hngvAyRbpBX49W+DtaZlwwvPlNTxN0Ww/8uw4BGyKHNRF5I/2qvQxusIuNaJ3pdrKW/G6bU6sDkOsN1KeC1zhSQC49XQK0lbrvshal8+5oEc0Y/SmbO0g/uRb5mZR9oHe6YuXxssqV0Cac2sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781691800; c=relaxed/simple;
	bh=L8FYvNeysQtoeBE5eKmPP/VdM3VJ7g98IcQFHXcA3iQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gDdvJhKbFBpyqUFObut7hMDun1EsIYIzkK+d7wrQxXgjdD83wASuAAnL+749T73TvxhNs6N52czmLSgsiupvAcwfqwWy6jfE+AIzdwJEhGVMD3YUbd8zqJ3lJxJq81UIDUi0uefZuigBDVsDuRqPxKKWagYf8WubmeUslc2g2No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yf2ZnN6g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f2Ocn41t; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8Uflb1654330
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 10:23:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pEPSj5KhHSGylo/KiUhOCUsfFxzMDAF8WUF7+LcJ9lI=; b=Yf2ZnN6gbnr4jVw/
	dPJSpYSilTQRh1TRkBHOURxQNdh3if0gHsDkgp33gNfDzu7x1RUMyaSsMWRLnxTQ
	dWD+5yRO/874ylGHzErguyb6iPl6Js8ZEfDeAocswzIGrZ5iE/ioO0+/lV2cDaiU
	a3LzDVjYB9fsQq5YtRzhUHjSegWuyqnD9JiKia3XNmCERgF/on8OxTbIpFpgJbFN
	nlB61k5aDEbDDoHwrovbMxQOWPDu2zCOw/K1m2yTu7zDEPss63VPLiKf5Pi5apak
	dsrZR3+iLZAzSIksbPZjwA3b8eDwSyMTAtOEImtz/UmN2ybvZBnn1cZVIXxyv6/1
	sG2JGw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueer2k30-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 10:23:14 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-914b9d0162aso62546985a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 03:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781691793; x=1782296593; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pEPSj5KhHSGylo/KiUhOCUsfFxzMDAF8WUF7+LcJ9lI=;
        b=f2Ocn41tq/4lSQ4zCa4H7lisF/iBSaa14MqWZHxjj3w4tPcPEKHTKt3V3i5//dinSi
         9MhDs7syE1096C3WQpOSmQfeyQ5SVHULbYtZI+qL72jPVcAqhwVGmNreT5Ncrr0N1NBf
         CtCIuG+HA9B7jiBC6qH074R45z/RX4QZLKjMKdBmTZa65cyaOTtZ7KJsDXpX+qiuFszB
         sulwMV/n+duVw0iMZncRW1SoQDdHNwWdcYTBvDeSdaoUe8pvI9uZ+9E9X8MMdKJuyBDb
         8O3Aqwov/kx/bdG/kUMulaR1T/HUj/yyQUcMgrhe/abkgyeUtXIwtxh3JnR+/Q+BITPd
         9CHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781691793; x=1782296593;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pEPSj5KhHSGylo/KiUhOCUsfFxzMDAF8WUF7+LcJ9lI=;
        b=ERMsy0mW7Lhwav2+7jz2c1VPyGM4RLb+rAmHOMm1cBl+WvPJciWoA92uzplhOwCvz2
         TxjFfZfK7M1+Ab6BFSbCICri1sdPBNOAABYWzYj1gQOJKHrhxIfkUpP65gZvTA9zohbT
         j1E4gmjJwJN7MHN0BGAJ5gRA/ZVQb8shh5K6+EIaG6APMRpbBhSPMdpa9f1qX0NFxxKR
         8HgZI1u9MxBy4FO5PkLjHYl+2Y0TKfwgfLaOYy//LXIERRTRqvqfAgM5VimY4oB2GNQV
         JGMB3R+uEQmvsa4cqvxzOAToAdCryr/7OAAvWBafpj9lyeBKz2zlN4iIUMH6vxDmHwOj
         Nwjg==
X-Gm-Message-State: AOJu0YzeIdBI4xdYuZ8KnDVjFkt/JjYa5CRaWpDJEexlpoeye1/6r44L
	BP67CQ8SQVxe1LBSb9kBMJF3NMjvHvnULBM7jzkJNEs1NadAXcL1CZ1mI5EZAiJO8i1KgX47xcr
	6VPhMMdytAaVhGAzv6nGJ5HAIgDCz1/FEII7xBQ0v43gonSGq+kGFc7Z6YqfBDKlE6+W2
X-Gm-Gg: Acq92OEys1OwyRGlpxEBbhJ5UHww/c2yNU9s4l5Aaxzr60wP18zMS0JVM4/Lwjv2JIT
	NHWYx3UDsKcw+s6iDabSFpppGLBwhX3NdLQ0hXBOVUiEWKCSbbUGZZLFh7eXOfwJcUjqSv2uLaM
	9ZBvCJGn78lPTRp0OL8aDI4PoLxI/ont/0++2erx+3UYnzBXojCZGJmtRjLEPJjDibSBic7ueZL
	LEUW3wWRyKUv1tyKtmTJd53xNeQOfynVeIqoi0AsEpy08YLaIj1x2s2K1ISiBKwcnHHhtmp8sgS
	/b44vjPiVZKLZCXUcY1fS/j9kXFq9j3GiZvpPkeFBH4R+Px5bIFo/3DcdiGhzL/s4DhVHLKyKdN
	ZiAUqMSou5fAuTazca+YSth63TgqhsUcu8R0=
X-Received: by 2002:a05:620a:4081:b0:913:b4b9:5ec8 with SMTP id af79cd13be357-91d8d5b2aacmr341290685a.6.1781691793396;
        Wed, 17 Jun 2026 03:23:13 -0700 (PDT)
X-Received: by 2002:a05:620a:4081:b0:913:b4b9:5ec8 with SMTP id af79cd13be357-91d8d5b2aacmr341288385a.6.1781691792980;
        Wed, 17 Jun 2026 03:23:12 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-693ab54e6e5sm5512062a12.1.2026.06.17.03.23.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 03:23:12 -0700 (PDT)
Message-ID: <c8219694-bfe2-4354-9c07-622596964103@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 12:23:10 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: arm: qcom: Document Hawi SoC and its
 reference boards
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260617080147.1657632-1-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260617080147.1657632-1-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: aXH2qLLVY_yG6rjt-c2MxMuXx5CZLXEw
X-Authority-Analysis: v=2.4 cv=Mr1iLWae c=1 sm=1 tr=0 ts=6a327592 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=bxiTcfX1wFVtC9dgpccA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: aXH2qLLVY_yG6rjt-c2MxMuXx5CZLXEw
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDA5OCBTYWx0ZWRfXyXwJfHefr88E
 j57bf5mTbwUz7r3Tj/ipkMMpNrCXAzkNwcZoHAMkFYC1gbnW9wU081c6nl7IKP9iXlFwKfbdKys
 tI5l8hZTgsOv7lKG03pR1KrRnegBbDM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDA5OCBTYWx0ZWRfX11fjqfDjqJdI
 L3EX8ATrh5kq/oZ8DACkYPGL5NdW4ecD98asoTXvj7ll9DAA2+hz/JLwrlK2J9Pt4/qBfOoM8hU
 1c0PfxaeNnqxZRWnW2zc+dj3Stsx8JRxgucGkJIZrFHr7zgzJr7Mi5//j69d/2MFoYoF4p8W7TC
 A8otR9E9ldDxwBdhp55FOchtS3M4jBUWYBkO9RiDqjqV8ykAEYfgamyolK4wMGjc6TF1eAquS34
 iTmmm2qvrl/Qael+pGzqcIbwS/y6/ZfrKewJ6rqsGEFFrdqb3trvDZBj/UpP4e3FWOLUjG5m286
 j/Sg5r+EcWmW7YsHhF13cK6ykW7rff7eoUOVQ8xKj5vMz7rfbrtr8zzI4h6/NtT5TUsV4czs/Cb
 AUAfwrtI87CV9awmzwaGtaJw3uJkYu8Tm5dd5d+2i4fOzkjxdm4RmyPxvaI8+xGvZvE2LmKP7CG
 0zDgUW3b5BD/0hARzTw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170098
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-113538-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:mukesh.ojha@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 47B2969889A

On 6/17/26 10:01 AM, Mukesh Ojha wrote:
> Document the Qualcomm Hawi SoC binding and the boards which use it.

'Add the binding' or 'document the SoC/board', specifically not
'document the binding' 
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index 50cc18a6ec5e..bf6bdded81d6 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -371,6 +371,11 @@ properties:
>                - qcom,ipq9650-rdp488
>            - const: qcom,ipq9650
>  
> +      - items:
> +          - enum:
> +              - qcom,hawi-mtp
> +          - const: qcom,hawi

'h'awi should go before 'i'pq

Konrad

