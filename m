Return-Path: <linux-arm-msm+bounces-76377-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E04BC494D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 13:36:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA2993C149A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 11:36:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3530D19D8BC;
	Wed,  8 Oct 2025 11:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JcQD/p+g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9811E2F530A
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 11:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759923385; cv=none; b=WP9oK68AJd56QtNaXf1CSBnW5vrpxGRpm1EbGHunOSrJv3NhWiEaxFoVB93ZjeibD7XDtP7BZ/O8q4Km/5uNwdRXD6WhONWKTsxJNU1kd4DJ66+pJNq9ACZBx1/Gi/3jYb4zX7TChE84Mcuh2cFL8Y7hyLfW5vgcIL8pA10OHpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759923385; c=relaxed/simple;
	bh=d8nvVD0Lrzz8xGyOSn+Vk8t3qXF8g4hgi1Wn9FquDLA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nZqfw1o3BOiWWxtjuBRGI3SCqNuvrO/mV5HI2djmoBQqyNx/lUk6dICXyhkXZKD45QYJd/1gFCI1oqvrBEAiHdnC8Si6ZVPIvEycV9HGZja5Z5DUynoZSVDPJNiiqVU9VlJaIhyvEcPZu4rWN2deXXg3TLoc0aJbZ3oy/1++Tjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JcQD/p+g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890OUC028818
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Oct 2025 11:36:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BtcYEJ08q7Dg6a565Y3hlNvOCsaOLjl/pUWvA9l+JDI=; b=JcQD/p+g2w8e25qK
	qV+sGvFb15L2o4v/8oG6x5ymo7YYbULhdSkdYkdDphuEPgqlfieHulaiMIXDl7pK
	Yzww4cFU85Fqj9KW6TLURaUBPg1y0/dijC0Lw82c1lJR/FBUkRXEw3ZbGetXodFl
	2PVVcqSGvB2CDJkTzsomELjJuHDCUz7pEVi4dC4xDBVd30PgWWnpVD23ab2/fTyM
	PdLTvkRfY2GvDWoRh0hW8nJ2r95M/Qkr9TD6lg2vbPS0ahkMKTo+ChtiNQF+qQoJ
	Z/jLrxEogr1PMxuyMRmDEf0NOvZbTWIgrbwQyxKEKpsJ5WKBRWQjexDgN1Qth0UM
	X1SrpA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49js9e2eeb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 11:36:22 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-28e8d1d9b13so85356815ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 04:36:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759923382; x=1760528182;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BtcYEJ08q7Dg6a565Y3hlNvOCsaOLjl/pUWvA9l+JDI=;
        b=bcXEVWU2SR4IBdGIjRMYYWJfPNJ0KTrIrmHqRx1O3JttZS1D5IeoQlJ5RaX37uVWRE
         1O3Yv44hmvrzU5jbxWT/JwKusfgreJZg3xz5aBi4ggMjCqLUnjgH9bdwQfJQgRjDK67/
         DQrlQZoCEbeGA4ShyczzuCE27aKnax6geUfjWVvxK/mHtvl2jFYKSCi3L+XcTF3SFNju
         AyONRxH2nl9YWhRMTUPXkg2v+WN8NrV5QMhUwWqZCTYaxeEbfazehwGcDzlUw7bzDa1H
         VVPKswkKdeHN8zvUZcrVAdh/kMAOFAtNTjvNmvYQEa66jVC6egYmrKEqSFmpvUxKe7eG
         r9Fw==
X-Forwarded-Encrypted: i=1; AJvYcCViegML4VyC75qwe+HU+nPR+So8peK4TSLDDl1AhSabbE2XPsFTEgfAA5ZE1v4G3yYa2yJ3N4fNZ5zQNW+c@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6lOOrMcBtuyXIEyjFUoAplHcdqsDJHmOHP01+KpWNT1UY/Zn1
	g4bywK+nCObGO3ICsumnr3PXTU8/+akNJsm0tmt4mTJISFt8BYUMzgU+TRMjOZfgIvUUUz96hFs
	nFH1Duv5h6xahBZBlutEaIHdmkMLqu/cXKertNRBYYB1H8iylG/eSqtfWrVKBOzfPg3Aa
