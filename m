Return-Path: <linux-arm-msm+bounces-58357-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E93C8ABB2BA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 03:01:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF3281893E17
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 01:01:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 896588F6F;
	Mon, 19 May 2025 01:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mVTnjCUX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8869984D08
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 01:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747616493; cv=none; b=BMDRdj7pULvfzv8Ik3zwEzQD/ExjCLVDLZtJOnqH+LinmEE30RWp6InepzdSgdvYPrkbz6DLBA3p82/PreTG2RsIq7+JmPyGQwh/4SWMX6SwV6IIpIy15rOf+XOfn2LquSEx4usAigahLN5RDIeCW66DcPb0df9hhMdL1ogoIgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747616493; c=relaxed/simple;
	bh=J6/rcsiVJhVcljceiNS2TtvEcgPJA+QJNmMeQ6NBbk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fPMF3Bzz4QoO7aSm4ZxrPl9Yc5YFBCXIw6/eGAs5VPKXlbqACbLQXFrOj1ibd4mEjeUPS6ssyory1J2pzUg1R6/02cLi0fqbpG/mJ0Cb+1yN8kduBaZPrD5s0PjxbfVHHRfXCziy1JxHr5sV0q8iEakGXr7NcCLqt7ZP1Kd+JBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mVTnjCUX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54INFnOw026747
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 01:01:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qq9RXq9SVzhhh+kL9lJzrgG+
	A/t/p+ZZEkzTdEVAQYI=; b=mVTnjCUXa5nvUgocAAsfyqzqSHq0o/ZsrB7cSvyZ
	jFwEejGeYLsqI/9Y1hn7ZtgNMetBkmKgaCHqwfqCMQ+a6OCD4yplgMyd3OkJKHJ2
	k5xg916aQRkGOfnuapKCbpGLs1dF3cAJZwsUmVCwBIK9eNxMpY/ehodoYLm/ykh4
	deZ/V2DM7HlNWiJvEyUnaQv2uWsEmfl2CCL47Nwq8ZEujEqIULO2CII/oKKPE58V
	qUCFasPv2mUd5Zb6WKBfN+MwnvvI06F1b3ohcgrPoQoSagpUTJjRermeaj3uIqs7
	qXgkODFxX3Ko/j7aI8SYbRxDiuGxQNq5Bba9B0lbHkmiOg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjkctp3b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 01:01:29 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-476a44cec4cso68758431cf.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 18:01:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747616489; x=1748221289;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qq9RXq9SVzhhh+kL9lJzrgG+A/t/p+ZZEkzTdEVAQYI=;
        b=EJT4C+491jtSrjb//6ZmhvapdSLxIEg5fgiJsUjAQNyyqyvIkmyyAR6Gk7J87SsnFW
         MZ2Yl91gpsQtGrt1uFNIxCihF6i1B9QsKSaeJFudq909PE6gIIIs91a+3he1fnNf61Ez
         T94MulqOcqXhcPjzLPXxW1gY+8liwapyLUW/ExmVWo3pfAKtHf76ZwodWBN0GYJ38rB/
         K4ou/BtFd7kiEXezwN6ZcVCpN0+3vi3keifQdkRR+Z7WXQxY3WcrRY9WMlOIHPijoxse
         YilQb33uRDzEKo4FYIUqf7+wmWHWk2/rmcG/Tso8Mwj/roaygh+eLsVPXStAeBaI/xHQ
         LERg==
X-Gm-Message-State: AOJu0YxtxY+7Syw0FVNlUnfo0Yiqe199+sUa4tfh6UaYa4DdFM2vE1LM
	JCFMPXTrK8HP65PD9+Do+xQpsElQ/VVW0ulf4o2RAI3A7fNVTwkgYGTLQSN9Vh1W7kWAN/SsBiF
	AiuzGQZuze4ZpvxJWak8jLof8mZ/YnCEsyEwMCi1HItw8QDXAopxlkJPtl3QrfXW29GsD
X-Gm-Gg: ASbGncscc8Wm4+h/a0WRC2n4nOD28RgMbTAT3jj5GVvGTkwEgZPCBlx5NsgYJJrggpM
	8awpHZK5VSNJq6MH3aXJGr1US5s74Kszn66iXrealIes7IZHGKDBVAxseFXtnBYX5LF4hGN1sx3
	fD5TPAIWPAbZ7zbTp/r/tuHpDDIUbNkV3ApLeFvdhUb6pLVq0hlIk9MIdvzfNjKNKSwvAV1SiRj
	InhR2e+EnfKbb5DS3zpMQyCqQ9vQnsGl8QRFTyV8u8PhNbsVpTjce2mN3relX8f56VGevDziiw+
	5QDraty1WFo+PjMM8QwBedL9EQJoGcowqfVsxrFIpHRIiq1LaPVrQ3WcRpWmvjn4K8flUamfGmg
	=
X-Received: by 2002:ad4:5f0d:0:b0:6f5:748e:c6f4 with SMTP id 6a1803df08f44-6f8b087097dmr211392886d6.37.1747616488539;
        Sun, 18 May 2025 18:01:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtM9T4XNbEFF8ECRVL2nou27yxJUbqWcJOM1bWrwp+s7uIIKSfzncgHPn8YqJw4vvYzHTGmg==
X-Received: by 2002:ad4:5f0d:0:b0:6f5:748e:c6f4 with SMTP id 6a1803df08f44-6f8b087097dmr211392356d6.37.1747616488039;
        Sun, 18 May 2025 18:01:28 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f161b1sm1638412e87.16.2025.05.18.18.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 18:01:27 -0700 (PDT)
Date: Mon, 19 May 2025 04:01:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ayushi Makhija <amakhija@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ayushi Makhija <quic_amakhija@quicinc.com>, robdclark@gmail.com,
        sean@poorly.run, marijn.suijten@somainline.org, andersson@kernel.org,
        robh@kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
        konradybcio@kernel.org, conor+dt@kernel.org, andrzej.hajda@intel.com,
        neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_jesszhan@quicinc.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v7 1/2] arm64: dts: qcom: sa8775p: add Display Serial
 Interface device nodes
Message-ID: <tjp2pfescczqikbu2tzylx4ecb3n6trixvhbdwbpz6y4jc52wk@fmkdxrelun3i>
References: <20250513102611.1456868-1-amakhija@qti.qualcomm.com>
 <20250513102611.1456868-2-amakhija@qti.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513102611.1456868-2-amakhija@qti.qualcomm.com>
X-Proofpoint-GUID: J5xqVJsEhGR-w5-WnDSrKMtFerMnawCy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDAwNyBTYWx0ZWRfXzD1FY2fsHYhf
 oW+7Pukp/xOtdlFMQqHBNplc6Bzu/zorRLkwAEjHqpiNNPz9WMhBF8vu/9fbQkkzRiauY7eahSq
 Ah2bojPx9oz0NH74uUJWbhULGT5mJ4RTmmYrkbkIxLkFkBjPFMmBnzzd8KYQR9WBpfe5kUbU1vd
 xzpB1+Z6V516klh2T+AR2Sh2XThIk7bVS2P1V+b5n7RdS5Pvv2zLm7sT4proBobp/NlrRvkPBcX
 We6gix+Ur7ZNGs8x4Bx3unF8qDBChlUfWIpY7fHwegPSUfggC/XsUj64Qe5lpA/ju1ZgRtLPC3y
 yxfvNvGJuOL3PLrKoQLTMl3OSptH27M3c/DXoLhjrUkeMHDuEAvi4hYhvH4voKooOwxkaKpbtJD
 h9RGF2l76YOIpX+uHCInjpy/XbmKw/yqEmcK3m8+MN+WraztmVVKjAbjrnGmt3nIm2VLeSwA
X-Authority-Analysis: v=2.4 cv=aJXwqa9m c=1 sm=1 tr=0 ts=682a82e9 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=sOAf8FZNR29loNffVzUA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: J5xqVJsEhGR-w5-WnDSrKMtFerMnawCy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_12,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 phishscore=0 adultscore=0 clxscore=1015
 mlxlogscore=999 spamscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190007

