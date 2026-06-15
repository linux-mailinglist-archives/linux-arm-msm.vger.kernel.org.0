Return-Path: <linux-arm-msm+bounces-113083-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MM2DH+SPL2o2CgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113083-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 07:38:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D28E6683884
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 07:38:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=lvmeXDRl;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ghG61zTf;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113083-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113083-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 976A9301E3F3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 05:37:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59B393AC0F4;
	Mon, 15 Jun 2026 05:36:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987453AB460
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 05:36:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781501812; cv=none; b=bHtDagcuPFVgmU134E8wuxJ/uBSwl+gIF0HX/e7tJD7R+JIArs+nGJ2Wrz0LiDoWtIqOMxLj9QPVKKN1bFUQ6Q0yYAJzSilmZOCxv0kgsRGw8q5koSVKg88gJpwzKfbZmkJt7ksn+fsbtjHATvHsJg8gBwpdwzlAJNHSgLlX5WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781501812; c=relaxed/simple;
	bh=qYK+7l93uL0ldevPNHCeXcekblMkaafTeKpLCsf0SqM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NnIshML5swaxJm2AE+Ht2iRIFNF1NKbH+jdtpGKiYeN+xR/an5aRCU/fQgjO9bm7Nvtbd/aw8j/07jhADB/FB40F+zUoWqXip1ztDNpDGN+9zr2AhVpDk4FDwbN/ivo5ikpZfK+RtWcdkDcbvihP3NXpbLsCiOmG6zJGzJ6xF5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lvmeXDRl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ghG61zTf; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F1kl8l3224883
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 05:36:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L5EGAAXepjhAnoVW1OslX4X2Oh4gOE97bCua8lUPgHU=; b=lvmeXDRlx2SV6MH+
	/kRZ6XZfENXNA7KpWZAat2NMSIWqCbDgLpoVQagcgITE3a7MbGHNjdl264apciCo
	54adl+YJ3Lrtxnr+CVGXOtCvihZ0ZhOCuKDBqQ8mYP3HukpXCg/LlJc7dOipDnyo
	Bhz4pLE0z6kfWR0AEY8fWoF254Pio6aU0yflw1JO12zhKbq2tZYIwUYzho8rhc3w
	NDNDXCG6UhLQOwxzlIRuSBQdJwnotcUDPEwyDNVAfy9ud0mailK+o+5gO35IU4H5
	vo4hDTaju+I67VEzd5T/Al6HvZqp+n3rTrQiVHsVXz0kcKH35FK6tI99PEjkFN2A
	yB2W8Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery7u5prx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 05:36:47 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c10cd7df22so46906575ad.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 22:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781501806; x=1782106606; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L5EGAAXepjhAnoVW1OslX4X2Oh4gOE97bCua8lUPgHU=;
        b=ghG61zTfZKoYJFgHGYrJUsQKuYJrUgoOr9IkMAGWPy0sozpIZCt977UcifsOhUFkYm
         fGnW4qJCGtSrEaxTqAbLurrR2ykn4TV1vl7/aW3+IiQdl2Q6HjEZ19TWmU7Z/ac7FZYv
         ycKb3lE5W+tzfGSP2pBBeDCPrI294HAOuEMbil1K3JIWyXlaRfvdOQUvOq1k7ppcLoNV
         9Mkw9Bawbf0BtLBJtUdCrE8f70b2Eqaj2pNDgDThh7JinaZPWxxiCS1nwO2Mu+ggdEKl
         kVeBA+qRRzgviXvL6XPfBqORSwiN+JWPPu6jEMxFgYGwPfBRga87e+ZDk4U61CTzmIvM
         emDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781501806; x=1782106606;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L5EGAAXepjhAnoVW1OslX4X2Oh4gOE97bCua8lUPgHU=;
        b=tHhMzB8Dp+KwScNpcOHZc6dGMtrHxWuTo+G+RxyZNWljLuiNFYtX1NTo66OCTt8Hfy
         KgPHG1pjlLXO9zJriF15qFuFls1+FLvjvnW57S4lFWg2FwvU2frbdJd9JxTK9HCniN9X
         swpb5FB5GsL6vANWKCbGvVFzLtRfB9vuafezczcUXBH1Fd7hgWCl96/GeK9bXVR+xVQ3
         45NRK+B3mUCuXUUIT9fk7UWdwTaNVnprn/Zqg640wPvN8fvdeRK8dVGTlTqnJe0HRgob
         kJd6tVWkZcZE5NufY3MaEl7mxjtTQzqeCks07EosxpwWcM/dLY8lQfKMDGiH+9X0z0h8
         /2Ow==
X-Gm-Message-State: AOJu0YwGkWmZMJrpWnGPjGtFXS4tHz09rZ5wvI1YINYmO4WumdvdGhTa
	NRU/v2RHwYYBbyfZ/a7nqvb7e3Rml7NSDL+S2DqrE+5efzUSDwhCVdrI+5LJdf6v9Ab7iUjf9RT
	9SXhyCvv3GQ8KlMjBf5HNkzK29HXA8RbOrt7se92uwpJfcqg2fK4fcLQOpgOorXunf+op
