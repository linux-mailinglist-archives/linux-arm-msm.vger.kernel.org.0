Return-Path: <linux-arm-msm+bounces-111645-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VDD/FtMyJmppTQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111645-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 05:11:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BC110652656
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 05:11:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="IxkY/Umt";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=eum3MkyP;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111645-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111645-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B752A3002E5D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 03:11:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C60F233C513;
	Mon,  8 Jun 2026 03:11:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F2D343891
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 03:11:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780888271; cv=none; b=CZK5khOuk32DfFsSZ7rge1+3Pk7rgkrUrQyCCmj64s50kPHFyMb+5IigjGFi2UQbsoftvgsgRQZ1wQqjqU3PUgbfNwCIexu1tH4Qh7T7F2jboAopyrFYtw8ZznYr2hlDD0KihPAa9Z96ryVKQtwJVKkredSUOYyBybBP0iLStvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780888271; c=relaxed/simple;
	bh=Qg9r3duy3RzRwGyoJsHsGhEuW5HyFAodhxmT64u5k3s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NA7pd731TyIx7RcYDdH+Xq46olNGNY+cqvd2eYwc2VHhEtN6JHyCKJdFJSj9MXOI5sLdiPBKXC9we4In6aYMKAUt100cHoGy92iQtduftUq5V9SsUglu5ionHD+/KTYB3BrJtVrcBOuiiI/rW74oRw3RqqSU0BiboCxxhHRFP7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IxkY/Umt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eum3MkyP; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580Exbh1958173
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 03:11:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GKPIRoTdsu8PRW1CecrhqS4AjNkhswIihoIHcQ2sb7I=; b=IxkY/Umt7J+WrfYm
	hB5toGC0d0D5FAC3xiE69IhpbHNH/HPoL4s2qVdyb8mEcry7joI+ynAR6zYm+y8k
	kdYeU0ZRYMGuwxMWZlIEzAdjh4KoROS1BusUZpgFAN/q4IuxNwg+O7ySFhXByGbf
	ehXMzpnqGjAAAchxjYetSQhXW2dJ588mtLifpOHJxYWjBQuoNrCJUPuOBPC7oPnv
	n8rCMrCLErCnpsE6aN62i0LiSUgJhxYQPpf3QXQE4RQ9OZCw1qTa+D2RrPcgpAHd
	Rk595ualGa8OPPztLGNSXTAFxIaW1+o6rRMTg97pZdwXlDeyYoVN7ueVam82yC1u
	A+NNjg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embx6dfc6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 03:11:07 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-59ed1788158so2211650e0c.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 20:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780888266; x=1781493066; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GKPIRoTdsu8PRW1CecrhqS4AjNkhswIihoIHcQ2sb7I=;
        b=eum3MkyPnus+sIa00/QR3XHwiwQYy4nNYV0TEo3zZmGVC7YB3v3rYzuUWrpHND/+C5
         5bfGWoB7hMegvcjPzAUZOyRK7PdDvfy3Yl3b37yMDQTuqLW1Fd0H2g4x8RmK2/UgTyoi
         sjEgLAxmKqv+WE+etsxsMEuYzy1Fj5FJ6Iu1XgQS4p8hckCyIA6qRwtmTtB4nM2EXivu
         YcGeu7D2mgeurS0LPjYdEY2P/cGXJelfrzCc+AgteDx8vqEt1W4SsGSsuRX08fc2rmP8
         TuONufad4BnTMf0EHa5515mgKbhZCumZnffxaVvVZsDjXpKcVKUv7KGzljKh2s3Bc5go
         3iaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780888266; x=1781493066;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GKPIRoTdsu8PRW1CecrhqS4AjNkhswIihoIHcQ2sb7I=;
        b=Onp9I8na/CONXOP24rqcqF5vdET9oQl2H+aLDb2oYeJanYVCrvgDSSChRrizzfUjh8
         wBK3JBMSJiUNsvwfP6M3F8DAbWYl2cQZKWI1l1V3Oa71ymfPds6DId1rs8JR+3EDsIhB
         hiqxwFaVwosPuOwyxEZhwTy+rbHvkrAB9BZAb+twvaMms5cioYhiRbfsQGktZxO2ME2i
         aKxSXdhe4spag1B3FHHDKGmuZT9/V8N4qdn21GoCAYlYehDoCofHgJkVT/IH2Q1WOXB7
         UwPGfRVqZWxvccef4CYouXmSte9NpZDvSHPne7JpyIDHU0YFGNMXt400RUWRF/4VIu4c
         zeLg==
