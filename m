Return-Path: <linux-arm-msm+bounces-38257-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFB59D1AFB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 23:16:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F6BC280EC3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 22:16:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 372BC1E5711;
	Mon, 18 Nov 2024 22:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LUKlTLWn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A63158DAC;
	Mon, 18 Nov 2024 22:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731968193; cv=none; b=E78AhyyKPWOgV9yw8e9UY9sNxFz5ZpFJfVO+a95vwe6/Ii6LSIqHVfDmF0ojHnmqd4UbDSl1W9kMkJR896ju2OQbWm4Q54ZEeDhNGtXw5woGMuZRSu7oXcuRkhI28TaiyjCzr58lE91ha2+L5wmEevveyH6Tdaxa9Jqjj6rvKqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731968193; c=relaxed/simple;
	bh=/YuEiaBYaheoUGiGxF4r0WgQr1b56tLNgo/VqdVCka4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ZOASGIrhgxqOwqrgE+AsrXP5v1tMZ7g9Sn4M9di3s0Yl/ZbfmN+gEVHJEiC9wrDOjrn9g/UzH7MvDR2aOU/8VWKGMRIp4741Z/ckx90APPJDjPydtoSJNsBhzHbI56ak2YpBI0vbF2GfD6s4kRdCjmyg9Xhpq0eNdTiDJY9HFls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LUKlTLWn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AIGGpkX006018;
	Mon, 18 Nov 2024 22:16:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XJNsNXFftV73a7f1HlGoO9KUog+cN+4rISawA+ehEYI=; b=LUKlTLWnHdiiqCAP
	CsNY9tbAK+DLSLDayvQefHLy/B6Q7r6X9cYT44c7fBsl4jVlV5aEeFeAAXcGR8tZ
	5Vw2zoW10l2Vj2ORIitP7hHHGpt7ztISw3pUFkxK1BVPqpUUt67eNMvOJI1ME6bP
	LIiE+ouAZ5Vl/2PNw5uWE7YtUbC8XTZ5WgFCUie8yxsHxA8G1HVeV20TaTPwp3QM
	xLImPnNr6Hg84O+mi97QWGdkmUeJVpS7z8vReBXY3DvGkFiP+hc9S5VK62sgTfzi
	m8ocRzcWrKw9DjQmYakuarSwcZrevA7731a0VY4iNg4JGwLLrSYSPNqBtmMidTik
	itWe5g==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4308y8grm0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Nov 2024 22:16:19 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AIMGAsb007634
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Nov 2024 22:16:10 GMT
Received: from [10.71.108.63] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 18 Nov
 2024 14:16:09 -0800
Message-ID: <7062700e-1e96-4856-816a-ceefa0afd75c@quicinc.com>
Date: Mon, 18 Nov 2024 14:16:09 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] arm64: dts: qcom: Add pmd8028 and pmih0108 PMICs
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Geert Uytterhoeven
	<geert+renesas@glider.be>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        "Arnd
 Bergmann" <arnd@arndb.de>,
        =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?=
	<nfraprado@collabora.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        "Satya Durga
 Srinivasu Prabhala" <quic_satyap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Jishnu Prakash <quic_jprakash@quicinc.com>
References: <20241112004936.2810509-1-quic_molvera@quicinc.com>
 <20241112004936.2810509-3-quic_molvera@quicinc.com>
 <r4slda74u7rpqiybsylrnoqiqo5qm4442rfwzhtjkwkkgqt25g@n5idmspl7sfd>
Content-Language: en-US
From: Melody Olvera <quic_molvera@quicinc.com>
In-Reply-To: <r4slda74u7rpqiybsylrnoqiqo5qm4442rfwzhtjkwkkgqt25g@n5idmspl7sfd>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: s2vAzRuX-8NLCGbpzQenK-qU99mxDK-3
X-Proofpoint-GUID: s2vAzRuX-8NLCGbpzQenK-qU99mxDK-3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=878 lowpriorityscore=0 clxscore=1015 malwarescore=0
 adultscore=0 impostorscore=0 mlxscore=0 spamscore=0 phishscore=0
 suspectscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411180183



