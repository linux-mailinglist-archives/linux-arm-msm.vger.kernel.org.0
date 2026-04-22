Return-Path: <linux-arm-msm+bounces-104004-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8GQiLuMp6Gm3GAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104004-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 03:52:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 154214412D8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 03:52:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EF09A301876F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 01:52:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AF042F6931;
	Wed, 22 Apr 2026 01:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dBpf+8bf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BiAdsRU1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D861D5160
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 01:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776822752; cv=none; b=l2UIgdxWRo/gs8RkyxWSfVW1bNjPggYQNo5dPQNn9Y4SK+kSlUxiHtaQoBqULUAD0XTkjOyJDnc+0t0mFteGhnHXLElX7266XwkdmkC4uStjb41AB4FcwbhRn8ReXQmksBJGn0trMsL6bzAyYDof6MiNgJzYqI/Ni3G7SaOqWIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776822752; c=relaxed/simple;
	bh=i2BoUeBiaBN5BhTYVusWVsTRIANEkj7qt4bG5qmvTfU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ETfzHFKUON8SW5twXYIhbcqtfFdHtcNZByqP8lCcaXatQXnCREY1IqeqYtAwQyTtP+qgCTV5RuoINj704DT4pUVmMuUEfDo7pK/f/vBegoouBn143kv+0Yenf2KLBXxsGTylJgQtn+1G/AvgTvqDwbe6psmitoe7V41vuEZRHqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dBpf+8bf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BiAdsRU1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LIaA3S2935889
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 01:52:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=C8AfVkpjz5uA/yuNgUlEQ8Vv
	m91nbKA2JeN2OZf9jbg=; b=dBpf+8bfQYwThnxsaLcGS9nW4PuPLP683Aj4Hbas
	D7BxH58zRTFaJ1ctDXswlDwgYKjhpYTV4jEQ410Vq7HV1kMVmTPCbUBTo4Menmih
	N30NGC/VMT2of57nM27ERCyW9WHXW5XscDdWtn3WcMyvBJTTfU5+dffrl4ZNO327
	1X+m9yU7Nc+eTmFUNxyU/9akomfYHKE1oyfR3fBTggB4X87CAhkwPSAXah0cfMjn
	SZQ8M9k23DNaCOX9WZF3/7hvQlz24lgJmLZe+52UY/TDQPdYi60K2ka/G1IVTXdp
	zNRyeWWdUw+aLWum+n35mo4+GPRLR+Q0hZEkebS1KZTmYw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenk9613-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 01:52:30 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50e575a50bcso38522241cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 18:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776822749; x=1777427549; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=C8AfVkpjz5uA/yuNgUlEQ8Vvm91nbKA2JeN2OZf9jbg=;
        b=BiAdsRU1uIdt8D6zzrFSxvP5FXoqAGhfDelFTjmEAtlZJlI2WEDLZtPMSLGVkihWCY
         aTw/s9Rr+kUJR6Z0I8ioYhlr1rU9hVAY9ynuMSr8xZcEwoZQInHBj/yD979UARz5qLUT
         zWTjm7JD25TJETQt4K2m/m4JCgvhTEiOkX1kIdLzJK57bCuVRbK/b+tcb68J3JMbYj8F
         Q9bIGY1WAHVAzukaVUbmigB8l413Z6omUhGcUb19hwmqGsMID0Q2pL1G+JFZHxGJRixI
         ysmJ/9LBWqBGvGu74bxB2WKW3qxTa/PoHpI+V3CfgBX/roJpnv9EXVLd2HqTZ/fWR4c4
         ZYwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776822749; x=1777427549;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C8AfVkpjz5uA/yuNgUlEQ8Vvm91nbKA2JeN2OZf9jbg=;
        b=WczEcWxMs38mnwqnv3QpiOF9CfWsgKCHMdBPd6w6AF1YKM07jjXN0pfC7mXHGtz5HJ
         kS4AWmRHEMBxIMW9jO9DS8ftEPAwlRxepWZ4hnjbZSm6LGhHbCAPNx2wQw1qrm0ZMJvG
         HHd0zpzpxDxFEHIdK0si9iiLcSyagQ5BiflkFKVhYt6B3DBTWz2XuXfOlGN1379J/xor
         r/7bo5jQICv4rdM/3koGg+TR7h4cYn/WRKijN5wWy9CdOaRySp6C4C5F+UIqF4d8ciNH
         UZsfSDhW0+5FAPaeYHkV2ickERHU0ZzuvZ9Fc6uzKs7MVTPeMahVrpz5rKckMx5AR0RX
         e2rQ==
