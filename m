Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C61968CE22
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Feb 2023 05:26:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229630AbjBGE0e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Feb 2023 23:26:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbjBGE0d (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Feb 2023 23:26:33 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A95A13DF5;
        Mon,  6 Feb 2023 20:26:32 -0800 (PST)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 317435VZ000841;
        Tue, 7 Feb 2023 04:26:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=A/RQJKoOLRjRpF9IsAVK0O9VtCUYqrcMCuYivRiuX/E=;
 b=ILR9RZpVQPSdS4rFmaoxa/Gf+qpEU/Aw+5swV0CbKforR+ZI3LwXF+ECPXaNyaVnTD8D
 Xj/7StAgidH3Jp+HtM99YAr0Mour4QcAWNIN2tAgXUuyqCQ/KsZmboo6Br8jFblIliRG
 BX+3Xk1ve8Wz6nnqJOLCnEhxZENTFOIrfEbeIwCgKokXT5y3FGciNSvZ6lXXRUyRNm5N
 /B2ZwyNqUrOE0PC6uq+hACqheEI0mGu70Vr7xKO0u0A6z4UwcvVvTYob/C42h6Tu5WcE
 JAiVZsDK4lcJ0Dzf5F4Q+LFfeMOjCA8M1VE0jHOXu07XwwztGIrExKhlgvJouf/WQHwU mw== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nhechdj3b-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 07 Feb 2023 04:26:15 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3174QE7L003747
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 7 Feb 2023 04:26:14 GMT
Received: from [10.201.2.96] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 6 Feb 2023
 20:26:06 -0800
Message-ID: <b82c8aaf-b574-45b2-3b44-9edc6f82d619@quicinc.com>
Date:   Tue, 7 Feb 2023 09:56:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH V3 4/9] dt-bindings: clock: Add Qualcomm IPQ5332 GCC
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        <krzysztof.kozlowski@linaro.org>, <agross@kernel.org>,
        <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <linus.walleij@linaro.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>, <shawnguo@kernel.org>, <arnd@arndb.de>,
        <marcel.ziswiler@toradex.com>, <nfraprado@collabora.com>,
        <robimarko@gmail.com>, <quic_gurus@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
CC:     <quic_varada@quicinc.com>, <quic_srichara@quicinc.com>
References: <20230206071217.29313-1-quic_kathirav@quicinc.com>
 <20230206071217.29313-5-quic_kathirav@quicinc.com>
 <03d6c92a-c9f3-915c-218a-14ff5c5250d2@linaro.org>
Content-Language: en-US
From:   Kathiravan T <quic_kathirav@quicinc.com>
In-Reply-To: <03d6c92a-c9f3-915c-218a-14ff5c5250d2@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: HVc6FCGN5ufUZdgWHm-23vUYKBM_mgxq
X-Proofpoint-ORIG-GUID: HVc6FCGN5ufUZdgWHm-23vUYKBM_mgxq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-06_07,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 mlxlogscore=999 priorityscore=1501 mlxscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302070038
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Thanks Dmirty for taking time to review the patch.


On 2/6/2023 3:22 PM, Dmitry Baryshkov wrote:
> On 06/02/2023 09:12, Kathiravan T wrote:
>> Add binding for the Qualcomm IPQ5332 Global Clock Controller.
>>
>> Signed-off-by: Kathiravan T <quic_kathirav@quicinc.com>
>> ---
>> Changes in V3:
>>     - Actually I missed to remove the clocks in V2 which are supposed to
>>       be removed. In V3 I have removed those and they are
>>       GCC_APSS_AHB_CLK, GCC_APSS_AHB_CLK_SRC, GCC_APSS_AXI_CLK
>>     - For the same, didn't add the Reviewed-By tags from Stephen and
>>       Krzysztof
>>
>> Changes in V2:
>>     - property 'clocks' is marked required
>>     - Renamed the include file name to match with compatible
>>
>>   .../bindings/clock/qcom,ipq5332-gcc.yaml      |  61 +++
>>   include/dt-bindings/clock/qcom,ipq5332-gcc.h  | 356 ++++++++++++++++++
>>   2 files changed, 417 insertions(+)
>>   create mode 100644 
>> Documentation/devicetree/bindings/clock/qcom,ipq5332-gcc.yaml
>>   create mode 100644 include/dt-bindings/clock/qcom,ipq5332-gcc.h
>>
>> diff --git 
>> a/Documentation/devicetree/bindings/clock/qcom,ipq5332-gcc.yaml 
>> b/Documentation/devicetree/bindings/clock/qcom,ipq5332-gcc.yaml
>> new file mode 100644
>> index 000000000000..961311af400c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/qcom,ipq5332-gcc.yaml
>> @@ -0,0 +1,61 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/qcom,ipq5332-gcc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Global Clock & Reset Controller on IPQ5332
>> +
>> +maintainers:
>> +  - Stephen Boyd <sboyd@kernel.org>
>> +
>> +description: |
>> +  Qualcomm global clock control module provides the clocks, resets 
>> and power
>> +  domains on IPQ5332.
>> +
>> +  See also:: include/dt-bindings/clock/qcom,gcc-ipq5332.h
>> +
>> +allOf:
>> +  - $ref: qcom,gcc.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,ipq5332-gcc
>> +
>> +  clocks:
>> +    items:
>> +      - description: Board XO clock source
>> +      - description: Sleep clock source
>> +      - description: PCIE 2lane PHY pipe clock source
>> +      - description: PCIE 2lane x1 PHY pipe clock source (For second 
>> lane)
>> +      - description: USB PCIE wrapper pipe clock source
>> +
>> +  clock-names:
>> +    items:
>> +      - const: xo
>> +      - const: sleep_clk
>> +      - const: pcie_2lane_phy_pipe_clk
>> +      - const: pcie_2lane_phy_pipe_clk_x1
>> +      - const: usb_pcie_wrapper_pipe_clk
>
> pcie3x1_0_pipe_clk_src, pcie3x1_1_pipe_clk_src, pcie3x2_pipe_clk_src 
> usb0_pipe_clk_src are missing.


Here is the mapping,

pcie_2lane_phy_pipe_clk  is the source for pcie3x2,

pcie_2lane_phy_pipe_clk_x1 is the source for pcie3x1_1,

usb_pcie_wrapper_pipe_clk is the source for pcie3x1_0_pipe_clk_src and 
usb0_pipe_clk_src.

Is this what you are expecting or am I missing something here?

Thanks,

Kathiravan T.


>
>> +
>> +required:
>> +  - compatible
>> +  - clocks
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    clock-controller@1800000 {
>> +      compatible = "qcom,ipq5332-gcc";
>> +      reg = <0x01800000 0x80000>;
>> +      clocks = <&xo_board>,
>> +               <&sleep_clk>,
>> +               <&pcie_2lane_phy_pipe_clk>,
>> +               <&pcie_2lane_phy_pipe_clk_x1>,
>> +               <&usb_pcie_wrapper_pipe_clk>;
>> +      #clock-cells = <1>;
>> +      #power-domain-cells = <1>;
>> +      #reset-cells = <1>;
>> +    };
>> +...
>
