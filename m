Return-Path: <linux-arm-msm+bounces-116774-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8374NZCaS2pqWQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116774-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 14:07:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD0E71040E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 14:07:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="N/qAKNWC";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=VkmaABIS;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116774-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116774-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D7C7930013A9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 11:57:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 737A24229CB;
	Mon,  6 Jul 2026 11:57:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA04371D14
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 11:57:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783339050; cv=none; b=SoFedka++fL43Lqjge2KWsly3orqis15Co/70+11GFiQW1gVATUuyTHpsy3N8eVn3H6iPNGyXb20xFI0jTvPzqo2ez/27V20d+2vS8aHYoz4UxqmPB8uz5auxIVyslODLKFC5+WcY1IVz+rP9XZJ2otrKWneGsAPHLluNfp8+aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783339050; c=relaxed/simple;
	bh=wDS2mqY26T3CGm8J28Ht6S/UzddQUEAWXzdhe/lQL20=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nCzKMllGrqCeiI/vRcepaZfcM+WwLhJtdNDp3XI/vYNgXVO6Jn7mlsIynyV46py0IAP5JNAGyVKLl4F1iR1QLE8t6dJppdh7GNmWzk3i7nbIbMPHWSkFMu5XXF8WCTIZqgwRB5nad50X7SRXSU93r+GMSUm3hXHxu4kWErjgLUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N/qAKNWC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VkmaABIS; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxDxs238186
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 11:57:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Me0MyoIVH0sMpm7In8imokOusfmHoX91WUrEBl0XvhY=; b=N/qAKNWCJReerKQd
	MG1oXaf66ALgDNJYwO6KL0uN9UkbwTMP9Z5uh+zco7rJIt8mLx9Tnmu+h37yegHU
	UoUAys2+/DmjuAxdRY0f7dMRxs5WmBg8+iAzz+KbBuDIaxUa++bJ6KWbbl+HXCPl
	SldcwQpsb/SXp+YoFAeCJiIL96sy3nAe4/HUc36+4+6GbSx/JFzUSh/GuMHOavbW
	g91BOv4JyTtycRS/WVh1P3/X/lW1g9use6HdnAh3RNkZa3V7LBku7gobesMGDtK+
	H6FgT0LJtnpLy5nNacRX8x1m2a3mzdhhMQ+W88aI197qwgegXBmbSLC4RHmDi4Re
	Dn42uQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88t88tk5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 11:57:28 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c27616421so11558081cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 04:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783339047; x=1783943847; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Me0MyoIVH0sMpm7In8imokOusfmHoX91WUrEBl0XvhY=;
        b=VkmaABISOWTL/N8DYR8thFfABXBDwE+Yd/y9RFJY5NM9j4CmoS5mivmDc5hst+nVW8
         /PVpGYRfjkMQq/Myq0mEhe7CBVuwZSzr2DyP7yBbAiDcoZnehddFB4Hb7yXDw5/Tmrpi
         Av/y63ODjvpriXwdSAYj8yqlT9at5yMH9lZ71FO3chkX1bG1u2sk7cbgHfjE2IN1AcAz
         +2bAsbd35cYQk5pQRV82W0GN1yNnuTmA3eGNFFm1RCwGbbU5GdQ6uAvUkydga5HPEBRY
         JbovbPG4fjB1PujljfaZV2BD3TPxUOF8QAgpEANCVUOQAGb+NWbQ7zqj7+C7KbOWi/67
         A6rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783339047; x=1783943847;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Me0MyoIVH0sMpm7In8imokOusfmHoX91WUrEBl0XvhY=;
        b=cfrliUMT0sUZVjkmkb+31YjLx2sG0qlMXdFfjHDhZbtjtOm9EyFcYGtxAqihdIZMvH
         m2Fd5vpDQOrEr0ll0ej+mSPaFUn1Suc4108WUBTr6wgUTn1VIsgCv2b/FFUqu7ObRTn4
         gh9Gp+fm/H0Gpao+zn0jaycrvqaue/lfWFZGJxC51Kgr+xMnrROsMakV5TJOegzRCqHB
         4iMUEgpWw5qaZsLro7CFqy4wzTw4NZ2oAvF01iNlU8IcTFg0m4UovMjh95I+L5kZiA0l
         R/KOOqxOjsHIittz2ZAe4GfaBvu48O1MkTks0NUHlgkanBCy63XANWA/iMZqHR4HWFqa
         +0QQ==
