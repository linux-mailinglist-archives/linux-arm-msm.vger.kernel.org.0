Return-Path: <linux-arm-msm+bounces-35633-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7B89AD6FE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 23:59:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE5011C2193A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 21:58:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F21AF1EF08A;
	Wed, 23 Oct 2024 21:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eA3N+GhW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4769D15746E;
	Wed, 23 Oct 2024 21:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729720737; cv=none; b=VVSKsLkMrC7mhybkFkEnI6jQYXWqBtshyNLuodpzEbpBgM4gkmpv8p4NxSmJtDxkPppk9T7NWKkJQRMqycob3A9GP6oXt9KMBLzATS8+gAMbcWv3GnW7OuUKwl1/Gf7LE+R50YDeET6irF8GO59vxuKDObYKFAFdbwPXfq80o9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729720737; c=relaxed/simple;
	bh=AkgbWZxAAZ1QBqzl8aY4eU+As2/ZENYMPaJBwjwUpyw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=KrUaWOmPuCYyL7JpMO/8Gs5bjQk3Kfww46OSxavuAKi3Zycu9VmoEWNb3XcELgAPCDhkXdMoK50b2lsLMfm4mWBoJl1oLAiq4bXNQszM4jOHsIQ4aPSn2m0lEW8MTTUCDN6454L1gDekCyg6bi/C0oKMTeDzhY4PYdx3aQF5K2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eA3N+GhW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49NKZLEU029341;
	Wed, 23 Oct 2024 21:58:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cgMeTpOBr8HA4Mgn4ANzJFLGOIAUmI2xC4CTi8ZI5V0=; b=eA3N+GhW/SLrinOO
	m7dvwqao+dBIar+NHeQoWSEd6RP5i/yT7igRIARNR7Jf4+SrYBmGP1WZ+JiLQQ7S
	cAJ1SanZhES7XtDODwapLmWo/Z/PepMavI0LQCmCw+m4jmUMG97r49tDUAmbIWXG
	bV/S/xcz1I+/RBhqjnfSHSmOYmP8QV7bUPy4iDOfDbEerz8BkKRSbIu8eWGWT0XX
	30brM3C/SZwuceJHxOtcl/VPD3CquZ62fjeIU9kTwLiFSn/PIKmjKnhGnePqG+cz
	zO7h513CUmtmiDJM5dKYOU/vGVeFcMhj69vbrlXTQmrPPUvdNI40nCZ66qEjHC+g
	0Bcbfw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em3w3mqp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 21:58:37 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49NLwaP6016361
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 21:58:36 GMT
Received: from [10.71.108.63] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 23 Oct
 2024 14:58:36 -0700
Message-ID: <49e5ba96-5452-4722-a656-921c64081190@quicinc.com>
Date: Wed, 23 Oct 2024 14:58:35 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: Add base sm8750 dtsi and mtp and
 qrd dts
To: Bjorn Andersson <andersson@kernel.org>
CC: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        "Will
 Deacon" <will@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
        Stephen Boyd <sboyd@kernel.org>, Trilok Soni <quic_tsoni@quicinc.com>,
        "Satya
 Durga Srinivasu Prabhala" <quic_satyap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jishnu Prakash
	<quic_jprakash@quicinc.com>,
        Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
References: <20241021232114.2636083-1-quic_molvera@quicinc.com>
 <20241021232114.2636083-5-quic_molvera@quicinc.com>
 <qqdtpvx6dnot2ncmj7khzpyaftnfjyrxmg5bz6t6id7uwutcyc@qvrybabbxxlp>
Content-Language: en-US
From: Melody Olvera <quic_molvera@quicinc.com>
In-Reply-To: <qqdtpvx6dnot2ncmj7khzpyaftnfjyrxmg5bz6t6id7uwutcyc@qvrybabbxxlp>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: a1dcem2CYXbK-WTPWs2Q4GFmt4RmYvyj
X-Proofpoint-GUID: a1dcem2CYXbK-WTPWs2Q4GFmt4RmYvyj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410230141



On 10/22/2024 8:12 PM, Bjorn Andersson wrote:
> On Mon, Oct 21, 2024 at 04:21:13PM GMT, Melody Olvera wrote:
>
> 2 "and", 2 "dts" and a "dtsi" in the subject. I'd prefer a more
> succinct:
>
> "arm64: dts: qcom: Add SM8750 platform, mtp and qrd"