On 11/15/2024 6:58 AM, Dmitry Baryshkov wrote:
> On Mon, Nov 11, 2024 at 04:49:32PM -0800, Melody Olvera wrote:
>> From: Jishnu Prakash <quic_jprakash@quicinc.com>
>>
>> Add descriptions of pmd8028 and pmih0108 PMICs used on SM8750
>> platforms.
> Up/lower case?

Up; will change.

>
>> Signed-off-by: Jishnu Prakash <quic_jprakash@quicinc.com>
>> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/pmd8028.dtsi  | 56 +++++++++++++++++++++++
>>   arch/arm64/boot/dts/qcom/pmih0108.dtsi | 62 ++++++++++++++++++++++++++
> Those two are independent changes. Please use two separate patches.

Sure thing. Will split.

>
>>   2 files changed, 118 insertions(+)
>>   create mode 100644 arch/arm64/boot/dts/qcom/pmd8028.dtsi
>>   create mode 100644 arch/arm64/boot/dts/qcom/pmih0108.dtsi
>>
>> diff --git a/arch/arm64/boot/dts/qcom/pmd8028.dtsi b/arch/arm64/boot/dts/qcom/pmd8028.dtsi
>> new file mode 100644
>> index 000000000000..f8ef8e133854
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/pmd8028.dtsi
>> @@ -0,0 +1,56 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#include <dt-bindings/interrupt-controller/irq.h>
>> +#include <dt-bindings/spmi/spmi.h>
>> +
>> +/ {
>> +	thermal-zones {
>> +		pmd8028-thermal {
>> +			polling-delay-passive = <100>;
>> +			thermal-sensors = <&pmd8028_temp_alarm>;
>> +
>> +			trips {
>> +				pmd8028_trip0: trip0 {
>> +					temperature = <95000>;
>> +					hysteresis = <0>;
>> +					type = "passive";
>> +				};
>> +
>> +				pmd8028_trip1: trip1 {
>> +					temperature = <115000>;
>> +					hysteresis = <0>;
>> +					type = "hot";
> "critical" ?

Will add.

>
>> +				};
>> +			};
>> +		};
>> +	};
>> +};
>> +
>> +&spmi_bus {
>> +	pmd8028: pmic@4 {
>> +		compatible = "qcom,pmd8028", "qcom,spmi-pmic";
>> +		reg = <0x4 SPMI_USID>;
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		pmd8028_temp_alarm: temp-alarm@a00 {
>> +			compatible = "qcom,spmi-temp-alarm";
>> +			reg = <0xa00>;
>> +			interrupts = <0x4 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
>> +			#thermal-sensor-cells = <0>;
>> +		};
>> +
>> +		pmd8028_gpios: gpio@8800 {
>> +			compatible = "qcom,pmd8028-gpio", "qcom,spmi-gpio";
>> +			reg = <0x8800>;
>> +			gpio-controller;
>> +			gpio-ranges = <&pmd8028_gpios 0 0 4>;
>> +			#gpio-cells = <2>;
>> +			interrupt-controller;
>> +			#interrupt-cells = <2>;
>> +		};
>> +	};
>> +};
>> diff --git a/arch/arm64/boot/dts/qcom/pmih0108.dtsi b/arch/arm64/boot/dts/qcom/pmih0108.dtsi
>> new file mode 100644
>> index 000000000000..3907d8fbcf78
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/pmih0108.dtsi
>> @@ -0,0 +1,62 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#include <dt-bindings/interrupt-controller/irq.h>
>> +#include <dt-bindings/spmi/spmi.h>
>> +
>> +/ {
>> +	thermal-zones {
>> +		pmih0108-thermal {
>> +			polling-delay-passive = <100>;
>> +			thermal-sensors = <&pmih0108_temp_alarm>;
>> +
>> +			trips {
>> +				trip0 {
>> +					temperature = <95000>;
>> +					hysteresis = <0>;
>> +					type = "passive";
>> +				};
>> +
>> +				trip1 {
>> +					temperature = <115000>;
>> +					hysteresis = <0>;
>> +					type = "hot";
> "critical" ?

Will add.

Thanks,
Melody

>
>> +				};
>> +			};
>> +		};
>> +	};
>> +};
>> +[...]