X-Gm-Gg: ASbGncsUQGcjsLxT3c+eYqdnJt5VLnDdc6aANu/28KvLOfNWJ5rSRtSJGRZlLe0RbkD
	p7tICs/77BGnUTtlA4o7NRQ83NXN7c69kemc+G0aVuppyWBy18sSR6rq5Xu0qVtDutRRtdNynIb
	1ONXSQJrlKiN+1P8b+R3p3rqmL3qAey6ADcdh3sw8Rf/omWQ6Na5YuoI5kqLEOrE5E5ogxOH/1T
	EQvAJ0mbr3R4IPwC9sqZHAYOLsQQxqHWrQyenYBE5d4stVDo/V2zkxZb+z2Nm4byOedOls7/UV/
	/OHKJSyA7OSDtAAaA33yU73CFIh1Z3z+WYprXp3pCtWV1Ipj+BQ0rwdGG5mBJDNIOqrY6bs5DJa
	bGJYJfWzGy1onRHkNN71qKPltMzZiqkzxyyGJj77N62VKaEbMFsY/D/iS1cT8EwI=
X-Received: by 2002:a17:902:f691:b0:259:5284:f87b with SMTP id d9443c01a7336-290272b2b34mr45883095ad.16.1759923381612;
        Wed, 08 Oct 2025 04:36:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbTVtqOX4lQ1G8PWLA7FGXm05LJZQiAOycqCzdxksUEtXbV27R1JLsm+R4apUwokgNrGMnbQ==
X-Received: by 2002:a17:902:f691:b0:259:5284:f87b with SMTP id d9443c01a7336-290272b2b34mr45882505ad.16.1759923380985;
        Wed, 08 Oct 2025 04:36:20 -0700 (PDT)
Received: from [10.79.195.127] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1260f0sm197687845ad.46.2025.10.08.04.36.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 04:36:20 -0700 (PDT)
Message-ID: <cdc7fa94-4cfa-4664-92a9-d89654f53d11@oss.qualcomm.com>
Date: Wed, 8 Oct 2025 17:06:16 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/24] arm64: dts: qcom: Introduce Glymur base dtsi and
 CRD dts
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v1-3-24b601bbecc0@oss.qualcomm.com>
 <p4ajadn2xytkt6hycm4te3sgxg3mern4uq7ce6bfpzgquer5ys@tcvcyuuk6lr2>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <p4ajadn2xytkt6hycm4te3sgxg3mern4uq7ce6bfpzgquer5ys@tcvcyuuk6lr2>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Hrl72kTS c=1 sm=1 tr=0 ts=68e64cb6 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=UueUnxlvPaCuvQdzJnAA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: Wmvw3lHhpV-knhdHE1yPlh_6nTE6SqJg
X-Proofpoint-ORIG-GUID: Wmvw3lHhpV-knhdHE1yPlh_6nTE6SqJg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAwNCBTYWx0ZWRfXxCnwI1V78Jpu
 xfdVwzrrkdQbNa3WpN3uuFjeateMPAudPUGoFb3lrb0WTEzW99S0aXO21ik7tFNuhVQCKLwkq+1
 mfHw3JSkRthW68lXKUtmcVvWbfKLtP7y69JHGWn9hpYeMcZ765gQxvD5IEBLKuL9NdfZdQ0XarB
 BYkHcoCFhf2ZLLCji7KNT0h5w4Be7oB319ha3B6Zl2p73oEmBKFxeYZlVW9wFDlKJZ1qMv0No/C
 WZC/8Lbi9QmNQ4LItLZt+04k/uRSknIRLRM7XbJdlYNc2VQQggjTdlKv+DxoY4bPCq2uxsH/YnF
 /4+maDuz7OB90FheDsx6wVLsA/pApn+j0ICHKEI4w9uVUUtJtMog40gcAkzV9pihpTxAFe1hvWq
 1rb2Z+QoK/ekjMbP+g2DcIXg44pVmw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040004

