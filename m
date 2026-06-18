Return-Path: <linux-arm-msm+bounces-113698-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /4q9J/KpM2pHEwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113698-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 10:18:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C7A69E638
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 10:18:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="G/MAbkOQ";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Y03NhVTB;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113698-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113698-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CE7BE301709C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 08:18:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB52C364926;
	Thu, 18 Jun 2026 08:18:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C272DB788
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 08:18:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781770724; cv=none; b=PezHDcybLyeuZwLTpiVuNVxdNna5ERBxiedSonJp5x7g2HULhLzfh8jt4VSavggkBL17vwTKhKqpqCXMJT4gcQFlXuad1yAaKNEiTDDwBsEDntB/wFdaC628p+ceJzmsH+Z7PC5y0oyFE+ceFNv9Rna2zsfupkKn4X/h5aZv7o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781770724; c=relaxed/simple;
	bh=gFzDwyt2X6xvExVhZeoNS5S99hvPwFohVyXgPPfmGQY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i3/FrHYyX8TVPUgMAzqzUcbGj1Qh5cfJl4hX+0jVpDAXu0hVahJklFz1gBA+JPoufTIZvk5IAoYTXpSKHKJAZ7Syss+08mNMdTEN62rlsZh5EmcwezcgUmtubG6A4LluKjHJM86vraToGD884xdLcOB3NLDPsVkwXO89GvWWpcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G/MAbkOQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y03NhVTB; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65I8DsVJ2246964
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 08:18:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nZj09S/BPA0LGOpjmWXCjddpOq0twXITRnAhohphPiU=; b=G/MAbkOQ9ABuri01
	qfZODnVGS3de2ZDM46Q0ZfNBPCMShSg2etQl/aIrPcceDEYl95YCVUKh6Bp4j3Uq
	HEmLY/pj0MEV+c3DBc1Svr+uTdlOqk1ToEVINzPjvwkyva1bOqz/Lv+FOLfbY0fp
	IoUPEQ6w2JI2fFSI/s1S/iXElYi+GQKTty4y7AEeofFdX7qmTUaNbk95ftjRlG9h
	WYtyeTPXfLOjDmc0WoD9TxfLGqkvnGKc8wA2cSCsAzDq8Qd/Bf+YtCO5sLgctC4m
	LIRqrTrR86p0WRizVthuAdGqIfKg6fBq3bTa0cZVyfnCZDLDc7cblYh7+r4AsZQY
	r7VloA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4euw9vm00c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 08:18:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9160006de85so21692685a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 01:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781770718; x=1782375518; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nZj09S/BPA0LGOpjmWXCjddpOq0twXITRnAhohphPiU=;
        b=Y03NhVTB8FsUqBbYTRQQWLL+wxRbOXh//wB+edE6Lu1Zbu8rbda/HcExXWruFh1d6B
         c6S4eOosyOOPvLBwYfNGL7VzLl5liKnUlG3XV0sXU0+OmUzPTNPXmeFKqcpIU+huaEkH
         OxQa8z0c5K16SFJSTXh5sXkeKpVsjU+6E7wQYsPrywi1C51KZSIN8h9uH2tw17w3GWY1
         BXaaY0I81rBE2Y2+C7zhWWUIRLsCE7HUJ//xUJVvv7/fSW5oihe3A88DxXhbhlV5j/Os
         kFs6+byJqW695WsUaq8z3oiR5fyK8fDFcaoNxZ4w5ZOeIRNz1Y4tT3/kH87kZh8ZHPwD
         tzNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781770718; x=1782375518;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nZj09S/BPA0LGOpjmWXCjddpOq0twXITRnAhohphPiU=;
        b=XOLC44PKZ0Csbi5kaMK+MGcVA9yMy48mB7BGJ1bM0QzbxP/btirPfg1FkDnU7uf7On
         maqt9xfU2OpS8tYWeJy9XaPgqjPw5zQhUUC+AetthFx/TE5v0lYZ4dgV7R5CXt4WwjFl
         qxhC2+5ZMFQyDYonvLM4Tr85D4mW7L833ezJ701JpL6ptZcSv0Doz5HVflQetgMJr8IN
         5rHPIysFjrpObr5h3Nr6E1ZQL9K6mmGTFrBV/5IPw8UrGnlHkNrl50t/YynHyxQhN1LL
         WAG/Ccz2EjwSjaHrZkXk0zCWhnnHsPvqgU7sTV7TBVfxRhxZWLhA2PqVfo3jDP4ntWnL
         hIPw==
X-Gm-Message-State: AOJu0Yx1n0jCwJl0L68zZmdWcsmLB/rj9+I1vRaBFzfeK5OPbQIoqrAI
	YMz+cnDiRZmG3ZNtSnLhMD4LZsChwlRc6bVWF9Zyqg5rOdFcUwT9GpiwwcyqA80WkPWwd5lR2e8
	mSeVoWqLy7PU52HRmsLiBiVJruCnECqlW6Y38hiVHlEzAVEgSex4fhMrXJRlExlCf4m4efItKBz
	4W