X-Forwarded-Encrypted: i=1; AFNElJ+P2iGbO7iXLJ2Jdo0BMTOnREudfts/zITO9CPim3/ec3FDGOq4APUzLypTBH7yHes2QhCdfn0ONbQSTZxd@vger.kernel.org
X-Gm-Message-State: AOJu0Yyaf5sTomoXMgNXN54US2vCkoTXSYqrxQDujUOJwLc/HhRaCz3J
	wmqi87JAkBrL0DxVv2+bgYlXYuaiTWsfTOyynkDy5OEI2XxdKa76UIFWIy0Uw2m1wqEgHmt3Vpx
	XhHC8hu3eP/OgMnrwRoEi86hR4HJJzagzBHfwANoSdysbBSaMgEIJxdsD+cKkBekA0ZGN
X-Gm-Gg: Acq92OG9tUE12HxUJR7iCAgUkyAhTlcZRXQo4RLN2Mf+k6p710ZAjab/heWMbuuTA9A
	vQIq7SxifAOw48A0KQUV0qUe0PcmAV8Qu4dXYl+JVuS1QJApvulqwe+vywLiFCe2ga1JHu4IeEo
	XcURhWTG94W2y4/YUi5D0HHI9eroFXGV21ZKwvyKJcGcmqaEiin+c5WmOkFGKj82nybIhwE4Xw6
	mzuZkfNZ8GeUVDyxol7WgFR87qjI7/4y+FDyPL1b2WB+pUDLr6zXMVfr1D6jRKHNVRDPWUEiNnn
	SGqWwYqYS9RVTCswG6X6SdIAB2nK4D8+QpSyDc6kqjn46aoiFNqHmp3uG6dJICZuFqUZ+2kKAT4
	bgdAArTsWKtFsuPfP2j8TtK3RcSH7cgHcSezx/wgdcuCCm9Hes9rDzcy+YFJcgw6eBjKc9QSHQP
	vYiEfRU0WvGTvfIQxNoR08mzsLUg6ALJ9Zr3I2GyD4g8mmmA==
X-Received: by 2002:a05:6102:8097:b0:605:ead:8f38 with SMTP id ada2fe7eead31-6ff005a01f4mr6434758137.29.1780888266429;
        Sun, 07 Jun 2026 20:11:06 -0700 (PDT)
X-Received: by 2002:a05:6102:8097:b0:605:ead:8f38 with SMTP id ada2fe7eead31-6ff005a01f4mr6434739137.29.1780888265923;
        Sun, 07 Jun 2026 20:11:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b990438sm3424243e87.67.2026.06.07.20.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 20:11:04 -0700 (PDT)
Date: Mon, 8 Jun 2026 06:11:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Herman van Hazendonk <github.com@herrie.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        devicetree@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh@kernel.org>, Thomas Gleixner <tglx@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: interrupt-controller: qcom: add
 msm8660-mpm
Message-ID: <rnbfyflbigjdio3zfvbbrivdbojklnzwykzsg6du7kxx6fo4vp@zboxipgozsv7>
References: <cover.1780148149.git.github.com@herrie.org>
 <d64594cea7a2ebdff8fc0b1d7b0ac1fd5124d2e2.1780148149.git.github.com@herrie.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d64594cea7a2ebdff8fc0b1d7b0ac1fd5124d2e2.1780148149.git.github.com@herrie.org>