X-Gm-Gg: Acq92OGOqJ8g1MCBoeW+x20GEnrPOubqVwKClMCj7W9eu+WWbkkBS4Cki7vbsqIbyNA
	51VA9U7DldRxq3SB9pBC+lTNugMMbkYU8daeckzSq1nEfnVFat22jKNIn5CILESp1VN4w2rhL4U
	h6Z8ae1SIM8M7saD2ieI0Wu/PVBmRV0R7dA/FhKIAWrs2PI+/+eq38u3jAwPwmJWIL/XhYZ1EvW
	bWoP7Ams67mWqYQny4hrFYQM9Wq8FgCTlpUFe3VYK+rAokfLJRgKWNJsAlsUgkTDe6Ekv4Vm6Xk
	KEnLLe+DvtzGlHzBpVbnm/J0eWLk/oGtIdDY3P7Uxo5Ww64UIZOAuBOmLYQB+zOnY1xQrLeRARp
	3kfTdDyd5xkgD0FK3Q3pdvolRdpU+d/qRIUPPZwyGSUnltfz7Tt4=
X-Received: by 2002:a17:903:2cc:b0:2c1:1a22:7c43 with SMTP id d9443c01a7336-2c412360000mr140474495ad.24.1781501806482;
        Sun, 14 Jun 2026 22:36:46 -0700 (PDT)
X-Received: by 2002:a17:903:2cc:b0:2c1:1a22:7c43 with SMTP id d9443c01a7336-2c412360000mr140474275ad.24.1781501806100;
        Sun, 14 Jun 2026 22:36:46 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f7c5dd0sm111774125ad.20.2026.06.14.22.36.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jun 2026 22:36:45 -0700 (PDT)
Message-ID: <743080a3-c693-4a9c-b12f-b1e46a4893f6@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 11:06:42 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] irqchip/qcom-pdc: Differentiate between direct SPI
 and GPIO as SPI
To: Thomas Gleixner <tglx@kernel.org>, Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
References: <20260526-hamoa_pdc-v2-0-f6857af1ce91@oss.qualcomm.com>
 <20260526-hamoa_pdc-v2-4-f6857af1ce91@oss.qualcomm.com> <875x3z7igr.ffs@fw13>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <875x3z7igr.ffs@fw13>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=F8BnsKhN c=1 sm=1 tr=0 ts=6a2f8f6f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=Sssc6dVpwyjkiyZbIosA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: dXu0HrKDdAUNLGzPn6zvsIdT9_t1ZbWS
X-Proofpoint-ORIG-GUID: dXu0HrKDdAUNLGzPn6zvsIdT9_t1ZbWS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA1NiBTYWx0ZWRfX5fG3XkUnY5c4
 oWCEBpXN+2ZXDJAHZhBwMn44wUNQkexiAOvqg0LEUPRjLrolffKe3iEU/+ucZB3lxYWula+o7H8
 ipjJlHxL9qG93xU6LpCWai2lUVXXvT4ziKVXL9samtd+381BrxLohbLMDyDexy8iAEFxpFJnra0
 WhHNoWmqCSiT+zXubikO9suGunDVCL7IOuFW9XPpbi/6UnsDTIlRc3zkHZZQoAQui/MRIiEk3V4
 yzp3+7MGm7pNB8/roJ6bhcygVCkKQrUhUcZ9OIUPnHuPD+TLYowcXSw8mVMDovK18ykSOfnXJpK
 elO4uY0nt+fXWMVUzHiV66/0oTcHYD4XjNC0mNCGgYIFM7Q9OiP5MG+kk7BZEBZu4X1iybGyF9b
 AbmDHVK0N7Flm4OMEvuvQw/PyQ1qm9BY4eTK10tvLeIKEDAPNR6y6OdiTWNgpFhziytpaforr9Q
 ixJjl9EBG1bTw6/c/bA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA1NiBTYWx0ZWRfX2aKY6O9H8gzA
 ahNQiUU90VT4/iQZqhkVg4YfdAlwFtN27SS5t7/LZPfemrzay9+yNIMcjh2G0S0AMU4HkiWpFmj
 G1m3oS58qqM5/lWvLJn+zBiUBbTZAp4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150056
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113083-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:tglx@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D28E6683884



On 6/3/2026 8:57 PM, Thomas Gleixner wrote:
> On Tue, May 26 2026 at 16:24, Maulik Shah wrote:
>>  /**
>> @@ -92,6 +99,8 @@ struct pdc_cfg {
>>   * @base:           PDC base register for DRV2 / HLOS
>>   * @prev_base:      PDC DRV1 base, applicable only for x1e RTL bug.
>>   * @version:        PDC version
>> + * @num_spis:       Total number of direct SPI interrupts
>> + * @num_gpios:      Total number of GPIOs forwarded as SPI interrupts
>>   * @region:         PDC interrupt continuous range
>>   * @region_cnt:     Total PDC ranges
>>   * @x1e_quirk:      x1e H/W Bug handling
>> @@ -104,6 +113,8 @@ struct pdc_desc {
>>  	void __iomem *base;
>>  	void __iomem *prev_base;
>>  	u32 version;
>> +	u32 num_spis;
>> +	u32 num_gpios;
> 
> Please fix up the struct definition coding style.
>   

Ack. Will update in v3.

Thanks,
Maulik

