Return-Path: <linux-arm-msm+bounces-113697-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pUgFAC6mM2rBEgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113697-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 10:02:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6B769E4FF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 10:02:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=e964duZn;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=MQLZiNCc;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113697-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113697-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 192D7301106E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 08:02:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B64B36494F;
	Thu, 18 Jun 2026 08:02:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FF03D9DA9
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 08:02:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781769748; cv=none; b=Gaihcuqz7eWMD+5/w1SN4dCc69JZB30OTMTjAEQsSosBoAAOQ/aCgJunTIDbMpPZUjm12GIKGxMNui+v7a3fmH576tUJz60N/xW5GPqEH4moHdgr2M4ToGirbEQyz10g0AqxrlTkaUzd8iwSkZVXOjB0a8llFfWjK3yz2/gNdk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781769748; c=relaxed/simple;
	bh=ukAnbDogb87UP61Mar8GPMtMi/rqIRE+bHT4t5jxtuM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jyz32IJqcLGEG/GM4OrNpDmPfi+ZwiQeJh9XSUljyI1StP9ju5fDIYZu238i1kiFnlGeT7qlJHYFVBzw2/QTBUsLHGLJYxJfHGK6FBtEp0eGSwILCJdorHyc3sqGtF6vHbYTaKOc329WbwxYvTEqa6AS+ApJsIeVKl7Y8MImnII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e964duZn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MQLZiNCc; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65I3tDOB2976545
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 08:02:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/N9uSRcFNdrxYby1iNTjX5385eR4TpZ5CgLI5Syc4ac=; b=e964duZnoQXUCwZi
	9qRLhXpCMsY9515ihE4qoLJPHYNCIBL6gWQnwJnthcXs/QfSjPuSjONklX2WsbJA
	l4pRoBTwlFZnvDX6ezYYco1GK32uTHXQgDagT+b96CnwgRVkeq2hsxEqO6z8u4y1
	P3MV3TlmcrzAl49uD/ARy7Cdo1VVs+i6VOLpsAvV0tTz/9NsYYkgy2R/kSCQ5VZg
	/P21ILcWJrd4O+/8rJxn88++eoQbPqnEkZIPLKwisKBCCwbW+Z4OKuJ+Ip4wQTuM
	I3ofbRvRMJO6XqAMlMeY6hCJzfl0cziaPfJTVq9yyFHowAa8EIr1TbRI79tW3J6V
	MzHnow==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eux2cbjbc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 08:02:25 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6c4271166f3so47389137.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 01:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781769744; x=1782374544; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/N9uSRcFNdrxYby1iNTjX5385eR4TpZ5CgLI5Syc4ac=;
        b=MQLZiNCcWUQ5TAKLfTt/Z2n9Y7H+lqj6CcKL6B0n4AYddBlKAjuSE8jmF4Id0rPT84
         N3YfNytfREmXy2Zdb3lHZf53Zheh6FgtR6vzrTb6vikTSHOM/+53ft3NnqgZwgaiZ7hn
         9oMRuIQonrPoJ6UEhwcK6Fzyf0u27t6kAHRzHjaNUclSLpy6PK64QoRYBa0dv9l0wqq5
         s5wqXC0Jr6AJrBTTEy+YzbFEfbosVKfcwmbYsB0MQ3nATGJ2OkEmjup75Vxc35IoNYPA
         EUo02Gg6aJCEu/iuKBxPZKGXdJ1+CVpWeXreQVa67ZKDrN2pXmXwYylsvyJuke21bv1b
         Ur0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781769744; x=1782374544;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/N9uSRcFNdrxYby1iNTjX5385eR4TpZ5CgLI5Syc4ac=;
        b=jUCfPf9bWBpo3342PrUPHyhKmw3uQzdVGH1t/sjn8CJharhMhwS/MZ5gqrQ6cSYlJ/
         r+RFtaBnUU7h+GzNiFyHgt85TQyB61HPZZSU2n6ByyvGAyMGYiHTQbt24K4JnNwApXmm
         nYxHfappd8AIkKAStTQFpPZGasNTsgoi0MK59rrCOIyH2oo7U3D/zgf+T2jFr9IG6p7m
         V3/aQWlkiBl4kLfqywIYKEvlYmTQDeIdyK6zr9dRFskuWVKmu6PqEt7BnOUEIeEml5Ym
         FXiaqsuWsipI54MaEKzj1L+oQ8iTb4oW2INRV1w+nYLLr6HldmiUvN+xr7dLtKt5DNQU
         kNjA==
X-Gm-Message-State: AOJu0YxOEoxds0m0P6rJJvN5nV13Lj2tAuE86zn2t9gwUjiLfxxcBshw
	++QRDMuGE3uCXJk5NHHtAhqPbDSxzn4hsCJBt4q5yqZM0It1z6v3BgWtg+USX44qoNbJRx4e1I5
	tkTKSCYkBupIkLBIF9YK5+Om3pAJY7eQkwS9caDvb9v2mJN1nijl0n6kzjK3BzctFiumo
