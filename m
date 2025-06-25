Return-Path: <linux-arm-msm+bounces-62486-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5288DAE86B0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 16:38:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D7D327B0429
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 14:37:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B10D2690E7;
	Wed, 25 Jun 2025 14:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ky4Ffp+Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8603234973
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 14:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750862330; cv=none; b=n5irAljMmAke5ptPuWVUYi+ivJjwRQ6fPQdBYlySHVfIPkutkSpaAQLsVnsrIQD3h1Vadj9hsO8RiCbsoAgq1z0jUIaeJ4ZdkXAlKNakEtCgGl7lgWNZ/Z3Ew8Q8HGmcHawrBdHR2VHBggztEmp/jR25lFvAsH2rRXI3sBNrWB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750862330; c=relaxed/simple;
	bh=gUCK5ZPtvm6MgHUIDv1wxFAc1ecbFd2rMDQC/jqlAuk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iA4UAB3clrlcJatSBWwcUkCWFN9+/88pSyJ5fd6cVwsPtSAq2kqzxLGEHHV3V3r+x2SAIhn5h8XeO3thRt8O+Ix8eEE/x0mgo/wzrQ+DGHoIOTyrlpkJw+7WCr1FHby9uJyw9sk6rWG3mwb9J8Nlv1XglZKqntu2gm/27VZQKiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ky4Ffp+Y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PBR8VX026740
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 14:38:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vyp603+DXROKlY8+1tRFEeF1aiIPfGdpzbAJfdYnfMY=; b=ky4Ffp+Y8DWJ5sga
	ATB71pj5U7o5cN3QB6T16JQmjj9MVT+way4qI2/Jnj/Bq/MVAyK1OeaP0n9T1lsG
	nYFZroUkLr3jSm4w2xC4/5tpDKeth0qamfd4HVCm671aUtqZ9txeItoWat8IPjuZ
	2zXLys17vwfBwPHHcAxyy+fdYMxni94WDpwmBRkWcFyZY/4sNf4iug5HnkGDE9io
	G/WnjXSB8FAkJYqH7drWISk5RktaYC0S4QOykHl/T0tPfdjGsqLoKtjtAGZpCasv
	HrhG2PqWoVhlMDa1QH2fv2l1Hn8eYWKj3OveQhgK2IDivLOiIsbTg9NNaMwKxGqJ
	WuP4LA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbhqpq6c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 14:38:47 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4a5a9791fa9so20799551cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 07:38:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750862326; x=1751467126;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vyp603+DXROKlY8+1tRFEeF1aiIPfGdpzbAJfdYnfMY=;
        b=BxFt5dXDcDxP1DEda21ySfaAEpEqExH9N22kz38szViB3ZrxJ3Mn1XfxE8XUHkYza9
         1clgWtcfwY2KKzL0nqi4wPxlPTdyQ9MvMgIpEWLyKje/eL8Y51i9DHGVc+gfFuUw9aCT
         clIZutXemQtagzYAXB2IHadlQ9FcJrEXVLW/apy71hd8DTYCi4aw7JkWkZqnSwgPAEw1
         PcsRSLxIVUuosdtKoQrbAA9FdjvOeMueh/AdHVINaaB7C3AFCypLMmkzuBoT1A8gNI4q
         vj2yNXwX0ZzUV8wTzt+MUD9geEyaCJcSuUGhjV+jyyEkn0OSVIKNLA8OJsO+4qWdE+0E
         ttHg==
X-Forwarded-Encrypted: i=1; AJvYcCX5J2od346Ury+GZWJT8FqX+oe8OMDv6umT+wAlA9BHQKF4OYYU3YXT0pgur7Wj8srXWu1VC+jwgrev/rZs@vger.kernel.org
X-Gm-Message-State: AOJu0YxO7dXypGAUnmoSxDyNRrEm8FymiO5KH8esQeGpqlqGtl5tL0qP
	uNpawsw7S5817tzoOU2YI1iafU3HgwhSuQeSDRKh4Fi7ve7GvzqpdRMF1VjflNN57hom0Ddu2dE
	I69L03eGvqE/9PDnFAA4+6wFlvXC9zxXUURHrv8HnGB+9cwyVpr2LPeK5OdzUKzun9CkU
X-Gm-Gg: ASbGncv5BrlM5oi1F1PnhyY0oSbcp37FoDOR6XW75svRV7Stu10tDcet/11PTzbEdGP
	7cGKwU0qeyCvS2jJ8EE80/yGrKyn4UxRBA+NUwQCZ4jk1C24KHk6GqhusDaoP8z1Qpfb9XGWPKd
	DoJejVDsphVvVO0w6AebUUYxSOmPJmrRnajCZlY5k47fKyMFXr9gHRQdKAqmiOmiwdDxorjxpyM
	KdTtQT1Bbk4XxMuP5B0yK/ZTg9UAuA0XDvVwDBACuW8NMMB9BUeCaCZe8cbX9N44QcnJmeSXt5A
	XUDLs0ZN5apU9Gl690TwBUYdc2o8CPHOThkThpZGbisdZjNVbnPlKFnpvvlWqJNAlVPtI7oB1MS
	ehBs=
X-Received: by 2002:a05:620a:4713:b0:7d3:cec3:3ff with SMTP id af79cd13be357-7d4295fddb1mr179161685a.0.1750862326376;
        Wed, 25 Jun 2025 07:38:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHsbOpyUO4OQKuHvZNG56/kH2wg/UDN88jgkkkppU/y2V4JJtDrErgvtJkUii1DRKOsax2AQ==
