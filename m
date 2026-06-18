Return-Path: <linux-arm-msm+bounces-113699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id quyDGSqqM2pSEwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 10:19:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1504169E65B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 10:19:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=C2iwSgfs;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bDJhpieU;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113699-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113699-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7FFB73029720
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 08:19:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A98F399357;
	Thu, 18 Jun 2026 08:19:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD226394471
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 08:19:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781770768; cv=none; b=KaVNds5N3OG4ARdmzUrIbHcasPo/jkIF61RG5A7ShcAC/OKlQ17B7PWNNHFOC8apWd7u87+Xr4k4Hp31Wqo0bdjULjv6YKIZnpBUKC2sgvrDgrsSZo5A2U5yeMQJqV76R7ju2Yaobw/tcx+hNUTr+8ZNmF2Ed7T+qZeNBlZ1lAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781770768; c=relaxed/simple;
	bh=casli13flH9PnvbWb/Fb1QuAj9WYWOB35EA5rARxoBU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QC6/wQYDVFW2ouucV+JhTqLhc3AgcFSyu9N+VrgLJZhkgI0ZpDC7n+0YKLBDlhFAKR5lDDxjG25NK4XncVzcvv6w9pkH7ijWsr6t7ftPlYv2Lguyod7hhI22rCRPNCcImmzM5y9WOsJj1ZZ+/jsnhluUs9kkMntBU9xF8LK/Csc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C2iwSgfs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bDJhpieU; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65I8Dd7J619961
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 08:19:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eTNkagoIOzwO6/2hJOr3P2E7MmuHJTIWk3HLRdjPF3U=; b=C2iwSgfsUZn7IBYK
	mpdA+1mkJtjaVHDcMqIF9GEV9xHO6C82ocYz06yq1d+dnLMRAObd8XGCxMwSc4aF
	9XtJGMTD457LCmTmTEJpm9fO932BPk1oJMCysja7SbXfScbzu2sTeQh7CckgsRxQ
	DvCMplfgNw7K0Pb4bHnwEjtgcW7WOjhMAb9aqujdOk3DD03j6N5lmQrrxiqqLhbm
	q+ojNgXy+Q8YB/1vrancbYMC34x8K8gS8bX69CeCMcQLkVAJusZbdOqsqKhAWJCy
	W3SlB4MFGs+Iz2+gCZoxej630BR7xPzbgnVaEur36RqmyW6AaO5AuMqCIzkrQxbi
	cGxDNA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev199jdhr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 08:19:24 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-915827fb1a3so14562085a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 01:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781770764; x=1782375564; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eTNkagoIOzwO6/2hJOr3P2E7MmuHJTIWk3HLRdjPF3U=;
        b=bDJhpieUmyZfqVn7YlIaberwO1cMieX/tsme6A19Zbs4enSsuvxBfBVUBbFeO4irU6
         w4dtksHod5rMj7j+G/jncxikTZgpDFFf3tuO6ldrIwQolWhsk2Nm4yOC8KoITTX1wp7Z
         fx5iyHPWLfPsxBi7q25KB3O8c0OM/EIN8JBHJRqA1zlRED5klS5TZ5z6/53Dm94mipal
         A+UGihYLU28y3kTI90FrbKZZ5AgTK5tRI793XfFTyL5ufw5mzG1RuWB6lgWsmc5F7Gl7
         sJV9socv+NsGVPn5qTYAk2N3a2kD6CiVeQ5B+Ta+1s+RPZaHf37iOAriuFyHZcd5OE6/
         +BSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781770764; x=1782375564;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eTNkagoIOzwO6/2hJOr3P2E7MmuHJTIWk3HLRdjPF3U=;
        b=aIFQSBNRLfi28jvRCEy+Ui58YKSP+yacc1hqBMjG+M5HXx54WcAvLB58iCd/t8cA3s
         AqULx0FNzsNeJ2F+humZpTifSBl0x6IZPTzNJBcQ/42JsX9sichYIdSruco26GlB1AIc
         aOVwJxAoQ5TvV+AVPbaojg/IcV94hpBI0ZV848nJZm7sTHc5q78qrATG8BqcYvjLpCY+
         ybovGturVc/NvMa7EjXRg/bqItHLe7iExSUyOd/nk4HrQy1+PXF5WXQez1k6DzGWX7yJ
         SyWRCInBSWzu83OzufuxJSxcd0wmDXtEn0txCBn34Fyp9UL4bHBU+p3+juYoqbasXGkj
         WBpg==
X-Gm-Message-State: AOJu0YxiaWfV/EJk1VL2cR1BIrEWf6Y+VsrV5XqCcgYV+Gnxe5+hPQCa
	Mpr97FURVnnf9IIwXa17HV+zF5Aq+TVRCfF4ABboVw3m6Cr6vxAaPGFuyTwHCb9YK5dV3mvzF/7
	4pftsz9nMslislv9ytTJ9mtEZmSv/8gDaBqrBf1X5Vclttw4e2zbnI79bWGwFmpR7unGz
