Return-Path: <linux-arm-msm+bounces-36616-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A47349B8477
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 21:39:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 62507282240
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 20:39:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BE151BCA0F;
	Thu, 31 Oct 2024 20:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mQ2bfoG6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3716199FAF
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 20:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730407154; cv=none; b=hlhww6beFY3JtB1zNEAjE34/fLa9yUSboAZ3JY5pGcGghzfrLmL+FKzadL3pNQ4+oR3cTIyUww+OvoggloiEQ9iJNXNT6OVqnfT7w2hzL/F1TasAbcvuWZyflNR40URlGxIzdaFwnyjrSuxjFY719ERO42hb8qhamH/yRilvS/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730407154; c=relaxed/simple;
	bh=K1/6IUAcgF3FNqyRUw5wJSzHRzVUC/gKclPJjhysEqk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nRxAZSnNNrheduncmHviAAw3OlxTd1lLNvfcijpOJgLThc4zQj0XnNsvpPwpMzCjdrnOu1jHMLDji/RFdudegbc9t1yY3jogqsz6WTo5iMOQQ1HBaIzg8XVBNTUkkr9E9BQafG7A3vrD1KJwbpupBKpnHVPxv8aG7kQLpCuAGKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mQ2bfoG6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49VCX9Q0002324
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 20:39:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vl3oJJc/cyDkNw9XE3tervQuHfIVJB7nMeM0yzufPhA=; b=mQ2bfoG6rNCPalzn
	mXeXCXct7d847/pM4w6e0iqHVnwFTwCxYszmlbOkjnjphui0fYSKQ72TWYkGql73
	iR/6riJVjx6P14/ZaskNLHcaG/G638Lz/qT/zGd3x5Qk9v/RmgneNjT+VVwsHhe0
	x9/eGTOj0Ux8d5snjLjPSsmU/0VwOi72yv7Hct/3gEmW0YxyGTagjY2HVfwnWmu1
	XfG3P4PzHJ/SOubVaqWdT20pbbdVU1KJm4/m/8zU1dRwpTfTbI9SbSLfkTTNlQAB
	27CypTNrz/HP4UhASLw3xXfNF10OcBUPEn1Hp5AWmIoXAdgQvkde12iycpf+plJD
	jvQ+Hw==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42kmn5cuf3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 20:39:11 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-5ec1c46df37so183056eaf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 13:39:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730407150; x=1731011950;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vl3oJJc/cyDkNw9XE3tervQuHfIVJB7nMeM0yzufPhA=;
        b=wOUJDfhjiO4H5GPmCl0Kr94ZiE+X1mq35mttQKWSzWWC/vVnVJcIKNJ4buulPPTJCg
         yTLCM2lPt+apz446DLFulAZnRE/GLTEJ879vZSzfOF6eA8r3mecmvZn+tqAbWF/giW4a
         jdLsFc5GwDJTzj3kvtkMLY9Sr14iAdnZSBWYt2uxkkKePKPnVaLF3lDU4/2XbDRnb877
         7XAOgCMpjzwaLtecYUCjCQYSzbf93wbJzh3iRmJwzxbeeDG0PS/5ZMuCpHgtBHh3tbFZ
         kGIVTj2qFbTL5NtpfP8CheE2c0wWt3Xy2ZDk9vW7YxXbAvzYOBWu1LBN2ic5A2UzpJbG
         6s/g==
X-Forwarded-Encrypted: i=1; AJvYcCUB63spn76av/lKnE5UajyQZe3S+5C1eHbmJzHJxtOD4RAMPsPOwxgW65DkQ2d+P+8PRXx3xTo3lUJiK9D1@vger.kernel.org
X-Gm-Message-State: AOJu0YwGxdMY2u9NsJBga95IcIWxMrMkMm/XFzqPIcJp9VtvnR5P9PCb
	iIwLVlEZ9YEE9Ypc55wZ2UAVVmgwXnLbxUkpSitf7JJ+T0DPls+9mpDDvDh3eUuUL3hTFBz3MPa
	nCudOaJEYJC+PxvG+2QotN76QkE2WY8PQ91LzprFJbMnutCKYjh/hS0t5F+HHuVWe
X-Received: by 2002:a05:6870:eca2:b0:277:ed2c:55e4 with SMTP id 586e51a60fabf-29051adb5afmr5041614fac.3.1730407150493;
        Thu, 31 Oct 2024 13:39:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEh92vS1YesBWPNs6htJ0tunGqjMsV32xDc/IV1ooiMYzOIzsetPmIlA1CF1NqiFvpbJxLzTQ==
X-Received: by 2002:a05:6870:eca2:b0:277:ed2c:55e4 with SMTP id 586e51a60fabf-29051adb5afmr5041601fac.3.1730407150168;
        Thu, 31 Oct 2024 13:39:10 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e56643609sm101287266b.155.2024.10.31.13.39.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Oct 2024 13:39:08 -0700 (PDT)
Message-ID: <8355dc9f-ec3b-4738-b4e1-41351af2fa91@oss.qualcomm.com>
Date: Thu, 31 Oct 2024 21:39:06 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: sar2130p: add support for
 SAR2130P
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Kurapati <quic_kriskura@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20241030-sar2130p-dt-v2-0-027364ca0e86@linaro.org>
 <20241030-sar2130p-dt-v2-3-027364ca0e86@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241030-sar2130p-dt-v2-3-027364ca0e86@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 6oDsYAYB49Ysp3xl0ONLH6h_MTTitAIc
