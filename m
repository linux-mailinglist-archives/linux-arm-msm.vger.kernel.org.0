Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D26EB63F629
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Dec 2022 18:34:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229949AbiLAReX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Dec 2022 12:34:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbiLAReX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Dec 2022 12:34:23 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CFF855CA3;
        Thu,  1 Dec 2022 09:34:22 -0800 (PST)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B1GX4D3009300;
        Thu, 1 Dec 2022 17:34:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=iuHOvWgtHyvwfPv9WRA6b3CI/nyr5mvXWVxMXGju2rA=;
 b=pp3LaGrwQcJh4m/if7TmsmB88CFfG29JMtIV8fqmgGNQs+7CFfEHL1m+HN10Kklofntt
 3LWa5dk3JS2DzejwnoK/kSShzLwauawGkwU6PfSuCF6RqMUZDEhPQ/0DvrWVyXWp26XX
 Y6c/zA4vbQcteIhhes5JiIwckXz5NTkML2ST0fYx8KjV+6oa+Xmb+W1DTDBRbOTkGhzy
 aqnAtoiKuMU7MxdZWkIoAO5Z8ZgFGRErHBgH0SqAhDjYAbRHaVHzf84Wf5b7Lq4LzOzv
 F5FrUY2eh+TKTxx8HDCSTszG91WQK+8YB0mJ+FzQkOTfn3pV8y3gVdyuydi0GktyIq65 eA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3m6k3yje9t-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 01 Dec 2022 17:34:15 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2B1HYEcu032316
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 1 Dec 2022 17:34:14 GMT
Received: from [10.110.18.228] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 1 Dec 2022
 09:34:12 -0800
Message-ID: <edf6735c-9903-a3c1-fb6f-22a76b11604e@quicinc.com>
Date:   Thu, 1 Dec 2022 09:34:12 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v6 1/4] arm64: dts: qcom: add data-lanes and
 link-freuencies into dp_out endpoint
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
        <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
        <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@linux.ie>,
        <agross@kernel.org>, <bjorn.andersson@linaro.org>
CC:     <quic_abhinavk@quicinc.com>, <quic_sbillaka@quicinc.com>,
        <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <1669852310-22360-1-git-send-email-quic_khsieh@quicinc.com>
 <1669852310-22360-2-git-send-email-quic_khsieh@quicinc.com>
 <7bf73466-e476-4a1d-5dc0-1b63ea742226@linaro.org>
From:   Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <7bf73466-e476-4a1d-5dc0-1b63ea742226@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: lAxwE01VcYiRPVg4z2O6JFUy3MIaMgDq
X-Proofpoint-ORIG-GUID: lAxwE01VcYiRPVg4z2O6JFUy3MIaMgDq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-01_12,2022-12-01_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 spamscore=0 mlxscore=0
 lowpriorityscore=0 impostorscore=0 mlxlogscore=999 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212010131
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 11/30/2022 4:07 PM, Dmitry Baryshkov wrote:
> On 01/12/2022 01:51, Kuogee Hsieh wrote:
>> Move data-lanes property from mdss_dp node to dp_out endpoint. Also
>> add link-frequencies property into dp_out endpoint as well. The last
>> frequency specified at link-frequencies will be the max link rate
>> supported by DP.
>>
>> Changes in v5:
>> -- revert changes at sc7180.dtsi and sc7280.dtsi
>> -- add &dp_out to sc7180-trogdor.dtsi and sc7280-herobrine.dtsi
>>
>> Changes in v6:
>> -- add data-lanes and link-frequencies to yaml
>>
>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>> ---
>>   .../devicetree/bindings/display/msm/dp-controller.yaml  | 17 
>> +++++++++++++++++
>
> Separate patch. Also you didn't check the get_maintainers output, so 
> required parties were not included into the distribution.
>
> Also as you'd check the get_maintainers output, please fix other email 
> addresses too.
>
>> arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi            |  6 +++++-
>>   arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi          |  6 +++++-
>>   3 files changed, 27 insertions(+), 2 deletions(-)
>>
>> diff --git 
>> a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml 
>> b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> index 94bc6e1..af70343 100644
>> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> @@ -90,6 +90,20 @@ properties:
>>           $ref: /schemas/graph.yaml#/properties/port
>>           description: Output endpoint of the controller
>>   +        properties:
>> +          endpoint:
>> +            $ref: /schemas/media/video-interfaces.yaml#
>> +
>> +          properties:
>> +            link-frequencies: true
>> +            data-lanes: true
>
> No. Use $ref for both of them.
>
>> +
>> +          required:
>> +            - link-frequencies
>> +            - data-lanes
>
> No, they are not required.
>
>> +
>> +          additionalProperties: false
>> +
>
> deprecation of old data-lanes property?
there is no old data-lanes property.
>
>>   required:
>>     - compatible
>>     - reg
>> @@ -158,6 +172,9 @@ examples:
>>                   reg = <1>;
>>                   endpoint {
>>                       remote-endpoint = <&typec>;
>> +                    data-lanes = <1 2>;
>> +                    link-frequencies = /bits/ 64 <160000000 270000000
>> +                                                  540000000 810000000>;
>
> I guess the number of zeroes is wrong here. This is 160 MHz ... 810 
> Mhz, rather than 1.6 GHz ... 8.1 GHz
>
>>                   };
>>               };
>>           };
>> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi 
>> b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
>> index 754d2d6..39f0844 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
>> @@ -812,7 +812,11 @@ hp_i2c: &i2c9 {
>>       status = "okay";
>>       pinctrl-names = "default";
>>       pinctrl-0 = <&dp_hot_plug_det>;
>> -    data-lanes = <0 1>;
>> +};
>> +
>> +&dp_out {
>> +    data-lanes = <0  1>;
>> +    link-frequencies = /bits/ 64 <160000000 270000000 540000000>;
>
> Same comment here.
>
>>   };
>>     &pm6150_adc {
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi 
>> b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
>> index 93e39fc..b7c343d 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
>> @@ -440,7 +440,11 @@ ap_i2c_tpm: &i2c14 {
>>       status = "okay";
>>       pinctrl-names = "default";
>>       pinctrl-0 = <&dp_hot_plug_det>;
>> -    data-lanes = <0 1>;
>> +};
>> +
>> +&dp_out {
>> +    data-lanes = <0  1>;
>> +    link-frequencies = /bits/ 64 <160000000 270000000 540000000 
>> 810000000>;
>
> And here.
>
>>   };
>>     &mdss_mdp {
>
