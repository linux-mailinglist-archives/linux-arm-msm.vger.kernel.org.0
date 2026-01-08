Return-Path: <linux-arm-msm+bounces-87989-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D5AD01292
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 06:45:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ECBE930141D6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 05:44:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8382632B9AA;
	Thu,  8 Jan 2026 05:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GhrpPwZE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AMAdmDRD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B90F2F260C
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jan 2026 05:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767851040; cv=none; b=pwdRGoksysXqzTGb1WAKWBn+O/GCHBdUMGzrXRGX0rY607JgxJ5RMsamfQ8gwRiAFz5dcTQ4r6MfAZ/Qs3ON1cFtQPlxlWpR+qkvacJByIUAQ8+DaJVvdxrlauyajGhCN0q44Ly6O9vDEj48kgR3b/jmI9G84yuDc+AiIaAwjgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767851040; c=relaxed/simple;
	bh=AvEdvduyVGsheEfFeWXrUyqWpyOpVMDffEXb51YYRcg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=bamlHTRqDG80UdNzcxONclr4Lt0qxLcX5DxlVMFApUvkogXbRFIeh0CkRBtoJaufGAyis52wt1tD4BAYTdS1UwJKrj4JVCaBa+QM0vhDQQCgGnMKIH4vf4xb66b5ipjjNf6nm3FQkJSopTR8eWg/CZGgYDRhibqNU8QqVhGoGiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GhrpPwZE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AMAdmDRD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 607JSV6D3152745
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Jan 2026 05:43:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9juYGvJdkazTdgj/WwA/UxPKft5piYikDxFN5o/S2wA=; b=GhrpPwZET/bZGUvL
	OSJgX9UmFOt/HwCfmroLNYsYvfgGAv/7UJ2zkVZNgdikmcMJs4Kzs+H8+oXed0IM
	ql4ra2KQLfgm9oHU5tMlLuejhZv57Qovu4THSzralrPuum/wFT3Rie3WWQzhq2x0
	I+IlMeqbLBi+KKdB7JRzkLsDoU6vNy6p6zO1TDdQbL8LTzyYSIm5U7kPCeuH0PpG
	/uijjOzngqyBMTtnDDaEsRV2LEDwC04BKn5wEz/EOrUfEnz9IHuzrniBVVxbpRkC
	q/BCEewlXTFiaZZHpGAwF6oX94UK1/KxnqLmofXOhgSliX6QHhSzKIQ0kaDl9R49
	3rbqbA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhpjau4ju-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 05:43:56 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b5edecdf94eso4284324a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 21:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767851036; x=1768455836; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9juYGvJdkazTdgj/WwA/UxPKft5piYikDxFN5o/S2wA=;
        b=AMAdmDRDZuJXGy9jfTA+lwT1ZaJaLenbN+19FlikJpWJzz6WWesu9Y+K6Q4HQXnBKD
         JwO5msP/B3ORjPmgdbe5peKNcHmUjDKZa5AHZnJatcyKv6CoGr2iRwRoYdl73O0yokmi
         UlON/y5i9rkgguhnRCc+IDE2wIW/Vraj9fhIHyn7tZ7JDYgKieOpXObQNoK10Qdd/rSe
         n6DK/Bf/oUxwUw6ajN6UZixLIIKm34C5iyp8ll8MGNj7LTFmLSLtrpphoi3e8uv4lxLK
         I1QyS67C2wQlzq6JUfniFIdN9L6aGgwmqZBslAwbv4l3i6wn9MvJvpmQTqwAp0C3gddg
         0cBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767851036; x=1768455836;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9juYGvJdkazTdgj/WwA/UxPKft5piYikDxFN5o/S2wA=;
        b=heyDS7G9VBOBCWq34bSqfuZhb6ZO1lokF97d3t/PxCpuPTV/+dRzH0tXFultxTWmti
         SJL65J4TUvgP7zq7V5T7Hz/wh988TNzuEYpdu96BQxgjHyymuGPLkq7FmssREekc2o6w
         pk/G5BJhiCNaUSgnjPgqXc2S8BePyDjkOctmn5pwTXhmjUgfoj6JCNRXEu5LBotJ6Rpw
         A3dnYMfLdRfIEJR0DGsxyrz2JzALPNrH6cgH7Y7yw/zG0a1IH+94TjRuJMsT5P5cxL6u
         +JMWGjzZaylSHvw1xOpIFVk+nx3+++sCpXLbgQe4R/X3CjTzAAq97WC5cqnBOJg6/s9U
         ezrA==
X-Forwarded-Encrypted: i=1; AJvYcCVXoO+dKq/mcsREBOMW+IOBcHownitNtiJC2C7YfaEZz5/jON+gWcu3NT6xfn90+ip6hof1uKR/9XzKRAOK@vger.kernel.org
X-Gm-Message-State: AOJu0YyQsJcL1CR6XB3NSYyy5VzIw786Xk79N9WqfK4C2uJ2eekpGjvw
	RGWPV3xBfon5ba0lSJr5vFY/7eG8V88hG4iEIhaGCD7PiHAZRxH2xwopbLkcz8tEoK8rnEg1zIC
	8T1r6WwipyJu0qxzNWNXUr/d7Eyf3PJ2vO0DE96rbFlYPx9NmBeokfQyt9CJVkelrUy/y