Ack.

>
>> Add base dtsi for the sm8750 SoC describing the CPUs, GCC and
>> RPMHCC clock controllers, geni UART, interrupt controller, TLMM,
>> reserved memory, interconnects, regulator, and SMMU nodes. Also add
>> MTP and QRD board dts files for sm8750.
>>
> Nice.
>
>> Co-developed-by: Taniya Das <quic_tdas@quicinc.com>
>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>> Co-developed-by: Jishnu Prakash <quic_jprakash@quicinc.com>
>> Signed-off-by: Jishnu Prakash <quic_jprakash@quicinc.com>
>> Co-developed-by: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
>> Signed-off-by: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
>> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/Makefile       |    2 +
>>   arch/arm64/boot/dts/qcom/sm8750-mtp.dts |  968 ++++++++
>>   arch/arm64/boot/dts/qcom/sm8750-qrd.dts |  965 ++++++++
>>   arch/arm64/boot/dts/qcom/sm8750.dtsi    | 2903 +++++++++++++++++++++++
>>   4 files changed, 4838 insertions(+)
> Most reviewers will prefer the platform and individual devices to be
> added in separate patches, to not hit 5kloc. I don't mind it...

I wasn't sure whether or not to split; some recent efforts had combined 
platform
and devices into one patch. Either works for me.

