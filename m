Return-Path: <linux-arm-msm+bounces-75168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 27109BA0EDB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 19:45:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DC8ED4E14F7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 17:45:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70B3F30DEC4;
	Thu, 25 Sep 2025 17:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mjQNtZkX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8B078F43
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 17:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758822302; cv=none; b=UFSCieNa7sPvQF6r9INBII5biXJi5DmRJBl48ulJlFIlQqt+MXPBlnN046A24QiVfQ9zM+9YpnxfHbWiko36wlG5KZY90uQ3sQuUD7zh5oIEedKQR9uVdsOTg4CVBz+Q7I2CYirIdSUsfiyZP90gHDhFaOTAxPFeEY8lyDTbZqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758822302; c=relaxed/simple;
	bh=/k1hQmKTWVQyRZ/avy99iKotFX22NmScf25p/6cKLdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XovzcpSEGaB4kGh9TDOOtJjaBGdxUHvHLIXmgKXv91xBqg0m6teLvupJI5qJpNGBLxSwBZqY7IIFhTgdpdcbcu2oG3vgugY4IfiMo168EJdseKRcoN+/nQMiSnkn2GXfw0PSjKk8zXK/E79JSlPioXCeCrVA3hjO8ix8JWDwwUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mjQNtZkX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P9gCQG002400
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 17:44:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=taKjdb2EKDVlPEEs0oR9SiMR
	CZVYek24hGBIlfNdyqU=; b=mjQNtZkXEhVcH/PZITOEXnqqgyrG6aQswNvmYOwz
	zpXBsLVazj68cud36mPKA3NPHISG/0K/cUlZjW3fR8LUwNirP32b4qHDszZUrR31
	v1T8nN/De2VFuasJl6r/xueABgJd6K1L7PlLEu9wHhEcncMDsMJlDr0JdmwXxnow
	ASYQIJOqb+bOc9B/3YRt9R4hw9RRdt+bEhb0bvGH3bhhyOPd6bqycAQY8eyMrzFQ
	d61xgcGhc7r1/4E00hg5RVRi+/CjEJRjBjjJUL3wONw0/MB3nKMfmi8m+EgowtEu
	hIVE/b7HmNEtHUv97dagwNAjjcpaYDjh5pcdli6H7wwoKQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499k98s1kj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 17:44:59 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4d38dbc0e29so34634181cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 10:44:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758822299; x=1759427099;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=taKjdb2EKDVlPEEs0oR9SiMRCZVYek24hGBIlfNdyqU=;
        b=UaDEJA1BOXG050jEuSGrsCZcUpfJVmjZSwyxVrqQl8lvZGyPY/JliIZZg8zUe6SIOh
         wlJ58In9Xjmf5XwnT7J6wo1uLcSkCSCdtlRjYKzgS6lrQC6gXoVNC15MyBwGCMLI3Dps
         3i05+pISk0316wjkLb+MhHy2crlRbKXxtD2ElQrfowWoDLdNF6WkWlSVZK7IPfOXdtb3
         CLedX1VY2oAWHCZ9ZzYZNnuckrYIT96JJWOhbRaA8QTcKvXLghc6sAjacKtzqt6VI7sa
         yOtOdybJhgd4oPOEnjDqI3+3yBnG6Y55HIkl66LbLWTcWBd9skF2ekJkgX5987GDMQo9
         DeXw==
X-Forwarded-Encrypted: i=1; AJvYcCWTv2Pt4cSiAt3mE8vhHPZRwXfifbQCLIxTPWxVcTntx1vULwvVYYqoRGRBK8GU6xgzANSbuJ1DFEAlb/oz@vger.kernel.org
X-Gm-Message-State: AOJu0YyNZ6pWxSfl+Bf/1mMdT8KxkN/E6c6WulAumNev5K09OXfMEbyJ
	o9kb63CHbZaUa+RdsAN7GgVtKwkvbxCrFZgJ125CZg1VC7NihGeB6+gdzvZW8orD6oCHaoPLAYf
	nHaZEvJp0m96paKEwqDhERzQnBrnEYk9ug4BCYFQGiYIRrCA5a9rftu6Hzga67Oy+Szjv
X-Gm-Gg: ASbGncsu5XQG+cyf1byCWX4UwAsvp3H/iwezKNo2QBRHKLb4C3gNrpgI2AJqvNOSqHU
	d3yOYtUtwICISybIJ3ePwq6tQ3Ldf8gAOxwPy90f/xVJaloOhUBYdNBsdGRF8rhaRoEr/frdxUN
	5S3m1A/pZ4AVMslII5eLuMCrdEz+yHJqrU9gMGTGurDgN+X6DReTnKdkJ1OquiOpmlIjyXhtwkL
	3IRnt1YCSw7CvMQmZlxWOApHdTUdeyIrDA+boHN0VKNfBBzKWo6FD5bvmfaxY52eDVw+yEw6Z/w
	KQ/LdnovLy0rBjUE5x3IzfRSB8oShLJJsnGVcTkJV0UvFlWw9BsIM8fuobuJv6pWK9xkSBQxza2
	Lc5grS+VqAU8w8lshSwtTTp5Dg8N8aD/XdvBHVfVaXrWKZWm8gQn+
X-Received: by 2002:a05:622a:5c93:b0:4b7:91df:ab92 with SMTP id d75a77b69052e-4da47a1a4e6mr51495171cf.14.1758822298686;
        Thu, 25 Sep 2025 10:44:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdHfj0uuGGgbo1g8zUiwXeR44tcMUIfrmt842HIShsx+QhtNkV4/d0yEIqtheg/ABc9Z6pmA==
