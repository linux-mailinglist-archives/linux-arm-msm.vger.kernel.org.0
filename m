Return-Path: <linux-arm-msm+bounces-107748-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MHW2NYHoBmpKowIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107748-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 11:33:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D4B54C7BA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 11:33:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 57CC6309EE8D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 09:11:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05A0B42B72A;
	Fri, 15 May 2026 09:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K4twMkWs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C2TzaBV0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984114218BB
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 09:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778836234; cv=none; b=jrlqcI+dsfczZAnqYGbGNrVF8Qwf0r4thm+Eb+eby1CXyEzyulkZns+1VkfpPP6Q/nTq0pjWuH/Q9FlxZnIZjqfR6uO4DNSk0iK6InCCJ5HEfFxqFFYu/z0YzHs1rqKjGDEQI1hZovs9Ox1xjt4jDRkbnBA2AC/p78nI8Bv7b80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778836234; c=relaxed/simple;
	bh=NAlYr5OBkji2DJxmosxyZUEB0sJ0e4O5IXDaacLjWjI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M4swcX1Q3r++niaaP2vg5s+LkdA481ENdTWOBwx5z5KhT4lSCXsCXeq0VnMAQoSY+II4Kvlb2zs41S2Dkt0w/wdad1CPHfYg7oY1eL9wk2jK0EGC6vhInAWy5kB0bD8OVadJBN7xgwKAzmbSWh9L3si/lYUCX4UwdqFQWesJA5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K4twMkWs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C2TzaBV0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F4w1rI3670819
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 09:10:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y33Kq8jS4pkB9lQwGZwmPZHQOGa7dfJetj4tNP3diP8=; b=K4twMkWsVKO4ydqM
	+x7fLcIUaYUdC4pZjQ4nzmCwJCNDSpko9ngzcGuQ7lfJI5A4gLCXHL81OpCqbGOG
	yhasSoIeNqzJiNwh1/RafZEvUpGZrp0tjybRvB4iP/sRM1zcgO0Iri0a/QKtqQ3a
	QYL4LX60xgHH68IMK/tb9gD87084M5OpiNYKDYHAW6K5MRomzYic50cPbfbfAWFU
	IeMu+4qqlENVZAULizM91LjB4jtfQdv83n2G8H+k8BpUH9obttqNPpZGpSR45cC+
	R2ZS7gpswo00/woXaYryEbWcMeEkQ2xQwQ32hEt2MaCiGrk0DN9DUBPoU0JBKh0+
	dgQr7g==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1s2kkm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 09:10:32 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9589688edfdso234877241.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 02:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778836232; x=1779441032; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y33Kq8jS4pkB9lQwGZwmPZHQOGa7dfJetj4tNP3diP8=;
        b=C2TzaBV01qjOFUAjkfk4GhhuZ6zjdAZ4KNwrLseErhUZwCKLch4ygFbUvD2jv/2n0g
         GPf5OSfTo82maKf2Ib3cXpXY1H1YJKR+kIClo45ba10/1LWAxWHnHsN6U7knh0yuLjYb
         CMM1pWokuXSSM0aKFi0APiMcq4sHH5huvlZ4Ihgska4b1d0rN8spNDBUgZ15HtFbjkOs
         PypVbg+SpQyZC4TJB9jY4ZRdQ+tQiZbH8k39kSWHJGNGRZlIB8u8neWaiPA6azMQL2XR
         oEMLW59cp6D8McxZKhFGoGu2yu/MJTvFNVyDYIL7CkWusxMk2cY5+keU+LbG+lfzUULa
         /gaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778836232; x=1779441032;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y33Kq8jS4pkB9lQwGZwmPZHQOGa7dfJetj4tNP3diP8=;
        b=F+2Cblji9JOdv7uVSsgOOJ47P5mHxjYCtlkjBlMsGIla/BFHiyqJBjuMrCNyvigf2Z
         HhbuTlgVymY4Hy5ytwPIsaoW8dQ97vqskNV9bG8Gp7h8bFEU2LF/h6CmrRRVmSKzpzYk
         Mhe0Sure+NvaI1AMq/u3qRRtR/n3R5rHt5xFDIXwOAlMNLn/zUERilw3IsgoqwEoPIbf
         AZB6L4rFgdx02Rb/SzJ4ZMiNQuG2BHsXLBxangaoyA6lH7RhOzQWl48XnQf2cuVRpryx
         I/MbI9094Gg9bnjllB77cdgYECNeH/LnOqF2uG39sEZ7g4tBxw5kg3aj57i3OprKzHFX
         dgbw==
