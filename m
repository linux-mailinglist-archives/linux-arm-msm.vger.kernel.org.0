Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04EA4764EFE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jul 2023 11:13:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232770AbjG0JNu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Jul 2023 05:13:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234586AbjG0JNT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Jul 2023 05:13:19 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83FEE3594;
        Thu, 27 Jul 2023 02:02:51 -0700 (PDT)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36R80pa7016828;
        Thu, 27 Jul 2023 09:02:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=pzwGFj1DoyxQIuBQv1J+4RIab4lfvzFS295ihCETh+Y=;
 b=e+c5HFLyJhQ9Rxk0x6P931rC1oYzVqsgZagwmHnxmI0XxEZDToNqGITSV344YPXcgc5l
 BPkLV3yN4k/Y6JmnPnCDxf+iAVlp87vs+wD6enzhYn/aWI8yPUzzET8Vmp2eyxWv8TsH
 IxTzDvIwxBREytyIyG+ITWYUSa+Ema1aD9I128tLE5HCLql3i0KrcMpc23UPz9M50ICy
 SoAaHgdxGcb1ioz7TUqyRtj0/BBvZqHhczgyHdpHvGJLdVsoUANQswjGEVZ6Q/BMwv9O
 z7+Etj2pwePqJfHp2aryOhKti9ZhWQhGMmQdg8p1X4TvM/kdUGCbsDixsiIRz0XU67dD VA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s3mpt06b6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 27 Jul 2023 09:02:47 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36R92iw2019173
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 27 Jul 2023 09:02:46 GMT
Received: from [10.239.132.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Thu, 27 Jul
 2023 02:02:16 -0700
Message-ID: <f0f94ea9-94b1-ccd1-0a43-3cb119fc5d94@quicinc.com>
Date:   Thu, 27 Jul 2023 17:02:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] arm64: dts: qcom: Add base SM4450 QRD DTS
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>
CC:     <quic_tsoni@quicinc.com>, <quic_shashim@quicinc.com>,
        <quic_kaushalk@quicinc.com>, <quic_tdas@quicinc.com>,
        <quic_tingweiz@quicinc.com>, <quic_aiquny@quicinc.com>,
        <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20230727023508.18002-1-quic_tengfan@quicinc.com>
 <20230727023508.18002-5-quic_tengfan@quicinc.com>
 <f974f48a-05b0-530d-25a0-7ccf1b1ad113@linaro.org>
 <dba27a60-8681-e2e7-b89f-608bfbc05e93@quicinc.com>
 <e20781ea-09ba-2190-7318-dc62e713302d@linaro.org>
From:   Tengfei Fan <quic_tengfan@quicinc.com>
In-Reply-To: <e20781ea-09ba-2190-7318-dc62e713302d@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Pehz4Zp3NqpLt4gTAgGGvTyqJktE1_LP
X-Proofpoint-GUID: Pehz4Zp3NqpLt4gTAgGGvTyqJktE1_LP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-26_08,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 spamscore=0 mlxscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 mlxlogscore=896
 malwarescore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2306200000 definitions=main-2307270079
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



在 7/27/2023 4:50 PM, Krzysztof Kozlowski 写道:
> On 27/07/2023 10:27, Tengfei Fan wrote:
>>
>>
>> 在 7/27/2023 2:56 PM, Krzysztof Kozlowski 写道:
>>> On 27/07/2023 04:35, Tengfei Fan wrote:
>>>> Add DTS for Qualcomm QRD platform which uses SM4450 SoC.
>>>>
>>>> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
>>>> ---
>>>>    arch/arm64/boot/dts/qcom/Makefile       |  1 +
>>>>    arch/arm64/boot/dts/qcom/sm4450-qrd.dts | 18 ++++++++++++++++++
>>>>    2 files changed, 19 insertions(+)
>>>>    create mode 100644 arch/arm64/boot/dts/qcom/sm4450-qrd.dts
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>>>> index 337abc4ceb17..db805d0929c8 100644
>>>> --- a/arch/arm64/boot/dts/qcom/Makefile
>>>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>>>> @@ -186,6 +186,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-lenovo-yoga-c630.dtb
>>>>    dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-samsung-w737.dtb
>>>>    dtb-$(CONFIG_ARCH_QCOM)	+= sdx75-idp.dtb
>>>>    dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
>>>> +dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
>>>>    dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-fxtec-pro1x.dtb
>>>>    dtb-$(CONFIG_ARCH_QCOM)	+= sm6115p-lenovo-j606f.dtb
>>>>    dtb-$(CONFIG_ARCH_QCOM)	+= sm6125-sony-xperia-seine-pdx201.dtb
>>>> diff --git a/arch/arm64/boot/dts/qcom/sm4450-qrd.dts b/arch/arm64/boot/dts/qcom/sm4450-qrd.dts
>>>> new file mode 100644
>>>> index 000000000000..04ad1dd4285a
>>>> --- /dev/null
>>>> +++ b/arch/arm64/boot/dts/qcom/sm4450-qrd.dts
>>>> @@ -0,0 +1,18 @@
>>>> +// SPDX-License-Identifier: BSD-3-Clause
>>>> +/*
>>>> + * Copyright (c) 2023, Qualcomm Innovation Center, Inc. All rights reserved.
>>>> + */
>>>> +
>>>> +/dts-v1/;
>>>> +
>>>> +#include "sm4450.dtsi"
>>>> +/ {
>>>> +	model = "Qualcomm Technologies, Inc. SM4450 QRD";
>>>> +	compatible = "qcom,sm4450-qrd", "qcom,sm4450";
>>>> +
>>>> +	aliases { };
>>>> +
>>>> +	chosen {
>>>> +		bootargs = "console=hvc0 earlycon=hvc0 hvc_dcc.enable=1 cpuidle.off=1";
>>>
>>> No earlycon, no hvc.enable (there is no such parameter), no cpuidle.off
>>> (again don't add fake stuff). So the only suitable argument is console,
>>> but this should be actually used via stdout path, although it seems
>>> there is no device node for such usage?
>> Hi Krzysztof,
>> Checked upstream linux kernel code, there is not "hvc_dcc.enable", but
>> have other parameters, like earlycon, cpuidle.off.
>> Do you mean we should not set "earlycon=hvc0 cpuidle.off=1" parameters,
> 
> Of course not. Why production code would have earlycon? This is debug
> argument, not suitable for each user of this DTS.
> 
> cpuidle.off is neither explained nor needed. Otherwise please add a
> comment why this is part of hardware description.
> 
>> right? only need: bootargs = "console=hvc0" ?
> 
> You should use stdout-path if possible. If not, then only console.
> 
> Best regards,
> Krzysztof
> 
Sure, will update this patch for have right boorargs parameter.

-- 
Thx and BRs,
Tengfei Fan