X-Forwarded-Encrypted: i=1; AHgh+RpqoX/CioE0X2AayhGE/7hL0uwfIESnLc/8qcsAI9LFVLG2w8+wkoWH8NRcT5cLuc2cqpbtevNdV+isooXh@vger.kernel.org
X-Gm-Message-State: AOJu0YxlE3qfdenvVm9n1WHTE7p1QWJzFsMLAn1p7f/KCEOnQXYWoiMO
	43FKGpkJKXqz0HRXWu4YP/a7hAr5TmJJP60jT6wDewM8E8LtvW33E6KEhtspTs+BqZKYDp7tLUA
	RbgbNE2bXpaiUflmOOCGw3v65WI2HWgCmCbqMaUd4vU2CC4p14Hr7cpw24DtdG/gUhenu
X-Gm-Gg: AfdE7clLyLEFCjY/N9ql+ZSLPww/g43CGRZ7JnWmV0NeAB6Je2EqUQu3OvC/CdlVW2/
	MYSQpt+tilTfPbBsKHWJYEkarUquUCJNv158QIGJe+k5zvRSHU6HQOGVXZl48rhyvraObgsBbVZ
	NQtdfuAXNZ/xQxe9FTW8jqEnv1IDXl25HcoDW4j7MdhHbZDwT5ZXRlHI+vIyP5SOKkS7BTY+Kn9
	E0FXgxNLa+ROtwB8pD4swosLiJJddQoLF100xFmk7QC60Beqx/g/Fm3ZS+YWd0Fbmsc8wLoxlfB
	XqDaOjClEBC79tu5108SY92uV/Vtr9RiP+P3RbfI9fDhBuGyUHuDrprgl/qkIRdzZcXO+fD5VUB
	J1j3hbuBzYzjHscc6Ms1ndmPfj+0Y36XE2jU=
X-Received: by 2002:ac8:5710:0:b0:51c:db4:3cb8 with SMTP id d75a77b69052e-51c4bed6cd2mr89588271cf.8.1783339047287;
        Mon, 06 Jul 2026 04:57:27 -0700 (PDT)
X-Received: by 2002:ac8:5710:0:b0:51c:db4:3cb8 with SMTP id d75a77b69052e-51c4bed6cd2mr89588051cf.8.1783339046794;
        Mon, 06 Jul 2026 04:57:26 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62c2d37sm729266666b.42.2026.07.06.04.57.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 04:57:25 -0700 (PDT)
Message-ID: <21f13da7-94ee-4eb2-b2bd-6200d70f38f9@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 13:57:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] powercap: qcom: Add SPEL powercap driver
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
References: <20260702-qcom_spel_driver_upstream-v3-0-434d50f0c5b0@oss.qualcomm.com>
 <20260702-qcom_spel_driver_upstream-v3-3-434d50f0c5b0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260702-qcom_spel_driver_upstream-v3-3-434d50f0c5b0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEyMSBTYWx0ZWRfX+msCTMzn4aTv
 rnvAi2WjPZr9CZeGkEnkXbhsjYVe8VVB2O3QVPDNc2wS3/dyVo6oSI8XoQZl12k6uL4vXuEj9q0
 oHtqGZZww8rK8bbsEMRdTFC9bpuDK8Q=