X-Proofpoint-GUID: 6oDsYAYB49Ysp3xl0ONLH6h_MTTitAIc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 mlxlogscore=999
 priorityscore=1501 mlxscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410310156

On 30.10.2024 12:50 PM, Dmitry Baryshkov wrote:
> Add DT file for the Qualcomm SAR2130P platform.
> 
> Co-developed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sar2130p.dtsi | 3091 ++++++++++++++++++++++++++++++++
>  1 file changed, 3091 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sar2130p.dtsi b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
> new file mode 100644
> index 0000000000000000000000000000000000000000..d4f5514cbdaf2d0a1c1cd367be2d7a08246d203e
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
> @@ -0,0 +1,3091 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2024, Linaro Limited
> + */
> +
> +#include <dt-bindings/clock/qcom,rpmh.h>
> +#include <dt-bindings/clock/qcom,sar2130p-gcc.h>
> +#include <dt-bindings/clock/qcom,sar2130p-gpucc.h>
> +#include <dt-bindings/clock/qcom,sm8550-tcsr.h>
> +#include <dt-bindings/dma/qcom-gpi.h>
> +#include <dt-bindings/interconnect/qcom,icc.h>
> +#include <dt-bindings/interconnect/qcom,sar2130p-rpmh.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/mailbox/qcom-ipcc.h>
> +#include <dt-bindings/phy/phy-qcom-qmp.h>
> +#include <dt-bindings/power/qcom-rpmpd.h>
> +#include <dt-bindings/power/qcom,rpmhpd.h>
> +#include <dt-bindings/soc/qcom,gpr.h>
> +#include <dt-bindings/soc/qcom,rpmh-rsc.h>
> +#include <dt-bindings/thermal/thermal.h>
> +
> +/ {
> +	interrupt-parent = <&intc>;
> +
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	chosen { };
> +
> +	clocks {
> +		xo_board: xo-board {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-frequency = <19200000>;
> +		};
> +
> +		sleep_clk: sleep-clk {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-frequency = <32000>;
> +		};
> +	};
> +
> +	cpus {
> +		#address-cells = <2>;
> +		#size-cells = <0>;
> +
> +		CPU0: cpu@0 {

Krzysztof recently turned these lowercase, please follow suit

[...]

> +		/* secdata region can be reused by apps */

This comment isn't very useful

> +		smem: smem@80900000 {
> +			compatible = "qcom,smem";
> +			reg = <0x0 0x80900000 0x0 0x200000>;
> +			hwlocks = <&tcsr_mutex 3>;
> +			no-map;
> +		};
> +
> +		cpucp_fw_mem: cpucp-fw-region@80b00000 {

Not sure if we want -region everywhere. Krzysztof?

[...]

> +	soc: soc@0 {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges = <0 0 0 0 0x10 0>;
> +		dma-ranges = <0 0 0 0 0x10 0>;
> +		compatible = "simple-bus";

Compatible first, please

[...]

> +			#size-cells = <2>;
> +			ranges;
> +			status = "disabled";

A newline before status would be very cool

[...]

> +		pdc: interrupt-controller@b220000 {
> +			compatible = "qcom,sar2130p-pdc", "qcom,pdc";
> +			reg = <0x0 0x0b220000 0x0 0x30000>, <0x0 0x174000f0 0x0 0x64>;
> +			qcom,pdc-ranges = <0 480 94>,
> +					  <94 609 31>, <125 63 1>, <126 716 12>;

Super weird line break

[...]

> +
> +		apps_smmu: iommu@15000000 {
> +			compatible = "qcom,sar2130p-smmu-500", "qcom,smmu-500", "arm,mmu-500";
> +			reg = <0x0 0x15000000 0x0 0x100000>;
> +			#iommu-cells = <2>;
> +			#global-interrupts = <1>;
> +			interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 182 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 185 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 319 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 336 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 396 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 398 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 399 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 401 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 402 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 404 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 405 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 407 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 408 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 409 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 418 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 412 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 707 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 690 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 691 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 692 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 693 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 694 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 695 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 696 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 697 IRQ_TYPE_LEVEL_HIGH>;

dma-coherent?

Please check if this is the order they appear in originally, as they're
ordered (although on some recent socs it appears they're accidentally
sorted by design)


> +		};
> +
> +		intc: interrupt-controller@17200000 {
> +			compatible = "arm,gic-v3";
> +			#interrupt-cells = <3>;
> +			interrupt-controller;
> +			#redistributor-regions = <1>;
> +			redistributor-stride = <0x0 0x20000>;
> +			reg = <0x0 0x17200000 0x0 0x10000>,     /* GICD */
> +			      <0x0 0x17260000 0x0 0x100000>;    /* GICR * 8 */

Please remove these comments

[...]

> +
> +		/*
> +		 * Bootloader expects just cache-controller node instead of
> +		 * the typical system-cache-controller
> +		 */

Uh-oh..

> +		llcc: cache-controller@19200000 {

Konrad

