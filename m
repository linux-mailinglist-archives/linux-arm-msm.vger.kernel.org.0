Return-Path: <linux-arm-msm+bounces-75191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA73BA1647
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 22:43:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE21B16DF49
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 20:43:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58BC731DD94;
	Thu, 25 Sep 2025 20:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fz8Zpio0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A3831CA46
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 20:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758832986; cv=none; b=PU1Y/f/4Ej2YPQYyH04C9WP+fGt7vdDTL6ozvIrgfI/IqujixtjJljUQ1IwvSK8fNvERTNur+zD1dxE+i6vNeDIerNq/P8wYNYp88UZP/recgv0TQMdX5/9wHxV/UoXVBSbbI5ztPcpkvOjVC+SeeF9v6kz2caAzYW3Qlmdq3QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758832986; c=relaxed/simple;
	bh=ygMLJUifwBD2n5BbSFwl/1zwN12a+/Q7VI0csOxJzZk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=co33mgJM4p9eE4lZeFCSmx4IY3fHFCe5H1pqsVqZYSIAtOWDEi2TEAwJDuh27z8kBXKA+9xx8ZKmGkMk8bdtEtauN0KA22b9aNgOpcbC+t9djX49BMkU0XHwZBYhFWrbYZFCWm7XvyqmDZquL6TZ4pHFFYRPvODzwoDD+I0VyIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fz8Zpio0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIPboG011343
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 20:43:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7xfajRoQImW3Z1U1Bgu0TqpR
	sRvoptF54tNJXpBqmXM=; b=Fz8Zpio0c9aHZs4daiigFkLBtowSs35yginwLHhC
	5HFK8AYU4rmGlliOHYNPinkujHBVDyPri7DmYl9LPhBy4+69cwFI/2/2Cg291B48
	KQEsASXKflyjPg5bvnjQnOgWg+geJpwE4xRK391Ak/7CS4m3JWwxUI8++3MbyWlw
	8OvJ9bzjqFZoEDEVSnT9g9Oo9aIqt4Cp1+OWSu3gHsSbEL5hoQ3c2w39sEj/vgIU
	29ZWbzCTO6ntQeF3/ERZR88W1X2dai1TZo+rFcFRqIn6yNqoz96MgUYreqqXAJaM
	1gA69YxsH+hZJu7nOUo1WCQLkqoLX9jQRQamYRpHu8xUfA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0q0abj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 20:43:03 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b5ee6cd9a3so33544721cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 13:43:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758832982; x=1759437782;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7xfajRoQImW3Z1U1Bgu0TqpRsRvoptF54tNJXpBqmXM=;
        b=azJjt8WqF0s8dH7odJ9MABBRFMzVu2r423dZ0opMgp0lU5e43I6D9GCUIu6caPEOG8
         vlacwDeYNIP367bpT87vUdl2eD/3lf8fFGV8srp1W1sph8EBZtA4w4ZoaJvjd8e2eICh
         Lq/AuiZoeRU0aTQfskyKnny2wzTMhBTaE6E1jvoDtAXxinTEYU9iZUq9sUJZymqszSzr
         gik6h44kxbQXI3zRuGcJsIKN9Od/dGWMZCPWG+wH6dyAH7CGei67hUVwEhDDY0osBgi0
         wKbT6IteDAu6KnJq6G5H1b2yTWQlULSY6gKFPi9FU5JWUHyS+A1Ssj5o1IjeE+asas+I
         HMqg==
X-Forwarded-Encrypted: i=1; AJvYcCXWEUQAfxF+ZbXmwBo7qB3PMsYo98znKiaIn9/lANpUzZNajLaFKcmByAeXlQd++RnqEtSCDoTsVzRnFqdY@vger.kernel.org
X-Gm-Message-State: AOJu0YxP/OtYopOURE0oSF9DHiQsL4mlk/CRBR84yF6XOBKyEEokzlan
	1LjMp8qGKdCkD7KEa77+XdcKIrULhdPaU41bXafnSc+uf9VceDJuFOfJBJfwL+m7o/TMAcetLPQ
	hfbSuWDmAA2EbHDnzLU02fablTDCqdpePSNbG0XLd0jMM82D9LSyBJHXNxntUChLmTa+u
