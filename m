Return-Path: <linux-arm-msm+bounces-107157-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uBxBDQ11A2oV6AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107157-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 20:44:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C73B5280B0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 20:44:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 313BE3002523
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 18:44:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 394E231A556;
	Tue, 12 May 2026 18:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pyC+Ihz/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J+jBWcDm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9BD25B0A0
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 18:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778611464; cv=none; b=etaNHfi7UAJphjwLtwW3aPrKPTCgZ+bmeiqtVdo7+velWSmzBsnyiQrMZSrn+3gaFPtXL2ThBihfM+zqtnx4Tlofmp2Ez7JCd7jvOCIeV8khAJ0LXEqCG07U5pGxxSUEJXsLNOEikHpPCrVdAYpi7FOoqpEe3bAkffsqZkbGYgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778611464; c=relaxed/simple;
	bh=0WgnADf8gW21VEkMKYax5p7wgR5qzR7XFSEkNlML0FU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=siexdaW+PsmcD/iiXcdqEbweu0OxHU1ruLVlwkgbaGSJn0Ng+DRQDAUqP2BEBWetVR9ggvzE6f2Zll0fwejboBTBDotqr2H5Si0h4kIeS27IRjd/i0SanCNp2w+k0xV8RIn/uNlUygzva4ke49y0Pplvn7jz3Tiyb3zpXe0DYac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pyC+Ihz/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J+jBWcDm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CBxIGr128828
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 18:44:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1z8noNWUNcaojOyQ5eMCA2GD
	jD+HA6EYOuAKBMLmseU=; b=pyC+Ihz/qZqlL1ErPSwujD63XzbmnByDOzamhn0g
	QHYA9zSmyI/m2AXYyxm26q4iJL31UCrcYu078ja0WAwDWG3J5wr+cENeSqDiQHU+
	3kJ87iPV8U4/rSRTwmjqx2KZOeJroW9Yvze+SMgzCxj8Y+kj9UiJg8i6qg/O/9BF
	lX5iZ3m+HyYAmj6NXC8XOEpyOuV4344GpWLM9pFRlp+nZosQKj+xG3pCuf4AUwM1
	WMRPXks8GhcvSE2/6agnldN6Yymi6mqYvbUZPxpzdnr1Lxp7x0LcO0kcEpUK8F8+
	aA3Gz5AFk+UEcySJL9TuWv9OD5zr/cogTNoTSNnGr2aA9A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e43tn1jty-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 18:44:21 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50fb3403e99so111416641cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 11:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778611461; x=1779216261; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1z8noNWUNcaojOyQ5eMCA2GDjD+HA6EYOuAKBMLmseU=;
        b=J+jBWcDmKqJ11ZoPmRW84shd98djLrwaLjAznSqD3TD0SUnji3RsUzcI+PwSVvCeSa
         U4mln06V8g4QL0pJqcLuWEwAHa5QePkoCUKr4Ybr/9VOav8JU/mP/GUK7CsDE3tWU734
         b9RzGIcdfkYI8IvbcBa8l2/7+1iK89VGYNXo6VTGco7pNtAneDsfJVMuVVCLAnKuEWhM
         Vk7JyfKC+75PwSH+4wqkA75OKUY4ZNUG3XCVga2U789E1bnyqlSCohF1qwebWM84rgFa
         bEDGjrLvwnoJRN2K9kzUs8oYPQf7ZKJ1L9bZxKnjQ3x6UY6IXWEAbawPrB/YXr6wpvsA
         I8+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778611461; x=1779216261;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1z8noNWUNcaojOyQ5eMCA2GDjD+HA6EYOuAKBMLmseU=;
        b=AaiYOB6g4ZLJGQ6YPOvdNHOxTWQ9Be1YdyPUZxPDO14wOF7DC/Q4x/j2QpT2dmbpth
         nWKBQ1UupYgMAxrT1D0+SNJKVD23XV0FGIM8gRnLobUuV3a0VmkeKx42vtBwEQHNB01m
         yyrDYBJpxshHS8OPNzkD542k/PZPheRvn2CYDYlp4ethngZtOn5zKydq4LnfJ0pAyjXf
         A3bYHQF6R/O2E0hJKjahZ4BqbNbAxAPHqsfHzFeGPSEG6H3mL5fH8N4mi0dUY3awW2e4
         +lwx/Br22w9bmg7nQ142AQKl+iS0R+tfeQig5fUBirPjzXK3Px2mgT23brcBLbe56E4R
         HVFg==