X-Authority-Analysis: v=2.4 cv=cvmrVV4i c=1 sm=1 tr=0 ts=6a2632cb cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=gEfo2CItAAAA:8
 a=cTwmTnRGAAAA:8 a=0dIclahs-Kuf6WvM9VoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22 a=sptkURWiP4Gy88Gu7hUp:22 a=GUWCSGlMWfG-xDt5EnV5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDAyNSBTYWx0ZWRfX9O7whYC2ws1p
 nvJsbzlbP/7oB30OeN4PrkhB/2H/IuskrZlIlHHkAsv4uAQLPG3wxp7agduLkrAdmImB0iph26B
 5BYqVEt7002iWrbdfHKfRI4/KNPMBhlEDyAQIA5gXpzg6LefABFz3KP5KgoAiFRudQ0wqxKEmr9
 E9mEwm09kOLDFkToFgvWJV75Jd3dm62+fHPWA+zOAMQ/iptg7r3wY1kjh9locS51flAI7UtQRHI
 B7WdmqbjnrT1vAaGl/9/yflmOMkDQW3dr2KUwThNZesQ7BRCgl0L543mFOhCpr5jT8/4PHHMei3
 0rY0sFz0DGHJM65uJcwBjpGStBowcTfa2sjWW549lksSuWtGCmBdHeVZgleQhvvHsddcP/GQZeh
 HZZGZGbkG1zESQ+V+I9V8MiY3X45lJ9grDjZdCOwIfGWuNxlcQSRHl60HcquFMergJ37zTK1bc7
 X4BlEL67yN3daJnkOcg==
