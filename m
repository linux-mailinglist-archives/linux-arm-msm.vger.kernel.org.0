Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35C105ED46F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Sep 2022 08:01:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232069AbiI1GBV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 02:01:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232201AbiI1GBT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 02:01:19 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04B1A115F70;
        Tue, 27 Sep 2022 23:01:17 -0700 (PDT)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28S5vPqe031680;
        Wed, 28 Sep 2022 06:01:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=LdAjZt19MQNoCbmkPUETxV5QHUxWqUO1Lrwgb0M8N/E=;
 b=nBrBuCAV9ZjpdSzSSIcA2QErngzWrrQt+lDMd3w8ilbOfonEWEq1D9e10GOLk4SWlqJ9
 eRWLiy8E/Gb9VekKBhwQAWX12jo7dxzcYx7uJUpNSqkjMaadxFgWiArcCI55F9Sd74PZ
 dcb9Yrawcmawx9MENmycNqk9CCVL3A+Fj6iXrOkyS1B9qapegqxdf1qewWQpD2RgOcVR
 6qAFtmbQR32wMvI7gxNI2tMwF7qWrCwH3lPue36WS15YXvDMCMMRX7KhWD1+cIcnrNvJ
 pKxSmr2NlVhcD1cyAJJR7CW8pCAuDCWqx9rQtj0psyP0DfmlhYnM0EURukJK7WqvEIMA pQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3juvejawdn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 28 Sep 2022 06:01:10 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 28S619rC031054
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 28 Sep 2022 06:01:09 GMT
Received: from [10.216.15.174] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Tue, 27 Sep
 2022 23:01:05 -0700
Message-ID: <3b6a7af1-7396-6df5-0b47-0834c2deacac@quicinc.com>
Date:   Wed, 28 Sep 2022 11:31:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2] arm64: dts: qcom: sc7280: Add nodes to support WoW on
 WCN6750
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@somainline.org>, <agross@kernel.org>,
        <andersson@kernel.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>
CC:     <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20220926045735.719-1-quic_mpubbise@quicinc.com>
 <f0bf8546-3def-a6a7-1d66-7367a9955289@somainline.org>
From:   Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
In-Reply-To: <f0bf8546-3def-a6a7-1d66-7367a9955289@somainline.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ZMnXZHxt291hPkhl5g3CtGOc_9brj6kj
X-Proofpoint-ORIG-GUID: ZMnXZHxt291hPkhl5g3CtGOc_9brj6kj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-28_02,2022-09-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0 mlxlogscore=801
 priorityscore=1501 impostorscore=0 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209280035
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 9/27/2022 6:38 PM, Konrad Dybcio wrote:
> 
> 
> On 26.09.2022 06:57, Manikanta Pubbisetty wrote:
>> Add DT nodes to support WoW (Wake on Wireless) feature on WCN6750
>> WiFi hardware on SC7280 SoC.
>>
>> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
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
>> +			qcom,smem-states = <&wlan_smp2p_out 0>;
>> +			qcom,smem-state-names = "wlan-smp2p-out";
> Keep status last, please.
> 

Sure.

> Other than that:
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> 

Thanks for the review.

Manikanta
