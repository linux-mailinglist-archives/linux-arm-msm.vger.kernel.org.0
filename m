Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68ADA7653EB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jul 2023 14:30:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234270AbjG0M37 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Jul 2023 08:29:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234130AbjG0M3Y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Jul 2023 08:29:24 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED6F34227;
        Thu, 27 Jul 2023 05:28:56 -0700 (PDT)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36R4wAAI011331;
        Thu, 27 Jul 2023 12:28:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=518AEr+RpH/QgOW0sw3CsFqi6PWfLy0u7e/q1wlWDP8=;
 b=eIUITqebH7HiiKRYT/KM2Fdv2vjJqe10ilezf416HGQkaCYDXbbQY4Wft1WLGjwrMIA6
 AI0AdjIPuqhPRnF5D7YdA3AdYWlDmBE4VvO0h83LMiac+zEwQQY6K6CuXHYNnx/wwCWG
 DS1pu0ih5uqMUp+PTUq3s5U2yjv3CSqzxvNeR4ashmRQ4jyMhMWaIWWr1lxJKjvbIdKM
 ttyJhcbCIzXvz5K1HiGulfpnreBHJmkLOO3uo4Z0L58VGxHd/giOX1JSlnYwbp/hre6K
 E91WKmb9qJMHcPdBdQ8U3f7kHbxGMSe78nx9+AjMmuX6I2FsIb1pyoTBs21Pc4MfYxiu Hw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s32jn2t14-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 27 Jul 2023 12:28:40 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36RCSdfD019337
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 27 Jul 2023 12:28:39 GMT
Received: from [10.216.40.41] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Thu, 27 Jul
 2023 05:28:13 -0700
Message-ID: <71fae572-6b97-7322-aed3-0066a8ea1fa4@quicinc.com>
Date:   Thu, 27 Jul 2023 17:58:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2] dt-bindings: qcom: Update RPMHPD entries for some SoCs
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
CC:     <mathieu.poirier@linaro.org>, <mchehab@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <quic_vgarodia@quicinc.com>,
        <konrad.dybcio@linaro.org>, <agross@kernel.org>,
        <freedreno@lists.freedesktop.org>, <daniel@ffwll.ch>,
        <dri-devel@lists.freedesktop.org>, <jonathan@marek.ca>,
        <conor+dt@kernel.org>, <robh+dt@kernel.org>, <airlied@gmail.com>,
        <linux-mmc@vger.kernel.org>, <quic_tdas@quicinc.com>,
        <stanimir.k.varbanov@gmail.com>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <andersson@kernel.org>,
        <mturquette@baylibre.com>, <linux-remoteproc@vger.kernel.org>,
        <sean@poorly.run>, <ulf.hansson@linaro.org>,
        <devicetree@vger.kernel.org>, <vladimir.zapolskiy@linaro.org>,
        <rfoss@kernel.org>, <mani@kernel.org>,
        <linux-media@vger.kernel.org>, <sboyd@kernel.org>,
        <quic_abhinavk@quicinc.com>, <bhupesh.sharma@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <marijn.suijten@somainline.org>,
        <neil.armstrong@linaro.org>, <robdclark@gmail.com>
References: <1690448953-23425-1-git-send-email-quic_rohiagar@quicinc.com>
 <169045659774.1058731.6391693092002547810.robh@kernel.org>
 <fa84ec4f-bdb9-dace-c56a-46174a9b47ee@quicinc.com>
 <2edb92b8-a6a8-c115-757c-daccef6be5f0@linaro.org>
 <432ab1d3-0f9e-4072-ff4d-6362886584b8@quicinc.com>
 <c246ab77-0dcd-e6a1-bbec-0924c0923a75@linaro.org>
