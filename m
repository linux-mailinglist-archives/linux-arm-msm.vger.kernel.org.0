Return-Path: <linux-arm-msm+bounces-113368-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YmhtKdEiMWpicQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113368-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 12:17:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D100A68E1E1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 12:17:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kTsZ6kQj;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WkNQRkqE;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113368-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113368-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A00A63016C1E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 10:14:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FFD343E48E;
	Tue, 16 Jun 2026 10:11:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15AF743DA2C
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 10:11:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781604716; cv=none; b=tml6/GyZCYnyD+ChJXVYWZ1cNxAXIKtpY3cckWdMCYDW8WZa2rfkpMhFiICOvtNHeisCa3dfZTYiZ+OJ/dgUzEVUjp1crBOxbFGt2+3Xb4h01oPG7uuSca+SQY8rF+/dX47rP+s4BZLyD/fMzPK13vCa0/as/H1lTUTEvh4ipyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781604716; c=relaxed/simple;
	bh=9BhDKFen4UB2k0VkRwii2e0UCqQ/jgw8fvKnLpNl7JA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jVanllrlf/x2mwvzZkhW8aWqTdOSpFkXtYfJDOSOMLByieH/NOguPqES67M1zoMteJWX0ORnoCDiXNyoCRa78/odn3oFoxUpaA4jLDBSuWExNDJfYLAoJQjRiGS26F1WqEbO1txZfJQQ5vhv1om32cJsHXDmQnP0w5bcJqEIme4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kTsZ6kQj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WkNQRkqE; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GA449m3438905
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 10:11:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/iwZNVXHWqPMz1uVs69/fK/f+2golXCQXQiDFg0fw9s=; b=kTsZ6kQj08fHE0ul
	LlxnYjyMqS/ujDBrdmcr0urk5UJFmj3z67MjP2+fcQmGMwa6GW/exD1f2Qiryg1Y
	rKXsnf5RLGs9EL1cjfO/zL260dQu7pPZZZ+LgYtU5A5/NiCX9vHfxWMek8eIzy4L
	JH5z+xekbnl1crRNxGKu6gOMDxMtZNjXkQTnP4sY0rFq3OKaFQqn28clJil7wUCJ
	AvYC3HiEXaPzqffFCyhxiBSs+T8niyb9SKaw4ljJ4dIM1omrQSp0Vk4hFLCtiooQ
	jY7chWI3anVCtBzde4rabEwemwGxOnCRDmytOntgoYVY/eXEvdOcuAlMUbobDGS6
	VlniFg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu4dkg0x1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 10:11:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-915737aaf0bso23020985a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 03:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781604713; x=1782209513; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/iwZNVXHWqPMz1uVs69/fK/f+2golXCQXQiDFg0fw9s=;
        b=WkNQRkqErx4icB4Tf63wdDCJ63DtQGi6Lry1ED+HOza397Mq295SXQCJt/dQdq56sg
         yMnD28K7ld7E4soS2iEp6cEhMXFBXfdbdkscLKsTEKxVY7h6KBTh/2nPmVbjNHwKEYHg
         9qvc985XcuDchQ/ib5Gc9EYers3q6OcY4PyeLiGGkn3bSzovDqW5dldqfu1eE0/AocJM
         myoQUbPqxq4zenpzq3RXjOxFKXOeqab4G5Xn0uEqB9rGE7LXPtHjll7hMrvejg3PWSO6
         EkBjYC+0yL+md8WQIyCuEFspNSqt0KzjYcLYqN0qTY+i0pFyYXuwLcTy2fMfJslgB0AC
         UT9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781604713; x=1782209513;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/iwZNVXHWqPMz1uVs69/fK/f+2golXCQXQiDFg0fw9s=;
        b=f8pMmz2WYPIXZY5X2XNbiesoKwMYyVU71kaclr1oKtQv0byfusb0po9rH6vn1tBWQ8
         x69fTbjYs8vYeuoLwsi6Ku1xTXZoATdNvxGzc1RhCRlkXojBVgwgsonNEMG8f7XMiqrb
         EytG5+K3mUnB+Y2eGaJAPgQ4QsOYhP2qoBaa7Wa3IMqPkX+bsSw2VnaNlr1eQWIoG819
         s0FXfTc2HdLdOWvHVxglymZRo6NBgIcT//Lz8QmNubyzz2r5pu2XHPf635c/vdBNKrGN
         4nXYmEIwcWZj/qMqJjKBhb9S4ukcAz2tkOyTz4dmFQvdirkoIJg5rYc0k4NqOsL3CHED
         pBqA==
X-Forwarded-Encrypted: i=1; AFNElJ+MarirnP0+RxkdJ6Nc0jnsxEscUD7g9eVcr1bBhUU/JvzV5vIGePyflpQ8r1suDWzPUixlCAiqfw2yGprR@vger.kernel.org
X-Gm-Message-State: AOJu0YwrMl2i2X6URrnViuhqg11qK52dJDVeNZnFvplJuVINf/hIwSgR
	vMbq0Vf7z9UtjRSVvfiOAvsON1eF2XuA2kDkKYfNQYLrK3Ky6U3IU3rUxfzp+9vCpl5EoPz4jaB
	6H1wHmjq4to0EUIdWzZ5xQyWJglR76WKhIM94NqCr0avFjCCuaRWoCW1x9s1U9LrqKecF