X-Forwarded-Encrypted: i=1; AFNElJ89+r5vkHwGOoXpeEA8DLipZtI2r08hi2/m/7+n9ooyrdxKSh8XtOUDE6ZRvo/IPOg8lEb5mpqrk5Jksn5v@vger.kernel.org
X-Gm-Message-State: AOJu0YxG1Gt8sJT3V5cggdF259ierwiq8s5QvanPALyg3gY5kI/pL6Q1
	WBlQgNOPDc7bFIrAeCNpgt9yfLqCqS+FXoCPSlyfC6E5r4LwoktNgFbOe1shpzX0gd+kRDCCSJd
	oZrWw4vEND32B8YDOVqZ5f+eDVwWJ/7E0/itEwer6gQlyaFWDiB54U+vSwn0XvfKMKZR3
X-Gm-Gg: AeBDietUHm0BpA5xonk/Vnpw51zsp+nASi2ISUkxsfrVLPISb7I8JnpVwETUJdcM+i/
	gh97QTWMx+qRkQfRoFA52rpRcPpZjz8XsVcFzXexJyZplkdX3Ihh9U7+7k8pHjiWg1ZxE6R06KA
	KFnCop2dtFugbn7y7AUBGUZ2gRjvR1/UDb/Wmt2NoXBWkaqaa0fGBnYofPwKOx0DbJ68HcTettb
	JjdO/d3cmxNCb6y9px2rDQUvQ3Ss0cJ3HvwmXRSwR2bG/+F19cXMpMsEUs8CSTnk2UN8xEuuxNU
	NBbD0MzYABSAgbVFfeYu1cZ3KbxF5JQ30HuuTdZ9OrLNtBeXG3xJokY/xVfm36+x8kqvfuPe8v9
	EFhqk3La6NyBgKRk+AJUN9OFQh17/jZqf/Zlr0LxGwwfLh6EKooaIyy1rkYNifg6moMAZa90Ap5
	TViwWiJ7OPYck9Q75ROahRJQWsWJKP7g/TT+n0pNxCfVUtTw==
X-Received: by 2002:a05:622a:1b24:b0:50f:c26d:f31f with SMTP id d75a77b69052e-50fc26e284fmr4058061cf.19.1776822749553;
        Tue, 21 Apr 2026 18:52:29 -0700 (PDT)
X-Received: by 2002:a05:622a:1b24:b0:50f:c26d:f31f with SMTP id d75a77b69052e-50fc26e284fmr4057751cf.19.1776822749072;
        Tue, 21 Apr 2026 18:52:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185c8a33sm4116785e87.36.2026.04.21.18.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 18:52:26 -0700 (PDT)
Date: Wed, 22 Apr 2026 04:52:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: contact@alex-min.fr
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Linus Walleij <linusw@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        iommu@lists.linux.dev
Subject: Re: [PATCH 8/8] ARM: dts: qcom: Add Samsung Galaxy S4
Message-ID: <7vknnza4kjylf7djlykq5ytzyjvk3nsrhpn52bvnb33edzg6hb@ufrlygkis6o6>
References: <20260421-mainline-send-v1-sending-v1-0-bcb0857724de@alex-min.fr>
 <20260421-mainline-send-v1-sending-v1-8-bcb0857724de@alex-min.fr>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421-mainline-send-v1-sending-v1-8-bcb0857724de@alex-min.fr>