X-Forwarded-Encrypted: i=1; AFNElJ/h7AsamvecT0yUIeoGITPwjRsoAb2bN40e+7MBOja1SdB0EHQykb2WqeUG/EFfA4L4SBTW1IGp8WppLz8n@vger.kernel.org
X-Gm-Message-State: AOJu0YxIh6ioo3LquBBb8GD0HWo8x/yd/Eh1YuQl56TyE+L7D3eHxFiD
	r2TgIbUlXxGhxrNzpxXINqvKif7mXk/gkevaEA/rKR/NsUbJbJPJeaguZnfFAn+MOaojXpoWLpC
	LyqHJZXdhm0z2vfl5870jI+BWLMJgcwSpirzEgte7iUVvotVPcttzrqcqsd9Yy5LTyhX7
X-Gm-Gg: Acq92OHTi93WFTTHbWpE1l9soFftvR4AzmAnQb2c9ni6VvvXIxfRzI5KdZgObzCzFWl
	Fk+mDFLJHdmUMgPbTFsAT6MHnvNZxIovICdCcst5w3W1tOWVbNcynDeG2mstBijiCAQ3E9vEm3K
	MC/WmqMiixdVNzJpShdnhsvT1X0oTuX6zMIhAD3qxcwtuMdpdgYZois/GWX5D0Qj8amlxl09rcU
	Ts9SRd3DyXxPLGBAV9oeXGJnDFbSHisayAGwOXsLRIiePCZgFeeTuCEeW8nuJKbhPjO/Xujm1qG
	I1nVE9h4IILpqroLqZEOh8/cV8jZvXZSlugLa3wMcwVQNYTRfM2CBNR6cj6d1laUTNdUuUJ0kJp
	A9tXBGuKRoFwQ6yVf4X9tKEjm0kHLSwwIKQ/5GkomEDb6T3pGa37pNIGP+MDHc2t42DBBMbFQr0
	DT9YA=
X-Received: by 2002:a05:6102:1242:b0:62f:46c:40bb with SMTP id ada2fe7eead31-63a402a0379mr383762137.5.1778836231748;
        Fri, 15 May 2026 02:10:31 -0700 (PDT)
X-Received: by 2002:a05:6102:1242:b0:62f:46c:40bb with SMTP id ada2fe7eead31-63a402a0379mr383755137.5.1778836231245;
        Fri, 15 May 2026 02:10:31 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4c23feasm200169966b.14.2026.05.15.02.10.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 02:10:30 -0700 (PDT)
Message-ID: <934d6876-3c83-43de-b155-d435af4c3547@oss.qualcomm.com>
Date: Fri, 15 May 2026 11:10:28 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: eliza: Add QUPv3, GPI DMA, SDHCI
 and LLCC nodes
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260513-eliza-dts-fix-debug-uart-and-more-support-v1-0-05814d24f4cf@oss.qualcomm.com>
 <20260513-eliza-dts-fix-debug-uart-and-more-support-v1-2-05814d24f4cf@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260513-eliza-dts-fix-debug-uart-and-more-support-v1-2-05814d24f4cf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDA5MSBTYWx0ZWRfXx6kU0N5rD6NZ
 YxPuBGI1oaxp1KeSo72i0V6uaZPwtkmdI8XpmaZibfXHE0alLZGpvybjrEM1oN1rmyO/T2y5lqe
 t5L4UInJmyIihnnr/MC7DKpFPMMaG4munFgUiazw5uXWr9Pp5wpwZcVBJ4tYnQKt3y+IPuLDAAz
 +l4YgW9ou9xZl/ChSTOLoaAZdWDDMqLF9E4RHEnU+IQswM3k2uKgijX+mTlbNthu0PKXUw2L2gD
 A8nezcZjnKITuRorxkr29AmzKTz1pIf2wXTZjz4f3pcr9mJ8aXRtfRfWtFZShrO9DGPtjPzCU40
 cUPBd/Mp7LDTjTksnu9lXjZU1gKx62BJ49pP0gMqE1Z1ES9N8x9oNDUNAR2T1hAjO/Ch+5JI5Vn
 1Nh4JIOqMhLEhYog0J6lCZjfoFSMGIIp80ZL8sKdWal9RfMnWXKLbMZnTmDFDxIzraHG09yLQfA
 Ia+JwJ9TDF9ydQrYG3g==
