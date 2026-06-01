Return-Path: <linux-arm-msm+bounces-110585-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QJjuEOV9HWotbQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110585-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 14:41:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D031461F6F4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 14:41:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 01B23301384C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 12:40:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39E79379979;
	Mon,  1 Jun 2026 12:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xfkdz/iq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P/ISekY7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4B1369D6D
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 12:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780317631; cv=none; b=YuPpsq+CugfBZ/rpa3JRMKekIOXdS4WYM65HXiE2lWjjYZcp8RiD71Am6k3TH3WC00do+6aX36ZNjmZ1Zfm3OqIlHOSHjSMOxz9R6ukUUEyIZ6GIpoV+XcZUWryQEIUaAiUt9abEuNa1tp1zEZ0AwDDOeyuyaZpZe/ml1+3bxsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780317631; c=relaxed/simple;
	bh=+4xvN6jPzRNsEI6bBJ+FxzqSF1/BI4dtW8HSpmcwHwM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f6cGeuu+rmXk1qL99cYdXgan4CalsRJGJaak+g47FSkXV87ZZNbnbaaBKPHsVqXh6uaZtJgLobpG1udUGhK6WlvYnIAczaNS9nzcehov0zAglxqwJyc3SGPKyx2fcoJOuxETMf1aKaYSkvzUcNjgKwQupQ2Acp+ZN0xqQZPZGP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xfkdz/iq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P/ISekY7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651Cbwtr599801
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Jun 2026 12:40:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g/yD0wV2bl/lxzrc2fW+99SQslSGMVWbU97D32Jk++g=; b=Xfkdz/iqeyD9u/6o
	9+9W8V0cJ15P0IHtSF514Ktkgs/HcqtNEhXKQ5x7GhajXuLtwS2DWmFddDEIl9oG
	qmq9NxnEaAkgmyFo8ZlzjFEKNb/otCtX2aAPiA6tPpIfCUq0AG6ePDOFyyBd7KJs
	yd6c+TojxPThAApHR/e5x0bAPL8VALxekMgB6FNz1EfjM24WCYG7l/vmHRrTbcE+
	Q+linwEYAjK8U+NZTWcNOliXZdqJzggWy4HF2vJPlcXbrs/+/qOP2dvhekL77ORG
	rHEaDVHn0k/h/Q3Yu1VoWj2qOTUAa/wSQZVSZBXG/ggfkW+po2WJizFPuKWf1zvr
	CPrlIw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eha8r806r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 12:40:20 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8423970cb30so1037743b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 05:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780317619; x=1780922419; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g/yD0wV2bl/lxzrc2fW+99SQslSGMVWbU97D32Jk++g=;
        b=P/ISekY7ylZOnr6GZbe5kqHtjXMXPHz5+141bAwpAq3hkqEHjMmu4zeCESASodUiqA
         u0sPkMZY8HiLyhJ9gwPpfPT5oYsFaS5wtgnWR1dTz4S6GxYcbA1VzhY0z6/2VDvoW61j
         d+QoWCcG4oNjKtAOS4qT8splwF2/7Vc1X9vqd2LYbyPnwKSY/68JLutkwQ9R/rnue1ns
         45ATcWeQtzTOrIdOrUgA9p849u0wvRmFGGRNk/b4pwjYe6OkpRxR22FupCPVGe7dXfDk
         yIWxKTbiJJQ/ivdMxjJWnDBrnJALxVMH/BZYABIBzey2JA++r6qmf82nfKS2LK8qxz/d
         JBuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780317619; x=1780922419;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g/yD0wV2bl/lxzrc2fW+99SQslSGMVWbU97D32Jk++g=;
        b=d2AoQckVy9jmmiLGGnS8VL6vI+7SbJq6DyIE3WU2ErPsO5f1MTSD0Z4wduD57dqLzO
         rVXT1uvjogHuJzUKY7uPRQIFK8If+16cCByFahD24Wu30GA1DAjq5Q/SsxUTvDeqphLR
         yxuUa3tBDDtQV+Cuugpqw+gz7kVM9jWIwdX16riLBFXGxE3+RUzjY8jja1454/j3YlcJ
         NwWW5Le0x+L68ZFxVxl7MdNkC2SMMMC/y3cetBOiKuUvESNilXdADA1QaWTeyZFi+OR7
         XZpzhdA8ZhRPXOc6WdxspaRU2hwNkXc3g5yjiNeNxTgBg3rPi2AMLewpolW60QI/PiTo
         FtSg==
X-Gm-Message-State: AOJu0YwwxUftEXay2I1XnwM7ymA4rMXY5ugO810V70eyQ/ug5AfFj52R
	enzi31+Twv+j1J9ue9DkIaddSkxNrWQnF8TI8e5ZNMMOG03O74I849wlUgIVcLBprEDsrPVzEJa
	rjg8K+upqSjbs04wZhbHZK4BmrEXYIyjei8Xv29N3cffIm07L1kwoivkETJqp97meDKl8
X-Gm-Gg: Acq92OHnIzYImQap4q75YetdFFZyQevAMDYY/YwVuuU8b9KkX8zyTMN6JBEIiisBL3e
	H+nn+JebItj6SIGwvaXIAKEyKz9sq7wrAVVzDJRon+csOJtvyBE84sjQkRgcEbs7WRl24BJM/wt
	3jDvaUmG6NvqClyciY4LLPj95ZtAlUofPxJhyG5ySsvzBRcnQVnHL64/jg7gvt21WHs1kA7A7sP
	pWVDFKIwIeTn1XzLbpV3n3o81HQm8DhMff0RQKECLSi38268c/xlyI4unq5pv4RGauKoLX8dozu
	79rQIYIqHpsPTrTN419XmPrVxMOhv1IoLtXXIr+WGzAg81JXWnIFSwfwYGf8ZaG2isXqxh/IrW1
	DR4o5w3MQeYWn/ygz6VIP1/4q9P/JFpWgD9H5AnkG6kJbhrPzR2UuE+wXOan9
