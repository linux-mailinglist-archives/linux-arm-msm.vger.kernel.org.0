Return-Path: <linux-arm-msm+bounces-89591-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3298FD3A391
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 10:45:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C5A433037515
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 09:44:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8390C1F8755;
	Mon, 19 Jan 2026 09:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LtEyG/qE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kp3hrA6k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6AE352934
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 09:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768815877; cv=none; b=RssaHi5QncJYUCRTkeKlBGHuDSFPEWfJdLs9zBe1+yStL6/9lu+5BI3IAOQCLNnvU6sS5sT0xAZ0rCIEbPBqBNA2hxfD82dMZlOFtHxdCJXLnFxg6cwAL5IRqxIXVEtN9yPimIouwqUXYCC+83TZN2LgfbrnWCCqKvo8r9N4buQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768815877; c=relaxed/simple;
	bh=DJmH3QfKoi/7C+2pMax9urVk8jct788QX3SrW4IQTHo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JaPh/o2QIhXbN22zNtsg0k1nWWIoUJKkcWYyeVAvjOhcnMPBD1NOhmj4x+CiyEmavPF3Iv4XDygcQkeVShEm6VP+4PUe95rKaPDMvJ3mD5fuMiGqrIYCNptHN2SL/geRQRq/vLlA4hZixUYoyZvVUvFtioRlPly9tl7O/kt5DsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LtEyG/qE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kp3hrA6k; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J91MiB450857
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 09:44:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=B+sSLOf2qAPEe/dbLBsqOh0A
	hD9xsAlh4pY1wZmAkTM=; b=LtEyG/qEvFf4DFzU+JOAJ7Ay57ZzdI8ODZiU+7Ke
	StVYc/NFQnulGtzT20iMyWYpy2Y4U2UotU8oGci6imncPWpcO59UxwTKOhLmt24W
	PQpdD6dso9wLavxHzCWKz0WJWP+xasW/zgaUTs2GWKVgssRORroUE4z369PhsNHx
	uCx4LqOtxsWDAtkYEggzqEi4KyoDfQIvcTnKo1MB32UQja6fnrT4/PBkuTSQuB+U
	PxsTUY5eO6Akw2k/nlIKhNDVOWsA7PH3kQv0jx1JsDgyU5TUMnfV5RDays5puK3b
	88GeTTy+6VU6ZBKnzjJm/Z9+lw3mIhmicXfihUnAX1uzAA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bs7881kpv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 09:44:33 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88a366fa140so156830256d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 01:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768815873; x=1769420673; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B+sSLOf2qAPEe/dbLBsqOh0AhD9xsAlh4pY1wZmAkTM=;
        b=kp3hrA6k9zrcj7H0WnDwix3uMZeQmL9YvITyKd6We5TDZJ4dhdIO6wlewFSVkYRmF+
         k/SZiSR6a1xPW04OGd4wUK9/fVlwF9PK5QBvjyLGBB8SYAzw/47yXayL77E92vDCocA4
         xD53TWjnJBmKzkwhdZIZ4ZIgV3ODZCuqofly4XA+8myFYeR0YGw4NCm3LWUniEJUP2IT
         6OCDi3pta2D/3yPjNLxx0BT4DvFGxYC3z+mYYe5zi97x1crCQ21XZUYMc+KWlTv6GlBc
         c2XuAPsXGqmsv4LvL+lnQIwsae8E4/SQRIRL52B7liUVB33341644GztdhjHaBOoSOx5
         NJlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768815873; x=1769420673;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B+sSLOf2qAPEe/dbLBsqOh0AhD9xsAlh4pY1wZmAkTM=;
        b=qyLOHe+pkV6I65NQxYkhciHzV2+/OBYgkYpChQviFmNpxmYT/SiPcQB/qFLECHkzjD
         yr+a2hfc1//ZBv88mXMDygBiknvhG0+71jDfIhTl268WPvsaa3ZFse7OuwUvT/QezCc4
         EmNVGgo+LDsdThv0inYp4NPI6bx1eY1BIQeI5DjK075c5XTzuGfkS/h0RhBSnChrs5Pp
         kyL7JMQ3F275/6W1iFGVQekeF5TLAGQIQcBA7FtuuFhaDfg6IaCWqEFio9vB+tRl2RkS
         H5cgcUD9gNGTcuYByqgHcGePUKt7WlFSaBBMwZjaGOOFb/6aI9Te5GEq9f8KPInrqyrl
         /t+w==
