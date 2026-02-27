Return-Path: <linux-arm-msm+bounces-94524-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EGdGOIb4oWknyAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94524-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 21:03:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A72B1BD2AF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 21:03:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 03D79302795E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 20:03:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9840A37D138;
	Fri, 27 Feb 2026 20:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pCwsaGfc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fdh6eSeG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBBB3559C0
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 20:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772222596; cv=none; b=N2YDBTA0Ej2Q/E+MDZ8dI7NFN5omZL7jgG8Kf3K0RcOIYnjKjppKkBZ2OQO9/oWjGrafgAd0UWVmWeus17LxEbFc0lWH6g1aqJAbYTHwn+6VxduMx7weOFb9ZPcXnxqAwZ9Vfu5zNh5sNO84dPEJJuVZWQo38gfekV4miF4wGus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772222596; c=relaxed/simple;
	bh=OV5MhdjQGcCSSrJXEjhHklpOJPuKrgXwdF2gCWltS60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JYa+/8mF3st+RlpMOLy/ivvFDKV0nJJ77VfpnAYwovCx8sEpV9sHsBLNKihPNA64oNX8+C34L9u+yBwWGyVsZaGxV+adpr4ldaGP4xMU4ia9vHkIDJ4f1S8WnOjIu1k5xpj1Hr0EwaxzR1UWCAWFTdoVsJ8ndNIZnchhoG78Sws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pCwsaGfc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fdh6eSeG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61RIloRs3732986
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 20:03:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iYhAEo28QEJUDMFdd9XamQte
	euXqEAgn/s1gbmx9H+E=; b=pCwsaGfclQKAQrMdBHTjYCuMOYqSiVRydG5kAjV0
	DRjvJLAbcQqZXLAwulLAVEj5b9aruVEzWYmdH+DEieBfltBNFnav6C8qGmgfImgZ
	etzMOEAoyLKE5CDv2tQBgiNk8T9zeo+RqKjeOb0J0ffGXbdDssrFHDefQrUM+Ox9
	vLCGRiPYe745US3gTkVATjg0d5rT4d88zGBqbLtJ07E4CYcU/zL4rF3GA93AGqZ4
	FulTFO2QofkQDbIRUlozYT6Q5UEgcARbzWhbqgiUpjb/s3u+6GIv+1ekkfWGuJbh
	V1jSIscSigZ4E8N3m7xr44DPo4W0caQghx5GYCGHffqewA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ckgv5078n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 20:03:14 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb4a241582so1572620785a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 12:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772222593; x=1772827393; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iYhAEo28QEJUDMFdd9XamQteeuXqEAgn/s1gbmx9H+E=;
        b=fdh6eSeGLEEuGafR8HeFgZz3roGxSSS24uTXK2BmOPNAA9jHaEmUyLbHNk+hH/NUh1
         v5LUM21C8KQ1OkuTwvqVyvjKsFJE3jCWVSufoUqGcUmpLlfJPXa2+5u3VBwOqs2XLazK
         mMtvkcMZ1gPXQVS3YM5SqzbZIB/UzgwvYUFwiswyenYNR85GEGKFo2ovkzT3PNJAABn4
         xk0epvX1rddCU2vs10pIUsgnYElgof1qJt2YbK4Y8L49Asq9plqFL0AEvtIHsoHTpIhR
         GQNS80lu9oWFL7r9tHeV+MxM3s6RLPoWCjSw/Pe+2jyYwmlQ9VkobCtbAEUcFwzQdHiD
         oPsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772222593; x=1772827393;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iYhAEo28QEJUDMFdd9XamQteeuXqEAgn/s1gbmx9H+E=;
        b=nnln9LW7CRP3mDQhJSeChzCiqpYEQZudnEJEC6fk/CQnYUNGto1TJpEc5KZwZ/3PGX
         Qtp+FY31nToVRHlqZ4g+J3Z0Ewv9Xzt7yajlEYF+0v+TNy7Jti+TYfPJUJA/AfRCTOvG
         Cgmyu8OLFBr0Gjq+YaUErrrdn9OvlZ3+ttvHdOMPWph3nZiWWpsLfVQfYpuz5vHsTIp5
         t5OkUwC/l+I+APJXrJHKEofZrs/F0+1DOvC6vIs1feI5cPX0sFqlqjMIIQmgBzq1G8Bf
         bHFURAu1hp3pDh7tDfE7uBgkD7FBG7dBziRC3Inn0aQ4XuPKnKZ2pz4oYUlJn4ZHROb8
         Rmxw==
