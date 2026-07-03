Return-Path: <linux-arm-msm+bounces-116242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gjOeHDd7R2p/ZAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 11:04:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3ED7006E9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 11:04:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Q0NHziIf;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Su41Kk1G;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116242-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116242-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A40BA310E872
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 08:49:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 219C4381E97;
	Fri,  3 Jul 2026 08:46:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14DC381E8B
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 08:46:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783068417; cv=none; b=sHEvzHvRJtmn9rI2fiUyDVJQn65w7CCoXZTwF6Z8IwrU7W1VZY72HomNnt5AvMZW+9xckNoOGbJKkU/WBj/00WEC92XACz9LsMD8daFPdGAm3MQW09VIfc5IMqu5KLw/ACoD0pJSjjokL4p6yn9RtkKqniIHT2Eq6XujRw7pKIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783068417; c=relaxed/simple;
	bh=Yh5sN0fooPWjve1pyIXuMVFhw1LAYLqgKlqoMYjWzuI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kM/OnEyl2OyRYxN5UxOla3dlUDq9H/+0vkWkOlb2k4qwM8FNmPUKKivXk8Fr/AjdM185N/XvJP4IUnb8YoIXCR+JJ1hjJA3D7EEtQix7qfZRliezKigrCBxbKqq41v7p/xlp0AISgtQ0PJ/NdlCU/YBZTz8l3UwzoSn7fTeLEik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q0NHziIf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Su41Kk1G; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6636gvr63144214
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 08:46:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B69zEZt3iuxyMdtFtu+kFz/AGfO4nc5UwvvoATuzTCM=; b=Q0NHziIf2STsPAIx
	ZUNVTQ3sSlF55uDRJB+s+lzjVb4Q6NhovInGi6hPIUEzKiH6bZHjSCskI4Oo46jE
	Sq7jiS7kmbDCx4bs97cWF/doxvzCRhtbp/j8fbvqbWl5/euNXXZgt8HWrcxl0vyb
	Tbl1wSw6DqJ6Php1LzYd1MZo8Nhwdbwo2cQ9JUSQgIUEvnNqo1xmkBPOGEJ/FA0F
	mXycevGCW4ccmj8mrETYQBswdyzERfYD03Xum6UfwAZNT5/soYLOYNSxXU5mfzAo
	muUkEjwmC0NlT8CSj3QYA5JYrznhjfZ0P5+85d8qfsRIrAQuR+460IN510dhL4E4
	5jSK/Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f682bress-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 08:46:50 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cac01e89e3so6029115ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 01:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783068410; x=1783673210; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B69zEZt3iuxyMdtFtu+kFz/AGfO4nc5UwvvoATuzTCM=;
        b=Su41Kk1G09jcrl6MjFKGJU6HFuIDGpyCdFZdsSAJEaJrrRo1ES4/ysUG1v4+QuygnV
         USFtI3nmTrb4Kbb6fiKmVaGugvoEpgIsMaalRX1/q0Y8NgfQt66jq/WDRGHg8SYpAW6H
         Ia1H1wO5yP0ip4dQd5LWhE6SEq3UAjCm/1Ty3eJ5pybdEKa5/ehpADniOwAoRL8Je0vp
         ZaBlZ+iMoLCotwDbg7pI05cN9ufR749I85VICB6oNs1NEdJQ22g/7JxyHOl3ncwx+m42
         SOfyXKER+XcO3y84ws5KI8eUj3AE4uJTsOITxXUa3v5TF2nbnKfvAMAo424I4fpuCgJ7
         Qxpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783068410; x=1783673210;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B69zEZt3iuxyMdtFtu+kFz/AGfO4nc5UwvvoATuzTCM=;
        b=ONY/YubGcPY4SzaiLzcYDfvKLL3nkWWivVJSDUjHFKkaQDax8E0zFnS/rWPgSK/DsK
         4HH44/nLJJZRu/3kjoOAjuw/toQVdOO6TvHJ3aiala/nIvONH5NmOx6MNao6hMkbtCdC
         VCmbqegJT582B3H8RbeiN+0CwMCoit9bm2jymIXS6v+jAUqi3uHNUExdrxzmzsRBmwF5
         rJVY7l9CXfQb+Acch+fDvFCNmTlZ6j5Dt9eLZqhQoqdST+06BlkmDzHxIVVf1dPae9mz
         jSUCo9V8nJOCYQNvfzahb/drVjIM2+zw5JLMSI/5oAMDus/KzM6GlWsXTEvUPv+AUngP
         g6rA==
X-Gm-Message-State: AOJu0Yw0uSJWq9DdPMQbqnBYK+AB21WpZ+aQ8u5NZLCt3K62RDxvSomU
	M8F08c2GbOvgl2iixKeodoeTUW4upWJDzlG4iuzS+/O56ynxPm/Yri1wiKDloar9SlrkTl+iqTa
	SbPceCuyKiLSRauOWoLhXnilP4TMuGICrgP9USYVcOQEhHGyul/KzmrU6djJWRIOJJP+t
X-Gm-Gg: AfdE7cm7nyFpag/zkMn2msAlkmaAJAK6mN4PRRcyT6w8PyYHRpMOkc1HFYMHS4gDHOH
	gBHOXaJO49xHM06nmdKPNvSjYRXT20wCpBC3uyez7/9euE6h/JpWpuw4yxNkYHOSdJs42TMBwTW
	beVoPti/znsnaHJnmyiowTehVP5oH+PP4CotaKWc6YmHzIkUoPa4hM2TyB8cZYfyl/EsBREBoM8
	W8ybgEaVPsYnicKZUDI2e/POMKWpfHUEXuY6EQxXV6m41kOb2aYKmmLvSI1ysJQym2upvY6nyKl
	/4x80zEXJcXAVtR0Yor8Nf/l2hNSMB1VuoFrfMaFaRXgNoFvr7BKAr/E40EQC1epcCHwLKxCe3r
	BtiIDQ7sTK6vIs8Zjhpcc/TY/tQLDLVRYNkilR2UF
