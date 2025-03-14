Return-Path: <linux-arm-msm+bounces-51399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AE363A60F86
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 12:03:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F419C3BA24F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 11:03:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 101E41F0E33;
	Fri, 14 Mar 2025 11:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ChG3IXmP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7991F03DA
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 11:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741950209; cv=none; b=Hprlici2HECurjSVuuK+Lz4wKjVu4tvLVBjSNcJbwXYiep71FmP32OyTvluzi0MlGnp7RgVVD2t6RF1KA3ja/aP47d5pBtAiL+WffKnnp1VN8FX42N0pQa4EM/Dsi+WSHRo1E/XqYLFj+vuWZh8frKR2WueB637lkpgHciMMAl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741950209; c=relaxed/simple;
	bh=uA7SPFr2eoMlKnEljinAiTQM0TacXxYpJ2X25QQZlM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tjjhVV+cdyewGQAj5Lp8t+ksyC6zm9YM3ptRhReObpZkKZdGEXxCUtkR2SWIoFQMmNuYyc6yQ1U7kYJWCGUaMew4Wf/SEiuJNM2wGbpGrx4punQ1NqHObXkdy7wj6cHm2hDD9dF9W6aG0WtRO/cPYMC6QNQhIXsH2S/9Uev0gyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ChG3IXmP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52EA3Nfl023485
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 11:03:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6HkQ+P7il5VrophlCzDt0ZOE
	0/DNYrGnQI57BKZz4bQ=; b=ChG3IXmPVdh/vnNcrHJr183ibBw1s07x84MEYMzO
	qpGs3aUtg54y4LrSPd5aYxtfvNo0TtTEx1iovhAUD3A+7UeaJy9qU/7q1zaexXZ1
	QZ5JY3ZHrwk4z8l/VLx3NPlglp/KTSXZj8E8UT8OtAgEg7h5G4OGLq4TXfweXKWI
	7hah9/Kq0kk0c+6yk7X4OAAfNrvFSi97G/em6jIndVDcrxo0+AZ9oMHzBGQAvAYu
	b5cKbHfvh5isUIxIE/DZb48fk4QmC3xpOtcITK3ZeIELn5PXoQ7JQ5Elcja/aXjU
	xLYNBSG3szL9+N7lKtcajbY8i5bl5YfcN75kR5xBdZmTSA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45cjc584ug-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 11:03:20 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c0b0cf53f3so319379885a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 04:03:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741950199; x=1742554999;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6HkQ+P7il5VrophlCzDt0ZOE0/DNYrGnQI57BKZz4bQ=;
        b=MvlFm7RfDnGIEjNBzSrgaMLBQDzvIW2FjvO0XbsEZv1V1+e6WS55KpssQuGergcRwS
         /Pk5/Nkf9FZTnVXsyzITIcKTjLLbSUNFmNLsjgCfQpBlzIzUEEfT2iM26QTSTk3Ohv1S
         AyguQzbWt6HOTl7zqXu6XnmBMMJlH214i22m64S/3ktD0wHQxpmQ9D9cy0PHW5Fno6Zs
         MoGv0s4EbZRc43Vz0L2JwXVKo95hfDR9/yi7yzT0l3iQbOxDaWgWp0BFUGj4SrJfADET
         oZseCsSg8Pl2gAyYrF6o3lly/1WLXSJ8OGAh8b+szp/bC85eubqIYmrAF1HE8BtEEPHJ
         RuxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdOS+clZpq97/Q4xbpDB1Q47y67ouL5A0Aw6P5gy9d0aPhSZn7whY31eLANWytbEOrghf2br4JiJbv3sol@vger.kernel.org
X-Gm-Message-State: AOJu0YwaOpqf/3adbae4iF4vRjmkkLydhBCkCixvCXaiVgezyDxuGz/J
	ypx2707lARb3G5QvRhIE1wc0uE0eYnJQ8rG21AbYxsSubQUdwzCrjUj6VbWC9CAPNqvOSRVfkru
	VD9rByzpJBvqK2SrYPddJ3hxSZK4skHGFI+uYSEeG7DifO2o4pfHvSwRJDo34XS7d
X-Gm-Gg: ASbGncteT1d1nXXzZ+hGv4NngvtU1LpHC3vtFiZO5FVou905dFsPOU+AvSmvmiiL4e/
	57n/ihr3MjRQUEmz07P4TP1+A7FXPVU4H43fUBP2FnzAoZwJW/9O+oEw/tYr+W1o+QsuulvMe38
	N4O9WOIlWTmJQxCKS0GGjEvyaL2iReO3GamBw3CiJo5rAUu+nReeG3ZRQyVYjnLD0GSTv0LsdTl
	a+YjIZh+tRd5C1Btfe/MsY8512DaiFEV+aVJVHZ2KQF1eHp7bPs6R911bnE9QI5ViWzCjnSBis5
	y1xEOpiVhMCQRll+r4B2ghRK1ih2cnG0ps5bqKVQAEJZifiLHHr4cy96Q1DyisVJImLNb6tJWKO
	7kB8=
