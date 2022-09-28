Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4F4E5ED46D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Sep 2022 08:00:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232616AbiI1GAw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 02:00:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231278AbiI1GAv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 02:00:51 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88A3010B22A;
        Tue, 27 Sep 2022 23:00:49 -0700 (PDT)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28S5WxcE017949;
        Wed, 28 Sep 2022 06:00:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=wDkYFD21cAegiPDyEU2Zngt/OjDAme3eFDqP3dI6Q/0=;
 b=PIWiPgEbjIJXnEwlIiwwPmU38Vy7O0uyHQL5kTxPdeQld+CKknO5/+z9LnRo3b+SGvlK
 NeFT11cbfMRHIPZBVEAjqmvukAFp96WZ1Grf5tRB132ly2ZZHrdll85AXY77IgF4ufzu
 0ON3hhFKyf1q0c1J99x2Z6hipyB6FCx51LLv7gR82kWsoD4WHZf6es4jSv4U6PXdfXRu
 xcnddm1Q3HxHEO1bM3l4yv574bERt78uTkKMSklc3BSlFbSdUtY1klhrCQt0JvvpcsOX
 iWTGY2apCB7yECHANx8Hjq/BQwY44EZ9U4uQIAa+uP2ydzGjJykn5lwhlTRS4SMYXooW Jw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jva6qs01s-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 28 Sep 2022 06:00:42 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 28S60gvW011634
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 28 Sep 2022 06:00:42 GMT
Received: from [10.216.15.174] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Tue, 27 Sep
 2022 23:00:38 -0700
Message-ID: <a6e94553-c62f-128a-4122-94483b02bee7@quicinc.com>
Date:   Wed, 28 Sep 2022 11:30:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2] arm64: dts: qcom: sc7280: Add nodes to support WoW on
 WCN6750
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@somainline.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>
CC:     <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20220926045735.719-1-quic_mpubbise@quicinc.com>
 <f1057c78-39a2-6b26-f3c9-51cd99450dd2@linaro.org>
From:   Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
In-Reply-To: <f1057c78-39a2-6b26-f3c9-51cd99450dd2@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 1IVxFBWkHhh18n1eTU0V7YNkOsmK5y5b
X-Proofpoint-ORIG-GUID: 1IVxFBWkHhh18n1eTU0V7YNkOsmK5y5b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-28_02,2022-09-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 phishscore=0 mlxlogscore=856 bulkscore=0
 clxscore=1011 impostorscore=0 mlxscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209280035
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 9/26/2022 2:30 PM, Krzysztof Kozlowski wrote:
> On 26/09/2022 06:57, Manikanta Pubbisetty wrote:
>> Add DT nodes to support WoW (Wake on Wireless) feature on WCN6750
>> WiFi hardware on SC7280 SoC.
>>
>> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
> 
> Thank you for your patch. There is something to discuss/improve.
> 
> 
>> ---
>> Changes from V1:
>> - Rebased on ToT
>>
>>   arch/arm64/boot/dts/qcom/sc7280.dtsi | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> index 212580316d3e..3f6a3f575339 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> @@ -752,6 +752,17 @@ wpss_smp2p_in: slave-kernel {
>>   			interrupt-controller;
>>   			#interrupt-cells = <2>;
>>   		};
>> +
>> +		wlan_smp2p_out: wlan-ap-to-wpss {
> 
> Does not look like you tested the DTS against bindings. Please run `make
> dtbs_check` (see Documentation/devicetree/bindings/writing-schema.rst
> for instructions).
> 

I'm sorry I was not aware of checking the DTS against bindings. I'll do 
the due diligence going forward. `make dtbs_check is throwing error of 
"No rule to make target". Not sure if we need pass any options to the 
command. I did try to understand the problem but all went in vain. Pls 
help understand if I'm missing anything.

>> +			qcom,entry-name = "wlan";
>> +			#qcom,smem-state-cells = <1>;
>> +		};
>> +
>> +		wlan_smp2p_in: wlan-wpss-to-ap {
>> +			qcom,entry-name = "wlan";
>> +			interrupt-controller;
>> +			#interrupt-cells = <2>;
>> +		};
>>   	};
>>   
>>   	pmu {
>> @@ -2004,6 +2015,8 @@ wifi: wifi@17a10040 {
>>   			qcom,rproc = <&remoteproc_wpss>;
>>   			memory-region = <&wlan_fw_mem>, <&wlan_ce_mem>;
>>   			status = "disabled";
> 
> status is the last.

Sure.

> 
>> +			qcom,smem-states = <&wlan_smp2p_out 0>;
>> +			qcom,smem-state-names = "wlan-smp2p-out";
> 
> Are these valid properties for this node? Did you check with bindings?
> 

These are valid properties IIUC. Pls help check the binding here 
https://patchwork.kernel.org/project/linux-wireless/patch/20220902112520.24804-2-quic_mpubbise@quicinc.com/ 
.

Thanks,
Manikanta
