Return-Path: <linux-arm-msm+bounces-38638-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABA99D49CA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 10:20:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C6A76B20BD5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 09:20:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95F2314EC55;
	Thu, 21 Nov 2024 09:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MBjiNu0O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97203158D79
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Nov 2024 09:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732180814; cv=none; b=brXeH+6swRt0+nAeiqT7aAqKoNhiTniMLnXB/MNdbXDJnfTPPVo7fxtrOzuvYGMc+zn9nn2QmvtAFTY2Ao13o0GHhHuSxJec4De0X2B8iiekMsAl8B0mA8PaxStqTHwgGM7hIeZs4J4Yp6ItSKIJFvpT8Ul3xkJzKw1758js6Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732180814; c=relaxed/simple;
	bh=0AAHt03P0258dTxymSIScUoSAl/JKrh21pVmK8+l4jg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=J3H98glUTrQO3RGDgE6p93Yu1raOQHuRuu58EnI0DOIBBxYjPsAWI2tmJVxfECms6Om1BxYPbwgqB9Uv1pxiLxYlRI5FTbpKEoTjJrlj/zISj/vBk473U4wUiZSmgiAQPILR0sDtg5K8ka23rrXhzPsEzs5reinuHNDLd6B8mp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MBjiNu0O; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AKLNBvQ003945;
	Thu, 21 Nov 2024 09:20:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sd4PP+tjSjERkPyjZtZYXI9gPaQO7bmRLiN1BOCRUZQ=; b=MBjiNu0OFTTf2ZsK
	FJ6BEvtfWPqKL82re1cfMJugBPW3K/rJJOo3kaviGlVwmPBQd84kXXXOXqp11WGX
	KzNZ6R/+795D3U2Pw4zUN8HNDR8D100eZRRvnNCIz7LE5OWYYr+Z3s9X/VV9gMha
	3ikSgrnCGmJFNhD/4ExfiOY1YC/j4cz/F+WgfRMSdgt9QdyOWmb5SSgWUyIcXXt0
	7v3CITMtrR2WWFBv9mPXK8YGr/3QPmtrUXv8QyRU0v1GApMaWrCn+NgDgfDtw/M2
	NXLOdGTH8mUEUzMqjxJcY6jSvSTEjmbt5GCQS+SR+taxxcLCx2kCkIOjVhm0+9qi
	cleQ1g==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 431ce3bh14-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 09:20:10 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AL9KAsP004642
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 09:20:10 GMT
Received: from [10.64.16.151] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 21 Nov
 2024 01:20:05 -0800
Message-ID: <3e4e3640-8afe-4e73-90f3-8bd53850197c@quicinc.com>
Date: Thu, 21 Nov 2024 17:20:02 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] dt-bindings: display/msm: Add QCS615 MDSS & DPU
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <kernel@quicinc.com>, <quic_lliu6@quicinc.com>,
        <quic_xiangxuy@quicinc.com>, <linux-arm-msm@vger.kernel.org>
References: <20241014-add_display_support_for_qcs615-v1-0-4efa191dbdd4@quicinc.com>
 <20241014-add_display_support_for_qcs615-v1-5-4efa191dbdd4@quicinc.com>
 <cq2qg5womfgrp422s3epsobad7lzhvawjnepmj6wsw2rzemarc@75jq4exnyqhn>
Content-Language: en-US
From: fange zhang <quic_fangez@quicinc.com>
In-Reply-To: <cq2qg5womfgrp422s3epsobad7lzhvawjnepmj6wsw2rzemarc@75jq4exnyqhn>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: POA9LSUxSDPXXotJsoU2FLXIRLjFfIfU
X-Proofpoint-ORIG-GUID: POA9LSUxSDPXXotJsoU2FLXIRLjFfIfU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 bulkscore=0 mlxscore=0 adultscore=0 spamscore=0 mlxlogscore=999
 suspectscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411210072



On 2024/10/14 18:35, Dmitry Baryshkov wrote:
> On Mon, Oct 14, 2024 at 05:47:31PM +0800, fangez via B4 Relay wrote:
>> From: lliu6 <quic_lliu6@quicinc.com>
>>
>> Add bindings for the display hardware on QCS615.
>>
>> Signed-off-by: lliu6 <quic_lliu6@quicinc.com>
>> ---
>>   .../bindings/display/msm/qcom,qcs615-dpu.yaml      | 117 +++++++++
>>   .../bindings/display/msm/qcom,qcs615-mdss.yaml     | 278 +++++++++++++++++++++
>>   2 files changed, 395 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcs615-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcs615-dpu.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..35339092cb4f905541a7f70f42166bd0b0b7dee7
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,qcs615-dpu.yaml
>> @@ -0,0 +1,117 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/msm/qcom,qcs615-dpu.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm QCS615 Display DPU
>> +
>> +maintainers:
>> +  - lliu6 <quic_lliu6@quicinc.com>
> 
> No, you are not. Please at least list Abhinav and me.
fixed in v2, change to
   - Abhinav Kumar <quic_abhinavk@quicinc.com>
   - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