X-Gm-Gg: AfdE7cnPepmB8c4E/QTsMv0RzVc2NH/movyI21MdA5+tKBdXbICK0Ocx2t4V0lqq5Ad
	XI2OQtHVK5DtlSGvK/8k6iv+frDzcyLih6wS+ajk3Pl7HMfQLqCqoSbgCW9cvAu61EzoJsQpWqf
	SFXEW/JZ4LpvQAIJdQsTP6DnYamZPpgREYCAlQr1kdzvN7sQGuF4lHXocQHf92KkfwYKZacdeCa
	yv7gAMg3ONXzExYmxkruwZLc6YF8yyJSL6eQfLkKiqghnl1HrllwB/scOPw/wC01xgzO9GZvg57
	j5SejrQGHJaDlR70aojN+AbIa3eH9PPs+zJccgpuH/Tj+Je4zfkgI0cb4V+A583oueKKMFLMU2S
	ebRHjBmfJCEk0YhRXvE0Hf1L7pmAc63Wjb6I=
X-Received: by 2002:a05:6102:548c:b0:632:8717:e553 with SMTP id ada2fe7eead31-727d775fca4mr560410137.7.1781769744035;
        Thu, 18 Jun 2026 01:02:24 -0700 (PDT)
X-Received: by 2002:a05:6102:548c:b0:632:8717:e553 with SMTP id ada2fe7eead31-727d775fca4mr560331137.7.1781769740637;
        Thu, 18 Jun 2026 01:02:20 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb5223309sm907759866b.28.2026.06.18.01.02.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 01:02:19 -0700 (PDT)
Message-ID: <2978f55b-0b5c-4720-98ba-e14ef46b1169@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 10:02:17 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/8] irqchip/qcom-pdc: Differentiate between direct SPI
 and GPIO as SPI
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
 <20260616-hamoa_pdc_v3-v3-4-4d8e1504ea75@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260616-hamoa_pdc_v3-v3-4-4d8e1504ea75@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA3MSBTYWx0ZWRfX+ncXWFPs4Hmz
 XZVstpbFsQ2Iic0etDGrnuE5F3JS2QKa6TrcXLETRJRIaUUhqy75U/yp3/EE/froBju3SfxZ29G
 BtMZRNypp6N7NatFwJL+jQ5/2TMfPL8atuAj7wUdiexYB+stefRxgk7td++GOWaa79aCkFAoqM4
 DFU2vQo8jBoUI2BPKQ222Flvpn6mM8oKPrStr96eu5B1d+W8powkZxfDh+SR7PZtS7tcD8s3qdw
 pwY4KQZz9OQOUuFxCO9xKw6Dv1o2k4880iZdBzjqL7YdGSjskK7clACFA6rSG/DyT1ELE9UFfuC
 4zNH+MYeMFsX5tW43kP/ZJ45H1aIRZyxEOjn+v124CEch4oZ6maHl/ak3w2A1T9E5ns8mCO4ef5
 l0NE6AvnACaM3L1gIIJoZPZCfMRjx/NJQlIwBI4iMOcrEAKn4J4bZbuECK0M88T1M86GDvOzq8B
 JJz/+h9LIWGo/kABxSg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA3MSBTYWx0ZWRfX8p69j//Rm0Vp
 BDVA8Gdnwm4NBHIxET1hBCxSiLvXEyIc/U4D3AyvIUhbkrV4T6mljw2stTVirUg5wID5NJMId4w
 iZYrUgBAL/QNupEs/izeOaBWQ0fyvrk=
X-Proofpoint-GUID: yV9IoqnFXB7IVxg4w6oJaDrjTGrSi2KO
X-Proofpoint-ORIG-GUID: yV9IoqnFXB7IVxg4w6oJaDrjTGrSi2KO
X-Authority-Analysis: v=2.4 cv=WN1PmHsR c=1 sm=1 tr=0 ts=6a33a611 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=NCwGtS5HQ1RdJiNybOgA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_02,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180071
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113697-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:maulik.shah@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tglx@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
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
X-Rspamd-Queue-Id: 9E6B769E4FF

On 6/16/26 11:25 AM, Maulik Shah wrote:
> Before commit 4dc70713dc24 ("irqchip/qcom-pdc: Kill non-wakeup irqdomain")
> there are separate domains for direct SPIs and GPIO used as SPIs. Separate
> domains can be useful in case irqchip want to differentiate both of them.
> Since commit unified both the domains there is no way to differentiate.
> 
> In preparation to add the second level interrupt controller support where
> GPIO interrupts get latched at PDC (but not direct SPIs) there is a need to
> differentiate between SPIs and GPIOs as SPIs. Reverting above commit do not
> seem a good option either which leads to waste of resources.
> 
> PDC HW have the IRQ_PARAM register telling number of direct SPIs and number
> of GPIOs as SPIs. Further PDC allocates direct SPIs at the beginning and
> all GPIOs as SPIs are allocated at the end. This information can be used in
> driver to differentiate them.
> 
> Add the support to read this register and keep this information in
> struct pdc_desc. Later change utilizes same.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

[...]

> +	irq_param = pdc_reg_read(pdc->regs->irq_param_reg, 0);
> +	pdc->num_spis = FIELD_GET(GENMASK(7, 0), irq_param);
> +	pdc->num_gpios = FIELD_GET(GENMASK(15, 8), irq_param);

num_gpios is not used in this series, please either drop it or
use it to limit the index in the following patches

Konrad

