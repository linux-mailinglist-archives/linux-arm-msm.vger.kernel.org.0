Return-Path: <linux-arm-msm+bounces-66991-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B79CB14CE0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 13:17:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D0E23A219F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 11:17:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9BAD28C025;
	Tue, 29 Jul 2025 11:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JJvb/z67"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58EC128982C
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 11:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753787868; cv=none; b=hB8QMLHg5Xv49r3Umn+H2exK/TKmtkEJJhZ6uyng01GsVkWMR6Q7XNjl1kSLWbgfZe0USFZNqHttw/h92eQjPKUzR/VCNjqhXrBPEmuKDrK6FrLys7VqaPYkTWHb+8URB1vntseQNHjXLemEo+1GzGE8Zgvq80yyJYHmJ2MylyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753787868; c=relaxed/simple;
	bh=w5fSSjhlZE4kaSUhjPO0bjn6UL+qxNFnllPhL6OPLvA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Oxaa5op86JhxQfYOtzKFjDZyf0ZO1IIbJwgF8kHBGali4tuY0RLHJmOrPK1R3gWawJRpXTlIejrFxCwk6eSAoSGAcQATVBQqOqd2vGhxvGWALbVMuazFYhIumoi5RR8QXgXl94BNcDM0uMWrHS7DXrZLizTqDg+HwPEEs3Wix8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JJvb/z67; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56T98XJT023477
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 11:17:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JYLypgdlK6xbRh65r51fMOTrMAj5xEpWl/0YTtrCvkg=; b=JJvb/z67ZXOEaE5K
	/aMBVM25cxtou/PSxH4NgdnI3Qjd7ItDqfqjueg3qY+TeT2CytUhRTi9oFmqAp9F
	hbsHYs0CBWl8TyDuEqXtmmpmiFAw2GWsILSYR6/pB2uSs8CZf4ZkOq5Uo7PKIqjj
	Oi1ly92bAIK2WH0+o6VggFLza+JsAzvnjEdxUK5V9vMJ77EfaMzqIpnomTHsQU1G
	QnLl/W61rlzE6UmWwIqeD3/cAbmB54pwkW018lDuLecB0KwH/VvyHQpEkNpkeOa2
	pNchutBn14Chx763CGg7whjj3KKkLSUFjApxE/438YcuOrr+w576cO7nyGP9wnOa
	lIsqlg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484r6qqtxc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 11:17:46 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f539358795so17268336d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 04:17:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753787865; x=1754392665;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JYLypgdlK6xbRh65r51fMOTrMAj5xEpWl/0YTtrCvkg=;
        b=GmjXOgFvx49WGX6lcA202sQfhmfdaFNXQarrrbLHL+BerggTQ0lIevEhYwSSsa1xKF
         hC30x8sHs5x6ugvlueZKL1OQsFhIGcDcvn3MCoFkEhBtnry1AsP/x+D4nhUkAuFsSYY7
         qTEkZtXa8ROQh5w41e9S5iEIveb090Bys+upbwDcv9EGzxbpehUSKo2vwkzW8b+DTy8w
         eiem2/aLCuVBGaLgYuTox1e1yQbG4tjiUIDF5BsNc8+QQZ2s/+zXKDcvSDJD0LILchGQ
         w5ufzCjDLuE6g7xGb87Hi3D6o2OwpXjV5ZLlVQ0dSsvPvOqY7Rw/xvMAolzGQsBEyQXY
         FObg==
X-Gm-Message-State: AOJu0YyGtkjRc7P+ML9Y1QkzT90RBppWogt5MuIQW+EhmIoNc8mW0wFg
	Kpr7YyD5UculBov4sZ7f+RmE0R2/97+6NIJpWK5Jc0aMUxpAvDKpLqzrUYgHWsGZHYaq8iLLpqj
	jlSoer7U6VENLldQch0afd1bOES3B/0EUVCdFNfa1bunzy0g+HH+eg63Tjj3/VgU9cIkI
X-Gm-Gg: ASbGncuwwvB+bSMX7ee9R8SwTELgXF1n6yV6584dqztcXRUft6SUagq39uL9hj07VqM
	nNUaGDK1Umff1fvkfcWtOr/xIEOJH3ZN+iobv9+1QuZvMMmo/u9hpVtBbQYcBQML80fgK/KdvnM
	jILHidiEEFn3l4Po2+/XHQf3SlWaM3xTpSLdpnrreGI32PkCtmUpLXl4gMqdtiLysYMr7YHnbV9
	Yp+Jb25xoI7X0k5ppXBY6g1zoaZz1Z0+EwvYMK6A2X139Bbk7yX9G69Yd3VELrjsWu708I4VJMt
	U4DYmBdexHJFI+fnKqJxaFYQM6H5X7GJpZSojnzRroAHhhkoHJlaTyQq5S0kp5R2FJH30xumG8i
	UzsnP9BrXt99RwsRKCw==
X-Received: by 2002:ad4:5f4c:0:b0:707:4dcc:4f56 with SMTP id 6a1803df08f44-7074dcc58e3mr33456806d6.8.1753787865051;
        Tue, 29 Jul 2025 04:17:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVL/ipLCTE3KQBvxK0+K5+RyTudhg4FnfX6zILSoy/F5vK3nKlWwkqe0t7Ugz+vuHVlx/Q5A==
X-Received: by 2002:ad4:5f4c:0:b0:707:4dcc:4f56 with SMTP id 6a1803df08f44-7074dcc58e3mr33456586d6.8.1753787864544;
        Tue, 29 Jul 2025 04:17:44 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af635a63116sm577931366b.90.2025.07.29.04.17.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Jul 2025 04:17:42 -0700 (PDT)