X-Received: by 2002:a05:6a00:987:b0:82f:4f67:1ff6 with SMTP id d2e1a72fcca58-8422534302fmr10319752b3a.4.1780317619414;
        Mon, 01 Jun 2026 05:40:19 -0700 (PDT)
X-Received: by 2002:a05:6a00:987:b0:82f:4f67:1ff6 with SMTP id d2e1a72fcca58-8422534302fmr10319723b3a.4.1780317618859;
        Mon, 01 Jun 2026 05:40:18 -0700 (PDT)
Received: from [10.219.56.230] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842222e2394sm8411523b3a.2.2026.06.01.05.40.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 05:40:18 -0700 (PDT)
Message-ID: <db343bab-c274-437b-8042-3508b85cdc2b@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 18:10:12 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/10] arm64: dts: qcom: Add QUPv3 configuration for
 Shikra
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Xueyao An <xueyao.an@oss.qualcomm.com>
References: <20260530-shikra-dt-m1-v2-0-6bb581035d13@oss.qualcomm.com>
 <20260530-shikra-dt-m1-v2-3-6bb581035d13@oss.qualcomm.com>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20260530-shikra-dt-m1-v2-3-6bb581035d13@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aKnAb79m c=1 sm=1 tr=0 ts=6a1d7db4 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=5iICPckp_3-IrkfDOHUA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: G-r8ZvnB-d0SFb4C19cpfTuK0y3NdqZZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDEyNiBTYWx0ZWRfX7ZLAobktd3j0
 wwkUK32w8LV4JGdkXw1BaF3C7Fr18OQs3zT5jgl616Shdyhta7V5JkcRYjR5ExanZtBFoNk/cg3
 v/h33RqHJlpGzb8CQdCk2DIHMWw4VPBVuXYhf908MK/UbotJyf5Huz/kTt8vwpsPRPQ6rNMYCBZ
 t0u3u1CWKsmp53sZoss45yGBarxO7DeKk0JxyjyDHENJD9tNlSHt+nFRBXjwaqI83CD9D+HCDsj
 CC4wF9Mxp6cw/f3wew42uerf04ty1uVjNEBusus3wlwHg/IpESpFf1M+aPfo0bMMP2exja5FoV1
 4dnZmurtAnlZCtMGKm5gS+xaYK65BXsIJVMp7e4sl8EzA5LgAIGsXzwEB47mQnSzHDSvkxVIkmQ
 XUuUaQsT9KHXlhF4Ly1t0kBYTNkrxkCvTuqzDTEkjA6x1DQBOFdvVsRGqaRZQZQ42jY7wpUu8VY
 UqbIDjhIqU4xsnnTUbw==
X-Proofpoint-ORIG-GUID: G-r8ZvnB-d0SFb4C19cpfTuK0y3NdqZZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010126
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-110585-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,4a00000:email,0.7.161.32:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D031461F6F4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/30/2026 11:57 PM, Komal Bajaj wrote:
> From: Xueyao An <xueyao.an@oss.qualcomm.com>
>
> Add device tree support for QUPv3 serial engine protocols on Shikra.
> Shikra has 10 QUP serial engines under a single QUP wrapper, all with
> support of GPI DMA engines.
>
> Signed-off-by: Xueyao An <xueyao.an@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/shikra.dtsi | 951 +++++++++++++++++++++++++++++++++++
>   1 file changed, 951 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
> index a4334d99c1f3..2751b4f89678 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> @@ -6,6 +6,7 @@
>   #include <dt-bindings/clock/qcom,rpmcc.h>
>   #include <dt-bindings/clock/qcom,shikra-gcc.h>
>   #include <dt-bindings/interconnect/qcom,icc.h>
> +#include <dt-bindings/dma/qcom-gpi.h>
>   #include <dt-bindings/interconnect/qcom,rpm-icc.h>
>   #include <dt-bindings/interconnect/qcom,shikra.h>
>   #include <dt-bindings/interrupt-controller/arm-gic.h>
> @@ -348,6 +349,161 @@ tlmm: pinctrl@500000 {
>   			gpio-ranges = <&tlmm 0 0 165>;
>   			wakeup-parent = <&mpm>;
>   
> +			qup_i2c0_data_clk: qup-i2c0-data-clk-state {
> +				/* SDA, SCL */
> +				pins = "gpio2", "gpio3";
> +				function = "qup0_se0";
> +				drive-strength = <2>;
> +				bias-pull-up;

[...]

>   
> +		gpi_dma0: dma-controller@4a00000 {
> +			compatible = "qcom,shikra-gpi-dma", "qcom,sm6350-gpi-dma";
> +			reg = <0x0 0x04a00000 0x0 0x60000>;
> +
> +			interrupts = <GIC_SPI 511 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 512 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 513 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 514 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 515 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 516 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 517 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 518 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 519 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 520 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 521 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 522 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 523 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 524 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 525 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 526 IRQ_TYPE_LEVEL_HIGH>;

Ignore this series.
Missed updating interrupt cells to 4. Will fix this in next revision.

Thanks
Komal

> +
> +			dma-channels = <16>;
> +			dma-channel-mask = <0xff>;
> +			#dma-cells = <3>;
> +

[...]


