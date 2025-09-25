Return-Path: <linux-arm-msm+bounces-75206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6AABA1A50
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 23:45:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E12DC562B7E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 21:45:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1A1F322DC3;
	Thu, 25 Sep 2025 21:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gzri3nGx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288F6322DA6
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 21:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758836491; cv=none; b=sJOs5l/Ik6qK+pH51I0u2ym1KqxDiUk1D0rZR/TLZdRRd1E7FfMHQX0+fZouK+xUQYS3gV2rIy8GJkIlwjKQxUtWn8OYKAPSQvnE3BHRJKrfcMS8YRx13z3UQH1cdjS4K1AQLZaBnVngZG8pS4/XvnaaOzOTI6vx5wchhM5RlFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758836491; c=relaxed/simple;
	bh=lWQcLfTK/RXtnn34Dg8tMv9QwUAD7PLbvUFn8yP4HEU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fxybjGwdf86dG1lytEsbUQ6/gXqNkt8v9hcMOD7P9q/5GHY29YPTIOx9k6wfcpOaCbiH+9QyRkVP2z3uZnT5km3wSIb7CrPFoHU7vH7tx1B0jh4hEXFVGn7qsaxgmhXYIaDN6yJBu2+ovMcKmoX2A4J+Fp5rUyOG7HSg2Fm3Fvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gzri3nGx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIPqRt024171
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 21:41:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gq850mx1JEkEVcNwc8cbpbK4
	ig9MAPU9eohhzjEJ8uo=; b=Gzri3nGxXHdR8pkMQnkBr4J8LJ+bvhcqS7QG1iXP
	i21321+ZPdjc439bznG3pzo5wsg4I0bpfjDfK7n14iPVaMCtooEOAygotSyxH99D
	/AQUR/2vI/II8pjF3Y4Opeipf+a5MGt5q1HMnRKwV2SKpg/a/iR2znbKH6M2h4zh
	ldNywDUhxTP3hXgYDQCBOKk2y2qU+rwPcLGCNNaiEQFKUWoCFm69MAwsiUWVmULI
	JrhG5e9knWucBQH+ZXDFSuJOJPDq1qGsoGp3eVtwaQcWpMgLxBfYobjP9evQlSEX
	rOQ2iWW8JtIpDjZFmiI/1PwRZXKfTJkwgOn6ADmIOiQYaA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0qrfj3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 21:41:29 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4cce66e91e3so47778521cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 14:41:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758836488; x=1759441288;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gq850mx1JEkEVcNwc8cbpbK4ig9MAPU9eohhzjEJ8uo=;
        b=Vb7mJ5GuwvVuC1tjoV+KFGc17jG6rAgnUJcUy0t/LxOuXF3aWerfOVeuNrTEU5Z8f4
         dFjaM37y9xWjUX9d4S4NDA+2ClB2SuwNjABEjRWFbzSCT8kvcIlQQME7i1Pj4+f84AS9
         st0oOj02+vgnIBudbQ7TUuNTE95cgktU9cfpoE/BcVtwp73j6XfNvtRf4vAzfxrkYMLn
         QJhFQ3/CSb0TxBq4fDSVedBQpxTqJ/WJdI8/mYc7zQ/jf5Udd5xX+PAZfjj63h0kOC+6
         w/bTWoRML6ZyGMakYv/g5RaDdlnuK06hYw2t+zG7hnU2tEG9zYsCbtFySYPiaR3gDiRv
         ceZg==
X-Forwarded-Encrypted: i=1; AJvYcCXIp7ZrUDowmTIarhewdPkMxn0MRmU0PvMTKuqpbGFhJrL2WicGFrR4BUsaMxBsNHAoQH1GyHAMyU+XG7+3@vger.kernel.org
X-Gm-Message-State: AOJu0YxC1YHtxWMqx7JIDmTeAvwR7f8nwayhuQbWVhQwqOmgUdVQU1Uc
	QNa03xmDNzr0tFe+F0yw/TMwtytEvqxVFsG/1xf1SomJz3ezcajhoFQsGMhwEWyX3hOxLN5qbCG
	I8MPR9KqvMsJ+ml0VQcLQi9Z7X+5h0mNiufCdI2ugwCMBCdpiY+ru3nhVAy/BhgMN4Ykl