On 9/25/2025 11:14 PM, Dmitry Baryshkov wrote:
> On Thu, Sep 25, 2025 at 12:02:11PM +0530, Pankaj Patil wrote:
>> Introduce initial device tree support for Glymur - Qualcomm's
>> next-generation compute SoC and it's associated Compute Reference
>> Device (CRD) platform.
>>
>> The dt describes CPUs, CPU map, GCC and RPMHCC clock controllers,
>> geni UART, interrupt controller, TLMM, reserved memory,
>> interconnects, SMMU, firmware scm, watchdog, apps rsc, RPMHPD,
>> SRAM, PSCI and pmu nodes.
>>
>> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/Makefile       |    1 +
>>  arch/arm64/boot/dts/qcom/glymur-crd.dts |   25 +
>>  arch/arm64/boot/dts/qcom/glymur.dtsi    | 1320 +++++++++++++++++++++++++++++++
> I think it's usually two separate patches

Yes, for the next revision planning on separating patches
in a manner where this commit will have bare-bone board
dts so compilation doesn't break and singular commit
to the board dts which enables required functionality.

>>  3 files changed, 1346 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>> index 296688f7cb26550f75bce65826f234bc24110356..15f31a7d3ac4a60224c43cfa52e9cc17dc28c49f 100644
>> --- a/arch/arm64/boot/dts/qcom/Makefile
>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>> @@ -13,6 +13,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8039-t2.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= apq8094-sony-xperia-kitakami-karin_windy.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
>> +dtb-$(CONFIG_ARCH_QCOM)	+= glymur-crd.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-rdp432-c2.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-tplink-archer-ax55-v1.dtb
>> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..a1714ec8492961b211ec761f16b39245007533b8
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
>> @@ -0,0 +1,25 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +/dts-v1/;
>> +
>> +#include "glymur.dtsi"
>> +
>> +/ {
>> +	model = "Qualcomm Technologies, Inc. Glymur CRD";
>> +	compatible = "qcom,glymur-crd", "qcom,glymur";
>> +
>> +	aliases {
>> +		serial0 = &uart21;
>> +	};
>> +
>> +	chosen {
>> +		stdout-path = "serial0:115200n8";
>> +	};
>> +};
>> +
>> +&tlmm {
>> +	gpio-reserved-ranges = <4 4>, <10 2>, <44 4>; /*Security SPI (TPM)*/
>> +};
>> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..f1c5a0cb483670e9f8044e250950693b4a015479
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
>> @@ -0,0 +1,1320 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#include <dt-bindings/clock/qcom,glymur-gcc.h>
>> +#include <dt-bindings/clock/qcom,glymur-tcsr.h>
>> +#include <dt-bindings/clock/qcom,rpmh.h>
>> +#include <dt-bindings/dma/qcom-gpi.h>
>> +#include <dt-bindings/gpio/gpio.h>
>> +#include <dt-bindings/interconnect/qcom,icc.h>
>> +#include <dt-bindings/interconnect/qcom,glymur-rpmh.h>
>> +#include <dt-bindings/interrupt-controller/arm-gic.h>
>> +#include <dt-bindings/phy/phy-qcom-qmp.h>
>> +#include <dt-bindings/power/qcom-rpmpd.h>
>> +#include <dt-bindings/soc/qcom,rpmh-rsc.h>
>> +#include <dt-bindings/spmi/spmi.h>
>> +
>> +/ {
>> +	interrupt-parent = <&intc>;
>> +	#address-cells = <2>;
>> +	#size-cells = <2>;
>> +
>> +	chosen { };
>> +
>> +	clocks {
>> +		xo_board: xo-board {
>> +			compatible = "fixed-clock";
>> +			clock-frequency = <38400000>;
>> +			#clock-cells = <0>;
>> +		};
>> +
>> +		sleep_clk: sleep-clk {
>> +			compatible = "fixed-clock";
>> +			clock-frequency = <32000>;
> Can we please adapt a single style here? I think, at least frequency
> should go to the board file.

Sure, will do.

>> +			#clock-cells = <0>;
>> +		};
>> +	};
>> +