will replace qcs615 to sm6150 for whole patch
> 
>> +
>> +$ref: /schemas/display/msm/dpu-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,qcs615-dpu
>> +
>> +  reg:
>> +    items:
>> +      - description: Address offset and size for mdp register set
>> +      - description: Address offset and size for vbif register set
>> +
>> +  reg-names:
>> +    items:
>> +      - const: mdp
>> +      - const: vbif
>> +
>> +  clocks:
>> +    items:
>> +      - description: Display ahb clock
>> +      - description: Display hf axi clock
>> +      - description: Display core clock
>> +      - description: Display vsync clock
>> +
>> +  clock-names:
>> +    items:
>> +      - const: iface
>> +      - const: bus
>> +      - const: core
>> +      - const: vsync
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/qcom,qcs615-dispcc.h>
> 
> I can not pick this up, these headers are not present in the msm-next
> tree. Please use ephemeral nodes instead.
will remove
#include <dt-bindings/clock/qcom,qcs615-gcc.h>
and use ephemeral nodes instead
> 
>> +    #include <dt-bindings/clock/qcom,qcs615-gcc.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/interconnect/qcom,qcs615-rpmh.h>
>> +    #include <dt-bindings/interconnect/qcom,icc.h>
>> +    #include <dt-bindings/power/qcom-rpmpd.h>
>> +
>> +    display-controller@ae01000 {
>> +        compatible = "qcom,qcs615-dpu";
>> +        reg = <0x0ae01000 0x8f000>,
>> +              <0x0aeb0000 0x2008>;
>> +        reg-names = "mdp", "vbif";
>> +
>> +        clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
>> +                 <&gcc GCC_DISP_HF_AXI_CLK>,
>> +                 <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
>> +                 <&dispcc DISP_CC_MDSS_MDP_CLK>,
>> +                 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
>> +        clock-names = "iface", "bus", "lut" "core", "vsync";
>> +
>> +        assigned-clocks = <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
>> +        assigned-clock-rates = <19200000>;
>> +
>> +        operating-points-v2 = <&mdp_opp_table>;
>> +
>> +        interrupt-parent = <&mdss>;
>> +        interrupts = <0>;
>> +
>> +        ports {
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +
>> +            port@0 {
>> +                reg = <0>;
>> +	        dpu_intf0_out: endpoint {
>> +		};
>> +	    };
> 
> Indentation is definitely wrong.
fixed in v2
> 
>> +
>> +            port@1 {
>> +		reg = <1>;
>> +		dpu_intf1_out: endpoint {
>> +		    remote-endpoint = <&mdss_dsi0_in>;
>> +		};
>> +	    };
>> +
>> +        };
>> +
>> +        mdp_opp_table: opp-table {
>> +            compatible = "operating-points-v2";
>> +
>> +            opp-375000000 {
>> +                opp-hz = /bits/ 64 <375000000>;
>> +                required-opps = <&rpmhpd_opp_svs_l1>;
>> +            };
>> +
>> +            opp-500000000 {
>> +                opp-hz = /bits/ 64 <500000000>;
>> +                required-opps = <&rpmhpd_opp_nom>;
>> +            };
>> +
>> +            opp-575000000 {
>> +                opp-hz = /bits/ 64 <575000000>;
>> +                required-opps = <&rpmhpd_opp_turbo>;
>> +            };
>> +
>> +            opp-650000000 {
>> +                opp-hz = /bits/ 64 <650000000>;
>> +                required-opps = <&rpmhpd_opp_turbo_l1>;
>> +            };
>> +        };
>> +    };
>> +...
>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcs615-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcs615-mdss.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..fdad15c358892306dcb2c1b78319934c504cfc2b
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,qcs615-mdss.yaml
>> @@ -0,0 +1,278 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/msm/qcom,qcs615-mdss.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm QCS615 Display MDSS
>> +
>> +maintainers:
>> +  - lliu6 <quic_lliu6@quicinc.com>
>> +
>> +description:
>> +  Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
>> +  sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
>> +  bindings of MDSS are mentioned for QCS615 target.
>> +
>> +$ref: /schemas/display/msm/mdss-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - const: qcom,qcs615-mdss
>> +
>> +  clocks:
>> +    items:
>> +      - description: Display AHB clock from gcc
>> +      - description: Display hf axi clock
>> +      - description: Display sf axi clock
>> +      - description: Display core clock
>> +
>> +  clock-names:
>> +    items:
>> +      - const: iface
>> +      - const: bus
>> +      - const: nrt_bus
>> +      - const: core
>> +
>> +  iommus:
>> +    maxItems: 1
>> +
>> +  interconnects:
>> +    maxItems: 2
>> +
>> +  interconnect-names:
>> +    maxItems: 2
>> +
>> +patternProperties:
>> +  "^display-controller@[0-9a-f]+$":
>> +    type: object
>> +    additionalProperties: true
>> +
>> +    properties:
>> +      compatible:
>> +        const: qcom,qcs615-dpu
>> +
>> +  "^displayport-controller@[0-9a-f]+$":
>> +    type: object
>> +    additionalProperties: true
>> +
>> +    properties:
>> +      compatible:
>> +        contains:
>> +          const: qcom,qcs615-dp
> 
> It is not described anywhere, isn't it?
will remove this prop