X-Forwarded-Encrypted: i=1; AJvYcCVP8CKMJcgcduTOq5JFh8PKB6kHXBeqBOpdYwBDNhpY4P516jC21c4HeSWiWEgy7QzZUNaN7NzySQ4j1D10@vger.kernel.org
X-Gm-Message-State: AOJu0YyADP+L3gO27fkwtYXBZeCS5h/Vs4FutDrai2Z4A3HOQx9GBe9n
	eZ39Xq21Boalbg8A4MEbiS2nvg/qnT8m0RpDgffvpOmf/9j9Sb9fVpUwyxUH2wd5Hy1n0u4E3D4
	i++evt214HuaEys9emnbNbP5gZiiLfhOjRgwm5Yaos/zdjjh1YaEhlzJ7lwZKd2UTCvgx
X-Gm-Gg: ATEYQzyHrlcJrIcuz3L7RzTL4gM4X78LbqcVC0MTSi2pPQSeUhDg8RqTD7Kui+ff6F3
	QTQ+M2mgZfsnFP1jbQU+rupM7qPKzuROfZtWccUeR8mHo58mVDGQ4/lY3K9GInj9VWZGrv8pN1s
	RNUsOnaie66EBEUHLepJGobxEcyiJI+zRd6Z53/WBSZVUS3jNbUIaUpMgI8DDeHr5aD0qcFdaVo
	XNuM+zcnjbs+hwG6Irry2jTK8/OjF4cRg6E53+G40HfFuNVrDqxEaHohKEPmUkMwH/GqYbup0Cb
	cdl4UMBnpTy2r4nD+ScHZ0rG41PZLCtIuPgtpwcyWqubESL9V1q5W8Y9PHZVOx4iTLo0LIGq2cD
	2maOyaxDDpIFhHNORIlGF1oZioUqxbJvyopSmfqM+Be//WATa+N+UVzs6IlDN4A50oVAPBBaQur
	UIWp492h3xOG+Pc1rfVwyYE9nUmWqmAtkjmhU=
X-Received: by 2002:a05:620a:4050:b0:8ca:3c67:8923 with SMTP id af79cd13be357-8cbc8df71e1mr518304185a.53.1772222593469;
        Fri, 27 Feb 2026 12:03:13 -0800 (PST)
X-Received: by 2002:a05:620a:4050:b0:8ca:3c67:8923 with SMTP id af79cd13be357-8cbc8df71e1mr518297685a.53.1772222592959;
        Fri, 27 Feb 2026 12:03:12 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a10a319f1csm2045789e87.54.2026.02.27.12.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 12:03:12 -0800 (PST)
Date: Fri, 27 Feb 2026 22:03:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Monish Chunara <monish.chunara@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, mani@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sarthak.garg@oss.qualcomm.com,
        pradeep.pragallapati@oss.qualcomm.com, nitin.rawat@oss.qualcomm.com
Subject: Re: [PATCH 2/3] arm64: dts: qcom: monaco-evk: Enable SDHCI for SD
 Card via overlay
Message-ID: <2ra2apfephjl2au6wel25gbxoxyvohf2ysq4yzaufp3xb7mtoi@g5p6asbk2fqe>
References: <20260227105055.2364348-1-monish.chunara@oss.qualcomm.com>
 <20260227105055.2364348-3-monish.chunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227105055.2364348-3-monish.chunara@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDE3NSBTYWx0ZWRfX26L9rJ5425p9
 8D/PIZeFIyHKzrQ4t4pCghVfgPCNMmj35CS7pRgO8V4XwKRrfYvq9UAnDtSIr1oBmrJKzHWvdJh
 0UK+LbALe0WpRxgU+BM1prg3Q1F0Q/vjBNJ+7ks5GRzM8sRymSV/8XlGlaYxsTU8JvBkLVG5dg0
 Mo2AHFDXB0IUFEVg80W+WyFfz6bEdXP8q2Iv84g76nN76Z/is8uIK5h/aiCfHug+IoljS+Z2HPA
 7DBIZYOzB7OyMIO9UOdvitXzerErtI0HyHl0Pzf40IB/+Mh8KL3SyeBhQZdw1SRhYWasVaT5+HI
 pFL0Lz/azbQcFqyiXK2PpMmZkbmreAIOSki+SSIy7Z1TNIcD7A2LyRr9IyQ3QdX+BWu0BEsaLlu
 zkmaEWzFwQfwFRhznrlXq0UeqzlfEiQtL5yl6TkH6Orh5eXjlO62R5tfHhssHvFMGKdpcLxEkSJ
 MbIKSBLlVQNPjHmxpIg==
