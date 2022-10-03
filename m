Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E76EC5F2BBE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Oct 2022 10:27:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231222AbiJCI1r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Oct 2022 04:27:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230516AbiJCI10 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Oct 2022 04:27:26 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BE2A7CB53;
        Mon,  3 Oct 2022 01:00:48 -0700 (PDT)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2937xd8X002538;
        Mon, 3 Oct 2022 07:59:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=FHkHtElEjwSrrAnxENDtqKoHDTodbgB6Mb+YPoh5Xgo=;
 b=Q0nqfz90djTjgwu9IsJeR55btuK1exdrvNj7fPI9VfJlZjUyz6ZkEv0ouf5jL/NmOMvr
 kuOs8fzkYSBz8otRmsJXNct1h+y7nyX62c3SytEncjB0S4bBd1zItGiJ8/s9OEafLV1S
 0OM6gjR/hvZZH3JHnQstbqCeHWoVJEtBJMgsVY6a/IVtPlex5hVo4/92UjJmE/vzlqgx
 cNmSwPO9ZR3LfCfb8IfAYwp+yW0d3wT9hXU/uXGzfgDjVKTWcPsqdicuikqIOpTuA7Vi
 8IrR6kL+dP8Z0fR8/N//u2lBPzsw5uJisaj4GehjVCQLKE2COM+l/URPOi0oW20d5wJk LA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jxdxfu3g1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 03 Oct 2022 07:59:47 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2937xkjI018644
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 3 Oct 2022 07:59:46 GMT
Received: from [10.216.49.209] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Mon, 3 Oct 2022
 00:59:42 -0700
Message-ID: <fc390436-92a3-2b2a-0078-cf50a9073b8c@quicinc.com>
Date:   Mon, 3 Oct 2022 13:29:37 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2] arm64: dts: qcom: sc7280: Add nodes to support WoW on
 WCN6750
Content-Language: en-US
From:   Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@somainline.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>
CC:     <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20220926045735.719-1-quic_mpubbise@quicinc.com>
 <f1057c78-39a2-6b26-f3c9-51cd99450dd2@linaro.org>
 <a6e94553-c62f-128a-4122-94483b02bee7@quicinc.com>
 <f7ea53ce-421f-f608-ba50-f107a7f5cb87@linaro.org>
 <d215c841-987a-bf53-0c62-d8688cbd4e6b@quicinc.com>
In-Reply-To: <d215c841-987a-bf53-0c62-d8688cbd4e6b@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: JbU9hGt7RAXa1fnis6b8mkec2REc-jKY
X-Proofpoint-ORIG-GUID: JbU9hGt7RAXa1fnis6b8mkec2REc-jKY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-03_02,2022-09-29_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 spamscore=0 malwarescore=0 mlxlogscore=718 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210030047
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/3/2022 10:25 AM, Manikanta Pubbisetty wrote:
> On 9/28/2022 12:17 PM, Krzysztof Kozlowski wrote:
>> On 28/09/2022 08:00, Manikanta Pubbisetty wrote:
>>> On 9/26/2022 2:30 PM, Krzysztof Kozlowski wrote:
>>>> On 26/09/2022 06:57, Manikanta Pubbisetty wrote:
>>>>> Add DT nodes to support WoW (Wake on Wireless) feature on WCN6750
>>>>> WiFi hardware on SC7280 SoC.
>>>>>
>>>>> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
>>>>
>>>> Thank you for your patch. There is something to discuss/improve.
>>>>
>>>>
>>>>> ---
>>>>> Changes from V1:
>>>>> - Rebased on ToT
>>>>>
>>>>>    arch/arm64/boot/dts/qcom/sc7280.dtsi | 13 +++++++++++++
>>>>>    1 file changed, 13 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi 
>>>>> b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>>>>> index 212580316d3e..3f6a3f575339 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>>>>> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>>>>> @@ -752,6 +752,17 @@ wpss_smp2p_in: slave-kernel {
>>>>>                interrupt-controller;
>>>>>                #interrupt-cells = <2>;
>>>>>            };
>>>>> +
>>>>> +        wlan_smp2p_out: wlan-ap-to-wpss {
>>>>
>>>> Does not look like you tested the DTS against bindings. Please run 
>>>> `make
>>>> dtbs_check` (see Documentation/devicetree/bindings/writing-schema.rst
>>>> for instructions).
>>>>
>>>
>>> I'm sorry I was not aware of checking the DTS against bindings. I'll do
>>> the due diligence going forward. `make dtbs_check is throwing error of
>>> "No rule to make target". Not sure if we need pass any options to the
>>> command. I did try to understand the problem but all went in vain. Pls
>>> help understand if I'm missing anything.
>>
>> There is doc explaining possible usage, but in general works perfect
>> without argument. If you do not have such target, means you run it on
>> some ancient kernel, so anyway patch cannot be accepted and has to be
>> rebased. Please always develop on newest kernel - newest mainline rc,
>> maintainer's for-next branch or linux-next.
>>
> 
> I'm working on the latest kernel (ath.git which is maintained by Kalle 
> Valo for Atheros drivers). I'll give a try on the linux-next branch once.
> 
> Thanks for the suggestions.
> 

Hi Krzysztof,

I have tested the DTS against the bindings. Have used this command `make 
CROSS_COMPILE=aarch64-linux-gnu- ARCH=arm64 dtbs_check -m 
DT_SCHEMA_FILES=Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml`.

`make dtbs_check` did not report any error.

Thanks,
Manikanta
