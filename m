Return-Path: <linux-arm-msm+bounces-77176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BB316BD9174
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 13:47:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B2DD5189C050
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 11:47:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1972730FF30;
	Tue, 14 Oct 2025 11:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hXR9qzzd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0D930FF39
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 11:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760442401; cv=none; b=bKpLs01aMbvQCB3ctdbeyaEMxWZcI/VoSnJREGY/rFbtMF64TNrVQGXVZkVlPYz1OUHaVbwaqyJ3URKO31N0q67UehiV4P7cGRc9vJAdTyGzCZH5CxkDkvIf7kLZ0KQ4/mpI/LXnS7+cDejyLWj2xc0JihFVG9Aczu0R5qOFzIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760442401; c=relaxed/simple;
	bh=v9fkW5uhv3Bq5f8aUJJsCHd0K1tK+6hoZ18GpCD59ck=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Eo173qqN+Ycd7BfSYsaUY8Kg2I8LwkvMAcTCPhMuhDA4dcS5PG/QPyiIQwKlL4+pAgC19TTRIlgKh9Yo/la8ahhzgCJT2vD+O9yEf9HhDRV8vD/VSDRDb1h+r0FJCVucm2hPLDeZDliSKMyJpW31cAFrxQmO057PNF9wItznp/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hXR9qzzd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E87O9X016823
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 11:46:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oivhnnb4nkfztYZDS5PDtdywP+my+qklj3ZsVP8FSgE=; b=hXR9qzzdj7mjpcoH
	lT2pH6mvBMYlzV45pLNPr0NwaBHE5/FGDUj521ON1AlcnZF9cWzeIA+kHwhyWwEE
	AmqK8mVnoV4pt1euef5mW8Vng1FgZaNnJWPwARM0rX17WeZLJo4YMIDKhp0UsBE3
	tWe+NUlCRlNzkjCZ5v8KutTeoP+FMD4EoJOT4G4DlkXXPA4q7TcEcZtcYP0FLsDe
	XrHxcR1dMHPDIv7F1SsgaMgqFr3RCEZkJfxYqLVZHFR01j/yHEaQpmKhUrIEVx3M
	zxBtlqM+MtSbolrs18l3CC+Os3aj/ARE3+yiv5TBB5/cVVzKvK3y49Q1qi9SC2Xa
	qs7XYA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfd90dh6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 11:46:37 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-33274f8ff7cso12883638a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 04:46:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760442396; x=1761047196;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oivhnnb4nkfztYZDS5PDtdywP+my+qklj3ZsVP8FSgE=;
        b=p8usx42pPUNw9md3Kmxyh67abXMxXLkixQeczigyBe+7PmhgBPSUrlmDiuo124zU44
         PKf+a8qZDB+3KUtgH5lbct7aY8EeU7SQFgDuBRLUgI11De28qezgicetSjwY5lck4t7h
         H05AtDOjn9v2DqhUufqxpZ0TP11KHjRDMbDRmuqWq2hrD/70f++05wgkivk18Sx4oos2
         5CWyAvAlYjXqJYbufjnskG+RAp5ErcvdXesFuxE4ltjwlB39QSjNmlz44td+T5Sp1UM0
         KmgBQPWQ7lgD+YOKV5UPlCLDPxm5EasWf+RZuuESF7HrX0JU993xpfdZAK8PuiOkCIBx
         PoFg==
X-Gm-Message-State: AOJu0YwEHm1N/Vzq57M/cgpcaOxpacAwYlS/gcVueB5Tt9ffByS5Ngc6
	EfwFdf9bv17591arKl2it1PPuYIdaDoYKRFgGFrKFv34lJXDvZZybehA4t6XfrJcEgupmF9FtG6
	y+D7WzP9WUV5P5f6O0WLCeLna2iE+6fia7fW8a9ugDIyXUCSSO68EOtNJ/TwXhrIaN3RR
X-Gm-Gg: ASbGnct/8PSYeO05rGP+JrXTNbIg6iLnfkVi3Il411cOsHoxdRnvfvN46FcFRe3VhlS
	jVn5QBdoXUxIZskCeMlBodJNCiTPSm6/5rDhKQtw6EibEM9b8QnOwBY/ujuxAHbtEdyKciHvyIr
	I3N2evdCUP/MnSyuRn8MVxOMIMCtu8OdxVEXiL+AQ/u/ESz/b70E/mMvzV0Wqso75NejzW/y6d2
	NCXAa74TYoYQUX12raclcUQa3ICxHi1G/H7v71nPyDiWNwQIitMykMcyvL7mNZaP/+nU6jgvxTi
	T0VA0hTMQp2gWO80J3D1irg3mu98ETF6g2WqeTx6wb7oOv0ko3f3D2m8r/PTLmQ=
X-Received: by 2002:a17:90b:1806:b0:32d:db5b:7636 with SMTP id 98e67ed59e1d1-33b513cdaf5mr33209872a91.27.1760442396224;
        Tue, 14 Oct 2025 04:46:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMa1gWGdxijPQfNj32R2QyiYD/kOBw7ThQb+TrHfQQyoV2HEiKwHQCssxUVSzijXcuSK0lQw==
X-Received: by 2002:a17:90b:1806:b0:32d:db5b:7636 with SMTP id 98e67ed59e1d1-33b513cdaf5mr33209818a91.27.1760442395496;
        Tue, 14 Oct 2025 04:46:35 -0700 (PDT)