X-Gm-Gg: AY/fxX7DSulHUX2uPGZm1L/cezi8yEx9xqgriCzmHL1isg108oCcNFccEplitRr4pTb
	n3zfcm6GSlMz0ZIKv/xy7+7ajbqpiMma/5Z+VxojJ7n8j8sW9wNjLJnluUhOk3p3gnLhX7OWXFN
	D9ttuhFQy93zZnFnt9aEosdXrBsWW+W5AIkAsKDnVdfT0SUFP2893FdNV38MuMaLFVTX8vkB4ED
	yhscXhWUeF7dB1GH3g4SCvY5J4HcOLsbK1Zj45T0k1TrGLMxasLD0N7LdNaKksPKvg//0FGiDbY
	GfcdC2qFJ6nRNg5WQXBsy2Js76Wfe09Dv3CHuAkAuDSDC2NkLNH5GO4OYDZasLhMRLqZnlDtxl2
	vBTsS2QZkTrKBsdvcSV3HgpvBKyWAvLOrV2HC/vqSZyb7ToKn0CfCFg==
X-Received: by 2002:a05:6a00:3688:b0:819:bad0:1002 with SMTP id d2e1a72fcca58-81b801ce2e1mr4583445b3a.66.1767851036108;
        Wed, 07 Jan 2026 21:43:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHnGXvVBwjg+OlVqdtRspe68mdXj50cfZhBEQfYeS+shK2KO7XbARsjqeuwfs2lK6B+sXzLIQ==
X-Received: by 2002:a05:6a00:3688:b0:819:bad0:1002 with SMTP id d2e1a72fcca58-81b801ce2e1mr4583425b3a.66.1767851035574;
        Wed, 07 Jan 2026 21:43:55 -0800 (PST)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c59e7c16sm6422553b3a.53.2026.01.07.21.43.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 21:43:55 -0800 (PST)
Message-ID: <32f4a425-e181-41ab-913f-55e3dd3b4fd5@oss.qualcomm.com>
Date: Thu, 8 Jan 2026 11:13:51 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFT PATCH 2/2] arm64: dts: qcom: ipq9574: Complete USB DWC3
 wrapper interrupts
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260106185123.19929-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260106185123.19929-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20260106185123.19929-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=efMwvrEH c=1 sm=1 tr=0 ts=695f441c cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VcDojdCpVXZduQiRT-wA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: ipfgQn9LOdVCYH3lxPqaimA9FJZS3NMr
X-Proofpoint-GUID: ipfgQn9LOdVCYH3lxPqaimA9FJZS3NMr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDAzNCBTYWx0ZWRfXzpGIJ3/z8cgU
 rOifqZfw13vLxI97PsgdauEgx9slRnGXhUawW13QAjgdGtrt9D11If+k063avW3tGfqEGLafphy
 r6f81N7PAwjbNWEgw2l2Cok7dG7OTRA1CbwXVrTaMDF+u2d+D4bGUUw2p6O0zX0m/BIVY4uGUPw
 Z6uR2FNGldLUox6k7PIQMUvN340Q1QNM4iCdgP/Z7kfJXrtn3bIZLbezROFjZDDr5DqGrqJBWUq
 FeEki8CIYmP710fjUZS6gwnxof3VpYegiCaVRzEG8CGTjpKk4s29kFEglJ6THbknoR1Zr9zCSk4
 uDxOxq20GpFh+myogbvQbAoLikw8qOtuW6KdZ5ioLSwiKc60X7o+fXuQhwcu3p+1xnyuC+MO221
 x4eOz9SSxJSozyZC+ZlYdAR1MxGeClYiw7wyYmixVA6nFCk7BOjTHqRgjeareHD3pMtH6fO34ZJ
 CAT0Y2yOg3KExGi1D1w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_05,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 adultscore=0 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080034


On 1/7/2026 12:21 AM, Krzysztof Kozlowski wrote:
> Complete interrupts for DWC3 node to match what is required by
> Devicetree bindings, as reported by dtbs_check:
>
>    ipq9574-rdp433.dtb: usb@8af8800 (qcom,ipq9574-dwc3): interrupt-names: ['pwr_event'] is too short
>
> The actual interrupt numbers are taken from reference manual of similar
> chip, but not IPQ9574, due to lack of access to it.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>
> ---
>
> Not tested on hardware.
>
> "lack of access" = no IPQ9574 at all.

Initially the SoC was named as IPQ9048 and after sometime it is renamed 
as IPQ9574. But unfortunately, the reference manual is not updated with 
the new naming.

I can confirm the below interrupts are correct. So,

Reviewed-by: Kathiravan Thirumoorthy 
<kathiravan.thirumoorthy@oss.qualcomm.com>

Thanks, Kathiravan T.

> ---
>   arch/arm64/boot/dts/qcom/ipq9574.dtsi | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> index 86c9cb9fffc9..d7278f2137ac 100644
> --- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> @@ -765,8 +765,14 @@ usb3: usb@8af8800 {
>   			assigned-clock-rates = <200000000>,
>   					       <24000000>;
>   
> -			interrupts-extended = <&intc GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>;
> -			interrupt-names = "pwr_event";
> +			interrupts-extended = <&intc GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&intc GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&intc GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&intc GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "pwr_event",
> +					  "qusb2_phy",
> +					  "dm_hs_phy_irq",
> +					  "dp_hs_phy_irq";
>   
>   			resets = <&gcc GCC_USB_BCR>;
>   			status = "disabled";