X-Gm-Gg: Acq92OFekHKmH/p+LGbvVl7lfvUnSuxeXXDJZNK5ToptzAUgNfUG+VzbU4f6xPUKM3g
	P1eFGde19yep3tDyIZTqsjM0CXJmMCpwcCLe9L9CClAN4Okuk/ww26jRlDai2608qX7EasYNaxP
	MpB2dkdFyKdc43QKbD1nrAoOqQIfPynpfx6BjAXSIkQ4SuMEA1wP5BdtIIoLnnpJIHpFRJJCmJh
	uNtxDZbtOUqnTZ1qao4YV3l/9Y+1ZNhCLw/WQzb1Rsmj9F/6tCGlCavHv6xpX9xyEtphUKwI4m6
	dKi5r7Kj1Atkyh5igZLhoaE+c3Ponwc7jWI6tAqVo2LCyey2Wzf9jDOMcVTkP12D1lfso7dHkpm
	jTWMSyOFFJbfXtwhqYUldmvfxFtcuRqn7KAM=
X-Received: by 2002:a05:620a:3721:b0:8f1:9e59:2208 with SMTP id af79cd13be357-91f2a1e4688mr233824285a.4.1781770718362;
        Thu, 18 Jun 2026 01:18:38 -0700 (PDT)
X-Received: by 2002:a05:620a:3721:b0:8f1:9e59:2208 with SMTP id af79cd13be357-91f2a1e4688mr233822685a.4.1781770717871;
        Thu, 18 Jun 2026 01:18:37 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6955acc7597sm1902928a12.9.2026.06.18.01.18.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 01:18:37 -0700 (PDT)
Message-ID: <e513bc4c-ddeb-43b3-aa05-59051136ba4e@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 10:18:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/8] irqchip/qcom-pdc: Configure PDC to pass through
 mode
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
 <20260616-hamoa_pdc_v3-v3-5-4d8e1504ea75@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260616-hamoa_pdc_v3-v3-5-4d8e1504ea75@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8wD4iUV-xeCSSF81-rPm8WZIucZEDpn4
X-Proofpoint-GUID: 8wD4iUV-xeCSSF81-rPm8WZIucZEDpn4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA3NSBTYWx0ZWRfX6WU3tPz4mt1P
 UIiPcs/Wp6ffZFE0LFO9fgSGwoOMWJWySzKbCrI0R18QyxEM/jiPym/TkDnhtf0uHbWlDsVnP7x
 XwIQQprN9euQdhR6AV2pWPsJJXpjWsbIKjiM6MQZ89q74dqg87GTus09qmC25E2u4Bos+EgBpEw
 8bCJrRrLGwTqFiuBhBcFIb6lxErha7QMgeLWJ4ny4WhULXAe/3vvX6/+19t1uTCK58H4ZOpaUHj
 S6VTMF0hCnPVyrjDZA9oIy7quu5xKnPxvPQQcBjyDFmk12B1/MplLsvZvsa/uT4GHDp26xh+BaK
 xL0muLuAZMv/+HkglxxKYZy2mKgwXHH5JLMibVX7H37A61IYPRljegTzf9F6lcfGDZBhMrq/kcb
 krYhvhCk5JQS5s9/P7z8VZuS5/I2LH2LCpqbPnDCPwrrzVjRD+Z+evKpvZZUPgpKXGrH+ZsZiXc
 EopZld6F8LoGtlJx9+A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA3NSBTYWx0ZWRfX8eLknl0ZNWNu
 +jTHyS88j263RSWWxlISMviWhLKEnu7on82bl0w8rB8AczO+VmL9ytmnQqP5JWclIFVQ3Iv5zqC
 PXY9zOsvf24qV3ZDLFffvxbSCELiq9w=
X-Authority-Analysis: v=2.4 cv=YJKvDxGx c=1 sm=1 tr=0 ts=6a33a9df cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=83jgrZZgdiTdjN6bNP8A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180075
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113698-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 64C7A69E638

On 6/16/26 11:25 AM, Maulik Shah wrote:
> All PDC irqchip supports pass through mode in which both Direct SPIs and
> GPIO IRQs (as SPIs) are sent to GIC without latching at PDC.
> 
> Newer PDCs (v3.0 onwards) also support additional secondary controller mode
> where PDC latches GPIO IRQs and sends to GIC as level type IRQ. Direct SPIs
> still works same as pass through mode without latching at PDC even in
> secondary controller mode.
> 
> All the SoCs so far default uses pass through mode with the exception of
> x1e. x1e PDC may be set to secondary controller mode for builds on CRD
> boards whereas it may be set to pass through mode for IoT-EVK boards.
> The mode configuration is done in firmware and initially shipped windows
> firmware did not have SCM interface to read or modify the PDC mode.
> Later only write access is opened up for non secure world.
> 
> Using the write access available add changes to modify the PDC mode to
> pass through mode via SCM write. When the write fails (on older firmware)
> assume to work in secondary mode.
> 
> In secondary mode set the separate irqchip for the GPIOs to perform
> additional operations only for the GPIO irqs.
> 
> Co-developed-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