X-Proofpoint-GUID: z-OqRUa3-URyNOtD_jpcYOB8WlSmvgEu
X-Authority-Analysis: v=2.4 cv=C6zZDwP+ c=1 sm=1 tr=0 ts=6a4b9828 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=yjWOilcczNxlq6oZqccA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: z-OqRUa3-URyNOtD_jpcYOB8WlSmvgEu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEyMSBTYWx0ZWRfX0lWa5Ntxg9bQ
 K3dSc43TerJMwvfzznEaW0bZ3w9OCW25OYgPuONpu6rxvrF5B1WIauaYhqhUTL5AIPv0IvFqMHW
 U+D7xBMl6aI2z/AQmdzramJHsR09sC6zeHwa1+V3Tw/xNUEWDzVFZmzBAI9Cmbg1OxLovgypeAE
 11xKkFS8ztZ0A6XIqKU5tbK2RGpGkIzjf2+mefGwgDXv2/16iI36Z3FwBVz7b7qZLL2jcwgRUlK
 94gCqZ8w/B/6OecbWcWoSyonbyZU7NzFZPwCug6kcde30UBWDo9v+dJCa0RkzPJMwTIHWGCXQU6
 vi5PzOtz44T5Jd6YJrf8kMpkK/42xaMmAji6l/2Igq2lqxN3IjaV3XNgeInFsNSxQ7ZEZFD0EHO
 fo3d2NIQxHVDwMTEibxrB8MgqUeH1GHjl5RBbiKREAcPuE9X9g5wSUwln4+ZickPfqh7mb3lA3X
 6SHfU+W5BPafyT4d9gA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060121
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116774-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:manaf.pallikunhi@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rafael@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:daniel.lezcano@oss.qualcomm.com,m:gaurav.kohli@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AAD0E71040E

On 7/2/26 7:22 PM, Manaf Meethalavalappu Pallikunhi wrote:
> The Qualcomm SoC Power and Electrical Limits (SPEL) provides hardware
> based power monitoring and limiting capabilities for various power
> domains including System, SoC, CPU clusters, GPU, and various other
> subsystems.
> 
> The driver integrates with the Linux powercap framework, exposing SPEL
> capabilities through powercap sysfs interfaces.
> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> ---

[...]

> +#define TIME_WINDOW_MASK_L		GENMASK(14, 0)
> +#define TIME_WINDOW_MASK_H		GENMASK(22, 16)
> +#define TIME_WINDOW_MAX			((FIELD_MAX(TIME_WINDOW_MASK_H) << 15) | \
> +					 FIELD_MAX(TIME_WINDOW_MASK_L))

I am having difficulty correlating this mask to the register
description I have available. Are you sure what you call
TIME_WINDOW_MASK_L actually exists?

[...]

> +/* Constraint configuration */
> +static const struct spel_constraint_info constraints[] = {
> +	/* SYS domain constraints */
> +	{ 0x10, 0x70, BIT(0), SPEL_DOMAIN_SYS, POWER_LIMIT1 },
> +	{ 0x14, 0x74, BIT(1), SPEL_DOMAIN_SYS, POWER_LIMIT2 },
> +	{ 0x18, 0x78, BIT(2), SPEL_DOMAIN_SYS, POWER_LIMIT3 },
> +	{ 0x1c, 0x7c, BIT(3), SPEL_DOMAIN_SYS, POWER_LIMIT4 },
> +	/* SoC domain constraints */
> +	{ 0x00, 0x60, BIT(4), SPEL_DOMAIN_SOC, POWER_LIMIT1 },
> +	{ 0x04, 0x64, BIT(5), SPEL_DOMAIN_SOC, POWER_LIMIT2 },
> +	{ 0x08, 0x68, BIT(6), SPEL_DOMAIN_SOC, POWER_LIMIT3 },
> +	{ 0x0c, 0x6c, BIT(7), SPEL_DOMAIN_SOC, POWER_LIMIT4 },

Similarly, these offsets are difficult for me to correlate with the
register names in the constraints/0x0ef3_d000 space

[...]

> +		/*
> +		 * Enable/Disable PL based on the value:
> +		 * - If value is 0, disable the PL (clear enable bit)
> +		 * - If value is non-zero, enable the PL (set enable bit)
> +		 */
> +		FIELD_MODIFY(POWER_LIMIT_ENABLE, &reg_val, new_val ? 1 : 0);

!!new_val

Konrad