X-Gm-Message-State: AOJu0YyiTtqF5BQxg7UZBKSLPw832xFf+vKMMObCenWSRGWCiM1unMY0
	+zTw54mFMITn2wCS0dn6NdmYIz1yZyhSOj30O+7mbYkRaXJIh//gf9qPzTc6E7xlpWE9oqPcgtw
	Xd+uVA4kdbwJySAT4vYfW3ut4/aac+wdKZxFXv2KA0OQs7uJ2gJ7N5lm28IzdDrDEy2SP
X-Gm-Gg: Acq92OHzdSjo/xxKqQEmKUxCKHTXxWet26rU+fbOtBII0lihzhubcmoPGy+R5JTxzbp
	X0y8dtu8KHIz98DAdmBzq/t7MfLpBYBHmsFskGj+aiqKlaKluwfmVDIlg2Z2X7trXRh8UlxMk9s
	dW3c/ljM0UxN0YSHbKwJlhMD5OvoRJZrLv0j25Og3XmfymUyKvGcZHwyPvbHI8b2dKH4J/iUP1r
	1i4gaCUujykj+MRyXScikLZsdYHb6JsBp1DSsNousDKWvC1uMT8zqTu9scB61PK8CZHBA5zKXea
	EbpYaXdZ/QPVTAklecO20hbvbfy+IpwqTMRE1bcmbM3XJ9JD18D7XpfyQlk/8JxzVdkbMAHf5S8
	Z0IJx09RwXYVB0d1GUukC72ZJY8d2zTcZfaXWyi077vPRknvSEzD0Sbxk/SfZ8Uvi8v5XyJBJ3c
	n4kfr6zoNSMTMn5D8ocWVE1WRHGuJ58+OVr9s=
X-Received: by 2002:a05:622a:293:b0:50e:d316:fa33 with SMTP id d75a77b69052e-514d21ee159mr58032431cf.39.1778611460513;
        Tue, 12 May 2026 11:44:20 -0700 (PDT)
X-Received: by 2002:a05:622a:293:b0:50e:d316:fa33 with SMTP id d75a77b69052e-514d21ee159mr58031881cf.39.1778611459900;
        Tue, 12 May 2026 11:44:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a955dfa8sm3570284e87.41.2026.05.12.11.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 11:44:18 -0700 (PDT)
Date: Tue, 12 May 2026 21:44:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 8/8] arm64: dts: qcom: Add Microsoft Surface Pro 12in
Message-ID: <oyqhjsnw52vcopfwcapj3gkcilf4em5qzehfz3viv6o5gxtg52@ealihnsxjda6>
References: <cover.1778498477.git.harrison.vanderbyl@gmail.com>
 <67c50d27e133774e0a4edc17403e4218ddd86efd.1778498477.git.harrison.vanderbyl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67c50d27e133774e0a4edc17403e4218ddd86efd.1778498477.git.harrison.vanderbyl@gmail.com>
X-Proofpoint-ORIG-GUID: bg79j4CySR3VpC3kUlRJRrMaklHlRpKT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDE5NCBTYWx0ZWRfX47cvfQjfHd+B
 jl/d5wqycrJ4o8wTJWb18SZmZvp8NnIFjz+aqrdjlWzv9nzjh6TtDKKsPafE9yQaqmPysScHyNZ
 GSaT6ZpQtallZAqJQm7XrNJCSbU1zm8z+NQhP13ZxFz3Y+w3aayAeB4c4GOYE37JnuCTtcfLT+N
 XWwWcVkw7CbziBjVM0TroEe2686knS0nvJgNgOLviKpZ4KRYbQB5i2xGhoIvu1RNIVQrunewHuw
 hGHKl0J3EQpO4OcQJxzmwDuIATX7l10OBLESqRVLdsC4eIa/JTVUAIP9M+QZKbMZvxbjbNakSB8
 mIOmAaVGb55OIW+mIqQl97ahETODMpHlU630qKVAts6JcUPlEjvATpHXCSkJfo/cNFsul9OFqHl
 8ibJJtWdbl9NrIYj1YAhUQvhqMaOouPEvBVDMDGVgD6s8TwyyR+neAktaIjsOp5AthoM/cFAwY/
 5u+Hn3JVUCZuHgxJqIQ==
X-Proofpoint-GUID: bg79j4CySR3VpC3kUlRJRrMaklHlRpKT
X-Authority-Analysis: v=2.4 cv=Ebn4hvmC c=1 sm=1 tr=0 ts=6a037505 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=pGLkceISAAAA:8
 a=ZpCncajAScL7xv-N9qQA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120194