Message-ID: <1f6fc7ce-5826-4f59-89d7-ac691a3ae785@oss.qualcomm.com>
Date: Tue, 29 Jul 2025 13:17:39 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] arm64: dts: qcom: Add display support for QCS615
To: Fange Zhang <fange.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
        Li Liu <quic_lliu6@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>
References: <20250718-add-display-support-for-qcs615-platform-v5-0-8579788ea195@oss.qualcomm.com>
 <20250718-add-display-support-for-qcs615-platform-v5-1-8579788ea195@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250718-add-display-support-for-qcs615-platform-v5-1-8579788ea195@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDA4NyBTYWx0ZWRfX083b2BNxojHL
 0GCLSWCrrJW2azael/OfrtgHbeqRPDI4kLVNK5gHQHFNV2guESpA8iMBv0bqpT86csMunY9Iz1Y
 Nuqq3n765iEsuEpEWzJza4RBLUgK5niqRR+qWIJr0oLoNAN/j20Ute1upOR3RRKCFVRQj2MnUvb
 KGMcYxBpy8XcFfY0STRDWRWfUa4+Bo0ETqvyeSL3/hEcVYow6qFK1IeTkBre3F5OttJbM3RAnRJ
 XCNxphkc+kKjKN/xYVL1dokGSHemSgRiEhN10FMHsAu9uemnRcGz1qML/nnO0EbDHLWwlH2fcyq
 mRz2FUF8632TDHQnEzSKKErYCcIW7trGc6OnPHa0ltiLu0aKlDnWupnQMNb76xvNQhh1n8BPZQA
 adFFE4/Ebu4GVNUXmzSSS+WCJilUGxt/UjPYX+CAf6f0gO9SOFFc+z8bQJolP/Od8a5jyA9d
X-Proofpoint-ORIG-GUID: gxmFiMjitkZlgnTLrPLcbhNo6BNB3R11
X-Authority-Analysis: v=2.4 cv=ea89f6EH c=1 sm=1 tr=0 ts=6888adda cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=Frto0rYOkVf98Gw2rTwA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: gxmFiMjitkZlgnTLrPLcbhNo6BNB3R11
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507290087

On 7/18/25 2:56 PM, Fange Zhang wrote:
> From: Li Liu <quic_lliu6@quicinc.com>
> 
> Add display MDSS and DSI configuration for QCS615 platform.
> QCS615 has a DP port, and DP support will be added in a later patch.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
> Signed-off-by: Fange Zhang <fange.zhang@oss.qualcomm.com>
> ---

[...]

> +
> +			mdss_mdp: display-controller@ae01000 {
> +				compatible = "qcom,sm6150-dpu";
> +				reg = <0x0 0x0ae01000 0x0 0x8f000>,
> +				      <0x0 0x0aeb0000 0x0 0x2008>;
> +				reg-names = "mdp", "vbif";
> +
> +				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +					 <&gcc GCC_DISP_HF_AXI_CLK>,
> +					 <&dispcc DISP_CC_MDSS_MDP_CLK>,
> +					 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> +				clock-names = "iface", "bus", "core", "vsync";

1 per line please, everywhere> +
> +				assigned-clocks = <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> +				assigned-clock-rates = <19200000>;

Is this necessary?

> +
> +				operating-points-v2 = <&mdp_opp_table>;
> +				power-domains = <&rpmhpd RPMHPD_CX>;
> +
> +				interrupt-parent = <&mdss>;
> +				interrupts = <0>;

interrupts-extended

> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;

Please keep a \n between properties and subnodes

> +						dpu_intf0_out: endpoint {
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +						dpu_intf1_out: endpoint {
> +							remote-endpoint = <&mdss_dsi0_in>;
> +						};
> +					};
> +				};
> +
> +				mdp_opp_table: opp-table {
> +					compatible = "operating-points-v2";
> +
> +					opp-19200000 {
> +						opp-hz = /bits/ 64 <19200000>;
> +						required-opps = <&rpmhpd_opp_low_svs>;
> +					};
> +
> +					opp-25600000 {
> +						opp-hz = /bits/ 64 <25600000>;
> +						required-opps = <&rpmhpd_opp_svs>;

This and the above frequency are missing one zero (i.e. you
have a 10x underclock)

[...]

> +			mdss_dsi0_phy: phy@ae94400 {
> +				compatible = "qcom,sm6150-dsi-phy-14nm";
> +				reg = <0x0 0x0ae94400 0x0 0x100>,
> +				      <0x0 0x0ae94500 0x0 0x300>,
> +				      <0x0 0x0ae94800 0x0 0x188>;

sz = 0x124

> +				reg-names = "dsi_phy",
> +					    "dsi_phy_lane",
> +					    "dsi_pll";
> +
> +				#clock-cells = <1>;
> +				#phy-cells = <0>;
> +
> +				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +					 <&rpmhcc RPMH_CXO_CLK>;
> +				clock-names = "iface", "ref";
> +
> +				status = "disabled";
> +			};
> +		};
> +
>  		dispcc: clock-controller@af00000 {
>  			compatible = "qcom,qcs615-dispcc";
>  			reg = <0 0x0af00000 0 0x20000>;
>  
>  			clocks = <&rpmhcc RPMH_CXO_CLK>,
> -				 <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>;
> +				 <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>,
> +				 <&mdss_dsi0_phy 0>,
> +				 <&mdss_dsi0_phy 1>,

#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>

Konrad