X-Proofpoint-GUID: FZdcQtq58xMVEyiLdaTpez-xm3_SYmtl
X-Proofpoint-ORIG-GUID: FZdcQtq58xMVEyiLdaTpez-xm3_SYmtl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080025
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111645-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,devicetree.org:url,herrie.org:email];
	FORGED_RECIPIENTS(0.00)[m:github.com@herrie.org,m:andersson@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:konradybcio@kernel.org,m:krzk+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:robh@kernel.org,m:tglx@kernel.org,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BC110652656

On Sat, May 30, 2026 at 04:00:22PM +0200, Herman van Hazendonk wrote:
> Add the binding for the Modem Power Manager (MPM) interrupt
> controller on the MSM8x60 family (MSM8260/MSM8660/APQ8060). The MPM
> is a small wake-capable interrupt aggregator that lets the SoC stay
> in low-power states while a small set of GIC SPIs continues to be
> monitored and can wake the system on an edge.
> 
> The binding describes its register region (in the RPM syscon), the
> GIC SPI it raises on a wake event, the GIC mailbox it shares with
> the RPM, and the per-pin wake-source mapping table.
> 
> Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
> ---
>  .../qcom,msm8660-mpm.yaml                     | 122 ++++++++++++++++++
>  1 file changed, 122 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/qcom,msm8660-mpm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,msm8660-mpm.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,msm8660-mpm.yaml
> new file mode 100644
> index 000000000000..72f9c2be03b2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,msm8660-mpm.yaml
> @@ -0,0 +1,122 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/qcom,msm8660-mpm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm MSM8x60 MPM wakeup interrupt controller
> +
> +maintainers:
> +  - Herman van Hazendonk <github.com@herrie.org>
> +
> +description: |
> +  The MSM Power Manager (MPM) on the MSM8x60 family (MSM8260/MSM8660/
> +  APQ8060) is an always-on hardware block that keeps a set of wake
> +  interrupts alive while the application processor is powered down.
> +  On MSM8x60 the vMPM registers live INSIDE the RPM control block
> +  (request regs at RPM_BASE + 0x9d8, status at RPM_BASE + 0xdf8), with
> +  notification of new wake-source configuration delivered via the
> +  qcom-apcs-ipc mailbox (writing GCC + 0x008 bit 1).
> +
> +  This binding is MSM8x60-specific. Newer Qualcomm SoCs (sm6375, etc.)
> +  use the qcom,mpm binding which assumes a dedicated MPM SRAM region
> +  and an IPCC mailbox — neither holds on MSM8x60. The driver lives at
> +  drivers/irqchip/irq-msm8660-mpm.c.
> +
> +allOf:
> +  - $ref: /schemas/interrupt-controller.yaml#
> +
> +properties:
> +  compatible:
> +    const: qcom,msm8660-mpm
> +
> +  interrupts:
> +    maxItems: 1
> +    description:
> +      IPC IRQ raised by MPM when one of the enabled wake sources fires.
> +      On MSM8x60 this is wired to GIC SPI 2.
> +
> +  qcom,rpm-syscon:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to the RPM control block exposed as a syscon. The vMPM
> +      registers are accessed at offsets within this block.
> +
> +  qcom,mpm-offset:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      Offset of the vMPM register window within the RPM syscon. On
> +      MSM8x60 this is 0x9d8. Status registers are at this offset + 0x420
> +      (== 0xdf8 from RPM base).
> +
> +  mboxes:
> +    maxItems: 1
> +    description:
> +      Mailbox channel used to notify MPM that the vMPM request
> +      registers have been updated. On MSM8x60 this is the
> +      qcom-apcs-ipc mailbox channel 1 (writes GCC + 0x008 bit 1).
> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    const: 2
> +    description:
> +      First cell is the MPM pin number / parent GIC SPI; second cell
> +      is the trigger type.
> +
> +  qcom,mpm-pin-count:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Total number of MPM pins exposed.
> +
> +  qcom,mpm-pin-map:
> +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> +    items:
> +      items:
> +        - description: MPM pin number
> +        - description: GIC SPI number this pin maps to
> +    description: |
> +      List of (MPM-pin, GIC-SPI) tuples for wake sources that have a
> +      corresponding GIC IRQ. Consumers route their interrupts through
> +      the MPM hierarchical irqdomain to take advantage of these
> +      mappings.
> +
> +      Raw wake pins like SDC3/4 DATx (pins 21-24) are NOT listed
> +      here — they have no GIC SPI mapping and are accessed through
> +      the msm8660_mpm_set_pin_wake() / msm8660_mpm_enable_pin() C API
> +      by consumer drivers.
> +
> +required:
> +  - compatible
> +  - interrupts
> +  - qcom,rpm-syscon
> +  - qcom,mpm-offset
> +  - mboxes
> +  - interrupt-controller
> +  - '#interrupt-cells'
> +  - qcom,mpm-pin-count
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    soc {
> +        #address-cells = <1>;
> +        #size-cells = <1>;

No need to, drop the soc and cells.

> +
> +        msm8660_mpm: interrupt-controller {

Drop the label.

> +            compatible = "qcom,msm8660-mpm";
> +            qcom,rpm-syscon = <&rpm>;

Can we define it under the RPM device node? Then you won't need to pass
rpm like this.

> +            qcom,mpm-offset = <0x9d8>;

I assume it doesn't change on a chip. Use compatible to identify the
offset.


But then it becomes compatible with the qcom,mpm.yaml schema. Just add
qcom,msm8660-mpm to that file.

> +            interrupts = <GIC_SPI 2 IRQ_TYPE_EDGE_RISING>;
> +            mboxes = <&gcc_ipc 1>;
> +            interrupt-controller;
> +            #interrupt-cells = <2>;
> +            interrupt-parent = <&intc>;
> +            qcom,mpm-pin-count = <64>;
> +            qcom,mpm-pin-map = <25 100>,
> +                               <26 50>,
> +                               <27 79>;
> +        };
> +    };
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

