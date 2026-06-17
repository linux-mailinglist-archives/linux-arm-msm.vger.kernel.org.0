Return-Path: <linux-arm-msm+bounces-113649-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hYdyFbygMmra2wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113649-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 15:27:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BBD69A17E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 15:27:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=NEXglQqI;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=OWFAxz49;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113649-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113649-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 64E2F303EE17
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 13:26:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57E4B40B6F9;
	Wed, 17 Jun 2026 13:26:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6653955FF
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 13:26:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781702785; cv=none; b=Ei8ddA8rK2uGjcV1FQPMd6VxB9tzTFwAdiJsNWUv0cqwDivyTGkuFXX0VNbsM7/eMcPB2ocF1lZVRTbvVD8qUXnv9SyqkoCrYOzB5xdZU+63mF+wMD5SG+X+MkVUkIOuWq74Ayu8v3gJtUQ9csAtbTzjbgDW2j+ZXUKLE12wApU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781702785; c=relaxed/simple;
	bh=inIcFos/x0jKX2o4+YkzqWsmsZsjP37LAPvUVyviBhY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jYv27IcJ+VUcxqgaPNudaXSDstc8y76d8mEHcOggJkCInjqNu4rqY+aGZHOgrDGot/rTQKpKoQHkWp3fJqe2AKAfOFDLIxiFtd0e8GM6pLj4v+RPSkvr2cb97fvdQbzmbFnivvpnGWWaTjIr2XQeUHHb1nGIlr3fi9Z1XrhnDMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NEXglQqI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OWFAxz49; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8Un7s1608102
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 13:26:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d9L8d92QIfTFBohwf+5AnyF8y9DpzmN6NgGQoafr83o=; b=NEXglQqIlMtqgrma
	PHQUKfyUIotdvE8l3OThso2pEag+QOXl1vPMOkYhE+1+q6EJlOP7Zw/LeHo9+6cN
	CdPkgLfjmpKYpW3BgXx/c55Xa+qv5gRrY1ozJfILgs9XisOenPf2WWvBMqcwPuyg
	4PYPUeVkE3ej8fSwEPXrQ7MuUnnOPO2y0yTqiX5gfSh1hdSsLGDkQyhn4IqPfv7S
	M1s/nBUfY9CwCCZJxwwbDUnyEn9MMRbU/laP8+QVWTL911PQyKKBtVkXDrCPjFSV
	UC6NanZGe0D78dRVvIuRjCTDdI/7yBCZjwbC/WxDX11FrmfH6tiTfyR33fZwoxee
	RqLnnA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4euef239ce-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 13:26:22 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-966d2895042so97924241.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 06:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781702782; x=1782307582; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d9L8d92QIfTFBohwf+5AnyF8y9DpzmN6NgGQoafr83o=;
        b=OWFAxz49qZMMi+904yowz1cbhbf2d/Mw5N3cDN383lvDqgGDMB5rvjRgKuo1NuC6bs
         BkbucN00F7mh7Z4c8p0g7uWS6CZFzYhesbFDghnLM14FmsXgIgFI8mRccLAXVLhYfg8n
         qRd5/qTeHJbSMjb0e1cONSe5jdBJjGlqZAkxRNU9SQ5lkmHec+g6JyvH5BhzVM1w9zFN
         Jc2a4UTPvXaYWaffH84I1kwOV7CzTeUc/EaM20uSdQBSWiZzsPfrCtHvMn4rCs8+s0a5
         Xlx//Et8G/w58CMfaFI6KxngpSgbE+nSdlARoo6d6XXuRIX0GUYBk2quOsAoIhljHvhn
         rZ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781702782; x=1782307582;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d9L8d92QIfTFBohwf+5AnyF8y9DpzmN6NgGQoafr83o=;
        b=bNSBYow26ElKWl+E0nMDSlwqfHDiNSeHE1w+K55eZc7LeUwoMo62D0/IVAjTC2pmM7
         2OZtJGVFHhEzajT2g28dCKORGhoYed8xsOa3pUoTbwGVszCXjobTrJiLLH+nmoa7CZma
         uREkOUbZ14/EZSDFNtDIxYQs0RpxTOR2UMIEW1GsTbFVNZbr3ZSdJlk2vW2MYqanmz35
         RXHw17uxRIaVEgYoG5ONaztS62rXmIYndYzZj+nuHdmaqm/hJ986qY58VBX4xVQvwDsd
         2pttVjgpn0P+K7A8CrYUTmbeqgQKBCrx6uZFSiLz/v4MXx/u09IJiNZsdcd6yJbhjKZv
         fqyw==
X-Gm-Message-State: AOJu0YwSnRuTm+/euczaU/tX8nq1hrGPTszPxZNaY4DGw1+/xlqoXZHs
	kJjUztXY7zJtRIE1ORoYNM7G8Nh5e5BJAHqR5PyOudP4skqNvOMrl+iFabDFOMIzrf20SWmUmGo
	F+aSxVqvv8uJA+5/jGlpqMZikkNw6uaU3nYARKoeVXI1CESTzDMlV38ZYfBK9ss/zQ304