On Tue, May 13, 2025 at 03:56:10PM +0530, Ayushi Makhija wrote:
> From: Ayushi Makhija <quic_amakhija@quicinc.com>
> 
> Add device tree nodes for the DSI0 and DSI1 controllers
> with their corresponding PHYs found on Qualcomm SA8775P SoC.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <lumag@kernel.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 186 +++++++++++++++++++++++++-
>  1 file changed, 185 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> index 5bd0c03476b1..f8777f17d24a 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> @@ -6,6 +6,7 @@
>  
>  #include <dt-bindings/interconnect/qcom,icc.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
>  #include <dt-bindings/clock/qcom,rpmh.h>
>  #include <dt-bindings/clock/qcom,sa8775p-dispcc.h>
>  #include <dt-bindings/clock/qcom,sa8775p-gcc.h>
> @@ -4034,6 +4035,22 @@ dpu_intf4_out: endpoint {
>  							remote-endpoint = <&mdss0_dp1_in>;
>  						};
>  					};
> +
> +					port@2 {
> +						reg = <2>;
> +
> +						dpu_intf1_out: endpoint {
> +							remote-endpoint = <&mdss0_dsi0_in>;
> +						};
> +					};
> +
> +					port@3 {
> +						reg = <3>;
> +
> +						dpu_intf2_out: endpoint {
> +							remote-endpoint = <&mdss0_dsi1_in>;
> +						};
> +					};
>  				};
>  
>  				mdss0_mdp_opp_table: opp-table {
> @@ -4061,6 +4078,170 @@ opp-650000000 {
>  				};
>  			};
>  
> +			mdss0_dsi0: dsi@ae94000 {
> +				compatible = "qcom,sa8775p-dsi-ctrl", "qcom,mdss-dsi-ctrl";
> +				reg = <0x0 0x0ae94000 0x0 0x400>;
> +				reg-names = "dsi_ctrl";
> +
> +				interrupt-parent = <&mdss0>;
> +				interrupts = <4>;
> +
> +				clocks = <&dispcc0 MDSS_DISP_CC_MDSS_BYTE0_CLK>,
> +					 <&dispcc0 MDSS_DISP_CC_MDSS_BYTE0_INTF_CLK>,
> +					 <&dispcc0 MDSS_DISP_CC_MDSS_PCLK0_CLK>,
> +					 <&dispcc0 MDSS_DISP_CC_MDSS_ESC0_CLK>,
> +					 <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
> +					 <&gcc GCC_DISP_HF_AXI_CLK>;
> +				clock-names = "byte",
> +					      "byte_intf",
> +					      "pixel",
> +					      "core",
> +					      "iface",
> +					      "bus";
> +				assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_BYTE0_CLK_SRC>,
> +						  <&dispcc0 MDSS_DISP_CC_MDSS_PCLK0_CLK_SRC>;
> +				assigned-clock-parents = <&mdss0_dsi0_phy DSI_BYTE_PLL_CLK>,
> +							 <&mdss0_dsi0_phy DSI_PIXEL_PLL_CLK>;
> +				phys = <&mdss0_dsi0_phy>;
> +
> +				operating-points-v2 = <&dsi0_opp_table>;
> +				power-domains = <&rpmhpd SA8775P_MMCX>;
> +
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				status = "disabled";
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +
> +						mdss0_dsi0_in: endpoint {
> +							remote-endpoint = <&dpu_intf1_out>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +
> +						mdss0_dsi0_out: endpoint{ };
> +					};
> +				};
> +
> +				dsi0_opp_table: opp-table {

mdss_dsi_opp_table: opp-table {}

> +					compatible = "operating-points-v2";
> +
> +					opp-358000000 {

Is there only one entry? Usually there are several.

> +						opp-hz = /bits/ 64 <358000000>;
> +						required-opps = <&rpmhpd_opp_svs_l1>;
> +					};
> +				};
> +			};
> +
> +			mdss0_dsi0_phy: phy@ae94400 {
> +				compatible = "qcom,sa8775p-dsi-phy-5nm";
> +				reg = <0x0 0x0ae94400 0x0 0x200>,
> +				      <0x0 0x0ae94600 0x0 0x280>,
> +				      <0x0 0x0ae94900 0x0 0x27c>;
> +				reg-names = "dsi_phy",
> +					    "dsi_phy_lane",
> +					    "dsi_pll";
> +
> +				#clock-cells = <1>;
> +				#phy-cells = <0>;
> +
> +				clocks = <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
> +					 <&rpmhcc RPMH_CXO_CLK>;
> +				clock-names = "iface", "ref";
> +
> +				status = "disabled";
> +			};
> +
> +			mdss0_dsi1: dsi@ae96000 {
> +				compatible = "qcom,sa8775p-dsi-ctrl", "qcom,mdss-dsi-ctrl";
> +				reg = <0x0 0x0ae96000 0x0 0x400>;
> +				reg-names = "dsi_ctrl";
> +
> +				interrupt-parent = <&mdss0>;
> +				interrupts = <5>;
> +
> +				clocks = <&dispcc0 MDSS_DISP_CC_MDSS_BYTE1_CLK>,
> +					 <&dispcc0 MDSS_DISP_CC_MDSS_BYTE1_INTF_CLK>,
> +					 <&dispcc0 MDSS_DISP_CC_MDSS_PCLK1_CLK>,
> +					 <&dispcc0 MDSS_DISP_CC_MDSS_ESC1_CLK>,
> +					 <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
> +					 <&gcc GCC_DISP_HF_AXI_CLK>;
> +				clock-names = "byte",
> +					      "byte_intf",
> +					      "pixel",
> +					      "core",
> +					      "iface",
> +					      "bus";
> +				assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_BYTE1_CLK_SRC>,
> +						  <&dispcc0 MDSS_DISP_CC_MDSS_PCLK1_CLK_SRC>;
> +				assigned-clock-parents = <&mdss0_dsi1_phy DSI_BYTE_PLL_CLK>,
> +							 <&mdss0_dsi1_phy DSI_PIXEL_PLL_CLK>;
> +				phys = <&mdss0_dsi1_phy>;
> +
> +				operating-points-v2 = <&dsi1_opp_table>;
> +				power-domains = <&rpmhpd SA8775P_MMCX>;
> +
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				status = "disabled";
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +
> +						mdss0_dsi1_in: endpoint {
> +							remote-endpoint = <&dpu_intf2_out>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +
> +						mdss0_dsi1_out: endpoint { };
> +					};
> +				};
> +
> +				dsi1_opp_table: opp-table {

You don't need a second DSI OPP table.

> +					compatible = "operating-points-v2";
> +
> +					opp-358000000 {
> +						opp-hz = /bits/ 64 <358000000>;
> +						required-opps = <&rpmhpd_opp_svs_l1>;
> +					};
> +				};
> +			};
> +
> +			mdss0_dsi1_phy: phy@ae96400 {
> +				compatible = "qcom,sa8775p-dsi-phy-5nm";
> +				reg = <0x0 0x0ae96400 0x0 0x200>,
> +				      <0x0 0x0ae96600 0x0 0x280>,
> +				      <0x0 0x0ae96900 0x0 0x27c>;
> +				reg-names = "dsi_phy",
> +					    "dsi_phy_lane",
> +					    "dsi_pll";
> +
> +				#clock-cells = <1>;
> +				#phy-cells = <0>;
> +
> +				clocks = <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
> +					 <&rpmhcc RPMH_CXO_CLK>;
> +				clock-names = "iface", "ref";
> +
> +				status = "disabled";
> +			};
> +
>  			mdss0_dp0_phy: phy@aec2a00 {
>  				compatible = "qcom,sa8775p-edp-phy";
>  
> @@ -4267,7 +4448,10 @@ dispcc0: clock-controller@af00000 {
>  				 <&sleep_clk>,
>  				 <&mdss0_dp0_phy 0>, <&mdss0_dp0_phy 1>,
>  				 <&mdss0_dp1_phy 0>, <&mdss0_dp1_phy 1>,
> -				 <0>, <0>, <0>, <0>;
> +				 <&mdss0_dsi0_phy DSI_BYTE_PLL_CLK>,
> +				 <&mdss0_dsi0_phy DSI_PIXEL_PLL_CLK>,
> +				 <&mdss0_dsi1_phy DSI_BYTE_PLL_CLK>,
> +				 <&mdss0_dsi1_phy DSI_PIXEL_PLL_CLK>;
>  			power-domains = <&rpmhpd SA8775P_MMCX>;
>  			#clock-cells = <1>;
>  			#reset-cells = <1>;
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