X-Proofpoint-GUID: Ms18YJlPhQ9Mla5zBDFV4Hc8ZhbQWZej
X-Authority-Analysis: v=2.4 cv=SONykuvH c=1 sm=1 tr=0 ts=69e829de cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=NUSM9a-ApLgp72EsCKoA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: Ms18YJlPhQ9Mla5zBDFV4Hc8ZhbQWZej
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDAxNiBTYWx0ZWRfX1+7W4W0G9Utz
 ezqnbqlxrZQvkQ5d5B1IGEfK9LECp3yWVKDy0WyoDl1y/2YDmZ7voFEbSEQanXsdZub1fsbZB6q
 pt7tAwjno3J7sHRVOBxc0pu9KTitB7JrUM+dx7PSZQA0eClBc8eJvurdOQkNL9hgsmlCGdodxaz
 K/VkbN8pUh7lOPrjg39BDSSws4DF4yfKZkibE96QEEaK3yrhRvpcuo32SJo7aZuH0H3I3jYwRrB
 OjfK7mh+6DwRfZniRqzfZ7xUW20ZCyNUpcpjPTWVFv+ABun3EGzqA0H6FcLL/5gr2CNSW6g7snl
 /zyHQGyzTG2MoA2KuN+sG1dXovKVDWr3FlTTdeeyEe9k1SLRbe3Jr8thz3MAMveQPuLTHZfZ28Q
 ErqygCZzELiijvrB1lt9P5uSm2GeZywx5XSPR1AIlMAFwoNPLzTQ+9ljpqDCzCl2ufMSXR9x6Ho
 MAma6tw5j7GKy8NylGQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220016
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104004-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 154214412D8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 21, 2026 at 11:45:14AM +0200, Alexandre MINETTE via B4 Relay wrote:
> From: Alexandre MINETTE <contact@alex-min.fr>
> 
> Add a device tree for the Samsung Galaxy S4, codenamed jflte.
> 
> This has been tested on a Samsung Galaxy S4 GT-I9505. The initial support
> covers UART, USB peripheral mode with USB networking, the front LED and
> the physical buttons.
> 
> Signed-off-by: Alexandre MINETTE <contact@alex-min.fr>
> ---
>  arch/arm/boot/dts/qcom/Makefile                    |   1 +
>  .../boot/dts/qcom/qcom-apq8064-samsung-jflte.dts   | 484 +++++++++++++++++++++
>  2 files changed, 485 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom/Makefile b/arch/arm/boot/dts/qcom/Makefile
> index 32a44b02d2fa..c23c961f79e3 100644
> --- a/arch/arm/boot/dts/qcom/Makefile
> +++ b/arch/arm/boot/dts/qcom/Makefile
> @@ -12,6 +12,7 @@ dtb-$(CONFIG_ARCH_QCOM) += \
>  	qcom-apq8064-ifc6410.dtb \
>  	qcom-apq8064-sony-xperia-lagan-yuga.dtb \
>  	qcom-apq8064-asus-nexus7-flo.dtb \
> +	qcom-apq8064-samsung-jflte.dtb \
>  	qcom-apq8064-lg-nexus4-mako.dtb \
>  	qcom-apq8074-dragonboard.dtb \
>  	qcom-ipq4018-ap120c-ac.dtb \
> diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064-samsung-jflte.dts b/arch/arm/boot/dts/qcom/qcom-apq8064-samsung-jflte.dts
> new file mode 100644
> index 000000000000..9e5faf7c086f
> --- /dev/null
> +++ b/arch/arm/boot/dts/qcom/qcom-apq8064-samsung-jflte.dts
> @@ -0,0 +1,484 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/mfd/qcom-rpm.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> +
> +#include "qcom-apq8064-v2.0.dtsi"
> +#include "pm8821.dtsi"
> +#include "pm8921.dtsi"
> +
> +/ {
> +	model = "Samsung Galaxy S4 (jflte)";
> +	compatible = "samsung,jflte", "qcom,apq8064";
> +	chassis-type = "handset";
> +
> +	aliases {
> +		serial0 = &gsbi7_serial;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		ramoops@88d00000 {
> +			compatible = "ramoops";
> +			reg = <0x88d00000 0x100000>;
> +			record-size = <0x20000>;
> +			console-size = <0x20000>;
> +			ftrace-size = <0x20000>;
> +		};
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&gpio_keys_default>;
> +
> +		key-home {
> +			label = "Home";
> +			gpios = <&pm8921_gpio 30 GPIO_ACTIVE_LOW>;
> +			debounce-interval = <5>;
> +			linux,code = <KEY_HOME>;
> +			wakeup-source;
> +		};
> +
> +		key-volume-up {
> +			label = "Volume Up";
> +			gpios = <&pm8921_gpio 35 GPIO_ACTIVE_LOW>;
> +			debounce-interval = <5>;
> +			linux,code = <KEY_VOLUMEUP>;
> +			wakeup-source;
> +		};
> +
> +		key-volume-down {
> +			label = "Volume Down";
> +			gpios = <&pm8921_gpio 37 GPIO_ACTIVE_LOW>;
> +			debounce-interval = <5>;
> +			linux,code = <KEY_VOLUMEDOWN>;
> +			wakeup-source;
> +		};
> +	};
> +
> +	i2c-muic {
> +		compatible = "i2c-gpio";
> +		sda-gpios = <&tlmm_pinmux 22 GPIO_ACTIVE_HIGH>;
> +		scl-gpios = <&tlmm_pinmux 23 GPIO_ACTIVE_HIGH>;
> +		i2c-gpio,delay-us = <2>;

[...]

> +	};
> +
> +	i2c-led {

i2c-led should be before i2c-muic

> +		compatible = "i2c-gpio";
> +		sda-gpios = <&tlmm_pinmux 6 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +		scl-gpios = <&tlmm_pinmux 7 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +		i2c-gpio,delay-us = <2>;

[...]

> +};
> +

-- 
With best wishes
Dmitry

