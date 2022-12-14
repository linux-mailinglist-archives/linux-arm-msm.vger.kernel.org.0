Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9922364C87E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Dec 2022 12:57:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238164AbiLNL5H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Dec 2022 06:57:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238211AbiLNL5G (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Dec 2022 06:57:06 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3263E1B1F0;
        Wed, 14 Dec 2022 03:57:05 -0800 (PST)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BEB8MUc000759;
        Wed, 14 Dec 2022 11:56:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=tIt01r0fvuWcGxNn9G/5zs9Xj9k3pxJ8zBKe+Hsn62I=;
 b=JQC1VpSmptPqxpeYnPQ+oLqARNYAnslmUlggBWNan9oz+X959dEU1ZQBLiHTcJGlahBh
 3G0y4tDdD6RiWhqczqZt/yngm5HhZsO13h9cuGuJjRleCl+kqvvYGdwhmaFK0Uc1YeOi
 8VGGJUCKighJ18hiIQOMqA8N3+hfxFKTtDC5OtY3Ako9y54mSPRXMaX8ripTbp3bbV1i
 4WRbLl+Z/eT1O3nMM1k5OT2Ku3MfrQiG3ptKMiAso/skQBgmXCTJfq0RX+C+ar9wQnoR
 LA3WuXsQ2YwDBiey61W9cvju8IxEfIX9fE5QW3nuhQm0VYshLPuHU5DxYYLUOCJosvHw pw== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mf6rvryxx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 14 Dec 2022 11:56:46 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BEBuiDE031808
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 14 Dec 2022 11:56:44 GMT
Received: from [10.79.43.91] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 14 Dec
 2022 03:56:40 -0800
Message-ID: <84f04d12-087c-99f1-f30a-9e35f65e9ec1@quicinc.com>
Date:   Wed, 14 Dec 2022 17:26:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 2/4] dt-bindings: remoteproc: qcom: sc7180: Update
 memory-region requirements
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        <andersson@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <robh+dt@kernel.org>, <manivannan.sadhasivam@linaro.org>
CC:     <agross@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <konrad.dybcio@somainline.org>, <amit.pundir@linaro.org>,
        <regressions@leemhuis.info>, <sumit.semwal@linaro.org>,
        <will@kernel.org>, <catalin.marinas@arm.com>,
        <robin.murphy@arm.com>
References: <20221213140724.8612-1-quic_sibis@quicinc.com>
 <20221213140724.8612-3-quic_sibis@quicinc.com>
 <612c1019-11c0-38b6-e1d5-1a52f1456989@linaro.org>
 <ea4e9a35-5468-820a-9e28-9cdf129b77e5@quicinc.com>
 <963cb30a-187a-57d1-65eb-34f9f8ed6315@linaro.org>
From:   Sibi Sankar <quic_sibis@quicinc.com>
In-Reply-To: <963cb30a-187a-57d1-65eb-34f9f8ed6315@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: AaEQgGBLNH-1FSGKs-TsP2vUGFSM67Bg
X-Proofpoint-ORIG-GUID: AaEQgGBLNH-1FSGKs-TsP2vUGFSM67Bg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-14_04,2022-12-14_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 bulkscore=0 mlxscore=0
 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212140093
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 12/14/22 17:00, Krzysztof Kozlowski wrote:
> On 14/12/2022 11:25, Sibi Sankar wrote:
>>
>>
>> On 12/14/22 01:11, Krzysztof Kozlowski wrote:
>>> On 13/12/2022 15:07, Sibi Sankar wrote:
>>>> Update the bindings to reflect the addition of the new modem metadata
>>>> carveout reference to the memory-region property.
>>>>
>>>> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
>>>> ---
>>>>    .../devicetree/bindings/remoteproc/qcom,sc7180-mss-pil.yaml    | 3 ++-
>>>>    .../devicetree/bindings/remoteproc/qcom,sc7280-mss-pil.yaml    | 3 ++-
>>>>    2 files changed, 4 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-mss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-mss-pil.yaml
>>>> index e4a7da8020f4..b1402bef0ebe 100644
>>>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-mss-pil.yaml
>>>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-mss-pil.yaml
>>>> @@ -95,6 +95,7 @@ properties:
>>>>        items:
>>>>          - description: MBA reserved region
>>>>          - description: modem reserved region
>>>> +      - description: metadata reserved region
>>>
>>> Which makes the third item now required, also for all out of tree DTS
>>> and other users of the bindings. Please write a bit more in commit msg
>>> why this is necessary (e.g. was it broken before?). I assume the driver
>>> does not break the ABI?
>>
>> I'll pad the commit msg with some of the additional info from patch 4.
>> commit c44094eee32f "arm64: dma: Drop cache invalidation from
>> arch_dma_prep_coherent()" exposed a bug in the driver affecting SoCs
>> from msm8996 on wards. The application processor accessing the
>> dynamically allocated region after giving control to the modem results
>> in a XPU violation. The recommended fix was to use a no-map carveout
>> instead and memunmap before giving control to the modem. The future
>> kernels that are paired with an older dtbs would crash during modem
> 
> Then it's an ABI break.
> 
>> bootup since we would continue to use dma_alloc_attr. But all the other
>> combinations (old kernel/new dtb) will continue to work.
> 
> Does it mean that old kernel with old DTB was working? If yes, then it's
> ABI break without clear benefits.

commit c44094eee32f is going to land regardless soon and will break
modem on mainline and any other branches that picks up the patch.
The suggested way to fix it (no-map carveout) requires this bindings
change.

> 
> Best regards,
> Krzysztof
> 
