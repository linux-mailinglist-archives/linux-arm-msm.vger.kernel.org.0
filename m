Return-Path: <linux-arm-msm+bounces-109308-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6MR8IfpMEGq5VwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109308-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 14:32:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC245B4054
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 14:32:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A378830D1F93
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 12:11:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1CCE372B2B;
	Fri, 22 May 2026 12:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jC82rPya";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ll6VfQu/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B21936A372
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 12:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779451904; cv=none; b=XIWiuTlPrnDs1ZFGH9FWoe4WOQp6BMbuhcf8Jpdus3TjZ/qGQCPO/ElXuq3EsJB6QtuufwRQNepBACUboRAToVQWUvqe6kBfg+qYTNyYvGqTU94AF5FQFM9/41SdQxNOwwCUEYYERVglEZJ/zwEiPI/kKBcqM4lKdGVgYMYiamM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779451904; c=relaxed/simple;
	bh=3+IOP/mxJIPSboya/uDHb5AZreUEK9vbHDPE0fXIMjo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WrG2wstxMPTdodqdxOeTlqKVljRMM9nttMiKjtAsk47SUdb7qIosO3ABhxzNZtsPF6VABsz0zM+HNXO2GM3RsGsVF9yMaAYwtq6bj22CyKE8/7LWpQeAZWMae9p+HqBcxSxN6H693xVTo/JLdnYsjTZQcPK0I4Whm/p1Axv0Dhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jC82rPya; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ll6VfQu/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MC4dIc1959970
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 12:11:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FTx2CPMC8PurFQGE95PsVAqqRdhK+3iRWo2FJQH+dKo=; b=jC82rPya1uOW75/c
	S3OiUI2bjZ87v4f0qfo/I/KdTkAtp+CjDHuFv/+mUm4cGlFbYSDuqQ6yMbCbBvBZ
	7zwCMgnQTt/9AMrYLgpUlPi9HJpYtoGqGGaOPIwa/Ct42FKIklkTAA1z4ZDGabpG
	EsSvNc36+nLAgA0yeimbfsm8hjqG1mwS7MS4Z1S4LpRU4zk35WJ/OTzT1RhoxgJ2
	tEgNhz6RpCkjTvwQoBC589ZMV7mmh16+IpUg19kYclYEDT26QXXQOCRBmO/k5zin
	7yR6IFd2tC4c0cgLbHsS2BeiC+x4dRAMNfeiICx3G9zcS/xN8gvDls2rK/6LOXQh
	evsUQQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eahxesdyy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 12:11:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-914b56f450aso23066885a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 05:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779451901; x=1780056701; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FTx2CPMC8PurFQGE95PsVAqqRdhK+3iRWo2FJQH+dKo=;
        b=Ll6VfQu/oNQ9JKiy+zvlQi5pIl/tpWSYPtJRzFqldOepvvFgFLFo2cF0W1yMOX8qCF
         cKwpwE1e/y84+P0MdCBLUH0EmbUbvXNfUaT7l3ED7fYTCTvaJeO0H7O4a9IBHAgLeQx0
         yisWkyC/jM6M1RyhBADYnr/BNz5WCDgEDcMTl+ZKc7NIQ1XX7CjMVXUwR/87yF5TjN6F
         HRNORXIzBBTML+ifG+dphYeeBKBPRUwVYAh4wIC5SUHECVYS922FAb45FVEA10+J7bn6
         Y07pe9GOz8i0fAcoLEUgpIzeQC30j8ryl45tX5mJMqNcCldMtg0dF58fj8+62Rk2gTr5
         0Mew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779451901; x=1780056701;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FTx2CPMC8PurFQGE95PsVAqqRdhK+3iRWo2FJQH+dKo=;
        b=OkEaXAsbVbgXQDl3hjSJII9aLzABgPBM0er7UyOP2F+x8/Yg+bz2kcQ3HJORZ+WQUa
         IR2uHfXcLJOojVGrFrJ+eEp1Ny+pS+ARpwY7TnC7FTalKw1O9GEAMmHFzMKMiiPGqtrR
         4dsds+blgONcTkTZK/paAiJsJpCePqyNjjjAyr1CLxpnj5tQ8FBYIH6Y5k91xBPxIMWz
         ZJlr+3DK6MJaTGCq4hXU08gkDLDteKVT5i0hCwfnTpkE9yUnwRZBfMF57SdtUBZkTd+W
         DzmXEid6+L6Wak2wMQ8KOPrh0WV5mxT/1xxA+JA91tqFae2q0TMCEAaQ4jPIkk7UmmQv
         u/+w==
X-Gm-Message-State: AOJu0YyUFW2uZQGRyXJJTlR408Heo+3d9M7phW7W72Tp5PGl3ZXxc6jR
	ZJxWp8sAi6RFrOZUR/V8WVhtN7lkj3WkWXxJ369Qdxz0tdWWW3iTpXv7Fj1b/E16AxuhCSfxU7s
	V+fuQktOvoDAzLf0ubrgeMcscuCgUUnzrukEczpUPTd9SuUMbiWSMZLpM3jDoBPLOk0QACOqLOv
	tr