X-Proofpoint-GUID: Gs254GQb7vwgpi4hNW1OXIBQZHtBFJCE
X-Proofpoint-ORIG-GUID: Gs254GQb7vwgpi4hNW1OXIBQZHtBFJCE
X-Authority-Analysis: v=2.4 cv=Z8Hh3XRA c=1 sm=1 tr=0 ts=69a1f882 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=Ok5KoevZxSgNYAnRRaUA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_04,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 adultscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602270175
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94524-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4A72B1BD2AF
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 04:20:54PM +0530, Monish Chunara wrote:
> The monaco EVK board supports either eMMC or SD-card, but only one
> can be active at a time.
> 
> Enable the SD Host Controller Interface (SDHCI) on the monaco EVK board
> to support SD Card for storage via a device tree overlay. This allows
> eMMC support to be enabled through a separate overlay when required.
> 
> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |  4 ++
>  .../boot/dts/qcom/monaco-evk-sd-card.dtso     | 72 +++++++++++++++++++
>  2 files changed, 76 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 317af937d038..c86242a1631d 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -46,6 +46,10 @@ lemans-evk-el2-dtbs := lemans-evk.dtb lemans-el2.dtbo
>  dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-el2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= milos-fairphone-fp6.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk.dtb
> +
> +monaco-evk-sd-card-dtbs := monaco-evk.dtb monaco-evk-sd-card.dtbo
> +dtb-$(CONFIG_ARCH_QCOM) += monaco-evk-sd-card.dtb
> +
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8216-samsung-fortuna3g.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-acer-a1-724.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-alcatel-idol347.dtb
> diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso b/arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso
> new file mode 100644
> index 000000000000..a0bc5c47d40b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso
> @@ -0,0 +1,72 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +
> +/ {
> +        vmmc_sdc: regulator-dummy {

No dummy regulators, please.

> +                compatible = "regulator-fixed";
> +
> +                regulator-name = "vmmc_sdc";
> +                regulator-min-microvolt = <2950000>;
> +                regulator-max-microvolt = <2950000>;
> +        };
> +
> +        vreg_sdc: regulator-sdc {
> +		compatible = "regulator-gpio";
> +
> +		regulator-name = "vreg_sdc";
> +		regulator-type = "voltage";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <2950000>;
> +
> +		gpios = <&expander1 7 GPIO_ACTIVE_HIGH>;
> +		states = <1800000 1>, <2950000 0>;
> +
> +		startup-delay-us = <100>;
> +        };
> +};
> +
> +&sdhc_1 {
> +	vmmc-supply = <&vmmc_sdc>;
> +	vqmmc-supply = <&vreg_sdc>;
> +
> +	pinctrl-0 = <&sdc1_state_on>, <&sd_cd>;
> +	pinctrl-1 = <&sdc1_state_off>, <&sd_cd>;
> +	pinctrl-names = "default", "sleep";
> +
> +	cap-sd-highspeed;
> +	no-1-8-v;
> +
> +	bus-width = <4>;
> +	cd-gpios = <&tlmm 11 GPIO_ACTIVE_LOW>;
> +	no-mmc;
> +	no-sdio;
> +
> +	status = "okay";
> +};
> +
> +&sdhc1_opp_table {

Why? Is it specific to the device or to the chip? In the latter case,
please define a separate table in the monaco.dtsi and switch to it here.

> +	opp-100000000 {
> +		opp-hz = /bits/ 64 <100000000>;
> +		required-opps = <&rpmhpd_opp_low_svs>;
> +	};
> +
> +	opp-202000000 {
> +		opp-hz = /bits/ 64 <202000000>;
> +		required-opps = <&rpmhpd_opp_svs_l1>;
> +	};
> +};
> +
> +&tlmm {
> +        sd_cd: sd-cd-state {
> +                pins = "gpio11";
> +                function = "gpio";
> +                bias-pull-up;
> +        };
> +};
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