X-Gm-Gg: ASbGncvSIoVM4rYnM1oOmP0ucuEKBFzjmtZnv4upAbPWmwTfDuEBxKCLFA7VjbfXvPg
	ftGJbMwNfN/wQoyB2PUVCnCUhiICKMWs/gcYGASE2Q4YO3Zt+ayDi/s+OgEbQEXwgFOsO61+kVL
	rnrfNCHWfAu/qNJIwd6f/7cla9yXkkDoGo5lpccOMIDrQl0JJ9DSoFg3afK+P0aC0BffBiOB9PR
	pdHjmpUPRa9Z6B670ek7cs7c3JrsC3OGeRAHIwdym0nkqVuUWF3XN9Sy0h3sCVsOB6PfYzoQvr1
	F4LADqyilLhy3y8gRAsuz9o4ySjEX7pkaCa7O2IGADouLL4M1Weyfe+n+z3N5JZjgUwB03cBiAS
	Q1Xy2icIHWidPKYR4p0X/nRSKBDpWG0l/uHcKlsKsPWyQ2LDJbvfx
X-Received: by 2002:a05:622a:1213:b0:4b7:aff5:e8bc with SMTP id d75a77b69052e-4da4e473eb1mr75028691cf.81.1758836487518;
        Thu, 25 Sep 2025 14:41:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJD0ndk49dGXgSadXCvsl5x2lM4uGjNCHjBtcN8xoK9UOSzOWRfjlvlGiPqiaDmJ0cBA/ajQ==
X-Received: by 2002:a05:622a:1213:b0:4b7:aff5:e8bc with SMTP id d75a77b69052e-4da4e473eb1mr75028391cf.81.1758836486957;
        Thu, 25 Sep 2025 14:41:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58316a316e8sm1157140e87.105.2025.09.25.14.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 14:41:25 -0700 (PDT)
Date: Fri, 26 Sep 2025 00:41:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mahadevan <mahadevan.p@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: lemans: add DT changes to enable MDSS1
 and DPU
Message-ID: <nnvjazbxpywrmjnt67isba6m3ld6rqdaiid4qeczunmuablntz@vlbrjnxj5r2k>
References: <20250925-lemans_dual-v1-1-9c371803198d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925-lemans_dual-v1-1-9c371803198d@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: W-sw9IDpEsU9iJIjlZu5jZKuB7ADgHxK
X-Authority-Analysis: v=2.4 cv=bJ0b4f+Z c=1 sm=1 tr=0 ts=68d5b709 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=ypcn96NggbCjLHHLOsEA:9
 a=pqjIMKWhhNAOVmsd:21 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfXzc6fV+hqRiGn
 1BTs+nKD0HOoQz213gdcp4lG48iyfui2kQo/pfTzuZ+B7qucjBBlIPiQFqmop2e1FcExKSbpNbz
 i1pHaUfUUgf/qn61G2yUsh1RCZCBSd4YINmpuEn50iQZaTJrVs6ykkQUNjrsFmAqoF7loqbS3gM
 sNe5oBQEDo1qeWIZH1Ry2yZRpTBrNtyTG4dN9ilhcGlX7FiuOXm79ioC5w/BjKPHJyYxi/yBo73
 CPAbgLAovMeDaccuddppQ8rn/bZeMC3tnN3GZH0eODAghJOlEwxZ4g82GrBjcUyV4klpOE9fAAK
 QDQvw/UD6zrq0JBJlEv6HezDkPThLrckHrVa0LchKaPYCEaCUenCI/KwcDarmq7dnaItWS1XovR
 Uyd80+x2rMLU10O/rXeykiEzeO5TTQ==
X-Proofpoint-GUID: W-sw9IDpEsU9iJIjlZu5jZKuB7ADgHxK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_02,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171

On Thu, Sep 25, 2025 at 02:28:07PM +0530, Mahadevan wrote:
> Add devicetree changes to enable second Mobile Display
> Subsystem (MDSS1) and its Display Processing Unit(DPU) for
> Qualcomm LEMANS platform.

No outputs? Should it be enabled on any of the devices?