X-Forwarded-Encrypted: i=1; AJvYcCWTcBSEPMY6Agw7oA/nF9EZW1MxXa69pSraBSJKIqKOTMy1/jxa7Qq+/iSuhNXVxcY0KqcRh9m5NHNv0LvI@vger.kernel.org
X-Gm-Message-State: AOJu0YxT3zedVdSyp0bcVENlfxnvP5Oy4XmPR4wX4fKJthN7xGpdbm9H
	5Z7NfJvtLBTnHYBfIv8KF9AgYufviRa5yx1BQ19emhbFwrHTdTnicwR8YsAxG8rYTalhgFgoIzT
	Ys9w1XPcyK5IIzZf7/Gmn8dvgdna+HzQIaSOLG77nLqWdptKq6AMDXtsN4R6IZKNSzBVX
X-Gm-Gg: AZuq6aKLKecK9LYDb3MRF9GcmAsvL9P5zHG0B3Ybls7Jq0TTZGjZ3mOZ/R0q0ApEkjZ
	6y0u6LpzEBT2aZBjGgkeIBD2O9WRoanEQt0gu/9b97Qlxip1OOwVx52e5aUs3OT6K4xgMx4yCRx
	2I/1Y+TnUspLduGTL8AI4IC3PiY8RgZqqZ5W637c0in9ZDj2NsQi1Fk3i8KhOckmEYEnsrM94qW
	JqNj2goLSDw/h97rjAE2y+wQycnXEqpImr+jUq3WyfAM86p5okzk5BoNcH7cswaOqiwsLtdjsHP
	onCiT18vqepNkHK3I9CLnFqCojtspOWjD0yp1F8mH9BdYRmA3rYP3mH529qYk+A6q01QLyQ+4zl
	D+GBAN3QgNVRzSe4a7bNtF2j0KGTn40mkVkrhDFNhci4dw7osxoavQ6QawzhcnpVz7+xnpU3MR7
	Tdog740sWT7flXDg4JNJRwO1k=
X-Received: by 2002:a05:6214:2a82:b0:88a:306b:f05a with SMTP id 6a1803df08f44-8942e312790mr145871856d6.24.1768815872767;
        Mon, 19 Jan 2026 01:44:32 -0800 (PST)
X-Received: by 2002:a05:6214:2a82:b0:88a:306b:f05a with SMTP id 6a1803df08f44-8942e312790mr145871696d6.24.1768815872262;
        Mon, 19 Jan 2026 01:44:32 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf34f539sm3226455e87.33.2026.01.19.01.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 01:44:31 -0800 (PST)
Date: Mon, 19 Jan 2026 11:44:29 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wei Zhang <wei.zhang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7] arm64: dts: qcom: qcs8300-ride: enable WLAN on
 qcs8300-ride
Message-ID: <5ryoy3m4imwlavwmko5tuz3qebkj3loeybnit7shkk7aylcl2f@ewuloc3nqeta>
References: <20260119090758.2780678-1-wei.zhang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119090758.2780678-1-wei.zhang@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=KLVXzVFo c=1 sm=1 tr=0 ts=696dfd01 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=1uJwjQ3ww_axgKtu9V8A:9
 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA3OSBTYWx0ZWRfXyasxdHUl5uZn
 QaHalxf6X0/fGdhFvDUD5LAxWjsIEA1+dKDwwDKQulV43jrNdKylVCfUOpl7OTpf0pMphZfSAPq
 4ivAnEypZ3FJNogvpeAQLbsrrFIuhpAAkiKiExEUWH91oJkjd/5/ZdvY3pE11vx9LCd2bQsIRnX
 JXA0aEiFuZPOnNIv6NBmoCetvK9vlIU7OIuvglh5CnReUOgyaWHyw9xnEqSrNjByuRP+jK0Z51x
 l9S7//XbNw858FErn/jOc8Dbn5PSnLeznfpriLzv8xErkd5J1Z9weJFAcMmds+aFZI7LF8C6wS8
 qGxOz/yo/0tOSmpP7EL+Vmzk2rIjlpdoZgt9v2dYWI+8P+CgIwsTJux4yGq4QHSdSoEkIrR5OSn
 OZvutjQw+gyB5mLruFc/Mrwe9Gjv0gj0jYHUzqVpoksrxS5RkwT3ftMl+bB8DUVAC+oYTDBzXPa
 OczUdAz81MPwTMClUxg==