Received: from [192.168.1.11] ([106.222.233.7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b678ddce4b6sm12034946a12.13.2025.10.14.04.46.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 04:46:35 -0700 (PDT)
Message-ID: <36fcea98-06a6-4ca7-a378-77b44b196a9d@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 17:16:20 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 02/20] arm64: dts: qcom: Introduce Kaanapali SoC
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>
References: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
 <20250924-knp-dts-v1-2-3fdbc4b9e1b1@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250924-knp-dts-v1-2-3fdbc4b9e1b1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: AVQ5JsifLyTqVW_XER2445aACtjoOcCB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX/7XNMSpyCkb/
 Jln4OT5VUC8r1Kw9vnnFf89RGQ74EqxUeRAy35Y/szT7yjnU/RxUuZtksO8oySTvcL6Q29nG7af
 w0RWixfCcwnQxJoXgvZmZCEAP6e463kZWCEFwF52xlCutyuEXn0HALB4WGCyB+t0RHNR36nYPBk
 47emcL4DECniBv/mrPdNOrJf2YjlIdKhMwYLLhOqsL8WHd3eiNSVZucJkvd1ZWiVhZmJF1pw7DF
 okgRCVTOaYXrP0eQxUcymXNdEvLY0kt3r1+tiIV3OeMfRige9mNzLho/zxKAch6FNbz7G1SrvmD
 wwag4KtFb5/lky7Mn1h++KDhj//0wemNGjtCxYmspIbq6YUor7xu9hkdeaiasK667H8vnK6eb9+
 trpynyw+GLGfO6XIdF3NQLNp5Gp4sw==
X-Proofpoint-GUID: AVQ5JsifLyTqVW_XER2445aACtjoOcCB
X-Authority-Analysis: v=2.4 cv=PdTyRyhd c=1 sm=1 tr=0 ts=68ee381d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=szEYzjsxpj65ZCp1jDTQtw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=c8iQf86nXk1xPxuLPCIA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018



On 9/25/2025 5:47 AM, Jingyi Wang wrote:
> Kaanapali is Snapdragon SoC from Qualcomm.
> 
> Features added in this patch:
> - CPUs with PSCI idle states and cpufreq
> - Interrupt-controller with PDC wakeup support
> - Timers, TCSR Clock Controllers
> - Reserved Shared memory
> - GCC and RPMHCC
> - TLMM
> - Interconnect with CPU BWMONs
> - QuP with uart
> - SMMU
> - RPMHPD
> - UFS with Inline Crypto Engine
> - LLCC
> - Watchdog
> 
> Written with help from Raviteja Laggyshetty(added interconnect nodes),
> Taniya Das(added Clock Controllers and cpufreq), Jishnu Prakash
> (added rpmhpd), Nitin Rawat(added ufs) and Gaurav Kashyap(added ICE).
> 
> Co-developed-by: Tengfei Fan <tengfei.fan@oss.qualcomm.com>
> Signed-off-by: Tengfei Fan <tengfei.fan@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/kaanapali.dtsi | 1320 +++++++++++++++++++++++++++++++
>   1 file changed, 1320 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> new file mode 100644
> index 000000000000..b385b4642883
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> @@ -0,0 +1,1320 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <dt-bindings/clock/qcom,kaanapali-gcc.h>
> +#include <dt-bindings/clock/qcom,rpmh.h>
> +#include <dt-bindings/clock/qcom,sm8750-tcsr.h>
> +#include <dt-bindings/firmware/qcom,scm.h>
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interconnect/qcom,icc.h>
> +#include <dt-bindings/interconnect/qcom,kaanapali-rpmh.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/mailbox/qcom-ipcc.h>
> +#include <dt-bindings/power/qcom-rpmpd.h>
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +#include <dt-bindings/soc/qcom,rpmh-rsc.h>
> +
> +/ {
> +	interrupt-parent = <&intc>;
> +
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	cpus {
> +		#address-cells = <2>;
> +		#size-cells = <0>;
> +
> +		cpu0: cpu@0 {
> +			device_type = "cpu";
> +			compatible = "qcom,oryon";
> +			reg = <0x0 0x0>;
> +			enable-method = "psci";
> +			next-level-cache = <&l2_0>;
> +			power-domains = <&cpu_pd0>;
> +			power-domain-names = "psci";
> +			clocks = <&pdp_scmi_perf 0>;
> +
> +			l2_0: l2-cache {
> +				compatible = "cache";
> +				cache-level = <2>;
> +				cache-unified;
> +			};
> +		};
> +
> +		cpu1: cpu@100 {
> +			device_type = "cpu";
> +			compatible = "qcom,oryon";
> +			reg = <0x0 0x100>;
> +			enable-method = "psci";
> +			next-level-cache = <&l2_0>;
> +			power-domains = <&cpu_pd1>;
> +			power-domain-names = "psci";
> +			clocks = <&pdp_scmi_perf 0>;
> +		};
> +
> +		cpu2: cpu@200 {
> +			device_type = "cpu";
> +			compatible = "qcom,oryon";
> +			reg = <0x0 0x200>;
> +			enable-method = "psci";
> +			next-level-cache = <&l2_0>;
> +			power-domains = <&cpu_pd2>;
> +			power-domain-names = "psci";
> +			clocks = <&pdp_scmi_perf 0>;
> +		};
> +
> +		cpu3: cpu@300 {
> +			device_type = "cpu";
> +			compatible = "qcom,oryon";
> +			reg = <0x0 0x300>;
> +			enable-method = "psci";
> +			next-level-cache = <&l2_0>;
> +			power-domains = <&cpu_pd3>;
> +			power-domain-names = "psci";
> +			clocks = <&pdp_scmi_perf 0>;
> +		};
> +
> +		cpu4: cpu@400 {
> +			device_type = "cpu";
> +			compatible = "qcom,oryon";
> +			reg = <0x0 0x400>;
> +			enable-method = "psci";
> +			next-level-cache = <&l2_0>;
> +			power-domains = <&cpu_pd4>;
> +			power-domain-names = "psci";
> +			clocks = <&pdp_scmi_perf 0>;
> +		};
> +
> +		cpu5: cpu@500 {
> +			device_type = "cpu";
> +			compatible = "qcom,oryon";
> +			reg = <0x0 0x500>;
> +			enable-method = "psci";
> +			next-level-cache = <&l2_0>;
> +			power-domains = <&cpu_pd5>;
> +			power-domain-names = "psci";
> +			clocks = <&pdp_scmi_perf 0>;
> +		};
> +
> +		cpu6: cpu@10000 {
> +			device_type = "cpu";
> +			compatible = "qcom,oryon";
> +			reg = <0x0 0x10000>;
> +			enable-method = "psci";
> +			next-level-cache = <&l2_1>;
> +			power-domains = <&cpu_pd6>;
> +			power-domain-names = "psci";
> +			clocks = <&pdp_scmi_perf 1>;
> +
> +			l2_1: l2-cache {
> +				compatible = "cache";
> +				cache-level = <2>;
> +				cache-unified;
> +			};
> +		};
> +
> +		cpu7: cpu@10100 {
> +			device_type = "cpu";
> +			compatible = "qcom,oryon";
> +			reg = <0x0 0x10100>;
> +			enable-method = "psci";
> +			next-level-cache = <&l2_1>;
> +			power-domains = <&cpu_pd7>;
> +			power-domain-names = "psci";
> +			clocks = <&pdp_scmi_perf 1>;
> +		};
> +
> +		cpu-map {
> +			cluster0 {
> +				core0 {
> +					cpu = <&cpu0>;
> +				};
> +
> +				core1 {
> +					cpu = <&cpu1>;
> +				};
> +
> +				core2 {
> +					cpu = <&cpu2>;
> +				};
> +
> +				core3 {
> +					cpu = <&cpu3>;
> +				};
> +
> +				core4 {
> +					cpu = <&cpu4>;
> +				};
> +
> +				core5 {
> +					cpu = <&cpu5>;
> +				};
> +			};
> +
> +			cluster1 {
> +				core0 {
> +					cpu = <&cpu6>;
> +				};
> +
> +				core1 {
> +					cpu = <&cpu7>;
> +				};
> +			};
> +		};
> +
> +		idle-states {
> +			entry-method = "psci";
> +
> +			cluster0_c4: cpu-sleep-0 {
> +				compatible = "arm,idle-state";
> +				idle-state-name = "retention";
> +				arm,psci-suspend-param = <0x00000004>;
> +				entry-latency-us = <93>;
> +				exit-latency-us = <129>;
> +				min-residency-us = <560>;
> +			};
> +
> +			cluster1_c4: cpu-sleep-1 {
> +				compatible = "arm,idle-state";
> +				idle-state-name = "retention";
> +				arm,psci-suspend-param = <0x00000004>;
> +				entry-latency-us = <172>;
> +				exit-latency-us = <130>;
> +				min-residency-us = <686>;
> +			};
> +		};
> +
> +		domain-idle-states {
> +			cluster_cl5: cluster-sleep-0 {
> +				compatible = "domain-idle-state";
> +				arm,psci-suspend-param = <0x01000054>;
> +				entry-latency-us = <2150>;
> +				exit-latency-us = <1983>;
> +				min-residency-us = <9144>;
> +			};
> +
> +			domain_ss3: domain-sleep-0 {
> +				compatible = "domain-idle-state";
> +				arm,psci-suspend-param = <0x0200c354>;
> +				entry-latency-us = <2800>;
> +				exit-latency-us = <4400>;
> +				min-residency-us = <10150>;
> +			};
> +		};
> +	};
> +
> +	firmware {
> +		scm: scm {
> +			compatible = "qcom,scm-kaanapali", "qcom,scm";
> +			qcom,dload-mode = <&tcsr 0x19000>;
> +		};
> +
> +		scmi: scmi {
> +			compatible = "arm,scmi";
> +			mboxes = <&pdp0_mbox 0>, <&pdp0_mbox 1>;
> +			mbox-names = "tx", "rx";
> +			shmem = <&pdp_tx>, <&pdp_rx>;
> +
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			pdp_scmi_perf: protocol@13 {
> +				reg = <0x13>;
> +				#clock-cells = <1>;
> +			};
> +		};
> +	};
> +
> +	clk_virt: interconnect-0 {
> +		compatible = "qcom,kaanapali-clk-virt";
> +		#interconnect-cells = <2>;
> +		qcom,bcm-voters = <&apps_bcm_voter>;
> +	};
> +
> +	mc_virt: interconnect-1 {
> +		compatible = "qcom,kaanapali-mc-virt";
> +		#interconnect-cells = <2>;
> +		qcom,bcm-voters = <&apps_bcm_voter>;
> +	};
> +
> +	memory@a0000000 {
> +		device_type = "memory";
> +		/* We expect the bootloader to fill in the size */
> +		reg = <0x0 0xa0000000 0x0 0x0>;
> +	};
> +
> +	pmu {
> +		compatible = "arm,armv8-pmuv3";
> +		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +
> +	psci {
> +		compatible = "arm,psci-1.0";
> +		method = "smc";
> +
> +		cpu_pd0: power-domain-cpu0 {
> +			#power-domain-cells = <0>;
> +			power-domains = <&cluster_pd>;
> +			domain-idle-states = <&cluster0_c4>;
> +		};
> +
> +		cpu_pd1: power-domain-cpu1 {
> +			#power-domain-cells = <0>;
> +			power-domains = <&cluster_pd>;
> +			domain-idle-states = <&cluster0_c4>;
> +		};
> +
> +		cpu_pd2: power-domain-cpu2 {
> +			#power-domain-cells = <0>;
> +			power-domains = <&cluster_pd>;
> +			domain-idle-states = <&cluster0_c4>;
> +		};
> +
> +		cpu_pd3: power-domain-cpu3 {
> +			#power-domain-cells = <0>;
> +			power-domains = <&cluster_pd>;
> +			domain-idle-states = <&cluster0_c4>;
> +		};
> +
> +		cpu_pd4: power-domain-cpu4 {
> +			#power-domain-cells = <0>;
> +			power-domains = <&cluster_pd>;
> +			domain-idle-states = <&cluster0_c4>;
> +		};
> +
> +		cpu_pd5: power-domain-cpu5 {
> +			#power-domain-cells = <0>;
> +			power-domains = <&cluster_pd>;
> +			domain-idle-states = <&cluster0_c4>;
> +		};
> +
> +		cpu_pd6: power-domain-cpu6 {
> +			#power-domain-cells = <0>;
> +			power-domains = <&cluster_pd>;
> +			domain-idle-states = <&cluster1_c4>;
> +		};
> +
> +		cpu_pd7: power-domain-cpu7 {
> +			#power-domain-cells = <0>;
> +			power-domains = <&cluster_pd>;
> +			domain-idle-states = <&cluster1_c4>;
> +		};
> +
> +		cluster_pd: power-domain-cluster {
> +			#power-domain-cells = <0>;
> +			domain-idle-states = <&cluster_cl5>;
> +			power-domains = <&system_pd>;
> +		};
> +
> +		system_pd: power-domain-system {
> +			#power-domain-cells = <0>;
> +			domain-idle-states = <&domain_ss3>;
> +		};
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +

This is missing a bunch of reserved regions which causes device crash 
when you stress memory allocation.

-Akhil.

> +		pdp_mem: pdp_region@81300000 {
> +			reg = <0x0 0x81300000 0x0 0x100000>;
> +			no-map;
> +		};
> +
> +		aop_cmd_db_mem: aop-cmd-db@81c60000 {
> +			compatible = "qcom,cmd-db";
> +			reg = <0x0 0x81c60000 0x0 0x20000>;
> +			no-map;
> +		};
> +
> +		smem_mem: smem@81d00000 {
> +			compatible = "qcom,smem";
> +			reg = <0x0 0x81d00000 0x0 0x200000>;
> +			hwlocks = <&tcsr_mutex 3>;
> +			no-map;
> +		};
> +
> +		pdp_ns_shared_mem: pdp_ns_shared_region@81f00000 {
> +			reg = <0x0 0x81f00000 0x0 0x100000>;
> +			no-map;
> +		};
> +
> +		dsm_partition_1_mem: dsm-partition-1@84a00000 {
> +			reg = <0x0 0x84a00000 0x0 0x5500000>;
> +			no-map;
> +		};
> +
> +		dsm_partition_2_mem: dsm-partition-2@89f00000 {
> +			reg = <0x0 0x89f00000 0x0 0xa80000>;
> +			no-map;
> +		};
> +
> +		mpss_mem: mpss@8aa00000 {
> +			reg = <0x0 0x8aa00000 0x0 0xeb00000>;
> +			no-map;
> +		};
> +
> +		q6_mpss_dtb_mem: q6-mpss-dtb@99500000 {
> +			reg = <0x0 0x99500000 0x0 0x80000>;
> +			no-map;
> +		};
> +
> +		ipa_fw_mem: ipa-fw@99580000 {
> +			reg = <0x0 0x99580000 0x0 0x10000>;
> +			no-map;
> +		};
> +
> +		ipa_gsi_mem: ipa-gsi@99590000 {
> +			reg = <0x0 0x99590000 0x0 0xa000>;
> +			no-map;
> +		};
> +
> +		gpu_microcode_mem: gpu-microcode@9959a000 {
> +			reg = <0x0 0x9959a000 0x0 0x2000>;
> +			no-map;
> +		};
> +
> +		camera_mem: camera@99600000 {
> +			reg = <0x0 0x99600000 0x0 0x800000>;
> +			no-map;
> +		};
> +
> +		camera_2_mem: camera-2@99e00000 {
> +			reg = <0x0 0x99e00000 0x0 0x800000>;
> +			no-map;
> +		};
> +
> +		video_mem: video@9a600000 {
> +			reg = <0x0 0x9a600000 0x0 0x800000>;
> +			no-map;
> +		};
> +
> +		cvp_mem: cvp@9ae00000 {
> +			reg = <0x0 0x9ae00000 0x0 0x700000>;
> +			no-map;
> +		};
> +
> +		cdsp_mem: cdsp@9b500000 {
> +			reg = <0x0 0x9b500000 0x0 0x1900000>;
> +			no-map;
> +		};
> +
> +		q6_cdsp_dtb_mem: q6-cdsp-dtb@9ce00000 {
> +			reg = <0x0 0x9ce00000 0x0 0x80000>;
> +			no-map;
> +		};
> +
> +		soccp_mem: soccp@a03d0000 {
> +			reg = <0x0 0xa03d0000 0x0 0x500000>;
> +			no-map;
> +		};
> +
> +		soccp_dtb_mem: soccp-dtb@a08d0000 {
> +			reg = <0x0 0xa08d0000 0x0 0x40000>;
> +			no-map;
> +		};
> +
> +		q6_adsp_dtb_mem: q6-adsp-dtb@a1380000 {
> +			reg = <0x0 0xa1380000 0x0 0x80000>;
> +			no-map;
> +		};
> +
> +		adspslpi_mem: adspslpi@a1400000 {
> +			reg = <0x0 0xa1400000 0x0 0x4c00000>;
> +			no-map;
> +		};
> +
> +		rmtfs_mem: rmtfs@d7c00000 {
> +			compatible = "qcom,rmtfs-mem";
> +			reg = <0 0xd7c00000 0 0x400000>;
> +			no-map;
> +
> +			qcom,client-id = <1>;
> +			qcom,vmid = <QCOM_SCM_VMID_MSS_MSA>;
> +		};
> +	};
> +
> +	soc: soc@0 {
> +		compatible = "simple-bus";
> +
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		dma-ranges = <0 0 0 0 0x10 0>;
> +		ranges = <0 0 0 0 0x10 0>;
> +
> +		gcc: clock-controller@100000 {
> +			compatible = "qcom,kaanapali-gcc";
> +			reg = <0x0 0x00100000 0x0 0x1f4200>;
> +
> +			clocks = <&bi_tcxo_div2>,
> +				 <0>,
> +				 <&sleep_clk>,
> +				 <0>,
> +				 <0>,
> +				 <0>,
> +				 <0>,
> +				 <0>;
> +
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		qupv3_1: geniqup@ac0000 {
> +			compatible = "qcom,geni-se-qup";
> +			reg = <0x0 0x00ac0000 0x0 0x2000>;
> +
> +			clocks = <&gcc GCC_QUPV3_WRAP_1_M_AXI_CLK>,
> +				 <&gcc GCC_QUPV3_WRAP_1_S_AHB_CLK>;
> +			clock-names = "m-ahb",
> +				      "s-ahb";
> +
> +			iommus = <&apps_smmu 0xa3 0x0>;
> +
> +			dma-coherent;
> +
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +
> +			uart7: serial@a9c000 {
> +				compatible = "qcom,geni-debug-uart";
> +				reg = <0x0 0x00a9c000 0x0 0x4000>;
> +
> +				interrupts = <GIC_SPI 835 IRQ_TYPE_LEVEL_HIGH>;
> +
> +				clocks = <&gcc GCC_QUPV3_WRAP1_S7_CLK>;
> +				clock-names = "se";
> +
> +				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
> +						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
> +						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>;
> +				interconnect-names = "qup-core",
> +						     "qup-config";
> +
> +				pinctrl-0 = <&qup_uart7_default>;
> +				pinctrl-names = "default";
> +
> +				status = "disabled";
> +			};
> +		};
> +
> +		ipcc: mailbox@1106000 {
> +			compatible = "qcom,kaanapali-ipcc", "qcom,ipcc";
> +			reg = <0x0 0x01106000 0x0 0x1000>;
> +
> +			interrupts = <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-controller;
> +			#interrupt-cells = <3>;
> +
> +			#mbox-cells = <2>;
> +		};
> +
> +		cnoc_main: interconnect@1500000 {
> +			compatible = "qcom,kaanapali-cnoc-main";
> +			reg = <0x0 0x01500000 0x0 0x1a080>;
> +			qcom,bcm-voters = <&apps_bcm_voter>;
> +			#interconnect-cells = <2>;
> +		};
> +
> +		config_noc: interconnect@1600000 {
> +			compatible = "qcom,kaanapali-cnoc-cfg";
> +			reg = <0x0 0x01600000 0x0 0x6200>;
> +			qcom,bcm-voters = <&apps_bcm_voter>;
> +			#interconnect-cells = <2>;
> +		};
> +
> +		system_noc: interconnect@1680000 {
> +			compatible = "qcom,kaanapali-system-noc";
> +			reg = <0x0 0x01680000 0x0 0x1f080>;
> +			qcom,bcm-voters = <&apps_bcm_voter>;
> +			#interconnect-cells = <2>;
> +		};
> +
> +		pcie_noc: interconnect@16c0000 {
> +			compatible = "qcom,kaanapali-pcie-anoc";
> +			reg = <0x0 0x016c0000 0x0 0x11400>;
> +			qcom,bcm-voters = <&apps_bcm_voter>;
> +			#interconnect-cells = <2>;
> +			clocks = <&gcc GCC_AGGRE_NOC_PCIE_AXI_CLK>,
> +				 <&gcc GCC_CFG_NOC_PCIE_ANOC_AHB_CLK>;
> +		};
> +
> +		aggre_noc: interconnect@16e0000 {
> +			compatible = "qcom,kaanapali-aggre-noc";
> +			reg = <0x0 0x016e0000 0x0 0x42400>;
> +			qcom,bcm-voters = <&apps_bcm_voter>;
> +			#interconnect-cells = <2>;
> +			clocks = <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
> +				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
> +				 <&rpmhcc RPMH_IPA_CLK>;
> +		};
> +
> +		mmss_noc: interconnect@1780000 {
> +			compatible = "qcom,kaanapali-mmss-noc";
> +			reg = <0x0 0x01780000 0x0 0x5b800>;
> +			qcom,bcm-voters = <&apps_bcm_voter>;
> +			#interconnect-cells = <2>;
> +		};
> +
> +		ufs_mem_phy: phy@1d80000 {
> +			compatible = "qcom,kaanapali-qmp-ufs-phy", "qcom,sm8750-qmp-ufs-phy";
> +			reg = <0x0 0x01d80000 0x0 0x2000>;
> +
> +			clocks = <&rpmhcc RPMH_CXO_CLK>,
> +				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
> +				 <&tcsrcc TCSR_UFS_CLKREF_EN>;
> +
> +			clock-names = "ref",
> +				      "ref_aux",
> +				      "qref";
> +
> +			resets = <&ufs_mem_hc 0>;
> +			reset-names = "ufsphy";
> +
> +			power-domains = <&gcc GCC_UFS_MEM_PHY_GDSC>;
> +
> +			#clock-cells = <1>;
> +			#phy-cells = <0>;
> +
> +			status = "disabled";
> +		};
> +
> +		ufs_mem_hc: ufs@1d84000 {
> +			compatible = "qcom,kaanapali-ufshc",
> +				     "qcom,ufshc",
> +				     "jedec,ufs-2.0";
> +			reg = <0x0 0x01d84000 0x0 0x3000>;
> +
> +			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			clocks = <&gcc GCC_UFS_PHY_AXI_CLK>,
> +				 <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
> +				 <&gcc GCC_UFS_PHY_AHB_CLK>,
> +				 <&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
> +				 <&rpmhcc RPMH_LN_BB_CLK3>,
> +				 <&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
> +				 <&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
> +				 <&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
> +			clock-names = "core_clk",
> +				      "bus_aggr_clk",
> +				      "iface_clk",
> +				      "core_clk_unipro",
> +				      "ref_clk",
> +				      "tx_lane0_sync_clk",
> +				      "rx_lane0_sync_clk",
> +				      "rx_lane1_sync_clk";
> +
> +			operating-points-v2 = <&ufs_opp_table>;
> +
> +			resets = <&gcc GCC_UFS_PHY_BCR>;
> +			reset-names = "rst";
> +
> +			interconnects = <&aggre_noc MASTER_UFS_MEM QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &config_noc SLAVE_UFS_MEM_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
> +			interconnect-names = "ufs-ddr",
> +					     "cpu-ufs";
> +
> +			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
> +			required-opps = <&rpmhpd_opp_nom>;
> +
> +			iommus = <&apps_smmu 0x60 0x0>;
> +			dma-coherent;
> +
> +			lanes-per-direction = <2>;
> +			qcom,ice = <&ice>;
> +
> +			phys = <&ufs_mem_phy>;
> +			phy-names = "ufsphy";
> +
> +			#reset-cells = <1>;
> +
> +			status = "disabled";
> +
> +			ufs_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-75000000 {
> +					opp-hz = /bits/ 64 <75000000>,
> +						 /bits/ 64 <0>,
> +						 /bits/ 64 <0>,
> +						 /bits/ 64 <75000000>,
> +						 /bits/ 64 <0>,
> +						 /bits/ 64 <0>,
> +						 /bits/ 64 <0>,
> +						 /bits/ 64 <0>;
> +					required-opps = <&rpmhpd_opp_low_svs_d1>;
> +				};
> +
> +				opp-100000000 {
> +					opp-hz = /bits/ 64 <100000000>,
> +						 /bits/ 64 <0>,
> +						 /bits/ 64 <0>,
> +						 /bits/ 64 <100000000>,
> +						 /bits/ 64 <0>,
> +						 /bits/ 64 <0>,
> +						 /bits/ 64 <0>,
> +						 /bits/ 64 <0>;
> +					required-opps = <&rpmhpd_opp_low_svs>;
> +				};
> +
> +				opp-403000000 {
> +					opp-hz = /bits/ 64 <403000000>,
> +						 /bits/ 64 <0>,
> +						 /bits/ 64 <0>,
> +						 /bits/ 64 <403000000>,
> +						 /bits/ 64 <0>,
> +						 /bits/ 64 <0>,
> +						 /bits/ 64 <0>,
> +						 /bits/ 64 <0>;
> +					required-opps = <&rpmhpd_opp_nom>;
> +				};
> +			};
> +		};
> +
> +		ice: crypto@1d88000 {
> +			compatible = "qcom,kaanapali-inline-crypto-engine",
> +				     "qcom,inline-crypto-engine";
> +			reg = <0x0 0x01d88000 0x0 0x18000>;
> +
> +			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
> +		};
> +
> +		tcsr_mutex: hwlock@1f40000 {
> +			compatible = "qcom,tcsr-mutex";
> +			reg = <0x0 0x01f40000 0x0 0x20000>;
> +			#hwlock-cells = <1>;
> +		};
> +
> +		tcsr: syscon@1fc0000 {
> +			compatible = "qcom,tcsr-kaanapali", "syscon";
> +			reg = <0x0 0x1fc0000 0x0 0x30000>;
> +		};
> +
> +		tcsrcc: clock-controller@1fd5044 {
> +			compatible = "qcom,kaanapali-tcsr", "syscon";
> +			reg = <0x0 0x01fd5044 0x0 0x1c>;
> +
> +			clocks = <&rpmhcc RPMH_CXO_CLK>;
> +
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +		};
> +
> +		lpass_lpiaon_noc: interconnect@7400000 {
> +			compatible = "qcom,kaanapali-lpass-lpiaon-noc";
> +			reg = <0x0 0x07400000 0x0 0x19080>;
> +			qcom,bcm-voters = <&apps_bcm_voter>;
> +			#interconnect-cells = <2>;
> +		};
> +
> +		lpass_lpicx_noc: interconnect@7420000 {
> +			compatible = "qcom,kaanapali-lpass-lpicx-noc";
> +			reg = <0x0 0x07420000 0x0 0x44080>;
> +			qcom,bcm-voters = <&apps_bcm_voter>;
> +			#interconnect-cells = <2>;
> +		};
> +
> +		lpass_ag_noc: interconnect@7f40000 {
> +			compatible = "qcom,kaanapali-lpass-ag-noc";
> +			reg = <0x0 0x07f40000 0x0 0xe080>;
> +			qcom,bcm-voters = <&apps_bcm_voter>;
> +			#interconnect-cells = <2>;
> +		};
> +
> +		pdc: interrupt-controller@b220000 {
> +			compatible = "qcom,kaanapali-pdc", "qcom,pdc";
> +			reg = <0x0 0x0b220000 0x0 0x10000>,
> +			      <0x0 0x179600f0 0x0 0xf4>;
> +
> +			qcom,pdc-ranges = <0 745 38>,
> +					  <40 785 11>,
> +					  <51 527 4>,
> +					  <58 534 2>,
> +					  <61 537 20>,
> +					  <84 559 14>,
> +					  <98 609 32>,
> +					  <130 717 12>,
> +					  <142 251 5>,
> +					  <147 796 16>,
> +					  <163 783 2>,
> +					  <165 531 2>,
> +					  <167 536 1>,
> +					  <168 557 2>,
> +					  <170 415 1>,
> +					  <171 438 1>,
> +					  <172 579 1>,
> +					  <173 703 1>,
> +					  <174 708 1>,
> +					  <175 714 1>,
> +					  <176 68 1>,
> +					  <177 86 1>,
> +					  <178 96 1>,
> +					  <179 249 1>;
> +			#interrupt-cells = <2>;
> +			interrupt-parent = <&intc>;
> +			interrupt-controller;
> +		};
> +
> +		aoss_qmp: power-management@c300000 {
> +			compatible = "qcom,kaanapali-aoss-qmp", "qcom,aoss-qmp";
> +			reg = <0x0 0x0c300000 0x0 0x400>;
> +
> +			interrupts-extended = <&ipcc IPCC_MPROC_AOP
> +						     IPCC_MPROC_SIGNAL_GLINK_QMP
> +						     IRQ_TYPE_EDGE_RISING>;
> +
> +			mboxes = <&ipcc IPCC_MPROC_AOP
> +					IPCC_MPROC_SIGNAL_GLINK_QMP>;
> +
> +			#clock-cells = <0>;
> +		};
> +
> +		tlmm: pinctrl@f100000 {
> +			compatible = "qcom,kaanapali-tlmm";
> +			reg = <0x0 0x0f100000 0x0 0x300000>;
> +			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			gpio-ranges = <&tlmm 0 0 218>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +			wakeup-parent = <&pdc>;
> +
> +			qup_uart7_default: qup-uart7-state {
> +				 /* TX, RX */
> +				 pins = "gpio62", "gpio63";
> +				 function = "qup1_se7";
> +				 drive-strength = <2>;
> +				 bias-disable;
> +			};
> +		};
> +
> +		sram@14680000 {
> +			compatible = "qcom,kaanapali-imem", "syscon", "simple-mfd";
> +			reg = <0x0 0x14680000 0x0 0x1000>;
> +			ranges = <0 0 0x14680000 0x1000>;
> +
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			pil-reloc@94c {
> +				compatible = "qcom,pil-reloc-info";
> +				reg = <0x94c 0xc8>;
> +			};
> +		};
> +
> +		apps_smmu: iommu@15000000 {
> +			compatible = "qcom,kaanapali-smmu-500", "qcom,smmu-500", "arm,mmu-500";
> +			reg = <0x0 0x15000000 0x0 0x100000>;
> +
> +			interrupts =<GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 182 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 185 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 319 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 336 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 396 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 398 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 399 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 401 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 402 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 404 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 405 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 407 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 408 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 409 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 418 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 412 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 707 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 690 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 691 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 692 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 693 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 694 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 695 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 696 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 697 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 410 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 488 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 489 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 490 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 491 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 492 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 493 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 494 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 495 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 496 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 497 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 498 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 499 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 500 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 501 IRQ_TYPE_LEVEL_HIGH>,
> +				    <GIC_SPI 502 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			#iommu-cells = <2>;
> +			#global-interrupts = <1>;
> +
> +			dma-coherent;
> +		};
> +
> +		intc: interrupt-controller@17000000 {
> +			compatible = "arm,gic-v3";
> +			reg = <0x0 0x17000000 0x0 0x10000>,
> +			      <0x0 0x17080000 0x0 0x200000>;
> +
> +			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			#interrupt-cells = <3>;
> +			interrupt-controller;
> +
> +			#redistributor-regions = <1>;
> +			redistributor-stride = <0x0 0x40000>;
> +
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +
> +			gic_its: msi-controller@17040000 {
> +				compatible = "arm,gic-v3-its";
> +				reg = <0x0 0x17040000 0x0 0x20000>;
> +
> +				msi-controller;
> +				#msi-cells = <1>;
> +			};
> +		};
> +
> +		watchdog@17600000 {
> +			compatible = "qcom,apss-wdt-kaanapali", "qcom,kpss-wdt";
> +			reg = <0x0 0x17600000 0x0 0x1000>;
> +			clocks = <&sleep_clk>;
> +			interrupts = <GIC_SPI 0 IRQ_TYPE_EDGE_RISING>;
> +		};
> +
> +		pdp0_mbox: mailbox@17610000 {
> +			compatible = "qcom,kaanapali-cpucp-mbox", "qcom,x1e80100-cpucp-mbox";
> +			reg = <0 0x17610000 0 0x8000>, <0 0x19980000 0 0x8000>;
> +			interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
> +			#mbox-cells = <1>;
> +		};
> +
> +		timer@17810000 {
> +			compatible = "arm,armv7-timer-mem";
> +			reg = <0x0 0x17810000 0x0 0x1000>;
> +
> +			#address-cells = <2>;
> +			#size-cells = <1>;
> +			ranges = <0 0 0 0 0x20000000>;
> +
> +			frame@17811000 {
> +				reg = <0x0 0x17811000 0x1000>,
> +				      <0x0 0x17812000 0x1000>;
> +				frame-number = <0>;
> +				interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
> +			};
> +
> +			frame@17813000 {
> +				reg = <0x0 0x17813000 0x1000>;
> +				frame-number = <1>;
> +				interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +				status = "disabled";
> +			};
> +
> +			frame@17815000 {
> +				reg = <0x0 0x17815000 0x1000>;
> +				frame-number = <2>;
> +				interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
> +				status = "disabled";
> +			};
> +
> +			frame@17817000 {
> +				reg = <0x0 0x17817000 0x1000>;
> +				frame-number = <3>;
> +				interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
> +				status = "disabled";
> +			};
> +
> +			frame@17819000 {
> +				reg = <0x0 0x17819000 0x1000>;
> +				frame-number = <4>;
> +				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
> +				status = "disabled";
> +			};
> +
> +			frame@1781b000 {
> +				reg = <0x0 0x1781b000 0x1000>;
> +				frame-number = <5>;
> +				interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
> +				status = "disabled";
> +			};
> +
> +			frame@1781d000 {
> +				reg = <0x0 0x1781d000 0x1000>;
> +				frame-number = <6>;
> +				interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
> +				status = "disabled";
> +			};
> +		};
> +
> +		apps_rsc: rsc@18900000 {
> +			compatible = "qcom,rpmh-rsc";
> +			reg = <0x0 0x18900000 0x0 0x10000>,
> +			      <0x0 0x18910000 0x0 0x10000>,
> +			      <0x0 0x18920000 0x0 0x10000>;
> +			reg-names = "drv-0",
> +				    "drv-1",
> +				    "drv-2";
> +			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			power-domains = <&system_pd>;
> +			label = "apps_rsc";
> +
> +			qcom,tcs-offset = <0xd00>;
> +			qcom,drv-id = <2>;
> +			qcom,tcs-config = <ACTIVE_TCS 3>,
> +					  <SLEEP_TCS 2>,
> +					  <WAKE_TCS 2>,
> +					  <CONTROL_TCS 0>;
> +
> +			apps_bcm_voter: bcm-voter {
> +				compatible = "qcom,bcm-voter";
> +			};
> +
> +			rpmhcc: clock-controller {
> +				compatible = "qcom,kaanapali-rpmh-clk";
> +				#clock-cells = <1>;
> +				clocks = <&xo_board>;
> +				clock-names = "xo";
> +			};
> +
> +			rpmhpd: power-controller {
> +				compatible = "qcom,kaanapali-rpmhpd";
> +
> +				operating-points-v2 = <&rpmhpd_opp_table>;
> +
> +				#power-domain-cells = <1>;
> +
> +				rpmhpd_opp_table: opp-table {
> +					compatible = "operating-points-v2";
> +
> +					rpmhpd_opp_ret: opp-16 {
> +						opp-level = <RPMH_REGULATOR_LEVEL_RETENTION>;
> +					};
> +
> +					rpmhpd_opp_low_svs_d3: opp-50 {
> +						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D3>;
> +					};
> +
> +					rpmhpd_opp_low_svs_d2_1: opp-51 {
> +						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D2_1>;
> +					};
> +
> +					rpmhpd_opp_low_svs_d2: opp-52 {
> +						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D2>;
> +					};
> +
> +					rpmhpd_opp_low_svs_d1_1: opp-54 {
> +						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1_1>;
> +					};
> +
> +					rpmhpd_opp_low_svs_d1: opp-56 {
> +						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
> +					};
> +
> +					rpmhpd_opp_low_svs_d0: opp-60 {
> +						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D0>;
> +					};
> +
> +					rpmhpd_opp_low_svs: opp-64 {
> +						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
> +					};
> +
> +					rpmhpd_opp_low_svs_l0: opp-76 {
> +						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_L0>;
> +					};
> +
> +					rpmhpd_opp_low_svs_l1: opp-80 {
> +						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_L1>;
> +					};
> +
> +					rpmhpd_opp_low_svs_l2: opp-96 {
> +						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_L2>;
> +					};
> +
> +					rpmhpd_opp_svs: opp-128 {
> +						opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
> +					};
> +
> +					rpmhpd_opp_svs_l0: opp-144 {
> +						opp-level = <RPMH_REGULATOR_LEVEL_SVS_L0>;
> +					};
> +
> +					rpmhpd_opp_svs_l1: opp-192 {
> +						opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
> +					};
> +
> +					rpmhpd_opp_svs_l2: opp-224 {
> +						opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
> +					};
> +
> +					rpmhpd_opp_nom: opp-256 {
> +						opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
> +					};
> +
> +					rpmhpd_opp_nom_l1: opp-320 {
> +						opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
> +					};
> +
> +					rpmhpd_opp_nom_l2: opp-336 {
> +						opp-level = <RPMH_REGULATOR_LEVEL_NOM_L2>;
> +					};
> +
> +					rpmhpd_opp_turbo: opp-384 {
> +						opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
> +					};
> +
> +					rpmhpd_opp_turbo_l0: opp-400 {
> +						opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L0>;
> +					};
> +
> +					rpmhpd_opp_turbo_l1: opp-416 {
> +						opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
> +					};
> +
> +					rpmhpd_opp_turbo_l2: opp-432 {
> +						opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L2>;
> +					};
> +
> +					rpmhpd_opp_turbo_l3: opp-448 {
> +						opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L3>;
> +					};
> +
> +					rpmhpd_opp_turbo_l4: opp-452 {
> +						opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L4>;
> +					};
> +
> +					rpmhpd_opp_turbo_l5: opp-456 {
> +						opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L5>;
> +					};
> +
> +					rpmhpd_opp_super_turbo_no_cpr: opp-480 {
> +						opp-level = <RPMH_REGULATOR_LEVEL_SUPER_TURBO_NO_CPR>;
> +					};
> +				};
> +			};
> +		};
> +
> +		nsp_noc: interconnect@260c0000 {
> +			compatible = "qcom,kaanapali-nsp-noc";
> +			reg = <0x0 0x260c0000 0x0 0x21280>;
> +			qcom,bcm-voters = <&apps_bcm_voter>;
> +			#interconnect-cells = <2>;
> +		};
> +
> +		/* Cluster 0 */
> +		pmu@310b3400  {
> +			compatible = "qcom,kaanapali-cpu-bwmon", "qcom,sdm845-bwmon";
> +			reg = <0x0 0x310b3400 0x0 0x600>;
> +
> +			interrupts = <GIC_SPI 581 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>;
> +
> +			operating-points-v2 = <&cpu_bwmon_opp_table>;
> +
> +			cpu_bwmon_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-0 {
> +					opp-peak-kBps = <2188000>;
> +				};
> +
> +				opp-1 {
> +					opp-peak-kBps = <5412000>;
> +				};
> +
> +				opp-2 {
> +					opp-peak-kBps = <6220000>;
> +				};
> +
> +				opp-3 {
> +					opp-peak-kBps = <6832000>;
> +				};
> +
> +				opp-4 {
> +					opp-peak-kBps = <8368000>;
> +				};
> +
> +				opp-5 {
> +					opp-peak-kBps = <10944000>;
> +				};
> +
> +				opp-6 {
> +					opp-peak-kBps = <12748000>;
> +				};
> +
> +				opp-7 {
> +					opp-peak-kBps = <14744000>;
> +				};
> +
> +				opp-8 {
> +					opp-peak-kBps = <16896000>;
> +				};
> +
> +				opp-9 {
> +					opp-peak-kBps = <19120000>;
> +				};
> +
> +				opp-10 {
> +					opp-peak-kBps = <21332000>;
> +				};
> +			};
> +		};
> +
> +		/* Cluster 1 */
> +		pmu@310b7400  {
> +			compatible = "qcom,kaanapali-cpu-bwmon", "qcom,sdm845-bwmon";
> +			reg = <0x0 0x310b7400 0x0 0x600>;
> +
> +			interrupts = <GIC_SPI 581 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>;
> +
> +			operating-points-v2 = <&cpu_bwmon_opp_table>;
> +		};
> +
> +		gem_noc: interconnect@31100000 {
> +			compatible = "qcom,kaanapali-gem-noc";
> +			reg = <0x0 0x31100000 0x0 0x153080>;
> +			qcom,bcm-voters = <&apps_bcm_voter>;
> +			#interconnect-cells = <2>;
> +		};
> +
> +		system-cache-controller@31800000 {
> +			compatible = "qcom,kaanapali-llcc";
> +			reg = <0x0 0x31800000 0x0 0x200000>,
> +			      <0x0 0x32800000 0x0 0x200000>,
> +			      <0x0 0x31c00000 0x0 0x200000>,
> +			      <0x0 0x32c00000 0x0 0x200000>,
> +			      <0x0 0x34800000 0x0 0x200000>,
> +			      <0x0 0x34c00000 0x0 0x200000>;
> +			reg-names = "llcc0_base",
> +				    "llcc1_base",
> +				    "llcc2_base",
> +				    "llcc3_base",
> +				    "llcc_broadcast_base",
> +				    "llcc_broadcast_and_base";
> +
> +			interrupts = <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>;
> +		};
> +
> +		sram: sram@81f08000 {
> +			compatible = "mmio-sram";
> +			reg = <0x0 0x81f08000 0x0 0x200>;
> +
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges = <0 0x0 0x81f08000 0x200>;
> +
> +			pdp_rx: scp-sram-section@0 {
> +				compatible = "arm,scmi-shmem";
> +				reg = <0x0 0x80>;
> +			};
> +
> +			pdp_tx: scp-sram-section@100 {
> +				compatible = "arm,scmi-shmem";
> +				reg = <0x100 0x80>;
> +			};
> +		};
> +	};
> +
> +	timer {
> +		compatible = "arm,armv8-timer";
> +
> +		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +};
> 


