Return-Path: <linux-arm-msm+bounces-114483-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tbfsDkbzPGqSuwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114483-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 11:22:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BBF6C42CD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 11:22:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=I3NdIUAt;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="BYZ47hO/";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114483-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114483-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8B3EA303D0AE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 09:20:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF2C9382F1C;
	Thu, 25 Jun 2026 09:20:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D680383C77
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 09:20:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782379236; cv=none; b=VfN15lJiSZMPeRud8NIJs6suCDMpMxmjkQoQ5JE/b7qfsrNaLGz3BAa56dOovd3Opw6lt2ztNwilrNPRWknBA+lIkeKdDxfnQSlzMWRi869wHKU4ZvovNkaK0rlUzNVSGhJQAyOe/02Tpq8znPgo0Pem/g8OkOnRz1/V0hOXSKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782379236; c=relaxed/simple;
	bh=a5gHmSxXk0EM6GiLK8Z+ZY9byqUmLddQvQJnA9muWik=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nUU7H0mWW1gUcEYBEZ7+fHIR+cbOvh/0mhy/6ru3YodY/5/11PhrgxbSqrckE4moktKvs42mq6iZaawaL8S0SklvWBjzkKYiMhppSO5Xu+tE2BIq0XV6nqdiNZ8A4OaonF5z0ffWDekXm8jj+y+Vw92t5FyMF2lsEv5Lj9CtOH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I3NdIUAt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BYZ47hO/; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P8pWbP1795796
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 09:20:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G6owLxNlPkAyRM/9IkXm18k3Rl3GttwQeKqnecszV0g=; b=I3NdIUAtndd/nf4W
	E5mbzdnvQK14a4uUHqC3uWz9nRbLTxCTI2AJu0nWgQfxg8TutVVPs0/AHuqKiiYH
	i7saDfRYRh9017GAaovEi5orCvrdjUNrD2qE60KAKl+Daz12d0mDN3h84WyrzUDj
	CpcE5iXPm3RsagFjOlGFgAJt2GwwDctIjx1RJeJ4PA9mOBqHakATYnYZmMOEtmBE
	XclWfZ3xSZVG/a0p/rE5kOj0sAcF7aeew67URAsOrrstTkqpkHzC2IcUWS6d8FuF
	d3w0shW2LyKWdSgeB0oStGEhLodzHzusXfKHvQhMaDl0YHnI6h3hMw4CrU89D2Sb
	sGpfrw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0ueu9fqs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 09:20:33 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8422ca754d8so1566415b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 02:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782379233; x=1782984033; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G6owLxNlPkAyRM/9IkXm18k3Rl3GttwQeKqnecszV0g=;
        b=BYZ47hO/1Zxlxnq126OZ0LAr6AxEsYB2RAJwb6U+nrFsgEpwYA1hx+WVZD1yT8xLyT
         P0Ks6EatwLYxiLxu40CQs6IFzsu059GM0tqKVIPmWFFrETIxnSn1xQy46R7kLdF74vZ8
         pVKWsj8F6OHrcPEgOlWxvEj+VyAcwlZaUXOWJsvQ9QBgWnPtlXv55gy+07PXqKj+gYwm
         cA8w3ZugNpk4g39A7GqS+G63DoZOgaMtk9neaZGhRfdnLfYGyBeYAH905uFUfjtIgu96
         6VXob22d4YWjo+lQItKQler5h2ShyEWL3GmUd2pseUWJAIQHCiI9MuO+mwSIMFdwl3ZH
         8/JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782379233; x=1782984033;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G6owLxNlPkAyRM/9IkXm18k3Rl3GttwQeKqnecszV0g=;
        b=FNUZbDk42UDdEqH0XkmvSSTH/1AYgnEXFFTlrka4HISZwUNBuix7yp8O0z7zVzt20o
         MZA3b8Sm8R5ctxUvkEIiAt0FlDLNshZx2LfLVnM6zj14ccq8blmRm4yYDTsO8GZKECim
         5dLycto6xHQ9BoFQVCjmgHj40jjavcL3XH2yfTHVomQzu0MJZF6lbc3QQyyAx9RulUG4
         BDThM6nr6wMF3a+VqpWK1FQlvCPriu6WZ2NqhDi94y1C4DFBgNjdtyf8ahJjDLpAGLu5
         KS3fH5IfMk11jBrptMN7gZ8FjZaASna/9v6PiqBQzocNeXybm5EmI5sRknLD45B2/SYq
         YQxw==
X-Gm-Message-State: AOJu0YwE5R9s3XmmGToFNhjdm5GJ6/CbRYCXyFAsON+DX4W9omfSBx43
	3PRgtGtUfRPAStfJ3law7dPH6avtUudRLP718PCx9Gox7OQ4dac1hC7D2JeCmzfkDRIHaMCYbBM
	xtHLf4wVhztmutaz/OKLujE8LAmQMXVolTtF9nh4PH172QvbdLSPrkVRbYJodQDHMUrlJ
