Return-Path: <linux-arm-msm+bounces-107858-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +BJWHCgLB2oLrAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107858-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 14:01:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1F354EFAB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 14:01:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A9DB30ECD4E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 11:32:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B889E47B43A;
	Fri, 15 May 2026 11:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G+4pj6cu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V3RapAfh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659A747887F
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778844748; cv=none; b=Agim2+otsotHxu6eq/QXYoybJftwE4LrYUDyjLFLrDYcPC4HlkTrMQbUEE+ipoeKejmWtO+KxVbHQVr/cVGEqs/FahIur5hpNTMCrWWWraI7wB93whr12jKYoOjMXHdvMrF2shpdYfG42ptlnM9aGtu2L73f0JkFqf95K43oYWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778844748; c=relaxed/simple;
	bh=TBxWd8dzqFRwo+1aGvB1TTlhj/ctsVbToYE8VLuyuJU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IQnHEt6lGrLu+gjPl5gIFpS6Hb9wd5SZ/VTU+Eb0NzWDkMe7m8vQUSLm7bpd9+XyVSJRx+8H+vS0brqXTa+shcqcENKDQsgM0f+fXsqp+VpbbW2Pn9Z35qACwdxEwOjZB+0FHypcQQjoNfotaIJaoZMgG+uyhwP78qXfhb+5ol0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G+4pj6cu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V3RapAfh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FAoCTg3512955
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:32:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0JAjxwIQnSuHPB4Lo64pR3CCm8tgrZFOSdk1x/qRuyI=; b=G+4pj6cukhra5JPl
	tdVjW6oqRj9L5hTGEmr5LwfgUr0SEPbAC8MpmhKdoksVgtSWOO0hXP43ycYvuQgL
	EIj0xStLA9Oj651qfY7jVREesprKx3xWV0N9pgw/Eh62PSi2AWVHYeLzCpMOYK8a
	IZfilB85rqXvxacAD6G/PWhphOBfrcBFLNCm9mPymszbyTOJ9gTSiUO0NIN+/COz
	IUFy/yH6djgNPr/W30+UoSQM8vGSgpG8zHJcFiIub1fu3UGCWgpf/FWTAtFVLFGz
	R5ohcP8xhCoZHtw9KEfZl96H56Gj5v9/y2M3s7ecWaQpcKDJFMg1j6Oa8T8mKmbl
	NJ6w/g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1vb27x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:32:26 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-514b5cc5cd2so13881981cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 04:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778844746; x=1779449546; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0JAjxwIQnSuHPB4Lo64pR3CCm8tgrZFOSdk1x/qRuyI=;
        b=V3RapAfhGtKzTMr3uGaMsUHQUUwCtMYOjS/eIO7iva2370ip73o/qillN4uvjAKx3b
         8n4ogpYwwumzjS5Jxvu8YbXLgKbDbBwjAuAvAId4YhhE1eTAeeA7ZfigSEy42KiK3+qr
         I4JAzdD9qngrIxw47F8NTFRE/tB8JTzxPDvPNgMoG5T+AW/WmBAcXgT0vBOKiK32oh65
         ckLNC+5dVxZ5kV9KDxZAkoWjSzJ9co3i8lnXP8wGfDwhhMS5qrm8TlsyXZIe/sMnWqmH
         GN5df2rNT4UGpgjJtft1nqhwI4GBIV6At+uK1z/Q8Gv8iXInaA3n8Bnmhf6Wc/hVBrS5
         2D/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778844746; x=1779449546;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0JAjxwIQnSuHPB4Lo64pR3CCm8tgrZFOSdk1x/qRuyI=;
        b=mfFx6TLnWlWQcFjYScdAU8cHakWnzL15QtTm6Bbrh2kvCvA2Gs7TT5aCbkuakYleNr
         wIgumMdVo26VFCM6UtyN29OvJ0YEXuFu4HkACI6DUD9w2D0yDYd3SidpRG2bjcNgawoY
         g/7RULOV1UPiqaLkvtfIMI4VW9x8+NLnEpdINKYKNpN3ExjWH5phVCIUkArTBS3xnBnp
         Lf/dpR3mlgXAKvHQwWSQ2Z0M7pD/fLconbUi3l+J4QKyePEHIvezO1Cd9kodBvaQalYL
         f5MAb5YEtkImxPP5w+6nGasMNoZoymyGI3lfdWWz40GSwYZ+FucHXYPU0qhI8uMW2H2C
         z8OA==
X-Gm-Message-State: AOJu0YxpzOCyQzjKC67wMvcRoI5sY+BCH9Svpf59TDoEA7uchbN1/dLa
	rMgGUxbA98tWgJHzoR2bibNYOPYGNOIAC92ualFFmGJwjZaKmujX/EVfbMmPpbMbcCy8bLXHe/R
	1Uh0KAF8CEi+l3IWx4KTMlUqfX6xxeEzrYs+tG3aCzQhl1nBd2rmVeCcKFMKGVbOFe6uE
