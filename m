Return-Path: <linux-arm-msm+bounces-111557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JDQaOFdHJWpwFwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 12:26:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD1664FA92
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 12:26:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=nigugi1D;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jHWSBPcy;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111557-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111557-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 01D0B305B13E
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jun 2026 10:17:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1387C2EC54A;
	Sun,  7 Jun 2026 10:17:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E092E7179
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Jun 2026 10:17:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780827471; cv=none; b=ilchIkJ55gdgtZFcfhkujd6+Gvl0h5q0AeQAfZfmV3Mk5v6sI6FKQDFZUqDDDMA7Ne8xMl6mxmYftm/wkofSPtCQ+/CajbYxU8i8RQ1EMTFNQONz/I189+1th+lhYwQKx2QUqtTSXibC3lGcYVoX5ErzHIIuTu+J8tY7cw0Ebmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780827471; c=relaxed/simple;
	bh=idf868Vsbnyyotx0jfNiPXsybJ5w2gQ2keSGP20nPmE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S+DxiSvavk8SfXaUI5pRl9S6kjQ+eQ3mZBa0mG8DgsbiPU+wfQ/csl6r/MQEgO+TQZhdTpONR2vWWfdQck9nvJNZoEUqFl9hzfhS5ZvhGFeyF/8tUJy/vbbr4+X/EV3k96vC303yM3Olm3mcKdygGhyYfT6ukd6T5YEpjjCh+8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nigugi1D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jHWSBPcy; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6577A33Y4166077
	for <linux-arm-msm@vger.kernel.org>; Sun, 7 Jun 2026 10:17:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=M4FwfUZ9jESPMwli0wZo2L5a
	U9CNfaUCjDk/3XMqWL0=; b=nigugi1Dt5LzZTWMC73FUxJV06Ogbbaq1U2yR/C5
	DPFS30E5GhCYhDjYNBviOdHrcYccTJQWgvycC/HEyXGNVsqgESd5PqZn11JVd++T
	sYkHpwa4n0fHTtW+JHJBe+nKHp51LK9bhMebdrmCjg495VGqWpHo9ME0fWFa3yq6
	LxSC45J+z2rgyZA1BNNvQH58wWg+sQVR9oJPtwC9PdfEidCA6z+mP6dV5YNLYd4j
	xw7RueetEPuUty5K+40j+39Y8bOym0vEP45JIAFH4pQXbcig7gsUz5fraGxeibbq
	DaZlRGU+qfALXyKouvg6dgg1kta9OfN8qb5LDH+4n2+gJw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embmrbksv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 10:17:48 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-59ec77e0184so2904815e0c.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 03:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780827468; x=1781432268; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M4FwfUZ9jESPMwli0wZo2L5aU9CNfaUCjDk/3XMqWL0=;
        b=jHWSBPcydhs0Y6ENmiWmw2JJMFeXEDJn0hWGgJLQBLNqD8KwARLsjnuha2fI0JeUQ0
         FfDHUkjNSrD4VJSeBEyjWNkeFJ7yoIRDdNHhhvdtbBgwi6jMmhKBDUXK1ERHzfRLUpCd
         3yB3emAWteZKMLjM8UToENLzA1UP29q4QTqB0ms00CLwT0nFmSK2i2ln8IonerVoFPUA
         KgUhJdQDcMlEkJrWF3UtnYnTAwkD16SP5biWt2Ua+5l1qx+p1DoLNmWf7IAOsUmS7QMi
         EFRJ4Lh2ORCY0FqsDP7qKlQUBgNc5fRg2FiAAOa4d6WaK4nZKRe0U7E3GXERnONvDcdW
         5gmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780827468; x=1781432268;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M4FwfUZ9jESPMwli0wZo2L5aU9CNfaUCjDk/3XMqWL0=;
        b=rsPk0voNlaNBcsNAhSZb0mJHno9EsJV4CpNfhZdpuE+oD7fpNtQhsrs3gekpM5C/0e
         KUxxegVFzW2h8pmdfeGMVs5hbKSBvV6fmuO6ba+cAgHkD9iLBnukHJJWDo+JMYj3fHRr
         xSK4adW0QbbpxEMcUFRDHpsWNZe//OE+zSyCkZFNYWYUJmThZyM5bl0XDNoCeLRzXbXG
         aggxxM4h3pd8wdJYd265ma/0UbQrwxD4NnnQ22oX4BBV0ABT005OP/kaIgmYhSzPOb1A
         UJcrMWRzcLfmIyliF5+of2QWRu/Pqhz7gYFWxU/+vfiJ3PRh43xqNEwC+XSmXZ256QaR
         ezgg==
X-Forwarded-Encrypted: i=1; AFNElJ8ScOHRxVAlfjdG2P4wA1bR8dVFLbNBmGXNYqsRFGDfelixVCQVSUqBiifJOXK7SSFX3EY7ZU40fP6OTndc@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo0x/ha+ulrtO4gIRSGUtsAeuvE6X0rKbje1ge/9fmTg3PymWu
	vfar1FekaO+tbLRdQUk4fX/BrdGp9Xv+9NAef0MrWX4A/xZpXXhZR9WBTdnDMIrUv3wyiCuDAqF
	/lq51pI6FmZ943l41Kw6rrYgSLcfzmHm9fFswOjNyQ5liqi+alx9bQn/NC/17CM4+lLzn
