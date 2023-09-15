Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 050667A21EE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Sep 2023 17:08:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235903AbjIOPIi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Sep 2023 11:08:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236029AbjIOPIh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Sep 2023 11:08:37 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57F892D70;
        Fri, 15 Sep 2023 08:05:55 -0700 (PDT)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38FERSEJ025272;
        Fri, 15 Sep 2023 15:05:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=D4r4CgwN2wvxgiJSuob/BiBF+77aMbyKkuMKPJ/OeW0=;
 b=nPPhd0wjEEfhEylyZiKtb3f73/oZT0ThX54pR3wDVb5UDiuqdzJ4Yng5Bc0aRUA8oN7z
 ts69GE76GT6rpHk5BjDtPvnCiqhRZn+FWFM1JYN0wbL5xPPjOnI8wH83X/0wM2wUh9kG
 9uMKgOfzmW07P6BhNd/1jdm6f1tvDKSS0BtXYAAm0jDhHzPbSdJ2SqqsV5MiW9Hj4RXw
 DJv2lXdBbzOpJ9tlvOXj2LIMbnlEmGcgam9LSn0K5ZIZ8DPJ0SzhhoAazSsgcBkiWB4B
 nAfnEGBZzHapZgD3hr8Ee4Z4nD2HSN/tDTbLxFHX7AjcHEK1PM2hubzNGNdEabOIBHIm KQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t4g2ssckp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 15 Sep 2023 15:05:46 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38FF5jNF000715
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 15 Sep 2023 15:05:45 GMT
Received: from [10.216.52.149] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Fri, 15 Sep
 2023 08:05:40 -0700
Message-ID: <34fd47ad-bcd1-706f-0ed0-11f0c84bf3c0@quicinc.com>
Date:   Fri, 15 Sep 2023 20:35:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v1] arm64: dts: qcom: msm8916: Fix iommu local address
 range
Content-Language: en-US
To:     Stephan Gerhold <stephan@gerhold.net>
CC:     <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <kernel@quicinc.com>
References: <20230915143304.477-1-quic_gkohli@quicinc.com>
 <ZQRuzzC7i1kyNqAm@gerhold.net>
From:   Gaurav Kohli <quic_gkohli@quicinc.com>
In-Reply-To: <ZQRuzzC7i1kyNqAm@gerhold.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: UeO3TFAUOsSH_AxF-drV9dgTR92cMMUj
X-Proofpoint-ORIG-GUID: UeO3TFAUOsSH_AxF-drV9dgTR92cMMUj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-15_11,2023-09-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 mlxlogscore=723 clxscore=1011 adultscore=0 mlxscore=0 spamscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309150134
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 9/15/2023 8:18 PM, Stephan Gerhold wrote:
> On Fri, Sep 15, 2023 at 08:03:04PM +0530, Gaurav Kohli wrote:
>> Fix the apps iommu local address space range as per data sheet.
>>
>> Fixes: 6a6729f38436 ("arm64: dts: qcom: msm8916: Add IOMMU support")
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Signed-off-by: Gaurav Kohli <quic_gkohli@quicinc.com>
>> ---
>> Changes since v0:
>> -Update Fixes tag.
>>
>> diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
>> index 33fb65d73104..3c934363368c 100644
>> --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
>> @@ -1813,7 +1813,7 @@
>>   			#size-cells = <1>;
>>   			#iommu-cells = <1>;
>>   			compatible = "qcom,msm8916-iommu", "qcom,msm-iommu-v1";
>> -			ranges = <0 0x01e20000 0x40000>;
>> +			ranges = <0 0x01e20000 0x20000>;
> 
> Please also submit another patch to fix this in msm8939.dtsi. It has the
> same mistake.

thanks a lot for review, yes i will send it for other soc also.
> 
> Thanks,
> Stephan
