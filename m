Return-Path: <linux-arm-msm+bounces-42368-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2EB9F38C2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 19:20:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 633E3189415A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 18:15:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 523DB839F4;
	Mon, 16 Dec 2024 18:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iML+H+43"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84DA8206F35
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2024 18:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734372874; cv=none; b=hDlHXU6fM37C+luJVNbqJDHRTAjBMYRXSw+9jMRZyTxM2HSvd6xSqt8TzJQzEqpjuz7h8lehoGfNrcyML6TBRI4qum9eoJPwUOBQK03yrZIGGOGWsc0PHj2dycmcfdoEQv/y4ek9UjkNhsPhi8noodYuFryIhcDjISIbIqOtmhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734372874; c=relaxed/simple;
	bh=qQp1mMuebuWcgpzeQ8MZfSm5Kjn+6fFQ1qoHMEwlUF0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i8BVR/YpVhZtn4FmbKgc5P6jXfQb0nx9ZVHBOwBJ5+7WaPGyAuD0+KKEtvgAzyN2Z1U/WWLT4eVW5x26v3swvh8SEJZB5YKQW+9nEcwZmKrjpx6+JAYIXNDzLu5WZ30rGl88B1fdqok+sd86ED9ioTvJ2KDQk/VGBq0tCZ+9pbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iML+H+43; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGFHmeA021941
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2024 18:14:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=F7QFYnjZdrevf6fYXiZFNc8L
	fJX9KsBVad/8dWQ9YrM=; b=iML+H+43b0iNSNoM2qeJtb8CjU4OtRR5fwXnDKbH
	SDXEu7CH5bqY6zz4CfMYKvoIRnKInLjcYN0Z5EKyM0xr4S+r0EQFe97i4uzAcPsP
	k8ykCSTRd7fbKiT0fFidJ8gHAeEpv4GzdMf1YHB645EcthDwnGiWWDwu7nSSZEPe
	/pZsWUiqm7ev/HXC17JtyHpbeJ74+akXPHKZHQH+hOstq7I0p5s12jnWM+pFthFt
	g9/ZE9z+K0NNHpzP+1AJaozMX+/jTDN9FyDISFMgn8yfQc+s08C77rsc/lXl7jB5
	A5xE76kMSR/NT14/MSwQNWim5mQf7CSaISPifD5J0xGAxA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43jpqmgf6g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2024 18:14:31 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-216405eea1fso36138625ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2024 10:14:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734372870; x=1734977670;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F7QFYnjZdrevf6fYXiZFNc8LfJX9KsBVad/8dWQ9YrM=;
        b=W5f26GpNVH5MYJRdF/38SlExrg+eHpgH+WZEVUEk50fCYLEnTv+XaQ1P6/n0u95zzB
         K7uNAMrBS415yOsQyMnjbWJikdimbDPpfSkRj6R1Uwm6R+NQUoVkRXi+COxqUYbIbqh5
         WPFasTDxk0T2EnAyLkuX6xjOxfM/TuGjPsnn2gT/xFu/yXI3516cV0YL3FT9u5xnMNW6
         1kWcDUFmXEFk+IrzvEt929WO8r6Ryvf2q17y8G5jeZ2nhZE1ZJJbQTcgeVAAKtixDKOP
         B/BZCUcSL8T7O2hBiN3Bf6cYQyGvSQWARlKQ4cuAnvKFDXSgBSh03wWdaGC9EBMkqmvU
         wLDw==
X-Forwarded-Encrypted: i=1; AJvYcCVO0VE3UQQeEFtwVz/lQUFhx+ryfTmcHD2q/fITxJzPH+AyNz8N3np5fflTRp+zJzg+ljJTzWBfE1ufjKRV@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0DKxLCEXBdO1p+g9Fsyj/d7UIu/QxNGnl8PizCc1z/2UvaMf4
	q9VFctz8E1wKvGOU++PBb4foLjNCn44ulOX4xP70Csh7LPN8IDZXjaFhCAWLin+X8JxVwOLopjz
	ZMml0+jTNYt/OV6dkFqcdoLqf4kaU7kr8jCB+1Sd/op9N0AiXDMdget5cWWyLSD4a
X-Gm-Gg: ASbGnctSSgzXkMcfInHpyB+5jbKFXAYl78tu4Kud/WEc7N4lbyt68BMF4o3xHm2KG3n
	pJ4jzBlovmv2NktFLuDQo2cR7s9iNe4e4oxnDFfQxSY3+Z3GzPDOi66rud704WEeWTMDRtJzUOv
	HyhM7xaJJTTGOk0gFk1ZdXwn9FaetOol7N+VIcEcYQdguXIF8jUgNM21/vsgQUP7GzodWJ3Vl+I
	18fmUUv/YPvO0ktua2pVPihARcxF1PO+i9VCUE08OmHg1r1BYkc63RSqDc3Q6Syz8dPb1FHnzZD
	olVv6WNsz5RqmZ2r/f2y5nnJINwMw+z3YZLZCJ55
X-Received: by 2002:a17:902:d50c:b0:20c:9821:6998 with SMTP id d9443c01a7336-21892980dc6mr211008335ad.10.1734372868352;
        Mon, 16 Dec 2024 10:14:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHzAs2ikuRORFUIWHU85mcPsoI6mCLnHMxnIg87pLHeW7l6HW03YGJUZmaZ+3zYaGC5dlmm/w==