>
>>   create mode 100644 arch/arm64/boot/dts/qcom/sm8750-mtp.dts
>>   create mode 100644 arch/arm64/boot/dts/qcom/sm8750-qrd.dts
>>   create mode 100644 arch/arm64/boot/dts/qcom/sm8750.dtsi
>>
>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>> index 065bb19481c1..3bedfa6b37f2 100644
>> --- a/arch/arm64/boot/dts/qcom/Makefile
>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>> @@ -269,6 +269,8 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-hdk-display-card.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-hdk.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-mtp.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-qrd.dtb
>> +dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-mtp.dtb
>> +dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-qrd.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= x1e78100-lenovo-thinkpad-t14s.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-asus-vivobook-s15.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-crd.dtb
>> diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
>> new file mode 100644
>> index 000000000000..e1a94dc76e2f
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
>> @@ -0,0 +1,968 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +/dts-v1/;
>> +
>> +#include <dt-bindings/gpio/gpio.h>
>> +#include <dt-bindings/leds/common.h>
>> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>> +#include "sm8750.dtsi"
>> +#include "pm8010.dtsi"
>> +#include "pm8550.dtsi"
>> +#define PMK8550VE_SID 8
>> +#include "pm8550ve.dtsi"
>> +#include "pmd8028.dtsi"
>> +#include "pmih0108.dtsi"
>> +#include "pmk8550.dtsi"
>> +#include "pmr735d_a.dtsi"
>> +
>> +/ {
>> +	model = "Qualcomm Technologies, Inc. SM8750 MTP";
>> +	compatible = "qcom,sm8750-mtp", "qcom,sm8750";
> Can we please here have a:
>
> 	chassis-type = "handset";

Ack.

>
>> +
> [..]
>> diff --git a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
>> new file mode 100644
>> index 000000000000..af0174d95e3a
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
>> @@ -0,0 +1,965 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +/dts-v1/;
>> +
>> +#include <dt-bindings/gpio/gpio.h>
>> +#include <dt-bindings/leds/common.h>
>> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>> +#include "sm8750.dtsi"
>> +#include "pm8010.dtsi"
>> +#include "pm8550.dtsi"
>> +#define PMK8550VE_SID 8
>> +#include "pm8550ve.dtsi"
>> +#include "pmd8028.dtsi"
>> +#include "pmih0108.dtsi"
>> +#include "pmk8550.dtsi"
>> +#include "pmr735d_a.dtsi"
>> +
>> +/ {
>> +	model = "Qualcomm Technologies, Inc. SM8750 QRD";
>> +	compatible = "qcom,sm8750-qrd", "qcom,sm8750";
> chassis-type please.

Ack.

>
>> +
>> +	aliases {
>> +		serial0 = &uart7;
>> +	};
> [..]
>> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
>> new file mode 100644
>> index 000000000000..98ab82caa007
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
>> @@ -0,0 +1,2903 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#include <dt-bindings/clock/qcom,rpmh.h>
>> +#include <dt-bindings/clock/qcom,sm8750-gcc.h>
>> +#include <dt-bindings/clock/qcom,sm8750-tcsr.h>
>> +#include <dt-bindings/dma/qcom-gpi.h>
>> +#include <dt-bindings/interconnect/qcom,icc.h>
>> +#include <dt-bindings/interconnect/qcom,sm8750-rpmh.h>
>> +#include <dt-bindings/interrupt-controller/arm-gic.h>
>> +#include <dt-bindings/power/qcom,rpmhpd.h>
>> +#include <dt-bindings/power/qcom-rpmpd.h>
>> +#include <dt-bindings/soc/qcom,rpmh-rsc.h>
>> +
>> +/ {
>> +	interrupt-parent = <&intc>;
>> +
>> +	#address-cells = <2>;
>> +	#size-cells = <2>;
>> +
>> +	chosen { };
> You should be able to omit this...

Ack.

>
>> +
>> +	cpus {
>> +		#address-cells = <2>;
>> +		#size-cells = <0>;
>> +
>> +		CPU0: cpu@0 {
> I just merged a cleanup series from Krzysztof, making all labels lower
> case. So, I'd unfortunately like you to do the same...

Understood.

>
>> +			device_type = "cpu";
>> +			compatible = "qcom,oryon";
>> +			reg = <0x0 0x0>;
>> +			enable-method = "psci";
>> +			next-level-cache = <&L2_0>;
>> +			power-domains = <&CPU_PD0>;
>> +			power-domain-names = "psci";
>> +			cpu-idle-states = <&CLUSTER0_C4>;
>> +
>> +			L2_0: l2-cache {
>> +				compatible = "cache";
>> +				cache-level = <2>;
>> +				cache-unified;
>> +			};
>> +		};
> [..]
>> +	memory@a0000000 {
>> +		device_type = "memory";
>> +		/* We expect the bootloader to fill in the size */
>> +		reg = <0x0 0xa0000000 0x0 0x0>;
> gunyah_hyp_mem below is at 0x80000000, so I presume it's not just size
> that's being updated?

Yes; I believe it adds some more regions as well.

>
>> +	};
>> +
> [..]
>> +	soc: soc@0 {
> [..]
>> +		};
>> +
>> +
> Extra newline, didn't checkpatch --strict complain about that/

Didn't realize I needed to run w --strict; will remove extra line.

>
>> +		cnoc_main: interconnect@1500000 {
>> +			compatible = "qcom,sm8750-cnoc-main";
>> +			reg = <0x0 0x1500000 0x0 0x16080>;
> Until here you padded the base address to 8 digits, making it easy for
> humans to keep nodes sorted (by address). Please correct the remaining
> 7-digit nodes as well, to make it easier for future contributors to get
> their ordering right.

Will do.

>
>> +			qcom,bcm-voters = <&apps_bcm_voter>;
>> +			#interconnect-cells = <2>;
>> +		};
>> +
>> +		config_noc: interconnect@1600000 {
>> +			compatible = "qcom,sm8750-cnoc-cfg";
>> +			reg = <0x0 0x1600000 0x0 0x6200>;
>> +			qcom,bcm-voters = <&apps_bcm_voter>;
>> +			#interconnect-cells = <2>;
>> +		};
> [..]
>> +		apps_rsc: rsc@16500000 {
>> +			compatible = "qcom,rpmh-rsc";
>> +			reg = <0x0 0x16500000 0x0 0x10000>,
>> +			      <0x0 0x16510000 0x0 0x10000>,
>> +			      <0x0 0x16520000 0x0 0x10000>;
>> +			reg-names = "drv-0",
>> +				    "drv-1",
>> +				    "drv-2";
>> +			qcom,drv-count = <3>;
>> +
>> +			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
>> +			qcom,tcs-offset = <0xd00>;
>> +			qcom,drv-id = <2>;
>> +			qcom,tcs-config = <ACTIVE_TCS    3>, <SLEEP_TCS     2>,
>> +					  <WAKE_TCS      2>, <CONTROL_TCS   0>;
> Is 0 CONTROL_TCSs correct?

I believe so; I have no reason to think otherwise.

Thanks,
Melody
>
>> +
>> +			label = "apps_rsc";
>> +