X-Gm-Gg: ASbGncsR2UxTL1v2dSOesYC68lopxO21e/0C/fWja/sFh/WpYcVbwhHRyq5flstII89
	38CXEfSK1YyHIdQ49rpL1w/GHZVTEzxiMSpo0D2gNHB9MDDn3L91d41TPiOUHy4Ivf/qaou0fG6
	JN/Zo4u4en9L7Tqi9wwSQk6YlNvTnuUAdlyRLkAtyhWDdLF7g9M+DdkULBE8i4bb2cBDEje6p6C
	7yQT0GbpTuBwzVVu53g7BIkXSxRdfuL3sRaO5pAkMf337S5twt6JFBlPbAL2Hhv1dZU26OJ06V6
	ZTHmr0SV9UEj71zhq6e1HX5z/tKtPNwlmcS1L5EiBNeRauOMfXv9zu5ivWP6RZ0iqPFujPK4Zxq
	rgXnkVXR0dW5JbDv/CfrlECo9b7fjdeZGb/BJKfXlXRLzGs4ncEUD
X-Received: by 2002:a05:622a:a06:b0:4b5:f6c5:cfc with SMTP id d75a77b69052e-4da484c185bmr67951341cf.19.1758832981641;
        Thu, 25 Sep 2025 13:43:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOvaWsWwOy+nDAPVLkaK8OFmROZP1WNtkvOzTrwJ+DYfgRHoycvZWfMmlTTZpJBPt5kGe1CA==
X-Received: by 2002:a05:622a:a06:b0:4b5:f6c5:cfc with SMTP id d75a77b69052e-4da484c185bmr67950921cf.19.1758832980938;
        Thu, 25 Sep 2025 13:43:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-583139fa339sm1110563e87.42.2025.09.25.13.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 13:42:59 -0700 (PDT)
Date: Thu, 25 Sep 2025 23:42:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: Re: [PATCH v2 23/24] arm64: dts: qcom: glymur: Add USB support
Message-ID: <2645cv6wayqblq5bi2wablue23kj725rpb5bxnh6fhoydubink@u4cl6bneew5h>
References: <20250925-v3_glymur_introduction-v2-0-8e1533a58d2d@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v2-23-8e1533a58d2d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925-v3_glymur_introduction-v2-23-8e1533a58d2d@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: fyNYfR73x8t6Dg6fK9ZoRvWFszu7_psz
X-Proofpoint-GUID: fyNYfR73x8t6Dg6fK9ZoRvWFszu7_psz
X-Authority-Analysis: v=2.4 cv=aZhsXBot c=1 sm=1 tr=0 ts=68d5a957 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=rJUomjV9oqOGhRlaoAsA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfXyArNvBBCemL3
 2n6QDZrQocHmkPjUVvHldk6KH224e+54Q5DxoAasYuCeOuQXfca5viJwkbpBE9DakNcg7s/uFhg
 IA3AwFetxhvsubjCO3OPx34SnXw7wsx6tBuglPAxejpwIE3174wZcFMfJWv3IDtpiBnQzDm3jpv
 HPafLRdqQDsQwQ2CsLF3cKTUPT8YdZ4i4dhORnPsAIqDsm5i3nw6aBKp16fe0W7ESpOtWtdxYyk
 j04MGyPYjQT6OwP7R4zST+n2Jyleh6VBXwvjM/ZH+zAck5wdIwAjBnpsB4qw6I4udr82Zo+2YSu
 QfsjrQA91GImaWXaJ8G1rwBR3AES0au8npgvf8G4QjlyP0R45MBez7FEd2OIsiW/V2eKpO18zCe
 BUn9EPk/9WuGoGHfjGtRDsjaLLoS8g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_01,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171

