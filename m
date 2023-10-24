Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 002897D4E61
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Oct 2023 12:57:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233435AbjJXK51 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Oct 2023 06:57:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234431AbjJXK50 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Oct 2023 06:57:26 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8359D7E;
        Tue, 24 Oct 2023 03:57:23 -0700 (PDT)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39O8L5h8010988;
        Tue, 24 Oct 2023 10:57:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=pwHPbWVenOA4Gkx0pRNbSvnx9bMxQbdSR9AdgfBq/MY=;
 b=ADNtEXnh2tW3EFyQIX3Pl77/y4B2stkM/xvl5Q9PV6ZS5GtQ4xihidXtstuGqeutrT8U
 pzLfgQa5offZ/AVKJYxyXCbFGRq+x0uGw1wtgh59I3IhGLujdFLljmia2AHre0oS8afw
 +5sVxNS5VrIPjIfjfZmIbK1VfMf8tL7IFcyd/HpWYSJKF15xyMS3lWTI7WuFObneMkRi
 6VZ7elQbIAuEV2cRXBgGm3+k8+xcnFp97mgSXXdwEPx33gqBxzkPdJliqXxyR6OlntMH
 EYYxd7gLocTv3h877AUt3I8RJ60k4qiFnvGWvQsPreP+9MbRD6vQE1IUV5lasKyqw2oK 0Q== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3twxn41gej-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 24 Oct 2023 10:57:12 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39OAvBaW009547
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 24 Oct 2023 10:57:11 GMT
Received: from [10.239.132.245] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Tue, 24 Oct
 2023 03:57:06 -0700
Message-ID: <7a703504-edf1-d85c-0949-9cfcf3251b0b@quicinc.com>
Date:   Tue, 24 Oct 2023 18:57:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v1 1/5] dt-bindings: soc: qcom: Add memory_dump driver
 bindings
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>
CC:     <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        <quic_tingweiz@quicinc.com>
References: <1698052857-6918-1-git-send-email-quic_zhenhuah@quicinc.com>
 <1698052857-6918-2-git-send-email-quic_zhenhuah@quicinc.com>
 <27fcdcc1-b29b-43b2-8b1a-c648dd9e696c@linaro.org>
 <d3b62002-c29c-a45e-279f-7d07c697aa77@quicinc.com>
 <38aa02c4-5b8d-4978-96a2-241fe5f94b50@linaro.org>
From:   Zhenhua Huang <quic_zhenhuah@quicinc.com>
In-Reply-To: <38aa02c4-5b8d-4978-96a2-241fe5f94b50@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 4axXBYttmFH_Hg-2I1G8MiMqV40Ts9ew
X-Proofpoint-ORIG-GUID: 4axXBYttmFH_Hg-2I1G8MiMqV40Ts9ew
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-24_10,2023-10-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 clxscore=1015 spamscore=0 mlxlogscore=769 lowpriorityscore=0 phishscore=0
 mlxscore=0 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2310170001
 definitions=main-2310240092
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 2023/10/23 20:52, Krzysztof Kozlowski wrote:
> On 23/10/2023 13:54, Zhenhua Huang wrote:
>>
>>
>> On 2023/10/23 17:27, Krzysztof Kozlowski wrote:
>>> On 23/10/2023 11:20, Zhenhua Huang wrote:
>>>> Add bindings for the QCOM Memory Dump driver providing debug
>>>
>>> Bindings are for hardware, not driver. This suggests it is not suitable
>>> for bindings at all.
>>>
>>>> facilities. Firmware dumps system cache, internal memory,
>>>> peripheral registers to reserved DDR as per the table which
>>>> populated by the driver, after crash and warm reset.
>>>
>>> Again driver :/
>>
>> Thanks for pointing out. Qualcomm memory dump device is a reserved
>> memory region which is used to communicate with firmware. I will update
>> description in next version.
> 
> I have still doubts that it is suitable for DT. I usually expect  such
> firmware feature-drivers to be instantiated by existing firmware
> drivers. You do not need DT for this.

Got it, as it interacts with firmware, you think it should be a firmware 
driver? But it seems there should not be existing suitable place to put 
it now(qcom_scm.c is for TZ). Shall we create one new file like 
*qcom_sdi.c* in drivers/firmware and put it there? Because SDI(system 
debug image, which is part of bootloader) is the firmware doing the things.

> 
> Best regards,
> Krzysztof
> 
