Return-Path: <linux-arm-msm+bounces-44366-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 916F6A05B9B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 13:28:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 996603A7F05
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 12:27:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DE501F9F4C;
	Wed,  8 Jan 2025 12:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eZ50wbMk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536C41F941E;
	Wed,  8 Jan 2025 12:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736339242; cv=none; b=iFxuvzLAbam992tvysBbKgsJjGyfHICZa4EVVlrAvHRw2+OzjJut2p6E36yFkTvFD6r/DOqve25nfu4bpoL2Gj+mmf010u0SrJgvobNPL/Pwmrjr8ZOZApLd3VR3SDXB+EKzBWNmlPA9YMx+Qsn8RF6UKcJIG/2NMX/DOq+efms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736339242; c=relaxed/simple;
	bh=3VBHiDTAb6vvMnYoDXEgvlUPGyOH9ivLrqpp7r9n1aY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=T2P4T3bBOiTJz4PqRgVVfNSFDrUJ9zLdzIanQKdhB7m20RfOozXEnk37g/7/n6KmAiRJneVR9AFTABNgdECg8OlFAsnO07QKPtBogjMPTkTiuWDhC6RGN4ZZoe0ZQrIZD555QJ0jYak8+uYrQcmbNNescv/Ht6zCzBlB3rEmRlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eZ50wbMk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508BkZuf029524;
	Wed, 8 Jan 2025 12:27:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	27xnVZv24h0vhOm6tENaBm89VktjRLZfc/99J8JFAZ4=; b=eZ50wbMkyp+pX+4I
	/vu1ngwK3DOL8oxF1r9WFp7wmFVcLtQ0tt8WSvsrnQYwSomgUvKULDgISftrC0Bp
	kI4ZtZjh81/LLB0DSCVeEK4LwA+pw72Pb5oCZYbL2p++OwU0kGBuR0JF9LowsdVx
	Be/f9Ms/wTpXciZXQ0D2qze7cFu4PHkkq2XFQCsB1k7CdQadeA3Tsq5sUksCKmJw
	r3eFzQrbTJOv5wk4BMGAVCOgLCJaIpFSjeUvaZuWV9x6H/4uTseJ7CGgIlDtdrCZ
	1YzMpRyYWeKms24wvzBuu3pQP7339Ql4wgv6gcKusEQE7RmwDr5TNy4gEFpRBfYE
	Jkn+DA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 441ms8rshc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 12:27:16 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 508CRFY0004202
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 Jan 2025 12:27:15 GMT
Received: from [10.217.198.130] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 8 Jan 2025
 04:27:09 -0800
Message-ID: <07c41571-28ca-6f9e-bcee-899bbf77f687@quicinc.com>
Date: Wed, 8 Jan 2025 17:57:06 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5 6/6] arm64: dts: qcom: Enable cpu cooling devices for
 QCS9075 platforms
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Wasim Nazir <quic_wasimn@quicinc.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
References: <20241229152332.3068172-1-quic_wasimn@quicinc.com>
 <20241229152332.3068172-7-quic_wasimn@quicinc.com>
 <zn4uf3mmlmt3who474hwkr44poycfqtjtidshybbg55a3hr63y@zxefqbhiwkbg>
 <d54c6706-3c6b-211c-6acb-fa3984c30c67@quicinc.com>
 <ubasbsyspn5euygihgphyw3xg4ckveytvgnjpwdiyg4pv7degr@6y44ya4gvaqj>
From: Manaf Meethalavalappu Pallikunhi <quic_manafm@quicinc.com>
In-Reply-To: <ubasbsyspn5euygihgphyw3xg4ckveytvgnjpwdiyg4pv7degr@6y44ya4gvaqj>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: R571xw2Vt_CboVEaW4qi0o8thJxnpOmj
X-Proofpoint-GUID: R571xw2Vt_CboVEaW4qi0o8thJxnpOmj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=694 lowpriorityscore=0
 adultscore=0 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501080102