[...]

> +static int qcom_pdc_gic_secondary_set_type(struct irq_data *d, unsigned int type)
> +{
> +	enum pdc_irq_config_bits pdc_type;
> +	enum pdc_irq_config_bits old_pdc_type;
> +	int ret;
> +
> +	switch (type) {
> +	case IRQ_TYPE_EDGE_RISING:
> +		pdc_type = PDC_EDGE_RISING;
> +		break;
> +	case IRQ_TYPE_EDGE_FALLING:
> +		pdc_type = PDC_EDGE_FALLING;
> +		break;
> +	case IRQ_TYPE_EDGE_BOTH:
> +		pdc_type = PDC_EDGE_DUAL;
> +		break;
> +	case IRQ_TYPE_LEVEL_HIGH:
> +		pdc_type = PDC_LEVEL_HIGH;
> +		break;
> +	case IRQ_TYPE_LEVEL_LOW:
> +		pdc_type = PDC_LEVEL_LOW;
> +		break;
> +	default:
> +		WARN_ON(1);
> +		return -EINVAL;
> +	}
> +
> +	old_pdc_type = pdc_reg_read(pdc->regs->irq_cfg_reg, d->hwirq);
> +	pdc_type |= (old_pdc_type & ~pdc->cfg_fields->irq_type);
> +	pdc_reg_write(pdc->regs->irq_cfg_reg, d->hwirq, pdc_type);
> +
> +	type = IRQ_TYPE_LEVEL_HIGH;


Please carry your comment from the previous revision:

/*
 * PDC forwards GPIOs as level high to GIC in secondary
 * mode. Update the type and clear any previously latched
 * phantom interrupt at PDC.
 */

> +	pdc->clear_gpio(d->hwirq);
> +
> +	ret = irq_chip_set_type_parent(d, type);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * When we change types the PDC can give a phantom interrupt.
> +	 * Clear it.  Specifically the phantom shows up when reconfiguring
> +	 * polarity of interrupt without changing the state of the signal
> +	 * but let's be consistent and clear it always.
> +	 *
> +	 * Doing this works because we have IRQCHIP_SET_TYPE_MASKED so the
> +	 * interrupt will be cleared before the rest of the system sees it.
> +	 */
> +	if (old_pdc_type != pdc_type)
> +		irq_chip_set_parent_state(d, IRQCHIP_STATE_PENDING, false);

This bit and the switch statement above are common between the two paths..
I'm debating whether we should factor them out as static inline void, but
neither solution is perfect.. so, up to you

[...]

> @@ -385,20 +547,37 @@ static int qcom_pdc_alloc(struct irq_domain *domain, unsigned int virq,
>  	if (hwirq == GPIO_NO_WAKE_IRQ)
>  		return irq_domain_disconnect_hierarchy(domain, virq);
>  
> -	ret = irq_domain_set_hwirq_and_chip(domain, virq, hwirq,
> -					    &qcom_pdc_gic_chip, NULL);
> -	if (ret)
> -		return ret;
> +	/*
> +	 * PDC secondary chip is only set for the GPIO interrupts as SPIs.
> +	 * Direct SPI interrupts are still in pass through mode (no latching
> +	 * at PDC).
> +	 */
> +	if (pdc->mode == PDC_PASS_THROUGH_MODE || !pdc_pin_is_gpio(hwirq)) {
> +		ret = irq_domain_set_hwirq_and_chip(domain, virq, hwirq,
> +						    &qcom_pdc_gic_chip,
> +						    NULL);
> +		if (ret)
> +			return ret;
>  
> -	region = get_pin_region(hwirq);
> -	if (!region)
> -		return irq_domain_disconnect_hierarchy(domain->parent, virq);
> +		if (type & IRQ_TYPE_EDGE_BOTH)
> +			type = IRQ_TYPE_EDGE_RISING;
>  
> -	if (type & IRQ_TYPE_EDGE_BOTH)
> -		type = IRQ_TYPE_EDGE_RISING;
> +		if (type & IRQ_TYPE_LEVEL_MASK)
> +			type = IRQ_TYPE_LEVEL_HIGH;
> +	} else {
> +		ret = irq_domain_set_hwirq_and_chip(domain, virq, hwirq,
> +						    &qcom_pdc_gic_secondary_chip,
> +						    NULL);
> +		if (ret)
> +			return ret;
>  
> -	if (type & IRQ_TYPE_LEVEL_MASK)
> +		/* Secondary mode converts all interrupts to LEVEL HIGH type */
>  		type = IRQ_TYPE_LEVEL_HIGH;
> +	}

nit: (pdc->mode == PDC_SECONDARY_MODE && pdc_pin_is_gpio(hwirq))
could be the primary case to better communicate intent

Konrad

