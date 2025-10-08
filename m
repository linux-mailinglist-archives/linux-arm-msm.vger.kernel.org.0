Return-Path: <linux-arm-msm+bounces-76460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A92BC5F64
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 18:10:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9699A404C24
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 15:55:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6544A289824;
	Wed,  8 Oct 2025 15:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bqtc6BoB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A721A1FF1AD
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 15:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759938926; cv=none; b=uHbeoqzTJhMo7bBexycpV97LcMcOSUym/2PeWdqeC6ew2rddbF33air5Ohyms4h+z7BZjRgQS2504KwGFB5LKVvg/n6JcH1r6vh1OozYpQuUex8zEftUlzInYx+e4U7E8NcjSfUH37hR9G4vMed+B7aVlg//wq22Bcqit7G41l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759938926; c=relaxed/simple;
	bh=j2UkhdzbAn9EpuVUW5MA9K6q+5RVw8aI7MKuXDaeTZM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SJ2BSJAmM0tzyNqrbJzKMb/PHrtMuaFFCQRO7h5n2KwrMZPzrGM6KZJ0SQ8TrUkEXnwrHSTYUBJTqext0e2BoGioCzRTOpH5ZVuiEV8wg4o3pjB8QTqTtAxT1Kgto8sdC1mWDkRzMV6UGTVubMT8MjAnwXlvEoNLP/N8a2aoGIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bqtc6BoB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890Oan028792
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Oct 2025 15:55:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7QjSXtuoTslSkSiHaByDppgS
	FC/oYSQl2GRnyEf5CaQ=; b=bqtc6BoBneIssJCr2G+gDAAsfflb4UqeRYNviNao
	LYpbWE6+rDflxbz/4DkOuZ6cI/4B5KVUqj7i/xxoT91ERIGgWyTtLREXxfLFBN+y
	l2sILqj94/xMxvsxy+TL3POxnTSzjSqzIUQfucaQlufUOfU608uRAO68C0XUVghv
	NqzLkdvZCU+wQLGfDdd+gyU3ixSvQ/YFpkYPuWI+FgnrqTryAa9G5KFdjCpBSuSW
	k1MeLas04k7HzHkmTwQZurhnMc7yybrexHydqa+JL5gE7hAsna8P6cE52cxcNwGe
	zdY8Vo6S1pmT5fp6qt0xoIbM6eL8IopracBY/Xb6kWQQ6Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jtwgu605-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 15:55:23 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4e5739a388bso182619751cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 08:55:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759938922; x=1760543722;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7QjSXtuoTslSkSiHaByDppgSFC/oYSQl2GRnyEf5CaQ=;
        b=f02g1xKsCxfShbeFAipblyC/7qmhJ3WuKYXnGEgHxPCK2GhxCB5+zIIkLK52eUv0T7
         p66WT9gHL1uIG1hgmubqf9HuyYqTRPh4BbYds1DQFVNXt0yLJ3MIA4DFCAfy7QJZcF8W
         pZdSNxZRgd+5IHUGsZCW5gjY6y3y+4Kq/0dBpvR1ljX7gq+RWJ8ntjP0bBzD5hkAJGNU
         4shBd5oJMVCsHHXDMBUk043jzL9jrZPxxS06QKk+n3e+4GCaa1aCFJpGO7dQ2XfsHFHI
         oA9fwnThMqru6c6Kgja7bHVEYBtNDyv5MGYKCB7+pMrlbeESmergRMmBDa5ExetzJSaF
         gK0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWzEZQAB6olUELnuq7odr02jcmvXg+dWx1Zy6zgmSJsCxRP2rZBMwvHwOKXud0nqRg+B2JngzaQFRfE6dxN@vger.kernel.org
X-Gm-Message-State: AOJu0YyD9ci3RN2MlmOwiUlxC4za5812QRizAdJrqhjKBCZUXmpKLzIB
	rQY7HvOD1nV38ozCllMetznKmUjE7p3dXh4WqEj99FkBhnvToQ5g+VLweL1xMIiYDHfa3QwTMov
	SkS9o1Npmfurpe84D1VEbxevU/YQLAIZk+tMq6UT3eC2DLs2e7iQXHIOLXYfyTTpOKRny
