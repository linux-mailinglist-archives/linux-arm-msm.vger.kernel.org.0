Return-Path: <linux-arm-msm+bounces-113180-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id diCCOkT2L2rGKAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113180-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 14:55:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F05C6866FF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 14:55:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kHsn+DP4;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=K3WY7thk;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113180-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113180-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5F55E3025E75
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 12:55:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1D6E3F0AA9;
	Mon, 15 Jun 2026 12:55:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850BF3EFD1F
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 12:55:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781528128; cv=none; b=Tk0ndi0YOqTZblWBbFY+e3LSxKgwifzrfAV9O7O0igJyvHj5fCHZh4Ph21Nyc2qGDCM1v3mWPx+dPEMTX/umPmDESpwIIhBwxR4Q+Lc5VnjHoGcufgHKDHU1UEB+rXNSA8EtFGHJ8U3YWp6vz5/WP24sC+zTdbNUDcP5Sb7h4w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781528128; c=relaxed/simple;
	bh=z+C5CwTIMYGlI6GS+IyLvLEh+yqlotRa7w5gmiTLq4Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EVA+pcLGa3qZRmR3jbS8OfJ3GzrzA6ThRh9YR7/bXZ1g9o6WGroV+pLb5EscYaQuWp+JgFsi6gSnjH5EDaLaKnB7yjTBSLze+tiT/ae+ZbUcpHqPtZOtYM52QwReOu89EK1tNI6z+QMQ6dxkKnTReozTlWVP8wCHt5f3yzj8JZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kHsn+DP4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K3WY7thk; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FCZFGW008849
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 12:55:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EBj5EYpnlNkkdSHltbSEeB/RYDMVVU8FfN33JRRqLZg=; b=kHsn+DP4UXLD4ESq
	+x4Y6cKPNUgQ1g4/w6bI/lfWdoNfNC6xMbW837C5gzs85HXtZsoEHL4pEpnD5zr5
	+CJVhvJD7Clj4v3/QZYv8hOvKk52HSHWWlJIXkmF/nbEskNy5o8ly2obxzpNKPfB
	SSPa5+AhPdLh+4ieDBSjpolfYd1iCpW6blskcVoAB9O/5g2tXT0CmJyHHF2TjtG6
	BR1nIGfoX1JUwcnU4OFjC8gB8y2VFkOJ0LANV2389qiYpd6+W9ZGMIAjEZ2cjxfJ
	EOHwc/rtngIL9S/0wO7U2x1ONKX8zgou9j5htmFFJuErfMlWUR9lY+2iE+vhaWPC
	O0IqIw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eteyd8q8x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 12:55:26 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0c272e532so35635535ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 05:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781528126; x=1782132926; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EBj5EYpnlNkkdSHltbSEeB/RYDMVVU8FfN33JRRqLZg=;
        b=K3WY7thkqaaf8qh5iLn7A/06H9lUYPYCjQB7hPWxddhZsCSZNOI7pJQvLo6a84B6Cg
         E75vW9Z0I5BClAudcQc2PAcqUMyiztWSNO+JzgtP3yEdc1L0ryp1FK/AUDCUxp6A5h42
         c7iXmXGOQYs98Vsh3It/G/LUGNCIIQNVgbaxBe7Kdsjs4QlY+OiRQnqlSxI2dv4Sjqcq
         pwnHX3IrhGKsWuS9figUkIXcaecRYDjUGdEuClo3ifnYwGE2tekNLESOjvPWZFXxrpfP
         sEMoSQgO5nipVXTAyrcWizwKBG85ISggyrkkvRdYPdNY1VHtrt8Brr3iLdG73AzUPqO3
         qHxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781528126; x=1782132926;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EBj5EYpnlNkkdSHltbSEeB/RYDMVVU8FfN33JRRqLZg=;
        b=epXgVWVfYQQ8zmEaB2A8whf0zhqA8T2qv8EJ5ujfazz75ns6eaCogOUvBezHueJ+dv
         XH9LHaHu/m0wHZTx4e2TnnkR1b9im403BDoq986it2M5mn/1MsvPrWREqi8Cw6P+fsmg
         k+5YT5trrqiZFaKxq6DNTbb8LUr0oQoBMkq1tBq2QwcOFGofhjznEiIK7fgHVSGVW3Hp
         /v1XrssGGF8qvZgeWTgbgn1o2yR2YwWPveGHwCHgzoXB0B+XYS+VavZ/bvN6VjE93PUc
         h0OjvE7hJRyHT60hTV8o+eb6cwaU8DGyA/gQ7vOpy3K3en2TTW99Zplt2NgJLhcYA7nF
         y/jg==
X-Gm-Message-State: AOJu0YxV9L1pIgPDzE3Xlf8h79aDV15Lm3Ji0lI8Ddnu4udBViv+XY+L
	X2DYF5bBUMTyE+5IqMbrePOlZiAGygcfI2UJsJbYvUH3F3Txzu8UkyLm6662YFFX55PF1iOUNyI
	F/pKXNhdOz39zJXW07Om9N+9kVEVs8szCkrIVy3SIoBXL2/VAlX/qDG42vUhB4P8b4KMs