X-Gm-Gg: Acq92OF1DJgZp8dmrCCkgL7ZtabJWzQayXiSBLWxPtUHQYRrjnOzEDxuIjKCwZ4RPk4
	R7nLKKKS1wBk1SKMD97StBzbmsTOFpcQS0l1DTbwHz7za6fM6PdovY+102gjLwxKuDl+JHYDcGx
	XSUEIhm+8NXOAs4xr9hZ/uBjcZn2/smQJYFTM3BKzt45qomV9LvstxSV5cwCHFORwxnPy193G0+
	kQzCMQOkBoCPY8fRDPwIJTXULPJtpn3gs4m1K8iZMf3ohLv7qpN3Pn60EzY1j1FzAf4FTamzZQa
	PsPhapmWpLwS7WQ4kWcGuLazghlwQyhI68gM36MDmfQnRxAXsgASInVFS/HWPlvPrWGZKB7kbY/
	ceQrZP3VzotQMNq26PCgrlwgWZ75zpWdtsj53bikTaUpGSK3QksSV2r29shK75sxvhT/BQValS5
	2FuIH66NjG7921mnHlekY1A/fYjtoXSnMNR4pgKdFo8zxhpg==
X-Received: by 2002:a05:6102:3594:b0:639:43f5:1fdc with SMTP id ada2fe7eead31-6ff018e8796mr4345829137.26.1780827467951;
        Sun, 07 Jun 2026 03:17:47 -0700 (PDT)
X-Received: by 2002:a05:6102:3594:b0:639:43f5:1fdc with SMTP id ada2fe7eead31-6ff018e8796mr4345825137.26.1780827467554;
        Sun, 07 Jun 2026 03:17:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b99c2b9sm2984082e87.80.2026.06.07.03.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 03:17:46 -0700 (PDT)
Date: Sun, 7 Jun 2026 13:17:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ajit Singh <blfizzyy@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: Add Vicharak Axon Mini
Message-ID: <ny26r5a2npafcryx4z2xoyzkdbp6r5vbdoc6asyfprw5q4hgzh@ukbc7kfpzsle>
References: <20260519125655.23796-1-blfizzyy@gmail.com>
 <20260519125655.23796-4-blfizzyy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519125655.23796-4-blfizzyy@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDEwMCBTYWx0ZWRfXwgzkgky0JVax
 Cw78IsWxgupftbWOjcTgSQ4RQFDaOCkg7l8/Luitgpq+oFrOZ5KBHptOawOu9zZAhexw9Fi4R6V
 E0ZUFCjZPSlBJEHhfDwGJNbDI9wAbl3Fzf2Ar7xqFJSDxfEJtVwtxXpRAsn3Heb4k62JkSkfl96
 quhkh1Qd1asG39cYpIfdmNMb8QfdlndNI4FWvXKraCbOxVgaPeiersm7a6TaLA6DPjf8jKdC7O2
 zG3faHapuXRd8Sg1Tr8RRDFdlxuBQXFmlFIGG/1RtXTS49AgMcYdYp+jsEaf1r2G3oL+PFezhMN
 ANZffD7yWdXx3eCJQh3rwiDhcAwFgPHP4cRkV5oCMQ6gwI/1aHjLJuRZ0XkohfZnE0Kd6he/KcX
 LoOderbQWyHsN9IcqQCEaXhDAHKB7wk24UHDht4bq2yOanubjUW6QAfBvxhm90vAX+nDTXVZy/y
 niqh15grRBKcfCBxqAg==
X-Authority-Analysis: v=2.4 cv=B5eJFutM c=1 sm=1 tr=0 ts=6a25454c cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=pGLkceISAAAA:8
 a=JL1AdETER_kwsCMOzjcA:9 a=CjuIK1q_8ugA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: nowBELTEheeDB33m85NJmxvYJiYF1ap3
X-Proofpoint-ORIG-GUID: nowBELTEheeDB33m85NJmxvYJiYF1ap3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070100
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111557-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS(0.00)[m:blfizzyy@gmail.com,m:andersson@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6DD1664FA92

On Tue, May 19, 2026 at 06:26:55PM +0530, Ajit Singh wrote:
> Add DTS for the Vicharak Axon Mini board based on the Qualcomm
> QCS6490 SoC.
> 
> This adds debug UART, eMMC, UFS, SDIO WLAN, USB 2.0 host, PCIe
> support along with regulators.
> 
> Signed-off-by: Ajit Singh <blfizzyy@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |    1 +
>  .../dts/qcom/qcs6490-vicharak-axon-mini.dts   | 1025 +++++++++++++++++
>  2 files changed, 1026 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-vicharak-axon-mini.dts
> 
> +
> +&pcie0_clkreq_n {
> +	bias-pull-up;
> +	drive-strength = <2>;
> +};

Could you please add a /* pinctrl */ comment at the end of the file and
group all pinctrl-related changes after it?

> +
> +
> +&uart5 {
> +	status = "okay";
> +};
> +
> +&ufs_mem_hc {
> +	/delete-property/ qcom,ice;

This should be explained in the commit message.

> +
> +	reset-gpios = <&tlmm 175 GPIO_ACTIVE_LOW>;
> +	vcc-supply = <&vreg_l7b_2p96>;
> +	vcc-max-microamp = <800000>;
> +	vccq-supply = <&vreg_l9b_1p2>;
> +	vccq-max-microamp = <900000>;
> +	vccq2-supply = <&vreg_l9b_1p2>;
> +	vccq2-max-microamp = <900000>;
> +
> +	status = "okay";
> +};
> +
> +&usb_2 {
> +	dr_mode = "host";

Is it actually host-only?

> +
> +	status = "okay";
> +};
> +

-- 
With best wishes
Dmitry