X-Gm-Gg: Acq92OHagenITrSHnGXTf46qdRREA/5rb/0g5WBQpIY1EnpGwwhtM2LuqjJcWUG3QaE
	q8OEbx4QnQi4pL8UKMrCua2STWHbz+dj3n3FYU7uZyENXySa3md1jYrRnavTgW+zdLkEWUVmdBm
	sXJe+lQhoxeegqlQ3GUMzuH3LtX/J6vMGZe4B1XNTxzQ8KNMn/QjZ75rzK7Zg2a4yJL3EMGDH7B
	VNNRbNpGyKE+ira32sOFA0brX9TCjId6yr8pId3dikxw5SXEkkQldv7Qz7/UnhHRS5ipk8q9LU7
	uFg/I1XSYm6yz+kagBje1+TZNZNtvIaLO+u8wgAZxFhsiaIQ1ngq8VnzCMyFA3Jfj8YNoKnOYjA
	jSuHsld1vo3qNUXr81c/4h5/R1PQXdoDnIAo=
X-Received: by 2002:a05:620a:6c0d:b0:915:4ca0:1210 with SMTP id af79cd13be357-91f2a9c581dmr253479085a.3.1781770763879;
        Thu, 18 Jun 2026 01:19:23 -0700 (PDT)
X-Received: by 2002:a05:620a:6c0d:b0:915:4ca0:1210 with SMTP id af79cd13be357-91f2a9c581dmr253477185a.3.1781770763432;
        Thu, 18 Jun 2026 01:19:23 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb5318d8dsm875237766b.26.2026.06.18.01.19.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 01:19:22 -0700 (PDT)
Message-ID: <c90884fd-a354-45f3-bbfa-77c58d8d3b1b@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 10:19:20 +0200
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
X-Proofpoint-ORIG-GUID: 3RFveyWxW2ogb16FBnh8c-WfJSREE-al
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA3NSBTYWx0ZWRfX4xmhYRuMC3fh
 T2JJUrE+DJhNy3oOhxuMZQiZ1ehjrxfSGtUjI1vexn0JNSjKUai7ETIp6tRt9WdEnKzcAdQUN9/
 j0dbBsy1G4f9hvmSCy3/G0G+sLKKzNAnpGQEp6UP39Ex5b+J8a577oJ5f14B6IMUI1mxPaL2hzE
 qrZ2RjDUcP3EooGO6ozc/67JmJ6rKDM2iCGVno2mYgjDFjVfcWIa16CIAR3Sh6bzoc5i+AjOxKZ
 r8f+CCy0Z7KBnXFGe3QWGe0FxebcAwVXiZjahoLF5Eonc5P/S2IV57le/BJPoOsp1Ei7sxn1Fzq
 gizQLxvlZemZz2IYW0q7R8kqrfdmEPMo073CmO0zEfWak92nW7VTgo8VDvXTNPwfVThuqz0DjnP
 eV8l3pqF5dCUFXd2ErIdnxGwKvUlPhBWBB8hU/CulJ3Wq9S13Q0BhGoAzeHgbnvaeiWDP7rzE76
 C8GWt43qeNqUalecZUQ==
X-Proofpoint-GUID: 3RFveyWxW2ogb16FBnh8c-WfJSREE-al
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA3NSBTYWx0ZWRfX52FDd5E/uZIT
 DZytF5fz8We6h+djkP1AnBvNReHkzJgNZpZrtl9TRYNyseqNrh5oGZZUOwQwXBOxac1kZawZPFT
 dTPheSXbRpxew4SEIiAQP5B37FtJxdw=
X-Authority-Analysis: v=2.4 cv=U42iy+ru c=1 sm=1 tr=0 ts=6a33aa0c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ZhBa3tV6RTI7cPQeaSoA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606180075
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113699-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: 1504169E65B

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

> +static void pdc_clear_gpio_cfg(int pin_out)
> +{
> +	unsigned long gpio_sts;
> +
> +	if (pdc->version < PDC_VERSION_3_0)
> +		return;
> +
> +	gpio_sts = pdc_reg_read(pdc->regs->irq_cfg_reg, pin_out);
> +	__clear_bit(pdc->cfg_fields->gpio_irq_sts, &gpio_sts);
> +	pdc_reg_write(pdc->regs->irq_cfg_reg, pin_out, gpio_sts);
> +}
> +
> +static void pdc_unmask_gpio_cfg(int pin_out, bool unmask)
> +{
> +	unsigned long gpio_mask;
> +
> +	if (pdc->version < PDC_VERSION_3_0)
> +		return;

These version checks should be unnecessary now, given the function pointer
is only assigned for hamoa

Konrad