X-Proofpoint-GUID: tMf1DUOfjaXEpxnGfdfhaRklDpVuBN6k
X-Proofpoint-ORIG-GUID: tMf1DUOfjaXEpxnGfdfhaRklDpVuBN6k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_01,2026-01-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190079

On Mon, Jan 19, 2026 at 01:07:58AM -0800, Wei Zhang wrote:
> Enable WLAN on qcs8300-ride by adding a node for the PMU module
> of the WCN6855 and assigning its LDO power outputs to the existing
> WiFi module.
> 
> On the qcs8300-ride platform, the corresponding firmware and BDF
> are QCA6698AQ instead of WCN6855, which have been added in the
> 20250211 release.
> 
> Signed-off-by: Wei Zhang <wei.zhang@oss.qualcomm.com>
> ---
> This patch depends on:
> - PCIe
> https://lore.kernel.org/all/20251128104928.4070050-1-ziyue.zhang@oss.qualcomm.com/
> 
> Changes in v7:
> - Align regulator node names to match the existing naming style in the dts (Dmitry)
> - Link to v6: https://lore.kernel.org/all/20260119080125.2761623-1-wei.zhang@oss.qualcomm.com/
> 
> Changes in v6:
> - Rebase patches
> - Remove unintended 'output-low' from wlan-en-state pinctrl (Konrad)
> - Link to v5: https://lore.kernel.org/all/20251113055148.2729943-1-wei.zhang@oss.qualcomm.com/
> 
> Changes in v5:
> - Rebase patches
> - Flip the order of property-n and property-names (Konrad)
> - Flip the order of bias and output property (Konrad)
> - Link to v4: https://lore.kernel.org/all/20250325075331.1662306-1-quic_stonez@quicinc.com/
> 
> Changes in v4:
> - Rename the symbol pcieport0 to pcie0_port0 (Konrad)
> - Adjust the property order in node pcie0_port0 (Konrad)
> - Add to the commit message mentioning FW and BDF used by QCS8300 (Dmitry)
> - Specify the calibration data using the correct variant (Dmitry)
> - Link to v3: https://lore.kernel.org/all/20250318093350.2682132-1-quic_stonez@quicinc.com/
> 
> Changes in v3:
> - Complete the nodes property definitions according to DTS binding requirements (Bjorn)
> - Link to v2: https://lore.kernel.org/all/20250227065439.1407230-1-quic_stonez@quicinc.com/
> 
> Changes in v2:
> - Rename the nodes name according to DTS coding style (Konrad & Krzysztof)
> - Provide regulator-min/max-microvolt to the regulators (Konrad)
> - Link to v1: https://lore.kernel.org/all/20250210062910.3618336-1-quic_stonez@quicinc.com/
> ---
>  arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 107 ++++++++++++++++++++++
>  1 file changed, 107 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> index 68691f7b5f94..57cf1edb2d19 100644
> --- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> @@ -33,6 +33,88 @@ regulator-usb2-vbus {
>  		enable-active-high;
>  		regulator-always-on;
>  	};
> +
> +	vreg_conn_1p8: regulator-conn-1p8 {

regulator-conn-1p8 < regulator-usb2-vbus

> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_conn_1p8";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		startup-delay-us = <4000>;
> +		enable-active-high;
> +		gpio = <&pmm8650au_1_gpios 4 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	vreg_conn_pa: regulator-conn-pa {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_conn_pa";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		startup-delay-us = <4000>;
> +		enable-active-high;
> +		gpio = <&pmm8650au_1_gpios 6 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	wcn6855-pmu {
> +		compatible = "qcom,wcn6855-pmu";
> +
> +		pinctrl-0 = <&wlan_en_state>;
> +		pinctrl-names = "default";
> +
> +		vddio-supply = <&vreg_conn_pa>;
> +		vddaon-supply = <&vreg_conn_1p8>;
> +		vddpmu-supply = <&vreg_conn_pa>;
> +		vddpmumx-supply = <&vreg_conn_1p8>;
> +		vddpmucx-supply = <&vreg_conn_pa>;
> +		vddrfa0p95-supply = <&vreg_conn_1p8>;
> +		vddrfa1p3-supply = <&vreg_conn_pa>;
> +		vddrfa1p9-supply = <&vreg_conn_1p8>;
> +		vddpcie1p3-supply = <&vreg_conn_pa>;
> +		vddpcie1p9-supply = <&vreg_conn_1p8>;
> +
> +		wlan-enable-gpios = <&tlmm 54 GPIO_ACTIVE_HIGH>;
> +
> +		regulators {
> +			vreg_pmu_rfa_cmn: ldo0 {
> +				regulator-name = "vreg_pmu_rfa_cmn";
> +			};
> +
> +			vreg_pmu_aon_0p59: ldo1 {
> +				regulator-name = "vreg_pmu_aon_0p59";
> +			};
> +
> +			vreg_pmu_wlcx_0p8: ldo2 {
> +				regulator-name = "vreg_pmu_wlcx_0p8";
> +			};
> +
> +			vreg_pmu_wlmx_0p85: ldo3 {
> +				regulator-name = "vreg_pmu_wlmx_0p85";
> +			};
> +
> +			vreg_pmu_btcmx_0p85: ldo4 {
> +				regulator-name = "vreg_pmu_btcmx_0p85";
> +			};
> +
> +			vreg_pmu_rfa_0p8: ldo5 {
> +				regulator-name = "vreg_pmu_rfa_0p8";
> +			};
> +
> +			vreg_pmu_rfa_1p2: ldo6 {
> +				regulator-name = "vreg_pmu_rfa_1p2";
> +			};
> +
> +			vreg_pmu_rfa_1p7: ldo7 {
> +				regulator-name = "vreg_pmu_rfa_1p7";
> +			};
> +
> +			vreg_pmu_pcie_0p9: ldo8 {
> +				regulator-name = "vreg_pmu_pcie_0p9";
> +			};
> +
> +			vreg_pmu_pcie_1p8: ldo9 {
> +				regulator-name = "vreg_pmu_pcie_1p8";
> +			};
> +		};
> +	};
>  };
>  
>  &apps_rsc {
> @@ -355,6 +437,25 @@ &pcie1_phy {
>  	status = "okay";
>  };
>  
> +&pcieport0 {
> +	wifi@0 {
> +		compatible = "pci17cb,1103";
> +		reg = <0x10000 0x0 0x0 0x0 0x0>;
> +
> +		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
> +		vddaon-supply = <&vreg_pmu_aon_0p59>;
> +		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
> +		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
> +		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
> +		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
> +		vddrfa1p8-supply = <&vreg_pmu_rfa_1p7>;
> +		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
> +		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
> +
> +		qcom,calibration-variant = "QC_QCS8300_Ride";
> +	};
> +};
> +
>  &qupv3_id_0 {
>  	status = "okay";
>  };
> @@ -461,6 +562,12 @@ perst-pins {
>  			bias-pull-down;
>  		};
>  	};
> +
> +	wlan_en_state: wlan-en-state {
> +		pins = "gpio54";
> +		function = "gpio";
> +		bias-pull-up;
> +	};
>  };
>  
>  &uart7 {
> 
> base-commit: 24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
> prerequisite-patch-id: 0e8aad7b8514142fb33c17829386f17c3a55127a
> prerequisite-patch-id: e641f09d4139ac77c34757bd08af2db746de3963
> prerequisite-patch-id: 4d16e87cf6213d6e25b2c40e2753d4e629778d53
> prerequisite-patch-id: 40187dae2c9518a10866104b9fcd5a481ac67d51
> prerequisite-patch-id: dd3bdf2aebda74f3603aff24a2c9aaa7f4fd6763
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