X-Gm-Gg: Acq92OG59233SewvQdhVFJuRRMGtzPntoqRok0CH8WFqAcZuxCOCyqY9Os9fMcpFv4R
	g4fY6N9gRCZDt/P+98SkhYH9Z0mLPsZCcQ4ctVkUscb+nX0AV6Mqt29Fi98L9ZR/FQBKq6fXGCn
	ShBJhCyCsHzgTW64m+tdxazBe7LQo7iTRrWLjcfExRoNFonyWdf7Iv6WYAEu/sC2AJ2hhhGcGJ1
	jz3CpZGMBFsqpCJGTD8Y9IZ17vwnqLACN3kCWJfhQzAjgFSRAx1VrZJBRQ/ni+Kn1KHlB0+BTMh
	2PLRdvMbu19CUkelaEDYgg9wOvxJ4CdK6vG/I/shP4u4R4QbV5S0PlNjYMBwRGAtiDmKDaJ3i+a
	xh8+geLhsT9/npYZ1dFsJ/MRRcGiVUraqlqimBg0e3F8pNvrAMDx2AAVqDfd39G+Lto2Vzzy1R9
	wxvIE=
X-Received: by 2002:a05:622a:594:b0:50e:6311:7380 with SMTP id d75a77b69052e-5165a229508mr34435861cf.6.1778844745843;
        Fri, 15 May 2026 04:32:25 -0700 (PDT)
X-Received: by 2002:a05:622a:594:b0:50e:6311:7380 with SMTP id d75a77b69052e-5165a229508mr34435501cf.6.1778844745379;
        Fri, 15 May 2026 04:32:25 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68310b52675sm1922402a12.8.2026.05.15.04.32.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 04:32:24 -0700 (PDT)
Message-ID: <2ba8b020-c8b9-4c60-9fa8-545642bde1fb@oss.qualcomm.com>
Date: Fri, 15 May 2026 13:32:22 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] pinctrl: qcom: Unconditionally mark gpio as wakeup
 enable
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
References: <20260430-enable_wakeup_capable_gpios-v2-1-8c26ac795318@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260430-enable_wakeup_capable_gpios-v2-1-8c26ac795318@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExNiBTYWx0ZWRfXzWo7wD+qHfZl
 U9tqf91NXrPxiDmPLm7jBFGPlM/O7+eGxhXxxEEf8tpiZehtgo+mLiJV8QD2vMXea93AUO+HFCe
 xIB6HIMPu05YQfDxmZxNRgxkQL5mCIXGWIEERfkeYhpMrOCRxQ+Aky4rYRFs/IASdf2IanVGN6S
 1giD8a9vXG8nnrnDWdSRFnsAkY/evVgh+o1O5uOrptT4Ld7vKFUQRmpsALs3bsa7S9VOFvG1gqH
 e56veVWqsnlfsj4dVqhASYPS/+t+QmNatq3LDav3oMPuwBL7zLz1J9AXXKtYXHjpKTIGQb1HzQ4
 MPmILLEdjaiS6zn7nXgrWadvAiCByM2Hidjp4XKVFN3PQtGS9PJUG1FXxgF2EDNrRqQGRRYpFqN
 ZAmQDbC2H1NSzPfI7yypUBwllq8F76Y7VSDEl6xjz9RF6Ss1fyPMZAyt/XHYDOTuje3jhbKnEbH
 Pyn6bS9JFhjqrfgcm5w==
X-Proofpoint-GUID: Cqa1_KtffWABgZJvC6-C7X-3e612B2gl
X-Proofpoint-ORIG-GUID: Cqa1_KtffWABgZJvC6-C7X-3e612B2gl
X-Authority-Analysis: v=2.4 cv=BvqtB4X5 c=1 sm=1 tr=0 ts=6a07044a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=pFRikYD481U3yHg_XLAA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150116
X-Rspamd-Queue-Id: 0A1F354EFAB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107858-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 4/30/26 11:20 AM, Sneh Mankad wrote:
> The wakeup enable bit needs to be set irrespective of the SoC using PDC or
> MPM as wakeup capable irqchip to allow the GPIO interrupts to be forwarded
> to parent irqchip.
> 
> This is set only for PDC irqchip using additional check skip_wake_irqs
> making it impossible for MPM irqchip to detect the GPIO interrupt during
> SoC low power mode since for MPM irqchip the skip_wake_irqs is always
> false.
> 
> Remove skip_wake_irqs condition when setting wakeup enable bit to allow
> forwarding GPIO interrupts for SoCs using MPM irqchip too.
> 
> Fixes: 76b446f5b86e ("pinctrl: qcom: handle intr_target_reg wakeup_present/enable bits")
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> Reviewed-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---
> Changes in v2:
> - Modified comment to specify MPM HW as well.

$ b4 diff 20260430-enable_wakeup_capable_gpios-v2-1-8c26ac795318@oss.qualcomm.com

[...]


      ## drivers/pinctrl/qcom/pinctrl-msm.c ##
     @@ drivers/pinctrl/qcom/pinctrl-msm.c: static int msm_gpio_irq_reqres(struct irq_data *d)
    +   /*
    +    * If the wakeup_enable bit is present and marked as available for the
    +    * requested GPIO, it should be enabled when the GPIO is marked as
    +-   * wake irq in order to allow the interrupt event to be transfered to
    +-   * the PDC HW.
    ++   * wake irq in order to allow the interrupt event to be transferred to
    ++   * the PDC/MPM HW.
         * While the name implies only the wakeup event, it's also required for
         * the interrupt event.
         */

This is not what I asked for.

Instead, please focus on explaining what skip_wake_irqs is, perhaps under
what conditions it is set, and how that differs for PDC vs MPM

Konrad