X-Received: by 2002:a05:620a:4713:b0:7d3:cec3:3ff with SMTP id af79cd13be357-7d4295fddb1mr179159185a.0.1750862325910;
        Wed, 25 Jun 2025 07:38:45 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae053ee4cdcsm1076068666b.56.2025.06.25.07.38.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 07:38:44 -0700 (PDT)
Message-ID: <4200b3b8-5669-4d5a-a509-d23f921b0449@oss.qualcomm.com>
Date: Wed, 25 Jun 2025 16:38:39 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/14] arm64: dts: qcom: Add The Fairphone (Gen. 6)
To: Luca Weiss <luca.weiss@fairphone.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Das Srinagesh <quic_gurus@quicinc.com>,
        Thomas Gleixner
 <tglx@linutronix.de>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-mmc@vger.kernel.org
References: <20250625-sm7635-fp6-initial-v1-0-d9cd322eac1b@fairphone.com>
 <20250625-sm7635-fp6-initial-v1-14-d9cd322eac1b@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250625-sm7635-fp6-initial-v1-14-d9cd322eac1b@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 2OlPltFliDvlzSpJpnjn0wtR8KM7zc5V
X-Authority-Analysis: v=2.4 cv=Id+HWXqa c=1 sm=1 tr=0 ts=685c09f7 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=gOtRruwUTqeMBgDD9hEA:9
 a=QEXdDO2ut3YA:10 a=5XHQ0vS7sDUA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 2OlPltFliDvlzSpJpnjn0wtR8KM7zc5V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDEwNiBTYWx0ZWRfX/Uji/VSiTLfv
 o3N7tnE3hUGZ3mbfXWx7HYeeX8ELm0s9Wmm2MT+OQ9yRLl6I+KWUObbSH0GALpvgTeP5N/DIpIY
 Yv7aXJOnpWgvv/9SRS7vBq+Hm9NEAFSPw5Z1EYm4Is+Nh8yvMLxq2hOhOgYjWK123L47d3OBjb9
 KGLaKNEQmacqJSQtMqXZTmC+dbH31D4iGFf6jQaUo8yWNi00j7Q8NK75cmpgum5om8dk5VE0pi0
 /75uBN2cVEtE+hyD0VCPWfhHSu0qO+LRNiHzr24UowUiGcqEVOaRii1QuIYSt1ZPNCbzpsl29Ve
 MsvH54+59vC2Kf3BxokEuRWAZvAbCDoA/fIyUvPWbyWbh72xtMSTFx9vKw5lTUpGok4zPo1mGWx
 6KTvQM8aK4nLE+H49L2GuBL3Y4ueK/lCdAqpDok2izsI4Hhx4YlqLLb+jh6GvKV4nigEeM3b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_04,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 mlxlogscore=999 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250106

On 6/25/25 11:23 AM, Luca Weiss wrote:
> Add a devicetree for The Fairphone (Gen. 6) smartphone, which is based
> on the SM7635 SoC.

[...]

> +	/* Dummy panel for simple-framebuffer dimension info */
> +	panel: panel {
> +		compatible = "boe,bj631jhm-t71-d900";
> +		width-mm = <65>;
> +		height-mm = <146>;
> +	};

I haven't ran through all the prerequisite-xx-id, but have
you submitted a binding for this?

[...]

> +	reserved-memory {
> +		/*
> +		 * ABL is powering down display and controller if this node is
> +		 * not named exactly "splash_region".
> +		 */
> +		splash_region@e3940000 {
> +			reg = <0x0 0xe3940000 0x0 0x2b00000>;
> +			no-map;
> +		};
> +	};

:/ maybe we can convince ABL not to do it..

[...]

> +		vreg_l12b: ldo12 {
> +			regulator-name = "vreg_l12b";
> +			/*
> +			 * Skip voltage voting for UFS VCC.
> +			 */

Why so?

[...]

> +&gpi_dma0 {
> +	status = "okay";
> +};
> +
> +&gpi_dma1 {
> +	status = "okay";
> +};

These can be enabled in SoC DTSI.. it's possible that the secure 
configuration forbids access to one, but these are generally made
per-platform

[...]

> +&pm8550vs_d {
> +	status = "disabled";
> +};
> +
> +&pm8550vs_e {
> +	status = "disabled";
> +};
> +
> +&pm8550vs_g {
> +	status = "disabled";
> +};

Hm... perhaps we should disable these by deafult

[...]

> +&pmr735b_gpios {
> +	pm8008_reset_n_default: pm8008-reset-n-default-state {
> +		pins = "gpio3";
> +		function = PMIC_GPIO_FUNC_NORMAL;
> +		bias-pull-down;
> +	};
> +
> +	s1j_enable_default: s1j-enable-default-state {
> +		pins = "gpio1";
> +		function = PMIC_GPIO_FUNC_NORMAL;
> +		power-source = <0>;
> +		bias-disable;
> +		output-low;
> +	};

ordering by pin ID makes more sense, here and in tlmm

(and is actually written down)
https://docs.kernel.org/devicetree/bindings/dts-coding-style.html#order-of-nodes

[...]

> +&pon_resin {
> +	linux,code = <KEY_VOLUMEDOWN>;
> +	status = "okay";

\n before status consistently, please

[...]

> +&tlmm {
> +	/*
> +	 * 8-11: Fingerprint SPI
> +	 * 13: NC
> +	 * 63-64: WLAN UART
> +	 */
> +	gpio-reserved-ranges = <8 4>, <13 1>, <63 2>;

Please match the style in x1-crd.dtsi

[...]

> +&usb_1 {
> +	dr_mode = "otg";
> +
> +	/* USB 2.0 only */

Because there's no usb3phy description yet, or due to hw design?

Konrad