> 
> Signed-off-by: Mahadevan <mahadevan.p@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans.dtsi | 88 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 88 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
> index 48f753002fc459a3e9fac0c0e98cbec6013fea0f..45c11c050d3f8853701fd20cf647aef5c6a9a8c9 100644
> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> @@ -6751,6 +6751,94 @@ compute-cb@3 {
>  			};
>  		};
>  
> +		mdss1: display-subsystem@22000000 {

Why do you need this label?

> +			compatible = "qcom,sa8775p-mdss";
> +			reg = <0x0 0x22000000 0x0 0x1000>;
> +			reg-names = "mdss";
> +
> +			/* same path used twice */
> +			interconnects = <&mmss_noc MASTER_MDP_CORE1_0 QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +					<&mmss_noc MASTER_MDP_CORE1_1 QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
> +			interconnect-names = "mdp0-mem",
> +					     "mdp1-mem",
> +					     "cpu-cfg";
> +
> +			resets = <&dispcc1 MDSS_DISP_CC_MDSS_CORE_BCR>;
> +
> +			power-domains = <&dispcc1 MDSS_DISP_CC_MDSS_CORE_GDSC>;
> +
> +			clocks = <&dispcc1 MDSS_DISP_CC_MDSS_AHB_CLK>,
> +				 <&gcc GCC_DISP1_HF_AXI_CLK>,
> +				 <&dispcc1 MDSS_DISP_CC_MDSS_MDP_CLK>;
> +
> +			interrupts = <GIC_SPI 865 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-controller;
> +			#interrupt-cells = <1>;
> +
> +			iommus = <&apps_smmu 0x1800 0x402>;
> +
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +
> +			status = "disabled";
> +
> +			mdss1_mdp: display-controller@22001000 {

Why do you need this label?

> +				compatible = "qcom,sa8775p-dpu";
> +				reg = <0x0 0x22001000 0x0 0x8f000>,
> +				      <0x0 0x220b0000 0x0 0x3000>;
> +				reg-names = "mdp", "vbif";
> +
> +				clocks = <&gcc GCC_DISP1_HF_AXI_CLK>,
> +					 <&dispcc1 MDSS_DISP_CC_MDSS_AHB_CLK>,
> +					 <&dispcc1 MDSS_DISP_CC_MDSS_MDP_LUT_CLK>,
> +					 <&dispcc1 MDSS_DISP_CC_MDSS_MDP_CLK>,
> +					 <&dispcc1 MDSS_DISP_CC_MDSS_VSYNC_CLK>;
> +				clock-names = "nrt_bus",
> +					      "iface",
> +					      "lut",
> +					      "core",
> +					      "vsync";
> +
> +				assigned-clocks = <&dispcc1 MDSS_DISP_CC_MDSS_VSYNC_CLK>;
> +				assigned-clock-rates = <19200000>;
> +
> +				operating-points-v2 = <&mdss1_mdp_opp_table>;
> +				power-domains = <&rpmhpd SA8775P_MMCX>;
> +
> +				interrupt-parent = <&mdss1>;
> +				interrupts = <0>;
> +
> +				mdss1_mdp_opp_table: opp-table {
> +					compatible = "operating-points-v2";
> +
> +					opp-375000000 {
> +						opp-hz = /bits/ 64 <375000000>;
> +						required-opps = <&rpmhpd_opp_svs_l1>;
> +					};
> +
> +					opp-500000000 {
> +						opp-hz = /bits/ 64 <500000000>;
> +						required-opps = <&rpmhpd_opp_nom>;
> +					};
> +
> +					opp-575000000 {
> +						opp-hz = /bits/ 64 <575000000>;
> +						required-opps = <&rpmhpd_opp_turbo>;
> +					};
> +
> +					opp-650000000 {
> +						opp-hz = /bits/ 64 <650000000>;
> +						required-opps = <&rpmhpd_opp_turbo_l1>;
> +					};
> +				};
> +			};
> +		};
> +
>  		dispcc1: clock-controller@22100000 {
>  			compatible = "qcom,sa8775p-dispcc1";
>  			reg = <0x0 0x22100000 0x0 0x20000>;
> 
> ---
> base-commit: 846bd2225ec3cfa8be046655e02b9457ed41973e
> change-id: 20250923-lemans_dual-c03ad5c84a84
> 
> Best regards,
> -- 
> Mahadevan <mahadevan.p@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry

