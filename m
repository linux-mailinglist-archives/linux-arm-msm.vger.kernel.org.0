Return-Path: <linux-arm-msm+bounces-41872-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FDE99F00CC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 01:32:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 66687162B73
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 00:32:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF27210F7;
	Fri, 13 Dec 2024 00:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p42LOldi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D6B629
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 00:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734049922; cv=none; b=rNKlDt5+I1Jhvb7P2lr2RuI/BAf7Fdzf29rn06QCOGy3LrK4hmRUngYKf3XYHW5jFxh2/Bgrlapc2i8SxIRr9f+J+I+3Fuj0pI+J8dZ/1ItVnMRpGxA6sn/VEupvI1Lawyk4D2Cs6t0yWyQHqX0WeQWmgn10JrEGOl18O49XpHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734049922; c=relaxed/simple;
	bh=D/4kLYmFL1vv+53gZjM1mRfVNWOPM/Vze22YPqTVzxI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=P9rhSnDbq1RLiGMZNot+6zWWUcaaY7gbs05J1fvXhM9AYoAZ+Drn+ihGS63Z0fh+wFDvhhc9T5kj9ksM5uR3ybZDrGoja54sINYUGQIXFb1N59R/dQkpHDnVGDnF2654uKqoGbwMFjjrMP49mtSEl6JwKuPzf9Wq2rM/qU64QF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p42LOldi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCGYIei003174
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 00:32:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nQT5cApvwI8XzBPWTLFIItYMGe5Z6ZcYS7pK+Sy0jBI=; b=p42LOldiimdXtgBf
	ipePWCcrYrt5Bf4Ow222Y8xbL7cOUjGfcwXBZxSehWmg7gLWPM6TJzVC3dsy1DfB
	j6QchOIRqTrkNY8FnqRAAsEuJKshcuB3AErkzFwnDAbi4OTkXj4R1I7Wojzzs7dG
	5sizkigiONozJFSV0ftD97ltoptAG7HYoyqqNm+0X0jXSye5LtmS6eejen6as7zt
	jpIIpRXx7QCZVzcoDFjL6YbZIhnFRxif3JV0aIpPZBdUpqBkyqSyr8SH22rjkMsN
	qCMP1myex7LDWVZfesVfiaKZDfVNCY5F7UW7KQxNF6zuN1OKlJ42oXc7AtnZuFo3
	1wYIZA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43f0r9y1kj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 00:32:00 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-466a20c8e57so2651431cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 16:31:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734049919; x=1734654719;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nQT5cApvwI8XzBPWTLFIItYMGe5Z6ZcYS7pK+Sy0jBI=;
        b=H2JG9FLE+i2BUzYsYSHGs/5RTXcmnWW3rK4X7mb3GQTEeo+07vSRcsVFo+/RoNI08W
         s3JD8WnRRU9/ERxDvZk5DPBMRJWBXZOLeP+izFVVljoK1DR/nYPcPh8vXYWyMUfkJx+R
         vlhgGl2NFYyxJTR7yPzuqB71s292A87FpELrotcQMYXOBSpzcRFHOYex2ixoAJbCaT8P
         3Nv1N7MTb16s8iMJ254jHlkU9ifVDDDdjlFayKM1mQreuHZhjIXoKBQBygsa06pWorl9
         JQMkU26lYMP+C1x5pb4sRvizrHnOpjauiP3gSPA2jSWKa5e+dhMUKxv3kiFxoIntfNb6
         nbHw==
X-Forwarded-Encrypted: i=1; AJvYcCVvkuvzrryu/KyVYK9qwd5lz+TCyW/xgZ60M9mxBPtHMOQP6+eWwRbqsLrgjw5sA7tD9Yyw+ry6awP3h75F@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0yVBsItxfkntKBrvQ5l/ZS5udpiRi5N+WPh1uq0V8PD9A0ItZ
	uQWEiTI+CnG5lcFgBD1dfhZsNO5eUZTKB56lqkaKCuaZ/qM/ZY0R+r+eE0apQ9Czpup1KjPoFwQ
	XslmpfBjHeOA6E9UREzDDPRCW6niynWyb8nXMnBJRRmOazAfjMePlZglYJAjrRZ8L
X-Gm-Gg: ASbGncvErWuhHa16kkk85qCyBalmJKJ9wkVO88cD/w+UutbrF3RQTj5C4vYGja5Wcbq
	/IB0CSBG4Fuu9+8ct96jZuj7FTUTBfuwtCvbvbVSghV7DZOMznaTvu6Qgm1eolYOBZte67fGTWz
	fhSRekkQ74ZX27e3WcAjiGk5yiCHk+DJ/+lvqHspmBkKIIkP4GEkZoBNlb6qDN6SEdHecaOXLkL
	Rzwv4rySunSDYCG7DJa7BRlnnWITEf/yce6Sw04O1qgl4K+0Ohj6RNtRt7tSOW8CxCNKd/JaaB3
	1gNrO2ZWQRZPq+7u2sptXg7OP0WToNCpazIP
X-Received: by 2002:a05:620a:4609:b0:7b6:ce8b:6858 with SMTP id af79cd13be357-7b6fbf3267fmr28127685a.11.1734049919226;
        Thu, 12 Dec 2024 16:31:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEWb9ZQmLKHGmplUKTjXWDHzRq9o9QmV84Rtz2ZziZdi0Ye9FSUP8wFPTpIk7tLTtWNWf84yQ==
X-Received: by 2002:a05:620a:4609:b0:7b6:ce8b:6858 with SMTP id af79cd13be357-7b6fbf3267fmr28126485a.11.1734049918873;
        Thu, 12 Dec 2024 16:31:58 -0800 (PST)
Received: from [192.168.58.241] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d14c79919asm10760882a12.67.2024.12.12.16.31.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 16:31:57 -0800 (PST)
Message-ID: <7abec959-3987-412d-97ce-92cd3e501dc1@oss.qualcomm.com>
Date: Fri, 13 Dec 2024 01:31:55 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2-industrial-mezzanine:
 Add industrial mezzanine
To: Sahil Chandna <quic_chandna@quicinc.com>, kernel@quicinc.com,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, quic_nkumarsi@quicinc.com,
        quic_akdwived@quicinc.com, quic_kkotecha@quicinc.com
References: <20241206065156.2573-1-quic_chandna@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241206065156.2573-1-quic_chandna@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: JdaXjFii0ZIot5nvL-5Lb-FiXf8vCUB-
X-Proofpoint-GUID: JdaXjFii0ZIot5nvL-5Lb-FiXf8vCUB-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015 mlxlogscore=999
 malwarescore=0 lowpriorityscore=0 mlxscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130003

On 6.12.2024 7:51 AM, Sahil Chandna wrote:
> The industrial mezzanine kit enhances the capabilities of QCS6490
> rb3gen2 core kit. Add support for industrial mezzanine board.
> 
> Signed-off-by: Sahil Chandna <quic_chandna@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |  3 ++
>  .../qcs6490-rb3gen2-industrial-mezzanine.dtso | 44 +++++++++++++++++++
>  2 files changed, 47 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 6ca8db4b8afe..6fe5a5ccd950 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -111,6 +111,9 @@ dtb-$(CONFIG_ARCH_QCOM)     += qcm6490-shift-otter.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        += qcs404-evb-1000.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        += qcs404-evb-4000.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        += qcs6490-rb3gen2.dtb
> +
> +qcs6490-rb3gen2-industrial-mezzanine-dtbs := qcs6490-rb3gen2.dtb qcs6490-rb3gen2-industrial-mezzanine.dtbo
> +
>  dtb-$(CONFIG_ARCH_QCOM)        += qcs8550-aim300-aiot.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        += qcs9100-ride.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        += qcs9100-ride-r3.dtb
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
> new file mode 100644
> index 000000000000..74f2f782d166
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
> @@ -0,0 +1,44 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +/*

Err.. does this even compile? Is this a whole-file-as-a-comment?

> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include "pm7250b.dtsi"
> +#include "sc7280.dtsi"
> +
> +&pm7250b_gpios {
> +        gpio5_tpm_dig_out {

Node names must not contain underscores, use hyphens instead. Please
refer to [1] and make sure to test your patch with make CHECK_DTBS=1

Drop the outer node and include \/ under &pm7250b_gpios directly 
> +                gpio5_dig_out_default: gpio5_dig_out_default {
> +                        pins = "gpio5";
> +                        function = "normal";
> +                        power-source = <1>;
> +                        output-high;
> +                        input-disable;
> +                        bias-pull-up;
> +                        qcom,drive-strength = <3>;
> +                };
> +        };
> +};
> +
> +&qupv3_id_1 {
> +        status = "okay";
> +};

It's already enabled, drop this hunk

> +
> +&spi11 {
> +        status = "okay";
> +
> +        st33htpm0: st33htpm@0 {

tpm@

> +                compatible = "st,st33htpm-spi";
> +                reg = <0>;
> +                spi-max-frequency = <20000000>;
> +                #address-cells = <1>;
> +                #size-cells = <0>;

This doesn't have any child nodes, remove these two

> +                pinctrl-names = "default";
> +                pinctrl-0 = <&gpio5_dig_out_default>;

The label should be descriptive, usually following the (destination)
name on the schematic

> +                status="okay";

When you add a new node, it's enabled by default - drop this line

Konrad

[1] https://docs.kernel.org/devicetree/bindings/dts-coding-style.html