X-Received: by 2002:a17:902:c40d:b0:2c0:d94f:50c7 with SMTP id d9443c01a7336-2cacabc2ae9mr36765255ad.7.1783068409975;
        Fri, 03 Jul 2026 01:46:49 -0700 (PDT)
X-Received: by 2002:a17:902:c40d:b0:2c0:d94f:50c7 with SMTP id d9443c01a7336-2cacabc2ae9mr36764955ad.7.1783068409489;
        Fri, 03 Jul 2026 01:46:49 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c870effsm21512940c88.12.2026.07.03.01.46.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 01:46:49 -0700 (PDT)
Message-ID: <afd17a5b-ab71-46b9-b537-c5e9b98653dc@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 14:16:43 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/8] irqchip/qcom-pdc: Move all statics to struct
 pdc_desc
To: Thomas Gleixner <tglx@kernel.org>, Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
References: <20260616-hamoa_pdc_v3-v3-0-4d8e1504ea75@oss.qualcomm.com>
 <20260616-hamoa_pdc_v3-v3-2-4d8e1504ea75@oss.qualcomm.com>
 <87jyrgqe5m.ffs@fw13>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <87jyrgqe5m.ffs@fw13>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA4MiBTYWx0ZWRfX4/mGlTIJE4vA
 Luv3rQGzJhnayfgIQ9AIn3/1wy/UFV9501dFHq2lp/EYY75jv6S/9T4JFwueuYqcV1iVbti8DyN
 ZS3ZP2AbGnCg2oGgAYp6C1W7zLI0rUSTnd2WoxXL62mPRgIPfBqlliSkpVSH/5VuctHEI77ngGm
 qVW/Uq87le6JUvXjLPOLqAl2pJL3y31j9MlIFtPYzWfYCmNqhakr65qWN5Ru98fnqj6NZFqRmC7
 0Ol/D5aRGEDEYi12jG0av7mEpunmiVuDtD/OxHlX9zAT6aoD4kVhaUDYfqYeJtvfsADpezlyse4
 hxB5mDKJyWNJUOG/9sUGhQjCNAvuyNEcLjmeGrGijfPHRRBi2eSy8UbHXxLHlIPIgnOgsPac2vx
 F2o9kYVyGOiZKXg4x3dlht04oCFexiVdg1W6wEpMJgEDIycl+zAIkF2z9S2m9ui57LfKBmOkq0L
 cMz7mE+b3U1lHEaAFOw==
X-Proofpoint-ORIG-GUID: Lj2rtQfwaWD-fB6ugWL-eqU9HK0qZmvl
X-Authority-Analysis: v=2.4 cv=cc3iaHDM c=1 sm=1 tr=0 ts=6a4776fa cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=xKoXzObbE768e6KogzsA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA4MiBTYWx0ZWRfX7ldNcz/n7n47
 G7Q1N/0e1NAOn+N1s961ybDi8/QMNDc5WlKVTRrytTQyVMLHz+d4G6798P38Li/8zVCkVOEVKwu
 SLjMzjthqWh26B+slo7bUDBeMGMIkyE=
X-Proofpoint-GUID: Lj2rtQfwaWD-fB6ugWL-eqU9HK0qZmvl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030082
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116242-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:tglx@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CD3ED7006E9



On 6/30/2026 8:16 PM, Thomas Gleixner wrote:
> On Tue, Jun 16 2026 at 14:55, Maulik Shah wrote:
>> -		for (i = 0; i < pdc_region[n].cnt; i++)
>> -			__pdc_enable_intr(i + pdc_region[n].pin_base, 0);
>> +		for (int i = 0; i < pdc->region[n].cnt; i++)
>> +			pdc->enable_intr(i + pdc->region[n].pin_base, 0);
> 
> This needs a guard(raw_spinlock_irqsave)() when invoking
> pdc->enable_intr(). The probe function is only invoked
> with interrupts disabled during early boot. If it's called later, then
> this still works, but lockdep will be rightfully upset.
> 

Patch 3 of the series moved guard(raw_spinlock)() within the pdc->enable_intr().
I will merge patch 2 and patch 3 in v4 series so that lock movement and newly adding it at probe time is captured in single change.

Lock is required only for old PDC HW versions (v2.7 and v3.0) where enable bank is used instead of separate enable register for each IRQ.
Adding lock like below will apply the lock unnecessary on HW v3.2 specific pdc->enable_intr() as well which is initialized to pdc_enable_intr_cfg().

       guard(raw_spinlock_irqsave)(&pdc->lock);
       		pdc->enable_intr(i + pdc->region[n].pin_base, false);

To address this, lock is still kept within pdc->enable_intr() which is pointing to pdc_enable_intr_bank() for PDC HW v2.7 and v3.0.

Since probe gets invoked later during probe, i will keep guard(raw_spinlock_irqsave)() within pdc->enable_intr(),
even if chip callbacks like .irq_enable invoking pdc->enable_intr() may not need _irqsave() variant as it seems no better way as keeping
lock before calling pdc->enable_intr() will apply for PDC HW v3.2 as well.

Thanks,
Maulik