X-Received: by 2002:a05:622a:5c93:b0:4b7:91df:ab92 with SMTP id d75a77b69052e-4da47a1a4e6mr51494821cf.14.1758822298094;
        Thu, 25 Sep 2025 10:44:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58316a31df6sm940404e87.111.2025.09.25.10.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 10:44:57 -0700 (PDT)
Date: Thu, 25 Sep 2025 20:44:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/24] arm64: dts: qcom: Introduce Glymur base dtsi and
 CRD dts
Message-ID: <p4ajadn2xytkt6hycm4te3sgxg3mern4uq7ce6bfpzgquer5ys@tcvcyuuk6lr2>
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v1-3-24b601bbecc0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925-v3_glymur_introduction-v1-3-24b601bbecc0@oss.qualcomm.com>
X-Proofpoint-GUID: AukGqL1uvgXhkLbmmUHo5xB0QUS2y45I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxOCBTYWx0ZWRfX1GI2UaHc45tj
 hgc48qE0lbIdhhmpyOBMlrWcmYlO+sxc1ovV2hP8Vnk3cz0tNNWXIdQEvuLr7aU7gDo3nh9vMQ6
 mxy0Fr7Gsxeyh/Lw4nZlz1Jmna3sfIsXvAiHp4vJ8ZgqpXatjdGgfVigTcx8pvMKoHQg2s99HMY
 q6LGlFFV6JoeAWocYfgQ8ZqS2Vtit4oLYVI/IB/H9AYC+vQfJICvsMffxZG0ud+C5I1eB+rK7Sf
 U/binSKcNUFHO9n9xpCnFUuvuzWAXqT/U3bKFZCIe0KF4qk62YsWgBVBBRnt6wQzgBZ5zvXJYS7
 EMyayWYruK5vdSy+9FZfGKCY35J3BsObu5I3ihSHT0FiQtn4dAX1juifZT1qSULGExjBcjj71tn
 39FnHDDU
X-Proofpoint-ORIG-GUID: AukGqL1uvgXhkLbmmUHo5xB0QUS2y45I
X-Authority-Analysis: v=2.4 cv=Dp1W+H/+ c=1 sm=1 tr=0 ts=68d57f9b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=DSZkEpnJKwcpRbTl42kA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_01,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200018

On Thu, Sep 25, 2025 at 12:02:11PM +0530, Pankaj Patil wrote:
> Introduce initial device tree support for Glymur - Qualcomm's
> next-generation compute SoC and it's associated Compute Reference
> Device (CRD) platform.
> 
> The dt describes CPUs, CPU map, GCC and RPMHCC clock controllers,
> geni UART, interrupt controller, TLMM, reserved memory,
> interconnects, SMMU, firmware scm, watchdog, apps rsc, RPMHPD,
> SRAM, PSCI and pmu nodes.
> 
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile       |    1 +
>  arch/arm64/boot/dts/qcom/glymur-crd.dts |   25 +
>  arch/arm64/boot/dts/qcom/glymur.dtsi    | 1320 +++++++++++++++++++++++++++++++

I think it's usually two separate patches

>  3 files changed, 1346 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 296688f7cb26550f75bce65826f234bc24110356..15f31a7d3ac4a60224c43cfa52e9cc17dc28c49f 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -13,6 +13,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8039-t2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= apq8094-sony-xperia-kitakami-karin_windy.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= glymur-crd.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-rdp432-c2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-tplink-archer-ax55-v1.dtb
> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> new file mode 100644
> index 0000000000000000000000000000000000000000..a1714ec8492961b211ec761f16b39245007533b8
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> @@ -0,0 +1,25 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +/dts-v1/;
> +
> +#include "glymur.dtsi"
> +
> +/ {
> +	model = "Qualcomm Technologies, Inc. Glymur CRD";
> +	compatible = "qcom,glymur-crd", "qcom,glymur";
> +
> +	aliases {
> +		serial0 = &uart21;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +};
> +
> +&tlmm {
> +	gpio-reserved-ranges = <4 4>, <10 2>, <44 4>; /*Security SPI (TPM)*/
> +};
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> new file mode 100644
> index 0000000000000000000000000000000000000000..f1c5a0cb483670e9f8044e250950693b4a015479
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -0,0 +1,1320 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <dt-bindings/clock/qcom,glymur-gcc.h>
> +#include <dt-bindings/clock/qcom,glymur-tcsr.h>
> +#include <dt-bindings/clock/qcom,rpmh.h>
> +#include <dt-bindings/dma/qcom-gpi.h>
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interconnect/qcom,icc.h>
> +#include <dt-bindings/interconnect/qcom,glymur-rpmh.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/phy/phy-qcom-qmp.h>
> +#include <dt-bindings/power/qcom-rpmpd.h>
> +#include <dt-bindings/soc/qcom,rpmh-rsc.h>
> +#include <dt-bindings/spmi/spmi.h>
> +
> +/ {
> +	interrupt-parent = <&intc>;
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	chosen { };
> +
> +	clocks {
> +		xo_board: xo-board {
> +			compatible = "fixed-clock";
> +			clock-frequency = <38400000>;
> +			#clock-cells = <0>;
> +		};
> +
> +		sleep_clk: sleep-clk {
> +			compatible = "fixed-clock";
> +			clock-frequency = <32000>;

Can we please adapt a single style here? I think, at least frequency
should go to the board file.

> +			#clock-cells = <0>;
> +		};
> +	};
> +

-- 
With best wishes
Dmitry