X-Received: by 2002:a17:902:d50c:b0:20c:9821:6998 with SMTP id d9443c01a7336-21892980dc6mr211007785ad.10.1734372867817;
        Mon, 16 Dec 2024 10:14:27 -0800 (PST)
Received: from hu-bjorande-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-801d5a90d1fsm3622789a12.3.2024.12.16.10.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 10:14:27 -0800 (PST)
Date: Mon, 16 Dec 2024 10:14:25 -0800
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
To: Renjiang Han <quic_renjiang@quicinc.com>
Cc: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/4] arm64: dts: qcom: add venus node for the qcs615
Message-ID: <Z2BuAX+idQFlJt1F@hu-bjorande-lv.qualcomm.com>
References: <20241213-add-venus-for-qcs615-v4-0-7e2c9a72d309@quicinc.com>
 <20241213-add-venus-for-qcs615-v4-3-7e2c9a72d309@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241213-add-venus-for-qcs615-v4-3-7e2c9a72d309@quicinc.com>
X-Proofpoint-ORIG-GUID: YYjhHhDVJKfXW8I9WQhwDUIhZ_669VUw
X-Proofpoint-GUID: YYjhHhDVJKfXW8I9WQhwDUIhZ_669VUw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=954
 spamscore=0 malwarescore=0 lowpriorityscore=0 mlxscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412160151

On Fri, Dec 13, 2024 at 03:26:48PM +0530, Renjiang Han wrote:

Subject should be prefixed per the file being changed, i.e:
"arm64: dts: qcom: qcs615: Add Venus"

> Add venus node into devicetree for the qcs615 video and fallback
> qcs615 to sc7180 due to the same video core.
> 
> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 86 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 86 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> index 37a189e0834d2f4b75ed9deb6fff73da163cb3a3..c08da80c7fd8fa8c69aff04b14784b821ce3ea13 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> @@ -427,6 +427,11 @@ smem_region: smem@86000000 {
>  			no-map;
>  			hwlocks = <&tcsr_mutex 3>;
>  		};
> +
> +		pil_video_mem: pil-video@93400000 {
> +			reg = <0x0 0x93400000 0x0 0x500000>;
> +			no-map;
> +		};
>  	};
>  
>  	soc: soc@0 {
> @@ -2806,6 +2811,87 @@ gem_noc: interconnect@9680000 {
>  			qcom,bcm-voters = <&apps_bcm_voter>;
>  		};
>  
> +		venus: video-codec@aa00000 {
> +			compatible = "qcom,qcs615-venus", "qcom,sc7180-venus";
> +			reg = <0x0 0x0aa00000 0x0 0x100000>;
> +			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			clocks = <&videocc VIDEO_CC_VENUS_CTL_CORE_CLK>,
> +				 <&videocc VIDEO_CC_VENUS_AHB_CLK>,
> +				 <&videocc VIDEO_CC_VENUS_CTL_AXI_CLK>,
> +				 <&videocc VIDEO_CC_VCODEC0_CORE_CLK>,
> +				 <&videocc VIDEO_CC_VCODEC0_AXI_CLK>;
> +			clock-names = "core",
> +				      "iface",
> +				      "bus",
> +				      "vcodec0_core",
> +				      "vcodec0_bus";
> +
> +			power-domains = <&videocc VENUS_GDSC>,
> +					<&videocc VCODEC0_GDSC>,
> +					<&rpmhpd RPMHPD_CX>;
> +			power-domain-names = "venus",
> +					     "vcodec0",
> +					     "cx";
> +
> +			operating-points-v2 = <&venus_opp_table>;
> +
> +			interconnects = <&mmss_noc MASTER_VIDEO_P0 QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ALWAYS>;
> +			interconnect-names = "video-mem",
> +					     "cpu-cfg";
> +
> +			iommus = <&apps_smmu 0xe40 0x20>;
> +
> +			memory-region = <&pil_video_mem>;
> +
> +			status = "disabled";
> +
> +			video-decoder {
> +				compatible = "venus-decoder";
> +			};
> +
> +			video-encoder {
> +				compatible = "venus-encoder";
> +			};
> +
> +			venus_opp_table: opp-table {

'o' < 'v', so this should come above video-decoder.

Regards,
Bjorn

> +				compatible = "operating-points-v2";
> +
> +				opp-133330000 {
> +					opp-hz = /bits/ 64 <133330000>;
> +					required-opps = <&rpmhpd_opp_low_svs>;
> +				};
> +
> +				opp-240000000 {
> +					opp-hz = /bits/ 64 <240000000>;
> +					required-opps = <&rpmhpd_opp_svs>;
> +				};
> +
> +				opp-300000000 {
> +					opp-hz = /bits/ 64 <300000000>;
> +					required-opps = <&rpmhpd_opp_svs_l1>;
> +				};
> +
> +				opp-380000000 {
> +					opp-hz = /bits/ 64 <380000000>;
> +					required-opps = <&rpmhpd_opp_nom>;
> +				};
> +
> +				opp-410000000 {
> +					opp-hz = /bits/ 64 <410000000>;
> +					required-opps = <&rpmhpd_opp_turbo>;
> +				};
> +
> +				opp-460000000 {
> +					opp-hz = /bits/ 64 <460000000>;
> +					required-opps = <&rpmhpd_opp_turbo_l1>;
> +				};
> +			};
> +		};
> +
>  		videocc: clock-controller@ab00000 {
>  			compatible = "qcom,qcs615-videocc";
>  			reg = <0 0xab00000 0 0x10000>;
> 
> -- 
> 2.34.1
> 