> 
>> +
>> +  "^dsi@[0-9a-f]+$":
>> +    type: object
>> +    additionalProperties: true
>> +
> 
> No empty line
fixed in v2
> 
>> +    properties:
>> +      compatible:
>> +        items:
>> +          - const: qcom,qcs615-dsi-ctrl
>> +          - const: qcom,mdss-dsi-ctrl
>> +
>> +  "^phy@[0-9a-f]+$":
>> +    type: object
>> +    additionalProperties: true
>> +
> 
> No empty line
fixed in v2
> 
>> +    properties:
>> +      compatible:
>> +        const: qcom,qcs615-dsi-phy-14nm
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/qcom,qcs615-dispcc.h>
>> +    #include <dt-bindings/clock/qcom,qcs615-gcc.h>
> 
> Same comment, use ephemeral nodes instead of listing the clocks exactly.
will remove
#include <dt-bindings/clock/qcom,qcs615-dispcc.h>
#include <dt-bindings/clock/qcom,qcs615-gcc.h>
and use ephemeral nodes instead
> 
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/interconnect/qcom,qcs615-rpmh.h>
>> +    #include <dt-bindings/interconnect/qcom,icc.h>
>> +    #include <dt-bindings/power/qcom-rpmpd.h>
>> +
>> +    display-subsystem@ae00000 {
>> +        compatible = "qcom,qcs615-mdss";
>> +        reg = <0x0ae00000 0x1000>;
>> +        reg-names = "mdss";
>> +
>> +	interconnects = <&mmss_noc MASTER_MDP0 0 &mc_virt SLAVE_EBI1 0>,
>> +			<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
>> +			&config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
>> +	interconnect-names = "mdp0-mem", "cpu-cfg";
> 
> Wrong indentation. No tabs in yaml files. Did it even compile?
will fix them in next version
> 
>> +
>> +        power-domains = <&dispcc MDSS_CORE_GDSC>;
>> +
>> +        clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
>> +                 <&gcc GCC_DISP_HF_AXI_CLK>,
>> +                 <&dispcc DISP_CC_MDSS_MDP_CLK>;
>> +
>> +        interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
>> +        interrupt-controller;
>> +        #interrupt-cells = <1>;
>> +
>> +        iommus = <&apps_smmu 0x800 0x0>;
>> +
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +        ranges;
>> +
>> +        display-controller@ae01000 {
>> +            compatible = "qcom,qcs615-dpu";
>> +            reg = <0x0ae01000 0x8f000>,
>> +                  <0x0aeb0000 0x2008>;
>> +            reg-names = "mdp", "vbif";
>> +
>> +            clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
>> +                     <&gcc GCC_DISP_HF_AXI_CLK>,
>> +		     <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
>> +                     <&dispcc DISP_CC_MDSS_MDP_CLK>,
>> +                     <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
>> +            clock-names = "iface", "bus", "lut", "core", "vsync";
>> +
>> +            assigned-clocks = <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
>> +            assigned-clock-rates = <19200000>;
>> +
>> +            operating-points-v2 = <&mdp_opp_table>;
>> +
>> +            interrupt-parent = <&mdss>;
>> +            interrupts = <0>;
>> +
>> +            ports {
>> +                #address-cells = <1>;
>> +                #size-cells = <0>;
>> +
>> +                port@0 {
>> +                    reg = <0>;
>> +	            dpu_intf0_out: endpoint {
>> +		    };
>> +	        };
>> +
>> +                port@1 {
>> +		    reg = <1>;
>> +		    dpu_intf1_out: endpoint {
>> +		        remote-endpoint = <&mdss_dsi0_in>;
>> +		    };
>> +	        };
>> +
>> +            };
>> +
>> +            mdp_opp_table: opp-table {
>> +                compatible = "operating-points-v2";
>> +
>> +                opp-375000000 {
>> +                    opp-hz = /bits/ 64 <375000000>;
>> +                    required-opps = <&rpmhpd_opp_svs_l1>;
>> +                };
>> +
>> +                opp-500000000 {
>> +                    opp-hz = /bits/ 64 <500000000>;
>> +                    required-opps = <&rpmhpd_opp_nom>;
>> +                };
>> +
>> +                opp-575000000 {
>> +                    opp-hz = /bits/ 64 <575000000>;
>> +                    required-opps = <&rpmhpd_opp_turbo>;
>> +                };
>> +
>> +                opp-650000000 {
>> +                    opp-hz = /bits/ 64 <650000000>;
>> +                    required-opps = <&rpmhpd_opp_turbo_l1>;
>> +                };
>> +            };
>> +        };
>> +
>> +        dsi@ae94000 {
>> +            compatible = "qcom,qcs615-dsi-ctrl", "qcom,mdss-dsi-ctrl";
>> +            reg = <0x0ae94000 0x400>;
>> +            reg-names = "dsi_ctrl";
>> +
>> +            interrupt-parent = <&mdss>;
>> +            interrupts = <4>;
>> +
>> +            clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
>> +                     <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
>> +                     <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
>> +                     <&dispcc DISP_CC_MDSS_ESC0_CLK>,
>> +                     <&dispcc DISP_CC_MDSS_AHB_CLK>,
>> +                     <&gcc GCC_DISP_HF_AXI_CLK>;
>> +            clock-names = "byte",
>> +                          "byte_intf",
>> +                          "pixel",
>> +                          "core",
>> +                          "iface",
>> +                          "bus";
>> +
>> +            assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
>> +                              <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
>> +            assigned-clock-parents = <&mdss_dsi0_phy 0>, <&mdss_dsi0_phy 1>;
>> +
>> +            operating-points-v2 = <&dsi0_opp_table>;
>> +
>> +            phys = <&mdss_dsi0_phy>;
>> +
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +
>> +            ports {
>> +                #address-cells = <1>;
>> +                #size-cells = <0>;
>> +
>> +                port@0 {
>> +                    reg = <0>;
>> +                    mdss_dsi0_in: endpoint {
>> +                        remote-endpoint = <&dpu_intf1_out>;
>> +                    };
>> +                };
>> +
>> +                port@1 {
>> +                    reg = <1>;
>> +                    mdss_dsi0_out: endpoint {
>> +                    };
>> +                };
>> +            };
>> +
>> +            dsi0_opp_table: opp-table {
>> +                compatible = "operating-points-v2";
>> +
>> +                opp-164000000 {
>> +                    opp-hz = /bits/ 64 <164000000>;
>> +                    required-opps = <&rpmhpd_opp_low_svs>;
>> +                };
>> +
>> +                opp-187500000 {
>> +                    opp-hz = /bits/ 64 <187500000>;
>> +                    required-opps = <&rpmhpd_opp_svs>;
>> +                };
>> +
>> +                opp-225000000 {
>> +                    opp-hz = /bits/ 64 <225000000>;
>> +                    required-opps = <&rpmhpd_opp_svs_l1>;
>> +                };
>> +
>> +                opp-262500000 {
>> +                    opp-hz = /bits/ 64 <262500000>;
>> +                    required-opps = <&rpmhpd_opp_nom>;
>> +                };
>> +            };
>> +        };
>> +
>> +        mdss_dsi0_phy: phy@ae94400 {
>> +            compatible = "qcom,qcs615-dsi-phy-14nm";
>> +            reg = <0x0ae94400 0x100>,
>> +                  <0x0ae94500 0x300>,
>> +                  <0x0ae94800 0x188>;
>> +            reg-names = "dsi_phy",
>> +                        "dsi_phy_lane",
>> +                        "dsi_pll";
>> +
>> +            #clock-cells = <1>;
>> +            #phy-cells = <0>;
>> +
>> +            clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
>> +                     <&rpmhcc RPMH_CXO_CLK>;
>> +            clock-names = "iface", "ref";
>> +            vdds-supply = <&vreg_dsi_phy>;
>> +        };
>> +    };
>> +...
>>
>> -- 
>> 2.25.1
>>
>>
> 


