Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E70DE6FB25F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 May 2023 16:13:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234484AbjEHON4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 May 2023 10:13:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234486AbjEHONx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 May 2023 10:13:53 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D59BC127;
        Mon,  8 May 2023 07:13:52 -0700 (PDT)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 348DgFpq018553;
        Mon, 8 May 2023 14:13:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=HmqzMaclK+YwRin8VEiR1e18Gq03M08OyIXeJNUEGOk=;
 b=UpPLbdO3hj7MnyLIhaHjUzr/7bw3h1ozHLj2iwBwF79g765QSJxm99rz5ugXe3gcQCDH
 TcVruEZ15gTJX2iVe/WZEjNCThHFnn5v33gyVOnaVUWYjZXBAyWYWDjOT8WzFj2nlQL6
 G844X2m5yAEIklZfdKNbw3C0wwsFTwweAGylRQu6s1jPOHYHQzP5f3Vnz1D8thnzmXDG
 dOzH7mszNaVj0EbMIyr0uOB1Z9ogEfa8O7bqA8nMn7nxGTlfmYJ7Ty1QUhX3PnPoQV/H
 4LF5bXIyGMxTq06gPf0MPLxwjcrefIVRSCgSIEEbNVBP3Gm8VlVRr8qJII1NsMDLkOiD XA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qddwhksju-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 08 May 2023 14:13:47 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 348EDjq2030456
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 8 May 2023 14:13:45 GMT
Received: from [10.242.242.190] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Mon, 8 May 2023
 07:13:37 -0700
Message-ID: <556d9ea2-d4a0-88fc-e803-308310bc35e8@quicinc.com>
Date:   Mon, 8 May 2023 19:43:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 02/11] dt-bindings: mailbox: qcom: Add IPQ5018 APCS
 compatible
Content-Language: en-US
To:     Kathiravan T <quic_kathirav@quicinc.com>, <agross@kernel.org>,
        <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <jassisinghbrar@gmail.com>, <mathieu.poirier@linaro.org>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <quic_gurus@quicinc.com>, <loic.poulain@linaro.org>,
        <quic_eberman@quicinc.com>, <robimarko@gmail.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-clk@vger.kernel.org>
CC:     <quic_srichara@quicinc.com>, <quic_gokulsri@quicinc.com>,
        <quic_sjaganat@quicinc.com>, <quic_arajkuma@quicinc.com>,
        <quic_anusha@quicinc.com>, <quic_poovendh@quicinc.com>
References: <1678164097-13247-1-git-send-email-quic_mmanikan@quicinc.com>
 <1678164097-13247-3-git-send-email-quic_mmanikan@quicinc.com>
 <f34a5b42-67ec-0192-4bc6-549a3575675c@quicinc.com>
From:   Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
In-Reply-To: <f34a5b42-67ec-0192-4bc6-549a3575675c@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 5rzsMPCSWriAUkgbbjHmYIMlu7tYJ1Bg
X-Proofpoint-ORIG-GUID: 5rzsMPCSWriAUkgbbjHmYIMlu7tYJ1Bg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-08_10,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 adultscore=0 impostorscore=0 mlxscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2305080096
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 3/7/2023 11:35 AM, Kathiravan T wrote:
> 
> On 3/7/2023 10:11 AM, Manikanta Mylavarapu wrote:
>> Add compatible for the Qualcomm IPQ5018 APCS block.
>>
>> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
>> ---
>>   .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml      | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git 
>> a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml 
>> b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
>> index 9a46dbc6d03f..91f4e0454fe3 100644
>> --- 
>> a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
>> +++ 
>> b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
>> @@ -23,6 +23,7 @@ properties:
>>             - const: qcom,ipq6018-apcs-apps-global
>>         - items:
>>             - enum:
>> +              - qcom,ipq5018-apcs-apps-global
> 
>   No, we can use the fallback mechanism as done for IPQ5332. Please 
> refer 
> https://lore.kernel.org/linux-arm-msm/20230217083308.12017-5-quic_kathirav@quicinc.com/
> 
> 
> Thanks,
> 
> Kathiravan T.
> 
Sure. I will also use same fallback mechanism for IPQ5018.

Thanks & Regards,
Manikanta.