On Thu, Sep 25, 2025 at 11:58:29AM +0530, Pankaj Patil wrote:
> From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> 
> The Glymur USB system contains 3 USB type C ports, and 1 USB multiport
> controller.  This encompasses 5 SS USB QMP PHYs (3 combo and 2 uni) and 5
> M31 eUSB2 PHYs.  The controllers are SNPS DWC3 based, and will use the
> flattened DWC3 QCOM design.
> 
> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dts | 243 ++++++++++++++
>  arch/arm64/boot/dts/qcom/glymur.dtsi    | 569 ++++++++++++++++++++++++++++++++
>  2 files changed, 812 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> index 03aacdb1dd7e2354fe31e63183519e53fa022829..100519aa5a7cd905285d3aa41ebe5f63ae00aeef 100644
> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> @@ -99,10 +99,74 @@ ports {
>  
>  				port@0 {
>  					reg = <0>;
> +
> +					pmic_glink_hs_in: endpoint {
> +						remote-endpoint = <&usb_0_dwc3_hs>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					pmic_glink_ss_in: endpoint {
> +						remote-endpoint = <&usb_dp_qmpphy_out>;
> +					};
> +				};
> +			};
> +		};
> +
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
> +					pmic_glink_hs_in1: endpoint {
> +						remote-endpoint = <&usb_1_dwc3_hs>;
> +					};
>  				};
>  
>  				port@1 {
>  					reg = <1>;
> +
> +					pmic_glink_ss_in1: endpoint {
> +						remote-endpoint = <&usb_1_ss1_qmpphy_out>;
> +					};
> +				};
> +			};
> +		};
> +
> +		connector@2 {
> +			compatible = "usb-c-connector";
> +			reg = <2>;
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
> +					pmic_glink_hs_in2: endpoint {
> +						remote-endpoint = <&usb_2_dwc3_hs>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					pmic_glink_ss_in2: endpoint {
> +						remote-endpoint = <&usb_1_ss2_qmpphy_out>;
> +					};
>  				};
>  			};
>  		};
> @@ -529,3 +593,182 @@ &pcie5port0 {
>  	perst-gpios = <&tlmm 152 GPIO_ACTIVE_LOW>;
>  	wake-gpios = <&tlmm 154 GPIO_ACTIVE_LOW>;
>  };
> +
> +&i2c5 {
> +	status = "ok";
> +
> +	clock-frequency = <400000>;
> +
> +	ptn3222_0: redriver@43 {
> +		compatible = "nxp,ptn3222";
> +		reg = <0x43>;
> +
> +		reset-gpios = <&tlmm 8 GPIO_ACTIVE_LOW>;
> +
> +		vdd3v3-supply = <&vreg_l8b_e0_1p50>;
> +		vdd1v8-supply = <&vreg_l15b_e0_1p8>;
> +
> +		#phy-cells = <0>;
> +	};
> +
> +	ptn3222_1: redriver@4f {
> +		compatible = "nxp,ptn3222";
> +		reg = <0x4f>;
> +
> +		reset-gpios = <&tlmm 184 GPIO_ACTIVE_LOW>;
> +
> +		vdd3v3-supply = <&vreg_l8b_e0_1p50>;
> +		vdd1v8-supply = <&vreg_l15b_e0_1p8>;
> +
> +		#phy-cells = <0>;
> +	};
> +};
> +
> +&smb2370_j_e2_eusb2_repeater {
> +	vdd18-supply = <&vreg_l15b_e0_1p8>;
> +	vdd3-supply = <&vreg_l7b_e0_2p79>;
> +};
> +
> +&smb2370_k_e2_eusb2_repeater {
> +	vdd18-supply = <&vreg_l15b_e0_1p8>;
> +	vdd3-supply = <&vreg_l7b_e0_2p79>;
> +};
> +
> +&smb2370_l_e2_eusb2_repeater {
> +	vdd18-supply = <&vreg_l15b_e0_1p8>;
> +	vdd3-supply = <&vreg_l7b_e0_2p79>;
> +};
> +
> +&usb_1_ss0_hsphy {
> +	vdd-supply = <&vreg_l3f_e0_0p72>;
> +	vdda12-supply = <&vreg_l4h_e0_1p2>;
> +
> +	phys = <&smb2370_j_e2_eusb2_repeater>;
> +
> +	status = "okay";
> +};
> +
> +&usb_1_ss0_qmpphy {
> +	vdda-phy-supply = <&vreg_l4h_e0_1p2>;
> +	vdda-pll-supply = <&vreg_l3f_e0_0p72>;
> +	refgen-supply = <&vreg_l2f_e0_0p82>;
> +
> +	status = "okay";
> +};
> +
> +&usb_dp_qmpphy_out {
> +	remote-endpoint = <&pmic_glink_ss_in>;
> +};
> +
> +&usb_0_dwc3_hs {
> +	remote-endpoint = <&pmic_glink_hs_in>;
> +};
> +
> +&usb_1_ss0 {
> +	dr_mode = "otg";

This is a default

> +	usb-role-switch;

And this should be a part of the SoC DTSI

> +
> +	status = "okay";
> +};
> +
> +&usb_1_ss1_qmpphy_out {
> +	remote-endpoint = <&pmic_glink_ss_in1>;
> +};
> +
> +&usb_1_dwc3_hs {
> +	remote-endpoint = <&pmic_glink_hs_in1>;
> +};
> +
> +&usb_1_ss1_hsphy {
> +	vdd-supply = <&vreg_l3f_e0_0p72>;
> +	vdda12-supply = <&vreg_l4h_e0_1p2>;
> +
> +	phys = <&smb2370_k_e2_eusb2_repeater>;
> +
> +	status = "okay";
> +};
> +
> +&usb_1_ss1_qmpphy {
> +	vdda-phy-supply = <&vreg_l4h_e0_1p2>;
> +	vdda-pll-supply = <&vreg_l1h_e0_0p89>;
> +	refgen-supply = <&vreg_l2f_e0_0p82>;
> +
> +	status = "okay";
> +};
> +
> +&usb1_ss1 {
> +	dr_mode = "otg";
> +	usb-role-switch;

Again, neither of these should be here.

> +
> +	status = "okay";
> +};
> +
> +&usb_1_ss2_qmpphy_out {
> +	remote-endpoint = <&pmic_glink_ss_in2>;
> +};
> +
> +&usb_2_dwc3_hs {
> +	remote-endpoint = <&pmic_glink_hs_in2>;
> +};
> +
> +&usb_1_ss2_hsphy {
> +	vdd-supply = <&vreg_l4c_e1_0p72>;
> +	vdda12-supply = <&vreg_l4f_e1_1p08>;
> +
> +	phys = <&smb2370_l_e2_eusb2_repeater>;
> +
> +	status = "okay";
> +};
> +
> +&usb_1_ss2_qmpphy {
> +	vdda-phy-supply = <&vreg_l4f_e1_1p08>;
> +	vdda-pll-supply = <&vreg_l4c_e1_0p72>;
> +	refgen-supply = <&vreg_l1c_e1_0p82>;
> +
> +	status = "okay";
> +};
> +
> +&usb1_ss2 {
> +	dr_mode = "otg";
> +	usb-role-switch;

The same

> +
> +	status = "okay";
> +};
> +
> +&usb_mp_hsphy0 {
> +	vdd-supply = <&vreg_l2h_e0_0p72>;
> +	vdda12-supply = <&vreg_l4h_e0_1p2>;
> +
> +	phys = <&ptn3222_0>;
> +
> +	status = "okay";
> +};
> +
> +&usb_mp_hsphy1 {
> +	vdd-supply = <&vreg_l2h_e0_0p72>;
> +	vdda12-supply = <&vreg_l4h_e0_1p2>;
> +
> +	phys = <&ptn3222_1>;
> +
> +	status = "okay";
> +};
> +
> +&usb_mp_qmpphy0 {
> +	vdda-phy-supply = <&vreg_l4h_e0_1p2>;
> +	vdda-pll-supply = <&vreg_l2h_e0_0p72>;
> +	refgen-supply = <&vreg_l4f_e1_1p08>;
> +
> +	status = "okay";
> +};
> +
> +&usb_mp_qmpphy1 {
> +	vdda-phy-supply = <&vreg_l4h_e0_1p2>;
> +	vdda-pll-supply = <&vreg_l2h_e0_0p72>;
> +	refgen-supply = <&vreg_l4f_e1_1p08>;
> +
> +	status = "okay";
> +};
> +
> +&usb_mp {
> +	status = "okay";
> +};
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> index 8a563d55bdd4902222039946dd75eaf4d3a4895b..c48d3a70820e551822c5322761528159da127ca6 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi

No update for GCC clock inputs? And that's too easy to miss because of
the patch split.

> @@ -2417,6 +2417,231 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
>  			};
>  		};
>  
> +		usb_mp_hsphy0: phy@fa1000 {
> +			compatible = "qcom,glymur-m31-eusb2-phy",
> +				     "qcom,sm8750-m31-eusb2-phy";
> +
> +			reg = <0 0x00fa1000 0 0x29c>;
> +			#phy-cells = <0>;
> +
> +			clocks = <&tcsrcc TCSR_USB2_1_CLKREF_EN>;
> +			clock-names = "ref";
> +
> +			resets = <&gcc GCC_QUSB2PHY_HS0_MP_BCR>;
> +
> +			status = "disabled";
> +		};
> +
> +		usb_mp_hsphy1: phy@fa2000  {
> +			compatible = "qcom,glymur-m31-eusb2-phy",
> +				     "qcom,sm8750-m31-eusb2-phy";
> +
> +			reg = <0 0x00fa2000 0 0x29c>;
> +			#phy-cells = <0>;
> +
> +			clocks = <&tcsrcc TCSR_USB2_2_CLKREF_EN>;
> +			clock-names = "ref";
> +
> +			resets = <&gcc GCC_QUSB2PHY_HS1_MP_BCR>;
> +
> +			status = "disabled";
> +		};
> +
> +		usb_mp_qmpphy0: phy@fa3000 {
> +			compatible = "qcom,glymur-qmp-usb3-uni-phy";
> +			reg = <0 0x00fa3000 0 0x2000>;
> +
> +			clocks = <&gcc GCC_USB3_MP_PHY_AUX_CLK>,
> +				 <&tcsrcc TCSR_USB3_0_CLKREF_EN>,
> +				 <&rpmhcc RPMH_CXO_CLK>,
> +				 <&gcc GCC_USB3_MP_PHY_COM_AUX_CLK>,
> +				 <&gcc GCC_USB3_MP_PHY_PIPE_0_CLK>;
> +			clock-names = "aux",
> +				      "clkref",
> +				      "ref",
> +				      "com_aux",
> +				      "pipe";
> +
> +			power-domains = <&gcc GCC_USB3_MP_SS0_PHY_GDSC>;
> +
> +			resets = <&gcc GCC_USB3_MP_SS0_PHY_BCR>,
> +				 <&gcc GCC_USB3UNIPHY_PHY_MP0_BCR>;
> +			reset-names = "phy",
> +				      "phy_phy";
> +
> +			clock-output-names = "usb3_uni_phy_0_pipe_clk_src";
> +			#clock-cells = <0>;
> +			#phy-cells = <0>;
> +
> +			status = "disabled";
> +		};
> +
> +		usb_mp_qmpphy1: phy@fa5000 {
> +			compatible = "qcom,glymur-qmp-usb3-uni-phy";
> +			reg = <0 0x00fa5000 0 0x2000>;
> +
> +			clocks = <&gcc GCC_USB3_MP_PHY_AUX_CLK>,
> +				 <&tcsrcc TCSR_USB3_1_CLKREF_EN>,
> +				 <&rpmhcc RPMH_CXO_CLK>,
> +				 <&gcc GCC_USB3_MP_PHY_COM_AUX_CLK>,
> +				 <&gcc GCC_USB3_MP_PHY_PIPE_1_CLK>;
> +			clock-names = "aux",
> +				      "clkref",
> +				      "ref",
> +				      "com_aux",
> +				      "pipe";
> +
> +			power-domains = <&gcc GCC_USB3_MP_SS1_PHY_GDSC>;
> +
> +			resets = <&gcc GCC_USB3_MP_SS1_PHY_BCR>,
> +				 <&gcc GCC_USB3UNIPHY_PHY_MP1_BCR>;
> +			reset-names = "phy",
> +				      "phy_phy";
> +
> +			clock-output-names = "usb3_uni_phy_1_pipe_clk_src";
> +
> +			#clock-cells = <0>;
> +			#phy-cells = <0>;
> +
> +			status = "disabled";
> +		};
> +
> +		usb_1_ss0_hsphy: phy@fd3000 {
> +			compatible = "qcom,glymur-m31-eusb2-phy",
> +				     "qcom,sm8750-m31-eusb2-phy";
> +
> +			reg = <0 0x00fd3000 0 0x29c>;
> +			#phy-cells = <0>;
> +
> +			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
> +
> +			status = "disabled";
> +		};
> +
> +		usb_1_ss0_qmpphy: phy@fd5000 {
> +			compatible = "qcom,glymur-qmp-usb3-dp-phy";
> +			reg = <0 0x00fd5000 0 0x8000>;
> +
> +			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK>,
> +				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
> +				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
> +			clock-names = "aux",
> +				      "ref",
> +				      "com_aux",
> +				      "usb3_pipe";
> +
> +			resets = <&gcc GCC_USB3_PHY_PRIM_BCR>,
> +				 <&gcc GCC_USB3PHY_PHY_PRIM_BCR>;
> +
> +			reset-names = "phy",
> +				      "common";
> +
> +			power-domains = <&gcc GCC_USB_0_PHY_GDSC>;
> +
> +			#clock-cells = <1>;
> +			#phy-cells = <1>;
> +
> +			orientation-switch;
> +
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					usb_dp_qmpphy_out: endpoint {
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					usb_1_ss0_qmpphy_usb_ss_in: endpoint {
> +						remote-endpoint = <&usb_1_ss0>;
> +					};
> +				};
> +
> +				port@2 {
> +					reg = <2>;
> +
> +					usb_dp_qmpphy_dp_in: endpoint {
> +					};
> +				};
> +			};
> +		};
> +
> +		usb_1_ss1_hsphy: phy@fdd000  {
> +			compatible = "qcom,glymur-m31-eusb2-phy",
> +				     "qcom,sm8750-m31-eusb2-phy";
> +
> +			reg = <0 0x00fdd000 0 0x29c>;
> +			#phy-cells = <0>;
> +
> +			resets = <&gcc GCC_QUSB2PHY_SEC_BCR>;
> +
> +			status = "disabled";
> +		};
> +
> +		usb_1_ss1_qmpphy: phy@fde000 {
> +			compatible = "qcom,glymur-qmp-usb3-dp-phy";
> +			reg = <0 0x00fde000 0 0x8000>;
> +
> +			clocks = <&gcc GCC_USB3_SEC_PHY_AUX_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK>,
> +				 <&gcc GCC_USB3_SEC_PHY_COM_AUX_CLK>,
> +				 <&gcc GCC_USB3_SEC_PHY_PIPE_CLK>,
> +				 <&tcsrcc TCSR_USB4_1_CLKREF_EN>;
> +			clock-names = "aux",
> +				      "ref",
> +				      "com_aux",
> +				      "usb3_pipe",
> +				      "clkref";
> +
> +			power-domains = <&gcc GCC_USB_1_PHY_GDSC>;
> +
> +			resets = <&gcc GCC_USB3_PHY_SEC_BCR>,
> +				 <&gcc GCC_USB3PHY_PHY_SEC_BCR>;
> +			reset-names = "phy",
> +				      "common";
> +
> +			#clock-cells = <1>;
> +			#phy-cells = <1>;
> +			orientation-switch;
> +
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					usb_1_ss1_qmpphy_out: endpoint {
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					usb_1_ss1_qmpphy_usb_ss_in: endpoint {
> +						remote-endpoint = <&usb1_ss1>;
> +					};
> +				};
> +
> +				port@2 {
> +					reg = <2>;
> +
> +					usb_1_ss1_qmpphy_dp_in: endpoint {
> +					};
> +				};
> +			};
> +		};
> +
>  		cnoc_main: interconnect@1500000 {
>  			compatible = "qcom,glymur-cnoc-main";
>  			reg = <0x0 0x01500000 0x0 0x17080>;
> @@ -2777,6 +3002,350 @@ lpass_ag_noc: interconnect@7e40000 {
>  			#interconnect-cells = <2>;
>  		};
>  
> +		usb_1_ss2_hsphy: phy@88e0000  {
> +			compatible = "qcom,glymur-m31-eusb2-phy",
> +				     "qcom,sm8750-m31-eusb2-phy";
> +
> +			reg = <0 0x088e0000 0 0x29c>;
> +			#phy-cells = <0>;
> +
> +			clocks = <&tcsrcc TCSR_USB2_4_CLKREF_EN>;
> +			clock-names = "ref";
> +
> +			resets = <&gcc GCC_QUSB2PHY_TERT_BCR>;
> +
> +			status = "disabled";
> +		};
> +
> +		usb_1_ss2_qmpphy: phy@88e1000 {
> +			compatible = "qcom,glymur-qmp-usb3-dp-phy";
> +			reg = <0 0x088e1000 0 0x8000>;
> +
> +			clocks = <&gcc GCC_USB3_TERT_PHY_AUX_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK>,
> +				 <&gcc GCC_USB3_TERT_PHY_COM_AUX_CLK>,
> +				 <&gcc GCC_USB3_TERT_PHY_PIPE_CLK>,
> +				 <&tcsrcc TCSR_USB4_2_CLKREF_EN>;
> +			clock-names = "aux",
> +				      "ref",
> +				      "com_aux",
> +				      "usb3_pipe",
> +				      "clkref";
> +
> +			power-domains = <&gcc GCC_USB_2_PHY_GDSC>;
> +
> +			resets = <&gcc GCC_USB3_PHY_TERT_BCR>,
> +				 <&gcc GCC_USB3PHY_PHY_TERT_BCR>;
> +			reset-names = "phy",
> +				      "common";
> +
> +			#clock-cells = <1>;
> +			#phy-cells = <1>;
> +			orientation-switch;
> +
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					usb_1_ss2_qmpphy_out: endpoint {
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					usb_1_ss2_qmpphy_usb_ss_in: endpoint {
> +						remote-endpoint = <&usb1_ss2>;
> +					};
> +				};
> +
> +				port@2 {
> +					reg = <2>;
> +
> +					usb_1_ss2_qmpphy_dp_in: endpoint {
> +					};
> +				};
> +			};
> +		};
> +
> +		usb_1_ss0: usb@a600000 {
> +			compatible = "qcom,glymur-dwc3", "qcom,snps-dwc3";
> +			reg = <0 0x0a600000 0 0xfc100>;
> +
> +			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
> +				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
> +				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
> +				 <&gcc GCC_USB30_PRIM_SLEEP_CLK>,
> +				 <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
> +				 <&gcc GCC_CFG_NOC_USB_ANOC_AHB_CLK>,
> +				 <&gcc GCC_CFG_NOC_USB_ANOC_SOUTH_AHB_CLK>;
> +			clock-names = "cfg_noc",
> +				      "core",
> +				      "iface",
> +				      "sleep",
> +				      "mock_utmi",
> +				      "noc_aggr_north",
> +				      "noc_aggr_south";
> +
> +			interrupts-extended = <&intc GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&intc GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&pdc 90 IRQ_TYPE_EDGE_BOTH>,
> +					      <&pdc 60 IRQ_TYPE_EDGE_BOTH>,
> +					      <&pdc 17 IRQ_TYPE_EDGE_BOTH>;
> +			interrupt-names = "dwc_usb3",
> +					  "pwr_event",
> +					  "dp_hs_phy_irq",
> +					  "dm_hs_phy_irq",
> +					  "ss_phy_irq";
> +
> +			power-domains = <&gcc GCC_USB30_PRIM_GDSC>;
> +			resets = <&gcc GCC_USB30_PRIM_BCR>;
> +
> +			iommus = <&apps_smmu 0x1420 0x0>;
> +			phys = <&usb_1_ss0_hsphy>,
> +			       <&usb_1_ss0_qmpphy QMP_USB43DP_USB3_PHY>;
> +			phy-names = "usb2-phy",
> +				    "usb3-phy";
> +
> +			snps,dis_u2_susphy_quirk;
> +			snps,dis_enblslpm_quirk;
> +			snps,dis_u3_susphy_quirk;
> +			snps,usb2-lpm-disable;
> +
> +			dr_mode = "peripheral";

Why? No.

> +
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					usb_0_dwc3_hs: endpoint {
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					usb_0_dwc3_ss: endpoint {
> +						remote-endpoint = <&usb_1_ss0_qmpphy_usb_ss_in>;
> +					};
> +				};
> +			};
> +		};
> +
> +		usb1_ss1: usb@a800000 {
> +			compatible = "qcom,glymur-dwc3", "qcom,snps-dwc3";
> +			reg = <0 0x0a800000 0 0xfc100>;
> +
> +			clocks = <&gcc GCC_CFG_NOC_USB3_SEC_AXI_CLK>,
> +				 <&gcc GCC_USB30_SEC_MASTER_CLK>,
> +				 <&gcc GCC_AGGRE_USB3_SEC_AXI_CLK>,
> +				 <&gcc GCC_USB30_SEC_SLEEP_CLK>,
> +				 <&gcc GCC_USB30_SEC_MOCK_UTMI_CLK>,
> +				 <&gcc GCC_CFG_NOC_USB_ANOC_AHB_CLK>,
> +				 <&gcc GCC_CFG_NOC_USB_ANOC_SOUTH_AHB_CLK>;
> +			clock-names = "cfg_noc",
> +				      "core",
> +				      "iface",
> +				      "sleep",
> +				      "mock_utmi",
> +				      "noc_aggr_north",
> +				      "noc_aggr_south";
> +
> +			interrupts-extended = <&intc GIC_SPI 875 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&intc GIC_SPI 369 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&pdc 88 IRQ_TYPE_EDGE_BOTH>,
> +					      <&pdc 87 IRQ_TYPE_EDGE_BOTH>,
> +					      <&pdc 76 IRQ_TYPE_EDGE_BOTH>;
> +			interrupt-names = "dwc_usb3",
> +					  "pwr_event",
> +					  "dp_hs_phy_irq",
> +					  "dm_hs_phy_irq",
> +					  "ss_phy_irq";
> +
> +			resets = <&gcc GCC_USB30_SEC_BCR>;
> +			power-domains = <&gcc GCC_USB30_SEC_GDSC>;
> +
> +			iommus = <&apps_smmu 0x1460 0x0>;
> +
> +			phys = <&usb_1_ss1_hsphy>,
> +			       <&usb_1_ss1_qmpphy QMP_USB43DP_USB3_PHY>;
> +			phy-names = "usb2-phy",
> +				    "usb3-phy";
> +
> +			snps,dis_u2_susphy_quirk;
> +			snps,dis_enblslpm_quirk;
> +			snps,dis_u3_susphy_quirk;
> +			snps,usb2-lpm-disable;
> +
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					usb_1_dwc3_hs: endpoint {
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					usb_1_dwc3_ss: endpoint {
> +						remote-endpoint = <&usb_1_ss1_qmpphy_usb_ss_in>;
> +					};
> +				};
> +			};
> +		};
> +
> +		usb1_ss2: usb@a000000 {
> +			compatible = "qcom,glymur-dwc3", "qcom,snps-dwc3";
> +			reg = <0 0x0a000000 0 0xfc100>;
> +
> +			clocks = <&gcc GCC_CFG_NOC_USB3_TERT_AXI_CLK>,
> +				 <&gcc GCC_USB30_TERT_MASTER_CLK>,
> +				 <&gcc GCC_AGGRE_USB3_TERT_AXI_CLK>,
> +				 <&gcc GCC_USB30_TERT_SLEEP_CLK>,
> +				 <&gcc GCC_USB30_TERT_MOCK_UTMI_CLK>,
> +				 <&gcc GCC_CFG_NOC_USB_ANOC_AHB_CLK>,
> +				 <&gcc GCC_CFG_NOC_USB_ANOC_SOUTH_AHB_CLK>;
> +			clock-names = "cfg_noc",
> +				      "core",
> +				      "iface",
> +				      "sleep",
> +				      "mock_utmi",
> +				      "noc_aggr_north",
> +				      "noc_aggr_south";
> +
> +			interrupts-extended = <&intc GIC_SPI 871 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&intc GIC_SPI 370 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&pdc 89 IRQ_TYPE_EDGE_BOTH>,
> +					      <&pdc 81 IRQ_TYPE_EDGE_BOTH>,
> +					      <&pdc 75 IRQ_TYPE_EDGE_BOTH>;
> +			interrupt-names = "dwc_usb3",
> +					  "pwr_event",
> +					  "dp_hs_phy_irq",
> +					  "dm_hs_phy_irq",
> +					  "ss_phy_irq";
> +
> +			resets = <&gcc GCC_USB30_TERT_BCR>;
> +			power-domains = <&gcc GCC_USB30_TERT_GDSC>;
> +
> +			iommus = <&apps_smmu 0x420 0x0>;
> +
> +			phys = <&usb_1_ss2_hsphy>,
> +			       <&usb_1_ss2_qmpphy QMP_USB43DP_USB3_PHY>;
> +			phy-names = "usb2-phy",
> +				    "usb3-phy";
> +
> +			snps,dis_u2_susphy_quirk;
> +			snps,dis_enblslpm_quirk;
> +			snps,dis_u3_susphy_quirk;
> +			snps,usb2-lpm-disable;
> +
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					usb_2_dwc3_hs: endpoint {
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					usb_2_dwc3_ss: endpoint {
> +						remote-endpoint = <&usb_1_ss2_qmpphy_usb_ss_in>;
> +					};
> +				};
> +			};
> +		};
> +
> +		usb_mp: usb@a400000 {
> +			compatible = "qcom,glymur-dwc3-mp", "qcom,snps-dwc3";
> +			reg = <0 0x0a400000 0 0xfc100>;
> +
> +			clocks = <&gcc GCC_CFG_NOC_USB3_MP_AXI_CLK>,
> +				 <&gcc GCC_USB30_MP_MASTER_CLK>,
> +				 <&gcc GCC_AGGRE_USB3_MP_AXI_CLK>,
> +				 <&gcc GCC_USB30_MP_SLEEP_CLK>,
> +				 <&gcc GCC_USB30_MP_MOCK_UTMI_CLK>,
> +				 <&gcc GCC_CFG_NOC_USB_ANOC_AHB_CLK>,
> +				 <&gcc GCC_CFG_NOC_USB_ANOC_SOUTH_AHB_CLK>;
> +			clock-names = "cfg_noc",
> +				      "core",
> +				      "iface",
> +				      "sleep",
> +				      "mock_utmi",
> +				      "noc_aggr_north",
> +				      "noc_aggr_south";
> +
> +			interrupts-extended = <&intc GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&intc GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&intc GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&intc GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&intc GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&pdc 12 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&pdc 11 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&pdc 14 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&pdc 13 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&pdc 78 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&pdc 77 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "dwc_usb3",
> +					  "pwr_event_1",
> +					  "pwr_event_2",
> +					  "hs_phy_1",
> +					  "hs_phy_2",
> +					  "dp_hs_phy_1",
> +					  "dm_hs_phy_1",
> +					  "dp_hs_phy_2",
> +					  "dm_hs_phy_2",
> +					  "ss_phy_1",
> +					  "ss_phy_2";
> +
> +			resets = <&gcc GCC_USB30_MP_BCR>;
> +			power-domains = <&gcc GCC_USB30_MP_GDSC>;
> +
> +			iommus = <&apps_smmu 0xda0 0x0>;
> +
> +			phys = <&usb_mp_hsphy0>,
> +			       <&usb_mp_qmpphy0>,
> +			       <&usb_mp_hsphy1>,
> +			       <&usb_mp_qmpphy1>;
> +			phy-names = "usb2-0",
> +				    "usb3-0",
> +				    "usb2-1",
> +				    "usb3-1";
> +
> +			snps,dis_u2_susphy_quirk;
> +			snps,dis_enblslpm_quirk;
> +			snps,usb3_lpm_capable;
> +			snps,dis_u3_susphy_quirk;
> +			snps,usb2-lpm-disable;
> +
> +			dr_mode = "host";
> +
> +			status = "disabled";
> +
> +		};
> +
>  		dispcc: clock-controller@af00000 {
>  			compatible = "qcom,glymur-dispcc";
>  			reg = <0 0x0af00000 0 0x20000>;
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