Hi Dmitry,


On 1/3/2025 11:21 AM, Dmitry Baryshkov wrote:
> On Tue, Dec 31, 2024 at 05:31:41PM +0530, Manaf Meethalavalappu Pallikunhi wrote:
>> Hi Dmitry,
>>
>> On 12/30/2024 9:10 PM, Dmitry Baryshkov wrote:
>>> On Sun, Dec 29, 2024 at 08:53:32PM +0530, Wasim Nazir wrote:
>>>> From: Manaf Meethalavalappu Pallikunhi <quic_manafm@quicinc.com>
>>>>
>>>> In QCS9100 SoC, the safety subsystem monitors all thermal sensors and
>>>> does corrective action for each subsystem based on sensor violation
>>>> to comply safety standards. But as QCS9075 is non-safe SoC it
>>>> requires conventional thermal mitigation to control thermal for
>>>> different subsystems.
>>>>
>>>> The cpu frequency throttling for different cpu tsens is enabled in
>>>> hardware as first defense for cpu thermal control. But QCS9075 SoC
>>>> has higher ambient specification. During high ambient condition, even
>>>> lowest frequency with multi cores can slowly build heat over the time
>>>> and it can lead to thermal run-away situations. This patch restrict
>>>> cpu cores during this scenario helps further thermal control and
>>>> avoids thermal critical violation.
>>>>
>>>> Add cpu idle injection cooling bindings for cpu tsens thermal zones
>>>> as a mitigation for cpu subsystem prior to thermal shutdown.
>>>>
>>>> Add cpu frequency cooling devices that will be used by userspace
>>>> thermal governor to mitigate skin thermal management.
>>> Does anything prevent us from having this config as a part of the basic
>>> sa8775p.dtsi setup? If HW is present in the base version but it is not
>>> accessible for whatever reason, please move it the base device config
>>> and use status "disabled" or "reserved" to the respective board files.
>> Sure,  I will move idle injection node for each cpu to sa8775p.dtsi and keep
>> it disabled state. #cooling cells property for CPU, still wanted to keep it
>> in board files as we don't want to enable any cooling device in base DT.
> "we don't want" is not a proper justification. So, no.

As noted in the commit, thermal cooling mitigation is only necessary for 
non-safe SoCs. Adding this cooling cell property to the CPU node in the 
base DT (sa8775p.dtsi), which is shared by both safe and non-safe SoCs, 
would violate the requirements for safe SoCs. Therefore, we will include 
it only in non-safe SoC boards.

Best Regards,

Manaf