X-Gm-Gg: AfdE7cn7/AMY+G0ci0ZDVYzXy5kKh6qDSdWYiaEjsLKp7x0bsJbthXK5KjBD8ajhxtm
	fMhfbCLKY1VjhylAU5Pb7kUlLFfvcaNdtHhMEAlk+0I/1CJrZ6H2BvgfYYUH9yMttYv76IhFnm9
	Yz622FMGeu5qxdZrbkUiU5Aay5up3TBMcAkAANHuMUKUJyb2iRVFJCa/+AW5x7V36O8tay+QWIa
	ogL49XOLqiI8C/IzjlCfb05X2/Rzsax++zD51ufZM0RAakqaQqQG2dsMndxLvSDSZzoC1bGXjCN
	z6JcwWxxRioGT/2oCxod38cQJ+GHPwwYfUEVQdPmhsYKjwFdUs6yGXi8rAYm+gIW0EBXzYcWoRh
	uo5wum61kpIJ84vOogYBjYhq60q5MmQAaGLD64Q==
X-Received: by 2002:a05:6a00:340e:b0:842:6fac:bd3 with SMTP id d2e1a72fcca58-845b3aae9bfmr2112855b3a.28.1782379233037;
        Thu, 25 Jun 2026 02:20:33 -0700 (PDT)
X-Received: by 2002:a05:6a00:340e:b0:842:6fac:bd3 with SMTP id d2e1a72fcca58-845b3aae9bfmr2112819b3a.28.1782379232532;
        Thu, 25 Jun 2026 02:20:32 -0700 (PDT)
Received: from [10.218.48.36] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a3fcc696sm4340835b3a.4.2026.06.25.02.20.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 02:20:32 -0700 (PDT)
Message-ID: <cff027cd-9ada-4a55-af43-2ad8cc27af89@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 14:50:26 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/8] irqchip/qcom-pdc: Differentiate between direct SPI
 and GPIO as SPI
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
 <2978f55b-0b5c-4720-98ba-e14ef46b1169@oss.qualcomm.com>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <2978f55b-0b5c-4720-98ba-e14ef46b1169@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8BD48ILkXzdvxwuZystd1mvZJgi6qogv
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA3OSBTYWx0ZWRfX4ZnTKvL7NkO+
 si7It3NQtoFFq2PWVla1qUkUJoWLk1YLJ+8Px++qZ5JHKEdjZwCuZw8jLv1R282BYBoKyzlpkjZ
 FHOiIRd2YAaQDZQGLGoKC1sLRkrb0J4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA3OSBTYWx0ZWRfX94zRtwaWrwV0
 tUNAm2nHj08G3ubr90pub8F1S344W11l2iuFLpDIX2pCTNy7zvR5bTgGG9ZcKLl6OUrwWAH3vqZ
 f+6ZR6bPglU+xE5C2BRu/NgVtQCfGatwPQQTSvqe95luYq0Morgm1tN3osn+7F1jVR8HCTMgnun
 JUAxLGX9Dre1KtcF7d9lDP7hNCgHCeeTKo0D8rcTCLygHO7hdfQdy/ejgbD2xd5//yhFi6fYy+8
 RJ85CkEX20RFUwQRxkvZkuVhajsRTu6I7BZnsOmAQEySI8qGpU2eOVRkj1epNEc85Ag9zD0Iaez
 FQd8TmMpb8P5fdhjZYoR1PAMdlP7uUN4hEdSI2Wp/D751ccY+G0hTclH8dPNTw0tkjTgV8CWEEX
 s1NxVFVgSwC0nKEE23Rc8gbr+V4wWpRuwkWpeXGSYLIQju9FYfETWJlCYsilUUXN6j1i5AFdCTJ
 lFyaOMPO3MHn3HW+xXg==
X-Authority-Analysis: v=2.4 cv=b/SCJNGx c=1 sm=1 tr=0 ts=6a3cf2e2 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=fkzGnpFETygImC-9BAwA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: 8BD48ILkXzdvxwuZystd1mvZJgi6qogv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250079
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114483-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tglx@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A1BBF6C42CD



On 6/18/2026 1:32 PM, Konrad Dybcio wrote:
> On 6/16/26 11:25 AM, Maulik Shah wrote:
>> Before commit 4dc70713dc24 ("irqchip/qcom-pdc: Kill non-wakeup irqdomain")
>> there are separate domains for direct SPIs and GPIO used as SPIs. Separate
>> domains can be useful in case irqchip want to differentiate both of them.
>> Since commit unified both the domains there is no way to differentiate.
>>
>> In preparation to add the second level interrupt controller support where
>> GPIO interrupts get latched at PDC (but not direct SPIs) there is a need to
>> differentiate between SPIs and GPIOs as SPIs. Reverting above commit do not
>> seem a good option either which leads to waste of resources.
>>
>> PDC HW have the IRQ_PARAM register telling number of direct SPIs and number
>> of GPIOs as SPIs. Further PDC allocates direct SPIs at the beginning and
>> all GPIOs as SPIs are allocated at the end. This information can be used in
>> driver to differentiate them.
>>
>> Add the support to read this register and keep this information in
>> struct pdc_desc. Later change utilizes same.
>>
>> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +	irq_param = pdc_reg_read(pdc->regs->irq_param_reg, 0);
>> +	pdc->num_spis = FIELD_GET(GENMASK(7, 0), irq_param);
>> +	pdc->num_gpios = FIELD_GET(GENMASK(15, 8), irq_param);
> 
> num_gpios is not used in this series, please either drop it or
> use it to limit the index in the following patches
> 
> Konrad

I will remove unused num_gpios from v4.

Thanks,
Maulik