X-Rspamd-Queue-Id: 2C73B5280B0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107157-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,0.0.0.1:email,0.0.0.0:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,0.0.0.2:email];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Tue, May 12, 2026 at 12:40:57AM +1000, Harrison Vanderbyl wrote:
> Initial device tree for Microsoft Surface Pro 12in
> 
> Currently supported:
>   - UFS
>   - Touchscreen
>   - Pen
>   - USB 3.2 x2 (DP Alt Mode)
>   - Audio
>   - Wifi
>   - Bluetooth
>   - CDSP
>   - ADSP
>   - GPU
> 
> Not currently supported:
>   - Accelerometer
>   - Front, Back and IR cameras
>   - IRIS video decoder
> 
> Tested on Surface_Pro_12in_1st_Ed_with_Snapdragon_2110
> 
> Signed-off-by: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |    2 +
>  .../dts/qcom/x1p42100-microsoft-sp12in.dts    | 1160 +++++++++++++++++
>  2 files changed, 1162 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/x1p42100-microsoft-sp12in.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 4ba8e7306419..8b6d3e4b479c 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -449,3 +449,5 @@ x1p42100-lenovo-thinkbook-16-el2-dtbs	:= x1p42100-lenovo-thinkbook-16.dtb x1-el2
>  dtb-$(CONFIG_ARCH_QCOM)	+= x1p42100-lenovo-thinkbook-16.dtb x1p42100-lenovo-thinkbook-16-el2.dtb
>  x1p64100-microsoft-denali-el2-dtbs	:= x1p64100-microsoft-denali.dtb x1-el2.dtbo
>  dtb-$(CONFIG_ARCH_QCOM)	+= x1p64100-microsoft-denali.dtb x1p64100-microsoft-denali-el2.dtb
> +x1p42100-microsoft-sp12in-el2-dtbs	:= x1p42100-microsoft-sp12in.dtb x1-el2.dtbo
> +dtb-$(CONFIG_ARCH_QCOM)	+= x1p42100-microsoft-sp12in.dtb x1p42100-microsoft-sp12in-el2.dtb
> diff --git a/arch/arm64/boot/dts/qcom/x1p42100-microsoft-sp12in.dts b/arch/arm64/boot/dts/qcom/x1p42100-microsoft-sp12in.dts
> new file mode 100644
> index 000000000000..3a754179a848
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/x1p42100-microsoft-sp12in.dts
> @@ -0,0 +1,1160 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2024, Linaro Limited
> + * Copyright (c) 2025, Jens Glathe
> + * Copyright (c) 2025, Harrison Vanderbyl
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/gpio-keys.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +#include <dt-bindings/clock/qcom,x1e80100-tcsr.h>
> +
> +#include "purwa.dtsi"
> +#include "hamoa-pmics.dtsi"
> +
> +/delete-node/ &pmc8380_6;
> +/delete-node/ &pmc8380_6_thermal;
> +
> +/ {
> +	model = "Surface Pro 12in 1st Edition";
> +	compatible = "microsoft,surface-pro-12in", "qcom,x1p42100";
> +	chassis-type = "tablet";
> +
> +	aliases {
> +		serial0 = &uart2;
> +		serial1 = &uart14;
> +	};
> +
> +	backlight: backlight {
> +		compatible = "pwm-backlight";
> +		pwms = <&pmk8550_pwm 0 5000000>;
> +
> +		power-supply = <&vreg_edp_3p3>;
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		pinctrl-0 = <&hall_int_n_default>;
> +		pinctrl-names = "default";
> +
> +		switch-lid {
> +			gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
> +			linux,input-type = <EV_SW>;
> +			linux,code = <SW_LID>;
> +			wakeup-source;
> +			wakeup-event-action = <EV_ACT_DEASSERTED>;
> +		};
> +
> +		key-vol-up {
> +			gpios = <&pm8550_gpios 8 GPIO_ACTIVE_LOW>;
> +			linux,code = <KEY_VOLUMEUP>;
> +			debounce-interval = <15>;
> +			linux,can-disable;
> +			wakeup-source;
> +		};
> +
> +		key-vol-down {
> +			gpios = <&pm8550_gpios 6 GPIO_ACTIVE_LOW>;
> +			linux,code = <KEY_VOLUMEDOWN>;
> +			debounce-interval = <15>;
> +			linux,can-disable;
> +			wakeup-source;
> +		};
> +	};
> +
> +	pmic-glink {
> +		compatible = "qcom,x1e80100-pmic-glink",
> +				 "qcom,sm8550-pmic-glink",
> +				 "qcom,pmic-glink";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		orientation-gpios = <&tlmm 121 GPIO_ACTIVE_HIGH>,
> +					<&tlmm 123 GPIO_ACTIVE_HIGH>;
> +
> +		/* Right-side upper port */
> +		connector@0 {
> +			compatible = "usb-c-connector";
> +			reg = <0>;
> +			power-role = "dual";
> +			data-role = "dual";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					pmic_glink_ss0_hs_in: endpoint {
> +						remote-endpoint = <&usb_1_ss0_dwc3_hs>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					pmic_glink_ss0_ss_in: endpoint {
> +						remote-endpoint = <&usb_1_ss0_qmpphy_out>;
> +					};
> +				};
> +
> +				port@2 {
> +					reg = <2>;
> +
> +					pmic_glink_ss0_sbu: endpoint {
> +						remote-endpoint = <&usb_1_ss0_sbu_mux>;
> +					};
> +				};
> +			};
> +		};
> +
> +		/* Right-side lower port */
> +		connector@1 {
> +			compatible = "usb-c-connector";
> +			reg = <1>;
> +			power-role = "dual";
> +			data-role = "dual";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					pmic_glink_ss1_hs_in: endpoint {
> +						remote-endpoint = <&usb_1_ss1_dwc3_hs>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					pmic_glink_ss1_ss_in: endpoint {
> +						remote-endpoint = <&usb_1_ss1_qmpphy_out>;
> +					};
> +				};
> +
> +				port@2 {
> +					reg = <2>;
> +
> +					pmic_glink_ss1_sbu: endpoint {
> +						remote-endpoint = <&usb_1_ss1_sbu_mux>;
> +					};
> +				};
> +			};
> +		};
> +	};
> +
> +	reserved-memory {
> +		linux,cma {
> +			compatible = "shared-dma-pool";
> +			size = <0x0 0x20000000>;
> +			reusable;
> +			linux,cma-default;
> +		};
> +	};
> +
> +	vreg_edp_3p3: regulator-edp-3p3 {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_EDP_3P3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&tlmm 70 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&edp_reg_en>;
> +		pinctrl-names = "default";
> +
> +		regulator-boot-on;
> +	};
> +
> +	vph_pwr: regulator-vph-pwr {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "vph_pwr";
> +		regulator-min-microvolt = <3700000>;
> +		regulator-max-microvolt = <3700000>;
> +	};
> +
> +	vreg_wcn_0p95: regulator-wcn-0p95 {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_WCN_0P95";
> +		regulator-min-microvolt = <950000>;
> +		regulator-max-microvolt = <950000>;
> +
> +		vin-supply = <&vreg_wcn_3p3>;
> +	};
> +
> +	vreg_wcn_1p9: regulator-wcn-1p9 {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_WCN_1P9";
> +		regulator-min-microvolt = <1900000>;
> +		regulator-max-microvolt = <1900000>;
> +
> +		vin-supply = <&vreg_wcn_3p3>;
> +	};
> +
> +	vreg_wcn_3p3: regulator-wcn-3p3 {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_WCN_3P3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&tlmm 214 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&wcn_sw_en>;
> +		pinctrl-names = "default";
> +	};
> +
> +	sound {
> +		compatible = "qcom,x1e80100-sndcard";
> +		model = "X1P42100-Microsoft-Surface-Pro-12in";

I see a PR for alsa-ucm-conf. Would you please also submit the topology
to audioreach-topology?

> +		audio-routing = "SpkrLeft IN", "WSA WSA_SPK1 OUT",
> +				"SpkrRight IN", "WSA WSA_SPK2 OUT",
> +				"VA DMIC0", "vdd-micb",
> +				"VA DMIC1", "vdd-micb",
> +				"VA DMIC2", "vdd-micb",
> +				"VA DMIC3", "vdd-micb";
> +

[...]

> +
> +	usb-1-ss1-sbu-mux {
> +		compatible = "onnn,fsusb42", "gpio-sbu-mux";
> +
> +		enable-gpios = <&tlmm 179 GPIO_ACTIVE_LOW>;
> +		select-gpios = <&tlmm 178 GPIO_ACTIVE_HIGH>;
> +
> +		pinctrl-0 = <&usb_1_ss1_sbu_default>;
> +		pinctrl-names = "default";
> +
> +		mode-switch;
> +		orientation-switch;
> +
> +		port {
> +			usb_1_ss1_sbu_mux: endpoint {
> +				remote-endpoint = <&pmic_glink_ss1_sbu>;
> +			};
> +		};
> +	};
> +

Nit: extra empty line

> +};
> +

[...]

> +
> +&i2c0 {
> +	clock-frequency = <400000>;
> +
> +	status = "okay";

If you have an idea of the devices on these busses, would you please add
corresponding comments?

> +};
> +
> +&i2c4 {
> +	clock-frequency = <400000>;
> +
> +	status = "okay";
> +};
> +
> +&i2c9 {
> +	clock-frequency = <400000>;
> +
> +	status = "okay";
> +};
> +

-- 
With best wishes
Dmitry