>> Best Regards,
>>
>> Manaf
>>
>>>> Signed-off-by: Manaf Meethalavalappu Pallikunhi <quic_manafm@quicinc.com>
>>>> ---
>>>>    arch/arm64/boot/dts/qcom/qcs9075-rb8.dts      |   1 +
>>>>    arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts  |   1 +
>>>>    arch/arm64/boot/dts/qcom/qcs9075-ride.dts     |   1 +
>>>>    arch/arm64/boot/dts/qcom/qcs9075-thermal.dtsi | 287 ++++++++++++++++++
>>>>    4 files changed, 290 insertions(+)
>>>>    create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-thermal.dtsi
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/qcs9075-rb8.dts b/arch/arm64/boot/dts/qcom/qcs9075-rb8.dts
>>>> index ecaa383b6508..3ab6deeaacf1 100644
>>>> --- a/arch/arm64/boot/dts/qcom/qcs9075-rb8.dts
>>>> +++ b/arch/arm64/boot/dts/qcom/qcs9075-rb8.dts
>>>> @@ -9,6 +9,7 @@
>>>>
>>>>    #include "sa8775p.dtsi"
>>>>    #include "sa8775p-pmics.dtsi"
>>>> +#include "qcs9075-thermal.dtsi"
>>>>
>>>>    / {
>>>>    	model = "Qualcomm Technologies, Inc. Robotics RB8";
>>>> diff --git a/arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts b/arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts
>>>> index d9a8956d3a76..5f2d9f416617 100644
>>>> --- a/arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts
>>>> +++ b/arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts
>>>> @@ -5,6 +5,7 @@
>>>>    /dts-v1/;
>>>>
>>>>    #include "sa8775p-ride.dtsi"
>>>> +#include "qcs9075-thermal.dtsi"
>>>>
>>>>    / {
>>>>    	model = "Qualcomm Technologies, Inc. QCS9075 Ride Rev3";
>>>> diff --git a/arch/arm64/boot/dts/qcom/qcs9075-ride.dts b/arch/arm64/boot/dts/qcom/qcs9075-ride.dts
>>>> index 3b524359a72d..10ce48e7ba2f 100644
>>>> --- a/arch/arm64/boot/dts/qcom/qcs9075-ride.dts
>>>> +++ b/arch/arm64/boot/dts/qcom/qcs9075-ride.dts
>>>> @@ -5,6 +5,7 @@
>>>>    /dts-v1/;
>>>>
>>>>    #include "sa8775p-ride.dtsi"
>>>> +#include "qcs9075-thermal.dtsi"
>>>>
>>>>    / {
>>>>    	model = "Qualcomm Technologies, Inc. QCS9075 Ride";
>>>> diff --git a/arch/arm64/boot/dts/qcom/qcs9075-thermal.dtsi b/arch/arm64/boot/dts/qcom/qcs9075-thermal.dtsi
>>>> new file mode 100644
>>>> index 000000000000..40544c8582c4
>>>> --- /dev/null
>>>> +++ b/arch/arm64/boot/dts/qcom/qcs9075-thermal.dtsi
>>>> @@ -0,0 +1,287 @@
>>>> +// SPDX-License-Identifier: BSD-3-Clause
>>>> +/*
>>>> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>>>> + */
>>>> +
>>>> +#include <dt-bindings/thermal/thermal.h>
>>>> +
>>>> +&cpu0 {
>>>> +	#cooling-cells = <2>;
>>>> +};
>>>> +
>>>> +&cpu1 {
>>>> +	#cooling-cells = <2>;
>>>> +	cpu1_idle: thermal-idle {
>>>> +		#cooling-cells = <2>;
>>>> +		duration-us = <800000>;
>>>> +		exit-latency-us = <10000>;
>>>> +	};
>>>> +};
>>>> +
>>>> +&cpu2 {
>>>> +	#cooling-cells = <2>;
>>>> +	cpu2_idle: thermal-idle {
>>>> +		#cooling-cells = <2>;
>>>> +		duration-us = <800000>;
>>>> +		exit-latency-us = <10000>;
>>>> +	};
>>>> +};
>>>> +
>>>> +&cpu3 {
>>>> +	#cooling-cells = <2>;
>>>> +	cpu3_idle: thermal-idle {
>>>> +		#cooling-cells = <2>;
>>>> +		duration-us = <800000>;
>>>> +		exit-latency-us = <10000>;
>>>> +	};
>>>> +};
>>>> +
>>>> +&cpu4 {
>>>> +	#cooling-cells = <2>;
>>>> +	cpu4_idle: thermal-idle {
>>>> +		#cooling-cells = <2>;
>>>> +		duration-us = <800000>;
>>>> +		exit-latency-us = <10000>;
>>>> +	};
>>>> +};
>>>> +
>>>> +&cpu5 {
>>>> +	#cooling-cells = <2>;
>>>> +	cpu5_idle: thermal-idle {
>>>> +		#cooling-cells = <2>;
>>>> +		duration-us = <800000>;
>>>> +		exit-latency-us = <10000>;
>>>> +	};
>>>> +};
>>>> +
>>>> +&cpu6 {
>>>> +	#cooling-cells = <2>;
>>>> +	cpu6_idle: thermal-idle {
>>>> +		#cooling-cells = <2>;
>>>> +		duration-us = <800000>;
>>>> +		exit-latency-us = <10000>;
>>>> +	};
>>>> +};
>>>> +
>>>> +&cpu7 {
>>>> +	#cooling-cells = <2>;
>>>> +	cpu7_idle: thermal-idle {
>>>> +		#cooling-cells = <2>;
>>>> +		duration-us = <800000>;
>>>> +		exit-latency-us = <10000>;
>>>> +	};
>>>> +};
>>>> +
>>>> +/ {
>>>> +	thermal-zones {
>>>> +		cpu-0-1-0-thermal {
>>>> +			trips {
>>>> +				cpu_0_1_0_passive: trip-point1 {
>>>> +					temperature = <116000>;
>>>> +				};
>>>> +			};
>>>> +
>>>> +			cooling-maps {
>>>> +				map0 {
>>>> +					trip = <&cpu_0_1_0_passive>;
>>>> +					cooling-device = <&cpu1_idle 100 100>;
>>>> +				};
>>>> +			};
>>>> +		};
>>>> +
>>>> +		cpu-0-2-0-thermal {
>>>> +			trips {
>>>> +				cpu_0_2_0_passive: trip-point1 {
>>>> +					temperature = <116000>;
>>>> +				};
>>>> +			};
>>>> +
>>>> +			cooling-maps {
>>>> +				map0 {
>>>> +					trip = <&cpu_0_2_0_passive>;
>>>> +					cooling-device = <&cpu2_idle 100 100>;
>>>> +				};
>>>> +			};
>>>> +		};
>>>> +
>>>> +		cpu-0-3-0-thermal {
>>>> +			trips {
>>>> +				cpu_0_3_0_passive: trip-point1 {
>>>> +					temperature = <116000>;
>>>> +				};
>>>> +			};
>>>> +
>>>> +			cooling-maps {
>>>> +				map0 {
>>>> +					trip = <&cpu_0_3_0_passive>;
>>>> +					cooling-device = <&cpu3_idle 100 100>;
>>>> +				};
>>>> +			};
>>>> +		};
>>>> +
>>>> +		cpu-0-1-1-thermal {
>>>> +			trips {
>>>> +				cpu_0_1_1_passive: trip-point1 {
>>>> +					temperature = <116000>;
>>>> +				};
>>>> +			};
>>>> +
>>>> +			cooling-maps {
>>>> +				map0 {
>>>> +					trip = <&cpu_0_1_1_passive>;
>>>> +					cooling-device = <&cpu1_idle 100 100>;
>>>> +				};
>>>> +			};
>>>> +		};
>>>> +
>>>> +		cpu-0-2-1-thermal {
>>>> +			trips {
>>>> +				cpu_0_2_1_passive: trip-point1 {
>>>> +					temperature = <116000>;
>>>> +				};
>>>> +			};
>>>> +
>>>> +			cooling-maps {
>>>> +				map0 {
>>>> +					trip = <&cpu_0_2_1_passive>;
>>>> +					cooling-device = <&cpu2_idle 100 100>;
>>>> +				};
>>>> +			};
>>>> +		};
>>>> +
>>>> +		cpu-0-3-1-thermal {
>>>> +			trips {
>>>> +				cpu_0_3_1_passive: trip-point1 {
>>>> +					temperature = <116000>;
>>>> +				};
>>>> +			};
>>>> +
>>>> +			cooling-maps {
>>>> +				map0 {
>>>> +					trip = <&cpu_0_3_1_passive>;
>>>> +					cooling-device = <&cpu3_idle 100 100>;
>>>> +				};
>>>> +			};
>>>> +		};
>>>> +
>>>> +		cpu-1-0-0-thermal {
>>>> +			trips {
>>>> +				cpu_1_0_0_passive: trip-point1 {
>>>> +					temperature = <116000>;
>>>> +				};
>>>> +			};
>>>> +
>>>> +			cooling-maps {
>>>> +				map0 {
>>>> +					trip = <&cpu_1_0_0_passive>;
>>>> +					cooling-device = <&cpu4_idle 100 100>;
>>>> +				};
>>>> +			};
>>>> +		};
>>>> +
>>>> +		cpu-1-1-0-thermal {
>>>> +			trips {
>>>> +				cpu_1_1_0_passive: trip-point1 {
>>>> +					temperature = <116000>;
>>>> +				};
>>>> +			};
>>>> +
>>>> +			cooling-maps {
>>>> +				map0 {
>>>> +					trip = <&cpu_1_1_0_passive>;
>>>> +					cooling-device = <&cpu5_idle 100 100>;
>>>> +				};
>>>> +			};
>>>> +		};
>>>> +
>>>> +		cpu-1-2-0-thermal {
>>>> +			trips {
>>>> +				cpu_1_2_0_passive: trip-point1 {
>>>> +					temperature = <116000>;
>>>> +				};
>>>> +			};
>>>> +
>>>> +			cooling-maps {
>>>> +				map0 {
>>>> +					trip = <&cpu_1_2_0_passive>;
>>>> +					cooling-device = <&cpu6_idle 100 100>;
>>>> +				};
>>>> +			};
>>>> +		};
>>>> +
>>>> +		cpu-1-3-0-thermal {
>>>> +			trips {
>>>> +				cpu_1_3_0_passive: trip-point1 {
>>>> +					temperature = <116000>;
>>>> +				};
>>>> +			};
>>>> +
>>>> +			cooling-maps {
>>>> +				map0 {
>>>> +					trip = <&cpu_1_3_0_passive>;
>>>> +					cooling-device = <&cpu7_idle 100 100>;
>>>> +				};
>>>> +			};
>>>> +		};
>>>> +
>>>> +		cpu-1-0-1-thermal {
>>>> +			trips {
>>>> +				cpu_1_0_1_passive: trip-point1 {
>>>> +					temperature = <116000>;
>>>> +				};
>>>> +			};
>>>> +
>>>> +			cooling-maps {
>>>> +				map0 {
>>>> +					trip = <&cpu_1_0_1_passive>;
>>>> +					cooling-device = <&cpu4_idle 100 100>;
>>>> +				};
>>>> +			};
>>>> +		};
>>>> +
>>>> +		cpu-1-1-1-thermal {
>>>> +			trips {
>>>> +				cpu_1_1_1_passive: trip-point1 {
>>>> +					temperature = <116000>;
>>>> +				};
>>>> +			};
>>>> +
>>>> +			cooling-maps {
>>>> +				map0 {
>>>> +					trip = <&cpu_1_1_1_passive>;
>>>> +					cooling-device = <&cpu5_idle 100 100>;
>>>> +				};
>>>> +			};
>>>> +		};
>>>> +
>>>> +		cpu-1-2-1-thermal {
>>>> +			trips {
>>>> +				cpu_1_2_1_passive: trip-point1 {
>>>> +					temperature = <116000>;
>>>> +				};
>>>> +			};
>>>> +
>>>> +			cooling-maps {
>>>> +				map0 {
>>>> +					trip = <&cpu_1_2_1_passive>;
>>>> +					cooling-device = <&cpu6_idle 100 100>;
>>>> +				};
>>>> +			};
>>>> +		};
>>>> +
>>>> +		cpu-1-3-1-thermal {
>>>> +			trips {
>>>> +				cpu_1_3_1_passive: trip-point1 {
>>>> +					temperature = <116000>;
>>>> +				};
>>>> +			};
>>>> +
>>>> +			cooling-maps {
>>>> +				map0 {
>>>> +					trip = <&cpu_1_3_1_passive>;
>>>> +					cooling-device = <&cpu7_idle 100 100>;
>>>> +				};
>>>> +			};
>>>> +		};
>>>> +	};
>>>> +};
>>>> --
>>>> 2.47.0
>>>>

