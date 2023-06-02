Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E133171F918
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jun 2023 06:05:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231407AbjFBEF1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Jun 2023 00:05:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231259AbjFBEFZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Jun 2023 00:05:25 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9923F132;
        Thu,  1 Jun 2023 21:05:23 -0700 (PDT)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3523X2Bn032395;
        Fri, 2 Jun 2023 04:05:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=g2YsiNDXH7x12Xq/HmkFBsnoCy87pQRc7ageQK0z4nQ=;
 b=Qc02lk/NvNiQBxPeMC3SnIDEoHX+lJdEyFKR2DMLSLwpBpfyVO1qrz37C3EM5mC+oAoL
 GIQ2LYbXwKZpbV+Dvt9SVhE0iVYTyoDHTQvyROO4iqYQsnHnH33nd8m/hhUPwHpWDHFv
 gEry2rMPqDHKVJPjfcdyT6YvbP5ovXV3RVHg4oRo7Bf8KhIKxXjhCV9jG8uRFrHE258O
 +kFjkMeO7VyD8m5XpDTsMsvt3FhA405DTl41lDNao+47eUbZOHsNdrAYkFNYO5h1iqez
 2FTx753zNMi/4RqU8f4xUlN2Zj5HASgjHgo/fpomzEHUotV4594MHhwyDooInRPBYMmI dw== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qxs9gt4fx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 02 Jun 2023 04:05:18 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35245HtZ013574
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 2 Jun 2023 04:05:17 GMT
Received: from [10.201.2.96] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Thu, 1 Jun 2023
 21:05:13 -0700
Message-ID: <2dd8e5be-c5b5-02e7-32d0-587a40cb70cc@quicinc.com>
Date:   Fri, 2 Jun 2023 09:35:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH RESEND 4/4] arm64: dts: qcom: ipq5332: add support for the
 RDP474 variant
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20230601042054.29075-1-quic_kathirav@quicinc.com>
 <20230601042054.29075-5-quic_kathirav@quicinc.com>
 <91c63634-eb39-fdca-2c76-6f8182c2d47c@linaro.org>
Content-Language: en-US
From:   Kathiravan T <quic_kathirav@quicinc.com>
In-Reply-To: <91c63634-eb39-fdca-2c76-6f8182c2d47c@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: g4DpGIfWTwAKhhT0ZB13JAvySdUUa8i1
X-Proofpoint-GUID: g4DpGIfWTwAKhhT0ZB13JAvySdUUa8i1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-02_01,2023-05-31_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=999 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2306020027
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 6/1/2023 10:59 PM, Krzysztof Kozlowski wrote:
> On 01/06/2023 06:20, Kathiravan T wrote:
>> Add the initial device tree support for the Reference Design
>> Platform(RDP) 474 based on IPQ5332 family of SoC. This patch carries
>> the support for Console UART, eMMC, I2C and GPIO based buttons.
>>
>> Signed-off-by: Kathiravan T <quic_kathirav@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/Makefile           |   1 +
>>   arch/arm64/boot/dts/qcom/ipq5332-rdp474.dts | 112 ++++++++++++++++++++
>>   2 files changed, 113 insertions(+)
>>   create mode 100644 arch/arm64/boot/dts/qcom/ipq5332-rdp474.dts
>>
>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>> index 4f9e81253e18..0f8c763a9bd9 100644
>> --- a/arch/arm64/boot/dts/qcom/Makefile
>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>> @@ -7,6 +7,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-mi01.2.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp442.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp468.dtb
>> +dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp474.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= ipq6018-cp01-c1.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= ipq8074-hk01.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= ipq8074-hk10-c1.dtb
>> diff --git a/arch/arm64/boot/dts/qcom/ipq5332-rdp474.dts b/arch/arm64/boot/dts/qcom/ipq5332-rdp474.dts
>> new file mode 100644
>> index 000000000000..085729a0fdf1
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/ipq5332-rdp474.dts
>> @@ -0,0 +1,112 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * IPQ5332 RDP474 board device tree source
>> + *
>> + * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +/dts-v1/;
>> +
>> +#include <dt-bindings/gpio/gpio.h>
>> +#include <dt-bindings/input/input.h>
>> +#include "ipq5332.dtsi"
>> +
>> +/ {
>> +	model = "Qualcomm Technologies, Inc. IPQ5332 MI01.9";
>> +	compatible = "qcom,ipq5332-ap-mi01.9", "qcom,ipq5332";
>> +
>> +	aliases {
>> +		serial0 = &blsp1_uart0;
>> +	};
>> +
>> +	chosen {
>> +		stdout-path = "serial0";
>> +	};
>> +
>> +	gpio_keys {
> No, srsly, so not only ignored the tags but also feedback?


Please correct me if I am wrong here..

This is RESEND of V1 patches (only minor correction in the subject line 
in cover letter). Also I don't see review comments as such in original 
V1 as well 
https://lore.kernel.org/linux-arm-msm/20230531135048.19164-1-quic_kathirav@quicinc.com/

Can you help to point out your review comments, I couldn't able to find out.

Thanks,


>
> Best regards,
> Krzysztof
>