X-Gm-Gg: Acq92OEm2uLGQBeek4rXSv1kzsrtNWejgX1cVwcWm9So3GhJOpZ7TCXewVI0VPFQCfk
	6cKzZvaUwg/B2Djw/ZLirc3e60T/w+laGV30JzqVedwEFNPhyzLa14u9zbmzOBab42WXLS4ylf0
	yapcSk54oOz8sfrFC9zZnGXESgZ1S34DQyHd4Q8cS7hfJh4bZdag5aofEKthJeJVKRMqClJRRCi
	ewXn9tVzxE0jUGtWCMK6c8RaWf8iM17ECH4IuS2HxUtwm3DPS5Gn8ZP5DAWcB8GhBtraoFzm+aF
	WYDU03fpsdvKs7FdR6fG2gwmyHkw5ZXATO2/IrGeCeOYbymclKNIWAOx+qbCiBAR44oZ9PTXZT2
	aHgirkU5QGl1YqT2sgK5xX9DldyZzjn89aYtXHVRtS027Qs/J7OyN
X-Received: by 2002:a17:902:ebc8:b0:2c0:e7bb:9081 with SMTP id d9443c01a7336-2c66421f7famr121880035ad.33.1781528126238;
        Mon, 15 Jun 2026 05:55:26 -0700 (PDT)
X-Received: by 2002:a17:902:ebc8:b0:2c0:e7bb:9081 with SMTP id d9443c01a7336-2c66421f7famr121879655ad.33.1781528125757;
        Mon, 15 Jun 2026 05:55:25 -0700 (PDT)
Received: from [192.168.29.179] ([49.43.226.184])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e5369sm103680475ad.9.2026.06.15.05.55.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 05:55:25 -0700 (PDT)
Message-ID: <498724a1-88d0-48e4-a9ac-fc2a63ede92c@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 18:25:18 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] irqchip/qcom-pdc: restructure version support
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
References: <20260526-hamoa_pdc-v2-0-f6857af1ce91@oss.qualcomm.com>
 <20260526-hamoa_pdc-v2-1-f6857af1ce91@oss.qualcomm.com>
 <e159fc1f-d4ca-4064-8c0a-17b75988f451@oss.qualcomm.com>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <e159fc1f-d4ca-4064-8c0a-17b75988f451@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: M1CwJ9bEscBXDhCpzAqFCqs6_Js-IZji
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDEzNiBTYWx0ZWRfXw6V0LbOd0sg3
 rjDxJ2VpcuSGToRi6eRrZjWGPzHnGupiPrjN2bhubwvJU8foWNEvwm3YKW2kGEqBF3rGME4fIdk
 JGxJfpPmLUbHvu70s4eEbziuejNiGO0=
X-Authority-Analysis: v=2.4 cv=QrJuG1yd c=1 sm=1 tr=0 ts=6a2ff63e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=y5BU2CVYznhbMmzoNeIWMA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=g8VwJLjSMg_G2mMoYawA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: M1CwJ9bEscBXDhCpzAqFCqs6_Js-IZji
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDEzNiBTYWx0ZWRfX8MOinzP9SaPC
 mVd5mjkbRpiwi8jKKLKR09jyE0xIyWlvLRguafusduQ7W+cFX04i0VwPzIyBQgDyZsC5Y+vgs8k
 +CD40Ktwqtkj5tEOLwzNZWDLSeqWTxsa5EA/3P7YkN9jZPzL3p1lLi4n/uNXMXDTTlim7JSzexC
 t6bStTJT0mx4cB0aB/PO9nqxc21seSbOhAkHllBXmOwSBAPaBoY0mWGyxJ9FZt/JNpNqwOmYugZ
 FkZ1iwTiRf7ZevaTGBRCrd0eBtboTZXxypiCrAWr9607oUC1fmFeDVV0GvyPah0xJeDfYmgG/lF
 zknvBo04/Oa8AMAD+R9CmTDfQxwaNhd6vz81Ew9gUbAEYzQoFH+/H/YaM4AATpVDQr1LKTMAUtG
 hQ0I/aWsIoOCGHzOHPVBhgRmMWmAnxm4hCcMLV8bY16su/iJV31YFpwzgmEmV9m9uFTzQDqrnKG
 q7QBPZd5yX/NywSLYIA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_03,2026-06-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150136
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113180-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tglx@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5F05C6866FF



On 6/11/2026 4:18 PM, Konrad Dybcio wrote:
> On 5/26/26 12:54 PM, Maulik Shah wrote:
>> PDC irqchip updates IRQ_ENABLE and IRQ_CFG and for three different
>> versions v2.7, v3.0 and v3.2. These registers are organized in H/W
>> as below on various SoCs.
> 
> [...]
> 
>> +static const struct pdc_cfg pdc_cfg_v3_2 = {
>> +	.irq_enable = GENMASK(3, 3),
> 
> BIT(3)

Ack.

Stephan also gave same comment, i had kept GENMASK() to have uniformity but will replace with BIT() in v3.


> 
> [...]
> 
> 
>> +	pdc->base = ioremap(res.start, res_size);
> 
> Can we use devm_ioremap() here?

We can. I will use devm_ioremap() and also replacing kzalloc() with devm_kzalloc() to remove the goto fail path.

> 
> [...]
> 
>>  	if (of_device_is_compatible(node, "qcom,x1e80100-pdc")) {
>> -		pdc_prev_base = ioremap(res.start - PDC_DRV_SIZE, IRQ_ENABLE_BANK_MAX);
>> -		if (!pdc_prev_base) {
>> +		pdc->prev_base = ioremap(res.start - PDC_DRV_SIZE,
>> +					 pdc->regs->irq_en_reg + IRQ_ENABLE_BANK_MAX);
> 
> likewise
> 

Ack.

Thanks,
Maulik