X-Authority-Analysis: v=2.4 cv=Md5cfZ/f c=1 sm=1 tr=0 ts=6a06e308 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=olRgGBVlyjl6rEf_PyYA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: EgWCH0rlzQ5Bp4BgdTTtxZRMm1k7q_6C
X-Proofpoint-ORIG-GUID: EgWCH0rlzQ5Bp4BgdTTtxZRMm1k7q_6C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605150091
X-Rspamd-Queue-Id: 44D4B54C7BA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-107748-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/13/26 2:33 PM, Abel Vesa wrote:
> Describe the missing Eliza SoC nodes for the QUPv3 WRAP1 and WRAP2 serial
> engines, add the matching GPI DMA controllers, the SDHCI controllers and
> the LLCC system cache controller.
> 
> Also add the TLMM pinctrl states for the QUPv3 serial engines and the
> SD card/eMMC interfaces, plus OPP tables for the SDHCI controllers.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

[...]

> +		gpi_dma1: dma-controller@a00000 {
> +			compatible = "qcom,eliza-gpi-dma", "qcom,sm6350-gpi-dma";
> +			reg = <0x0 0x00a00000 0x0 0x60000>;
> +
> +			interrupts = <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 281 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 284 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 295 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 296 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			dma-channels = <12>;
> +			dma-channel-mask = <0x3f>;
> +			#dma-cells = <3>;
> +
> +			iommus = <&apps_smmu 0xb6 0x0>;
> +			dma-coherent;
> +
> +			status = "disabled";

Let's keep the GPIs enabled

[...]

> +		sdhc_1: mmc@f44000 {
> +			compatible = "qcom,eliza-sdhci", "qcom,sdhci-msm-v5";
> +			reg = <0x0 0x00f44000 0x0 0x1000>,
> +			      <0x0 0x00f45000 0x0 0x1000>,
> +			      <0x0 0x00f48000 0x0 0x8000>;
> +			reg-names = "hc",
> +				    "cqhci",
> +				    "ice";

This should be a separate node

> +
> +			interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 417 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "hc_irq",
> +					  "pwr_irq";
> +
> +			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
> +				 <&gcc GCC_SDCC1_APPS_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK>;
> +			clock-names = "iface",
> +				      "core",
> +				      "xo";
> +
> +			interconnects = <&aggre2_noc MASTER_SDCC_1 QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &config_noc SLAVE_SDCC_1 QCOM_ICC_TAG_ACTIVE_ONLY>;
> +			interconnect-names = "sdhc-ddr",
> +					     "cpu-sdhc";
> +
> +			power-domains = <&rpmhpd RPMHPD_CX>;
> +			operating-points-v2 = <&sdhc1_opp_table>;
> +
> +			qcom,dll-config = <0x000f44ec>;
> +			qcom,ddr-config = <0x80040868>;
> +
> +			iommus = <&apps_smmu 0x520 0x0>;
> +			dma-coherent;
> +
> +			bus-width = <4>;

That's definitely 8

> +			max-sd-hs-hz = <37500000>;

This should be fixed in Eliza

[...]

> +			max-sd-hs-hz = <37500000>;

ditto for sdcc2

> +
> +			resets = <&gcc GCC_SDCC2_BCR>;
> +
> +			status = "disabled";
> +
> +			sdhc2_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-100000000 {
> +					opp-hz = /bits/ 64 <100000000>;

The clock plan says 100, but the SDC doc says 50. What does
downstream set here?

Konrad