X-Received: by 2002:a05:620a:6607:b0:7c5:42c3:995b with SMTP id af79cd13be357-7c57c51fb5amr273681385a.0.1741950199202;
        Fri, 14 Mar 2025 04:03:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJqv0A6/GgCBpRWkFeSW9R9b930vCjhHsUHqsb6uc1hKHQSzgO4HVnGX+yBQWMs0N7NthbpA==
X-Received: by 2002:a05:620a:6607:b0:7c5:42c3:995b with SMTP id af79cd13be357-7c57c51fb5amr273675685a.0.1741950198812;
        Fri, 14 Mar 2025 04:03:18 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba88213esm486573e87.175.2025.03.14.04.03.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 04:03:16 -0700 (PDT)
Date: Fri, 14 Mar 2025 13:03:13 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        chaitanya chundru <quic_krichai@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Jingoo Han <jingoohan1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, quic_vbadigan@quicnic.com,
        amitk@kernel.org, dmitry.baryshkov@linaro.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        jorge.ramirez@oss.qualcomm.com
Subject: Re: [PATCH v4 02/10] arm64: dts: qcom: qcs6490-rb3gen2: Add TC956x
 PCIe switch node
Message-ID: <acqkh4isxn5e7pxbd22pvb2rbs7zhjnrcjaojomilvqaxwfz5o@kqkr4cn7qovs>
References: <20250225-qps615_v4_1-v4-0-e08633a7bdf8@oss.qualcomm.com>
 <20250225-qps615_v4_1-v4-2-e08633a7bdf8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225-qps615_v4_1-v4-2-e08633a7bdf8@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: xByk7iER90w8WS6GTqTZ5JmKAE06u5zv
X-Proofpoint-GUID: xByk7iER90w8WS6GTqTZ5JmKAE06u5zv
X-Authority-Analysis: v=2.4 cv=G/kcE8k5 c=1 sm=1 tr=0 ts=67d40cf8 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=v3gW0WraWtuZ-AJ_RegA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_04,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 bulkscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 impostorscore=0 mlxlogscore=999 mlxscore=0 phishscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503140087

On Tue, Feb 25, 2025 at 03:03:59PM +0530, Krishna Chaitanya Chundru wrote:
> Add a node for the TC956x PCIe switch, which has three downstream ports.
> Two embedded Ethernet devices are present on one of the downstream ports.
> 
> Power to the TC956x is supplied through two LDO regulators, controlled by
> two GPIOs, which are added as fixed regulators. Configure the TC956x
> through I2C.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> Reviewed-by: Bjorn Andersson <andersson@kernel.org>
> Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 116 +++++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sc7280.dtsi         |   2 +-
>  2 files changed, 117 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> index 7a36c90ad4ec..13dbb24a3179 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> @@ -218,6 +218,31 @@ vph_pwr: vph-pwr-regulator {
>  		regulator-min-microvolt = <3700000>;
>  		regulator-max-microvolt = <3700000>;
>  	};
> +
> +	vdd_ntn_0p9: regulator-vdd-ntn-0p9 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VDD_NTN_0P9";
> +		gpio = <&pm8350c_gpios 2 GPIO_ACTIVE_HIGH>;
> +		regulator-min-microvolt = <899400>;
> +		regulator-max-microvolt = <899400>;
> +		enable-active-high;
> +		pinctrl-0 = <&ntn_0p9_en>;
> +		pinctrl-names = "default";
> +		regulator-enable-ramp-delay = <4300>;
> +	};
> +
> +	vdd_ntn_1p8: regulator-vdd-ntn-1p8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VDD_NTN_1P8";
> +		gpio = <&pm8350c_gpios 3 GPIO_ACTIVE_HIGH>;
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		enable-active-high;
> +		pinctrl-0 = <&ntn_1p8_en>;
> +		pinctrl-names = "default";
> +		regulator-enable-ramp-delay = <10000>;
> +	};
> +
>  };
>  
>  &apps_rsc {
> @@ -735,6 +760,75 @@ &pcie1_phy {
>  	status = "okay";
>  };
>  
> +&pcie1_port {
> +	pcie@0,0 {
> +		compatible = "pci1179,0623", "pciclass,0604";
> +		reg = <0x10000 0x0 0x0 0x0 0x0>;
> +		#address-cells = <3>;
> +		#size-cells = <2>;
> +
> +		device_type = "pci";
> +		ranges;
> +		bus-range = <0x2 0xff>;
> +
> +		vddc-supply = <&vdd_ntn_0p9>;
> +		vdd18-supply = <&vdd_ntn_1p8>;
> +		vdd09-supply = <&vdd_ntn_0p9>;
> +		vddio1-supply = <&vdd_ntn_1p8>;
> +		vddio2-supply = <&vdd_ntn_1p8>;
> +		vddio18-supply = <&vdd_ntn_1p8>;
> +
> +		i2c-parent = <&i2c0 0x77>;
> +
> +		reset-gpios = <&pm8350c_gpios 1 GPIO_ACTIVE_LOW>;

Please add pinctrl blck for this reset line.

-- 
With best wishes
Dmitry