From:   Rohit Agarwal <quic_rohiagar@quicinc.com>
In-Reply-To: <c246ab77-0dcd-e6a1-bbec-0924c0923a75@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: fpA_mVhoYvXXSwJwWhJTSWkU0fCj4FvE
X-Proofpoint-ORIG-GUID: fpA_mVhoYvXXSwJwWhJTSWkU0fCj4FvE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-27_06,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 suspectscore=0 mlxscore=0 phishscore=0 bulkscore=0
 mlxlogscore=999 lowpriorityscore=0 impostorscore=0 adultscore=0
 malwarescore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307270111
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 7/27/2023 5:54 PM, Dmitry Baryshkov wrote:
> On 27/07/2023 15:21, Rohit Agarwal wrote:
>>
>> On 7/27/2023 5:15 PM, Krzysztof Kozlowski wrote:
>>> On 27/07/2023 13:19, Rohit Agarwal wrote:
>>>> On 7/27/2023 4:46 PM, Rob Herring wrote:
>>>>> On Thu, 27 Jul 2023 14:39:13 +0530, Rohit Agarwal wrote:
>>>>>> Update the RPMHPD references with new bindings defined in rpmhpd.h
>>>>>> for Qualcomm SoCs SM8[2345]50.
>>>>>>
>>>>>> Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>
>>>>>> ---
>>>>>> Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml | 
>>>>>> 4 ++--
>>>>>> Documentation/devicetree/bindings/clock/qcom,sm8350-videocc.yaml 
>>>>>> | 4 ++--
>>>>>> Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml | 
>>>>>> 4 ++--
>>>>>> Documentation/devicetree/bindings/clock/qcom,sm8450-dispcc.yaml | 
>>>>>> 4 ++--
>>>>>> Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml 
>>>>>> | 4 ++--
>>>>>> Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml | 
>>>>>> 4 ++--
>>>>>> Documentation/devicetree/bindings/clock/qcom,videocc.yaml | 4 ++--
>>>>>> .../devicetree/bindings/display/msm/qcom,sm8250-dpu.yaml | 4 ++--
>>>>>> .../devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml | 8 
>>>>>> ++++----
>>>>>> .../devicetree/bindings/display/msm/qcom,sm8350-dpu.yaml | 4 ++--
>>>>>> .../devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml | 6 +++---
>>>>>> .../devicetree/bindings/display/msm/qcom,sm8450-dpu.yaml | 4 ++--
>>>>>> .../devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml | 8 
>>>>>> ++++----
>>>>>> .../devicetree/bindings/display/msm/qcom,sm8550-dpu.yaml | 4 ++--
>>>>>> .../devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml | 8 
>>>>>> ++++----
>>>>>> Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml | 
>>>>>> 4 ++--
>>>>>> Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 4 ++--
>>>>>> Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml 
>>>>>> | 6 +++---
>>>>>>    18 files changed, 44 insertions(+), 44 deletions(-)
>>>>>>
>>>>> My bot found errors running 'make DT_CHECKER_FLAGS=-m 
>>>>> dt_binding_check'
>>>>> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>>>>>
>>>>> yamllint warnings/errors:
>>>>>
>>>>> dtschema/dtc warnings/errors:
>>>>> Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.example.dts:21:18: 
>>>>> fatal error: dt-bindings/power/qcom,rpmhpd.h: No such file or 
>>>>> directory
>>>>>      21 |         #include <dt-bindings/power/qcom,rpmhpd.h>
>>>>>         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>>> compilation terminated.
>>>>> make[2]: *** [scripts/Makefile.lib:419: 
>>>>> Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.example.dtb] 
>>>>> Error 1
>>>>> make[2]: *** Waiting for unfinished jobs....
>>>>> make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1500: 
>>>>> dt_binding_check] Error 2
>>>>> make: *** [Makefile:234: __sub-make] Error 2
>>>>>
>>>>> doc reference errors (make refcheckdocs):
>>>>>
>>>>> See 
>>>>> https://patchwork.ozlabs.org/project/devicetree-bindings/patch/1690448953-23425-1-git-send-email-quic_rohiagar@quicinc.com
>>>>>
>>>>> The base for the series is generally the latest rc1. A different 
>>>>> dependency
>>>>> should be noted in *this* patch.
>>>>>
>>>>> If you already ran 'make dt_binding_check' and didn't see the above
>>>>> error(s), then make sure 'yamllint' is installed and dt-schema is 
>>>>> up to
>>>>> date:
>>>>>
>>>>> pip3 install dtschema --upgrade
>>>>>
>>>>> Please check and re-submit after running the above command 
>>>>> yourself. Note
>>>>> that DT_SCHEMA_FILES can be set to your schema file to speed up 
>>>>> checking
>>>>> your schema. However, it must be unset to test all examples with 
>>>>> your schema.
>>>> This should be ignored as the patch that creates the new header is
>>>> already applied.
>>>> Please follow this series
>>>>
>>>> https://lore.kernel.org/all/1689744162-9421-1-git-send-email-quic_rohiagar@quicinc.com/ 
>>>>
>>> Please mention the dependency in patch changelog ---, so it is obvious
>>> for people applying it and also for the bot.
>> Sure. Will send a cover letter for this patch mentioning the 
>> changelogs and will
>> keep the version as v2 since there no change at all in the patch.
>
> What would be the merge strategy? Even if you split it per subsystem, 
> I probably can not pick up display parts. Is there an immutable branch 
> with the new header? Otherwise I can either ack Bjorn picking up this 
> patch or it will have to wait for the next cycle.
The reason why I sent it as a single patch is that maintainers cannot 
pick it up separately. So since Bjorn already have the new header change 
included in the tree, it would be better if he picks it up.

Thanks,
Rohit.
>
>>
>> Thanks,
>> Rohit.
>>> Best regards,
>>> Krzysztof
>>>
>