X-Gm-Gg: Acq92OED7UKAS0MG/PNTcLyaSp33E7cW6TLT4/iw9qXdswEUcj8fyYqheNVjHn2wu58
	S/r3JOTIqW0VyUVGIOHq29rPp/uD5PawL34ohNakq2PD+b77xGzL6eKQi7sphZuX68ifhz1ibx9
	Ixmk2cNjLnG0b9MWW1p8PMxAGmleUpE+DWhZEZpmuRFTLXQMoqcUY+0EZZ4AsoOPZGWS2bDSWNe
	iwRyN7Ls/AjFNdWlGhjXWe9iCLjVi2gX4yUCzUQVApdY407bQfLockQMTUqGqtqrIyjuqsODdkh
	9zgrsqfX8cVkwJKcxZ5X9AOaCHUabTbmrm63Hqv9Rm5mUajwDYukyeSMlOLWWYPfzgWXPt+cvnn
	zS9oway/XApcFrpx+Glm1ggiBSyBtf3BNIyoxmlJnRHRtXA==
X-Received: by 2002:a05:620a:394b:b0:915:54b2:582d with SMTP id af79cd13be357-9161bd659b1mr1681029185a.8.1781604713448;
        Tue, 16 Jun 2026 03:11:53 -0700 (PDT)
X-Received: by 2002:a05:620a:394b:b0:915:54b2:582d with SMTP id af79cd13be357-9161bd659b1mr1681027185a.8.1781604713054;
        Tue, 16 Jun 2026 03:11:53 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb7b6d8c2sm597958066b.38.2026.06.16.03.11.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 03:11:52 -0700 (PDT)
Message-ID: <a07832c3-09f2-4bb8-a4ee-84576a30564a@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 12:11:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: input: Add binding for Qualcomm SPMI
 PMIC haptics
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260616-qcom-spmi-haptics-v1-0-d24e422de6b4@oss.qualcomm.com>
 <20260616-qcom-spmi-haptics-v1-1-d24e422de6b4@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260616-qcom-spmi-haptics-v1-1-d24e422de6b4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: lWtulATEG8LXHDH-fhIuFHLmD4o_ZDfV
X-Proofpoint-ORIG-GUID: lWtulATEG8LXHDH-fhIuFHLmD4o_ZDfV
X-Authority-Analysis: v=2.4 cv=Ibi3n2qa c=1 sm=1 tr=0 ts=6a31216a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=qXVGAw26KTG5FGYqbW0A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDEwMSBTYWx0ZWRfX5YvW4lCG0Q4O
 nMQGIT6oeuDbU5gAfyOjVTYngIAfrjfxh9NnOtqkyH1UeeIpyQSpElbl7o/suJ0FrKzLF4uFyOt
 0fXmEO4tZ1BKcRQc1/YTm5bqY/3lSnPc6I373OmNc5C19UnoCvix8wHKluu2BpVVnrYVcO1mxHI
 AbALtFa+fLbiQHB+fG10laM45OA7nAT5eTJtl5LkxOOS84UMJLVUxjJRp2SGUHqTavLuotMoVWF
 AuePrk8S3CL/ySnRbFBYThXaVc5Iule7k85hrCBsfSbof/3BiVAoIoM3diakZ2LbWldrJ8SAdwI
 mMzKTaSZVVLhxzNgsO1JsbP+FmfkR8lRHSRr08HotPr9kbtwBaonEaiEwLM3+g77sTRpBA4uofk
 WUouxzU9g7pHZjrwsLv5aaFTDn2+n6IVhtXI8U6mEPt90EdahScI17vYAMgrNKC72T6+i70+98a
 24xi4HngUYO7PaPilCw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDEwMSBTYWx0ZWRfXy0q7VJhnQTTq
 WRqnFpLq8JQGDoaEZF7uYyXKboMEw/8FJWS4dIsC/r4SkzS+NxdlqzW0U7zeIZlftAqQCSdNqdK
 K2o/EfIzfu6WNXcCpxwEFgW/JqpY3jc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_02,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160101
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113368-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:fenglin.wu@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dmitry.torokhov@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lee@kernel.org,m:sboyd@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:david.collins@oss.qualcomm.com,m:subbaraman.narayanamurthy@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:kernel@oss.qualcomm.com,m:linux-input@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dmitrytorokhov@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D100A68E1E1

On 6/16/26 12:08 PM, Fenglin Wu wrote:
> Add binding document for the haptics module inside Qualcomm PMIH010X.
> 
> Assisted-by: Claude:claude-4-6-sonnet
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---

[...]

> +  qcom,vmax-mv:
> +    description:
> +      Maximum allowed output driving voltage in millivolts, rounded to the
> +      nearest 50 mV step. This is the peak driving voltage in DIRECT_PLAY mode
> +      which outputs sinusoidal waveforms. The value should be equal to the square
> +      root of 2 times the Vrms voltage of the LRA.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 50
> +    maximum: 10000

multipleOf: 50?

Konrad