X-Gm-Gg: ASbGncsRVhRb8iUJqmPjhFPF3Q7IvGh1ynXM9jgzMgxr9pEDua76mTLez3ZVgM+TcOz
	hgQHrZDohTJ3ERJDecfGcyWzoBLmq+7HhYKE/RqhQf9tocSkgdV+GE5tU16DAEj1eUwB64Eokzu
	JOE+ShKd+J37SX/YU7B/xvpo69LtLBT+8p5CqRf5NGPB4A1jyDEHEWkzKAeX7/TkczkvWWkqyvX
	qbPVgtlK9VgrP6Ld7wl4w/v1Gc+lqvig7hkATstNfaOtdPwMTvFEzIz9tnxySMDsEEjYGKCnxzq
	5fL2waYhS/hkHgJa6yyxQRJK320ZN4lg0VJH+HtV8SgTo/4Jbuw/2RYBq0rJKJD++cUXN1XphIy
	RHk2Gvk3vKocAQ+FLDL/P2sQDvbq+7Jdiu3EWDxH9oP/uamgnRty1U1uGhA==
X-Received: by 2002:ac8:5f0c:0:b0:4b3:4457:feca with SMTP id d75a77b69052e-4e6eacb4141mr57977041cf.6.1759938922506;
        Wed, 08 Oct 2025 08:55:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOShZ0ze3T5km1xT0ymN/qoSgsYewOl/wO5Q/jb1euMKp59BWlgXFYBrUMUcmS0FFrbWSJug==
X-Received: by 2002:ac8:5f0c:0:b0:4b3:4457:feca with SMTP id d75a77b69052e-4e6eacb4141mr57976651cf.6.1759938921997;
        Wed, 08 Oct 2025 08:55:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5907ad9e092sm108082e87.79.2025.10.08.08.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 08:55:21 -0700 (PDT)
Date: Wed, 8 Oct 2025 18:55:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/24] arm64: dts: qcom: Introduce Glymur base dtsi and
 CRD dts
Message-ID: <xn4cu5vhptfi6ptz3e4w62p3wk52dlquhhdna4nwkqvxm3bpz4@hakz5m2t2b52>
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v1-3-24b601bbecc0@oss.qualcomm.com>
 <p4ajadn2xytkt6hycm4te3sgxg3mern4uq7ce6bfpzgquer5ys@tcvcyuuk6lr2>
 <cdc7fa94-4cfa-4664-92a9-d89654f53d11@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cdc7fa94-4cfa-4664-92a9-d89654f53d11@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAxOSBTYWx0ZWRfX5l4mgIeKeNlt
 c4Qzxa+1HuQJsh3N9UZQ/ayjwvehQ7nt9Oe55rcaSqH5ixa+Mz/D54lR+wjMnG+i0gOSARha/RK
 m1HTfuqZXJwsETPZMdD6/9Pt/NrM7knYbRA7L+seG0d/qE7Vcml2tLz4XAuh3LkFhGIaxtuDGlx
 4k1A0o1noHr5OhiLXTdhZ6sutGjhz2+UfHHq2OyRR9vdXtlYwZeZusXzzBXtjroylfpVGqB4RD8
 Z6E7LgBI80XDKlJgKKBRaq1sBPL2s4AYOriUT1MyZIjXsH4s2AURuPk9KbQ7KI1FJoCcXHms6Vl
 QN3kyHvnIKCfp6KMYHimtUKWFnSyit2iDGBmAwl1sdSwhwfDIv8hxt73r4MO+1a2yKijSjh5Q20
 px0OeRDi8PmZeuSiTSzTWLi3gs1ydQ==
X-Authority-Analysis: v=2.4 cv=B6O0EetM c=1 sm=1 tr=0 ts=68e6896b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=CFAA7QO4UmtJTJAWpEYA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: EGYTxldF-xaWjKnt8xaLCSQlC0DU7W-P
X-Proofpoint-ORIG-GUID: EGYTxldF-xaWjKnt8xaLCSQlC0DU7W-P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0
 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2510040019

On Wed, Oct 08, 2025 at 05:06:16PM +0530, Pankaj Patil wrote:
> On 9/25/2025 11:14 PM, Dmitry Baryshkov wrote:
> > On Thu, Sep 25, 2025 at 12:02:11PM +0530, Pankaj Patil wrote:
> >> Introduce initial device tree support for Glymur - Qualcomm's
> >> next-generation compute SoC and it's associated Compute Reference
> >> Device (CRD) platform.
> >>
> >> The dt describes CPUs, CPU map, GCC and RPMHCC clock controllers,
> >> geni UART, interrupt controller, TLMM, reserved memory,
> >> interconnects, SMMU, firmware scm, watchdog, apps rsc, RPMHPD,
> >> SRAM, PSCI and pmu nodes.
> >>
> >> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> >> ---
> >>  arch/arm64/boot/dts/qcom/Makefile       |    1 +
> >>  arch/arm64/boot/dts/qcom/glymur-crd.dts |   25 +
> >>  arch/arm64/boot/dts/qcom/glymur.dtsi    | 1320 +++++++++++++++++++++++++++++++
> > I think it's usually two separate patches
> 
> Yes, for the next revision planning on separating patches
> in a manner where this commit will have bare-bone board
> dts so compilation doesn't break and singular commit
> to the board dts which enables required functionality.