X-Gm-Gg: AfdE7cmDbchGXYDc71dE8ngoHeiKg3NofkXmROFpip91l7Y1r0LdvacUO8aMIiH83vI
	mmLx3n1/ow1Dn2VBjImOUFKHd/fwLYDYALz9PA+9U2LUY7iP1Y7y1o+f5+XvTCvUSxMjvJ1TPcT
	rR3Eeg86US1h5ffwNUZjSZqh2xY8elwKlPeXVLj2uZ0hJR+dLdMpAOtWG/49+y8tBhdpBMFbU+E
	39qXUBlPqAipZ/3yjWFdD1d0wPTCJUWH+i2KAOQ2bNEhbnPBaxrE8GV/OE1+Q1NGGvh5CWC9PyB
	ijb0+PQcJR5BuO0UR0z38mwOOlAQIQNWsIk7iq3RB/vIhNrFyscWmVcj+rVM0GrDDxOX/3cKkwe
	9to1CZ+pqocn8Mf3CanX3I5IgVqRlvKcC6gQ=
X-Received: by 2002:a05:6102:3f0c:b0:6d1:8f7:18a5 with SMTP id ada2fe7eead31-7245d1f4fa6mr841365137.1.1781702781720;
        Wed, 17 Jun 2026 06:26:21 -0700 (PDT)
X-Received: by 2002:a05:6102:3f0c:b0:6d1:8f7:18a5 with SMTP id ada2fe7eead31-7245d1f4fa6mr841342137.1.1781702781292;
        Wed, 17 Jun 2026 06:26:21 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb7b6d934sm799439166b.40.2026.06.17.06.26.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 06:26:20 -0700 (PDT)
Message-ID: <8754de51-bfbe-42f2-84bf-36cc000afa3f@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 15:26:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/8] irqchip/qcom-pdc: Move all statics to struct
 pdc_desc
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
References: <20260616-hamoa_pdc_v3-v3-0-4d8e1504ea75@oss.qualcomm.com>
 <20260616-hamoa_pdc_v3-v3-2-4d8e1504ea75@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260616-hamoa_pdc_v3-v3-2-4d8e1504ea75@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDEyOCBTYWx0ZWRfXzjmqjwbtPGDp
 Xbqc1mNg1Z+j7Z/qF17rVFxnc9naNxhqZQSWxTEKvleql8YGZkIm1AJg0b85G2+G8H02kB/vMy5
 Bgg1/kyheXhYAw5Jca/6J2qgznmh7dI=
X-Proofpoint-ORIG-GUID: LEMcFVSIp_L0jS6-6JfO639qb_5-er4f
X-Proofpoint-GUID: LEMcFVSIp_L0jS6-6JfO639qb_5-er4f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDEyOCBTYWx0ZWRfXxsOSPRI3AUgm
 Qdu3CXfUoB2Wy7+Qes6ACckoI8xmgpgN8a2vMX8AEkjxXQ33w6ubSESjW1FFsacfXd+uJlqIxSO
 W+I1KMYsYG9itDqyuAsajHhJpnrRmz11slE+5F6pyELHo5lSDFi07ppOuCV45g0CEIWGJicjnbn
 KpKhjn/LwXXLfYAN1dbxTZU63uUybEK/rKadcs8hRZWsqFogB87H5wSGBpUAA5qr/sk3QfPP6Ad
 CevThJe0iPz/Wq7jBPCXgmwxKRwNd6vuRDGTXjNtT1DhoVk+TqYw9zamVA+5xaVLB9F2Rag1C05
 Grr1BrWQliiK6pEivdZoI12i2XkvkYO85UORpGlCeWdRzpEl2G2Uh5mZq/EtCVg/ZkP0YoYUQVP
 Zo6H48PgCo+yrC3hYNvE/jkiqGgPU6uyN7gtdvtLOS9v0kTXDSEc8tHXekH6zMdAKorC9iD3KJu
 QUFOefW3J8Kdx4z5cYA==
X-Authority-Analysis: v=2.4 cv=acpRWxot c=1 sm=1 tr=0 ts=6a32a07e cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=YnNygKpUfyAIgCZGubgA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170128
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113649-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:maulik.shah@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tglx@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E5BBD69A17E

On 6/16/26 11:25 AM, Maulik Shah wrote:
> There are multiple statics used. Move all to struct pdc_desc to better
> align with versioning support. Document them.
> 
> No functional impact.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

[...]

>  static void pdc_enable_intr(struct irq_data *d, bool on)
>  {
> -	unsigned long flags;
> +	guard(raw_spinlock)(&pdc->lock);

tglx suggested to use guard(irq) around "the other callsite"..
which I'm not sure where it'd be - maybe around __pdc_enable_intr()
in pdc_setup_pin_mapping()?

Otherwise this patch looks good to me

Konrad