X-Gm-Gg: Acq92OGR3M0/FAOjFBL31hnQDoGlxXISTnccDpdbw8A2EudIvtfn2wMa26df+ZPNmiI
	S+Xnzv1FRdUE15b7Irh+euiygJ+x+kkLoiV6zPvnz3TaibespUIp/eO091vZs71Zg6WggPXjLbK
	G4K8wLwdUiEJEcDUaf/QjPT/MQQztGUUnk+ty0T8LBoG93HGKCVXfL/g1PBzBZnQj37Z0PN704X
	a58FTBSHcrnzwanlQodwdMjcHsrqgpEfFYdA3lRJnirL9NEDTwo/em/i0g8x3xwipbrMQ3r9dpP
	sRbAE0cujDMj5MDUtAUq0qr1Cddtq18PZENwU3Cl5RGn6u3KFHyeEJo4YJLqjxXJ7MKAgqbQFu5
	CmXR32LR3X9sOFalvDmIgBPJgTtZ50M9UYsh9TDNxmCzQDA==
X-Received: by 2002:a05:620a:6603:b0:911:e556:c7c5 with SMTP id af79cd13be357-914b4a3db29mr334117185a.8.1779451901510;
        Fri, 22 May 2026 05:11:41 -0700 (PDT)
X-Received: by 2002:a05:620a:6603:b0:911:e556:c7c5 with SMTP id af79cd13be357-914b4a3db29mr334114085a.8.1779451901167;
        Fri, 22 May 2026 05:11:41 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc264dd50sm48019066b.4.2026.05.22.05.11.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 05:11:40 -0700 (PDT)
Message-ID: <786f5464-d151-4c49-81c3-62cbb0a148b5@oss.qualcomm.com>
Date: Fri, 22 May 2026 14:11:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: Add Eliza CQS EVK board
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260519-eliza-dts-qcs-evk-v2-0-ad7303659d24@oss.qualcomm.com>
 <20260519-eliza-dts-qcs-evk-v2-3-ad7303659d24@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260519-eliza-dts-qcs-evk-v2-3-ad7303659d24@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEyMiBTYWx0ZWRfX42gnbC3njUxV
 Rq9pQnAmLnlBP+PpQ1YT+vPzzDjL92aQt7pYf/vZR0mnyuOsqFuYX6mtnx8k2y0r89Oi3U69QEG
 vlnHA40kL03Xk6z3HtBLVpAKwSxGmRzyayKQ63mEdI5xBDygu3TWncWyAM+lKa/LtM/eBz+xO8M
 dDu+lzVHB+suymYdF1/9EoVrJPypjX3qwzTmAJBGvqyduQJE6eeTLFkIgfqw5qk96PNE8Ua5nq4
 DLt6g+FkUwGWsDTlK3jdrVl6D1oySfRfIoJYK8ZQ0xsBjh+9lXlAOo+ffMjY0Dr7S56rAmWIP+n
 YnnDttcj/4vwAygYte95i9qGzq+NhgNyslnmy1cjYvzJvkyL5rm4zQn2yC/NSxLp2EIbj01axl9
 lPP7tgkiF2hzxbxRAVeJ1y+lFiZIZEEOfo8UmUbD73dOd0rgweGnboVNa+b+T4T84yvimyiLrcU
 eOyw2QjsCAPsoIS4iaQ==
X-Proofpoint-GUID: -kJOZh4QolTDtrivJk3h0jqwUhvqSvK8
X-Proofpoint-ORIG-GUID: -kJOZh4QolTDtrivJk3h0jqwUhvqSvK8
X-Authority-Analysis: v=2.4 cv=ar2CzyZV c=1 sm=1 tr=0 ts=6a1047fe cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=rhxeU_tLo1NPM2GSdgkA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220122
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109308-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CAC245B4054
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/19/26 6:09 PM, Abel Vesa wrote:
> The Eliza CQS EVK board combines the CQ7790S-based (Eliza) SoM with the
> common Eliza EVK base board, which provides connectors for different
> peripherals.
> 
> Add a common Eliza EVK dtsi for the base board bits that can be reused
> alongside other Eliza SoM variants. Then, add the final Eliza CQS EVK dts,
> including the CQS SoM and common EVK dtsi.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile          |  1 +
>  arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts | 20 ++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/eliza-evk.dtsi    | 20 ++++++++++++++++++++
>  3 files changed, 41 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 795cee4757ab..e244e808a647 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -14,6 +14,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8094-sony-xperia-kitakami-karin_windy.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= apq8096sg-db820c.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= eliza-mtp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= glymur-crd.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk.dtb
> diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts b/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts
> new file mode 100644
> index 000000000000..d1cf08ce19d1
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts
> @@ -0,0 +1,20 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +/dts-v1/;
> +
> +#include "eliza-cqs-som.dtsi"
> +#include "eliza-evk.dtsi"
> +
> +/ {
> +	model = "Qualcomm Technologies, Inc. Eliza CQS EVK";
> +	compatible = "qcom,eliza-cqs-evk", "qcom,eliza-cqs-som", "qcom,eliza";
> +};
> +
> +&tlmm {
> +	gpio-reserved-ranges = <20 4>,   /* NFC SPI */
> +			       <111 2>,  /* WCN UART1 */
> +			       <118 1>;  /* NFC Secure I/O */

Are these going to be specific to the CQS-EVK?

Otherwise

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