One commit for SoC.dtsi and another one for the board.dts.

> 
> >>  3 files changed, 1346 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> >> index 296688f7cb26550f75bce65826f234bc24110356..15f31a7d3ac4a60224c43cfa52e9cc17dc28c49f 100644
> >> --- a/arch/arm64/boot/dts/qcom/Makefile
> >> +++ b/arch/arm64/boot/dts/qcom/Makefile
> >> @@ -13,6 +13,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8039-t2.dtb
> >>  dtb-$(CONFIG_ARCH_QCOM)	+= apq8094-sony-xperia-kitakami-karin_windy.dtb
> >>  dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
> >>  dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
> >> +dtb-$(CONFIG_ARCH_QCOM)	+= glymur-crd.dtb
> >>  dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk.dtb
> >>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-rdp432-c2.dtb
> >>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-tplink-archer-ax55-v1.dtb
> >> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> >> new file mode 100644
> >> index 0000000000000000000000000000000000000000..a1714ec8492961b211ec761f16b39245007533b8
> >> --- /dev/null
> >> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> >> @@ -0,0 +1,25 @@
> >> +// SPDX-License-Identifier: GPL-2.0-only
> >> +/*
> >> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> >> + */
> >> +
> >> +/dts-v1/;
> >> +
> >> +#include "glymur.dtsi"
> >> +
> >> +/ {
> >> +	model = "Qualcomm Technologies, Inc. Glymur CRD";
> >> +	compatible = "qcom,glymur-crd", "qcom,glymur";
> >> +
> >> +	aliases {
> >> +		serial0 = &uart21;
> >> +	};
> >> +
> >> +	chosen {
> >> +		stdout-path = "serial0:115200n8";
> >> +	};
> >> +};
> >> +
> >> +&tlmm {
> >> +	gpio-reserved-ranges = <4 4>, <10 2>, <44 4>; /*Security SPI (TPM)*/
> >> +};
> >> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> >> new file mode 100644
> >> index 0000000000000000000000000000000000000000..f1c5a0cb483670e9f8044e250950693b4a015479
> >> --- /dev/null
> >> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> >> @@ -0,0 +1,1320 @@
> >> +// SPDX-License-Identifier: GPL-2.0-only
> >> +/*
> >> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> >> + */
> >> +
> >> +#include <dt-bindings/clock/qcom,glymur-gcc.h>
> >> +#include <dt-bindings/clock/qcom,glymur-tcsr.h>
> >> +#include <dt-bindings/clock/qcom,rpmh.h>
> >> +#include <dt-bindings/dma/qcom-gpi.h>
> >> +#include <dt-bindings/gpio/gpio.h>
> >> +#include <dt-bindings/interconnect/qcom,icc.h>
> >> +#include <dt-bindings/interconnect/qcom,glymur-rpmh.h>
> >> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> >> +#include <dt-bindings/phy/phy-qcom-qmp.h>
> >> +#include <dt-bindings/power/qcom-rpmpd.h>
> >> +#include <dt-bindings/soc/qcom,rpmh-rsc.h>
> >> +#include <dt-bindings/spmi/spmi.h>
> >> +
> >> +/ {
> >> +	interrupt-parent = <&intc>;
> >> +	#address-cells = <2>;
> >> +	#size-cells = <2>;
> >> +
> >> +	chosen { };
> >> +
> >> +	clocks {
> >> +		xo_board: xo-board {
> >> +			compatible = "fixed-clock";
> >> +			clock-frequency = <38400000>;
> >> +			#clock-cells = <0>;
> >> +		};
> >> +
> >> +		sleep_clk: sleep-clk {
> >> +			compatible = "fixed-clock";
> >> +			clock-frequency = <32000>;
> > Can we please adapt a single style here? I think, at least frequency
> > should go to the board file.
> 
> Sure, will do.
> 
> >> +			#clock-cells = <0>;
> >> +		};
> >> +	};
> >> +
> 

-- 
With best wishes
Dmitry

